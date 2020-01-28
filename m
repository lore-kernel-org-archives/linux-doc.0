Return-Path: <SRS0=JCeC=3R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D08FC2D0DB
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jan 2020 14:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43731214AF
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jan 2020 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580223094;
	bh=XJBqHP9X6xdwKnRYGlBBnIC+Wnep6UMrJLUN94RU6hE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=1GRcKGSSLYq0/nujtuNb96yItahcOcWgkLEdR2r4z7NbNlLKB2UzqIJq/NjrIwrv6
	 +H7DsFx/3BPwUELU4N/1CIP/hniIKtplj6LkUE/fRmOS8Z1VK6pmRbFKIQoonwvRrd
	 S8o5pJ0dNgsS0WTqOuXgoNwQ3O+FrliUZzmxZYpc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgA1Ovd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jan 2020 09:51:33 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58468 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgA1N6p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 08:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pdZ8qcVwJgau11WErg9V3Yc+VhPbjBFzGGVo//flLAo=; b=IY8kUX3jt6T7ycTm5TlTbHp97e
        ihx8iVOroMu3KQ+4RWIUWi35WvwoDkXDgPDXkKB3miW+tfabeSW8J7OtVtccZITgCo+nsWPOQjkeW
        oYeMRPwv0y6GwBeQjbPXhDlAFV+Fep5shAY8jmW2evT4DH0kbJ65VA9l2sfm9c+tGdTythQmXMdc5
        1HMZNkCaOssy+r7Z5HWvV4rJ9v8i6wEQwWTPuc17yQAL8HCSnbPJl43xYHtqLZNgS51nhlrcEix2X
        BdyAwXYLBKuyyesWApoqWj1KFTMtUTCOAcnbEAYigeSrtyqjMHhGIOau7iLOBooRWbKSVWwCeRMiB
        RNPaV0Cw==;
Received: from [177.41.103.99] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwRO7-0006KK-TS; Tue, 28 Jan 2020 13:58:43 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwRNq-001BKL-Nk; Tue, 28 Jan 2020 14:58:26 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 18/27] docs: kvm: convert arm/hyp-abi.txt to ReST
Date:   Tue, 28 Jan 2020 14:58:14 +0100
Message-Id:
 <707c15ba05c14b49801e29840154ee1aed5cd910.1580219586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1580219586.git.mchehab+huawei@kernel.org>
References: <cover.1580219586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
Message-ID: <20200128135814.3mALCbn3C2DLlWLcxLOybb-QWRmKWduc5lKqD6Voiw8@z>

- Add proper markups for titles;
- Adjust whitespaces and blank lines to match ReST
  needs;
- Mark literal blocks as such.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../virt/kvm/arm/{hyp-abi.txt => hyp-abi.rst} | 26 ++++++++++++-------
 Documentation/virt/kvm/arm/index.rst          |  1 +
 2 files changed, 18 insertions(+), 9 deletions(-)
 rename Documentation/virt/kvm/arm/{hyp-abi.txt => hyp-abi.rst} (80%)

diff --git a/Documentation/virt/kvm/arm/hyp-abi.txt b/Documentation/virt/kvm/arm/hyp-abi.rst
similarity index 80%
rename from Documentation/virt/kvm/arm/hyp-abi.txt
rename to Documentation/virt/kvm/arm/hyp-abi.rst
index a20a0bee268d..cf74b5b87df6 100644
--- a/Documentation/virt/kvm/arm/hyp-abi.txt
+++ b/Documentation/virt/kvm/arm/hyp-abi.rst
@@ -1,4 +1,6 @@
-* Internal ABI between the kernel and HYP
+=======================================
+Internal ABI between the kernel and HYP
+=======================================
 
 This file documents the interaction between the Linux kernel and the
 hypervisor layer when running Linux as a hypervisor (for example
@@ -19,25 +21,31 @@ and only act on individual CPUs.
 Unless specified otherwise, any built-in hypervisor must implement
 these functions (see arch/arm{,64}/include/asm/virt.h):
 
-* r0/x0 = HVC_SET_VECTORS
-  r1/x1 = vectors
+* ::
+
+    r0/x0 = HVC_SET_VECTORS
+    r1/x1 = vectors
 
   Set HVBAR/VBAR_EL2 to 'vectors' to enable a hypervisor. 'vectors'
   must be a physical address, and respect the alignment requirements
   of the architecture. Only implemented by the initial stubs, not by
   Linux hypervisors.
 
-* r0/x0 = HVC_RESET_VECTORS
+* ::
+
+    r0/x0 = HVC_RESET_VECTORS
 
   Turn HYP/EL2 MMU off, and reset HVBAR/VBAR_EL2 to the initials
   stubs' exception vector value. This effectively disables an existing
   hypervisor.
 
-* r0/x0 = HVC_SOFT_RESTART
-  r1/x1 = restart address
-  x2 = x0's value when entering the next payload (arm64)
-  x3 = x1's value when entering the next payload (arm64)
-  x4 = x2's value when entering the next payload (arm64)
+* ::
+
+    r0/x0 = HVC_SOFT_RESTART
+    r1/x1 = restart address
+    x2 = x0's value when entering the next payload (arm64)
+    x3 = x1's value when entering the next payload (arm64)
+    x4 = x2's value when entering the next payload (arm64)
 
   Mask all exceptions, disable the MMU, move the arguments into place
   (arm64 only), and jump to the restart address while at HYP/EL2. This
diff --git a/Documentation/virt/kvm/arm/index.rst b/Documentation/virt/kvm/arm/index.rst
index e039d9b1e076..134fa5fa77e5 100644
--- a/Documentation/virt/kvm/arm/index.rst
+++ b/Documentation/virt/kvm/arm/index.rst
@@ -7,4 +7,5 @@ ARM
 .. toctree::
    :maxdepth: 2
 
+   hyp-abi
    pvtime
-- 
2.24.1

