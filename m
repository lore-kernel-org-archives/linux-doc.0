Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF0F2C21F2
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772383754; cv=none; b=cht/bOLjZZ31QCq31ZVEqqRgrxVNiJHDisZG+sA8ygHhGoisqVWMofmcbzg7OUyWLS2SKra6l8Pi+/KSp6B15qhczW2WwY9TZ5rbFsz9cmfxf6l1YGjkDS993CApnMjo/DbSypM+ZSxejq4YBTIYDFFXgJ4Cji/ZVBizkH/Pg40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772383754; c=relaxed/simple;
	bh=nJjccDjV8UO0tMR+y3czTwz2bE49w6xPBx2j11L2gZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osxH0yExMHcCmwbY3hYNr1vMWYiK7ugJzgsQHUSC9nRNGiohRP+HHuqek7m8X8KGukIqdcheDgoLVY2bL/jbpIPPCsILDhx2vlZ2yQRJK7dPsQIre1y5Dpv6pG+j3lUs9pAhWx3BrtUmwKbtpn/doN8/grqyoHjd31jReSC5uXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4WFzvr7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6pYj4Di; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4WFzvr7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6pYj4Di"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6219HR4u692882
	for <linux-doc@vger.kernel.org>; Sun, 1 Mar 2026 16:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dSllOkKEfDtkPszOpUxSs26w
	5scwH7eQoWJUjkkZk+0=; b=S4WFzvr74n+UOsusIQV8vroIg+2n/ZWGqD6P5I8I
	2QnM8/qHBqWY7ILgw/yiAvzWx2qubCHOnQ0vsX5ZwC28cc3zn5dc/5KewkUHerbV
	QZZW+NBsVHblGZuFL0vr0vV4FBjPUbU65Zeg+xCL7ugVV5oZZpgnU0KHM+4rP4T7
	RzUxQUk59lKRg+E0hMuAkjfRNqBYMlWRSO1Es3UCGXt0OChZJrGKGFssr4tyDNqg
	OzXVptZm/MnRSTytiWYP9Xpe4HPms2u9CWCNhehNOtxetcz8Ixh1CZGH/mcLael2
	5065GNEayH87h4/uFtcHDWZcrDtLuJdAzC8C101bS6eCaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg72wej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 16:49:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ed6c849so3055201385a.1
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772383751; x=1772988551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSllOkKEfDtkPszOpUxSs26w5scwH7eQoWJUjkkZk+0=;
        b=I6pYj4DiPRmL/BOB4TdAMQA/50eiW4t4W2jc13iVuuHnMxnarr7Sx0uFjVQvQmPSv4
         Fw6YfjvOHrKQydE/V0oSAO8g5m6qiHBG/Zx2Rf1tVP14SE/9+dFi9mofgoRt68709mqC
         DNSqBuaUKYhFBgTGBOMAm5Wgg2PKLtwQM1W52sivQkNL7tlPwA2EIY13WiwSwogxptXv
         idnIP8kl+4fXMysyvhu2+YuymRPO7t4kaQ+iwiTbKVU/AILHzD2S+NmfMMip7hnep6Lk
         P9Z/l6z6GbWNOFN4g9AguFxRn4Di4wG+gMA0mttmvdJU3qlbmFGMZX3vbrL3jqBfUwXn
         tJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772383751; x=1772988551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSllOkKEfDtkPszOpUxSs26w5scwH7eQoWJUjkkZk+0=;
        b=w1+tYw7SXs5O+6aIzticRRjC2ygLhL9uqqLZz1CFMHBBZHFhbwiOeldUsMawG6/ppH
         2uy2XFRS2fXr2RfntyxQ9/rO0jUz4ezm5WrOOs/Rqw2hmhcvSaR8ReYHBqMab1eK+bIr
         wi5tn9afXn4dmTAdppzolOLwMcDo24CAGkVC7ihb1wo8RVXxAlDXH+NMGlH29fTLSgn+
         Z3Ul+ltMOV+OouzvAL5IpdzRZqy9PwcFBHBixPFBe9sZFqRTJVgUZHdVq7ieljj1FUto
         rl1E3CTKatPRslx6QgsPw5PAOTjrga4VozEZO0c5OAyXu0mcUtWpbGuKZoSq7FiF70iz
         cdeg==
X-Forwarded-Encrypted: i=1; AJvYcCU7GR3Ar3mUAJIRPSeCbGUJLu4WhGDifIvR1UnMy9WjgUYEnVYdEyQiaSNBendfZFz2L8TgS9gHddU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpeEcl58STinWjx9+JpsF9+ePGBvnztoeig/Qq3jAWwWX+CE9s
	+3rvc6B9gPhUCYqn7Yt5XC+/ySopFBTS9tUnhv/k5VE72WqrTJBXOBcbj27Yot09ho9D0K4Oxum
	eZJ9gkiwiFaSFHmKKGC3X+xV8Ha2s1tcqT7kUymeNVnymV4e16UGFfaZ3Po7Sxro=
