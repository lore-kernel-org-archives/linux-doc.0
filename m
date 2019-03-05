Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 89F427D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Mar 2019 08:13:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfCEINh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 03:13:37 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:49242 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726179AbfCEINh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Mar 2019 03:13:37 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A9DEBF4980AA6D152A86;
        Tue,  5 Mar 2019 16:13:34 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.408.0; Tue, 5 Mar 2019 16:13:26 +0800
From:   Hanjun Guo <guohanjun@huawei.com>
To:     <linuxarm@huawei.com>
CC:     John Garry <john.garry@huawei.com>,
        Zhangshaokun <zhangshaokun@hisilicon.com>,
        Daode Huang <huangdaode@hisilicon.com>,
        "Jeremy Linton" <jeremy.linton@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>
Subject: [PATCH hulk-4.19-next 2/2] arm64: Provide a command line to disable spectre_v2 mitigation
Date:   Tue, 5 Mar 2019 16:12:26 +0800
Message-ID: <1551773546-28683-5-git-send-email-guohanjun@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1551773546-28683-1-git-send-email-guohanjun@huawei.com>
References: <1551773546-28683-1-git-send-email-guohanjun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jeremy Linton <jeremy.linton@arm.com>

euler inclusion
category: feature
bugzilla: 11011
DTS: NA
CVE: NA

Patch will be in mainlien kernel 5.2
--------------------------------------------------

There are various reasons, including bencmarking, to disable spectrev2
mitigation on a machine. Provide a command-line to do so.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
[Hanjun: fix conflicts which we don't have PPC PPC_FSL_BOOK3E
 arch spectre-v2 mitigation in 4.19 kernel, so remvoe PPC_FSL_BOOK3E]
Conflicts:
	Documentation/admin-guide/kernel-parameters.txt
Signed-off-by: Hanjun Guo <guohanjun@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++----
 arch/arm64/kernel/cpu_errata.c                  | 13 +++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b43fbaa..bbc34c03 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2828,10 +2828,10 @@
 			check bypass). With this option data leaks are possible
 			in the system.
 
-	nospectre_v2	[X86] Disable all mitigations for the Spectre variant 2
-			(indirect branch prediction) vulnerability. System may
-			allow data leaks with this option, which is equivalent
-			to spectre_v2=off.
+	nospectre_v2	[X86,ARM64] Disable all mitigations for
+			the Spectre variant 2 (indirect branch prediction)
+			vulnerability. System may allow data leaks with this
+			option.
 
 	nospec_store_bypass_disable
 			[HW] Disable all mitigations for the Speculative Store Bypass vulnerability
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 74e9e80..7e5682c 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -210,6 +210,14 @@ static void qcom_link_stack_sanitization(void)
 		     : "=&r" (tmp));
 }
 
+static bool __nospectre_v2;
+static int __init parse_nospectre_v2(char *str)
+{
+	__nospectre_v2 = true;
+	return 0;
+}
+early_param("nospectre_v2", parse_nospectre_v2);
+
 static void
 enable_smccc_arch_workaround_1(const struct arm64_cpu_capabilities *entry)
 {
@@ -221,6 +229,11 @@ static void qcom_link_stack_sanitization(void)
 	if (!entry->matches(entry, SCOPE_LOCAL_CPU))
 		return;
 
+	if (__nospectre_v2) {
+		pr_info_once("spectrev2 mitigation disabled by command line option\n");
+		return;
+	}
+
 	if (psci_ops.smccc_version == SMCCC_VERSION_1_0)
 		return;
 
-- 
1.7.12.4

