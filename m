Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF82F3BB44
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732365; cv=none; b=E2jLkuX1PpcbMYGT2MFvWv8hudnvs/74/rkffhekR7PHX3izT8tC30tNvvpt6h/wJuX7kKYWhTFpKAkUw+yUCLuL+tfk1gCEmSLRFB3nxybndP5HkxQWkfylsTNMckpK7X8D2JD9Q9QkVzT/blGjLZY8rbzPNaIBhPs7fQ5ISmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732365; c=relaxed/simple;
	bh=EKiQzoEkzljnc+viujwGwJeys/BQXOjyz6zoi4u0dvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFkbO5ezcXSbAzQu0pjV3Q0or5Ljnz++gJhaKSTTgm/neZq97A68kIeR74pTRavusQYqNamHsYCbJjqf8p1um+iVrfcjcHZMsCGuANUmOJzSQ9qtmQxQVa1U7sGqvsqzLL2VridqM3AghWFoD5dFNe9q9xH04iuLPtYFwwzntGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2FHjCEJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxDyUWCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2FHjCEJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxDyUWCA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TJqnr4071972
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9CJ43V4EbjuhLmiO2IaWAjx4
	TLOb/s8qWCGW7bqpIoc=; b=J2FHjCEJbteIYvp8WoUyPUf3glmqk75C/mRhATyt
	gNMdyEOI2/mhyxqc1f4dp6R7vLOYGZ97FgPAJ4ilXwSp03Ia+y4ltnq6M3LDKe5n
	GGZq2dknd60+rIQlwsC1njurnivFpDusv4DxR38rpnIAZS6yGn8WSX7KbWpdCpR5
	OrUqzN4mKsBKKaHzMrHygX4a/yANTBf7FcLpJsarxextHIbsy50Vm3jYPqjuSA7n
	4ic0/qn1SqlJoYWXbeovMh3hqy3/pXuOc/EZvWR8Ab8JVROq4bPyhom/jg0jyUX4
	knXRCZL3n2DIA4gzmbGoDJcqaPihz612oJYFTojY7NqUDQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3k8jyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 00:19:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a5098029so8372244c88.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 16:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732361; x=1770337161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CJ43V4EbjuhLmiO2IaWAjx4TLOb/s8qWCGW7bqpIoc=;
        b=BxDyUWCAE7RSEm/iDPX8d2vETfM5sj1V5ZJTeYiH0UpZBEApN/nM8ETrFVqTCeHI0S
         90EdZsqTFfWuG8MiuWKKpzEgOjVpz6yAWSrtUpjdc3yt4M5atpD4gyA1iszLu3aiGbi/
         9MosZ7rqTJ3ZVEBQcMzHXSfDBhLrCzo4IPV4rMzF3PxGx0LnlnrA+5PbUPLmLdix2vb0
         vS1vnvQS12TAhTF2BbSSGDDBXoFAJ0eswYP9jDRHiSBwZfPzi6WYURfuB3lhzyS0xTDu
         y+U4sV+JJhfLwdicZgT4r9249PYqYygUpqxJ2xB0A2HZwiQuBP+lypvxNhn73rt/HXUB
         tiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732361; x=1770337161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CJ43V4EbjuhLmiO2IaWAjx4TLOb/s8qWCGW7bqpIoc=;
        b=IeHPWor0UQ5Wbh5I5SCPXTCq8Itf3sN5zbCvrE2s2SrxQXM3kiI05UdRGF6zvVltqj
         /8cUNNg3Pu2kOH3OLzwOJFpKgKmhDEA1vfkmE6q/DLEwt7DAYPu80Z4+5jEUAeiDsCBo
         pTZTCqNBkzDRfJ2t6vfjR/hK+tEeHtkyyLnj/nXzUi8g5jXjy60dHH0Ir5ZUu0WXgYaF
         I8TukgsUutIqACSxw1nmfKQtuZTq60lFq1SC5gel8sw9DAyflj9zdf7IlBv9nnIayaIW
         opJe5Oy/F8grxIeQMhXI7Hiitb8jbabVfpkr8cxOM+B4mTubBcxerCnSDk2W+Ncgaal7
         qMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbOukrV6rJuKVzZPpp0Z8313cjPFqt8pVLLDwcuSvREFCUMJClU59cu07V1ajIHd7aJxd+IrGDeww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ekUySfu4ZikIl31/1jR7H//p6VedD6SyprUwECsZo0o0V2rq
	9KByzv+zziYhR8Jpv/dHwdWc13Aot3SpaUTV6OSfiiAYD2I4hQb0Q5ssqlkMMfeGE7OLXAKhRAg
	tQI9dBLsjOTCQX1m/YAwgrIgZl9LQeVRsdRp/zVwLziCMmHi45eWvjwSJvCWiLz4=
