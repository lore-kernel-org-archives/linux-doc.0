Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EC53009DA
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121203; cv=none; b=ruM+Mwk/sHJhOzh3rieCRuTxA5WQdJJR8NCktyZid+SW1urm55Lvp/0LKAJxk09Nlip6dTkZY6bytCVRI2CUHhl2onFpvGUGsbk2PwTvqdx+ERxJqyT2Cp3+4uxK2hvV/S5zBdS3kAUmQUoD1wwFEuaF2FWMAk1AA63aMTAKy9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121203; c=relaxed/simple;
	bh=823prMjoJg1j0sL2l7SI77tJcgvJxm1hdEbc8+qPckg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eof+H49+QLYRp5ee0gczTg6X8L4MTnMutSfyRHOPfebvUU9zl6HZxGXfX+aQDL5EmatlxjTLPgVjCCj6UVYThNAU80fF6X1s9hMvg+zdMT1y+5vDNG3vK4KDzoMyybHW7M2Go9Q2iypOr5Ptcnkar9dZxidjKPlnR7NxDiJ0ZMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcAurwXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcAurwXz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLhEb030562
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsHqObljI/QrkzM/zyszZAc8Qk56TEyRi+eNAb+o/hY=; b=RcAurwXzpAKXEdOG
	TRd+OlbzSSziHs0RursQXpp6noZ1157tRtAJB1a5hc9wHvfkGroPDG5dHp6Ljypn
	0aGqE0F1t/d4Dd/mfibRk26WeUDnSxgtKX7y79C0/MDYNtUcq3TDGcV16JO8hlh3
	EENDO3rjpsi6Fv4IkkzTUAbvjJFcSsf3esTAVx3EujYoEznwzY0vrFdvvyYIM3fF
	hp20v9KwXZodHbcdfQgLfrzVbfsHbsUYycnGxFau+RMrcBfutST5fj8gPHEt+BcQ
	c3KdObkbzELN7QXHZYBC1VwYb+avioqwBX3p7DKrFP7aFYobmjX3ivPskkahobja
	vmWFOQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vr8cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 21:40:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458194d82so2207585ad.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 14:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121199; x=1755725999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsHqObljI/QrkzM/zyszZAc8Qk56TEyRi+eNAb+o/hY=;
        b=IungESSVEinwFqaATpPMEhIR1mKAGqo3/4r/21wnLoND8NY/5qb4Ua25vX0JkDWfJT
         rLIZI71WI9qxpzvulZwHyldatseaRLU6coO6t7cDqzDlYwI2d0mUuvdaWwTLTMujyepk
         1p7RMkvGNz0/7onOEZK4avQZn3geb+QfCf92FO1W1ehTJqw8RZw52pJHR3uzym1tKMxQ
         O0bnkF14EqkFxLgL5Mof+vcI5duMcPa33GTUID8CKrhSJE8pAoZXTROc/t44Hrx3CiHE
         5/JdcTotttjI89fAZAseElCsf+9wVY3eBcNx76kLpl4usW6AFyKz6FBmBfHAo51pf1SO
         xBnw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5JEmD/NI0B9noO5XE9tZvS5DW2xhGzEgxXdgOvGKtBkcSgNfx7cl9FpzwM3KNzmbs/Y53cEAYwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfOUTMqOPsjOg47fkF/ZojHQqcCOPtMfsLC+x8asrF4CVwRCCX
	aPJ/nUBXaiwOlOyIfPNMT1DCYHM0Oie0263ViilBDfM+om4b8ZYtQrRE1DVJ6Nf+WF20LSCXAOe
	KHjY0mIyMEo09rk6r12f5ow0XTr6f4XQgttzf7x2/XFCHQ0vFIdk2qo0XM966ww==
