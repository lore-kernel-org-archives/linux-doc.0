Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC0A327215
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331400; cv=none; b=rG/8jZWkn/LGCvuEAOlh7bp+mixW58DEEcqnRePM8ue03zXm4p1Yeov6bKr6dBwQ1y4qbGJKnM4c145uTDNtdjQoRd6EiiuaPcZrqZK+qlYLpWy/Ky5rjdPPqXra6Bhzc3XmlWmfQ93GJRg0v55pbyMKMdxxhZ38sG4DtatT8h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331400; c=relaxed/simple;
	bh=gI9TZ0qesYpRchQnmCsWfJle0T2gVsum9dhWtazzYhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XU+ILgkXzJ0deT0rOl2WeM+ALXSg7hY0430rnzithusShVnhwTQxdDTI2wL/m8fpVWyL2TAbp3ar9qv9EWHVGVV2zf7/uc5AryaEX5dmvgQd/Zsg9WuPzdiULYIGpCBM3q9QdZoLwdBPRII+seDF1i42BxEmN7o0EB1ey6Sn4FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXsj2XWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GwJlR3aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXsj2XWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GwJlR3aK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8NvCD4191737
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1rbYwToiy6vrEo3cBORYpLqQ5be7RIQVsuKG8oVUHA=; b=dXsj2XWpXgQOXeLa
	aAqQVWaY21Pn6MvDMbQE4/PLTC0WNqOghHZGX48heSclJ/JiBVu6QEVk6txrBAz6
	ub6qEg8B5JCIBqAuO1mmavE7DUl8xT5gPk252snPtL/8eSOP8kAXOdVH5qVsr63B
	NmgGMH8vRxNuiFw1IfkypQRVkcAgaVqREEXWj4TnY6y9lKPW37iXRBxPhi0HJ+7I
	JHXl/cAKQfmkdO9L+Q4+4QHit7oQ9ROkATSAv8/95s/NeWxUFuDqBDjo4fP+pSyO
	hgbl1Z+vpQ/EKzEYQ/bUGECnHlrGmg3gRyk6GTlVlEC2jONoWRBTsT0S3Q89d7a3
	T7vzwQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq58fh38q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 12:03:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaa289e0dso7214671cf.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 04:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764331395; x=1764936195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1rbYwToiy6vrEo3cBORYpLqQ5be7RIQVsuKG8oVUHA=;
        b=GwJlR3aKT/6ajh9GXicIegiVJJ3ZmwfzVl1JQkvYvKZUnkFCNDeVsI7glDevZ/uV5G
         9tm2mYo5hjQydFACPsv62klJg5BQGh0bzViJSv2O6tzcuVVGgBxUxwQmOtZRldo83luy
         wjCAwRQnWvI6JJftv8ivFBN+HOXLNz0DyG85BoJ9wuGoN2P9psDBQR/WeSR6cw0ykfuB
         0IIjUpNzXyiY6NTEBTsX2oROYvMsU4BMh6Kb70uW5UZqQf362UrTDIQzQCH8bJAJvk3M
         ze/3QquFEn70Qe1/g+XYfF3HIeXSeFd37i7GMh92rGURTI3VKTCFwgsaRneeTjZhb0wc
         Qwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331395; x=1764936195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1rbYwToiy6vrEo3cBORYpLqQ5be7RIQVsuKG8oVUHA=;
        b=mwZqWPqvhAgdy57EnKpbuNty0HGdcSk6Rbc0g19F4zU78OQTfjtLPJpnpdErArrKsL
         3D4iAWnyzFcT5Xij//tGiQCybyQrYWrVk+KWyKSqaXL0k0v2737kulgJe2Qctk9Xndou
         T552/MtqY7gIp+ufI92GJhOKbAYjelwjI7nOFkvgMiZOCOo6Ao4lrd7GLI4+6j3iIvbQ
         2JXcQ7LIRVYVm0rTe14eGSjsqFYsfT6k5x7GkcNKE+yYwMI1IwRSscSxRUvJ+l9hX2QQ
         mQDOGi2ubDTJJ3u8GSQMTN52+5GVqMHdSfHZ7WMoRVR1ZskU5jpk8Gr887jIv+GFS1hV
         3S2g==
