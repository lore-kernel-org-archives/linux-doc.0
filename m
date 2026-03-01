Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F462773D3
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772383367; cv=none; b=VwhlFvCirUBZDP/TuGhZpk13/1Wvsxy0VDACqYhdMxinA8hXDt+jevMQbdeRND5EIE74s0tPbWgVQKwbqDIAO3M5SUiCaZn6pvLWCfmacPtXjMDTX2HWUk8Qz5kuFI8nsL+Du6Iso7zSqmnvsRavJtTMbTi5nzcL5CRQfoZxWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772383367; c=relaxed/simple;
	bh=B6ltupO5CSFJD1I7pd5F3OpvUglgJcauZMx0lgH6J4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfI838DOG7KLtw87Rs0E48fHiq1FDrlWNrMy/vFdLFPzZINl/9EduInnvFxmqXmNOw5Hi8ZfB263sGrATs/mswKY2pZ70jfFMeF+20Azzm/2N8xGyb+ljwoaRkeei1mt1gYgd34ubbRenaL5i0aJqhrWo08Oxwkut8FUtTZ5zIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=He8pARc8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTFPqWfX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="He8pARc8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTFPqWfX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6219QkDP4137691
	for <linux-doc@vger.kernel.org>; Sun, 1 Mar 2026 16:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UUK6gQUiNTqa63dauhB4oNrf
	uTLkXg9Yv5hlRkbvUf4=; b=He8pARc8xKIWQNSUN5iKpE5loEd11TA19/vijzUy
	CYWHw9Xaap0rWw4bWeDfmBphXjBNU8zWqkLN0XTsTFglTLJRWiXYf7jqZnnW+NXb
	bE7DV5GnSj7UFtEJXNVoI/V8AkgNAOOfa8AS8aXm3UPmIjCkq1IvovuIL8iR56GT
	HRJ3BdNAUBEeqwYnPCAapQzOa8+GpTl7+m4P3BikpDnkGNGJzkOtqB0piXklqmXN
	BpoJDnESMWRskJpZaShiXRIapbYJ7FzjH3VJbf0wPkAje0oqUMrHemOdFsakXWe8
	VFIVqmFmDzPzK9WZ6poJpgk3/7NVdg6uXmSnFPyYJ7aewg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksn4305t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 16:42:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70fadd9a3so4111035985a.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 08:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772383364; x=1772988164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UUK6gQUiNTqa63dauhB4oNrfuTLkXg9Yv5hlRkbvUf4=;
        b=aTFPqWfXFANFA9vgrlOqhRyKB1xpHZarcv51OdRX+iId1BD0dN3d7diYUIejpFs8wW
         v89Qnrzg0ztIrpq7zy0FFqH877/eKjn75/nQ60a2yL7EHKGGs/xiwz/+tI9gVV+kz++P
         JL603bJV9Zhy58yDiD7LPnMQw3XZ3RcfoM+ZhotcTyWqEIntDr2/9vExwN0MLHSGNfWC
         mvkpA45Fvi0P0V9bBBlqUg/MYj7TjRqP6cG48xuyszXaHA9yK0aXrWjEuQsdXk+/u6La
         4TSHYcQZ4iU/DY7ppVsPtt759NMOSCGpYiTTC1akz6woWv8A0ZJkYUkAlTmFKsPg+glj
         fhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772383364; x=1772988164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUK6gQUiNTqa63dauhB4oNrfuTLkXg9Yv5hlRkbvUf4=;
        b=qxykpV6QTkaeKu1Lga/FQUi9SJXb8Of/0TNjHJWal90/yC44DXvGfkvGNdmlV2Axfx
         pCLxbmxAhXR7xrFWjYhCmPJGgYssXA4INoi4nHxQsFqxUdFXCOynjleYqGWpQBo0iQp2
         I5niG5VFuGdzvheFX8twAr0LE0GbhA+g7106PC9Jbotki15PA0km6SUSbOaOokMJiMU1
         1SOw3eTIdUiqRhVJQ8ZsQb3iYEmoFYGndkhxpxxleytbNU8hGq7jYJoUqsaMkkTf8rb+
         0bnGu12e0AL3dGYqzZ/OnwPsXS+Kt+mKNJ3OBzZ97X3UohWzx2lB8J3AWPBZLjzhntHk
         HMCw==
