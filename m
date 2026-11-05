Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869049;
	b=ESWbQAmD0/lzC3cufDOPqbgfeUfQbfvsjrLJr+tBssXNlwfysjXopw3V79VGII38T7qI
	 xis6QQ+4o2DM3RULLPX/atU2MwN+xP3HEE8Ged4f2Y6gIgKmYMhFuWMgOKcM+YkKeLj+f
	 871V3WqUvG8qPRPqYV63audzirCHlZ5OZ6cKZHxUv4dSTgSdlv3eNkIXoTDfPmCmR/iWo
	 zYn0uLRyjStYx7/qgwUOao5c4rfVKSO2df/nJ49Vsf13M+r5bsFgmTVnu/74CsqE7nR/X
	 qqKDTE67KcVfWngmKLOUU0AYOazOz9yaSxT77GsLvXipDmr8ghzWzSPqxLVFcixIMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
	b=GhAinbGlE9gr8vlfznYzS5QjkbU1JfwLAbOkdBg2xNpDjIFhO+zi6B2U6qOiGuWU8q+G
	 Xk6uIutFIKa1zaXwQ9TfWgxFj6m3h01GwLuyOQXh4zXd/icSNUh3wdWQN7RyT97umAVAc
	 AJhxJo9p8mbn+uWlTfItJknbc0rDtQ4YFJaZ7rXCaTiJL6WmHLqabEoU/jL4u2oJt5vyT
	 CAEm2ocvSTT1J+EIPHmdfIADTlIyfNewqMeLmOLLzvKWSZm998bIFSIAUiPydPdxA8Nni
	 mAVBDtLaHiA3TKtBAJjYUD7vhz1SoTvr3F0/tIK8tI2k0RUvxullNmPgPPMux0GzpEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOPmgVes;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0TpmVH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD29606A32C
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 08:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AD29606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOPmgVes;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0TpmVH
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCgX942028
	for <linux-doc@vger.kernel.org>; Thu, 5 Nov 2026 08:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=; b=kOPmgVes0FT/yCNK
	yULt2a4HiisTgKDYXq1pulg7qM3DKg/K2//R9VSgyLj+lbdCMeiqb0NIWAqCXJ8B
	4bwxYXaAQMbJwqLCb5iRw2q8nB/D6Ffp9LlI4/rB5LhFD/PTeKZ27UR04Q+Y2nW7
	7zIzlNGw1/7DDt9lkmvR7lE9HL4XPbIbHnMBjDVpYcJy6ACBOl2cyKyAe3wFX9xm
	51o+ywJQ2PAJ+T4TI3sqOJJKQfYKdxPQrx4NsqV+wquI4P2/wvbPb2w8IZBlrtk3
	eQX9eENIoLcWPFekGm1HO+EjsCZAL11jwJXPU0oxlzRBSgyJcyWQX7jBbuyEwvrR
	q0RNtQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj447x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 08:57:28 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-980b637ed69so427543241.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 00:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869047; x=1794473847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
        b=ke0TpmVH4hxD2jxfrrW7rZpPvszl7dTRCWMJppYEdZHMTo7+DoKCRi3nf9Je58ydM8
         oMeGN78ttVjP1Yg2EU5HW51pcZQSrRm3aIcCzbBWWX3Mwn9FFzyMngP1Ntp4gsixaW3K
         yvIV9NybT8ENcaJm4tJNE6QNSC1cx3KHtgW82q/4ynvSG3fuy3+DUkIUySpIY5UKdwhk
         oSIYORD6KHWAvfRNVQVVGrkBIn2Ov0gVRtFydv2uHDPLmoiP7GAmXyg1IKnoBtB/wAuw
         vwqFtMRmmZRM91U0pBrKpaIeduPahxWXTaCjlYT4xcrTrFWu33Xp6Z2Z+PDvnh04Gh16
         SC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869047; x=1794473847;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
        b=Msqs0YU/+00ivmrS+vqvx1BLMJ8P6EhQ2bNhR8L2lD9+j95OmZiJxIoHQSOhnzZTdk
         Xu4IypLiW0yKhujhPdoZzD0qiA8m2SFmOCbFUdFUmzJqQibr78GNb86gvkiggoeG1EMo
         F27J8SzQ/mbOzPHFaN2OccDGIYcJClLXPfHhNvIc68wweGRnYRemFYbzvU3CDaS7Jgzk
         otrECTEZLomiP1Gmd1puPaW/teCrvLqs3npFMrsE2HJfwKNZnCkMFcKe8BBpmv7Rat5o
         AmSoCT6XOMmAwwZTywyI9QCBNwy1x+KHaGAWInsXRg5ytm/RR+aYWR/i6zyJ4yr+hRUG
         sFeg==
X-Forwarded-Encrypted: i=1; AKwUvBz/DFYGSPD9Rr8CwA9/P0RS4UiKbAG4uRlT0H8zC6klEtYKNuhs7edTeSfd+HvvxsPBCBC6a8N2lP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u5weaE6PZkfnjPQYBypbl1Lw02LjnE8HLYUaDQsb+XNLejluM
	ucStfwgFtGD5lMi2WJZsf16T6LIxlPkEZYmuHC9kO2PyP401kHgRT9Wge9ekI8XJ9NlHIxAkjie
	2u8ogCwOIFXbxmUWxGfWV8FNBVIAPmW1gti6qAa8DHlbHOu2ZyaiiyIskA4HOJ/c=