X-Forwarded-Encrypted: i=1; AJvYcCU8dyucGSiXjjY9fToLfglGXMEMEcw27nW46mge3e24TIOJCqGtLG71oPxU8LXfPLnr/4kPWI1DP9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZWAuLSN/c4fc6WDOHxybNqs6c2qBxECBO8/tpyksVaDJipvVX
	fogR7gyv33DMJD8trL4hnjhm+i/jHlXbW/ZhiGOujOu362mos42bWPy3ib62W7Mw4A8loxjQn6q
	tpKX2IuCgSHJj2Kr5Qr2tAqZBHJuSrk4RZRpFswhxqBhEDZlWbYUPMD/nxIaVQeI=
X-Gm-Gg: ASbGncsY0rJ4MKm9diyUWwZ41YGUcz3c69Jp7JWXdi+gOX25ppnMP+xic1ZFsEQdJft
	7wTDy0Xh06g2NuACe/5L5CqlSprtB8ec6LvlhGh8asLHF5NQC+MAUefgzqkhvJNdYF3e9PWO9Ho
	MJ5NEryNAtyT6Y6eULOpvipANlqtM7QQXri3I1Ph8fi8FeqipSbQbmwa2GVhnV0XcB/RH54JZGI
	O56fYYJ2uxBFNrB8LuYzuQHPloUcE+ZnvU85Jk8rvjYLnQeszjuAUHI1TBF8D7pEb1icsX22AtF
	K4kLBdV3yjeFo+r6o3npE/bZNxE27KCbULy0dPROnXnA3sP7US2Oeiu62X5UGeQiacHe0FicEUY
	e8/gF5Njax6lgvJbiNGzg/HBIZ3qrVhAx+GvpmqRNFdkYGQbyQbSpfkVP63vx4HadKn8=
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr293260271cf.2.1764331395423;
        Fri, 28 Nov 2025 04:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpz0IsBfLxHZyIJ3r4cJaVCTuzbtrQbveyDFdAcyfDdx1RZCSL9CU2KkChwNM2o3JuZNqE+g==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr293259601cf.2.1764331394940;
        Fri, 28 Nov 2025 04:03:14 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751035c24sm4149349a12.22.2025.11.28.04.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 04:03:14 -0800 (PST)
Message-ID: <22a4ede2-2d9c-4067-b908-a95d3390573d@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 13:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/11] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org>
 <20251128-qcom-qce-cmd-descr-v9-7-9a5f72b89722@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom-qce-cmd-descr-v9-7-9a5f72b89722@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OsHzhA_0RRu9B152iJiREv-_rRx9UAKg
X-Proofpoint-ORIG-GUID: OsHzhA_0RRu9B152iJiREv-_rRx9UAKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4OCBTYWx0ZWRfXx0HMB+v05J11
 q9fKV18L6q6VwIB9ZpC3BWD6+w7eKG6bDBJPRaBm+h4Hfqo/mlA2dvoeDbKLHbUBllHYNkzvpG5
 0lI2S6SAqS4m49ywzdsoZ++JirScuIm5ANdpDZWsTG0i7vxLq2vTmpytUnWOdzPlbqdE2kAI+1M
 ulSCfozkFJwe7kuSHsljRPbz96n99C0180imhL0a52k7ZlvQ0ohbeD4o27Tjh8iQIuz6VfrA3pT
 +gzZY9Y4uQ9zNGf3v9tjyLmku2ZpWTy/NoFnps3TpbSFfC3vygxIGFfaz8y85263lKvIeFw9ZWO
 aR7NFydZlopkUA/TthK+9XVB2XSNb0ziCHJEyWvXPe6jWr0cB+1v7lQ/D7IRqGZPrAM1k2/4W30
 /WbFIL/LuiY9Z39/Ov+QdORS1UEvAw==
X-Authority-Analysis: v=2.4 cv=E6DAZKdl c=1 sm=1 tr=0 ts=69298f84 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wXQIig4NBtMv4ZYXLh4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280088

On 11/28/25 12:44 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Switch to devm_kmalloc() and devm_dma_alloc_chan() in
> devm_qce_dma_request(). This allows us to drop two labels and shrink the
> function.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
