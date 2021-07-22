Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99714C63793
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72F8061289
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbhGVJYB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhGVJXy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 05:23:54 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA1CC0617BD
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:03:59 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bu12so7636235ejb.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yi0leTUVd76WD8j3lOwXyZzKhNV7sNslJSh+czRsAu8=;
        b=I3NaDGeto3DbbrwKQ/tiY61EuIWdV2+gJN3wDQGafDf4iWFLp51BA72lRg3UQJfTEY
         9Byp1/NE4KqTlJgNklPh49GXaoBXJhY0RID6/3Cclm4QlyCBwvGTKJjd/RZmLotQLbyw
         BV6R24sWPKR9zaBkQ23hCvQXX6MHUD9ai5YyBG7aipXjfTlL+i+sTsKSl6c7oZd7wxMf
         O4/iLKQNKfV2FZf4sNc2bNbtOvZrqU9TKL6DtkSfpBz0ZfAm0LHav/wcj4Rhw2i1QWp+
         PP43gxxzn1Q+1d+dkYb9Ng0lKymXqt2yfrWm/lQN6xvWRfKEeuM4Ea5wuZY2Uvditlyo
         0kfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yi0leTUVd76WD8j3lOwXyZzKhNV7sNslJSh+czRsAu8=;
        b=eRz3n2Ff5C+8k/9PsE/48Q6CioLxXlNMVrDSL9GKlVbqwDiPAZZ54bZrANcxwdDxtf
         o2xID2y7o6FoiyXlPanUwUNCcZPidTa7p7nPhK5Hc+nCz6oi2bkL8+LBrVV1FsuKcMcg
         bFB89Knx4lWpIZoy65TX78cukHsVfKhmNEiffavxFWHX/np3/4eFH9nchUOoN/xveyPL
         Uo5FwozazDiEx2ZnwTwvJQRDbwTBZTu5Jp8Pvb+yHUOsVIL8Zxxd4wLw6ZWPw8Fp0ely
         mw4MUdTC+Dw6MBP4rtPWm2usn2cBByQfWo9lpVmEU4p2SMmcmTpbR8kjYkS8ugWrjICL
         AreA==
X-Gm-Message-State: AOAM533Kg/K5rAIT8XXIqt3zUH+KhLOsN7ajT0XRoOsfygVO7ItMWVe4
        Gpo1riKeYiDP6hXzUEPHmSQ=
X-Google-Smtp-Source: ABdhPJzO80v//7oGao0bWBtIdDN8HCdvtHGM1LS68aLBYcTU7sJwduZDbeR9Rg6ZSRO7EtweNC7ycw==
X-Received: by 2002:a17:906:7302:: with SMTP id di2mr42210329ejc.409.1626948237711;
        Thu, 22 Jul 2021 03:03:57 -0700 (PDT)
Received: from yoga-910.localhost ([82.76.66.29])
        by smtp.gmail.com with ESMTPSA id cb4sm9341749ejb.72.2021.07.22.03.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 03:03:57 -0700 (PDT)
From:   Ioana Ciornei <ciorneiioana@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Jing Zhang <jingzhangos@google.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 2/4] docs: kvm: fix build warnings
Date:   Thu, 22 Jul 2021 13:03:54 +0300
Message-Id: <20210722100356.635078-3-ciorneiioana@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722100356.635078-1-ciorneiioana@gmail.com>
References: <20210722100356.635078-1-ciorneiioana@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Fix some small build warnings. The title underline was too short in some
cases and a code block was not indented.

Documentation/virt/kvm/api.rst:7216: WARNING: Title underline too short.

Fixes: 6dba94035203 ("KVM: x86: Introduce KVM_GET_SREGS2 / KVM_SET_SREGS2")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 Documentation/virt/kvm/api.rst | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c7b165ca70b6..535ac0efd1b0 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5077,7 +5077,7 @@ of bytes successfully copied is returned. If the call completes successfully
 then ``length`` is returned.
 
 4.131 KVM_GET_SREGS2
-------------------
+--------------------
 
 :Capability: KVM_CAP_SREGS2
 :Architectures: x86
@@ -5090,17 +5090,17 @@ This ioctl (when supported) replaces the KVM_GET_SREGS.
 
 ::
 
-struct kvm_sregs2 {
-	/* out (KVM_GET_SREGS2) / in (KVM_SET_SREGS2) */
-	struct kvm_segment cs, ds, es, fs, gs, ss;
-	struct kvm_segment tr, ldt;
-	struct kvm_dtable gdt, idt;
-	__u64 cr0, cr2, cr3, cr4, cr8;
-	__u64 efer;
-	__u64 apic_base;
-	__u64 flags;
-	__u64 pdptrs[4];
-};
+        struct kvm_sregs2 {
+                /* out (KVM_GET_SREGS2) / in (KVM_SET_SREGS2) */
+                struct kvm_segment cs, ds, es, fs, gs, ss;
+                struct kvm_segment tr, ldt;
+                struct kvm_dtable gdt, idt;
+                __u64 cr0, cr2, cr3, cr4, cr8;
+                __u64 efer;
+                __u64 apic_base;
+                __u64 flags;
+                __u64 pdptrs[4];
+        };
 
 flags values for ``kvm_sregs2``:
 
@@ -5110,7 +5110,7 @@ flags values for ``kvm_sregs2``:
 
 
 4.132 KVM_SET_SREGS2
-------------------
+--------------------
 
 :Capability: KVM_CAP_SREGS2
 :Architectures: x86
@@ -7213,7 +7213,7 @@ supported in the host. A VMM can check whether the service is
 available to the guest on migration.
 
 8.33 KVM_CAP_HYPERV_ENFORCE_CPUID
------------------------------
+---------------------------------
 
 Architectures: x86
 
-- 
2.31.1

