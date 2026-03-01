Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8FA175A6A
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 16:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772384313; cv=none; b=TGyf8PvbF4rHTbeIlgiaVrd+lfp6lOoH2ShLFZkfdLbLmQK2iyb3hsFMCHsZnes3L+VNq9lnpIoS4FtwaIu1P38yHC8efYmYk2bwj0iiNpGFve8wx7LZ7mwt0Lg68Fn+Ok0H8MK85qoO4zyKAUlA8tkgAWKkKZA9Xox8IecfhN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772384313; c=relaxed/simple;
	bh=yFuGB73T7yRzVZYJc0Nn3Dba3q1AORa6PLskbEp5MeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJyMYuU8wt7qPWSpGIwbr+UZ1K7Aaz67P3LPeTyD9a5GNpiTFqoLhpb+z+lZC2Zr8U7TobpOpk9ty7BoCvOmRjSO0pJhYBa0Zoj4s2UXpCfqcXFrrzhyQnlLQ+qL0RBmtHowcbL4sbK2j2zQ31dF7aqepPnkHu9STvVctetnR1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkhYPumS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8Eqqh60; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkhYPumS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8Eqqh60"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621AHmom944323
	for <linux-doc@vger.kernel.org>; Sun, 1 Mar 2026 16:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yZjRbJ2gpSOpi4BD2wRxX0dJ
	2Njlip5bE4IRh4tsp0k=; b=fkhYPumSL/QAlMbXMLtEWChiX97tIzcJ8VeBIX4T
	7342qTqQUCnt0S7oDq9sQfzhyGpEUUJellGBOuoJYTfsmMFHgnXodEk5AC55z1iG
	c18u06r73+Pdj0npRxhtTGO474kenLYedhcwWpbRcBC3ivwUaTrgm50Dsqk4R6aI
	+2cwuKSHZdg1z1b9ojEBXDyD89t9uzig7w2KMFQb1bUwamY01WeikQvsTWQDMhlM
	wS7Axd8o1A+YDbnxSksJB4wZ0i060owQOeU4T2ACD8MJ4tYn9Af87F/Z+bjux2Vo
	fOz++88nKgW1Zk3CTwm94ccFlRFF5WRpv6fuV0NvlWcAeA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq31bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 16:58:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5359e9d3so3369077985a.2
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772384310; x=1772989110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZjRbJ2gpSOpi4BD2wRxX0dJ2Njlip5bE4IRh4tsp0k=;
        b=M8Eqqh60LAk0fFhTLGg/jl7bE3eyBHVFH6y1umtjUHYw4QysQapDKFE4IltUbqjc1b
         9eXivjkDVtJdYoAY01RtLWHIw8RteEVVU1cWGXuMYt7Z0c9xjI/2gDUGCaLRGS69g3I0
         eukZQcOfA9Qhpsyj8UyeEbAnzY5EFhWRbOK4pYp2S1Q2E3sM/3aFEkhc1o+BYo0iqJgW
         RLSRFjzGk8VfXIYUsWE832WG9BupOfid2oXgKy6D+N/soTHzdKkqh0cyuhJV3VwfvHPW
         ZCiSfHr9EyUXp1g2fi0Ln0+36MPYfPtkFMvNZxPNcTjfskbyfmXsFEgVxCSs6xAio2fn
         iaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772384310; x=1772989110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZjRbJ2gpSOpi4BD2wRxX0dJ2Njlip5bE4IRh4tsp0k=;
        b=DVZIeRLO2q24CO56AomdNGWtU+LWXYRQA6hYPRCxW8H9F4s++g1PHxwgpWlXi2SWJ5
         rH8XTxX2UVhS5EuSwz5qP2d7j8RJz2BRjxK9QnrxN08MQYlucsT0jH7HkpfkV3QXybZ5
         s5CIlIJ0Hd3lTyGnBYU9WEqbVjgUs5ffeHbglfm9lsMNLAZeLbq2yV/Fwj06xjBuKgBA
         Dwb6CFTktf49i+nGljTedhThGIwBA+8kSXML76VF5/GLFgBjpX4STcB/CIFv577WhxyO
         cNwGgVFmHuird8+TAzha9EdPv9+AH5a7MWMwdcEcpOZql8iqVBxaM0q4MSIvZXSj0+bd
         py2g==
X-Forwarded-Encrypted: i=1; AJvYcCVT0mdJzqfjWJxogDJYwUpV6+wimDmJhoPaqj9PcxDMbaTyWIo27AY/VqBEwPMphmBjRwqOwSH1my4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl37rE5crvd0PZRKHor2NRUnW/SoFjGb5ZWMDeMsVZG1nOlGFX
	PufJ05zn5R0WARC3GfROUmYU5VbvkKAVN+i6HK5RCvCTNynlr5YIhZCiYw/91i5mmyGIBhtg8wr
	7vJcyZsJxJWXeuJ2YpN5Sg9hxZQokS0VkOc6k3a8W1NuWpuzsDbw6GkLetVII5QU=
