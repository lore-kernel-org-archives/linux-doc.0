Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B692F659D
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755127154; cv=none; b=tJKPu6MDLuBDPQfIZxSDSznzgLIYEmLozbpFVWrxNPGTPS8dHH0u2F7PMsrBABG2GGOhuA5zcwm/NdYu2DUzStnfegGF9TEUxOOnCmUDYaAoAy7KDoJWB/o0yZb6p91SN9O0dpdN9zZuw5ALiaL5QXb4rFVaQ8IjM6BZpwC8sRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755127154; c=relaxed/simple;
	bh=J7HPyC/viLo3ASlp4BEj2IzMnozhzIy4ActEhtCF/UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9MSdrxxtS1+KzAQkSd0+yFNfRCwQnfjeFjH+xXVEc3S1+OzPgz5ZZv3rOkwv8NV1GLFuPS0DVUXwxX3P3cKZjXQ/M4/VsaCaiDDdRPzvaTq3xaBnVi8x/wVq8YRIhGl/in+mhk/ILLFzCN+WnBI10SGf8T7tZAIjMF3JZfkW+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvgKzPIT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvgKzPIT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMjR6K002879
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2TfSABE608VzR8Ccb4ovCS90iSRhqxTosRl77AzoBvk=; b=PvgKzPITzN7s/w4F
	CWmDq3EBjBDvcHPTnE5J9fzFRBm5JuwXqpHyOD3UDwfrQm+CPO4qalH5ZusRrI5d
	syOJg9wfB711Q9ABtxbUE1ao4ffUbyTmicIEr2Q0OnL/Ukxm2p7Aat52rlpGqE9O
	OH7sCI1/xbp2CKdOGEQ0zs/t93Ayal4dCj8gPkwnxx62cdwGSwkKVxzcAjonFefc
	3eKld5Q5oOSdp/F74YRx0iyKCZyF4P3gZU+dxXES4M5zgTqoBQO7jMcD1HDhuRdH
	WAowXtuau2w5bYpTZ2zUbyq8qhOpQZUqju2QX72n3dcxOiReCJYZC89+HLB4aWwC
	jpjC/g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv5hag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:19:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e60c3e7so665123b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 16:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755127151; x=1755731951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TfSABE608VzR8Ccb4ovCS90iSRhqxTosRl77AzoBvk=;
        b=UNTp+m+JWXU+j+JbsornNhcK5XMb4NKJ2Qbk1sFJBk9bldWxuFyh9u8wPQw1j7IgTJ
         2vzRSGLIUI1SJPeOPWZIOIyLixaPQGYh7W5IbUVUPqOL4vGRsy5SPTqM6vg9PxPTEQ6H
         zmESM6YMp8Bk617TETpZ/SrVxbFx1wdcxRgJ/Rwa++oKI0U6xhvM4bPvG2S/0KtfQPKo
         ueovde+NjfTzcc1HNOxslLEzrkLsQeW5fkgwzR84MrDu6fNL+9Q0WkvPmcaXDDY6rVcJ
         Gn1GbkDWW2eUe2d43qPIK1BPWlO/3QzfsSa6xa2nXV8U+FXbsfWGaIcGzBSYIepET1P/
         zWZA==
X-Forwarded-Encrypted: i=1; AJvYcCVD5G+wLj8yLBfj6WMz4AfqWnj7dv7mf03gO5Otxqd+yK1TgAjIH9/pmW0rsfE/rxg0DKiqeh03UwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFf/Y4EMKvDlDwLilsj5FOa4Hlz0KvsTFC/SR6lROP/YCyjAz
	z63RmXt1aE4v1/3sgl8/9uzf0DktRh7xmbaPgT9njAJYsOrfLb23jW3Qicz3JY2Z96GdTxnPo0c
	nJvo9z9loVhaF6ZzIKqzxs4bT5/L4MpxdKAZdfSVVjDlztTBUzqU8P5zZb0moLQ==
