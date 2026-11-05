Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876598;
	b=ovtzcFGYcIrFeK0WURAhX8F690Tq9xHXXgWjkF+CyoPInGom0LKkSeARmMxOhmDweBUl
	 egBp+aMDkuSW7bHH/ehGm2PiQxDT/ehvVlYdFdoQb+5E6rF9vY849TQDcPcZ1Ia3INAHA
	 6ylNKNv8s1mirp/wVO/oHQXHlmwffRXeqf+FOLVhXr6uKJUdQY1ieIDa1YPDvhywYmRa2
	 89dtBjY6sJXdBzCAhHDD5i7FYI7iKkZ8Zdra75Cz0LVEpRhP47Yz7DygjNQRoMODaTFC4
	 EVQpITpcVZFY52YmsBjFVbDvu+P+RCwNAWOlL+DgQy6gUcwZrnfjFfzdqPuvm2J2iPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
	b=Yi/F//akS16QVKUnOEJcQ3T40AsPDkk9DERY9lPL5NfwMJlM5nt9a1o3bVOR5ILNTmLQ
	 qa0zeazrmOFAK/YIsEkefR+pKk+Rv9fMeNW++ODybDqBai4TNhhz1Xg9eOL/dGVVF0GWU
	 zQn+4v6WCHyJ77vCETpFVw5uusFzuHXzGwrr2dgrp3Jdvh+9I5gDeSEeRAurfiV5fD8Pc
	 Ps+jASax/4BU0HZs5wqaJqmMCdaExCnyWQjXnMjG81rOiXAlkxIevrl0QegRCPEWzenG+
	 YtTx+QSbDH0SE4pSVaQDRCiEl9OrvtfjDxx3n/HmU/TsAr0UPhVBOdeIlOJi7lR5HHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jF0ExUx0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoRAp9mw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BE8606A332
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BE8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jF0ExUx0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoRAp9mw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tFJE082944
	for <linux-doc@vger.kernel.org>; Thu, 5 Nov 2026 11:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=; b=jF0ExUx03ACGKakR
	whAEaqh9BwuKo10HtQ+tUkaOK/yWNcsbbUwYIejCKHU/sWDMFoKP14hxo5X5ARrI
	vaYmZbSaJNLvXWzi/LGpkpkPEt8lxh/JvVO2wPCZke47HLdJNTrdAVMd3gj1BVTG
	lf2N8tjDNdX94tOIA1P1+gGSvq2JququWDBgTfObfqmOYim6kSamkQUV6qkyL6dZ
	5iISF22ADRBIF8FgnAIecr3jPeUXQqMczkA3ia/baiuTSVElwXCA1tuel6NfPe4c
	uXHeDvj0OkD+AVz2Owr+nN8nV9MNCnaNnSuQN1/xBNsODe1spFL/AglbcsCLzhFZ
	DdLahA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p0dfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 11:03:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc23a549a9so1374235137.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793876596; x=1794481396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
        b=LoRAp9mwoNFjBdJ4ze9RUrjq13li63LpHKvJa4q901Qkxbv/Prt8p0NBerjaBQf+et
         fF0gQXV5t6BOWMJstpktBGjo4EIfZ443/BCJpnJI5n3TEWFuowSkkvj1nfB4w45gkD8D
         PuelOMPtvfm89Q2Qj1wSjtTEzy128xrzyP031/BVnLk+PZ3sYQeHWjKBIDJ68t2CRjD6
         ZCi4UoGUIen0KmghVZFXOK4RrnNuewhZNkWCv5d5sIL28DJRypsxV6A4EXFbtsWUl/+E
         lGGNHwOlm/dGUSN0KS7WnNlv+uBi7Ce302ESVrsr7snEGuXAMgIH/3+ki2DevhLFcbUf
         I4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876596; x=1794481396;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
        b=n3uKOKIAd1xp5Cd+Z4M1yv05DmJb/q3KIPEc1remxS51aTlhqLeJbl5qvH8HZyROHl
         wqkl+HGbi+Pu5gymP7Gp4TUb8uKLr38EXcbw7lQvq/z/elGyOtrtYJIC1MjA2QArDFsy
         pDj7bSVDS0fTOe/prBikoUW6CTC2CiJxcEekjGMegJipFxsoZledzkRg7Xix2+57T7tq
         yg7ZId4rk72jGZ2auPnavR9NNc7VP9S5gDF6JK8uQgZv4FAFP2MYhCct35GS78ndHpyY
         +afh5ifIlaXlNXDwg2GhtSPr02oPzI0RAPCjAmNUdDaJd9RvI9L/uu/a8r6dOe01xo4h
         hryA==
X-Forwarded-Encrypted: i=1; AKwUvBxF6HrG87BZHZVmOO7XQZ49cvzja5utshMSRFJ2mIN0M0rUW6W+I9hM+gud+cf+ZSTgJ/fjRw69/8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LwapGyObxBpf6hbEsIzt7ccgUVAXR/GmERM4/f6PbJRF27D6o
	PDxs1AQxPdBDyOtDD/vorKaj8bM3Uw7is65mu/5ji9LXfEpyPFTzy7+e1vnny7AgXh3HY1RTHG2
	AyAD5YZPviQYzojtSbevjdZNwq2jKo/BWHCqTt4bqe8JZKyli+P+nWoE1N7UAIenFuq17Org=
