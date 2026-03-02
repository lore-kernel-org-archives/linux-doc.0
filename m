Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0C2E612E
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440929; cv=none; b=jF4BNH9hU5RFTC/jxcCorpMVAgO6Y/+HmWpEEwF9iScYMcrgUxp8Hqld87x6fk8f161+hQj6D7NAn6ycb38roAvOlU3D2uQ93pEzunx44oviVqB13r00ErrBN0XJ0b4svHYCmUVo90CJ05e9+0TQrBR22BbyJJFYAWraaoXY+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440929; c=relaxed/simple;
	bh=b7/GQlQqA57Sa/KgKkOW9sXVkTVLiqDv7U9/FioO5W0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jkDRJ2MRnm46D0nXrRGF5gb8si9bs0Iteq3lGZRcDf9oeT8a9IXc4O7x287cKw5VA40RfDIzE8culwZqvIsmSgZFpAvoSX3OnMwwJl2euBw90JChvjn5TKEZxpoOMTM+miMx/RgMpODrrPh2nhmWRawLeBSid3U1Kw3vFxHp6+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLtkOm2A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SsBL9S5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLtkOm2A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SsBL9S5R"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228HZ9e046597
	for <linux-doc@vger.kernel.org>; Mon, 2 Mar 2026 08:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=; b=nLtkOm2AHu9HoX1v
	oa1xnNMoezDDTz1ISvqkk7cJbAS2xyrhLYLVIWnZA80l/l2cOkEG2/KpwDkvyB8e
	jO9I8AvstnA0YOlfbm6jKlc/BfzpNQUQhO7M8CbWaa/iIZBeku+grClltUlY1Vmq
	EJ6/mh3P31+KsvQppLQFGemEp5R+T6T9EjirlueknNDz/uN5Sn4RQbIV+FM9Pxe9
	NMh2Xtqnbbox/mLdZoK/Lgp9YfcRJXJI3/0cn9RIf2b9mRwcEszcYeBDUGaFcd79
	IYruUus9C3cl6zA4w23dEUx1wOHUIpN9YKm/kH6d1tiKBMgLjt2l8AYHTe0gX2wj
	6+eHkQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf6mqam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 08:42:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70f7110dd1so17411234a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 00:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772440926; x=1773045726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=;
        b=SsBL9S5RDr1x93GOdqaLD9y7wY7bk03yogyEr9XIN3z+Um/XCrBavM5Fbcd01dTrFD
         0V4R4GJJ7lKmVtTLdhLC2jl4tc9zR6RAQmxXSWgMi0BtrUR9a4P9PpKia3ZDd57f+pCQ
         B1VjldRLslXnL9Iu4YH0pL4vSvxpKtsMD/Ltb5zHbEowc582Bk1fEDO7FMXsXEOwXmxd
         SEvP+0TaBIOfZx+/CWJ5AZ0Dghh/DNdLoO8IEJQyQ8j3v61B2xXUSh33W0C2DTGBq6w4
         Vx47JRtVh6EqzRebLl4T03OhUrL3YL51RmjeIsHizJct0CL4EAewU2L0spGF1judUl5L
         Mxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440926; x=1773045726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piXcJzMeuC1GQTW+z56AL0+ix8P0FjngV+9YFbX1rVM=;
        b=Zsfk5/N4NpzgfzPyKeZkKji+mb9k+sL2S7kPlCMEdg9sqQWk3nHaUfumkty7kTH02z
         hvGdbWvlS3MIf71PZ6fbJUQPDLcAtQg9lrWyWkh9skbtpubsxANvPZLoFhPJP6uu++ma
         S9TXifMk832G4AwmtlRKzO0IYHIVFG3txSKv5c7VwVg1M6O1iTVLzZAjjNJskBiENv9k
         B2lfCG7EHNCWegM2oWejioMcUntZMkPkeE26bKxs6nwJ8SaG+wY6j58A5fp5xz3UWPvI
         lmLEEc3J1lMPEbzOxD8pUEk2T6+nPv9eAfw2KosUniJHq7j88SqsI/tMAQ2tIDCwNYdW
         HcFg==
X-Forwarded-Encrypted: i=1; AJvYcCVOzZxZSckiogx4WpQPyEYvjdxUzkh91qMboSat9JrMwUf5k/64ELblbDGGkTF8MeTAY0cX9mEjHmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrL1g+p7sqQ95VZzE6kDUrix0PNOr+xPbKla/0qZgmG62GJ6g7
	JxoiDhsRclZDqzG+s+dpH0wYbzA9ntOErnN+AgOri9YEbgV0NVVFLktUaJltQ94xrHaciw95Tg1
	xG6JbpFqu5kLPUIWETR+e0igf06EhFn7Y21K5mKdEMT6Z+iA5MWoRk9xtJw3v1Qk=
