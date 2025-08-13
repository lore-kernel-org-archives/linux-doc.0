Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754E6301462
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755127437; cv=none; b=K+0YlK9FUmKWIOmIrOlXKEGJM135LxtosFEBUStXiQ+AkHUK4joQbzf1aH1ZlZunuPwu+Q8y6jsec7Cd2j6mTWC+j2q14HcZtApn/snq6qnJNDqG9exCBwsew9/qC6KDKmxAosmwNz6FmZZ6u6GOv0EdrxscN8rfFsRYJYehoCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755127437; c=relaxed/simple;
	bh=D66gSkXwljvzFre/FOcNCT6buXirBv7V//dYm97gyAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lO7SqXX9hvkfgU8XMl0IKVuIXPy0UKB2YU9UR1XCBvGdW1dG8XGvApph3LjHIrY//yS0MnScanbJo/etPc+HMKvZSszW5rD4fx5aMEGKQqdxu9Bwse3+6QiOiGv6zxIaDI6l3nzqLWATHwnBDuWVtjW4PiR5rOcJkUu0S16zttM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOlzgTDK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOlzgTDK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLdKO023968
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iA6096032O8eraf5ErblJhkD3Z0jA/+vFYM4Vm1Ntuw=; b=TOlzgTDKGLoL6c3W
	60rRpgi2e6BWCynvvUsTJimxfrH1Jx8J+fCpYryKmW7KR/hvmWWF2Jfo4T2p6uCN
	noWNhlxOve1trqDf6IhHj/SMuv0NQfd/FHIVd8oi+iG7+QYRck3i+NtVgSXpU977
	MD2t/VBfUroL47SCDqUCaAGSnHVsr4viZcuBVwSig7q1InVKvA/MDVALiwsF0ME4
	JICcAwhzADnlR0Vr0LDHRdy6A9LPxvYsnxI2o9CO4yneATGRz5mwmSljp6/IeV3f
	q8IFZw4KKqV8sRseqjUy2KqIZEHjqEIXbf7mOOIirlaYQ7B6bEVevDhviQwWLwdh
	9inxbw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rt7fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 23:23:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581ce388so5584735ad.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 16:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755127435; x=1755732235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iA6096032O8eraf5ErblJhkD3Z0jA/+vFYM4Vm1Ntuw=;
        b=jUIC7Z0CS4AVaUfcJkYwvrDkd0iegoAKD8A6WW/pylslKZuAYvYuhgGLY4HHGqLzWg
         db/zFIhhU9rboYDiaoM1Cje78dSiH2UBE6qSaOAQDXNr0mPatmWdt5HqAfSfzNjwflfw
         fUnVo78834S2f5rlQyQrQJ5SD9zv6z+d0OgiM+Nm3ifYkHK8/HpMm0EISZy+5l9ZkF3o
         Q2Zt5k4WacJdk0/XjqZU3eFFmmGryoIyb7Z/Hdyih/DhLbZlYScr+RphsF0S6f81jKA/
         nmNmMIZ8wAmdO7BUu6WsymJcWR8lOgxbqp5uegKG8shOAaChzBSlhBA3KmqKKaHYc/w1
         3kDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzwyd7CF0L5tTfnhtn984sh8Jg31coSgCdNO1DL8MEn6NBptqG8/TNfzHaqTyXEioPa+KutoZge2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pihDp1VydHAlTK2LvW6bVlnF05ubv56ODl4PdiRtskWRwrEs
	+gWb7Du2L0ukQ6mdbN/AHdhs6zaMc1qRMDg07AqyOxaTFA2ZsfTRSqI8HxgFLNYc1Qn8agkLlDW
	AJGmf2FI0aoFjAE0SwVScCTi95GBBfWyHY3QQafv0s+k/fXoEFd7rVdXdxbWBEQ==
X-Gm-Gg: ASbGncsNeteFVRImPRV/pUGmVJbevN66r2YlKs1usx404077qGvzw8zaoWHENkvzGPA
	eMVbli1Lg7J5KbVGJlzvv0aPCSM0F3aelQ/HAQwaeQx5cpHlmGysH7pIqI4VVQh8+SN5rC7HV0A
	2Mx36WOrHthqR8u9emKizEGkx4suFSwDD9xeN8lbjoDkigTofq/FPncuLb0cSeEa2VppN4nMegs
	IzuIhwol6rCPtaVGR0rDUglRJdQhgrx9/lq7iBfQLbC+z0d83gZs3U2ua0gSeIHZG9OuL7mwGH9
	8jrPLkLdaY5Y4yX1FM2fZykRP98GsNdpkewhKwhiaZsudmEthAr4mR+1CvNF5eibybPrWhSB0qt
	Sl7axFlVMSNraORMAa3YKdhzGeGohe+mtrdZXFQ==
