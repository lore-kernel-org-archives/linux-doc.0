Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2F2D23A6
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114952; cv=none; b=P3z92jo8qrPO8xsGqZ5GdGUVmaPmMfjehNWd1pGvJlgDHOggYVobBQeG4+lp9HOzlFDV0IaJ4dJ0cQhxZHs5MgBw2sw9aqPtca8tZOvyrFOdYrwzfhlVGI2veekCQpY9ZX9N8QNsPk/bzSXJQbbtlapHq/fJsluSKwOkGlIGnoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114952; c=relaxed/simple;
	bh=qM3NRQgAu86K3KRhnPOTAsm9J3Brbbx3sbSxeZjndrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbDQAyp9ri8ybTB1HlSyPLT4GYaWEdp9GA3DawH4RUGCB5NK/jA1NRPFZ3i1dp6dAGiaFU5Qqoehg7Qyrps/lXMukRFnMiPlPxubqwQ3h1nHW5uae+82o1a0ZH7a4wsiD9uL0NJYKcsgyZVlu/PZOffxUqNZZi8pfztEIGa1XZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQaWP/zU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vx4kEbh/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQaWP/zU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vx4kEbh/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3QN1t469627
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LuIbxZ4UGkr2MNHoHHNNbGJq
	U9tVlBHwrX/08rcaVp8=; b=HQaWP/zUUv16lKqJeof414zvjCEHqwtLTwHORYrc
	uuNXKoXfW5xGdbfm7Ul2EKQS01bgJCvGTn7tFrXPUj4NBCTi90rDrtl3v8QyNe50
	DtQQN7s1AB4G21yOz+YImxfApS9x3qvQrARYn096MMbdRHlaPG/xoinPcHGIKf1E
	tmgDhWBQPAxLVP1SypmeoVoGibGc1VCqey3Loy4wTxCvMMvPDs/U99gKAHIOz7Gr
	nZCj7rWqTMAhcuLCqlUsZzsm3E9TEDKRIyEkHrEZ51znwV/lYgZDnpM02rejVviM
	8MXPjmeovoPfg7Q6u7PSJEljEZglSRT34jMwkCOUNjnZEA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnq5rr9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 11:02:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fa75a19f21so13547240137.1
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777114949; x=1777719749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LuIbxZ4UGkr2MNHoHHNNbGJqU9tVlBHwrX/08rcaVp8=;
        b=Vx4kEbh/6bUwSRt5lEiIJp7tbvvfIbjpSzdH5p4mtxdZv/COnSvNb7hzkGoB69gU2V
         wh/ecRnYTliKVDbkLnYiNmomyBe6Mlly/YhfcYUeq9hGwATMe8SZhdfGHlR6X/KoJED6
         t/3pwz0X+puxdLYq7Rg8hc7TFo9OABcKflCK3yAgaTCQ7oARci0waWEuPk8c8KQHMy1H
         2JSLOGbkoZAzeFydwJrDLdhp+AdpG1Eesr8GLnrqYW2zqoG+CV8DNvFSMxtwiY+Me9gs
         iufIygh89F9c2351Iy7ZCHJS5dNK/XhsmdNiU8W8+1J1hP0JU+PhX8b24AFxgEodqoea
         blCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114949; x=1777719749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuIbxZ4UGkr2MNHoHHNNbGJqU9tVlBHwrX/08rcaVp8=;
        b=hlI2+cnWlrahcnFMgcI/93mOj9+jClBkWEyzaUJP7epsyZ2cbyO9qR9rEu4mhcPc6K
         on6kocEEDtMfUD8AvCSakoyIyPZzBWQy6wO6B9Ww+Z+8j0zKKFULS8gFjZvnacGrX4Mn
         4TqaF9JN3bjB9LRe3uDNfHOhbk5DWPFVk5RXmg4K0qRtnlT25AjPh0CXSTu/8dbpTbli
         zK7M/CEszj1ieJe2U8cJVZVAHfqKWhM7YLMqFiz950BQwQI/O5RNmYg/L0TrCccREu4W
         9yPqG2pJfVMsvmGC2eIxDat9hRyqQqX9Og6OWH1qS3mQ8LXu9L4gYYRsieQyLOv/m2z7
         Cm0g==
X-Forwarded-Encrypted: i=1; AFNElJ9Q0/JpUmZ+XVH2dU0hR6UxZdUNpuTAJMAlW0a608Nd9s8nlDcQrZfAA/0FWkNsLYULCWqyQALzE9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo0WVJQAGBIjU4saD9YQudt9bmg+qmoo9sjKrS3RXcGHpkUmi1
	cpgLKbdvRTHiSYj/g9lWMBEZYODJ4f7BaUF6/TXHHoS+pPCvFkCjK1aWyzT5yT9TV3WTyV2FWur
	jXHT7gAk55hJVB7qLPatWO8fGYI5tCfNt3R/vugyvbhH0xWPe1SOf2Q3KdOlLEq0=
