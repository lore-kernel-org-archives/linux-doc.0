Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04D32C21F2
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 16:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772383674; cv=none; b=iVoETymcyBN8JVhOle0ZQ4pvhV8o25eBJ/rgzYvNq9h1OzppGJVb7n7te4U8smD6ek7NNDNKKtD17L++aFFGt5XJKdPj59YYceksoUzIKfqSD+vzEfWpOrw4PL2IbjcKGQugjQ9/bG/pHeMkSnmV3dB96xpFGPSXSrsmhINm/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772383674; c=relaxed/simple;
	bh=6KMQO53P0zq9WadHi//Tfvcggz9qnwbEKvKHN+RqNx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKlSofPJDhIrFvX2PoeIOB6ZN0pC7UXsVOzOffyqnBr/PLvZ5RyYNwZALBGHMwxrry6RsUh0ownBJY/6OvBjHtK/tBLATaamtTUU1wuvyP0x3V3RalQoEtRoN8OX1Nx3TQr+oGFJMNLV593sfYsVur/tOrmwNYWc/LSr6SowdxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9k43y29; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2IJjz7y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9k43y29";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2IJjz7y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Br26b2405764
	for <linux-doc@vger.kernel.org>; Sun, 1 Mar 2026 16:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=23yFjRakNDMv9z7eHrnsMfwG
	zCe1oBIgBUxRG3B4w9c=; b=j9k43y29AY/jcOBaZs4hjILMyf4NJhXj35Ds8fPf
	WOCMUgc83CYIceqbax3lqKhzX79Ko+iYQC1kKbPZDfsyqOkPtQI1g5VEsX7Lu/qL
	AxtlMsFmktCzVSbsiJI69w0rNrE7ejK0npefurmC+7ixrdHK1PUZe8EUs5aAClT2
	0dCCX8KR5It6Pr5VJ5vpuJH+eFms1e653wLTIIoz6kdz/S1wGb/5T+JN6GgqOTHL
	S+SDKd8+NufyC2a2lQuyvzgeT7eO/Frd6HF6ueEq71KVMYEsRIOilY3LgMv7z3FW
	WkVeV3lPmX4qJcZAkupTCrsicOZk0I+o6inqX9bWQ9NUlw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshck25c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 16:47:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so4663890785a.3
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 08:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772383671; x=1772988471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=23yFjRakNDMv9z7eHrnsMfwGzCe1oBIgBUxRG3B4w9c=;
        b=i2IJjz7yJgV/wrwGtOBJ1rJOpXzyX14qX9FqcfEvwE1UjSAS+smdrI78yu7ECxs3/O
         TwlY9vS2XynfsQ0FzQ9It0/FCnce/Pmx78BMpdLSqksCogN20r4le7LoweVUYzcFoZnX
         zftXmxnB/ZiXtUooQlq8ofaSZwuOCrQyUJFIVHW2EeTl9uSh7g46TLfoyC26Yz90Eqx8
         9giLCwy2qa3Ty9LgsvbM00lCpt0swKelb/YrCm6OgKu+DENFBzoiSSVVMBazILYstcNA
         DrW0PSBnNiSd3Tu3QT/rdT+3SJlobgPpd8q6sdyJ88KRk6T2cAUw9j8xorQSsBat3RCc
         3vTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772383671; x=1772988471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23yFjRakNDMv9z7eHrnsMfwGzCe1oBIgBUxRG3B4w9c=;
        b=IdwcENkSdWvlckQEFR+CaPNSgok4UcA5kWrMjra/zsN9lFK4XKuvKad1UuhW8CP9Ww
         1nSKHhA1LEOOUuzuGa475bPQV6sVii+IHBxYz6OB7JgCPrJBcV9HoCA5xGnadwHT5Wqe
         yqiy/6d6rpmKQTm9U9jaK1+G0UmSkLrZXfisY0dZtdxZ+XD+aEWSCbz+Nt3YZNHKFpEB
         mzu0iuYllBYeWjI4panCn9zAYInhu+IiyRcqeYGAo7KFiZVjt/BdF7a84Ol4EAMS1fp3
         Cmz+iMe+es9DR9n5jHonKznJ1CgncRAEm+QXSoUzK5RWd/c0Qvwquw2I7Fo61UmGIzge
         4n8g==
X-Forwarded-Encrypted: i=1; AJvYcCXN4gEDqOQ2TrLUgy9HTAYK266eydmgu08ZUHzNNnSmqZDDC6R7YY07kqxvn156pOYkCU6gBpwdYNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YysISZKHhFBUNa7+XccjqevzB6nOi4y/woc7ryyTMhGwCLJZemz
	W8xzs1CmJb2A8X5LezPvJ8caLaHY8JS8OcnKmrfXNzukJpfJoQbfVG9GJ96G3SaOi4xMZRTUjAD
	aWKs86Auk3F7k+kphLOkIWmzkoTkYtTu8K0AB6c/SNkGEo5PKuU2Bm4Lb0GCaHBs=