X-Received: by 2002:a17:903:1c8:b0:23e:22dc:665c with SMTP id d9443c01a7336-244586c46fbmr13119935ad.33.1755127434804;
        Wed, 13 Aug 2025 16:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHDCnRh0Js6W0SOu+on6VKjPDQGJcgj0Cg2MJ13k4MfvzHuV5x1VI5U3usKguIYljIv3YAFA==
X-Received: by 2002:a17:903:1c8:b0:23e:22dc:665c with SMTP id d9443c01a7336-244586c46fbmr13119515ad.33.1755127434369;
        Wed, 13 Aug 2025 16:23:54 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b77f33asm28118326a12.5.2025.08.13.16.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:23:53 -0700 (PDT)
Message-ID: <0cc814ae-ea8a-44cd-b502-1f89876e61b9@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 09:23:45 +1000
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
 <87c884ed-0975-4ac2-a0fa-16e830a57c72@oss.qualcomm.com>
 <8bcb37ed-2885-4f4d-abed-5dd5ec6a254c@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <8bcb37ed-2885-4f4d-abed-5dd5ec6a254c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX22BayZq0bv/V
 JiaR5BL1bGfjcc8/HkDG54LmU2BJk+t4RM5UseOVOuPsECP0dwskYnGrIdjfjPAa+cDZcYVTBSn
 b4SkigBjrl7K006dnMCY4mHfCFHASxPeykSs1i0K5gYK8ELmKWTFQj/2prl/Ka6UGy4gxU3H3jW
 dgMtmrnqAaPT3OC/NWq3qimZq2k6zSTgnXJzdeX11TKZZyNiAx9OyKxqL27+Nv6h8s2Za8a3gx9
 pHWoCKDs26zAEgdm1+FBpD8LOYahJbs+3HS/TP24qXUKFap4WHYecLTuHRmRCpoXKZ5SIEVt43L
 aDgPwDyvDlTq5bMKH8kIqfJ83w91JpbJV3i4pA2inAJkihcwxzr8Q2Za3gFUdocl7u7xlMlcifM
 ah0HoN/Z
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689d1e8b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=pGb8jkpG1LKJgODn460A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wqw9SdE3xVAK163YNgKp8Qcymb7meOVr
X-Proofpoint-GUID: wqw9SdE3xVAK163YNgKp8Qcymb7meOVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094



On 8/14/2025 9:20 AM, Konrad Dybcio wrote:
> On 8/14/25 1:19 AM, Amirreza Zarrabi wrote:
>>
>>
>> On 8/14/2025 8:49 AM, Konrad Dybcio wrote:
>>> On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
>>>>
>>>>
>>>> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>>>>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>>>>> Enable userspace to allocate shared memory with QTEE. Since
>>>>>> QTEE handles shared memory as object, a wrapper is implemented
>>>>>> to represent tee_shm as an object. The shared memory identifier,
>>>>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>>>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>>>>
>>>>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>>>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +/* Mapping information format as expected by QTEE. */
>>>>>> +struct qcomtee_mapping_info {
>>>>>> +	u64 paddr;
>>>>>> +	u64 len;
>>>>>> +	u32 perms;
>>>>>> +} __packed;
>>>>>
>>>>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>>>>> TZ will always be little-endian, regardless of the host OS
>>>>>
>>>>
>>>> I'm not entirely sure how this point is relevant. As I understand it,
>>>> the core that populates this struct is the same one that accesses it in TZ.
>>>> Your argument would absolutely make sense if the host and TZ were operating
>>>> on different cores with distinct architectures -- such as one being
>>>> little-endian and the other big-endian, which is not the case.
>>>
>>> CONFIG_CPU_BIG_ENDIAN=y exists on arm64
>>>
>>
>> Or, you are saying we may have a configuration where host is big-endian
>> but TZ is little-endian?
> 
> I was indeed about to say that.. I believe our tz is always little-endian
> but you can run the HLOS of either endianness

Ok, I'll update them.

> 
> Konrad

