Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A1930E827
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125388; cv=none; b=ESl3jtqPvMpN6z+inFGxlq42nVT4Ag11EXxcgc+TmWjO1wwHbv2fp6JBiGRwZBB2CYG3DrbLmgw3xDZ5+vJ0DyAe/CuXwmAlS+cFdus3wtMsLP1pkp7tp2EjEDaLzcVTDKhHWWwuymjzuw0S5bNEZkZ9GnXS/CSK2i96qyFKmTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125388; c=relaxed/simple;
	bh=GwWQIqDRWNR8rlc3sYd61ddWtomTVhI1gZm1AYNVkd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5Gqy2uCd7/YBV3iOpgLzu8wPSQKZlxG6gjio1i2Ad5Isj9ZJDjfgYx8ZCCzvUBS80qNEkJ+9a451040mRUtZSvDVteOkF/GJL0D7CILtjwqkAiac9L8NyRXYtaBm8s5F9gCzpc8SWZAHEqCW8SEPbiOaqeMcBddZbLQTjBcdUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VE0ATn3B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VE0ATn3B"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLi7o013023
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1y1eNmB//F61SipoixUPmWI3edeccgArIKxTM78/+/I=; b=VE0ATn3Bals0gSW4
	+bdtKCITDeGJTX4UJeqZJ6AqzNU2Y+CcP+0ZiRu0/e1mI62QExXllwlPJu2FPv24
	u001U4PpaGOEi9MXWbvM9oqU2EF60TrDYhD8JW1VZLcDI22vTB1dO52BVp5fpCmw
	81lkpE2ARNo8zlCNp25j4eIDzXrhUjVaVYI2vB1AFcL6sRAnwCYiRzU2v1TVjx5J
	iX1XFeFg60S126SjDVQg0Ei91wpRg6/jPEya2VzWUbUSM4qkdaYMapH0NPKxiGxi
	CScpMuJBBqJFdL9VUZ6SAtGJppSuQEkIZqQwRSzFKk/bSC/gin5fKyTxn89UIV28
	kxZAgQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6sbkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:49:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109adce15so947591cf.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 15:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755125385; x=1755730185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1y1eNmB//F61SipoixUPmWI3edeccgArIKxTM78/+/I=;
        b=jk9gzKTMO37gfAOjHp+qPVLcfPPXqIBPjfM7Z+rXEOJVt4T5WWYigIyHTocTJfJClJ
         9r6owLLM/jp6KLRTA+Y6Wf9HCLp4ts/MbaNURdMDdweO9DQzMLtMGgKuN6QjK0AyQ9+v
         uEFb/lct1HLiaft71r9lMVzhmEvO7pOdSiPYFcIXPlQrgfLCmlvEfHVSm1PGfwgmCrjZ
         sxABMDL6iwEL0CA3yRTc6eMKi1Qs7HLXMm4J8n3sjsLJEbtJmwSRhSaRXpWJ7Ep/W/E6
         D9+c5jj1ruHkI87xGrLjBwEmMFhJcYW6A7E4EsJNADVIq2reLSht/z7haR2v2Y4nEhfA
         8vXw==
X-Forwarded-Encrypted: i=1; AJvYcCXGcQdtUxb62uFUcWaLgXIuFUvzwkv/SmWcnl9t+ug2jhJCGI40XkfHIbFM5f+qkh0ghzf9GuQ/05I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwB2NiuzBpgwiPOiyxFj+A3IPc8aoU580nNshZ8zpzEb7NmG+6
	wQ4jCOp527Q+apula7u4L+DextkxDPH35KbxhWibbkWL7U0kBTGslXb195qbTu0nEoG8NBRBlJ9
	PbNOXVUmVo0cCV52+fIQmMIjqyiHWrpuYmEFoyeDPAIY7n5CDUVKvRd19cHynEKI=
