Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC94C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 11:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D028160462
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 11:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbhITLDb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 07:03:31 -0400
Received: from mga01.intel.com ([192.55.52.88]:59160 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232312AbhITLDb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Sep 2021 07:03:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="245511811"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="245511811"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 04:02:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="556181119"
Received: from svandens-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.216.120])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 04:02:01 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] doc: gpu: drm-internals: Create reference to DRM mm
In-Reply-To: <20210920101334.249832-1-msp@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210920101334.249832-1-msp@baylibre.com>
Date:   Mon, 20 Sep 2021 14:01:57 +0300
Message-ID: <874kafv7bu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 20 Sep 2021, Markus Schneider-Pargmann <msp@baylibre.com> wrote:
> This short sentence references nothing for details about memory manager.
> Replace it with the documentation file for DRM memory management.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  Documentation/gpu/drm-internals.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index 06af044c882f..bdcdfc4ede04 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -126,8 +126,8 @@ Memory Manager Initialization
>  Every DRM driver requires a memory manager which must be initialized at
>  load time. DRM currently contains two memory managers, the Translation
>  Table Manager (TTM) and the Graphics Execution Manager (GEM). This
> -document describes the use of the GEM memory manager only. See ? for
> -details.
> +document describes the use of the GEM memory manager only. See
> +Documentation/gpu/drm-mm.rst for details.

Please use rst references instead of a file reference.

BR,
Jani.

>  
>  Miscellaneous Device Configuration
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
Jani Nikula, Intel Open Source Graphics Center