X-Gm-Gg: AYBFou3+BUyOhw+XvTArFvAkfRU43KcmxhJnksLY0bYj2A5RwsLNSUyqdNRMR/Peavi
	1R9+PcUXBKdnI5FHsRm6fjSAzym0k82HZJcmzybgkpgl+cP4aGenzM0lbG+1f+xU+HlgOj8BC8r
	5VGB1cr/9ifKCBAjOIGxRsMIX89ikAeWgssbzDAQtUbnpyI4qugcWE8fr01wBTgtSYqD+UQvWVp
	ikRDOhmpnstFZlMLm+PhTX6huVRzrYNeKDQyo6X0eGbfpqpAgGkWbzGshlRZ5Fm341YcpBSNoOm
	T4FSFykos308LzVQGvf3AKp2Do9P74ByBZPnFaVs9xgk/mK3NOdYPWtBexoDcv/zwEVV4JbZBzL
	BSSCXdqe0qCoAe+7D9OkUfgi5rAMhItNYlwUtFXSgerMz8Jm2xb+dBmIgkX2RiGM1e4fA1/AbxQ
	==
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr8900178137.2.1793869046737;
        Thu, 05 Nov 2026 00:57:26 -0800 (PST)
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr8900171137.2.1793869046198;
        Thu, 05 Nov 2026 00:57:26 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181079sm9185094f8f.8.2026.11.05.00.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:57:25 -0800 (PST)
Message-ID: <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:57:23 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxDTdfMVS3yazCk@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX5WCYRbQ03hli
 /FSrJcV/WjhzPo3RdKdGUXHqFVc3PhagX/I6IkUWurp/tuSnuRbWuWPLR/0CHcV17rJfVJwWpsy
 e2Kn3GSPvUT7sSwGPPnXHb8ThC4KpLF1dzBcI1naEmJlO9nu+w4Vqp/EPw3f+K0HfO8QV25Cyyh
 mA07TslSsjrqaVxV5O/CCHVezcGCZSxHf5loHLseCJimi0BasN/5kJCmv3bxP3VTeFmDtoH+NyE
 mxNV5iSSc3XaAQrAie/Meq6rHwUjybvlG5zWWYMgbWEuPVCB4iZtTbTIKpJwj/6wRBRlviS/guo
 2g5It8PnYAkSwR4+RD03Go0aN1UqpVeTiJ9ogSgx3F/CO5t/IYf7HRrH4b4MhvagESaaxuXDfbR
 TaLerSXiZVj34+BVQsHFuWhW2wsRDtsGoKmk4ALQOFIMNUp5x/o23768OCUmgBc49cWs3FZVrdC
 KkvL37tGTCQPrTCugWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX03dtpmPlVit1
 CmRRL9cCvupDejlh/vv1P+qH7h7p2HBdWV6BcUZmzFidRbMrCDytvsTwqcHvWSS88EJl2qnshrv
 MT28+oJIq7JQ0VxZKbXhQAP9qi/dnOY=
X-Proofpoint-ORIG-GUID: XvUq3Pcnvln3kNGzixeotnl1FHgFMuWK
X-Proofpoint-GUID: XvUq3Pcnvln3kNGzixeotnl1FHgFMuWK
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec44f8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=QIhr-27iAAAA:8 a=6PtPwRdlQZAe1Mv8CAcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 05/11/2026 09:50, Wolfram Sang wrote:
> 
>> +If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
>> +then more appropriate is Acked-by tag or adding a "# subpart-name" marker
> 
> "... is an Acked-by ..."?

ack

> 
>> +after the Reviewed-by tag:
>> +
>> +	Reviewed-by: I Did Not Read Everything <foo@example.org> # bar, baz
> 
> How about being more specific?
> 
>  +	Reviewed-by: Driver X author <foo@example.org> # for Driver X
> 

ack

> TBH, I think the above is even better than a generic "Acked-by" which is
> basically "Yeah, I didn't look in detail but the general approach looks
> fine". Which is not what the above says. The above says: "I didn't check
> the general approach, but assuming it is okay, the changes to my driver
> are correct". If I get a couple of those, then I know which parts have
> been reviewed and which have not. A list of generic Acked-bys will not
> provide that information. So, actually, I think even the Acked-by should
> have the "# subpart name" once only a part of the patch has been looked
> at. Ack/Rev is then describing the thoroughness of that look.
> 
> Do you get what I mean?

Yes. Part of the Acked-by tag is actually unspecified Acknowledgment and
many maintainers do not trail it with "# subpart" name. It's well
accepted and known in our community that Acked-by can be for everything
or for Maintainer's responsible area, implied by MAINTAINERS file.

Reviewed-by even with the "# subpart" still appears in person's credits
and reviewing entire patch of 700 lines of diff code (like Frank's SPI
patch) is not the same as 10 diff codes for one driver.

I'll send later v3 with the changes from above.

Best regards,
Krzysztof
