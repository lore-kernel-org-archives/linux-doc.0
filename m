Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8317BC433EF
	for <linux-doc@archiver.kernel.org>; Sat,  2 Jul 2022 11:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiGBLXV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 2 Jul 2022 07:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGBLXV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 2 Jul 2022 07:23:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E072164EB
        for <linux-doc@vger.kernel.org>; Sat,  2 Jul 2022 04:23:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6CCE9B818DF
        for <linux-doc@vger.kernel.org>; Sat,  2 Jul 2022 11:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF0DC34114;
        Sat,  2 Jul 2022 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656760997;
        bh=LPfhPnVMgD5zWo9Dy4V7eX3AmLS+sLomvR/yZU1F6Hc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DLCTfDT7QAkWEeScC+VuAy4BVDoqvnQKWBKRaelmIqQs/vtE1HkPccItlDvZGe5Sk
         OUcKHLySCr9UhEl99zLfpzL4vtPp9mBHFqCjkormLXpcYFlrVcrAbreoD/V0IfF2MP
         7WsfppVxcTg4ujQD1lN43bZ2Oa5v+yNLMO3enndKITQk6C/iZ0StItqDvS0xQyTknJ
         WL7OPr9mYKxC1ObHYCzk1N0HKzRniWhYsKjOk+BSQwZoPB55NPFGjqBQW0nN2K7s5a
         egL/ZMAGGFV0ZluIMntkLYs+s1G4ucKbfcwMY7GjnyTxN5EvPTIAef8aN87HUWRvH9
         OU+/cIoXFGtgQ==
Date:   Sat, 2 Jul 2022 12:23:11 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Adam Turner <aaturnerpython@outlook.com>
Cc:     Akira Yokosawa <akiyks@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <20220702122311.358c0219@sal.lan>
In-Reply-To: <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
        <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
        <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 3 Jun 2022 15:27:18 +0000
Adam Turner <aaturnerpython@outlook.com> escreveu:

> >> From Sphinx's perspective, we'd like to remove long-deprecated code.
> >> What is a good solution here for both sides? The intertial option is
> >> for us to delay the deprecation by another major version (removal is
> >> currently scheduled for Sphinx 6 (2023-05), and we are currently 
> >> releasing a major version every May.  
> 
> > So, can we assume that there won't be any backward-incompatible
> > behavior changes in Sphinx due to the removal of those long-deprecated
> > code?  
> 
> I'm referring to removing support for the "c_allow_pre_v3", 
> "c_warn_on_allowed_pre_v3", configuration options [1]_, and the 
> associated support for still parsing the pre v3 syntax in the C 
> domain [2]_. This means that pre v3 syntax in reStructuredText files
> would not work with Sphinx 6 onwards.
> 
> > Or do you mean that after the release of Sphinx 6, pre v3 Sphinx
> > will be removed in the PyPI repository?  
> 
> No releases will be removed from PyPI, but if pre v3 syntax is still
> used, Sphinx 6.0 would fail to properly parse it.

Adam,

Despite the performance issues with Sphinx > 2.x.x, there is another
reason why the default is to use 2.4.4 version. Currently, building
the docs with any version newer than that will cause 11 false-positives
warnings:

	    Documentation/driver-api/usb/usb:164: ./drivers/usb/core/message.c:967: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget:783.
Declaration is '.. c:function:: int usb_string (struct usb_device *dev, int index, char *buf, size_t size)'.
    Documentation/driver-api/usb/usb.rst:967: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget:783.
Declaration is '.. c:struct:: usb_string'.
    Documentation/driver-api/miscellaneous:48: ./drivers/pwm/core.c:599: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous:240.
Declaration is '.. c:function:: int pwm_capture (struct pwm_device *pwm, struct pwm_capture *result, unsigned long timeout)'.
    Documentation/driver-api/surface_aggregator/client-api:25: ./drivers/platform/surface/aggregator/controller.c:1689: WARNING: Duplicate C declaration, also defined at driver-api/surface_aggregator/client-api:105.
Declaration is '.. c:function:: int ssam_request_sync (struct ssam_controller *ctrl, const struct ssam_request *spec, struct ssam_response *rsp)'.
    Documentation/driver-api/80211/mac80211:109: ./include/net/mac80211.h:4933: WARNING: Duplicate C declaration, also defined at driver-api/80211/mac80211:1041.
Declaration is '.. c:function:: void ieee80211_tx_status (struct ieee80211_hw *hw, struct sk_buff *skb)'.
    Documentation/gpu/amdgpu/driver-core:163: ./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:735: WARNING: Duplicate C declaration, also defined at gpu/amdgpu/driver-core:93.
Declaration is '.. c:function:: void amdgpu_vm_tlb_seq_cb (struct dma_fence *fence, struct dma_fence_cb *cb)'.
    Documentation/gpu/drm-kms:360: ./drivers/gpu/drm/drm_fourcc.c:298: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:36.
Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'.
    Documentation/gpu/drm-kms:459: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:49.
Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.
    Documentation/gpu/drm-uapi:357: ./drivers/gpu/drm/drm_ioctl.c:917: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:70.
Declaration is '.. c:function:: bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'.
    Documentation/gpu/rfc/i915_scheduler:138: ./include/uapi/drm/i915_drm.h:3: WARNING: Duplicate C declaration, also defined at gpu/driver-uapi:2101.
Declaration is '.. c:struct:: i915_context_engines_parallel_submit'.
    Documentation/gpu/rfc/i915_scheduler.rst:3: WARNING: Duplicate C declaration, also defined at gpu/driver-uapi:2101.
Declaration is '.. c:struct:: i915_context_engines_parallel_submit'.

Basically, on 11 places inside the Kernel we use the same name for
functions and for struct (or enum), as this is perfectly fine on C.

Yet, even having different tags at the C domain after Sphinx 3.x, it
still doesn't place them on separate namespaces. Those are all caused
by this bug, whose fixes are yet to be merged:

	https://github.com/sphinx-doc/sphinx/pull/8313

Is this planned to be solved during Sphinx 5.x development cycle?

Regards,
Mauro