X-Gm-Gg: ASbGnctZhvxEJnxVJKcHo91ITYDVkTH62rI0oxNqlgx95qVsYMIRU1TmCFLiTeoTVm5
	zKYzI8p2IN2K3MDhzbyXXFS/JHWLzqhXTEGv/seHZ3JHxy+yDNrCQlzaqPxbA4h8STGPHBryY76
	7rthERtlbUSDNMa8CBk1mKh52FXSeSYSJ2OUemSRkxQyPeMpdnKzcElHic7dmvt7QEtwykJw8Hm
	XmfVx2pzFlyiVCYZc5jE+XH/rqadyxs3dr5TMwkWzY2ulLLmOv1Eqn1Q5rn7maNEfxGv2UyAxzA
	v/7zlFPWBJfVS3u5DQTeooNwMzgHVSeaIPpCmWKWa0SQAARx51RBd4LUSthWs8GqMeR5AzVrNfa
	j+wVjNBqTxmrE2Wz3pFpnQGDe0v9Zsruu/H14sQ==
X-Received: by 2002:a17:902:e5d1:b0:240:7181:8287 with SMTP id d9443c01a7336-2445867ec8emr8191425ad.26.1755121199170;
        Wed, 13 Aug 2025 14:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCxnQfRjpH03Kj/5q/5ynChdc9Gz8ERDFxOMx6F+r9zzLYTor/b2ISAK2vcBWx9FA/ouTeDg==
X-Received: by 2002:a17:902:e5d1:b0:240:7181:8287 with SMTP id d9443c01a7336-2445867ec8emr8190975ad.26.1755121198721;
        Wed, 13 Aug 2025 14:39:58 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aa9055sm336495925ad.150.2025.08.13.14.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:39:58 -0700 (PDT)
Message-ID: <d1009d7a-b675-4af0-a149-4856bca29140@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:39:50 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAHUa44FJ9iRMyDHffRBwgxxX27vTwsAwNiCCEGQ8fMQPZS_D+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX9CO2rt4M1fF4
 oOpjW06XeENxNhDnVDxBw/xCKhrV3smH/LIARuCobDqzpJns/kq99yoN1RCqKoGKjwuhXxmbglZ
 L4HhnoHZt1wH1a76pLSnxHtDIg/fDoWiJNlXQCMJmA43EYzK13u7hiUt2h14d0BEE+K8Aes0fjx
 pYmFTb+VfdEx2sVJN+0Vpij4km5ngphPVbUH+eK4xTNzXKVRLqXpdehZCmqFnA4KKSK/t35c1mQ
 wmmHYu3QYHysgsQ/WS6AOZqGlmBYr9Sl36sO7YPi9kmpiatM6mFxxboGKnlriTAGliNh2Zh7LxV
 iRunAsUzxoNxGMUIIg4238ch01lvGqo/1Ic3H7l3ZeEKERpiuU+QJjHrfdZShietTc2SNA6fy6Z
 n3A36yQv
X-Proofpoint-GUID: S-2noicHjW8KArwxtD5bXAmvoZketnux
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689d0630 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=21D8NHQQAAAA:8 a=EUspDBNiAAAA:8
 a=tfL3YIuboUik3C6ywHYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22 a=aE7_2WBlPvBBVsBbSUWX:22
X-Proofpoint-ORIG-GUID: S-2noicHjW8KArwxtD5bXAmvoZketnux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

Hi Jens,

On 8/13/2025 5:49 PM, Jens Wiklander wrote:
> Hi Amir,
> 
> On Wed, Aug 13, 2025 at 2:37 AM Amirreza Zarrabi
> <amirreza.zarrabi@oss.qualcomm.com> wrote:
>>
>> This patch series introduces a Trusted Execution Environment (TEE)
>> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
>> and services to run securely. It uses an object-based interface, where
>> each service is an object with sets of operations. Clients can invoke
>> these operations on objects, which can generate results, including other
>> objects. For example, an object can load a TA and return another object
>> that represents the loaded TA, allowing access to its services.
>>
> 
> There are some build errors/warnings for arm and x86_64, see
> https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/jens/plans/31DmCOn1pF2JGVDk3otBOXOL6kV
> 

I'll fix it.

Regards,
Amir

> Thanks,
> Jens

