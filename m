Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5330D2DEA74
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752858889; cv=none; b=B4LbqkuGQcg3w+deyre/Gzt0gCQ91V6poNEtFM8nqqgR6enQiA6R755XBjZfnh3jkWD8lomJakqtNUoAF/oNd5/AiMVUeakO4/mmyTwunvB8iwMbE3ev5Pok9x1We8bI0jvlkViOuG+g+rjqcfGnpnGAUU9HnnBk/XNzHlW05NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752858889; c=relaxed/simple;
	bh=tmfDngngXq6fj8ZEFrgrno4R29+ACZBn3BYWv0UP28A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHfqN+shd2WZBe+rRLE5JGWf9soS32uiRwWj35wyWjOx+GT29toyoXr2oKHAx2eD6adS8R4RqLSBlZ5COvbpUX08iH0gFUZgPkzia17/DP1wZ45GsH6HynO8QXW+hMNHZu1lDPr0p3ApfO6uV+qQOX+MUdPeNzc3Bg67mCDpKek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9HONGQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9HONGQ2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGbaKv028078
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvQRsE2lG7WyIIQnwV/DeD9T4vuk4piXmEgdbjYc460=; b=G9HONGQ2Qa2uUbLZ
	VJY4Lqvyrv1n/8Lykdjk8ImdB8+wf9SYMMzho7gbPSwHGSDoxrUBE0CiNNwxX9tU
	eiuk2i03SYOOUMR/fzdvSMV4XqbJNDyDuvShdivyYxYc+NZo6O9pnZkJG20id4xH
	+GQ6CivijZWO/Yf86g+q8FR696sTRXmGqNM957Ntrk/wR/1dcjZG442XRPYcu9Dl
	2t6TTIi6n2flM1t9PB5QfE+BihzXzRoIFag/A/QdGofEojZLvcAH6xsAgHzN8Kev
	m3Vck5j3SQIkQddI4fbh5TebcaUGQBnIOFC3p8FE571tDb26sN/rlJWab2c9WjXO
	d5BCRQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh64mku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:14:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311e7337f26so2456022a91.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 10:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858886; x=1753463686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvQRsE2lG7WyIIQnwV/DeD9T4vuk4piXmEgdbjYc460=;
        b=vgUe+tXkOAGflcB1PcDz3kz5C3k3+GgJYHTM2T8p0uNLxDJXC2/fH9ZVjHYoEJxbJG
         Po2Xrkja4drskRtT4mRJCgQeDfmadkMeJydVnMT/M0+ML2vCq8M29Du0w0LuQKoiD0Yi
         90OP84BQktCiNsQ8yUq76Lw11EInfdvfePV/Hhxo4umRkMIDOeUZ8NzIUwngSWRQnTxx
         iT+NJLk9ZU8jznft3Mx2iWtxW75gWNQyG/mPl9seoZEqa4KFHQZ6W6uxcgGFvGg1Wd2U
         H9xjvqbetw/DnwsBy4STnGuK/spct62lf1hShxG+c5RX1iZEgGwF1nWnYng0Sj+tZsjF
         i4iw==
X-Forwarded-Encrypted: i=1; AJvYcCVPcNIqPGZ1vu4agJ+4r03wUANlcZtUMqaSt0aj3ugAG4JJ7Nt+fBJF+Xc3x8tFRlvDVOg0pFFuZfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeHnc0MWGajk4A9bQ1FhujU/y7uDbQTvpaWcNJPb4MDtvpYCUH
	mSSDpD1vReHUlP0wSMRR5PvIGq3P6a+VnC5+qB8FLUwx+GG8hjOR7PxwTRsToM2B4HUBco4hZl7
	heNsF5Xzxe5mhpr131S4XzZ6qQ8cO7MoSL9pY+pdZBzUYKEQu8bPidsZhcGaCzeQ=
