Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07333469FC
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144736; cv=none; b=FQzUFnq0ttDBVimjiboOdSvRnwWxJKKbLvCvzTLf5z/yKflytIGnXboMG48o+UmJG4Gj37GSm6sI/WueNBhe+SF3pVPaecEb9PXKu5J+llH0zz54vo2gIu15hziHiD+Hsi1YL0Wf+Z68oMpGFbeph4O74SgWirPzbfgnKOAausY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144736; c=relaxed/simple;
	bh=yeAn53QhD+ejLswrNzkwv8ur2hDkhwUdtZ0G7WwZFdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJPb+GR786hyGA02djVRMSqXWNF/i+UOV2VQOt+OfNOIU2466MRy7/vJFangcuk2xJGCdCANb8evFwy5wz3c/7WQtmnWYVd1QfZ7YpVtUY9G622LjKc6Lz9r+ZCRQV1sFfEVGrC+b6/8JRuTw1rTNrINsfmm2y53RmveyVNYh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2LMLWRM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juRFr5M2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2LMLWRM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juRFr5M2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0G3Q1404845
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=; b=K2LMLWRMhSf9IfQR
	DpB6P5ILQueozCgCu5JXWzSpQPKmbFV9bRj4KnArcWAgE1E5S/gbqv0Vgd98elSy
	2Z7Qd9YrW2KiLmg3GAEsloT8Tny6ZBWrgy6GQZLMYy1EMqRXDc2c4syj+gfFTzQ1
	gjIbgeLR8+sYoUBMBOO/vUs+IBWDVDvT8m77dmmY6dwtHAdVK/5/N6mfB3Wd8rKS
	hkFKjswlekvfHUg/caahLolHW+47x2nNWMU9d3JilgNrSzCYD6KFkCTh69Hyi2bn
	7hlk3jq+7XnFCejQyDo8khR9H/FVbuJIXfSbKO2tEO8qqugq4AIrZYvPWbYY+VLJ
	jC5YWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm3adr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 13:05:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cd01a14e81so14219245ad.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144733; x=1787749533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=;
        b=juRFr5M2veQpbq/ZUsD4/OdOXpMppBUZgBGb2BrALvjVQbUZ2ib6kFNhvLoL9Z46hh
         lg2NGWlz065HjSm0ANMylBwuAltx//YQ2thjqNa0A95fiMYSvfAtFpnMmpEx3MOWO3+q
         oUK5HwN98SeBmgV8pFzWe19vpEFu+JdSCjzoSJw6FiJmn8NCGZyJgMXubKCTiia4IS+K
         fIqK0obn5FE+GlfMr3Wl04NMknbodO1SocZQgt5m/7FIMluTW4KHVOVaWbABz3JehFeX
         trkWDtjrpOL/HGYLidKwl6zkxrIVt/ZLVhRZ/fy3S4tlVvMfc8Dj6tZY+GeY8YD7GLFE
         S6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144733; x=1787749533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZ5DADcP5lyK3Hc2KgnGBzVe5cJ/nTw1zxLeW7QKY5o=;
        b=SB+lr81wjG7uFEErxO1JXBgVP3WpjUXvIEfB5sj+pa0EaJSxD8pdZSKQxMV/gaQKMy
         OCwbuoB5tw8OG6YDoXnDpEyaWx1LNJXUqfu21NwwI6o1wKoBh3git0igwHJQ1+zxp9RU
         ToKVDAouclg8niFUukRtTPuVe9tLFGBOLL6+IIXNuE7M5ILbZfnu5wPx4tWm72C1rTPf
         Pl5f8IOWbT/D5yU7qEOqx/Rn102hFA20rYpMPmJtdL9k3JVpBXSdvPdU8cOYiF0GtWgu
         4myRbeodN4LV6qO8b6G1PbRBw6eUMEnV4p2CThumcfqr8Jlov+83back0gC6C9EXKfZR
         Apfg==
X-Forwarded-Encrypted: i=1; AHgh+RpQQxwNZ+QJq/bhzR1Ve9a/GFuGbJR1JeHysMQB3c5BbXd9tiAJEqy9VOUKij4qvVVF86uWE4nGhQc=@vger.kernel.org
X-Gm-Message-State: AFuF++m+bXopsCeZfeunJz2uHVjwjn6rNQuiCr6Uj7qLIuEPK1NbKEGs
	nnP9P63OY8ROP7qMyD8HBCMk9CeDDXIB6hLs597H9N3Aatva0Je58YwCmu8LHEsTrb6ChiLKzIg
	awKduj6J+xxnfSEbCv1BCKkZjLUvdw11M3mWP0u7Hvh2z4XuT/uluYXbMnQDN22A=
