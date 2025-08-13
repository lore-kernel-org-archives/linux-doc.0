Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53162FB993
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125758; cv=none; b=LMmau9v+kqKhCmjAWYD9ES629r1036q0FZwsHmAvwxo3tzGt1z1aHmQ8KcbUElsKRv+ThYSadud8VXtxWvovGtOmoKUFHKy8DwyfXqWatUQ5oi+wYn5s6JRHDtsRIDTKMBOEK83Q79wPaIY7BrGKOIQkNnaqUt9LVXDj4HRcYsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125758; c=relaxed/simple;
	bh=jAnNKoc8OIVx+dw7TrFVfvfY8lmRFsZzlTTw/qR/0dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwncZIDnsQ4YJxncwDvtpFNZaQdLALjyULkeKXJxYXCnYNkLQDGamd9GzseWRBKuM9//gpDCrTNQkzgKzBRJyiHwU25GHFHRYeXJn0ZqKLef7sFCgMLnplGOfHi63n8PbOvgwVnBIDSkhDbGxh7SIIVslTMoVvtBHmGfJmPjyQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvOe4hR3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvOe4hR3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLwdul002794
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8e0ZVNprxYNA0/9coeslBrJajBup8IpRB7mgWlinU3I=; b=kvOe4hR389WJMGpr
	pSwX613gEZv7psgmjtiDKWNew9mN/oaXMWt7VZsUGZ0BYhGuur1Tz3LOgjc4ZcK8
	/ynBUUlLlkC9ecKh/1uPZUlS49gpcuwVRp1AIl8jtwpxIE2wI758QNLtqcuIMjqI
	u5Iu1TIo6URF61zeq0ZC83H3d+6cTgEDcqZXQq6s97Yqr1aWTmz2quWNfvCk2QFF
	euT8hKEvGddJZWYZKTRwNVXCQURNZieBYj52C5lJvsE4tofLzHsd4HIGpe++dhTC
	2hnP3czq2OO5mp5AJoSFJhPJvDbMPVyR6GLoI3PXpoxprIRy8abBaUsC7jdJ9wdQ
	0fkCvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv5fpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:55:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445823bc21so5299865ad.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 15:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755125754; x=1755730554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8e0ZVNprxYNA0/9coeslBrJajBup8IpRB7mgWlinU3I=;
        b=vp13Q51yFqVha9gd81M90ZQVC12YLTzWMcBSwtLd58XYGrzyDKyq78KF5HTb3oqeRn
         SHVWMeTaEWakU0qhKskFui7zdSZwNfVxkove7PBK4yUYw6AQJ8A/JMon9uGGwTiChVzH
         Ad3oW81ncnNQPTAYX0xkPlDP1JSWSslP4APC52td07/pHF7QcElBvWklg71pcBYSR/8W
         /AMs9eG4xft4xiyXI8CL7j3CxmHgwJeZOiVdH1llGSdZFLta90WZiZsB5T/TsimuhVtJ
         zCZx5Hx1Sem/YIO9pCD3FN00NBQJGMvjfetZA3xtuizSbPHKZuNgxi/xHes6NdkStJ0E
         qszw==
X-Forwarded-Encrypted: i=1; AJvYcCW70tfoZuwO66F3xFIxuFYVx0TDGZCB23zbhlYIfA1k7J/mgLX+WeAeYKP0OH7kloMDy115y3ENqcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYF7QmNEuZWBFsjXxgQdvOliBYKxqMTILFi4+jVPMG376zbbHA
	ibiSESgAdnxMU1xMFlsZcKh+LBLkhbArPTyorf25kvIJbwqpQgd70YULMVaKZz9mLitJsiDPOmJ
	NLvrg6ws9xHtalCOS8J1h2Ipw3+A1pU5Saqz/eWohez8b5/2FbsKcaSYZtAyMcA==
X-Gm-Gg: ASbGncuDebRHKHgbQlmtNEJIJzZgTrXLNhEqIIRSDqDY03qjrJRTAxOcZvaQYX+3MAA
	Oy4FAsJRTYJG5ZFs49WIuKomDBF4ejOGq24nsFYDXTwBS2a+ToARn8vzbRiihKJCtIRm0Tai6pd
	4o7UQIhb1BRby95vcB78QPLv6/p3FyQrAtGGYiYz1Rx9IfkkedXov2GdsXH+zFFmSefGvJTWBUd
	iws6NyN+qA/0yuXrFuPUQndtrxquKJ2TaZYbJYIVC6rYj1qFfphv0K/gRoK8vkp3/hmSSo8PKjv
	3TD384AvAeMsIOj1oR/BJ1jn1tDX7RPC4ibIMhUXHzT1ylLyRQxiIhdL5IrWaa8raDvSVdMyx/H
	q73mHnChDyGNIcguk2jCzF8QsfXUy6lCUm00RIA==
