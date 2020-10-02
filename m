Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494A5C4363C
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 15:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C481020708
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 15:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IRbhaL9q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387807AbgJBPUS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 11:20:18 -0400
Received: from mail-m971.mail.163.com ([123.126.97.1]:60612 "EHLO
        mail-m971.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBPUS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 11:20:18 -0400
X-Greylist: delayed 936 seconds by postgrey-1.27 at vger.kernel.org; Fri, 02 Oct 2020 11:20:17 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vw4BK
        ZeWGdQzXY4U/kB8MPQGDeBG0VY8mfLs5IuUnEc=; b=IRbhaL9qdd03/iJRVZV5Q
        sc1LgpbRKiUp4csPMr25gqa08PXi0JHD2fzdlwakwMcaZq4Tyx+agHCJWM0q3vQd
        5yqUH4uaXJreTfFNm0jwIqGK2nB5wfqjrf43deTikXkTW6UvNOGCQwRL5Z07G7J/
        O4G+uLgEwrMeKRGHskP8ps=
Received: from ubuntu.localdomain (unknown [125.120.102.69])
        by smtp1 (Coremail) with SMTP id GdxpCgB3Scp5QXdfpcjqAg--.3258S4;
        Fri, 02 Oct 2020 23:04:26 +0800 (CST)
From:   Li Qiang <liq3ea@163.com>
To:     pbonzini@redhat.com, corbet@lwn.net, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     liq3ea@gmail.com, Li Qiang <liq3ea@163.com>
Subject: [PATCH] Documentation: kvm: fix a typo
Date:   Fri,  2 Oct 2020 08:04:22 -0700
Message-Id: <20201002150422.6267-1-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GdxpCgB3Scp5QXdfpcjqAg--.3258S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4UXw1kuFyxXFy5tFW3GFg_yoW3WrgEvw
        1UJFsYyr1xtryIvw4UWFZ5XF1fXa1ruFW8Cws7JrZ5Aay3AwsY9F97A3s0kw1UWFsxur4r
        JFZxZrW5Gr1S9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRTa0PUUUUU==
X-Originating-IP: [125.120.102.69]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhqxbVaD6Ear8gAAsC
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fixes: 9824c83f92bc8 ("Documentation: kvm: document CPUID bit for MSR_KVM_POLL_CONTROL")
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 Documentation/virt/kvm/cpuid.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/cpuid.rst b/Documentation/virt/kvm/cpuid.rst
index a7dff9186bed..9150e9d1c39b 100644
--- a/Documentation/virt/kvm/cpuid.rst
+++ b/Documentation/virt/kvm/cpuid.rst
@@ -78,7 +78,7 @@ KVM_FEATURE_PV_SEND_IPI           11          guest checks this feature bit
                                               before enabling paravirtualized
                                               sebd IPIs
 
-KVM_FEATURE_PV_POLL_CONTROL       12          host-side polling on HLT can
+KVM_FEATURE_POLL_CONTROL          12          host-side polling on HLT can
                                               be disabled by writing
                                               to msr 0x4b564d05.
 
-- 
2.25.1