X-Gm-Gg: AYBFou2HyIToKX5NaMT2GEuxAdRgrfYguKXsOZdUIyJG9ckkIILev4GHYYqATYVCffY
	UvBiqlraBkmS340tpdo+pdbkSx8H+vNNGYxxWBByta3hAednp6FojY9dxP5LQM8S+pkoCysqyXu
	mfiCmAb+V4QnxiSjuZZcasyEpGbdftDF8GA4U9nOA98gYxVzeLtu22iyD6kYhdMo+YuLQw3A400
	yy6gX3/RF08a/JFdiEb027lc48V7h+ex+itAiyrwhhz4Snei0PvQcgCExcOGd1VsJkd4JUw+XCL
	9wdkUGr/zH6H6AkhzXnvVAAMQaYKlrCkVv0EFxIqEYr4JcUu4joBTHZqNaAo0baEBqaAH1mnoMb
	AW2J6x4aNsKJrQokcKSlJ0vKBjY5m/RwYB1lskyuXmpn4HEKIxkubB9EG5KTuUV2hq5JUBarR5g
	==
X-Received: by 2002:a05:6102:3707:b0:7cc:115:ddf1 with SMTP id ada2fe7eead31-7d072ca6eebmr7950982137.23.1793876595983;
        Thu, 05 Nov 2026 03:03:15 -0800 (PST)
X-Received: by 2002:a05:6102:3707:b0:7cc:115:ddf1 with SMTP id ada2fe7eead31-7d072ca6eebmr7950951137.23.1793876595418;
        Thu, 05 Nov 2026 03:03:15 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180eaesm10978778f8f.2.2026.11.05.03.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:03:14 -0800 (PST)
Message-ID: <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:03:12 +0100
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
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxMOdmFYDYGjqa9@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec6274 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=iee88rELAAAA:8 a=7vjvkMWgNjT-vtUVTPQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=dabF0gHGKZk2vt9j88Rf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX1dTTp2gHh3UM
 t0nOY7wWjGgHDC1yQJVlroDMFzYp3LTgZ1XNdm9jYhySIT/eLaXY+DmYpDE/GlZFkii4cf2PQyB
 zlxYHQyx9LxfHUOTVMofo0uRRQWZOapdj3Lqeo67aqsjmuc8n0cBq+/igS43r3CgSiBFIsZ5uLq
 wQm8PX7Cr2iewznmjB94mL/W7/I+TJYZX+F9LnfeDkUBfhV9QPPsJ/5dVkKUGZlSLbQEJLrQN/q
 hdRX6M8mgeLsQiybR0UrMCY1ak3ur3wg2MvT9RcB+Au5JUCfGzdNyky2jcRoVMcDLIZ0Cz6sp0W
 /k5xkA3tl+riK5eNTcAw+wfLsYBdtoJmuIFagMA24WZ2FFPF0Ulo6T7Cl8hyuK0xxx+mxVibBKX
 Pg5Amggo1nQQjL6cD/LIAX7YDVpBAhrBhzsm+eB9ZTyQ/EtjejqgLkutTCsbqwcea86OEppoTdp
 I1zonCEUkI6zfJpL/rQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX/lj8yam12D5D
 l4cCSr5auI3aN55NMDDphOp5ejykcUK/xc0YCPrP/+O7ZPP7XGREPLTQ9+e4PrBe3uMl7fmAnFc
 KTei4cfd+NX8t3jRVaFpErJWKkbDYYo=
X-Proofpoint-ORIG-GUID: yyLUFOQ7txFrrKU0ctopEI2_sGXFxj7M
X-Proofpoint-GUID: yyLUFOQ7txFrrKU0ctopEI2_sGXFxj7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050043

On 05/11/2026 10:28, Wolfram Sang wrote:
> 
>>> Yes, if you want to spoil that, you'd need to introduce
>>>
>>> 	Partly-reviewed-by: ...
>>>
>>> or something.
>>
>> Ack is for that, no need for a new tag, quoting:
>>
>> "Acked-by.... user may not have carried out a technical review of the
>> patch, yet they may be satisfied ..."
> 
> It seems you are mainly aiming about the "Ack/Rev"-distinction problem.
> I don't care so much about this. I care more about the "# subpart"
> problem. A list of 10 Acks without subpart is to me as useless as 10
> Revs without subpart. The subparts give me the idea which parts of the
> patch have been looked at in some way, at least.

Sure, let's encourage that. I do not oppose "# subpart" usage as you can
see in this version of patch. So far it was simply implied. We know many
names of maintainers so when Mark acks patch under regulator part of
files, we know he looked and acked at regulator part.

> 
>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
>> found acceptable according to the Reviewer's Statement:"
> 
> So, for the SPI patch: if someone spent time and reviewed the complex
> core changes, but only 2 out of dozens of drivers, this would be an Ack
> according to you. I would, however, understand that this person doesn't

No, and I explained this in this commit msg. That person reviewed the
MAIN concept of the patch.

"Reviewing pieces of the patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
not be applicable."


> want to repeat the boring driver review a number of times. I'd happily
> accept an:
> 
> 	Reviewed-by: <hero@reviwers.org> # for the core parts
> 
> But still, the driver parts need review. We got a similar patch for I2C
> and 4 drivers out of those needed some cosmetic improvements. I reviewed
> that. But I did not review the changes in the dmaengine core which lead
> to the driver-fixes patch.

Nowhere in my patch here I said you CANNOT review part of the patch or
cannot even leave Rb tag for such case, right? What are we discussing
now, exactly?

Do you agree that if person skips the main point of the patch, the hard
part, and reviews only less important part, that looks more as an Ack,
than Rb, considering how "Reviewer's statement of oversight" is worded?


Best regards,
Krzysztof
