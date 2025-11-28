Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB14328278
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331755; cv=none; b=IIUyt+BzL7ybCTRLtvpXFBhFTXuoujoUqbm7aq34qTo6ViErj1mnWxCA/vIztnArznvlafjbaHxf1HPdp3Mfo0SPi3l6U1r895m6uhjHr+JBWBXOQwGHwAi6uEDWq9Nm3KGwgu1w7GE2ueKgALeXwWtxQwDq+zbiBjA5wt+rgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331755; c=relaxed/simple;
	bh=X1HS5RlkUvR5Mf8gx702VBsaC1MZAXNBdmskBGMUR0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jBtlg4mefDiw6Ans99D+TdCDbhWotlu9QDd2Pj09BWm5ahJUmRsqBkW/sPErG4k7A2ddiSi+12MrLWgvMUx29aKWzlN3DgvHpxvnFJwOnCKVu+XDEVmKKAiTEhpJbCkp6LOgCIp5xioPctUiTMPIzG72w0kvMdD5VLIkx/Y882M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oj0wD+NB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bZ3gEkA2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oj0wD+NB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bZ3gEkA2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8PAOp3919168
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oKr4XY9THa4Qu8ZVXHA8oIuhhADCzAa7liI6QcgD5Bg=; b=Oj0wD+NBsJfLG7kS
	rgz8ucAmAqBVj2irLdvWim0gmgDBwSzu++UOBfdAZrRouzbL8fUOHV0GG5xa8y/Z
	gQsnNdNIwV+dcUIk76tnVDcvpraFjGZoqEvgToT8Je9V89991MX+JGQw3W7RyOcJ
	m0VPn7sTll5B7FiJSBSIQl377H8qS0bOA53KYClZ3XYS7pjUtmquEKxvxDlDr6J6
	WZVWBjZv2vubGY1UXbp+yyBck2AFMb5xMEnYqgfXKm6BK18aY7S80DGKn/2S/BhI
	o946jj8nhZWdkmXvY79m2awy8O6/6YjqO9UM68mQDnz0Lxk7ZWIfl2A5MOzOM7vP
	9ZdvZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apq66juhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:09:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so4807211cf.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 04:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764331749; x=1764936549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKr4XY9THa4Qu8ZVXHA8oIuhhADCzAa7liI6QcgD5Bg=;
        b=bZ3gEkA2azsXUqHwBB+MyR6D4ZDe5Yxba6Ps5hYY+zAqLwfMVew+/B7n0VmxKlGa08
         3J9cgeMECU8p9zVgU4DNedDRfRXWQtpqOWnb+R9t7OJGJdMetwaPOl1UUCloHdfuo07t
         KD8xWedETYo17Eb1lv9PXUU/cdqN9yg0PjQp7h/60u8hm0s+dVcieyJ0BmqK9kCW7ysD
         Xx7ZG1o5Sj9gr4Z5mb0ksQbkUas8SwrmMMZyX1rpUWcnmxn+kricgqn4JGSPt8WO7h71
         BK8pBlN0oxas+XNKBBnDK6ZZx42r1JqKlwGzLFIFNwlcRfWUaWklazLsNy3oCgfv+sdc
         AqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331749; x=1764936549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKr4XY9THa4Qu8ZVXHA8oIuhhADCzAa7liI6QcgD5Bg=;
        b=KceG26zWeSMfpyEp7URoR598pspqwN7chsFQvsNGOvI8QcjxoZIJgkHC9WWQzzEfSu
         6IN7BLsMHxqP3/+lbKaeiSjd7A2K01zCOiMv7nU16W3H7Yg8EHKy4/xUAGFAhqfcIRxu
         P8wabR1wUuPczf7qGiFSTpPOUMWvB1NF5sOFkF0qJzlAeMpOtUn8xSAhq8njLsi5QPQP
         3IKVqJgJirXK8b1OwkkH/siWEqJs/EdiI6rao0zIfTMoy1gRKd3XKxB/VJB6kv6hZsw9
         Msv57a+iHu3C7gyR5qhcI9JWtbhUteOVPQQBzqGAcXAOiKdSGaawXThzzX6APBIhv1dl
         09EA==
X-Forwarded-Encrypted: i=1; AJvYcCX2mnrF5Fx7cEmwgm+smIhbpuUTdAgiI4fkwTcYsAEaemPmgkZmTPhG1lDjuM6/StQkDc4m98pGkNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YcrIjDXWPSLvg9ZpTm3SDHSkijHSQp0EfLYIyIqg83PH7EJt
	FwLiJ3/jog/JlPxkZBiu8TeBny5gmYGcdRMKY3fAbXrPxGIgQjrJuI8IXd2Yl26HU7lv4loFcDR
	5gxPQE/VJ3oUbaPQXp6+1L1DR1cNNcb7XMt36ypfPm+ZRsTUqTaRp0BlLUiYVBPU=