X-Received: by 2002:a17:902:ef48:b0:243:38d:b3c5 with SMTP id d9443c01a7336-244586d6812mr11283005ad.47.1755125754319;
        Wed, 13 Aug 2025 15:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwyZkPhdjRr1DNqf2XUlzMie+QCuji1zBonY4NxpkKvkrR7x/LGRt8rtlqOJlwD4OUaeYUew==
X-Received: by 2002:a17:902:ef48:b0:243:38d:b3c5 with SMTP id d9443c01a7336-244586d6812mr11282655ad.47.1755125753877;
        Wed, 13 Aug 2025 15:55:53 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2429b4ca995sm202959025ad.177.2025.08.13.15.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:55:53 -0700 (PDT)
Message-ID: <1874e02d-993f-483b-bcb7-dba7c0611376@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 08:55:45 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] firmware: qcom: scm: add support for object
 invocation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
 <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
 <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
 <176361cd-a095-4b81-9e36-f933d159d249@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <176361cd-a095-4b81-9e36-f933d159d249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d17fb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=T0n-DW2OHO-Z3PBZrcMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: C8H2RoI7x7tZC8bqEuuJAeNBoOXjVFI3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX4gf6Jh3VtYBT
 ISlpz2prbMR4quq+pc0j2ILiaRe3w35JOcgpTvYX8tKkBAoEZDlpYDtHFoGlMXawdBLZ2b+Up+W
 4kRjtOH3TV5UgilyRxIHSGEWj0r3g2fdvEuEJ2kAsn/k6jv1bKPT8VGgKkHO32W0rRGYxhXcl5U
 qdsWxStZJpDvXp1fOZl8WwtqYQVnJP/wvgNCQC/RyZ3/PjyyI2o6S85BeyG35x2uVZ+9PL5N8Pg
 4ShcH7XGtTYFA/a1pVwiNVBIljQ73/so5S9ND1X+qk+xREcQMkZDULO+CCoQb6ysMheoX1fQQdp
 SRv7ipN6uwLK36H5Jay3qeamnatxgoLQYrrFWOx9baNauc6/Yiw2iBnidDlJyYqB1xOE4U/eqKC
 IWJJVA1m
X-Proofpoint-GUID: C8H2RoI7x7tZC8bqEuuJAeNBoOXjVFI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 8/14/2025 8:52 AM, Konrad Dybcio wrote:
> On 8/13/25 11:37 PM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/13/2025 7:53 PM, Konrad Dybcio wrote:
>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
>>>> the secure world, accessed via objects. A QTEE client can invoke these
>>>> objects to request services. Similarly, QTEE can request services from
>>>> the nonsecure world using objects exported to the secure world.
>>>>
>>>> Add low-level primitives to facilitate the invocation of objects hosted
>>>> in QTEE, as well as those hosted in the nonsecure world.
>>>>
>>>> If support for object invocation is available, the qcom_scm allocates
>>>> a dedicated child platform device. The driver for this device communicates
>>>> with QTEE using low-level primitives.
>>>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>>  /**
>>>>   * qcom_scm_is_available() - Checks if SCM is available
>>>>   */
>>>> @@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>>>  	ret = qcom_scm_qseecom_init(scm);
>>>>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>>>>  
>>>> +	/*
>>>> +	 * Initialize the QTEE object interface.
>>>> +	 *
>>>> +	 * This only represents the availability for QTEE object invocation
>>>> +	 * and callback support. On failure, ignore the result. Any subsystem
>>>> +	 * depending on it may fail if it tries to access this interface.
>>>> +	 */
>>>> +	ret = qcom_scm_qtee_init(scm);
>>>> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
>>>
>>> This will throw a WARN on *a lot* of platforms, ranging from
>>> Chromebooks running TF-A (with a reduced SMC handler), through
>>> platforms requiring QCOM_SCM_SMCINVOKE_INVOKE_LEGACY (0x00) cmd
>>>
>>
>> Are you suggesting I remove the WARN? If so, how should the user be notified?
>> Should the error simply be ignored?
> 
> I suggest using dev_info/dev_notice, WARN prints multiple dozen lines
> and taints the kernel
> 
> Konrad

Ack.

Amir