X-Gm-Gg: ATEYQzwBme0PBeFGFLRLlhnXgKTEc/NG7dnxlG/oZeR3GcShAROCYW68qVfKPyVeUHk
	BvXx+bKOQjlbX47kSXWk39qaodpLLJ1W59tUAzp4uD/hBgDZhF/q2JMOl70yzhPQrzH0uK2pIco
	HFTi4meGbAAPsA9diWNzAqgMrB3aoQ+zl69rARpw29H2bRm+b9/M8roiZ+/h993kADXH7WjvYgN
	GiutqLX8tZpAAK6eiRbiOl4jWEJ31AzhJlxCpN1nsUrhGhCzmY9WlgKPB/fGzfSSZESRpUOsf9e
	Updt9ZAjNsPsB6R3ESkf5Ztz5rnTmLxTdEc7ZGfSnHVeSO07KJAwbw6SjfyRu4Qof5BgdmrP78u
	uz5/Q9rl48BAD+ceEVqMQ1nyMx2d2DwdNEk/yYpKL/LdzaOFUaqA1YvsqUiE5oGiGAhHtPn9fp8
	5Z+/BFwjO5M2VUoBt6o0bTOjLRVtTVzSmu2fU=
X-Received: by 2002:a05:620a:2901:b0:8b2:598d:6e66 with SMTP id af79cd13be357-8cbc8da8ecemr1218261485a.22.1772383750691;
        Sun, 01 Mar 2026 08:49:10 -0800 (PST)
X-Received: by 2002:a05:620a:2901:b0:8b2:598d:6e66 with SMTP id af79cd13be357-8cbc8da8ecemr1218255985a.22.1772383750077;
        Sun, 01 Mar 2026 08:49:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f301788dsm21899311fa.35.2026.03.01.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:49:08 -0800 (PST)
Date: Sun, 1 Mar 2026 18:49:06 +0200
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
Subject: Re: [PATCH v9 05/19] drm/display: hdmi-state-helper: Try subsampling
 in mode_valid
Message-ID: <lw2tdcwu7yathstby4a5tx3ys6rruzeg3odvnsjsgc75sqycun@geoqspu2sfpv>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-5-658c3b9db7ef@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-5-658c3b9db7ef@collabora.com>
X-Proofpoint-ORIG-GUID: 9mwjQ63Hrvm1PGCrzBW4U4pMpQAifoTh
X-Proofpoint-GUID: 9mwjQ63Hrvm1PGCrzBW4U4pMpQAifoTh
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a46e07 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=CpXNCzN6O6rfykjMCtIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MyBTYWx0ZWRfX/m+oI8692Xfr
 kNUAyOoBu8hxhU9AUlTXH/CyAntY8yx+zQD/QJ8EWttCdNQ1LTFEMzgz0CR1i4EXICsq4yhcVal
 etojaUtOBIn3o3qnOWWYGNlXIbUhpVlTso6YYGKFht+91dhXyYz+m/9Vf6JIJT+zTqXKbJg0VLc
 GafrwqOfm+4fcKhlgfoKpDtDzsf+lJ/KzXhIG2XBBQPQOqrznCWfum6cvxK7yCYdEcO/oKRzbQK
 JlV/EbSFG10dikkrkf2rh9jbJggILr5VEF6YCEz7H+ULmX/PphEpUeVJVkLeJ1lNv7ouSNDWanu
 ZnA2ETJ01eAHZAF2rpmJWklhYRE02ikq+l/eff48f3XickvbmvPvhw5iLOytIrNlYwLTLrqRZV0
 lhGJfCqxSGGMkRof6RCdGiuhmqoH6qqYbtB2r4GYGB5C9YxIKzpgFOXrL8m1FgqW/AwiMqFIGe4
 klraDCUJF5d/oHYIK9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010153

On Fri, Feb 27, 2026 at 08:20:10PM +0100, Nicolas Frattaroli wrote:
> drm_hdmi_connector_mode_valid assumes modes are only valid if they work
> with RGB. The reality is more complex however: YCbCr 4:2:0
> chroma-subsampled modes only require half the pixel clock that the same
> mode would require in RGB.
> 
> This leads to drm_hdmi_connector_mode_valid rejecting perfectly valid
> 420-only or 420-also modes.
> 
> Fix this by checking whether the mode is 420-capable first. If so, then
> proceed by checking it with DRM_OUTPUT_COLOR_FORMAT_YCBCR420 so long as
> the connector has legalized 420, otherwise error out. If the mode is not
> 420-capable, check with RGB as was previously always the case.
> 
> Fixes: 47368ab437fd ("drm/display: hdmi: add generic mode_valid helper")
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
