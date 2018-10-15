Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 600D07D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 17:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbeJPBXj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 21:23:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:10068 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbeJPBXj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Oct 2018 21:23:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2018 10:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,385,1534834800"; 
   d="scan'208";a="88528379"
Received: from spandruv-desk.jf.intel.com ([10.54.75.31])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2018 10:37:26 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     corbet@lwn.net, rjw@rjwysocki.net, lenb@kernel.org,
        viresh.kumar@linaro.org, robert.moore@intel.com,
        erik.schmauss@intel.com
Cc:     juri.lelli@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, devel@acpica.org,
        pprakash@codeaurora.org, george.cherian@cavium.com,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 2/3] cpufreq: intel_pstate: Add base_frequency attribute
Date:   Mon, 15 Oct 2018 10:37:20 -0700
Message-Id: <20181015173721.66147-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181015173721.66147-1-srinivas.pandruvada@linux.intel.com>
References: <20181015173721.66147-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Present base_frequency to user space via cpufreq sysfs when HWP is in
use.

This HWP base frequency is read from HWP Capabilities MSR, if platform
doesn't have ACPI _CPC object. On most of the HWP platforms the _CPC
object will point to the HWP Capabilities MSR using address space id as
"Functional Fixed Hardware". But the address space id can be simply
ACPI_TYPE_INTEGER, where the platform firmware can modify this value
based on the system constraints.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/cpufreq/intel_pstate.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index b6a1aadaff9f..2a99e2fd9412 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -373,10 +373,28 @@ static void intel_pstate_set_itmt_prio(int cpu)
 		}
 	}
 }
+
+static int intel_pstate_get_cppc_guranteed(int cpu)
+{
+	struct cppc_perf_caps cppc_perf;
+	int ret;
+
+	ret = cppc_get_perf_caps(cpu, &cppc_perf);
+	if (ret)
+		return ret;
+
+	return cppc_perf.guaranteed_perf;
+}
+
 #else
 static void intel_pstate_set_itmt_prio(int cpu)
 {
 }
+
+static int intel_pstate_get_cppc_guranteed(int cpu)
+{
+	return -ENOTSUPP;
+}
 #endif
 
 static void intel_pstate_init_acpi_perf_limits(struct cpufreq_policy *policy)
@@ -699,9 +717,29 @@ static ssize_t show_energy_performance_preference(
 
 cpufreq_freq_attr_rw(energy_performance_preference);
 
+static ssize_t show_base_frequency(struct cpufreq_policy *policy, char *buf)
+{
+	struct cpudata *cpu;
+	u64 cap;
+	int ratio;
+
+	ratio = intel_pstate_get_cppc_guranteed(policy->cpu);
+	if (ratio <= 0) {
+		rdmsrl_on_cpu(policy->cpu, MSR_HWP_CAPABILITIES, &cap);
+		ratio = HWP_GUARANTEED_PERF(cap);
+	}
+
+	cpu = all_cpu_data[policy->cpu];
+
+	return sprintf(buf, "%d\n", ratio * cpu->pstate.scaling);
+}
+
+cpufreq_freq_attr_ro(base_frequency);
+
 static struct freq_attr *hwp_cpufreq_attrs[] = {
 	&energy_performance_preference,
 	&energy_performance_available_preferences,
+	&base_frequency,
 	NULL,
 };
 
-- 
2.17.1

