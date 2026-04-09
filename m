Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F0386C29
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 22:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772547; cv=none; b=jYgpDp6jJkROU/pKCY2ESGrFRh49DGFc9Fb6UEN0ny11l3NIiq7kIZ7l3uKH0jBd09YU002L5C5b0YGQL1DzwEats9508KEfxQ6FCz+p5lDaHwSr2j1Q2ktvn5NDs4OxvVcyqZYYhTv0GPoPr0WvwWzjr/e32DraDhYAD+0Mq1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772547; c=relaxed/simple;
	bh=9Jdky7bHLEv3/VXglkga+uQMaT5T396Mm8jbOeHnl/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/UFxACv6n+gHDqb5hiwjzJkTD2l2pJSxYYKfR3bP/LxfZDpsigr5fxLpscUZE+nfigz/bOXoECsSHRpVAVuAU75fHO71SVI8bOkJqQpq5QqclONI1VDCd3V15gSuTv3z0klU2Cn9r5EyB7wEe/8gTBZdURaVSreyz9PsPdXPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNv/mPHE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/5sft8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNv/mPHE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/5sft8Y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639IIAZ3779509
	for <linux-doc@vger.kernel.org>; Thu, 9 Apr 2026 22:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0HMFaKZjpgyXaau/0X9Mxm/w
	GN/42VWp/aAAASGyGoc=; b=kNv/mPHEw/tFjVBnkayEOYmjoDA8xsri9s1Fx5AI
	j1rghVQSftnAm0tVvn+YyX5kR6NxS6O3dSqWEcQ/9lSZ+hrdwdG1+gilPhovXIoD
	gNr0mctsDpiBtOOepvYk2JQV1iPFChb/nlhXUGmm85iCETuMErjbBM/gwSw4nRtJ
	TuhcWuPxw7Wm3KU5go4mRE9Jh4bmK3YUSGd4dmcq9UXo52BVx7jxPFeFAqhdLoqA
	hqNgGZhxbOWpGXFD2ueRY9MHdyKwFe7ReAxa1BSeJFtvdMjnD+rEtIyQTkwTnTcs
	gX/v09P9lvNyi4ZmJgZQgtoEGgqdjnNr002UF6Z1Acb45A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8ht25s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 22:09:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso38542581cf.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775772544; x=1776377344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HMFaKZjpgyXaau/0X9Mxm/wGN/42VWp/aAAASGyGoc=;
        b=H/5sft8YybFzVCJp4JMvFBV0o0sPlXK0JhD1ouZznUDPQOA+0b54Zhgtj/KodwKlXm
         0E5PiPozowW8HVXLXxdgTQUCoTTOF/oo6jmCZog6EBjTpgXmq+pEG+WfhUZaEHSE/Cts
         BOnxJWHFjq8vzQau/7KF6btY7EyH0WvUmMzWyBWYIBo8/GiTb49bqzxx0Z10nKuszATG
         58i2Cboy70WFW8RDxffbUSZjvxwV3LibcyEKnBRIFCKr/VjczKOgusu77lOUYMS5W8G9
         TK7D8G40kesxxjMEFq+/DvzruVhwXCz1sXkRFFNhMbCbIe+xocgrlY7of72uZKtxbU7O
         R8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772544; x=1776377344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HMFaKZjpgyXaau/0X9Mxm/wGN/42VWp/aAAASGyGoc=;
        b=r5SS51GH+CSM3XupA7d5a4tQRQtdMntwIDW7RoC6/nl7TqVp1Gce7C61Jy7N4hibYB
         XdWM5BkW8HVn1qUCpMl1Ebij+nBAY2+JXgkNDoxV1KCIEQdZM2UBjDtb44GHy9xXvjMV
         uhkVvzV1QFn6gsFnJV5I5M9tbeGJQhSPqfjmrAZsdmjFXkGaTQ4VBP32pjhwvLGl1wta
         7kv/mGKaH3keDOoT3hmp/XX6IvGpLm9TkhVN1yREWrgANTm6YWDsIsMVxsG9MFYIILzt
         /eDCRiIeDwQd+hyND8prs52TVgLRlugmlFbS62DaZG8pcpJfQT+DbaUgUiokOVaK46eD
         W1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCV/s+ODgTRPrJnni/5yUGrKE1lScl3HLMqNDTdSp/ers4YdydBx/49EPPPAEv4jsEsMQ4wSnalY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2eiXzrw1xSCD1zT5cqN2l/kTDibKndbHNoGThS+MAPHgt5mQP
	hjYzAtWMj1U7NWECH/tJ3psQJoqPxWKuViwXPJzim7wYvS+yEy6RCBPRv0BsddqooDZ/gDAqoiW
	kijEZG5+spe2/EaNJEJk5Ib3dTttNwYxTRi8H99PV48cYkJQmaGiuAyXNXoSxmio=
