Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280EBC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 09:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6A646127A
	for <linux-doc@archiver.kernel.org>; Mon, 12 Apr 2021 09:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237532AbhDLJpV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Apr 2021 05:45:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:19008 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241188AbhDLJhP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Apr 2021 05:37:15 -0400
IronPort-SDR: B1ftWdqansXOm5tSRSMvKo9Dj41eQVyvaLCrycbBs7pZ3dVFjTKztDinXnDa235kJ8RudSOuC2
 AoZCVyhhbHxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="181670669"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="181670669"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:36:51 -0700
IronPort-SDR: BBCOyapemeK9QZkDPBZxXvoR2i98nYdREezj2tp28wTBkgLtXJB+Xt78hIAApuRKeB+lVe58sq
 BSfQQBkcXE7g==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="417310215"
Received: from cyeni-mobl.ger.corp.intel.com (HELO localhost) ([10.252.62.41])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:36:47 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
        daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, corbet@lwn.net
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/aperture: Add infrastructure for aperture ownership
In-Reply-To: <20210412090021.23054-2-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210412090021.23054-1-tzimmermann@suse.de> <20210412090021.23054-2-tzimmermann@suse.de>
Date:   Mon, 12 Apr 2021 12:36:44 +0300
Message-ID: <87mtu3kfo3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 12 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> + * DRM drivers should call drm_aperture_remove_conflicting_framebuffers()
> + * at the top of their probe function. The function removes any generic
> + * driver that is currently associated with the given framebuffer memory.
> + * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the
> + * example given below.
> + *
> + * .. code-block:: c
> + *
> + *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
> + *	{
> + *		bool primary = false;
> + *		resource_size_t base, size;
> + *		int ret;
> + *
> + *		base = pci_resource_start(pdev, 0);
> + *		size = pci_resource_len(pdev, 0);
> + *	#ifdef CONFIG_X86
> + *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
> + *	#endif
> + *
> + *		return drm_aperture_remove_conflicting_framebuffers(base, size, primary,
> + *		                                                    "example driver");
> + *	}
> + *
> + *	static int probe(struct pci_dev *pdev)
> + *	{
> + *		int ret;
> + *
> + *		// Remove any generic drivers...
> + *		ret = remove_conflicting_framebuffers(pdev);
> + *		if (ret)
> + *			return ret;
> + *
> + *		// ... and initialize the hardware.
> + *		...
> + *
> + *		drm_dev_register();
> + *
> + *		return 0;
> + *	}

I'm guessing you can't use tabs for the first indentation level
here. IIRC kernel-doc removes the leading comment marker and one
whitespace whether it's space or tab, resulting in rst where the
code-block contents are only partially indented.

Please test the documentation build before applying.

Otherwise, the series seems like a nice cleanup.

Acked-by: Jani Nikula <jani.nikula@intel.com>



-- 
Jani Nikula, Intel Open Source Graphics Center
