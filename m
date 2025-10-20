Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1C320393
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968647; cv=none; b=CjP4FlVhY+So7zOHDCqZ+bSdeCdZauOB2RyocJpC2NPndyEcJ1ZRgrAWjM43fk9c9EeEbLIG8NuNvr9n5sGw5ADMQh4GHt8MCDE+nR2xhfRZOiJMpnDillWB3Sp1E6G6ZgllCd8CwFhalXme67EaF8cgGrTIgY+e7SzR/XUmX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968647; c=relaxed/simple;
	bh=A8hOd+NyHhmPh2zHInfdGnL3TO16aSzoKbKuuytyv14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPnm5V4Ze4zTRNjuoqL28w4IEBXaFojh2h+bG8FRjK7gZOPXu5DszWb3JHW1tmwEwQbQ2cKxRxIU1M4C+fTdlcCFwHq1mqjE0+m6yjbuTRHSaB4c49rGfXmKaldtchF3S+5dgPDZ/2zUxqDFwmgTTXiIpbzddbl1+fVPaiQ5Sv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdfWAVpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdfWAVpX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KCDmvI001320
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIJKOvCxcYruswbUzq9fr5+Eh0foHybSIq/Oms+hhQU=; b=jdfWAVpX9TExDMuh
	ZK+3mX23sEkMJmAsZUmCsoEJpxSUm4EncpHPNzAias+XnllwWVMgqj2wKteUU+87
	4Pq1osV+X0BK6FFF95HCsHeE69a/aA/UTnobWObFTSOWha0M5mx4i2IoEgEapdBP
	s7c/rsoSiZIXYhZxUGkL/d9HTsUSAYo/FfnV+FHATOU89QKHLEI/Sde/pSFEzT7n
	m4e2ds461LJ1SdSgjZ/AILfkTGbGJBcH9uTPFq5aXeghIX/h6BrHZxr+pOR3pkPa
	u2O36w8IOsaXyyhGx5lqRdCiffKgSYB5zX+w7OKl6R42KdjZ+vxodYMHWx9WXmig
	uk6AsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w2js0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:57:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-339b704e2e3so4402611a91.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 06:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760968645; x=1761573445;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIJKOvCxcYruswbUzq9fr5+Eh0foHybSIq/Oms+hhQU=;
        b=UYhel3LciTx4WxBIAojtXbVdkFRsGvdIwqFK7sFUsB33CrbYF8quF0W0LTg9eo8vhf
         qXPtIvEXDkrCgcx2MK1g7LLzlRdUyj2SiMO9bcTsTZtWzCmFzLPR7BlHB+9vdfC7vIB8
         QPbnyN3cH3W95f8jmsh7l7cHdJU2MvqfqRDhM2OhaWFglp92X0wSKD31vy62prj3oQAm
         XUwtKih7tuviQ3BpsDrZtRua5QMpM/Pub1UfihvzdZc2KhOXonXCs2FDXLZBIoaBo/F9
         u/UfMKP4jUY1DrP5P0EEA2y4evmf9FCPV+PXeaWX6j2cH7dunmtDz6T7FOVHSwwo7AIk
         FnFw==
X-Forwarded-Encrypted: i=1; AJvYcCXaZINhiPwVUnUGVsM+FO9yx8JMmGMMQ+TfmyhFLkFXRB5jrr8tDeQh/8rM4MDqQUaUSjfTs8XxhWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9dXyOXK6EJ4OjONYqJwaWxR0Fk8f0b0Op1u8UXywsiMrzIvt
	JnFV1sFGebq3rmBUZ+zA+ohq+av0jsobz7oGZSG8OwTbp9o7cj2CRVPZWJpsnkfScvam/fR/fqR
	79Hcyx826PS7UNPwqp8WUeG8L9v+MtFsj7FG1YKA6jqlVUftX013NJcX5ssdyWUM=
