Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31213366064;
	Thu,  5 Mar 2026 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705306; cv=pass; b=G1H4toMA8N5cTL1F4I9a8Cm1SMqGHoGbQ5p0WRDZjX7Q8Cn5yS1FF53NXZofwCJTxiAFMBZWArI1WDR/EjFBXaVD72UDnL1Prbb2X7Nm1GOASC69OpP80CIxpkFeRejbYHM8bEhiPWSzdVN7FIh4Pv3hlTL7UFTWwFaonAV8F0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705306; c=relaxed/simple;
	bh=4VUqalmLfhG9P3j4EI0hDT4lquN0HpIclhY/AJdCJ3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGXf38T5WQC1WQxesimr1GW5dSRTLNH/LAjj7vmBsvJw4dAWtWmKS7uW8mrMvzzxsqmumLcX/BNwZO2NYRxjJBFgKnZ6/f+czBMwh07Hi3AlV565nBfPY6TqEzq/G7/RtPkS24KWzkgsmdD0gitUByiC0h+4ALmcvKQ4hTPP63Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=bT09/vEj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="bT09/vEj"
ARC-Seal: i=1; a=rsa-sha256; t=1772705241; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JyfVnP4+KszQmwuoXFZ8ruIZigZfqrPygzLjs/1DRhk05ABitc8xkW/a70ttnvAIlnkhv9vm5jBb1evLXmu8LLKNpxw0hcUJUB1WUcIBnGdNgdCbYmZclDOKZNoQSjlAkIB6Aku5ctzZ/EEhO4TsAa+tImSBL5aG5oKKh68gKqg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772705241; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nszGsxugf+CGTQes71iM3DAN6Pzn2MLUlpTJlv1vBJI=; 
	b=TsmeHq/rZ93VEmsTOB6uoSvG8hVoDmDbtT5QPjlJFPmzWzfvMdcqJD2mNWBv/B6p/6hRcYN8bDX25/lPRMYkDE4+sLlAyM3RvWVQcBlkDBFB/6ErcCHquAoL0WCQEtdtR8x9GMozNsxBLQsYKGNLz4SqWLjSkWHmUGuVByLmdts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772705241;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=nszGsxugf+CGTQes71iM3DAN6Pzn2MLUlpTJlv1vBJI=;
	b=bT09/vEjLQZtoqDIHdb9LiaSgYzDW0jBTU6ABmJ+Zndtis8AZZw4PxDwFtuuAz7J
	z6/YDMnfDNqNed5d0JD1VmhrN0hraVni8ZJSH9/0onUpXW4Pbtby87TuYDDCYnGXAfu
	7ZKGkVloRwcZglAOZWYmlVHdKU4MLxKWdWcfbN30=
Received: by mx.zohomail.com with SMTPS id 1772705239022996.0545573857447;
	Thu, 5 Mar 2026 02:07:19 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-doc@vger.kernel.org, Andri Yngvason <andri@yngvason.is>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
Date: Thu, 05 Mar 2026 11:07:09 +0100
Message-ID: <5733371.31r3eYUQgx@workhorse>
In-Reply-To: <20260305-just-oxpecker-of-reward-e05e4f@houat>
References:
 <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
 <20260305-just-oxpecker-of-reward-e05e4f@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Thursday, 5 March 2026 10:28:11 Central European Standard Time Maxime Ripard wrote:
> Hi,
> 
> On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 4af91e252fbd..b5bc93856ad1 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -579,6 +579,91 @@ enum drm_output_color_format {
> >  	DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
> >  };
> >  
> > +/* Do not forget to adjust after modifying &enum drm_output_color_format */
> > +#define DRM_OUTPUT_COLOR_FORMAT_COUNT 4
> 
> Maybe we can put that as the last variant of our enum so we don't have
> to always update it?

That will then cause a bunch of potential warnings for any of the switch
cases that convert from one thing to the other. At least my LSP indicated
so. I guess I can ignore those (and wouldn't be surprised if they were
already ignored by the Makefiles and the LSP just didn't pick up on this
somehow.) I'll do that in the next revision if you're fine with this.
Potentially, I'll have to add a default case to some switch statements
that just does a WARN() or something.

I do wish C had a better way to deal with setting a symbol to the number
of valid enum values without making it itself a valid enum value.

> 
> > +/**
> > + * enum drm_connector_color_format - Connector Color Format Request
> > + *
> > + * This enum, unlike &enum drm_output_color_format, is used to specify requests
> > + * for a specific color format on a connector through the DRM "color format"
> > + * property. The difference is that it has an "AUTO" value to specify that
> > + * no specific choice has been made.
> > + */
> > +enum drm_connector_color_format {
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_AUTO: The driver or display protocol
> > +	 * helpers should pick a suitable color format. All implementations of a
> > +	 * specific display protocol must behave the same way with "AUTO", but
> > +	 * different display protocols do not necessarily have the same "AUTO"
> > +	 * semantics.
> > +	 *
> > +	 * For HDMI, "AUTO" picks RGB, but falls back to YCbCr 4:2:0 if the
> > +	 * bandwidth required for full-scale RGB is not available, or the mode
> > +	 * is YCbCr 4:2:0-only, as long as the mode and output both support
> > +	 * YCbCr 4:2:0.
> > +	 *
> > +	 * For display protocols other than HDMI, the recursive bridge chain
> > +	 * format selection picks the first chain of bridge formats that works,
> > +	 * as has already been the case before the introduction of the "color
> > +	 * format" property. Non-HDMI bridges should therefore either sort their
> > +	 * bus output formats by preference, or agree on a unified auto format
> > +	 * selection logic that's implemented in a common state helper (like
> > +	 * how HDMI does it).
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_AUTO = 0,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_RGB444: RGB output format
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_RGB444,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR444: YCbCr 4:4:4 output format (ie.
> > +	 * not subsampled)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR444,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR422: YCbCr 4:2:2 output format (ie.
> > +	 * with horizontal subsampling)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR422,
> > +
> > +	/**
> > +	 * @DRM_CONNECTOR_COLOR_FORMAT_YCBCR420: YCbCr 4:2:0 output format (ie.
> > +	 * with horizontal and vertical subsampling)
> > +	 */
> > +	DRM_CONNECTOR_COLOR_FORMAT_YCBCR420,
> > +};
> > +
> > +/* Do not forget to adjust after modifying &enum drm_connector_color_format */
> > +#define DRM_CONNECTOR_COLOR_FORMAT_COUNT 5
> 
> Ditto
> 
> Maxime
> 




