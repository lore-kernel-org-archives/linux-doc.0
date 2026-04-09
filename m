Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38837C929
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 22:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775772590; cv=none; b=TDtajVsNfnrqA7anWwshnG/29vTS6gyr9PSPu9op5RdhpDOgPXK9E7DEm/N/cDrIyzpkkAFuvx5HsXETkzSh/decqLjF19Y0Mjzy+FO7mMJgnvIvz9Lmsfu/HTq7+wGWjrsnTOYz6cmtgQmOybhrV9M5EVVRzrR/V53eVLIxBrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775772590; c=relaxed/simple;
	bh=3O9HYYYXENEoq1DH0ni4NQh/02ZA12vuqr8Dn6eUeeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqlEaMkgRHj9A35g0GOCLmhcB5EztmUVbyzMaX5pW1rbq+8LY+kbxitY2ACVHYLtgn0PJ0vrrqaSpw1PucJFUsrnrMFmfpWXC2tOvxCBT5gPoN4mZDoIvoqaE1KN3QVCRE0i+1QSTynmay4qKo5xxTTcZaE1T5R4s4aAPCN0KEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuUUUvjC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7RvDDJS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuUUUvjC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7RvDDJS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KXSvw1972547
	for <linux-doc@vger.kernel.org>; Thu, 9 Apr 2026 22:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YfJuQz9x8+CxrVM73ltVMfSV
	gvGLqNbpnCkk5PUIX9Y=; b=PuUUUvjCOM0tKgt7LJ1qBH0p9464Id/g2CTihUW6
	mnvl4XVrXpir4kmhZe6PEPhrY2LifZYgKW5Vs6EsQpcBSOYHXg1Qj1pNpTXcde6f
	kqC/0hxc1bmbaxZJk12lYAGyEepI0VUL17eWKI2HMN1YEO69Rxk/+NhpmD2mbKdC
	RAn+udXOl93lD6VCGjwj5gToRo3qW4hyn8RAS5ABwmpJZRNcsk+6BcKVIIqneCNv
	Fds3WuLPfhtdaaE+dZgGvxowXegESy2mTHichE0SN4+JbaDt2MaedRKV6E7N1F95
	e6bJUc+D8gDeAN0BRI9zadJ/LlMYm84sRag3GrQIXXQIcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1uax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 22:09:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b274f94f8so30498611cf.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 15:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775772588; x=1776377388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YfJuQz9x8+CxrVM73ltVMfSVgvGLqNbpnCkk5PUIX9Y=;
        b=i7RvDDJSWCSRZcOEcbUnic0+Q1Sz0swoEVL6W5oqu67tlQOfhxHkBmDFo/RdwGMIf7
         tf4FEV2cGmZAqLt9bEsv35KtXYABNZEt+mWxeT9Fwc0mJSzNlpgAs3IaWyxjjLjBPBRm
         zoCQAiQVTySzaYTBdxEs5Oxloqj6QpjI/S32gAm/CKpGxJBrLaRc3Oo+N5EMt9b9Jhuw
         SPF31cnPwDNpj+W8Nlx7XfzotIg52kEEJY5wLSbzqNe75H2cAKgH1nFcMzyyGvCUAC33
         /8b925atk/jzhkL3osubIxb0TabRM2Kv8u3QC/sRDTLscpjHxTcg07yvEcTr9wV0BMR3
         WP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775772588; x=1776377388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfJuQz9x8+CxrVM73ltVMfSVgvGLqNbpnCkk5PUIX9Y=;
        b=U5L8G2GSfpTyBRUrua2ROLezNbJe3TeDJUOc4ANyTlDNwPvuBrOH0OAYzYFTzceOkr
         dBNiQK7UPAd9QW99LB/PqGCFIRv3eJFITtiZt7kKPI2P8sE/vVdbHeMdN4LBamUcnjps
         xW1ur+OGOPjVGGlRikV0iKyd1O6nrqXp13kQouIePOoG3HqW+pED0g2KnAoYaCDni+vp
         rRTady8ZHTrJSq5JG4RV4Vt9WgXynyQBqgxVKgQj7YkMMBmYuVw2oHi9I4bR1SCO7NLz
         zkUJu7Tpx3udPeJBGukMSwoD9ncFgQEbR3m8QFNnV/yOVqsLnAP78oenFBXkGKRyD254
         bGFg==
