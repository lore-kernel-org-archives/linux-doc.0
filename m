Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A762FB972
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755125540; cv=none; b=EnxRg6lCDormLtNcjb25pJkk3bWgoTWr9NFui7dYC9ohEkbbeeMlQq9rMepjAzI0v7orgB+ioM7VidgY73MiYInV3OyjVcZS5uT3u/yrGisAOendqBb92w+EJPEpcSi+g6ARzjlDZvJe73qT5mGqa9vuUeCI8oJJjFDoxMbzXUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755125540; c=relaxed/simple;
	bh=gpvubl7IBMGZ3fNhTgbXzyPTB7BEybWTWqj8EEGwPiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htAoLFkMJF3l6udPZ7Pb9IQnLytXN/CekWIKFuuyv2+BOj8fWptSphpH4XuuyoSxMgZNbrHUqhnAd+Yte/45JIJXeZ+3GXTHzHnEOyoGtz0e8zHgHn0UvAOuusX/wL8F1YgTYk0tQXxUftM+GocS87q3WSH1FMgTeyhzxVrdW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fjd/24VX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fjd/24VX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBM2dY024302
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t42PazxIAwcY8zhaSfswxJzoFRiL77Ql0tEpJIyMuFY=; b=Fjd/24VXocnkshuC
	d00CX9XpBwlgTwwRriOLYf7uwSvAm8cs1rWazUkX4qDzJgFYycUVeGbRoujWltSG
	HwSuWa5l/p0Iz5QISvF8myCaFiA4NKiLJQKcCPbOZHKnw6qgBcoUxsHVwLf+9ubM
	0Lb8tppanA1gEPCy6TO2avDw2BYmvMA7j7bjOcUadWvTV1rndO+g7894Y1+k0yr+
	4+WJFfDx3v1JbNIOVXoijYZzDLXD9UzZ3DRO9KlS/VljDE06Bqp2mNVjUMIz3W7o
	9tXhUGZuYatTyGlTF7uyQ5cOE+xB42i5KSlV1J4McSHLJOC+1R/BZ0/FT66lXYRO
	sPbLyw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rt5ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 22:52:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e8707254e0so9657785a.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 15:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755125537; x=1755730337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t42PazxIAwcY8zhaSfswxJzoFRiL77Ql0tEpJIyMuFY=;
        b=bP2GJO9IVhGs51IWqwr4Y+qF2QhuMQm5koTbGf9vYkz5Ma+MNEp1mwzZ3J+/CrEncx
         Z98guw9fWs2rZCJJg/IFqSVrv8duPnppgtCE4yt2t5qN+RC/gagscnowr/j3OBuHQlQH
         16hxlgeN8Aoi/zrH9B2RE6ajweYRlsmufxOPzEfluXlO5Wy0xNE2CiLoLAM/yYxU4x+d
         lj8cFxNX3gum8IyRheOISKXoqEa+53ck3feea1oEHysYIPOPIhPLIBSQ29DZ0+1tTdWn
         yVda17zu89KNpIy4MlHK9ryZ/XhPOK9T4Y6v8igw6OHsUsTXCIGnc+Uw9oBpJ7NYCMFf
         hdGg==
X-Forwarded-Encrypted: i=1; AJvYcCWaRc0OzK1DYkkuOVPkm1TnfA48PKNHD2gSALSw1qCyHAB8SDq07XK5LdNte/DaCOMicVBryXiONZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFSjF9jE5GlWmiz9yCVkqUxVsm5he7XFn0cFC4EoRwuVwh6Jy+
	sNdxemM4rmGbLPdWQHXgKUnzWs2MojjqpeUyUU5NJBjA2XbC4Wdc8Z4VTpQZxSFxXR1B72LNNRq
	uJG1IA2EhQ5rSYP9FqvW7wSzuieuAhKqEsW5eJT80V/+aWXgcyOrSc0+NvduMuuc=
X-Gm-Gg: ASbGnctTMrAISaeSP7dJhGtQmNDx5ML99u7TqiFEMwwCR1eGafe1Nvdty8+SGA0a8op
	3RXKqPTr6WMR1t50J0DU2slvGaRz3B+/GfTj/6Vo1Cx1gXwoih+4RU8TtDTDZ2aaNq+IHkfjKDO
	y0Dxei+Q5ObfZTcUj5AxPWkR2UmiZoExvT1N/134iKaZKLQk1qnJB42gpdAe5l+72v548QJBvyE
	3uk3ttKnwk+JHMXwL48B+ID59lwVlDasIVueQF61WlLfhUUdI0B+ReWVPl7HCztr5sVPJGM382V
	HAQ8SYaCxfOstJuBG25QXJIghE0uFpNco3qLDyaFyNX/dhy4nwAJqNzMhHPhsxUhHjGOXv9Ni4c
	zRrAqfuFspLjdzdIDqw==