X-Gm-Gg: ATEYQzwRKTGObZDwEl2CTbxSRRzJ69DwzbxAvRBUpQZg97W8vGe436qWYumaoslW+aX
	bNolvFlaLxufAg5sAGU6Jlma6cjfLvYpdblodI8sCQJBvg/p95TkVJguMMkquFydQZrxjbAQx3T
	3bPCUL8A++q5t9LKTk1NrjA1fvAPb/dPeWX44OjlY/ODb2qQQ6g2J64iBUTz3BM1hzINTMq7X25
	SI1WgZM3EX0tVa3r5vVGPCtybDZo0QUWLfM/mqU+mYCSaR9Wd+1ZZbx0u7jqkRlxvI9Li1EYRXf
	tLQbjZXLjqXCNvGF7Lz3dJxmhf7UeJp8j5TlIhBN1+KJWMr3fUMtYjhjI8uHcS4qlqxxo21/fwy
	Uj5y7+3MCAKXguAr86NthhEhJ2AGNuSfpghJmVSIAaBN/+XKe6d0sS+XLOhwPXFRE2kHjTByQRy
	vdWaN7drZrp1tb1tbwxUcnI4UIPoRr+HPbUzk=
X-Received: by 2002:a05:620a:3952:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cbc8e4b725mr1252711985a.38.1772384310449;
        Sun, 01 Mar 2026 08:58:30 -0800 (PST)
X-Received: by 2002:a05:620a:3952:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cbc8e4b725mr1252708585a.38.1772384309937;
        Sun, 01 Mar 2026 08:58:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca0dbsm1204999e87.41.2026.03.01.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:58:29 -0800 (PST)
Date: Sun, 1 Mar 2026 18:58:27 +0200
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
Subject: Re: [PATCH v9 15/19] drm/connector: Register color format property
 on HDMI connectors
Message-ID: <mxfdm4rrsizf3jzjbeoxosb5lhm2wrzqipn6rvly4ukrodltgp@vcu2fkgwagdx>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-15-658c3b9db7ef@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-15-658c3b9db7ef@collabora.com>
X-Proofpoint-GUID: tSXwUuMAKBjaTaneBWy8-L9zH-42XcGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfX7jzO1qrg7tVZ
 IVvJTJRaaMIi+QthUzx01Xbg/apKVfzw8o4wzRTm88/H6mZpAIBF9XMcbsLU0Tn6omDHeDCwmSU
 KQX8oPdvDAC4lbT+OZjyJGrRZqGGfb9UWe1BmX0d5W/hGAbm42ViDmrl5zVejR0PfwBGS2vNLEb
 zWb8XrXJ2IMNX3T+K9gIbWVsHXKSbeX6wFS8EYwR/eL8jUIixrAdralllETWcxwptL3gX6eWsfM
 69HpM9oYgcEa7mEKQZOxjQXdHepICfvQ4QE5z4gcShmUbLJUL45VcP48nwL1Y9aq5a19OcARoJB
 1qiiXiXOq8utcbF3DsqB8jJDen15xcom06OOZjG4nbAdU/xWWh+PuA1hY7g4sjA2FpKIXk0ABxw
 PvnTFrJgdVP9xVxlj1Hob5Qx0Iz29xMZlIGjewo7exjW+Ws0+lfjIQx50svcGq/YJxOKXRsqZfb
 xAzO4IGEUXxfhw6WYxQ==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a47037 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=QnxT5sWzqww7kDut_5wA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: tSXwUuMAKBjaTaneBWy8-L9zH-42XcGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010155

On Fri, Feb 27, 2026 at 08:20:20PM +0100, Nicolas Frattaroli wrote:
> The drmm_connector_hdmi_init function can figure out what DRM color
> formats are supported by a particular connector based on the supported
> HDMI format bitmask that's passed in.
> 
> Use it to register the drm color format property.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a4907e15dfc5..0f4e24446a9e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -627,6 +627,9 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	if (max_bpc > 8)
>  		drm_connector_attach_hdr_output_metadata_property(connector);
>  
> +	if (!drm_mode_create_color_format_property(connector, supported_formats))
> +		drm_connector_attach_color_format_property(connector);

It really looks like:

   drm_connector_attach_color_format_property(connector,
					      supported_formats);

> +
>  	connector->hdmi.funcs = hdmi_funcs;
>  
>  	return 0;
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