X-Gm-Gg: AR+sD10Oly8Sp7Sa1TirfIz+jC4qBen2bxNmTNiglnezS1HTVfvTbyL3eA0FHbj8f9Q
	zDDBGueIg4AOMmdhuSbKK4rmFo0bTH1L8dvfqMAxoslfYNc/rsvz0KnNEL6zcfsHIehpWkCaytU
	WoI9vrzbY646PTX2+A+hCJAYK4IFHLmF0Ey6dlQWV4MGeG56E87jKS+EqoHmjSVh23fCPv5grei
	ITgvcJwEhMNRp6J8vB8uMFVeDplMkUnOSLvYTaki+sksIFtK7bU3W/uwX7Ul81EzHJcsoD7M21W
	KTTFQpClFZT9z0JK4uIVn7z99LDmOW/+/qMj5c/kQJbYqQWa72DsFrz0c5cY3MRMr3h1VOHlAuu
	EpcGHqYELJBprDvVIivJamC1huqwocw==
X-Received: by 2002:a17:902:fda6:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d60186263bmr89345045ad.11.1787144733051;
        Wed, 19 Aug 2026 06:05:33 -0700 (PDT)
X-Received: by 2002:a17:902:fda6:b0:2cf:a108:7605 with SMTP id d9443c01a7336-2d60186263bmr89343405ad.11.1787144732529;
        Wed, 19 Aug 2026 06:05:32 -0700 (PDT)
Received: from [10.219.56.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e54330sm24796285ad.44.2026.08.19.06.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 06:05:31 -0700 (PDT)
Message-ID: <e0a25f11-5c7c-406f-a223-da29bf6e1401@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:35:22 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] MAINTAINERS: Add entry for Qualcomm DSP
 Accelerator (QDA) driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-1-69a02e9090d4@oss.qualcomm.com>
 <cc43a545-20a1-4f15-a7b9-ca48842bffca@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cc43a545-20a1-4f15-a7b9-ca48842bffca@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfXyLdMmsH8gKlL
 QD/R74cT7O64oTQODh9T3W2JHrYD4p/Lzl3j3EQ0Irr5solRBSXtDUdR8iZLqeh0P7YdmAohxEM
 2bVfKIU9RRWprzKHAXD3zj2ml4QlHXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX+kREl0kiPSEe
 4Thv+bMEFhj4GdE2c4Ps/zeTsrbKBKEnu2xNg0dSnZr1IoodP1RPF+W0ULpDBFokIa1LtcCpdGw
 Qoo7b2uIuhnT4qNfSuoofWciQHwDJgjxgQHDnvSmJIKV8Id+NbRCwkdKk7e/lD/2QqcHBhlO7c0
 Vr+VDdLaLkHgvD4bc3tShh25n4JfymdPPVfTWMGfgU41H581AOHLo1xO0U1rpnM5eIyKLpnsHDk
 PYlWZFkjQwNh66tvo1spMJjZnBD3TCiYqvdB4aTgFz41EOh1WQKno4K+vldIZ5+5bRbnwBoBIai
 Q6B7KWMBPoI859aqYxTJp+2bzo4Fx0fzeb9e8J6srK2VCcgJT6V3egFyX7i45u7Q8cJtXWmtD8h
 70F/dg9GYq2TS9sYeiTngV9c7VIKxAIeRt1TdBnjW3NNoOIGyKfQ7PDuFPtC+TnQVtIo0ESaVkU
 AdzNtLL5y+09fAgLFRw==
X-Proofpoint-ORIG-GUID: 0Etbmqa7JHbDECygdbdVHLLlTdqyXyzd
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a85aa1d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XbA7GbUpZyLIT2ThUnsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 0Etbmqa7JHbDECygdbdVHLLlTdqyXyzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

On 19-08-2026 00:52, Krzysztof Kozlowski wrote:
> On 17/08/2026 06:47, Ekansh Gupta wrote:
>> Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
>> covering the driver source under drivers/accel/qda, documentation under
>> Documentation/accel/qda, and the UAPI header
>> include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
>> lists are listed as the relevant review lists.
>>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  MAINTAINERS | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 912837dd4640..75fa90c137c7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -22388,6 +22388,17 @@ S:	Supported
>>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>  F:	drivers/crypto/qce/
>>  
>> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
>> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	Documentation/accel/qda/
> 
> There is no such directory.
the directory got added in a later patch, added this patch at the start
following the comment here[1].

[1]
https://lore.kernel.org/all/zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r/>

> Best regards,
> Krzysztof

