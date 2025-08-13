Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D1921255E
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079255; cv=none; b=A4tLDr+kERU+kaDFrFL9V5+IdKp22zZvMTdl9Ru4B5wGUPABnWa1Y6k3Lbzzcjzl+ebJPXu8SJ87uPJZJSR4OZoXDS5WL3dduFDRgu3jpfWyH1dYKffgV1AOtndmbga2GCIqLrFuqyIrd7Vo+liAMEgGj92AUNm+lsYVoCQ2c84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079255; c=relaxed/simple;
	bh=cBywqYQ571JjXH/CFVXtPZFVBnz+yE4lfUMvOMd0qMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHDPgTRtfsSSXrUEgilyVdLOWmkttfGl/glM+EytjE5PBvxslaRLzgL9/mGRfnpI/cLFYjh5Bi3VFHlNJFEk9H4hgsVOX7A5NftbbIGUgCB2kwB71r+HsZH6ftzO+ktrZUo9DM5usCuExyAYeXOzc2Ye0tBBz/HtAnbJC5++uBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9CaoIbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9CaoIbL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mhtM016517
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 10:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wiBWcdk24yow8RF3k9D1Z3F3r9BgHRGCWV7I+lbiN7E=; b=N9CaoIbLvjII5iGW
	91H0wJPvVuZVgOQHfDedopcJWkBiXmu0ICOQy8BWlNAMtuIFn76O9zsijrMcXWaR
	nGy1Lc3PT43fWeQIRxtPT/wUiLltdupUp3wNKpr4D6+EAXiXh4Y8inhd+D0CROS+
	QvyvLgiKqlvKBtRTXqbV1cO5t0dB9S9+v8yPwFXbTTPA6MgYB2fzMCuUCJvhmITS
	jVdz6J9Z8oSnKORIzJeeMhKraWxKcjqxlBdua9wfi2YinhduTNdaOnw1ZsZxFm7E
	EXQIckRprZ49SAJVNw7MUW0hmGfMqL2vtakcjWUxi7WJVzJI3YEFLDrBS1JssXgF
	zzOp1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbeht9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 10:00:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b07b805068so14636601cf.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 03:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079251; x=1755684051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wiBWcdk24yow8RF3k9D1Z3F3r9BgHRGCWV7I+lbiN7E=;
        b=kkGeRRjBKJmYDJon8JG6n7WmBWvZOtYoU4RBk8CfYCjKvuBbS19FM75xfduV2DSB6K
         J82gk6h2ZcPGoirorTuW82gAZnxbbaD5XxAFXSk+PL5ITs4q1jO+D9XuPQdKHCFKdagx
         uSB22pbq8/wNleoGhPAa+w/XAzbz1USahQ3LAyDj1ThNLcpoyU6ty3idqRI56dG+UiD5
         +vmL2OCB/jp3dvXlsYt86Y5eWS6OVUruJ3w/Leaa8hJ5lBd8oB+ecieEU7LpXKeNj23j
         VNRPCpQ5Gn5q3YT9h9PgorDAJaEv9QF7GjQChX2sFAKD9cE0rdMeU1+nEqCG5Ymw1XPf
         rbgw==
X-Forwarded-Encrypted: i=1; AJvYcCUgeYMMGIhnqYbRB16GJSzqRBOtDnjIzQoKtL6iMsKS/WoTjpVbv0IwkIAuAMH+/v4wPlkjDA+KkGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdYLb2y+zBESCV4YidyK6zYF/23WJW4pdwWIlUh6+dvArLW8AG
	3UxwhCy3NO2nVS/yWt/gycM04pOx4zKlo/maOXFwXUbcn2yJNrJyzKXTcriWr4oLNenIFZ6TLrR
	VVznupnxxi//b6jVV8b2/lnS0fLXdjfgHTlceWmm0Zu5hLU3zv3023enc7f1zPVk=
X-Gm-Gg: ASbGncsKdWv9LGG9iVSsN/KTlWJGsHulHhJU9nAKPnNfMUMRE1T3B94zBYXboeeBU0e
	7azv7jC903II17+7NEBrDeVHAUXyssqJZaoP7zfCNhigbCU5X+Xg5zHdJtkoRJymsln192Y1qQV
	SIhlN0HcNCfCUMwor5eKUPFxYYhCsvZ6qu7mnnrPwUPqFCuVtx4aB2jW1KKDr2gcHcA26XRwcuR
	S5v4Wz5b48GLTsqFuxrJM+mQNOLzIrZlx/Q4R7aH138LxBpxTzGxq2V7nsyI8fR0FVtNEvekfQJ
	LoQpnlDq62M64uknsgN7ky9iIjmw8b613KDLLniVkHUmgb8YqyrT+9+3KT5UTs58VPozaidUB4l
	DxEcpCaie75+tP3Z56A==
X-Received: by 2002:ac8:7f06:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4b0fc6c46d3mr13966831cf.4.1755079251116;
        Wed, 13 Aug 2025 03:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmTrD4ySjMqSbwhalzXJcsozDXyEzKvaYMIjrNiNP0RSpO0suJx9JL31ZtBXBXWoPTlWVUaw==
X-Received: by 2002:ac8:7f06:0:b0:472:2122:5a37 with SMTP id d75a77b69052e-4b0fc6c46d3mr13966501cf.4.1755079250541;
        Wed, 13 Aug 2025 03:00:50 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3375sm2366142566b.41.2025.08.13.03.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:00:50 -0700 (PDT)
Message-ID: <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:00:46 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689c6254 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=WNCivIMphfMWkbBb3CYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX4EyQo2IuT58W
 ZJQC1YhPjThqURGEsvJR6x31j8ZJIKvh5YVGwm9MunUxcp4EhtbKNDEXzqDx2dAgLsIvcu+sovO
 pqga6Q9UvzvpjL+kc+Z2QI4qZB8vxadh1ipIn5fbo65uisMv68j8CdSCvInw3AZ2gzFNc48zptw
 MwRc2sRUxB8auHvQX1cVzWOc+ip8wQi/KUyZoeolJTxb7Y/IVMx86Xwg5CiGOakHB1ITP+KIg/q
 0M1CMv+qbtaO2pjcSRyi3MuKX3NBriPhnWivfzqn7wxy7LQ+Rg2Fmwyh5BgBKtcy7q69GoN3hnK
 Enzv5VWRt/9cRaKjB3yoZlmUPvn7BQ9mPvkv+dekpFpb/UPGAUbNcuajYvyQKAZjlArU46YGAE5
 3L/0pfur
X-Proofpoint-ORIG-GUID: o3gViFat4M4wVasZ-5Nj-DOcfjA2Tztb
X-Proofpoint-GUID: o3gViFat4M4wVasZ-5Nj-DOcfjA2Tztb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
> Enable userspace to allocate shared memory with QTEE. Since
> QTEE handles shared memory as object, a wrapper is implemented
> to represent tee_shm as an object. The shared memory identifier,
> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---

[...]

> +/* Mapping information format as expected by QTEE. */
> +struct qcomtee_mapping_info {
> +	u64 paddr;
> +	u64 len;
> +	u32 perms;
> +} __packed;

Please use types with explicit endianness, e.g. __le32. I'm assuming
TZ will always be little-endian, regardless of the host OS

Konrad