X-Forwarded-Encrypted: i=1; AJvYcCU8cs2CaaBPY08BvZXunuhIwiFJBWcSIEHPDbFxiUXv74JD+fCe2VaUFM5hJgWRXKMqeoZSHbdxjjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mLe1BkQr35BQsvMXycrLXT2D8jfb629U9IbuR5ks7mmA6PkE
	/cPl/2JYO+5GHk6PAnNdBwyaMttzHlcFk4U2wYHa/+ODAEhUdRYczKBLSc7nvgpVC8b9q7eKvGB
	HCLnAeexM2BpNlYdBsLTDRwdMs9vQ6cyP0Odsn/gZWUUscscywkjL5jWCJhK7wNs=
X-Gm-Gg: ATEYQzwI1gq0OEko2fwGSLKTfriiCIZE1/VOpMU5VuYIOZOjfg7ejjK9HrMZSqpCDFh
	MFOMEoBKOx2Wk+Jp7LJR+xj5nB8nBEOufZnA13Q/EuWALMaD7rQxR6j3V4n8D1ycpVmbuNJ5YaM
	Bpq/1cX5H4XRsstD37D/MhhkqKeAPELTA6uK8TGEPf3uRiIDUKmOSy6JKdM0VBMgZdZSLOsa6+6
	Oa/w+1y0F2jJnd9KGPIq42UUPR6g33pZZcmCn/l62Euekz1jDDmueAYc3/cixiWiNw0vsAD87lb
	8Re9v+jRFKyafKMBBJtSSoocQCzipZrdPqJkTf53lhZhlBWZ497YQB8gwawugWZYAQB6xaEOhD7
	CTZbQTOGSuXMEWaajys9bTgjv/heo2vwfADkSwTXTTecbUgS8gElms0EElxbGQiNdJvGI0E6Pmk
	mMO7+miyqLDHpkgxx1Dq2KKtKipRvA72jMgwo=
X-Received: by 2002:a05:620a:40c4:b0:8c5:32b7:210e with SMTP id af79cd13be357-8cbc8ead9f6mr1058571885a.82.1772383364332;
        Sun, 01 Mar 2026 08:42:44 -0800 (PST)
X-Received: by 2002:a05:620a:40c4:b0:8c5:32b7:210e with SMTP id af79cd13be357-8cbc8ead9f6mr1058568585a.82.1772383363834;
        Sun, 01 Mar 2026 08:42:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca1e5sm1139257e87.26.2026.03.01.08.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:42:43 -0800 (PST)
Date: Sun, 1 Mar 2026 18:42:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 12/19] drm/bridge: dw-hdmi-qp: Implement
 atomic_get_output_bus_fmts