X-Received: by 2002:a05:620a:4623:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e8705a3275mr89869085a.8.1755125535597;
        Wed, 13 Aug 2025 15:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHclD7EUgbPfmus8NrnhqiEVqDLALZXNIA0vOZsJQC8vPRZCLtqwvV5bJV25qlMQ6s/DbEOQw==
X-Received: by 2002:a05:620a:4623:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e8705a3275mr89866185a.8.1755125534989;
        Wed, 13 Aug 2025 15:52:14 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6186bfee29csm2338635a12.15.2025.08.13.15.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:52:14 -0700 (PDT)
Message-ID: <176361cd-a095-4b81-9e36-f933d159d249@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 00:52:11 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] firmware: qcom: scm: add support for object
 invocation
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
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-6-ce7a1a774803@oss.qualcomm.com>
 <f015c644-1176-47b3-8ce2-2567e529081e@oss.qualcomm.com>
 <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a93b9788-92ef-4b5a-89ca-7e7733697eed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX6v2W2aPxKlaC
 r7j9cxb+1mSncOAmXR1NjGYkJiknPUScgq4ZO3uHbiXpRfhwAy2evUu4DJlqC5qU6CW8sHC3/Gl
 BvQ2XkJeybcBVb6S1vYZYV2B4O7D3bf8YFaTrpqXmj5Ji+yfdKysbmqyqhe8IEg7+e/Ja0l24z9
 2ah0X46VANjYCEHUTpEvHCUub1cdyQDC1NPUpT14T8v5JqhLhyUo5xPpkMXwNFhdgB6rQk7a7pK
 5dJVg1ObcOoRW85KH2QbvQzn078BPIcP7w6OdJ2/8eHqqbOURfVHU0QxL4M5Hri5m+rbkofWTva
 LjZZdgOg32HvDBuN77eg7bq5FvlleAeAZU0DpjD6I0JusUGSM9Oo6epY77fQE44IcODgARkSmdF
 3B7TsoaH
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689d1722 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=pfBxzQCg3Pwb8BljcmgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ePxVFuaEnQ36FT7psCMvdyRfv-zxEYBu
X-Proofpoint-GUID: ePxVFuaEnQ36FT7psCMvdyRfv-zxEYBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On 8/13/25 11:37 PM, Amirreza Zarrabi wrote:
> 
> 
> On 8/13/2025 7:53 PM, Konrad Dybcio wrote:
>> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>>> Qualcomm TEE (QTEE) hosts Trusted Applications (TAs) and services in
>>> the secure world, accessed via objects. A QTEE client can invoke these
>>> objects to request services. Similarly, QTEE can request services from
>>> the nonsecure world using objects exported to the secure world.
>>>
>>> Add low-level primitives to facilitate the invocation of objects hosted
>>> in QTEE, as well as those hosted in the nonsecure world.
>>>
>>> If support for object invocation is available, the qcom_scm allocates
>>> a dedicated child platform device. The driver for this device communicates
>>> with QTEE using low-level primitives.
>>>
>>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> ---

[...]

>>>  /**
>>>   * qcom_scm_is_available() - Checks if SCM is available
>>>   */
>>> @@ -2326,6 +2444,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>>  	ret = qcom_scm_qseecom_init(scm);
>>>  	WARN(ret < 0, "failed to initialize qseecom: %d\n", ret);
>>>  
>>> +	/*
>>> +	 * Initialize the QTEE object interface.
>>> +	 *
>>> +	 * This only represents the availability for QTEE object invocation
>>> +	 * and callback support. On failure, ignore the result. Any subsystem
>>> +	 * depending on it may fail if it tries to access this interface.
>>> +	 */
>>> +	ret = qcom_scm_qtee_init(scm);
>>> +	WARN(ret < 0, "failed to initialize qcomtee: %d\n", ret);
>>
>> This will throw a WARN on *a lot* of platforms, ranging from
>> Chromebooks running TF-A (with a reduced SMC handler), through
>> platforms requiring QCOM_SCM_SMCINVOKE_INVOKE_LEGACY (0x00) cmd
>>
> 
> Are you suggesting I remove the WARN? If so, how should the user be notified?
> Should the error simply be ignored?

I suggest using dev_info/dev_notice, WARN prints multiple dozen lines
and taints the kernel

Konrad