X-Gm-Gg: ASbGncs9ZrfnLrHPUUq6NA60VpUrO/YnjYWKtxzh4V+6jqt2dl9h9oXzzb2SGXdQJHd
	iNESRpkIaF8XSqX4gOSW/HItu6oIb1mtAnX6H3xeB5MpGa3aL0dova7dilXcwoOumuMh4IOU+jf
	u0+MZV82clS3NnCi96UiHvNNN5EUFCLvHCHitQIiKmoHq0uBjQB+atgjY9K+C/l0d7wF7OjAIbr
	GQav2TWf2lGFEeDlivh+3iH7ZDjBVGYOIx57DVlmEEloRwLuMvY1z/8ringmqyyRDD+IKyg1Hyf
	U+GIpI/W5dN9N9Bst3h3vqHZ6f8iA1AHybguSKur02G6qqFBJ0oH5bIQeHoBsvDdLss1S7mZ660
	qaP+Ga+tYPE9bAoke5PnWQpT1dhaVzsv5mwhV1vsA14Vq0pVijDN/ZdiUsUw=
X-Received: by 2002:a17:90b:5386:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-33bcf85b45amr14364029a91.3.1760968644486;
        Mon, 20 Oct 2025 06:57:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA4meynf7p6pqVmPtlHOuUrwOJeYLX0JWNpq3bEBdJBjh/Gd1Q075D8zivONKd2PftWkqGwQ==
X-Received: by 2002:a17:90b:5386:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-33bcf85b45amr14363995a91.3.1760968643935;
        Mon, 20 Oct 2025 06:57:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bcfc12fa0sm4940456a91.13.2025.10.20.06.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:57:23 -0700 (PDT)
Message-ID: <e5f7d87a-e170-4cad-98e2-5e492e679c21@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 06:57:21 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ktap: fix minor typos in ktap.rst file
To: Randy Dunlap <rdunlap@infradead.org>,
        Clint George <clintbgeorge@gmail.com>, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251019202053.285723-1-clintbgeorge@gmail.com>
 <ba148c36-8778-425e-8c94-35ebd708fc80@infradead.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ba148c36-8778-425e-8c94-35ebd708fc80@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iAudjlSwb-ILxsJEgZFX-qh4JtOggQIr
X-Proofpoint-GUID: iAudjlSwb-ILxsJEgZFX-qh4JtOggQIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX2m0yytTO5QXF
 7Dr7BKcoUhhMgq29K0HM4qCclxCCeYpCUDslFAO6GA58iP0CFjXI5zZqh6lPuzn/NBNQdxT2vF8
 WSk4pxx0C7ay4qG7tgNkkcaLt0LV55n/33XfLqJWOgqumVXovVbeMMsMo+2NUMbENCHCdsns0CX
 nM6nraCwDfTphya3x8Ejwt0+Gk6iF/+Mef0gwpOUMBUkGnmxvGnbZ/0Ihz2ypxyjXEOD2qiCBkY
 7Kp/fOkpRcUybth9eu93KRXcM/6Q64NyTHr4SF7CEU17rBE+YRAFiMfBm5k+OeuoJPyCjrcy0oe
 7QJsv7xBiw7I+LalnfjG7f6bSixGuYiITTFZHhjO/7Ew/fGM6SfmPpIC2K84bO5PqKwiSt4yTpN
 w2vzGjIoXGZPNkDEtjwAYDfmMoeu0g==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f63fc5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EM1FLKRHAAAA:8 a=pm9b69XgcQeHAuKcwUUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/19/2025 2:30 PM, Randy Dunlap wrote:
> On 10/19/25 1:20 PM, Clint George wrote:
>>  TAP, or the Test Anything Protocol is a format for specifying test results used
>> -by a number of projects. Its website and specification are found at this `link
>> +by a number of projects. It's website and specification are found at this `link
> 
> The '-' original line is correct.

Randy is correct...
https://www.merriam-webster.com/grammar/when-to-use-its-vs-its