X-Gm-Gg: ASbGncuPKMJqNHJT+CiV76jGzWiZUVNMBMssrdVFcXzdlNwV+HfsKR8vQq6aU84Ad8w
	Kl+oF2fyOkjTZLVxN719jV/lGmVFF6gfXf1iCQHVbLTs5/wmbzh84DTO9jC/kbL04oYYitqRvLD
	bW8I+9WPzcMeV1pSGKiskUatc+V4LyxW3jpjUsgtDjEQhUEb5+Zk08S2DD4VXzo2re80Wv9aar5
	I3bOzQPS4RAyfM9srwxmhTfsYXQq/cxFQ+fn3ssAvFRh1rLblm0vpW9kfxDHrNK2hwcI0Ok6Xd6
	QGJw0tvKVz6ZExbeplbD1Euu/Ved8/yoAu4suZacvlIKRxo0YtDUep7tGFXaiAPzu1ywoWc4Jrl
	HAqDBJ202j4ynrLJv5Q==
X-Received: by 2002:ac8:580b:0:b0:475:1c59:1748 with SMTP id d75a77b69052e-4b10ab40660mr6928361cf.11.1755125384978;
        Wed, 13 Aug 2025 15:49:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOa1EUACt46c/s0PUTGj00pPK/iWnH0SLzQKgyx6D5B8kmovv05Bwu05KhVWthG9YSv94PmA==
X-Received: by 2002:ac8:580b:0:b0:475:1c59:1748 with SMTP id d75a77b69052e-4b10ab40660mr6928091cf.11.1755125384448;
        Wed, 13 Aug 2025 15:49:44 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e82a5sm2475800966b.82.2025.08.13.15.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:49:43 -0700 (PDT)
Message-ID: <d74404ec-44ad-412f-98ef-eed288ecf1bf@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 00:49:41 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX3L4W4REAFzhp
 F/dWii05ZvjXVHJXNVwq1qhFqKtusdHfwq8UIQnW5+SytcYvN0qB7QCoPIy/2mYI+PoliRuIg6j
 GN9LBqllOzCSDEYxT3mifgyqeWiPI8egsbY1lo4hOYRtuL+jiqUQVEmN25qfX4ffaOBbFnxSbIw
 RpPLCEMHp+lStizTXEuUOlaIW1+b6TGwDB2EMxl3858j0WW5U8IDeHkC6UIn2w+MJDCVDErXQ5q
 5CcHuAoeXCTICjEErgco9DYyAHF5dDabl7P6v6uIJF2vE0jq14ACv51k0h2rDDldLjoem72kjrL
 WCZIWb4Oz8FmzYpBuTkdsV8Z1EJGwDsy4fjeV5DcQJT9snSaLoK+1Wn2D8423n5dftnR3co3EIE
 Qi9bu25M
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689d168a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=YlTi__48JDlbgKAADYoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wa-GAl3PLvujVovcDtrG2iUoZU0VilhU
X-Proofpoint-ORIG-GUID: wa-GAl3PLvujVovcDtrG2iUoZU0VilhU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

On 8/14/25 12:24 AM, Amirreza Zarrabi wrote:
> 
> 
> On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>> Enable userspace to allocate shared memory with QTEE. Since
>>> QTEE handles shared memory as object, a wrapper is implemented
>>> to represent tee_shm as an object. The shared memory identifier,
>>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +/* Mapping information format as expected by QTEE. */
>>> +struct qcomtee_mapping_info {
>>> +	u64 paddr;
>>> +	u64 len;
>>> +	u32 perms;
>>> +} __packed;
>>
>> Please use types with explicit endianness, e.g. __le32. I'm assuming
>> TZ will always be little-endian, regardless of the host OS
>>
> 
> I'm not entirely sure how this point is relevant. As I understand it,
> the core that populates this struct is the same one that accesses it in TZ.
> Your argument would absolutely make sense if the host and TZ were operating
> on different cores with distinct architectures -- such as one being
> little-endian and the other big-endian, which is not the case.

CONFIG_CPU_BIG_ENDIAN=y exists on arm64

Konrad