X-Gm-Gg: AZuq6aLLX9iY/pwi1BrSZNvgt613NPCNSXV16QECTd8vqflZ8XS89DwntP2TD2PCHDo
	eZ7WYnhTbDIG2fgX6xHsn9K80oxiK8YZASM9aMXbsjHo0emSLqcosQIj+Mkr7zLLWYTf96mw/pR
	+jY4TgeID1heP/XZXBJBhDxgjiSd8nRrVetn5X2vwanytSD7UAeecSmps4dG3/ew27R3rh7M3nC
	N6QNFuS40KpwPUxa6Qbg9H30/6ImNM1C1PY9kl1FNzz6YYDC4408BIcLlB8c5bwq0uftNxdGH2Y
	/yyqERweA7wOygUpRt4qA7xUyLvv2r8bLFxLHMDbDZBsvfKBuShIqBa7JQ3jdL7+h8lTWUeu+gO
	8DRmd2DOEq+xrBovNfcaGce/A9+XObWCRsIb3e5xySJ5LJmym76ujadCtz5gWe1U=
X-Received: by 2002:a05:7022:438a:b0:119:e569:f274 with SMTP id a92af1059eb24-125c1021a87mr570952c88.29.1769732361340;
        Thu, 29 Jan 2026 16:19:21 -0800 (PST)
X-Received: by 2002:a05:7022:438a:b0:119:e569:f274 with SMTP id a92af1059eb24-125c1021a87mr570937c88.29.1769732360795;
        Thu, 29 Jan 2026 16:19:20 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d8ba78sm8163033c88.8.2026.01.29.16.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:19:20 -0800 (PST)
Date: Thu, 29 Jan 2026 16:19:18 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] rpmsg: Replace sprintf() with sysfs_emit() in sysfs
 show
Message-ID: <aXv5BipphkogvzkZ@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-2-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217065112.18392-2-zhongqiu.han@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697bf90a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=APNczDZykQHC8614KWwA:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: MEMoiaV2fV5zAs-0qXzN8e_MLGbm5zKK
X-Proofpoint-ORIG-GUID: MEMoiaV2fV5zAs-0qXzN8e_MLGbm5zKK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfXy4LPIWFnix9X
 xwHlGvEFhLkEZOCB7o3ADZBQotbcJXEtyPKl3tx9S9hboP4kDHc2l702I5lyi4+GSr7+pvhNlgE
 0LX7jOZ7c/m0OZ3SXuGdDjQAHx3H3ntKVyD51Brq63zMFFWJ9sBOeJ0iO4Xwu0FIw5PmxBu7Odo
 qgM2ExWBmrIv5neqsYTfDoR0sP16c+eBM7/E1UoqGl4K0SeONaNG41p5f9rk0QZHogSEBVhLpLI
 zmN/3uYWHP5G9mbEDHpbS/h9JNjj5aOTztBfHRyga+5lU7yiXomxFRR9RX6YxjXmS9ZVR003x06
 Ypq/0dLbtByBdqlL3zXb4XG5+oNVGJjYNW36lnZ56MDEmaSqWoQSTamppjhMILsGg439D/YCXPL
 POSt9s+XD+XqdobjujhhYAQCZYKf7kArlpI35hYDizrmPAK3ltCZslAwj/no6gObTbwW7iQYnYY
 trnXwqw9oHcz62+t2PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300000

On Wed, Dec 17, 2025 at 02:51:08PM +0800, Zhongqiu Han wrote:
> Use sysfs_emit() instead of sprintf() in sysfs attribute show functions.
> sysfs_emit() is the recommended API for sysfs output as it provides buffer
> overflow protection and proper formatting.
> 
> No functional changes.
> 
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_smd.c   | 2 +-
>  drivers/rpmsg/rpmsg_char.c | 6 +++---
>  drivers/rpmsg/rpmsg_core.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>
