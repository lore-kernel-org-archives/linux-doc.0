Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4E6FD7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 17:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbeJPBXp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 21:23:45 -0400
Received: from mga03.intel.com ([134.134.136.65]:10068 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbeJPBXj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Oct 2018 21:23:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Oct 2018 10:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,385,1534834800"; 
   d="scan'208";a="88528385"
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
Subject: [PATCH v4 3/3] Documentation: intel_pstate: Add base_frequency information
Date:   Mon, 15 Oct 2018 10:37:21 -0700
Message-Id: <20181015173721.66147-4-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181015173721.66147-1-srinivas.pandruvada@linux.intel.com>
References: <20181015173721.66147-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Updated documentation to explain base_frequency attribute.

Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 Documentation/admin-guide/pm/intel_pstate.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/pm/intel_pstate.rst b/Documentation/admin-guide/pm/intel_pstate.rst
index 8f1d3de449b5..ac6f5c597a56 100644
--- a/Documentation/admin-guide/pm/intel_pstate.rst
+++ b/Documentation/admin-guide/pm/intel_pstate.rst
@@ -465,6 +465,13 @@ Next, the following policy attributes have special meaning if
 	policy for the time interval between the last two invocations of the
 	driver's utilization update callback by the CPU scheduler for that CPU.
 
+One more policy attribute is present if the `HWP feature is enabled in the
+processor <Active Mode With HWP_>`_:
+
+``base_frequency``
+	Shows the base frequency of the CPU. Any frequency above this will be
+	in the turbo frequency range.
+
 The meaning of these attributes in the `passive mode <Passive Mode_>`_ is the
 same as for other scaling drivers.
 
-- 
2.17.1