X-Gm-Gg: ASbGncvzjQqYkkeCDkNS6viVfjKuZyM9OxdomLI5ycwZ7vexKQdcz9OtBYNQhwUDCav
	suDU8W/Fvhrela2jIdOAvH80yOKp7wVkaHZYAPT4RoVN2rpnxIupGsX25Y+jUXYaLdgRSLlouZe
	xqk/SEcZEszZDHg4pFge0XEw/FRvIWJsbNBsakxMuYfSrI+5inadkYPNw/na4Ko8ayHIYDjEjZ8
	uGwptyK5NxSsAwQ+xD6m/NKXUWEBmqBjaJQweFuESlxcNjyOJzSTH9THMSMo8BJNwUSWYIDgn66
	GTGyNrbPECTiaz/eQq0mfcjLBG4qsRxqHAeWKzFwxR+OpvQi/x0uAnasTb8mxHotm5Jg3XOIskE
	uk53dITpIBScV22KrkxT4/mo3d/TyQDBPJhCSvA==
X-Received: by 2002:a05:6a00:1489:b0:76b:f13e:f598 with SMTP id d2e1a72fcca58-76e2fa5dd6amr1713032b3a.8.1755127150811;
        Wed, 13 Aug 2025 16:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMWMipas6iUqagDKstR+TGWXPaYzE7u4u1viMcqd2w5yiGt/rETTcoLJmFUWDnm+dT5E5L7Q==
X-Received: by 2002:a05:6a00:1489:b0:76b:f13e:f598 with SMTP id d2e1a72fcca58-76e2fa5dd6amr1712998b3a.8.1755127150336;
        Wed, 13 Aug 2025 16:19:10 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf067e310sm28124852b3a.25.2025.08.13.16.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:19:09 -0700 (PDT)
Message-ID: <87c884ed-0975-4ac2-a0fa-16e830a57c72@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 09:19:01 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
 <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
 <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d1d70 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=AwBIn8DhAZiLWRgty54A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: K1XMcmS5DwXpHzxm1tqyJz6bOn_Me7I5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX+qb+kgnvn8t1
 i5X03Jjc+NvJ22OZ5ZveHEfq8nX+T6+eorOpGVnpL20X9xE26u2XVz85TaHhgC3CsdzTdINK9o8
 OxeHNo/C/mJfgv9G54+PRqyfClezlYHLB+CzeNkkBjRQHzUF+gkla8AKek5hWat0Qstq20raf7s
 w9NNc206Z24viZmtXJR4rqZjNEJ3la/EqO5yZbFmrtoHv15ch4mRucxK44fKy8KmUZfyngtPWTL
 j1kjTKFCX+hvu4PkIjdFNHtlsouA2tusdTNYn8gDDgXY+MHXI7OZeovy/R3gyVQCtbvf1H790NQ
 Z2LpJDQBossB7sLAPtezbKnR/UKsu2RKryS5m+/lf5hrqJRLgYO/r5xzoVB0/6xzFYOCdIny79D
 6g1pCJRl
X-Proofpoint-GUID: K1XMcmS5DwXpHzxm1tqyJz6bOn_Me7I5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025



On 8/14/2025 8:49 AM, Konrad Dybcio wrote:
> On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>> Enable userspace to allocate shared memory with QTEE. Since
>>>> QTEE handles shared memory as object, a wrapper is implemented
>>>> to represent tee_shm as an object. The shared memory identifier,
>>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>>
>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> +/* Mapping information format as expected by QTEE. */
>>>> +struct qcomtee_mapping_info {
>>>> +	u64 paddr;
>>>> +	u64 len;
>>>> +	u32 perms;
>>>> +} __packed;
>>>
>>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>>> TZ will always be little-endian, regardless of the host OS
>>>
>>
>> I'm not entirely sure how this point is relevant. As I understand it,
>> the core that populates this struct is the same one that accesses it in TZ.
>> Your argument would absolutely make sense if the host and TZ were operating
>> on different cores with distinct architectures -- such as one being
>> little-endian and the other big-endian, which is not the case.
> 
> CONFIG_CPU_BIG_ENDIAN=y exists on arm64
> 

Or, you are saying we may have a configuration where host is big-endian
but TZ is little-endian?

Amir

> Konrad

