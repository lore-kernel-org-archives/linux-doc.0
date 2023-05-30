Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16DBC7EE23
	for <linux-doc@archiver.kernel.org>; Tue, 30 May 2023 14:05:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbjE3OF6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 May 2023 10:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232897AbjE3OFz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 May 2023 10:05:55 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC59D9
        for <linux-doc@vger.kernel.org>; Tue, 30 May 2023 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
        In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=d/FJ8eAsQuybHTDjCAtIMygFgqbgutZK8wvxGecc0vQ=; b=vXKqqJoAV6hypA+7bUWY/j34MR
        tq8rAU0EAjd502zkD/WmKjArkbsPbRC5dg694MFyguKR1P8VpTCTFs7XDsGvXN+ANfDCXjD1aqCAf
        +K8VKyTcoV8AcF6WAxG6x4eoFetIIa4kGzlJwYzFx/YSMYu86pd6pnVOFRJbUZPDQxTCueUv1TUK5
        Rfkply6JpjF22IsYVt8PCXNXNJWLkPSId9Gq5VUfHZiiyUo/Gdw4YdstfpJNuLGRxWPtRWSgRfS13
        ugMvTQsaz/9T48pDCrCXSxuz5FZXkqCvMXqtu0CXxVchuQJ1QDcMrDjkKFOkJYKKojsmHRaMT5DvK
        BrCAOpjA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48884 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1q3zyy-0002sz-GJ; Tue, 30 May 2023 15:05:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
        id 1q3zyx-00A5M2-TK; Tue, 30 May 2023 15:05:51 +0100
In-Reply-To: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
From:   "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: [PATCH RFC 16/17] arm64: text replication: early kernel option to
 enable replication
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1q3zyx-00A5M2-TK@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date:   Tue, 30 May 2023 15:05:51 +0100
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide an early kernel option "ktext=" which allows the kernel text
replication to be enabled. This takes a boolean argument.

The way this has been implemented means that we take all the same paths
through the kernel at runtime whether kernel text replication has been
enabled or not; this allows the performance effects of the code changes
to be evaluated separately from the act of running with replicating the
kernel text.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../admin-guide/kernel-parameters.txt          |  5 +++++
 arch/arm64/mm/ktext.c                          | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9e5bab29685f..684bd004816e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2488,6 +2488,11 @@
 			0: force disabled
 			1: force enabled
 
+	ktext=		[ARM64] Control kernel text replication on NUMA
+			machines. Default: disabled.
+			0: disable kernel text replication
+			1: enable kernel text replication
+
 	kunit.enable=	[KUNIT] Enable executing KUnit tests. Requires
 			CONFIG_KUNIT to be set to be fully enabled. The
 			default value can be overridden via
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index f64a649f06a4..ec2d474bbd2c 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -98,6 +98,21 @@ void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
 	}
 }
 
+static bool ktext_enabled;
+
+static int __init parse_ktext(char *str)
+{
+	bool enabled;
+	int ret = strtobool(str, &enabled);
+
+	if (ret)
+		return ret;
+
+	ktext_enabled = enabled;
+	return 0;
+}
+early_param("ktext", parse_ktext);
+
 /* Allocate page tables and memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
@@ -119,6 +134,9 @@ void __init ktext_replication_init(void)
 		return;
 	}
 
+	if (!ktext_enabled)
+		return;
+
 	for_each_node(nid) {
 		/* Nothing to do for node 0 */
 		if (!nid)
-- 
2.30.2

