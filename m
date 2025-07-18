Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31F2E7BAB
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859614; cv=none; b=tAs3GburfZh3/Zi0diJlqbagJV5cjt58dFlrRSzy2wM7UXG4uuMUYFr/UGgkF75H6GACTwdnzhGipqAIZ7CMPz7Mrk52cx5CRosYJ6OwJkAXP5eo8XSVycgtDleCJoJiYokeliclnfzWvyUobRGAn4IUpcFydE6DTo3g1Ut/wRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859614; c=relaxed/simple;
	bh=ZQApwEQ02/d8oHeWrr7hvbCAGhlqib0c03SG7L+E0gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrFg/yOCBrmwxqzIkcqOW+x5hKJKfm8Qfmtem2t1BfynGKcfTlR/TkL6dyyBVuS6UZBKuYWzthbhdfazisTqhyvEvrQhMUIxEjTF3arlt1//FvS5vPACgigXmKF4D1aJTLpve2esxdq+rmIFKhoOMsmp6LCg3ypMzCO+BgKR0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkhBU3LM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkhBU3LM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8NjPY008518
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=; b=WkhBU3LMpFoMdlPM
	vAqhiFUJdo1Zy9EYgRDMvp+udPTuHcKx9lPDzeI2ZXq/5cm7elI1QDI9LLxeG7gS
	hM6o9dZC2AWKDDE9ER2UAtPb/2eWJ6s7I3lTT8VDrIQ8Lz+8/oZgNsOnR6tkiv3M
	94c+I8oV1nqbS5IF9e9qGIAskI1hdNYx8UqAIqikMGRgjMivqEVAGMXOOwgcHFDw
	86IzJ625OAki5wWOvc3cxljvy5wf4/Gn9QN7kvCjiE5iYaW7iZNCxeJgbNqMtIKR
	jnNnOF8dKB9rBjiPu7wk4qG9V5hUF7oHJKiK64hHUIbeNs/4uKN/X6SZ8025kYzP
	0hTlwg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxbcemq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:26:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74913385dd8so3211630b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 10:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859610; x=1753464410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fv+mEh4f0MhcLN21Yyg9tehverC4r+K2gbgLijocXdM=;
        b=iFlZecU6NicPy0umwMvnwNPzcDHzytMytggbVBBYTTqN4PSdk1ZdSeVYJ7qhTPVgVw
         pmPJbJWerFONvOVeiiLiAkBfLHCClCSUYT3IThxEKieJt7vRo4ZcUdo0NtqxA29qoJqu
         9ihcwVH7Brl/US33HdbzNoSPQoI33C0ZRRmQWi9bGoVYRX5NeZu+/7HLy1IsAJ2xaiGC
         oe128YDCFt/w3ZXWHGKQAVJ9Tj7kr+xGzdQBGpUGxrJQ+HHtWj9aNxJVZGfOIffXwj7A
         wnT8R4PNHidG+bVkIBviGAddnlk1esrTngsyn52+KSg6OcK5+8T2qxnxeHghW0fkK6sL
         w7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXIZ2/OFp6StV/n+YmtUvHEp0HCq86l8j3TiXHRNw7EUws7G1oaVJUKJXSBvnfol4OpBZUv0Kylc94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvv2+VklJr2FOVCT423Am/h2hKSRJREtfuFqudVDRB0LO/mRGW
	5eH7FVH63VgY8hGnk4pO4l0smHdoXeYJHHqElBgMdV7ZnmMLGRv4bzJlp+pvkYaI0x+76qE1BYm
	8zvXtm0QUppakojCh37IKudTdDlynzPtxZTB9MiSUHUqqbzmrALY4hPpZTqs5VqQ=
X-Gm-Gg: ASbGncsxj6S8suOSYUNfPPTJf5ZyMJ+Tv4VF2/uh7fCOa8VTKjyGmpQOOCSHT94LGCT
	i/h1xHs6IM7z20jy0KgwcZ6/FCH4SLHkwSEXz7pUUtQGd/crWyJQqWpVMnJ4+RVH1iljz4wkptT
	ymnLnggGXtymp0kKeA1bfZLhzhvBl20iXSB3GDSVl8VDbYfhbF+c76tq9VOHgZVRyEwljS1liRV
	7Dd9w9ta1YnijQwSkjYesAopo1l4c53tR+wO9R3loGwHVEOVHqaxag5TjdgvD1k9V72ma7UIchz
	pUC/jjiDeiBhkcUuoytgB0lc2svgq1S3j1khFEjP8+N0FSamHUs5fLcrScFcPxob9bSzIQ+D3RE
	A/tzwOrsfUqCUVQ==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-7572267d1f8mr16458223b3a.4.1752859609750;
        Fri, 18 Jul 2025 10:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqQ9S63kSJn6y6OyUDc3uTWz9C+4cH8naBY6AZisiTbM1Dmrh1Aqbj7AEM/eK1YFdABEhA9g==