X-Gm-Gg: AeBDieskyBgPoUWm9lN8sy97ucS8sR84UaftLMF1hCXBZTNgHsh7jZlVrbocQA3DMiy
	T207imwDJ3/303snfUK7MbEXkAu2OYS8b6wE+K39H2DXHMA7IKz+AcjNXQ2CZPguGKhu/ycfSn8
	imORqIJSzU0zOlJImC/2s99Pr1IncJAyZ9n5Z0SwCSPiUpvN3xCn5aD8PS+bwroSU0OE9Z2SrP2
	FGOXbqQFIpJb0spQx0PJtE6Cf9GNu5j6b6QtDjSd3TwK/reNAHKjpR70ppaXFViIYYP4B1xQCEa
	6yT/rgoABBd9pNf7MgZos+XIQRY1ovDgMy/UQIkLVhYwZmobNY1MKdOP1fsGrpex/2GM3KZpGWG
	qKOR4KG8U+p8+/X960fWYdmopsdsxVMIaIf2ThXf7eUtGDsIyCvh6VX2UKSW8HVnTtxcPJ2XsQS
	4/c8yBjem+1DWE5+ksFdKsx95I9jMpBYCqwCU=
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr15604211cf.22.1775772544441;
        Thu, 09 Apr 2026 15:09:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr15603721cf.22.1775772543912;
        Thu, 09 Apr 2026 15:09:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee864a2sm196421e87.2.2026.04.09.15.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:09:02 -0700 (PDT)
Date: Fri, 10 Apr 2026 01:09:00 +0300
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
Subject: Re: [PATCH v12 05/25] drm/atomic-helper: Add HDMI bridge output bus
 formats helper
Message-ID: <47l6v3hxfnl75heek4o7fmhybafk44ewsrr66sdw55ahjv5oof@sku3nqbhg2tx>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
 <20260409-color-format-v12-5-ce84e1817a27@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-color-format-v12-5-ce84e1817a27@collabora.com>
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d82381 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=FnALt_FR2tA_ePdYDbsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: iNdXNa_K1cIg0KnvsloODqWpjsHsbfBv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIwNCBTYWx0ZWRfX3fuP2zW4I2WQ
 lzhg03DSdtUSx78yw95dpiqMzdbslmmMCr8HxHKQZ0uzI10fH1CvYYEAq3S0vzjStd6yyoQnjsF
 hnOuPH8EDuJvghFXxsBIsCVLN5bsj+uoe55lqQU6Hhgh9AENQu0Dd1C4rklbGRRNL13v9KkxeDV
 qkPcXENOVOs5xHa9iyAU5SU7wgL6j0fJV6FCJAGzam0iUKyVUpPpviE0o2Gv5Br9V5QBOBWYBae
 8uc2K30nTB4ibY6YlrhSRswbWdNJiBCDTwj47P/G3cpZjvNvMBkmxhMMCHUslOYmbiheXru4bAm
 s+qJTKadWM2f9hreWOBb1NnX+bxKtLKiD1G5d6/hENy2s+jP09YsJam3QID/pCWhRWguGaO9usJ
 mCVYq4ZY+lvtcuG4f61DChI3fBokOUdR52L5LQAL5km3E0KbOQnm6Mvqnygh0bHADcrEdrBaKIT
 ODlrIjWQ/BVbrcdt6HQ==
X-Proofpoint-GUID: iNdXNa_K1cIg0KnvsloODqWpjsHsbfBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090204

On Thu, Apr 09, 2026 at 05:44:55PM +0200, Nicolas Frattaroli wrote:
> The drm_bridge_funcs atomic_get_output_bus_fmts operation should be the
> same for likely every HDMI connector bridge, unless such an HDMI
> connector bridge has some special hardware restrictions that I cannot
> envision yet.
> 
> To avoid code duplication and standardize on a set of media bus formats
> that the HDMI output color formats translate to, add a common helper
> function that implements this operation to the drm bridge helpers.
> 
> The function returns a list of output bus formats based on the HDMI
> bridge's current output bits-per-component, and its bitmask of supported
> color formats.
> 
> To guard against future expansion of DRM_OUTPUT_COLOR_FORMAT outgrowing
> the hweight8 call, add a BUILD_BUG_ON statement where it's used that
> checks for DRM_OUTPUT_COLOR_FORMAT_COUNT. The justification for not
> using hweight32 in all cases is that not all ISAs have a popcount
> instruction, and will benefit from a smaller/faster software
> implementation that doesn't have to operate across all bits.
> 
> The justification for not defining an hweight_color depending on the
> value of DRM_OUTPUT_COLOR_FORMAT_COUNT is that this count enum value is
> only known at compile time, not at preprocessor time.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic_helper.h     |  7 ++++
>  2 files changed, 88 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