X-Gm-Gg: ASbGncu2+875MSoTpOk7OSzT5SjAgwBCdfm/a9u988o1UMjoBSAQ0dKM1ePC94ViKtG
	FQUTDAVLxJCMk89V7pO65Kw3fFeOcMa9mgh8duu4Xs0r2R5q+tdrOX/unPTHR8TtTmtHkE5rbtW
	vwshoY+MCZfllSn5C4CYc6sT2eWF1W6c3vL4CnIhqjawJhuUMrDa9zTCP0knHXp+6dqhIc9ntWu
	W0e8/IOFnxXswGoG+9UT9bqAwG2l7/Zzcfw2pCdsLx4C8cdqQ2Qno9CtjmPXbdXOYDm/7WMBMCm
	bnGWvuibUsn5w8Zx4dwvphdW8LvfAMHPs3YME4mOpHmj4PgVX7VFOlbyiSTl+DScDAm+JCJVgU0
	APdNG4SBK1y4soQ==
X-Received: by 2002:a17:90b:48c8:b0:315:b07a:ac12 with SMTP id 98e67ed59e1d1-31c9e6f71b8mr18347596a91.14.1752858886406;
        Fri, 18 Jul 2025 10:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAZ4uYoT0jpgwok+1LqJLQaSu3L2fEp1diUxE597ewVDpbjd87lEWbuWkSUsEweCpZR2VK2w==
X-Received: by 2002:a17:90b:48c8:b0:315:b07a:ac12 with SMTP id 98e67ed59e1d1-31c9e6f71b8mr18347517a91.14.1752858885895;
        Fri, 18 Jul 2025 10:14:45 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e5b56fsm1593934a91.16.2025.07.18.10.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:14:45 -0700 (PDT)
Message-ID: <7753e1e8-5e2d-4d8b-8a46-a6fbc58a144d@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 11:14:42 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/10] accel/rocket: Add a new driver for Rockchip's
 NPU
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
        Robert Foss <rfoss@kernel.org>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
 <20250713-6-10-rocket-v8-2-64fa3115e910@tomeuvizoso.net>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250713-6-10-rocket-v8-2-64fa3115e910@tomeuvizoso.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a8107 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=DISFzqtZAAAA:8
 a=EUspDBNiAAAA:8 a=V6djkQ_TFPnTOxwyQKcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-GUID: _x7XYga5YO5GzP8Zin7aO21KMJuHOGMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzNiBTYWx0ZWRfX/nN2cpm98LNe
 j4VS3khJGNs2eMW0oqTxBk+yk+gFVr6myg3YLtI/fYYT9LGHKYh+o005u78JJhiGbITrFzdep3k
 QyzA1WnZhA/a+gHr8TgfAZSbojZ7rMCrUphbxn6HD/Mu7qV2NYK23naFGAFkVB3uHLwKGzj5HX/
 H0SdGT/aVuricKkbFRxpYsHLfLzFLl4nnWnTERH19+xrqwH/QOp3zJivnbEEqbKDeGyi9jRhOu/
 Grk9fsQMzn+tJkY3J9jLSgy1+pO/OcuyhoCMPA0TkzOg6oIyM87IkZG+riZylzEK4Gbd9yBhYGX
 DGbnf4asJfRA2lHj5xgHhXm2niFX7MJQxOTVJSds5WoFkSG02ay/FsWdr4eI3K68xQJgELJ1a5B
 koiPAwZxKyuaUTEuPgKafsSU3U2AvRgTE8jqocnAr2NmG9G+YZpZZTYRwzJyIs+OCCm63AH1
X-Proofpoint-ORIG-GUID: _x7XYga5YO5GzP8Zin7aO21KMJuHOGMp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180136

On 7/13/2025 2:38 AM, Tomeu Vizoso wrote:
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
> 
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
> 
> This commit adds just hardware initialization and power management.
> 
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
> 
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>    Frattaroli)
> - Move registers header to its own commit (Thomas Zimmermann)
> - Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - PM improvements (Nicolas Frattaroli)
> 
> v4:
> - Use bulk clk API (Krzysztof Kozlowski)
> 
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>    (Kever Yang)
> - Use calloc instead of GFP_ZERO (Jeff Hugo)
> - Explicitly include linux/container_of.h (Jeff Hugo)
> - pclk and npu clocks are now needed by all cores (Rob Herring)
> 
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>    Stone and Robin Murphy)
> 
> v8:
> - Kconfig: fix depends to be more explicit about Rockchip, and remove
>    superfluous selects (Robin Murphy)
> - Use reset lines to reset the cores (Robin Murphy)
> - Reference count the module
> - Set dma_set_max_seg_size
> - Correctly acquire a reference to the IOMMU (Robin Murphy)
> - Remove notion of top core (Robin Murphy)
> 
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