X-Gm-Gg: ASbGncvGWM07snrMqr5x6wjb3ezt9XKdkohWDZ76muqhP9+5kjTpMULP+zjdimezcfj
	jlja4joSa6IU2E+OSD3hT+3tLlrksoLRzHWvdua3aOtDIH2SmspXUi6dyNpKRwZ82U9H6mcNdCv
	pQkuHpdR6m+EZdlkOypHGQhz3D9zno+X0/h5XN2xisRN0H2gv4pfQqgVkF8EUxQMO39VHhet+KC
	aQh7lT/HJH2vZvkQRuSILps71RJWPrdaU3DyOwUS2Yq6iEfrfY2tUuMR/I1G90j5QArmjyx6tfR
	H8hUPpjM7u9UGWJ0SRvgIrk7oFhgf+BRxkPnfh2sXhv9GCMzVXPBHdYBNk4yDpCYnlioUi2MKNJ
	8bnuBtX85YM9WwXiZMKqMJK1sgzGBmoOQPj2jSPJmu1nXS7JgsWTpxxZ8cIo8PSWHz2g=
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr276238831cf.3.1764331748324;
        Fri, 28 Nov 2025 04:09:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAlY7BCtEp8q1QrNP4N2hl0KDcfWriM03Y+3OtjNiiPI9HSZHAnlbAIOL1EnnUjZgYWinnMQ==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr276238361cf.3.1764331747902;
        Fri, 28 Nov 2025 04:09:07 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d49sm421867666b.14.2025.11.28.04.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:09:07 -0800 (PST)
Message-ID: <ad0ce240-ad84-47b5-b890-03a02efd8c08@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:09:04 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/11] crypto: qce - Remove unused ignore_buf
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-5-9a5f72b89722@linaro.org>
 <b1d8234a-6d29-49f6-bfc7-bdc738895d79@oss.qualcomm.com>
 <CAMRc=Mc0Mh5CjS0C+Ss-AG1qQ2YPOr=kkWc+Bbk5CLgPoPVrqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mc0Mh5CjS0C+Ss-AG1qQ2YPOr=kkWc+Bbk5CLgPoPVrqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H4DSMLtVSOTJa43cJaygHYGpzEFOOVGU
X-Proofpoint-ORIG-GUID: H4DSMLtVSOTJa43cJaygHYGpzEFOOVGU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4OCBTYWx0ZWRfX7Sv79ppTWyCH
 8dwnZm9V/G0E2BmqOc5DoW6m3P0BEVO91x3DCXuIylOVplqU7/YwQQxpBzvnjzDlEeztRqoTNN4
 lkFWA5qfRynZbYh5230T4SslQTKYvmoQLmBJyJNJhJjhl+iGMJD8TREJxeq/B5b5U3IzyCC3Tba
 ZfRsnDaSPNMRceHlxRNHim96D3BvX06m1rWmu3hkMF+FcHVfcvy4r3aF04ey9ZvweNJ58IcVisP
 O4eF77eBLk6jPG6jlM7HW0K89AKoPAR0OwX4v59ZcO0UWuXH+qQXzrWPx6uS5vTqvLC5ODUZE7+
 Qd6xBhOT9QmbS4J4ffuj3PypNc1R7Ke2GBfSPpxgyOTPQZYMtKtWVGsd6demQQv+pZtaS2hAclW
 +e+mpwMVDeZh23n/dCWW7td5SNQjLA==
X-Authority-Analysis: v=2.4 cv=BYHVE7t2 c=1 sm=1 tr=0 ts=692990e5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jrMBgjXTAAAA:20 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ENz42x8E23rwaKT2S0YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280088

On 11/28/25 1:05 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 28, 2025 at 1:02 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> It's unclear what the purpose of this field is. It has been here since
>>> the initial commit but without any explanation. The driver works fine
>>> without it. We still keep allocating more space in the result buffer, we
>>> just don't need to store its address. While at it: move the
>>> QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
>>> compilation unit.
>>
>> It's apparently used downstream, at a glance to work around some oddities
>>
>> https://github.com/cupid-development/android_kernel_xiaomi_sm8450/blob/lineage-22.2/drivers/crypto/msm/qce50.c
>>
> 
> Thanks. This driver is very far from upstream. :)
> 
> I think it's still safe to remove it.

Seems so!

Konrad
