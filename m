Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB5C3793D4;
	Fri, 22 May 2026 19:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477186; cv=none; b=t3EbdTwQqzo08aM2g8/LVoiuYQFqLpHw+XNaCXrk2wG5WyMMHazWSQQeuLRzxHUkeddPIjVTwT00hz4Sh81W6hjVf6a5Ko1wKM0CE+QJz5JalwihHBmjffMB0qKsmGgO0++tf0+39M9T86Uqtmb9ghCAFhyyBe6v3jNst0KA3QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477186; c=relaxed/simple;
	bh=3IfPthyDl2oPPglM9oqDGvx1An2T/XqIOjxgRfcIt3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0jAc/ZIwJl8zn4OsNV65CODRyC/sSr54KVQxAOERWr9GZ3RoJKr35urB0uWUh0M8ztZBzEWJfGtx861s5+Q/6OfUx8ef/rr3Pe5sGAo/LT+O47ZmMvJNoEvOi9lztwMWG+CreefbHfBmrdj1YbL9fsCB0SPAODdP3fnAJGcqTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XStWa2fS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XStWa2fS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779477182; x=1811013182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3IfPthyDl2oPPglM9oqDGvx1An2T/XqIOjxgRfcIt3I=;
  b=XStWa2fSiD2GaDPewKipBAzs2t3sL0AZCctpg4/MpdPfOrnPEzHuM+E1
   7XsDnHWLCP12lC/y1spOF8WI/7JsoYfccI1Wyb861lvzqW2SKq500rYtV
   Yos3gNfjuPj+fYu1swFrurHoMQG9gpveRZrULMDNCo4yVaf1yAdURL8x6
   N8+2jj2yEKgWNBeLVUDq0WJV6SuH4nJWYSklvJbVcyhwZgtcC3q/1CBpg
   PkZb8rCIc8xjlZMpzO8cTw56CO4XHCW6QeP00qCKy84WJ4ffN1HtjVsdE
   PdwJhtthZcLTHg+Ee8TclX3RkJ/UheFy/e623Z/0l0ZpPkKp25hla1iRn
   Q==;
X-CSE-ConnectionGUID: /bJ7EWPhRjSjqKTHtc0FAg==
X-CSE-MsgGUID: XMRFBY7cTOSRgMbaCCP1qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91522267"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91522267"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 12:13:00 -0700
X-CSE-ConnectionGUID: 7NpFBSNpQWaxr5HTnm4f4A==
X-CSE-MsgGUID: J5AfsVnqQKOwWRpPLh2Bsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245281652"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 12:12:53 -0700
Date: Fri, 22 May 2026 22:12:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Stone <daniel@fooishbar.org>, kernel@collabora.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
	wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v15 11/28] drm/i915/hdmi: Add YCBCR444 handling for sink
 formats
Message-ID: <ahCqmuF7_LywzRGP@intel.com>
References: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
 <20260522-color-format-v15-11-21fb136c9df2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522-color-format-v15-11-21fb136c9df2@collabora.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Fri, May 22, 2026 at 02:32:02PM +0200, Nicolas Frattaroli wrote:
> In anticipation of userspace being able to explicitly select supported
> sink formats, add handling of the YCBCR444 sink format. The AUTO path
> does not choose this format, but with explicit format selection added to
> the driver, it becomes a possibility.
> 
> Check for YCBCR444 support on the sink in sink_bpc_possible, and on the
> source and sink in sink_format_valid.
> 
> Acked-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdmi.c | 32 +++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 9076c2b176ec..97cb321e6568 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -1966,6 +1966,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
>  
>  		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
>  			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_36;
> +		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
> +			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36;
>  		else
>  			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36;
>  	case 10:
> @@ -1974,6 +1976,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
>  
>  		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
>  			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_30;
> +		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
> +			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30;
>  		else
>  			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30;
>  	case 8:
> @@ -2021,6 +2025,27 @@ intel_hdmi_mode_clock_valid(struct drm_connector *_connector, int clock,
>  	return status;
>  }
>  
> +/**
> + * intel_hdmi_can_ycbcr444 - Check whether connector can output YCbCr444
> + * @connector: pointer to &struct intel_connector to check
> + *
> + * Checks whether the hardware that backs @connector is capable of outputting
> + * YCbCr444 video over HDMI. Does not check whether currently connected sink is
> + * capable of receiving it.
> + *
> + * Returns: %true if source supports outputting YCbCr444, %false otherwise.
> + */

We don't need kernel docs for internal stuff.

> +static bool
> +intel_hdmi_can_ycbcr444(struct intel_connector *connector)
> +{
> +	const struct intel_display *display = to_intel_display(connector);
> +
> +	if (HAS_GMCH(display))
> +		return true;

Exactly the wrong way around.

> +
> +	return false;
> +}
> +
>  static enum drm_mode_status
>  intel_hdmi_sink_format_valid(struct intel_connector *connector,
>  			     const struct drm_display_mode *mode,
> @@ -2038,6 +2063,13 @@ intel_hdmi_sink_format_valid(struct intel_connector *connector,
>  
>  		return MODE_OK;

I would put the 444 stuff here between 420 and RGB. Then we logically go
from YCbCr420 -> YCbCr444 -> RGB when reading the code.

>  	case INTEL_OUTPUT_FORMAT_RGB:
> +		return MODE_OK;
> +	case INTEL_OUTPUT_FORMAT_YCBCR444:
> +		if (!intel_hdmi_can_ycbcr444(connector))
> +			return MODE_BAD;

We're missing the has_hdmi_sink check as well.

> +		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
> +			return MODE_BAD;
> +
>  		return MODE_OK;
>  	default:
>  		MISSING_CASE(sink_format);
> 
> -- 
> 2.54.0

-- 
Ville Syrjälä
Intel
