Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B778523C4F2
	for <linux-doc@vger.kernel.org>; Sun,  1 Mar 2026 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772384207; cv=none; b=nBhy+h2s6SXRd8XiWoxggnUeslpf1G0bmmgdlm3gc9x1mfk6CK4RqJhzwVLOu5tMEgu2w9LQydC0PlKPJdbt80C3Sicaya6vkx4RZr78Lj90GC3DN8c1ktazrF0iIzWEIqZonVm9lMFtM+9ocPYudDpZQLsZ1uIdU6kV4S37cOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772384207; c=relaxed/simple;
	bh=EHSxfgXAG5mvL5WD8q1yA1tJFwacH1E5aNsIks6/1Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qv9f1SXTo4IUsJiQJ3nngq7i7hMWMJxOZXHk35IRa/23hjOw0rt/VwqG5TMo+IJvGOf7CbtOL7AFZJwVdUNQplW2M4H0+NwG7sygVopk/DrLU9Iy+0WGNkLcmXknVoYBsZMTSTPG6ddUVRc5E5SP82K9/ffLQaxddbb+gnF2Mb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7bYISNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZZd/EoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7bYISNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PZZd/EoE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Ge0Dl2970129
	for <linux-doc@vger.kernel.org>; Sun, 1 Mar 2026 16:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eOVsPPjRSHguluqilN+Kykf3
	N9M3bR0DVUL4ZH0XYBg=; b=g7bYISNYlH4zm8Xc8NmJw+M0K5jMvJ5cjPbQXgbm
	bGMeZQy7zp6MKJDjrHG1fpDIjml8NhjImDmfW+kEkNkuk8P3xFLHN90IqHo373cM
	RW5Ndm3pzApXW5silQHbujFxwqjOsi7o42PFypVLnjOlH32AAIGkMYcU1z4FAhXh
	n9bbyOltX81FKyM+Ec7S4fznCBe/RqQqafp0KNFl6kNigll5bQBsL0XwZxmm1AH7
	5OYkZGlfPKuqgshdIAdW+rO0jDOUncXt3YNu1bSO5WZY4Kl1DWo/wmKwpwLodB6R
	uuIKygv9NTamdvEIi7PH5LbqSED44L5RgmBIIQyUW0La4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshck2f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 16:56:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70b6a5821so2658716585a.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Mar 2026 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772384204; x=1772989004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=;
        b=PZZd/EoEfkimXrYAgtbIP4oq29uA+XN2vJ90yvLOrvWLqkz9BC9Pt46vpyXjG4+E6l
         cr4Ilo0d3M1NBwZMcZ9O2qlD6nwPzECbPy4bboF2icepvHGx7+I6QIm3Z92zE3eloOKU
         BUIvKy9cNj8iiuNk4dvyu46yo3cZYcM45VdTKF9tPbAItWb4+d9yfj+9EYsikNvAwONt
         BG/b/iOiL3FOaNnNAsfoPgh2JmRqD5zwvY3Zm/hhufmXell1wXOP65/6tkf2LRYCSyjO
         GrdhsuM0aYUAoJSvFPQdn5qq9pmtTt2a3OVyQ/VhjSVXRwR8up0Y/Et8OEMVZ1r1By37
         c5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772384204; x=1772989004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOVsPPjRSHguluqilN+Kykf3N9M3bR0DVUL4ZH0XYBg=;
        b=aMVQeRFTVIqSHGlD8WPXGiU/Oayc6hNjRYS1KEV6bBQvvEol71d05UCnRS/ta+O8n7
         j9VrZFewD8b48IB+xhmEgDd0qPdkXnAfK/rYKaihUESoMGKCEyUiAmGeBqIaXq61XHLh
         8RtpmEWRBnYEqJQm4X60Y0ZictTdTYP4bl7q0VOMrfje4rD9HwtnlUoKVJiDSKqFcWm8
         EbYvtkypI22/RWPwWdxrBjmToxpSnGwh5AwNdZ0o4MY63EpRy9f8Crm40VD0ZViTTI4z
         cgFgAwbosBRnsUdUfV+pbG2oEvJ6pZ38cv2GGsd/jz/aU+6a5wYNNAB7VHJ89BFUfY/u
         uofQ==
