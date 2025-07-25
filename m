Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397F92BB17
	for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753460068; cv=none; b=ETfk3Uza6zxNwQX5mxFKKBNfq97C20XbFSiGb1zWQoGy/lWjYw5yHdXZ2FRDKB20zXFY9/IZPGMbkZdBHkPIxYc+wWmm3AM4A8q2xnCdvki/9OR+YC6UGo1YG8BYpesp2sIH52uBttPQgMS1RLk3Wmcr/gtDahos3pJbh2KEvc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753460068; c=relaxed/simple;
	bh=zy4+5I7aIssi/rmMSBtYygJxN6pNtn3MaFBiLibPOAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FR6sJAO3ULJYIZFq5+Lrhs9gU9k8OpvxOXo3Xg5ZHYDafR79edZtx4fi/noMJAGNG7jm6dqkoBgny7zo3TX3gREqxg2eYoRY44yI8aAkAWKd2zEYGy78Qp8tfBMwq/gflWHx25eUPeLzLyiKDzFZ3MYyQyNVtQRQP7gxAlV1Gi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFdm9juM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFdm9juM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8m5fq017965
	for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 16:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=; b=VFdm9juMycnYZSHZ
	zUXA92nIOBcEnWTYEaYZVS7emlqydaCowoY21CWFScsHSDVVExvYnMTn3+dlby5s
	4hFLISQiz6TZG5bi9tOohYCb2gCWD9ar+XlLTzhbijgIX5E+1GuC37zcPa/MIpya
	Oo+QWB/wZTSCWzJFBHyT5vIqi3kLN//g/8yaVMd6jODWQHGtad5rkobIVYMVlpGi
	QLhQbu1VTEgSBYOY3iL0IqqWARLFc6G4r96pz9jb5jkIpBrByhITf5ekJy3yUGmo
	cGXUD/bTv2Rbch1TAYQSSp7JiozaHKVfDPiHii4f0OPK+8rFfOAqjLYfe6b2gPOs
	XMi8ug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2wjpr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 16:14:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3f33295703so2961209a12.1
        for <linux-doc@vger.kernel.org>; Fri, 25 Jul 2025 09:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460065; x=1754064865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTRAzXltnnQkXzy/4MfHD1BpN0UeO0JYTlGtIooVxhY=;
        b=UuTmy0Q5oA0uliOdAl3HESGrwj3aN6mx6YPpABNHj/ZlkoklGeBgNkB0NncOKongTE
         1QdVQhwRrvHOENqWZA1dop4K8hZn5895MauX71T2KSQ2qGK4B7m/yguFHKjUifufB7ZS
         xSSMNHv5p63IZt4r9/nfM97vJ733YKc6+K+GAWRoeaOI0jR6s40leEObd5W0+YLHR3cE
         BvAuQmiOWrUu+2d0zxSrTMAM5VNpqr4hTPf5ebuwyDXh+CCaEEIVC3IH8fQfzPZ2BqdL
         a/i4VlLy1pI2RF7Y9S+01q1KhbRx0xWwaWFh8HF/kBbN9E1i2Y7TVjWxC6lq2yHLfFWL
         Y1rw==
X-Forwarded-Encrypted: i=1; AJvYcCUYsfQQm+mQT5BpLsfHEURNN87cR0v9Gn1ab/Zjp+fu/rNXO1Ixo3ZiJ2i6EOJaLyAb+r0gyQ44wCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYIll6mHJgBETQoqgRxTJfXd+zMbfyfc9x4jbdlc9e2i+e5dXY
	aVMxGdQja9n0oZK2Wm8x7teilGSWQUxOHC6AzIAGQMw8oWgpSsqQg3ChtV0RPH8bCCxMRkiL1ee
	0WWkbcMlymUG7889IZEgZtIEd1Fj9ORb2b4bv+mtm02WIctvHrx796yVy6emLwmI=
X-Gm-Gg: ASbGncvEaABnzHVVG96AnZr+zB84LG0Tz/9O3Kyvuw1L3VTLM4nZREd36c+9gNcVl2l
	O0AEr/eyuKGEizQlqOSrx7cGkjwm4W2RFxYdSkYxg0ajq3RiqAMzNTmfk+YQ5lNwl5QTY+tCjon
	wRpzUuy39MgqUePtzgnp0QPeqi7Proe94uGYn9W6Ylq0Jo6fdBWlPyGjAP3Gggf1SyEgqFCJRud
	9tjUgLLSQkwp/AMyuEkkprk+YK90CYVfAH7qmWkcQxtKEvvLhd5HhinA47FltiRcVpEDA7+u0BJ
	cEcjP6wEQJZLoIe3lqV813SYgGREPLAScwV5w4QnSvw8KrgPdntuO4Dx7OGsZJ5HD8dTqo6gkZr
	hY9reOExu8uNAqA==
X-Received: by 2002:a05:6a20:7288:b0:239:1c1e:3edf with SMTP id adf61e73a8af0-23d701eaf4cmr4483535637.40.1753460065432;
        Fri, 25 Jul 2025 09:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH45mowQM24zNVVrDWA1OAKen9/Rncat1udl96ywd3HTaGlMrzSKhS42XbAwTPbo2lmkT86g==
X-Received: by 2002:a05:6a20:7288:b0:239:1c1e:3edf with SMTP id adf61e73a8af0-23d701eaf4cmr4483464637.40.1753460064981;
        Fri, 25 Jul 2025 09:14:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b8b0c60sm71215b3a.126.2025.07.25.09.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 09:14:24 -0700 (PDT)
Message-ID: <12223a91-82f0-4889-8f07-bfa5833c8ffb@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 10:14:21 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Robert Foss <rfoss@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2P-VbVEVOgWisY6N0WeyzxTQtfJqfA-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDEzOSBTYWx0ZWRfX5fPLNSL+9OWV
 E5YYzdVegNF9NW9cN+CRtjA96/9SCcwut12EPXsPYhT+l9y38YZTK/oI3tbCgoavaPVkhbZ9ITh
 W3iw6Esd01+uyjXiHxPqTJANpmpWUDBaSZlw9Kw2JeWuqZ8YGAmoBrxLzYfyBUhiqqO6bcU5kZL
 l5e6FnxVgMz6bjdtpexjY3CEhBqlz1eBaVmtOqS9x/xtu2HBp5SLLubi9jPOI6bJFfWQjo7QTwB
 YIHLobDswixf+2ugeycqU2Dq6lOUaMy7Wpim385pefR20e/0VFlPjWxaItE8iR4hJHJCzZ6t38k
 sy0wG26o/+9CxXdE/Qw0nx68NUTBq2gCYbMfqFaxmn8Vabuyf68o1wnXS1XHDCp+VRSK3jbk/yf
 hkgdB+U85f1COc5zCJlCl8IfS1P7jy+gN0zYN1BlW1ZywEX6a7Ms9UkBvcDybEcx+Sh+Kpab
X-Authority-Analysis: v=2.4 cv=d8b1yQjE c=1 sm=1 tr=0 ts=6883ad62 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=DISFzqtZAAAA:8
 a=XWXL-kdBtCKZFopiRrIA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: 2P-VbVEVOgWisY6N0WeyzxTQtfJqfA-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=818 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250139

On 7/21/2025 3:17 AM, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Patches 1-6 pushed to drm-misc-next.

-Jeff
