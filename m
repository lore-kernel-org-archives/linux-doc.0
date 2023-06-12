Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91D7C77B7A
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jun 2023 03:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbjFLDIW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Jun 2023 23:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233497AbjFLDIR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Jun 2023 23:08:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90B3E63;
        Sun, 11 Jun 2023 20:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=FhgBJ6qPJJSAgmnpesfTh4Obq9q8c5qykQgTTJwa4a0=; b=RLTfSAUxEScxwkSLdojIsTYxp9
        zTd8cESj3uhLnFAv2s8sSZZln6PNf43BinTkjGB8r+KeQCy8lSCy3DxgOkEIS+IN7FF6alJPVqlGM
        5fWeR1kP0QlrNj6oiIMrlGe3krvNS1NtRnKtaLp0daOg0F429rTk87bftA/fraJhS3oELVl7heOEa
        t5HD0WdCZK5gK+aP3zgk8XLuQEZ3g0/ffoyUppr5iOmkiF+4YF11IwNAqpNBME4ynvqU5iSSSHDS6
        PnRzeSccYxxW6F8ViXsPKKVWHQMKybjGwo/FJK70eLaE/mQpxa0vYXqqMENkO71slLppzQrGtU1vL
        C71/UKfQ==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1q8Xug-002P78-1C;
        Mon, 12 Jun 2023 03:08:14 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
        Alexander Graf <agraf@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 3/4] Documentation: KVM: make corrections to ppc-pv.rst
Date:   Sun, 11 Jun 2023 20:08:09 -0700
Message-ID: <20230612030810.23376-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230612030810.23376-1-rdunlap@infradead.org>
References: <20230612030810.23376-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct the path of a header file.
Change "guest to ... guest" to "guest to ... host" in one place.
Hyphenate "32-bit" systems.
Add a comma at one parenthetical phrase.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org
Cc: Alexander Graf <agraf@suse.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/virt/kvm/ppc-pv.rst |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -- a/Documentation/virt/kvm/ppc-pv.rst b/Documentation/virt/kvm/ppc-pv.rst
--- a/Documentation/virt/kvm/ppc-pv.rst
+++ b/Documentation/virt/kvm/ppc-pv.rst
@@ -89,7 +89,7 @@ also define a new hypercall feature to i
 registers. Only if the host supports the additional features, make use of them.
 
 The magic page layout is described by struct kvm_vcpu_arch_shared
-in arch/powerpc/include/asm/kvm_para.h.
+in arch/powerpc/include/uapi/asm/kvm_para.h.
 
 Magic page features
 ===================
@@ -112,7 +112,7 @@ Magic page flags
 ================
 
 In addition to features that indicate whether a host is capable of a particular
-feature we also have a channel for a guest to tell the guest whether it's capable
+feature we also have a channel for a guest to tell the host whether it's capable
 of something. This is what we call "flags".
 
 Flags are passed to the host in the low 12 bits of the Effective Address.
@@ -139,7 +139,7 @@ Patched instructions
 ====================
 
 The "ld" and "std" instructions are transformed to "lwz" and "stw" instructions
-respectively on 32 bit systems with an added offset of 4 to accommodate for big
+respectively on 32-bit systems with an added offset of 4 to accommodate for big
 endianness.
 
 The following is a list of mapping the Linux kernel performs when running as
@@ -210,7 +210,7 @@ available on all targets.
 2) PAPR hypercalls
 
 PAPR hypercalls are needed to run server PowerPC PAPR guests (-M pseries in QEMU).
-These are the same hypercalls that pHyp, the POWER hypervisor implements. Some of
+These are the same hypercalls that pHyp, the POWER hypervisor, implements. Some of
 them are handled in the kernel, some are handled in user space. This is only
 available on book3s_64.
 
