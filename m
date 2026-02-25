Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2513E9F97
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046739; cv=none; b=SP0muetr6M228WfaKvavobBYb4vsM4R95VUcflp20truwdRtYM25yBNFgY3XOy9FUGbgHx9ac8hEIzFIwGxzFzz8wVhdEJJGpsl0EIou3Ar2pub2c6GLuorJA0v0SiZbtegDmErDcffI4YUFnM6bAEkCqXr/FqpeBCnCbzwtVFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046739; c=relaxed/simple;
	bh=3UffeSYJ90UKEt6at8F7y8k8ed5aDBg4BiH/dDRiY2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRNX1gXQmAEetUMusnYpMaQfjBySGxa73Q/OP2Lv7RvZMLBm3naILxsroGfLGhV+O80UW19KwljIhTlk6vbdbO4lmbn82/rI4tlBqxc+3LR2aHy4n7tiWsG9hv6tpnR+mtBImrEdIL0ZiUYqPwB3NJ9vOk2s9kI+4fskFzJHQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCm1INdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OIxt7NQi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCm1INdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OIxt7NQi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PH2NYf3100987
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lg9srVmRK+oZJLWJq17xoEHm
	pPxqRtxhu3c9PChBOMk=; b=WCm1INdNRRhbh84DyjMSXzpeUoIeQXVsQgHBlF1h
	Ndkvbhvx3lXr7E9lEF/C2lv7P1XNL91hKJWoBQPh0Ju3cQ8qDmL8N4hvHi5mx4Xb
	xpvtgujVzIept+Zev/RH/7hr17o5f9CCDpLLq/c7ZicXw3Ga2LdzZX3eXzwD8av9
	9hGSbTuWBNDjgYpAJRgqznmnbhInDU8kIHwTTvMK007WXU74W2nrIUXjgZRCiyr8
	ZDgLf3CSVdKV8UTUfhoIJCPhtWkXt+diNrnOdGZ/33Tl3HfsLLImO8fyTA3KdLeB
	qw/AJbDZk+cn0Otpvkc1kuFzAmdGKQy61y9ZbdjiYvRPZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54p8fe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 19:12:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so5855846985a.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 11:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772046737; x=1772651537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg9srVmRK+oZJLWJq17xoEHmpPxqRtxhu3c9PChBOMk=;
        b=OIxt7NQiEcxBnvzPuX+d04UqICKMVDJRR1azYUpyuqDA8VQ0nqLouPkmuBlD7lr10A
         4M8syQClZN8tTjxVaYS0pETgCWkPZ47BQaQX2TaHsMuzmk1MpOp+Ipj7hZcysY2j17zU
         7friol3a3M5cbYkzA6mgHX96JA11Lt0+DB+3nDf2eJ9DhyHrd7QHVdP2SQ3riW6x5/44
         oDqJ1cCpyl/nwGm06etbRruWzZT7fp/7mzPhwj66FJamQg5QUzjti6SPc9PZIRIfrWIf
         1xYI3oCGAzy2eGi+amS6EQYn6ZZ+jsUHmwAEk/DAc1qB9jBp9S/fYQ6iKgHex4+DyqCv
         O/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046737; x=1772651537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lg9srVmRK+oZJLWJq17xoEHmpPxqRtxhu3c9PChBOMk=;
        b=bbMHGRaCtFziPPbGVtzFWL2OrCLIri+uCVWkMVXBHxlotVt8SHUXT3KeaMZVnqeKHj
         kpYDa9He35dFz2b6JIv5ioo6IsW3MHFWzOZAGQLJeQlQICZiZLBmO8hAt4K//sXj+0uc
         0f6Psbx6I2jr5gZNorEva7QB0IsDDX7W26o7Va5tia/1+ZTO9vEqZDjqXUUawobxG5ai
         24h7xjHV4Z3OaLKf63dOK2wEL6iZ2JvP67wTQSwCCinARG0MWp5OPlLD0NTthmhU3Rly
         CF7ZT7ZIGPP7wI8ofYd8tccdCj0D/JnC3nk/OdxsZ1Urk5/j5Loku1/IhG/LSk1mhUPd
         Z4og==
X-Forwarded-Encrypted: i=1; AJvYcCX9ou8gWcOt5pjCZj833/BoBQZN0ViI9Xr6OkgD+FTzZzm65YZzxFcSgaWEfy0w4ppAT0xiMAxdIyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMC99fZf5F8p8LwnhOJ+Yj/nvc00vfMb5TMCVIP5TnKvv77YR
	5+Al54JTPg87fgmXx66ZqhHv27vDB5cYlPpstVNQ/xMdYxPqIjGUwRtYTwFU72EC8h2myAbzXyX
	Jh6Fam3VuBsWOz1J6q0iBcY8/NTPaNKVd8eZ/5llc9Mwceyy6U+x7f6BUZR143HA=
