Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C4A547D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 16:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfA2Qfs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 11:35:48 -0500
Received: from mga04.intel.com ([192.55.52.120]:49572 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbfA2Qfs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Jan 2019 11:35:48 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Jan 2019 08:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,537,1539673200"; 
   d="scan'208";a="142414817"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga001.fm.intel.com with SMTP; 29 Jan 2019 08:35:45 -0800
Received: by stinkbox (sSMTP sendmail emulation); Tue, 29 Jan 2019 18:35:44 +0200
Date:   Tue, 29 Jan 2019 18:35:44 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/TODO: Add vrefresh replacement to the todo
Message-ID: <20190129163544.GE20097@intel.com>
References: <20190129161611.241599-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190129161611.241599-1-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 29, 2019 at 11:15:51AM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  Documentation/gpu/todo.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 38360ede12215..7fc30380eaf6c 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -262,6 +262,21 @@ As a reference, take a look at the conversions already completed in drm core.
>  
>  Contact: Sean Paul, respective driver maintainers
>  
> +Convert direct mode.vrefresh accesses to use drm_mode_vrefresh()
> +----------------------------------------------------------------
> +
> +drm_display_mode.vrefresh isn't guaranteed to be populated. As such, using it
> +is risky and has been known to cause div-by-zero bugs. Fortunately, drm core
> +has helper which will use mode.vrefresh if it's !0 and will calculate it from
> +the timings when it's 0.
> +
> +Use simple search/replace, or (more fun) cocci to replace instances of direct
> +vrefresh access with a call to the helper. Check out
> +https://lists.freedesktop.org/archives/dri-devel/2019-January/205186.html for
> +inspiration.

I would suggest just nuking mode.vrefresh entirely because we
don't want to risk drm_mode_vrefresh() returning some stale
value.

> +
> +Contact: Sean Paul
> +
>  Core refactorings
>  =================
>  
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