X-Gm-Gg: AeBDievGnOvBNNmWcrIlZh1n8a2843tQ6ue/H33CnvjTynLEr4IMx14SEKb4usnXUEb
	A3+RDse+6eqAbG2z2Rn9vJylB+VQWeRGQ0fpNBvLlecK4RC0idR/sQxpMlRKLeCUZJBdK4vLkfS
	ZDiQL28KjbZU6HG/IsNTRhcGaL4iRXhEbL220W0L8SadXX6AnypKbOB53xAzwG1/Cryi6H6cikD
	Cf0mrgNJSHWcJ5elA4K9Nj/Uf/hAWkDBHESemJ3mXMieOTj81+6xizjGSKaeU7ts18cnuqTdaOq
	Z4h7PINCghiKOfSu//cidK9NeCO1o2hqvu++vdK+wVAlOwuOWN0UEFTeUrq766DbWAGMewV9c7z
	AztA6NRe+CafoZBQcIXZMOptYBHoYyIGNb1aDMxXuhggdXSfIcuDw4y5a4VPDKlrsUHfZCH3FgY
	zfouO0AtZkNx5mOtMT5JqKQOSwnqv8pjapyY1bcUQu5u7ODg==
X-Received: by 2002:a05:6102:6a85:b0:607:ccde:5c00 with SMTP id ada2fe7eead31-616feb7be9cmr12845713137.21.1777114949279;
        Sat, 25 Apr 2026 04:02:29 -0700 (PDT)
X-Received: by 2002:a05:6102:6a85:b0:607:ccde:5c00 with SMTP id ada2fe7eead31-616feb7be9cmr12845654137.21.1777114948825;
        Sat, 25 Apr 2026 04:02:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebfd6sm6609501e87.78.2026.04.25.04.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 04:02:26 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:02:24 +0300
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
        wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 05/28] drm/display: bridge_connector: Use HDMI color
 format for HDMI conns
Message-ID: <uwmhvmgnhge2vez5yussn3swgkqb4scfir7ls7iy35v4ewifmp@br3ynryrptzb>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-5-449a419ccbd4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-5-449a419ccbd4@collabora.com>
X-Authority-Analysis: v=2.4 cv=QNxYgALL c=1 sm=1 tr=0 ts=69ec9f46 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=gN0RDaQLg4mAccs6Ca8A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Zb810wx1MTsWincoy0CEmC4sjaHC9jtQ
X-Proofpoint-ORIG-GUID: Zb810wx1MTsWincoy0CEmC4sjaHC9jtQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMCBTYWx0ZWRfX70lKCt7dzeZY
 ZfvWiqB0LGSw9iam5M9V9wYbJkMTVqvwjYUFwa70c12sTsyxURfGendL/KJTFkh1be/PDbDQ0gT
 s8WlLZTbssPjFJh+FFKcYNt1//qXA+fzALxyljQzIUUUxrKrgUZs3LZ/W8RPYalGcWB8atLbGy/
 2qlD0oFvslLhfxRrn00pkbL/9aAN2v385oG+75+BOGC2jinEHTu8SpHgMAYjZN+7413rQlatzw+
 Ioh8llxj08GJ/5vUkuTYQb4fp7qzQ3p+ZuRfkR/Z/8wavPznBVxBwms9nCOOWeHKvDMdjTob/hu
 SW4Z9MLun7YDnqQy6lXoBWAcsI0xMvXO/fcPHKSf9txnehhvTryyeBY9Rc6FEktZDSPj6Qz4Fo/
 3Atsi0NvEcIw71dLdSgdTMztGrAPWJKUsuLDJhenVxO45y89CA+IeilH6cnZfi64c+sMLq92lVS
 K5W6/uuIviaW6Za4FfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250110

On Thu, Apr 23, 2026 at 09:03:28PM +0200, Nicolas Frattaroli wrote:
> For bridge connectors which contain an HDMI bridge at some stage, the
> HDMI state helpers' format selection logic should be involved.
> 
> Add an implementation for the drm_bridge_funcs color_format function,
> which translates from the HDMI state's output format to a connector
> format for bridge connectors involving an HDMI bridge, but return the
> connector state's color_format member unchanged otherwise.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Thanks! I like how it ended up looking.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
