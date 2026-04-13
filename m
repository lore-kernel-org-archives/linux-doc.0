Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D977C391505;
	Mon, 13 Apr 2026 19:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776107320; cv=none; b=ZNAAYRKNvV9EDROfT516m16x2m2xToehUpViKNnFy5A2ssbp8ZT9IWVDrFzG6Gcd2bwAaBcTcMa2X1h3XarR50eB2zv+fg55WCclnLkZzIih+BuhSxvINtpcscIiFjREfAbOt7Rc0enymDyLRT/rwsXopW3cq7eP1vikKt4UFlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776107320; c=relaxed/simple;
	bh=4CaM7wenZxKtG66qKgsfsJsukc+IvRC3EJ8tB66RfKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JChgZbKyS7YcX71W0b+JXayUBYZM9mttk5/XTxzho5TVgMOwJ7uQ5oytCuPxcdc9cfM0QPLGRXATEU8f3qYA91leRxU+Vs6OQBIdZxoicA02V7sX9z9d84tPoRS5laGch9GJ2tQxdyZoGpfSapYua+fW16aW2IqRYhrQZ4aKlCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1nyIpof; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1nyIpof"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776107317; x=1807643317;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4CaM7wenZxKtG66qKgsfsJsukc+IvRC3EJ8tB66RfKQ=;
  b=N1nyIpofpHiQRFhZXWdAxFi41PvunDBvadA7DfcuGt/qEo0FhLJWgxLl
   f0saNLWBTRQzFxG7bk58rjA05QYbe525cuRK2GQvakCF0QjlqZ1ULEaxd
   XERBjtXg0ITd2J4kR96NA7ASo+sgvspC6r0YtnZ6OeK+cP3G1zalgzwx+
   OoxVkTQNYzO0IrZoa48oZWvq8W2HISdBQNu9u1UK5dvc/CqtUbmh09PZi
   i1pg8gs/6aGHxChK3hwAAJGHhg8PpkI/xROr/chxsT3VtB79n0fOO3DiG
   BQKznaY1h4sNL5awfzkHXO9QIOlO9dg2y9PXH5KkDiTdAoGIO6rI5xvTp
   w==;
X-CSE-ConnectionGUID: N+3K01dDRuu0EkxO3teMGA==
X-CSE-MsgGUID: SeTJC/T0SiWlIL1jPFmFrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80914436"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="80914436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:08:37 -0700
X-CSE-ConnectionGUID: LLoqwsUcSQadMQwd692Pcg==
X-CSE-MsgGUID: c3AdYV8HRbyVMj2WycmQ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="225137667"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:08:26 -0700
Date: Mon, 13 Apr 2026 22:08:23 +0300
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
	Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 12/27] drm/i915/dp: Add YCBCR444 handling for sink
 formats
Message-ID: <ad0_J-wTpGeaxnF8@intel.com>
References: <20260413-color-format-v13-0-ab37d4dfba48@collabora.com>
 <20260413-color-format-v13-12-ab37d4dfba48@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413-color-format-v13-12-ab37d4dfba48@collabora.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Apr 13, 2026 at 12:07:26PM +0200, Nicolas Frattaroli wrote:
> In anticipation of userspace being able to explicitly select supported
> sink formats, add handling of the YCBCR444 sink format. The AUTO path
> does not choose this format, but with explicit format selection added to
> the driver, it becomes a possibility.
> 
> Check for sink support of YCBCR444 to intel_dp_sink_format_valid.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 35b8fb5740aa..47bd3d59ea93 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1364,6 +1364,11 @@ intel_dp_sink_format_valid(struct intel_connector *connector,
>  
>  		return MODE_OK;
>  	case INTEL_OUTPUT_FORMAT_RGB:
> +		return MODE_OK;
> +	case INTEL_OUTPUT_FORMAT_YCBCR444:
> +		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
> +			return MODE_BAD;

The DP situation is a lot more more fuzzy than the HDMI situation
due to the PCON stuff. So I'm not quite sure what we should do here.

At the very least I think we want the equivalent of
intel_dp_can_ycbcr420() for 444, and the same intel_dp_has_hdmi_sink()
check that we have for 420.

> +
>  		return MODE_OK;
>  	default:
>  		MISSING_CASE(sink_format);
> 
> -- 
> 2.53.0

-- 
Ville Syrjälä
Intel