X-Gm-Gg: ATEYQzyBsT3F9jwo9ZSnu4b7xJ0gdycJQFkLkpsADHnJ3rtypXrNEfQFNBl9O6dpO6H
	MyeBw4v1s6ZVyd8iRyvtnpV7blqFH3TdC/m3u6PbeQLPNQiuhTu2kxAuHEbz0hHjq6j99Obuhaq
	3moBegomJhAEjr88+xMeEkVS6owkGcQq7nE3dYUHZdSX7pZF8e8OAAL9cT3hGGgpVbTmMZWV1S9
	Bc9adBsnp6Kpto5nrsNFXolyjljftBeu6R6JhrqDceAujgUEuVUFxN+6hNYXvB2ASVgY9aC+OAR
	8pVZRT4VrhKnK2YSDbFw9HxN/4esJ5xKgEYmCGTIRCW65dLhlPlDGtrdjtMcAYcVs8IKjRdXz8T
	gXsnfXf8vz3WI8fCKgENiqlVR6ifEJ12Z7ad0gWXaY3uaxWyb5m6FA8qBqV2rhwSglLrAZj2MIU
	wawntBv7ATVacfSaQrrQANHCFzwMur5SwdQR0=
X-Received: by 2002:a05:620a:4801:b0:8cb:4066:7acc with SMTP id af79cd13be357-8cbc8e4b74fmr1215340485a.50.1772383671037;
        Sun, 01 Mar 2026 08:47:51 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:8cb:4066:7acc with SMTP id af79cd13be357-8cbc8e4b74fmr1215338985a.50.1772383670575;
        Sun, 01 Mar 2026 08:47:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bca083sm1146993e87.31.2026.03.01.08.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:47:49 -0800 (PST)
Date: Sun, 1 Mar 2026 18:47:48 +0200
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
        intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Andri Yngvason <andri@yngvason.is>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
Message-ID: <y5ybjitphwydvtcjdtrmpcx7t7hwevjszpktcnmyvjqkgzinmu@hoitkl7lghxh>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-2-658c3b9db7ef@collabora.com>
X-Proofpoint-ORIG-GUID: -U4YYm5N9Ci5XW3iF1scJXKbU3lXw1y7
X-Proofpoint-GUID: -U4YYm5N9Ci5XW3iF1scJXKbU3lXw1y7
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a46db8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=yDUiu3_GAAAA:8
 a=QX4gbG5DAAAA:8 a=bDwM_fcg3tGIVG_HqXcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=gafEeHOdjwYkg5oUpzAY:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MyBTYWx0ZWRfX3+epC+/qnEur
 zsJiJxJVLmD7CabaZI2Pku//bO4KgGWtnQQytPd418Q9qkN+hkOOWCibu+6mPo8hYEL7wjuVLTL
 YlrSXSx7W/5DPEIlLVRmNmj70t83QDY3flYSz9zsxgkZgvheREJCmchdjMMMsid0JII83c+S1om
 AqfEPGr2OQIb6uPlXECydi6iLrsT5aWt4ZLZoy6lW7AF6HustG8VTn7d/nvCcxvVHKL1FsviaCj
 AowZo2dzLerVi95puwXTgRhPfgbmULlOFxlsbcXrpzyVrfa4lOniF1+WVmeV4BM61vz9xlaIYuR
 j+c4wdG5riNbATfqChUSXhWrO6Y2cYAlpHX/F8nYucWGjbNfY7v51Ntz8I9hEvNiqfgSPO90+YB
 FHqJa0kcih5ptf1rd3af67ovhnHgyTnTguCr6f1msqaXTu4a7fte/SSlEjkgxzKWzqnkS07jNwv
 m0c6emyPdyCxSVgtB8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010153

On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> From: Andri Yngvason <andri@yngvason.is>
> 
> Add a new general DRM property named "color format" which can be used by
> userspace to request the display driver to output a particular color
> format.
> 
> Possible options are:
>     - auto (setup by default, driver internally picks the color format)
>     - rgb
>     - ycbcr444
>     - ycbcr422
>     - ycbcr420
> 
> Drivers should advertise from this list which formats they support.
> Together with this list and EDID data from the sink we should be able
> to relay a list of usable color formats to users to pick from.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Andri Yngvason <andri@yngvason.is>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   5 ++
>  drivers/gpu/drm/drm_atomic_uapi.c   |  11 ++++
>  drivers/gpu/drm/drm_connector.c     | 124 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h         | 103 ++++++++++++++++++++++++++++++
>  4 files changed, 243 insertions(+)

It seems and feels that the common code to be used (almost?) everywhere
would be:

if (!drm_mode_create_color_format_property(connector, supported_formats))
	drm_connector_attach_color_format_property(connector);


Please mention somewhere the reason to split that into two functions.


-- 
With best wishes
Dmitry
