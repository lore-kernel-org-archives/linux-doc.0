Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD137DAA8;
	Fri, 22 May 2026 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477573; cv=none; b=nsq+n19n8DOHWYinHjCXTbX95PxDCnnZgRukLHd3YPet7CTQ/8y4oYaWQNuVbU7qLcwZyoVVnW8XBYhQZ41UvSwfdp7W5/TgqGa0OLnWpFu1P4N2EyBsxBrrJrmp5r9ElUwR4LMxVUcbedQr31u7T8VLHlz6zCIvl8WZicQ68kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477573; c=relaxed/simple;
	bh=mvsDdaMaG9ahIS17I/CcaLNe8axrlTXXcEKv1I/F3/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhVwki46eHijF7JJvbMZvXWsroj67fz9i4bKL71XuRAgTNqZ5fcxfrGcIIW+sFKkMyQf2ms1dg15Yi15ea30JrHEkvgTmhnWqsjcZrvp+DnZkMlQY8nXZtGeqJ2IcKDt0GwIFSh5HSSH6Dy5ljCfHIJ50k/s7sBwypmeOEzLdGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hkehl2lp; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hkehl2lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779477570; x=1811013570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mvsDdaMaG9ahIS17I/CcaLNe8axrlTXXcEKv1I/F3/Q=;
  b=Hkehl2lpYBPhWO9VM1/JIoGN3SO5VLjF+iYCkf/bnx2CjtQHp8MxUnwD
   U2gfMSkB/BCV0BOz2iFE6cE8BlwCUvXTj+scS4LGfjfKXGwqusJCT2qlJ
   yxdpUvLvjby3hGjleIe1fpX1sHZ/OTK12MAdbWq+RKxLB4Nu4z8MDPqWh
   dUt0N2InwC0c+7UHN/e/m2oDrmy96a634upzaFGGgd5zlpkDjA4tyBgwX
   /f6oO/07DtsAIfUXQADQ49QY+6VwdFfiUkLpN5kpId+jGr1cFJbUN421R
   KU9G1QpXMv1of1kqE5oE7Q3LR1wISq+ACCRvLh5mAp0XJ5uQLfxoqo7HN
   Q==;
X-CSE-ConnectionGUID: MMfgG7iRQfeZ+PJOxVeG8Q==
X-CSE-MsgGUID: xRkPRHzNT/qKCotAsHjWrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84267509"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="84267509"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 12:19:27 -0700
X-CSE-ConnectionGUID: dL6cDJ6DQFWZrX5hPOKejw==
X-CSE-MsgGUID: L335gYqQSTavjDxYniwzUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="264546693"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 12:19:18 -0700
Date: Fri, 22 May 2026 22:19:14 +0300
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
Subject: Re: [PATCH v15 12/28] drm/i915/dp: Add YCBCR444 handling for sink
 formats
Message-ID: <ahCsMhvKzUU-3x7b@intel.com>
References: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
 <20260522-color-format-v15-12-21fb136c9df2@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522-color-format-v15-12-21fb136c9df2@collabora.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Fri, May 22, 2026 at 02:32:03PM +0200, Nicolas Frattaroli wrote:
> In anticipation of userspace being able to explicitly select supported
> sink formats, add handling of the YCBCR444 sink format. The AUTO path
> does not choose this format, but with explicit format selection added to
> the driver, it becomes a possibility.
> 
> Check for both source and sink support of YCBCR444 in
> intel_dp_sink_format_valid.
> 
> Acked-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 1920d2f02666..143ed85224be 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1344,6 +1344,20 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
>  					 8, sink_format, true);
>  }
>  
> +static bool
> +intel_dp_can_ycbcr444(struct intel_dp *intel_dp)
> +{
> +	if (source_can_output(intel_dp, INTEL_OUTPUT_FORMAT_YCBCR444) &&
> +	    !drm_dp_is_branch(intel_dp->dpcd))
> +		return true;
> +
> +	if (source_can_output(intel_dp, INTEL_OUTPUT_FORMAT_RGB) &&
> +	    dfp_can_convert_from_rgb(intel_dp, INTEL_OUTPUT_FORMAT_YCBCR444))

IIRC my previous conclusion was that we don't want the dfp convert
stuff here, at least initially. So this should just are about
source_can_output().

> +		return true;
> +
> +	return false;
> +}
> +
>  static enum drm_mode_status
>  intel_dp_sink_format_valid(struct intel_connector *connector,
>  			   const struct drm_display_mode *mode,
> @@ -1364,6 +1378,13 @@ intel_dp_sink_format_valid(struct intel_connector *connector,
>  
>  		return MODE_OK;

Again, would prefer a cleanr 420->444->rgb order.

>  	case INTEL_OUTPUT_FORMAT_RGB:
> +		return MODE_OK;
> +	case INTEL_OUTPUT_FORMAT_YCBCR444:
> +		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
> +			return MODE_BAD;
> +		if (!intel_dp_can_ycbcr444(intel_dp))
> +			return MODE_BAD;

These two ifs are swapped when compared to the HDMI version for no
good reason that I can see.

And missing the has_hdmi_sink check here as well.

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