X-Received: by 2002:a05:6a00:3392:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-7572267d1f8mr16458162b3a.4.1752859609159;
        Fri, 18 Jul 2025 10:26:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd67ed2sm1530796b3a.135.2025.07.18.10.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:26:48 -0700 (PDT)
Message-ID: <cd36e463-2499-4e3f-8a02-60ea43de83dd@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:26:45 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] accel/rocket: Add job submission IOCTL
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
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-4-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wZs2jzC9MIpf5I9OepLEQ786CpPX4EY3
X-Proofpoint-ORIG-GUID: wZs2jzC9MIpf5I9OepLEQ786CpPX4EY3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX6imrTVGUf015
 dxFxYltpP3oTzHzBczG+bVp6RngYxDbOs2tYHEZEKoY56pAC6oqELn5gkv+PKFntFoan6FtKNWF
 wEDgrLfxiXdmZj+46vk2WFGs36us35GenMThs5DbsHCGn0/QoHlA2W/ZjtydAQaDZbkW58DkLxd
 MI/t3J7mDn7Drkfb5dCgAkaqnLNR7QCUhjxbt3FLOePL+avyIoQeTd3eAlvr16I6RwgP6Bifz/s
 0QnaWeeHuiJO4IcPw1TJDTj2bSMy5hGVgOQYC4/wYAaDWK9dWOGtUs9/Y6oTCTrBWDR5Eq9UrG2
 HmxKj/LZD2eISiX8lDdVLyFvndyxh6X233Y6Md9cUI8NosG5+PRBhvcI6A4XIQbqKFCJfQ0BDxP
 cWfkRpaHcs3jIO9kOg3kk0/5qkxQ50eYfuNlbUzzkWTrRFxIJOoILdDt1lRvbM35jIyX7jyi
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687a83db cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DISFzqtZAAAA:8 a=EUspDBNiAAAA:8
 a=OV0_J1LtQ3fB1FIpcGAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180138

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> Using the DRM GPU scheduler infrastructure, with a scheduler for each
> core.
> 
> Userspace can decide for a series of tasks to be executed sequentially
> in the same core, so SRAM locality can be taken advantage of.
> 
> The job submission code was initially based on Panfrost.
> 
> v2:
> - Remove hardcoded number of cores
> - Misc. style fixes (Jeffrey Hugo)
> - Repack IOCTL struct (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>    Frattaroli)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - Use drm_* logging functions (Thomas Zimmermann)
> - Rename reg i/o macros (Thomas Zimmermann)
> - Add padding to ioctls and check for zero (Jeff Hugo)
> - Improve error handling (Nicolas Frattaroli)
> 
> v6:
> - Use mutexes guard (Markus Elfring)
> - Use u64_to_user_ptr (Jeff Hugo)
> - Drop rocket_fence (Rob Herring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> v8:
> - Use reset lines to reset the cores (Robin Murphy)
> - Use the macros to compute the values for the bitfields (Robin Murphy)
> - More descriptive name for the IRQ (Robin Murphy)
> - Simplify job interrupt handing (Robin Murphy)
> - Correctly acquire a reference to the IOMMU (Robin Murphy)
> - Specify the size of the embedded structs in the IOCTLs for future
>    extensibility (Rob Herring)
> - Expose only 32 bits for the address of the regcmd BO (Robin Murphy)
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

One optional nit below -

> +/**
> + * struct drm_rocket_submit - ioctl argument for submitting commands to the NPU.
> + *
> + * The kernel will schedule the execution of these jobs in dependency order.
> + */
> +struct drm_rocket_submit {
> +	/** Input: Pointer to an array of struct drm_rocket_job. */
> +	__u64 jobs;
> +
> +	/** Input: Number of jobs passed in. */
> +	__u32 job_count;
> +
> +	/** Input: Size in bytes of the structs in the @jobs field. */
> +	__u32 job_struct_size;
> +
> +	/** Reserved, must be zero. */
> +	__u64 reserved;

It does not appear that this field is needed for padding, and I don't 
see the rest of the series using this. This could be dropped, although 
maybe you have a use for it in the near future?