X-Forwarded-Encrypted: i=1; AJvYcCW03hcTtWwNGhfUJwTgyk3c74k5NdSeTFUkycxEbaM/lI/URf4fn/+1ggEfoCNxN0qAMlZqErGC1hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPl16NWK8OaRIKYxM2G6fZLm2UKcLVyE2eQPst9+xHudjrTgR6
	k1ESsus0v82/QvFu9gu4hNLJRZseMgFVya4RGEUmyQaJ4utQ/h2JL5t2cQWmQZNjrGrxmyhJdGz
	IJW9PotnUAjcXDbPDX9vFmZekK+DWL40CWwL2hx7dvmMJ/C/+O3tZZuBZm78OFgE=
X-Gm-Gg: ATEYQzwBbP1EGdoDvsoiccYtaJRZvmK7vnUKtQ1PpJfKLnawxLRDAC/JyCdsLCuqB3d
	tIGtroEvW5HZlgEH0d5DE5fwvs5c+7UeqFrWp2qoA+GiZalJJIDUW8zNkoSZYcdkfIMA9ByKiE4
	2n88nPmm2yc3gNsTzCO9tDltaHeymE8SM7o7cRCAgKSDrvZDLwSDZNhKfntiN+6ftaPnmXynWs1
	QJ39e5BidIOm/W3T2csVEYci0nIazcqSpATWQ6M6rPbxYYlLWG7Z6OMIXRtifm9aL+PWzjMcKZe
	oqjW4D0vNjo9AR66Bu5BIXqHyID8+unO757XvdaTGKKA1zDpPR8bgevcevM76pobGjFglnYvWU4
	7hzBCLSGX16T8rSjij0uWwtNeUdKW/Y+pGSyL4CeDzWWFN7prg+t6MGobNABHH59MEkorE+JAV0
	yALA8+dyGcqlx+oT09DFpqXGPbad4BRNKj8yA=
X-Received: by 2002:a05:620a:40c5:b0:8cb:1c3a:90d6 with SMTP id af79cd13be357-8cbc8d6719cmr1207724585a.7.1772384203861;
        Sun, 01 Mar 2026 08:56:43 -0800 (PST)
X-Received: by 2002:a05:620a:40c5:b0:8cb:1c3a:90d6 with SMTP id af79cd13be357-8cbc8d6719cmr1207721785a.7.1772384203394;
        Sun, 01 Mar 2026 08:56:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd9996sm1161185e87.2.2026.03.01.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 08:56:42 -0800 (PST)
Date: Sun, 1 Mar 2026 18:56:41 +0200
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
Subject: Re: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Message-ID: <ylcczadyx5ovc7lbb57ehux62x6zbawf2k2pd23ymkp2meaqci@fvrf5gserw7j>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
X-Proofpoint-ORIG-GUID: be8UmHV0hIK5f_icRobB6DpHn994zLUF
X-Proofpoint-GUID: be8UmHV0hIK5f_icRobB6DpHn994zLUF
X-Authority-Analysis: v=2.4 cv=SO9PlevH c=1 sm=1 tr=0 ts=69a46fcc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=RMrH-QTV4azj2PXgkmEA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1NSBTYWx0ZWRfXzfA2s/xI4U5A
 MDxVYwrRWzc0l1/P5qxh8cYJxk2P6g3raQOlRoHY/FFCy0pErploS7azNDLMlx163+vJ535pLuE
 N1C/ErToj36Uwhpnmd/NPNUIWg3ikEK8tMQ4ACx6QuTVVM01bz3EU0zLiBk5iSH/PEjpBH0Cyrr
 N2dtwxK+keFPIMGb2auC2nDJl/Qir70kLyYwAM+dgQZvz30jZhp8+Qk+GAiEuSnCuBg47IuiYNS
 TvqbQuV8Ijq7F+9yhi8SK+wsBsFbHHIxhZEtRInbQY9pKycA2rCzaGU6+HDqxgRyRuOqqkN5kf1
 RKa/59bmS8hTa0hPmMv2IQdfSINL0iYkkYf0g/rKgG5Hou/7vme0oL4H4ky+YzfbHfTnJvapK9V
 4PRCpnDyLFlR5yZqxrnc8yaq1gv0aB+/wl3WkhGbeIGQdJlstXqZRdEGR4PNFgmlKxxwCkN4XWH
 O6u7jP0dVgIGqRrOORw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010155

On Fri, Feb 27, 2026 at 08:20:09PM +0100, Nicolas Frattaroli wrote:
> With the introduction of the "color format" DRM property, which allows
> userspace to request a specific color format, the HDMI state helper
> should implement this.
> 
> Implement it by translating the requested drm_connector_color_format to
> a drm_output_color_format enum value as per the logic HDMI should use
> for this: Auto is translated to RGB, and a fallback to YUV420 is only
> performed if the original color format was auto.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
