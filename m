Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C0CC433E9
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 16:55:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25EA423A00
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 16:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbhAHQyk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jan 2021 11:54:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728091AbhAHQyk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Jan 2021 11:54:40 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1344C0612EA
        for <linux-doc@vger.kernel.org>; Fri,  8 Jan 2021 08:53:59 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id h7so8662560qtn.21
        for <linux-doc@vger.kernel.org>; Fri, 08 Jan 2021 08:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=B4cmagUJvqsvM8KJ5vcfLLw3GzVKlYfhlZ7WKpaii2Q=;
        b=g2ySYlslVFQEhuaHS7k+EtkU/c4zzrCRoDUa5ArebteqUm80XrjjPCM4k5ePja3PTf
         qMSdK4AimLDRv70ypB97L9lzMmDlMKy8CQa20AuroYeZ77AgtpjzOVnSrBBIENWRCiRc
         elogZg/UOmOgI7nNL130bYIZLGwLdXGrrlet16+9hTkz8+KIIm61s7BR7QTYN4jiyT4q
         FKyIvCM9A5g8Pb3dSmMJ1wdl+FpqLtZSAmz+n+MOu9VkEs4exSOPOL2S0nyTe6ZpKd1G
         4WrFtJwhRkmCU0w9t4p8S+zYE3EcshcBme0wKw0umqaH7oY8YeIYWFYShcjhV37gYQM+
         RNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=B4cmagUJvqsvM8KJ5vcfLLw3GzVKlYfhlZ7WKpaii2Q=;
        b=deFlpSejVWzoWrH9urClMk0EMTxouM3m6kSAY26C3285Ai/1q3CVPRZsz8U1JhJujA
         D7f7p6vA+KoMVZqKBKovIhCDZ3S/ebtfbakWoJK2JdVUlfiAhVfUVWOb99z6qI/fz1zu
         jh9QRO1Kh+V3wbo/N6WTQsrUZy2bO4a1XuCMxdnHEac7xEzIOzufu9JF+dPtJg+8tUg+
         jcZBz2Iwiwa7/S40VRc6nspvNBdBOtRQJJWStik1SZ8Xwqs40oe4ObDe9wab5mfsX7GC
         vwgQZqcZVdrgxZ4Z2c8nyN/kwirb3HW45rlvtHDnBrjsAcplKKL5xKLUsc5bVR900pP5
         XrHg==
X-Gm-Message-State: AOAM531Ra56WwGBmGm1/wfCRQqKdaj2JUUY1hCA4zLn4cFXg+TVafOHw
        AWc5HAfcB3PNvXdOufayqcWSG1m828ez
X-Google-Smtp-Source: ABdhPJz0ATVlqOcvXwgcYlNfRWv/oEcTQtMpwLVM4J6J727f8fSNNP+cR7MOSfTNDQ2kHT21jmqtIgkIu85h
Sender: "qperret via sendgmr" <qperret@r2d2-qp.c.googlers.com>
X-Received: from r2d2-qp.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1652])
 (user=qperret job=sendgmr) by 2002:ad4:4f41:: with SMTP id
 eu1mr4188454qvb.1.1610124838785; Fri, 08 Jan 2021 08:53:58 -0800 (PST)
Date:   Fri,  8 Jan 2021 16:53:49 +0000
Message-Id: <20210108165349.747359-1-qperret@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH] KVM: Documentation: Fix spec for KVM_CAP_ENABLE_CAP_VM
From:   Quentin Perret <qperret@google.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL VIRTUAL MACHINE (KVM)" <kvm@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     android-kvm@google.com, kernel-team@android.com,
        Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documentation classifies KVM_ENABLE_CAP with KVM_CAP_ENABLE_CAP_VM
as a vcpu ioctl, which is incorrect. Fix it by specifying it as a VM
ioctl.

Fixes: e5d83c74a580 ("kvm: make KVM_CAP_ENABLE_CAP_VM architecture agnostic")
Signed-off-by: Quentin Perret <qperret@google.com>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 70254eaa5229..68898b623d86 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1328,7 +1328,7 @@ documentation when it pops into existence).
 
 :Capability: KVM_CAP_ENABLE_CAP_VM
 :Architectures: all
-:Type: vcpu ioctl
+:Type: vm ioctl
 :Parameters: struct kvm_enable_cap (in)
 :Returns: 0 on success; -1 on error
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog

