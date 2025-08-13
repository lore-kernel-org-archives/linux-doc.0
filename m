Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD6302757
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755123874; cv=none; b=YnX0deneL2aCTFo6DNSjFOLjp38rdcoD48J83Xop+W7fNI0RBKAaVyJmFytxj/cDACxUoR6peO9paZQQAglorfeloTMaq7Dn+7NGTZ/kA8g2xJGx6cUZR4YwlevFalfRYxlNijBE6iw1jUY0nJryS1mQc2Ux6eNu5VWBweOph3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755123874; c=relaxed/simple;
	bh=MkzcIASgD2QGbcPW+Wul+0S3bWjeYPRrF6/zdQI2jik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2G9HJKseMYGG7rn3q4TQxLERbyhP1bUCkiXAwjcV+HC8dA7MSkfsIH+Vs0mKtdBD5BT572Fdu0FozO4+C+mRnRca7+/UBZOW6TdtrF3unO5Q0W9+/JL5hFjcxB+qHU3AtpRNDzNSECE0w3+KeauGHeFY5BlziQ9qVPd5R/hcxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9Rmk/HK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9Rmk/HK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBM9ai027025
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7gth1q5wXt2kbolj7dWwKraNNmPxnZCoAelNEomImI=; b=K9Rmk/HKt+36obya
	M7UIbbgfRjSYDDYDWA3EMZ/BOIvwNdm2eFMRYEt3okNQRPA0cpkcWri3lnn2208z
	b57DhfPUBmsM/a71CsC8D0O0AGP4VNVIBDndA7NCLVIzbv38FMJIAfi+yQht2xNc
	VSuQDiWxyoC+8D1qos/8AaQZjYj43EmBU0CdXTGnrPwt10R0byL6SP7n2tRHtW4e
	MsTJ/Yw/hRfq5eyXk2PmPRIR41v/3ydboLU2mE6ABUihzo1eKQ5uTw2fr3QnZz06
	ecyaMqZzanckeqGnfFNvxfTg4ooITRU5EAIh1v9QvRicXdAvrfMU8kKF4NuFc7QW
	G8R6UA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gdcgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:24:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e8bb2d2so297424b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 15:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755123871; x=1755728671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7gth1q5wXt2kbolj7dWwKraNNmPxnZCoAelNEomImI=;
        b=kt2z+jsoZU9EByj0p835aPujMod8snBBLLNc1iZPSTrpHWbHPTviliSSfmzlpLBFbu
         QyMpyc+Q/UKKubnsket+E+Y5554Rbuc8+BnxWDzDhL6UCtIVZR457AynPo8wckmSn+ve
         o12ObrJkSR2X6mxS4o01O4HMp4Y8ZVyJsG9htisEP5jsZ/k7yEvBUABr6rzIOvcpQa4K
         nBq2PutH1R91MxQG5X2qlp9gmZpFsPd8nN+IXZ3uEN9iTlRt5wBztwt+1vp0xY37R44V
         RBLdLEVNGif9BDb9v6YZL2KQEQMgik7y9LSGP6nmMGgRmZQqUDwqhS8chGrAqmXcTV4U
         2a7g==
X-Forwarded-Encrypted: i=1; AJvYcCV7kyRS6sEhxlRq/OKZ/wKlRNTBV62tQJGnz+R3i9Z2a82T1oKvmchTPmDgQItz79nJHztPbyhBt3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2zBnSrBuuJk1x0a1gmPVQ1UjHbR89+rNUDd7wg6l7aBoypWY2
	T7W4RLRNS4ABZjyisO8skF95hMa6CQghERTjh/IcQa6X4D9N0CBVApaoXIoAhfutWtdXN3jhxst
	tgu9rLD7cuM4dF/u8/G4Sba5l0PyARAJXOrIjKWvzO7pe9I6iup4x4+1QSpUaWw==
