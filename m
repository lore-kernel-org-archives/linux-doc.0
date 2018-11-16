Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F6B67D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Nov 2018 22:24:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbeKQIiu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 17 Nov 2018 03:38:50 -0500
Received: from mga18.intel.com ([134.134.136.126]:20405 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbeKQIiu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 17 Nov 2018 03:38:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Nov 2018 14:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,241,1539673200"; 
   d="scan'208";a="96936487"
Received: from spandruv-desk.jf.intel.com ([10.54.75.31])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Nov 2018 14:24:36 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     lenb@kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, yu.c.chen@intel.com,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 1/2] cpufreq: intel_pstate: Force HWP min perf before offline
Date:   Fri, 16 Nov 2018 14:24:19 -0800
Message-Id: <20181116222420.24260-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Force HWP Request MAX = HWP Request MIN = HWP Capability MIN and EPP to
0xFF. In this way the performance limits on the offlined CPU will not
influence performance limits on its sibling CPU, which is still online.

If the sibling CPU is calling for higher performance, it will impact the
max core performance. Here core performance will follow higher of the
performance requests from each sibling.

Reported-and-tested-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/cpufreq/intel_pstate.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 14f551a3d36e..501ab9f4489a 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -830,6 +830,28 @@ static void intel_pstate_hwp_set(unsigned int cpu)
 	wrmsrl_on_cpu(cpu, MSR_HWP_REQUEST, value);
 }
 
+static void intel_pstate_hwp_force_min_perf(int cpu)
+{
+	u64 value;
+	int min_perf;
+
+	value = all_cpu_data[cpu]->hwp_req_cached;
+	value &= ~GENMASK_ULL(31, 0);
+	min_perf = HWP_LOWEST_PERF(all_cpu_data[cpu]->hwp_cap_cached);
+
+	/* Set hwp_max = hwp_min */
+	value |= HWP_MAX_PERF(min_perf);
+	value |= HWP_MIN_PERF(min_perf);
+
+	/* Set EPP/EPB to min */
+	if (static_cpu_has(X86_FEATURE_HWP_EPP))
+		value |= HWP_ENERGY_PERF_PREFERENCE(HWP_EPP_POWERSAVE);
+	else
+		intel_pstate_set_epb(cpu, HWP_EPP_BALANCE_POWERSAVE);
+
+	wrmsrl_on_cpu(cpu, MSR_HWP_REQUEST, value);
+}
+
 static int intel_pstate_hwp_save_state(struct cpufreq_policy *policy)
 {
 	struct cpudata *cpu_data = all_cpu_data[policy->cpu];
@@ -2093,10 +2115,12 @@ static void intel_pstate_stop_cpu(struct cpufreq_policy *policy)
 	pr_debug("CPU %d exiting\n", policy->cpu);
 
 	intel_pstate_clear_update_util_hook(policy->cpu);
-	if (hwp_active)
+	if (hwp_active) {
 		intel_pstate_hwp_save_state(policy);
-	else
+		intel_pstate_hwp_force_min_perf(policy->cpu);
+	} else {
 		intel_cpufreq_stop_cpu(policy);
+	}
 }
 
 static int intel_pstate_cpu_exit(struct cpufreq_policy *policy)
-- 
2.17.1