Message-ID: <hocqjcusieyqmsai4bxtgjon446yae6m43dmvqzk34ul44pvfg@ithgwadiwx2j>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-12-658c3b9db7ef@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-12-658c3b9db7ef@collabora.com>
X-Authority-Analysis: v=2.4 cv=Tq3rRTXh c=1 sm=1 tr=0 ts=69a46c85 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=J_biHfMZ8pKUvqPgpkYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: nMgWNSpF1n47CbPFf89gfL5eII9ayNzG
X-Proofpoint-GUID: nMgWNSpF1n47CbPFf89gfL5eII9ayNzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MiBTYWx0ZWRfX8rsdRADPHz8s
 gSgVaE2TjP54NoFS8YxLw3qVU3MGYCVriN5SjlkKhWN++GehCWYcG6G+jwNashSKdMi8z0DSBbT
 MTZ9qZQMRo+cSOqiGFh0dvQ16EOcBgRimjYaD+L3J8pV7RcmrKVid/WilExAs2Q2bvQ7YsIBSss
 dgUREIOwsz5zHlDr0RIF6dzMOl3Zc8AFlkEDVF3slINUJToOH8a3W7vIKob7RPHmut/aOm/RntD
 EdnTJ0j/sRKsUaFIEpH9RZAqwhPdlR6zllmf47l8UcUE6xxC6fNgt/yOZb3UP8/lBS2hSV28ilR
 pWdxufQzXIkNKXfY2AdtLAhwjlCnBuS4D+993pSf9qdxR3AdfZGcM778yg7mPk9ppmTlzaJoodB
 +jWROdMkG/ijGmFQMCj6JuBg0hqXKMVbNw+/3ZL9e0twPz4IBtAD73HtjwDQmK78wnU7epWfHYz
 Ib2DZ8j6yYbBNsz14gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010152

On Fri, Feb 27, 2026 at 08:20:17PM +0100, Nicolas Frattaroli wrote:
> The atomic_get_output_bus_fmts callback is used by the DRM bridge layer
> to recursively select a suitable output format in a bridge chain.
> 
> As a bridge that outputs to HDMI, dw-hdmi-qp will have its output
> formats determined by which formats the platform-specific integration of
> the hardware supports, and the chosen HDMI output bit depth.
> 
> Implement this callback. The returned u32* buffer is supposed to be
> freed by the caller of this callback, as specified by the callback's
> documentation.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 64 ++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index d649a1cf07f5..4556494f9bb1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -11,6 +11,7 @@
>  #include <linux/export.h>
>  #include <linux/i2c.h>
>  #include <linux/irq.h>
> +#include <linux/media-bus-format.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -749,6 +750,68 @@ static struct i2c_adapter *dw_hdmi_qp_i2c_adapter(struct dw_hdmi_qp *hdmi)
>  	return adap;
>  }
>  
> +static u32*
> +dw_hdmi_qp_bridge_get_output_bus_fmts(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      unsigned int *num_output_fmts)
> +{
> +	unsigned int num_fmts = 0;
> +	u32 *out_fmts;
> +
> +	/*
> +	 * bridge->supported_formats is a bit field of the HDMI_COLORSPACE_* enums.
> +	 * These enums are defined by the HDMI standard, and currently top out at
> +	 * 7. Consequently, BIT(7) is the highest bit that will be set here, unless
> +	 * the standard runs out of reserved pixel formats. Therefore, hweight8()
> +	 * will give an accurate count of how many bus formats we'll output.
> +	 */
> +	out_fmts = kmalloc_array(hweight8(bridge->supported_formats), sizeof(u32),
> +				 GFP_KERNEL);
> +	if (!out_fmts) {
> +		*num_output_fmts = 0;
> +		return NULL;
> +	}
> +
> +	switch (conn_state->hdmi.output_bpc) {
> +	case 12:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB121212_1X36;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV12_1X36;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY12_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY12_0_5X36;

This looks like very generic code. It uses bridge->supported_formats
only. Can we move this to the helpers library?

> +		break;
> +	case 10:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB101010_1X30;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV10_1X30;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY10_1X20;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
> +		break;
> +	default:
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_RGB888_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_YUV8_1X24;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYVY8_1X16;
> +		if (bridge->supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420))
> +			out_fmts[num_fmts++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
> +		break;
> +	}
> +
> +	*num_output_fmts = num_fmts;
> +
> +	return out_fmts;
> +}
> +
>  static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
>  					    struct drm_atomic_state *state)
>  {
> @@ -1192,6 +1255,7 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
>  #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
>  
>  static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
> +	.atomic_get_output_bus_fmts = dw_hdmi_qp_bridge_get_output_bus_fmts,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