X-Forwarded-Encrypted: i=1; AJvYcCUdhwwzSVytq6kg/s7w7oJawh9g6fZroI0Yek/TBWht9iQaSrBYJisMSZLEh/N51w55PTP556OjxsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiHpZq9SiDCSjFEIS1hHolu7rSyeZs6p6hDx6pODNYAwsCriYY
	faR1G9nYtRYwIQGJInBMQ4RJbVn+/P7fvb1CCg9gnmKtPRB7ECqqU4vOHL9Pnf4bg3bJLyvHURP
	fqRALS5HyPlfry3GEbO6g99EBzW5afiFKoEWwe4DEfjaP5K3t87EqpOfnnwz37NQ=
X-Gm-Gg: AeBDiesXHsTqmYWSxcdzSJg8cV8LmBdSHx5YTalpXtLR0nKRQ+RINwsfFABjXgqaMF7
	w3nUbLxVnFmLclqseNQ4quEmv83nLrY8DrXTaXh56qrmbFMYpJQlmjwq7PI/0YlLxbOax5TQ6Py
	ealjSzYDOZx4XkzpD3If1Y4rY7jo5v016a6xHNo5ViRMBRYTJ2sguvpS8wd/kiKATwuLXp3prG8
	f4UO4HqFYzvVnlGiuayDUI2koHpbkNvn2qvpPEZRMHHGli5cCtADnSsKO1SHwVJHPAytM6mxCtC
	FGZ87Px62OZ5kDHeqz49COvpy/aBSFqaHcc3D/5OLKUiAxDBCfgCB2Tmyp0P84gQi1nkGSaDt3V
	VzmKiKZEU6FcGxoiQ7LkWo1NxvXO7J+ed/Zdta0rWpU1YsJOqkwNImxy7C+dSy6C3K5wbohSoFa
	gnfL1jmuB0MLPGP4h2mxKsIFVvag1TeEZpss8=
X-Received: by 2002:a05:622a:1181:b0:509:1657:a19d with SMTP id d75a77b69052e-50dc1a1ae94mr71687121cf.15.1775772587608;
        Thu, 09 Apr 2026 15:09:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1181:b0:509:1657:a19d with SMTP id d75a77b69052e-50dc1a1ae94mr71686661cf.15.1775772587156;
        Thu, 09 Apr 2026 15:09:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefbb10sm195693e87.67.2026.04.09.15.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 15:09:44 -0700 (PDT)
Date: Fri, 10 Apr 2026 01:09:41 +0300
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
Subject: Re: [PATCH v12 19/25] drm/connector: Register color format property
 on HDMI connectors
Message-ID: <kbbkbobybjismej7wiogvmpjdju5zyfkbbwyuafxeajmasuzzv@3ksrtmmvsa4d>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
 <20260409-color-format-v12-19-ce84e1817a27@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-color-format-v12-19-ce84e1817a27@collabora.com>
X-Proofpoint-ORIG-GUID: 4_hq98QsLQrLlINiWi8SE5jLngv90qRc
X-Proofpoint-GUID: 4_hq98QsLQrLlINiWi8SE5jLngv90qRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDIwNCBTYWx0ZWRfX5m5zR2AiKLuY
 XYG5HItVftbIe+9yFvaPyTVJtND2BPGi9+6z3xa9jBywOx21RWBwD4HhADTSTErTgvqiDB9HUlI
 DOO4sUJMJ1tHPCTD2rG6hCnT4cLy02350YS9AM4IF+SwOGLDY29j7/M086LqFAN1v3WVB96Oz2A
 zON0LJGKsZy/FBT9bbJFkLW5gyup4kbXNaHmkek8hiYLYn2TU08ZbBTm4k+Pul2TU6iSlAjM6M7
 7EGTzlpk3mMRMY0N66CWrC3VdrwyzIGC/0eog9wY2eJzJbUvnuwVb7xHCdELbEzBWzyfP7QXZXU
 llIAzQ3Hj/lcu0g/LrmYo4bPSH9KrVnVXyMu7Ijp+7j/Sp4BI6IDUizfl2GB7/taeTH/AXR25Md
 DsGWEIw3Ze3DrrRXrXG3ECPSqUxzI89a3bLzVbVVNZMkg832ITefHVamWT5THEYuLYcm9hNrYUj
 c/a5Di0UZl3xl+U2f+A==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d823ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=ZrIce4Gfb_NoB2EXF1MA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090204

On Thu, Apr 09, 2026 at 05:45:09PM +0200, Nicolas Frattaroli wrote:
> The drmm_connector_hdmi_init function can figure out what DRM color
> formats are supported by a particular connector based on the supported
> HDMI format bitmask that's passed in.
> 
> Use it to register the drm color format property.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
