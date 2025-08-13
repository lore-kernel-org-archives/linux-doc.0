Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2092F3C00
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079626; cv=none; b=D25WyHeTqwNndTr4di0ALdo9tvINn3j+enF5onfEVj4yJYkye3Sp/8bYKRUH2lZ27qmYvBksxy+uvJMluaJ3z4EP2M9cCFTexyO8I8WA3BoyeZGucmM25bkzL1R9IRcOpA3uS13U+y8WK3yhgs+gNgCUEkZ0u+9qgyMexX7LgC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079626; c=relaxed/simple;
	bh=CRPKsVAhqXLyl5B9IWZbInaWZbGzzt5vGVn6BvQJQis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCDa4DsrRTsMZW1szPBG4qa3wFD86685pBYjn1YWXD+6x3SlHzUDHlJFeX/5/wY9D6flvjopBm5BFr9j6ASeo3VOutud/YoAQtdwN1srE/VvgHlOzFihwNDBL3+yQxNo4xUGZD6HvXtXCRQxU+UoQjVCDTWg2CNeEUV/JBLnHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPoeXl4I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPoeXl4I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mI4i003903
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 10:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lo/uyCg8eI45CIAczel8wExuTSXtA1VT9FQTS1gDCiI=; b=TPoeXl4IjXVD2YQV
	7PgGj9r/3vk0QoRPKTnaIosHjf093O/ALUsVq61RqOpmDap4f+w999tmLJ9urEst
	Nl7bDUeKgmBth6OefCysUvALMPvErT66ikBQ3GRPjzM0c21pZfj6H7pUbnLkUlp2
	gzHM4yEy5pzomSygB2CLW5ggaKuY8TiOJmkAMhHp+jfz5z0el9m1cbsm+IaaDiWa
	Y1R8WWMZwz84bWml2GpnvdbBo3sb48jZU8MDTVBYu6AKnzDOtm5C48/hM/iXu/Oo
	sxNah/WcqjrvA5pbCeYWSOeMIYin4eFMs4IcVl3hkQQnrhkTGpE1/sHlh5WWjSMJ
	wFZHoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vpa37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 10:07:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0dfcd82ebso5938461cf.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 03:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079623; x=1755684423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lo/uyCg8eI45CIAczel8wExuTSXtA1VT9FQTS1gDCiI=;
        b=bAoxioW/7g5h/FtGZRtqt+8/MnPhMD+yNzAy+Z0gvasjPgrzH6WHIF75DLb5D9wjrG
         e25okx/mSsj9vxJpO3gtpsbAZO5SzMUuYYV+BSzs2ljOKwoLZnJ1+Rhs69nNPdAmCBk5
         8LE0MoUwseUj1q+DYcLKQwZ/sT7QiH/ZcC2fBATtsqa9s0po6Lz3DB1wFIRXFs4UyEGO
         YsljACq5amBR/miwcuTfxVSC6iWWerPINewO0ZIj1nVyzYMUgUhZ2vKw14HZ/MeoqU4I
         2V3S8nNDh9l9cndzUe1g3WOL6BIKOpHz+Fl/DwgBmGEb4iecIjt5p/fbTTwfGfXyzLmj
         c+bg==
X-Forwarded-Encrypted: i=1; AJvYcCVf1Jj5e4aYCkXxHFF52IGhthtJT9Pp93gCjWXpw9MgJiHvYw6HcXPNja3YakWTSn1I2h8w/5Y4dz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yDJw11ywN47daNdKBiZjStA5W0jKmETIjbw1l0kJVLxnwhWN
	rEqoQ8dWo6xfzaupNsWGpQAaA+eAIxRNIg0mvyohbDdzXCGUPx/DgHSuF+ZkYWejQ5gpObxMv06
	ioiENqi2Wwe1w6u7H6ckwQepnUi8hy8NXNkCCfQ6+VRP4l0iw59iU85ny+4yB20M=
X-Gm-Gg: ASbGncvJ7lF3qst0QD8MuE3ClGt3B4+1vGpNTHUrQPEH+AeTkyKIPtfK21vF2evlIAU
	A1Lck5/ASrsrTOhg4QRa8wFFN9iLlemryvx0hbWsuDHbKrDoZjDuVxuzSfmlt8jYFb17Jz1G2di
	+fT3xbxNrZNH0Z8PqKpJ49BMBqYpxllK1QVwk/74qccUev+bY6t/ryBT1oVpQWDrNY/IKlS9f//
	Rtkiq6OnU3ftgUUArWAMSbdLWkW4VpTJvAD41gAFWvhnX3SOPLv0Lf1Q4vK0IG9E1BD9FWnbzvL
	eNZt93QDCkcx/JSf1/J/vC2Pm9cAh2ivKF1eVxkycneRe1ingj9/xeffkXkUgi4KoUvWls/6fKs
	CwSv3ecQdichxLL8V4g==
X-Received: by 2002:ac8:5dce:0:b0:4ab:609f:d7d1 with SMTP id d75a77b69052e-4b0fc6cbd31mr13706771cf.4.1755079622756;
        Wed, 13 Aug 2025 03:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbEx/52bIrz3cKGljrcyVxad9pOt/IN1rRcYfZiJuhcUb6gPtWuoMusDjEvu/er5MYTpmlKg==
X-Received: by 2002:ac8:5dce:0:b0:4ab:609f:d7d1 with SMTP id d75a77b69052e-4b0fc6cbd31mr13706491cf.4.1755079622218;
        Wed, 13 Aug 2025 03:07:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b6csm2371260366b.48.2025.08.13.03.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 03:07:01 -0700 (PDT)
Message-ID: <f10f1602-972a-491f-9c11-95e5e7bd80f8@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 12:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
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
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXwjKtqNPDC0QM
 1a6Vx+ui27aO7UmpEYBygq2ciu4EegXO4ZdJ9uqiuQ6PAnfXvx3s+w7b3/y9j5OqWt8PcQ5KWHx
 SocaCSpXMQ8SCCGfngCd6RuoriOFS5gF1bxR9XnVMEkSfQGnrh7BmN23KaowliEoGelWZNp0E1A
 ds9DEPhw91fBKegRcV62rJSrF7XofIrTxNq6Sv2yi3FaF0AWWw1D+Cb/L5uI+5+htm8hfJq9+pB
 JPxH5ziUr2TOz6Ssy1KG5CaMf315OoAO9d8nn6ahz7NY1H1DnuBzVSnlmeBOtVEBXQXFpEil5J7
 WgC1s3yRq6qVs94tp5niUIEk8svxYW7jln6n1VPK/S+yr3VeKyki1sejQgOeVVZHrRgQycHIur8
 AxRO/by4
X-Proofpoint-GUID: l9361rsz5eIt1fhLfIYsSTOEA_zzKExP
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689c63c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=clTIM29CJtwRRT_IFxsA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: l9361rsz5eIt1fhLfIYsSTOEA_zzKExP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
> Anyone with access to contiguous physical memory should be able to
> share memory with QTEE using shm_bridge.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---

Hm, I thought the idea for the tzmem allocator was to abstract
these operations to prevent users from shooting themselves in
the foot, and this seems to be circumventing that..

Konrad