X-Gm-Gg: ATEYQzzCwCO+URiO70USW26hZHpBfPG6LONJwtbTtAc8OQUgYC6iX6eBs1GgXTGVlX4
	Snf0doWPVXA+v8rSnJgBe62rasDC9YcK9LtbmEkHZK0YuWNg8BTK14pZgxGPtejxdhqiOAQn14M
	b3SkZyQtAkt1ZiPCRoVDv/0aX73cwy7X6EcTKOBLuU3LG/nZN4sDfGcc6NHorAvxxVGNLj4O6Ae
	nwTNvlmiy7H3EzMPWpILgyo0uaHa74aP89KgPp/MEtKWsxIAlQKQdjzCdAXGhTHcVZ0ZmL2d8EF
	Yu4izzldTVmMOQRWloobazRo9EtXPcmIos8mfrjowCK5eLC2y9avY+rOrb2FJNPWVX9NvyCubGO
	WYgqlKj6gs/6QaQeIPiKoibnS4/XuSGQQ9Sig2CypYDFW6O/aDA==
X-Received: by 2002:a05:6a00:2d09:b0:821:8492:7f73 with SMTP id d2e1a72fcca58-8274da7a78fmr12008609b3a.63.1772440926271;
        Mon, 02 Mar 2026 00:42:06 -0800 (PST)
X-Received: by 2002:a05:6a00:2d09:b0:821:8492:7f73 with SMTP id d2e1a72fcca58-8274da7a78fmr12008567b3a.63.1772440925746;
        Mon, 02 Mar 2026 00:42:05 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a01a99esm15377234b3a.47.2026.03.02.00.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:42:05 -0800 (PST)
Message-ID: <207b4008-b32e-45d0-9ebb-a32b2a5edfd1@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:11:57 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 18/18] MAINTAINERS: Add MAINTAINERS entry for QDA
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-18-fe46a9c1a046@oss.qualcomm.com>
 <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <zideovhb7djvsbydqmdyxbgh6cte7xc5ouhm6gsreww6klqqae@o6w6wd4tic4r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3cgibTM0h8pY0KX8pJGXyMFtlSAOtByl
X-Authority-Analysis: v=2.4 cv=JoL8bc4C c=1 sm=1 tr=0 ts=69a54d5f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=f53fbDee1N-zenCa03cA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NiBTYWx0ZWRfX5KshfVlO4x/i
 tqIPL4qb8xZu/qkPg7xHOPSLMEDfBUOlPTbyopq6ShYd2DBvvQGIXB7u1jRLli1dD6J0J6FcAv1
 rVMcU8OA2OVXKFz6+3tSytmqvu2zgPgVsOaH10ruMxYzJEb9lX8XgzcCRyW09aTWX8njOlY92Bp
 MbCQEiiZTsNuIczdo056m+1suFa+UpWEmr15kTl75Yx52BcHopfejW9Yk+rw/GeIOcDJh2WAX8N
 KHMpzx12yG1AGgjOUfw0xEqQsgj0YChrN6OECvyAsC722vSeWS9yisFq03T7i0ejp3DbhL58a2Z
 zKWeuavIB8gWccZ87ncaaJSPgo41ctxU8vtDgiSejQd9sKRb8U47Awz+8j8XakYACjtAcczqh0V
 NsAEUZ9TwhgQNOGqf8GPvXuEP4yNXIYxZdrZcMHO0tfq53iDB5ru3v+mCfWJJ7ZwR8B5UrE6S00
 Hhx5vgu/uxBWetOUkNg==
X-Proofpoint-GUID: 3cgibTM0h8pY0KX8pJGXyMFtlSAOtByl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020076



On 2/24/2026 4:10 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:12AM +0530, Ekansh Gupta wrote:
>> Add a new MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA)
>> driver. The entry lists the primary maintainer, the linux-arm-msm and
>> dri-devel mailing lists, and covers all source files under
>> drivers/accel/qda, Documentation/accel/qda and the UAPI header
>> include/uapi/drm/qda_accel.h.
>>
>> This ensures that patches to the QDA driver and its public API are
>> tracked and routed to the appropriate reviewers as the driver is
>> integrated into the DRM accel subsystem.
> Please add it in the first patch.
ack
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  MAINTAINERS | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 71f76fddebbf..78b8b82a6370 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21691,6 +21691,15 @@ S:	Maintained
>>  F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
>>  F:	drivers/crypto/qce/
>>  
>> +QUALCOMM DSP ACCELERATOR (QDA) DRIVER
>> +M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +L:	dri-devel@lists.freedesktop.org
>> +S:	Supported
>> +F:	Documentation/accel/qda/
>> +F:	drivers/accel/qda/
>> +F:	include/uapi/drm/qda_accel.h
>> +
>>  QUALCOMM EMAC GIGABIT ETHERNET DRIVER
>>  M:	Timur Tabi <timur@kernel.org>
>>  L:	netdev@vger.kernel.org
>>
>> -- 
>> 2.34.1
>>