X-Gm-Gg: ATEYQzxdvMa9h1ZCXz3egw8/mdqjx6+YT6GYhAHQHitsG340Q2KFYIXtVHQeKqWZw2G
	VlduCidmGsAUBSptwAcpi0DoIdAJSZ1vo9jfpoVOy2LwkrKP7qVZ0s5a5xmwJocbc6V7ely9lUz
	Qk6UbSc5fimkyEbaIDofLG9dCtvwPVTGesLS+c5yckAKbHt4U1JszSObZggpFchyaWMzSYDhkgq
	zax6BGGZwc2Z2rrIe5DkB5NBjHh8PnUAL55eNekVHl6JsS5kz0nGSs5qk3Yi3gICJ1N2hKa5Dx5
	6dx9eE9obUabCAv26KaJoWOWchQA9N4qVQBqrgv+bURf2LYo4T4wfnAX86lbqTGIGpstwYoWjpa
	TrV9aGJJXLeWmsJpPGumGQlVFoVLQR+0fPyuUg2KMT8fy6vEbrPyAIoyUEtvy1qzQ8UaPA3E99N
	1uceH7XcHGd3KsBRhP+5RPE5pr3png1ExR2rY=
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr2070541385a.5.1772046736855;
        Wed, 25 Feb 2026 11:12:16 -0800 (PST)
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr2070536685a.5.1772046736335;
        Wed, 25 Feb 2026 11:12:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a1feb7sm30070291fa.29.2026.02.25.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:12:15 -0800 (PST)
Date: Wed, 25 Feb 2026 21:12:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
Message-ID: <vgcb4n6ciybslspdoa5fkvb5zwz7xon6tnxjmxxzkqutabgoq2@sgbxxtgdyeig>
References: <vU2QyEVqOu-D3eGp7BZFICUeauxL32bwWzeidOAijoeVaJTk8KcRVsaQQD4MdFQEcaQTZ5RkzRsz9-Lhl1qsqg==@protonmail.internalid>
 <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4MCBTYWx0ZWRfX3JLiXhwAcj4C
 HMxHgEg6qTl5kcxmEIsBUky1fHrzUp/P8xrWUvMzyJXYN1iQJHKypjmzoJENxBJvUdrjVOJmAV6
 JPcW1RN4A5wXsbMk78W6F5Asp5/I2zokvRLK1VjMKZ7jHerwKUSYmkVEXlD/OsfNJ79iDfsIS9S
 Qu/c7Enp3aymut/4CP47SZ29zpHOWMLEgnHLNrmw+ekn13omWgD3w+rO6zeFyCe46pRAi6yU0u7
 f6Pol2rH1epRmrJnfShKcujasZHVMls9D2ZCO8qCM6RrmLLzYJ8s57GllNYIJokfop7200E9GAI
 6UsLFEGW85bF+Wh9X3L5ENyHT6viGkNNwpDMgFXbAaBNczQB+j+2N+iJrbEGqjJrTT96+H0r8WF
 JcyiTB6VLofA+Qe76tU8zr5roFpL16nEjj/TSmjWzZ/evDkjjhlDFwHZ1v5YPKT0sPEWhv8Q06B
 9GhwJb6fgSjeYoAoqlw==
X-Proofpoint-GUID: 0JofokMO72o7kksg0A8Mku8B4XY8El23
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699f4991 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=DISFzqtZAAAA:8 a=jajewSGiAXp_dDDQNc8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=aug85vrO5LANNmmtkfAW:22
X-Proofpoint-ORIG-GUID: 0JofokMO72o7kksg0A8Mku8B4XY8El23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250180

On Wed, Feb 25, 2026 at 01:42:19PM +0000, Bryan O'Donoghue wrote:
> On 23/02/2026 19:08, Ekansh Gupta wrote:
> > User-space staging branch
> > ============
> > https://github.com/qualcomm/fastrpc/tree/accel/staging
> 
> What would be really nice to see would be mesa integration allowing
> convergence of the xDSP/xPU accelerator space around something like a
> standard.

I'd say, writing Mesa compiler to build Hexagon code for Teflon frontend
would be a nice item. It would probably also allow us to use DSPs for
OpenCL acceleration. But, I'd say, it's a separate topic.

> 
> See: https://blog.tomeuvizoso.net/2025/07/rockchip-npu-update-6-we-are-in-mainline.html
> 
> ---
> bod

-- 
With best wishes
Dmitry