X-Gm-Gg: ASbGnctYqNU83mB80ghOGUsA+zne/4gzWtYicP2aVtYvFBHHyPmoJBcQe7VFkYyTsBL
	u+t/Dzdz/YFqXoWdjkyKdksfSwDnvAUvUP1CSx9S58bRRBlCRvT9CyDYR31YeF1StRjlTetEqch
	UtiSc/7ic139Mx/dAJRRCV7mPMe4U2N2khjsjvFsP0ZD5PzxqbDpB0GeFhwqLmzK4YGwM5xqSG0
	5Lb9QkYnF4/tESK9aOqTYe184hZDcL4MSFXA4SkcHHnWI2ymXcbZNwZMUKUZ25UA0ZSzgm3qMle
	2Rx+ZzEULsf9SqArCP+1hnnFm87hinphB2bch4QAQE8+B4FUtqIq0RR0R9HyrGQfqcPiutkSu2u
	jwO+SoBVXch3t0uNc8FVDYuwb/s01Z3rZTB+D/w==
X-Received: by 2002:a05:6a00:3e24:b0:76b:f1c9:4ec9 with SMTP id d2e1a72fcca58-76e2fc23e59mr1085310b3a.6.1755123870893;
        Wed, 13 Aug 2025 15:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrd6YX7PSuR1I0NvscqCwDnSHruYilibycjxTioyww4LMs5uJhtMWQp7pwAdosrJAlaZ3ajA==
X-Received: by 2002:a05:6a00:3e24:b0:76b:f1c9:4ec9 with SMTP id d2e1a72fcca58-76e2fc23e59mr1085287b3a.6.1755123870379;
        Wed, 13 Aug 2025 15:24:30 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd8ebbsm33032684b3a.102.2025.08.13.15.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:24:29 -0700 (PDT)
Message-ID: <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 08:24:21 +1000
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
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689d109f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ShNZIzb07UMatG3o2d8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX2eGz+omsES+/
 +l2zW6xZmb5BRTubah89hQFPotcaKji9VXGBnB73EAwwpz1VYPdDCoXqd69772r2OcpxxC0zME3
 bZfEOqDC/lQFnSbi4LKldQlQFtMFyq2a8atgfUXOENmC9ST3h1an0/Mq8PkI+rE5w5lcAAttIAq
 JMNR8nuw9lb1GvXyS+fBmtrOhey9EI4VVAad2YZ38+QelaZyh+QJpxJGQWG43qJEB1YkLHlQT2s
 yAW54rqfdBAmD3tcLU9RBcvZAHTzS22V308evHrZmyDj12eIQcR3LtuqZwiQRMAvWS5vecqBYhh
 veK9CV4tUYw/6N1leyQ+334Vhx82QsUSd1LOcqMqZuGUax+vEzP6KjujlUGRXM8x0G8fo9aR6Qz
 0YyN2/8m
X-Proofpoint-GUID: ScjRN6rBdwixKPy7Xd_rmJJqsiGiQlXA
X-Proofpoint-ORIG-GUID: ScjRN6rBdwixKPy7Xd_rmJJqsiGiQlXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>> Enable userspace to allocate shared memory with QTEE. Since
>> QTEE handles shared memory as object, a wrapper is implemented
>> to represent tee_shm as an object. The shared memory identifier,
>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* Mapping information format as expected by QTEE. */
>> +struct qcomtee_mapping_info {
>> +	u64 paddr;
>> +	u64 len;
>> +	u32 perms;
>> +} __packed;
> 
> Please use types with explicit endianness, e.g. __le32. I'm assuming
> TZ will always be little-endian, regardless of the host OS
> 

I'm not entirely sure how this point is relevant. As I understand it,
the core that populates this struct is the same one that accesses it in TZ.
Your argument would absolutely make sense if the host and TZ were operating
on different cores with distinct architectures -- such as one being
little-endian and the other big-endian, which is not the case.

Regards,
Amir

> Konrad

