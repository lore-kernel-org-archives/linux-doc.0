Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876165;
	b=vb70f3/rT/l5HXWIG1bw+YoNv8v23l627b+6T6ojxnD7R8cYoqV9RoD1u2rB08ywo1nr
	 enfjz+hAxLMmFJAayQSLDZUUZ3TT7PdP8epreuIAqNxEOEneY255biSqQqA0aISMX65cy
	 fWyEnURaPx4P06rFIfUIH3zKabBe1TXV4nOGCUb+Ipd9iKV1UaYdTmhaR1jbKpEXdwNO+
	 ty7Cza5FeqQRIzUXP+ZWJMgOG/uDkXvnf9n36jKubS+TwtA7kaF9O0XQGwIUPsvUdpcn9
	 QWeFT9Ew1gxm6UWlQ8+H7wljaHQMFRm92CYYgSy+UxRhlEfhJLYPDld2E8uln1BAv+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
	b=a8whaygyVlqcwGJJGMVkIZo2HRdqz2B7ofP3TCOqbeG/o9SBQMMP3fmjIvfSNmjvPNJI
	 dxDWU+e8D38zlJMUAUwBjvR2ha7Q7JErwwXPRhyLZcFRHIWZyCMtkRbHuUohNyKe4zJNX
	 wgCSBMMwrFOMUBZO7GOw1hw8+3MGIMA89izKBsmxqKdiDrD9I+xh9gEo05s0HYOOtSN0N
	 XVO1ab1/jdIaRIZRQBAgHdNmOV4ANoJNVk22g7wJJn2AOl/bUkyGIsDUtHZBtZCdm8hNj
	 WkLewH3wDMFUsShbsP0ah8vyeodjGV7GC7p47R8mUgQsJpx5vIxdUxeVZGYzoeQ7t8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogx45S8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZZBk2eP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B69606A333
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 10:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B69606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogx45S8i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZZBk2eP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59thY53531984
	for <linux-doc@vger.kernel.org>; Thu, 5 Nov 2026 10:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=; b=ogx45S8ikpioi48u
	30lK0LgGgBeGGT5RyPpO9J4jhgbzQgQ/3/Ph7Ffg0xyh/0cFJcLgvrAJ7cGekLEA
	N3FRsdORFOkGL6vBwl3Uc9Za+MXCYECkkgpFWOwOQC3UHI0d5IbEcBr7/2rP8AgS
	6HlUxCse8VuWaRlFF+PdomQHna6mrAJ293Y0tmpjRawc/UwCZ5RsGPzp2AV+Aqzu
	P7m3mPneO5erlT6/ZAYsSCqL8yBoZXQiUcEHtL1zBr50Ok02wJDjlIEicI+5d7mG
	5/obDX8pOunpQoQS2UgW3fseCEAJtFqiZ0dJGPdf2n7MyY8ihlg0X/ulC/03hEAK
	tZmO6w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq9843-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 10:56:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d091514509so435424137.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 02:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793876163; x=1794480963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
        b=GZZBk2eP6x+KEKw5uwViJtmzheDqvOkvIDTHXvsH2fbCCz8gJmAFaxaE48I/ZNAjHk
         12gYx575yDo6IdM8zPlYCr+HvrY1lKHrE35cRSL0D/i2mSJpXFdD4xd9hoDsfxutU8W9
         cFSMh9TmutJ2YQC4cdgYOVD2mjs4/5iJAzkD9MmLZmT0LrAH/Wm32TzI1vkgwZYjPa6L
         WRlSAWHW0N/M7dIr8rdRmwTvZd5hHkhhfAL0Y9AcNFi+hzg6C3ixOgXWgCnxyu4qB5XV
         Fk+qdlyMAcJd/6v8VNkIPGwhQMZMtvUJlDYJ9lbHNZpOHnC2vZ//zu5HAichjW/NYxJn
         F5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876163; x=1794480963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
        b=HVFzARl9VJKPnVcbhu1tXpwiLg3U7gO52LzuZWmVauW67khUK7bXaqh80lLzE3sliR
         1lavJDBYtefAsK/ipCyorjg57Ae7KzsaOlQbfvaTWM/5EQ5SYec0lcy8KObkBrRw39IL
         +fddvCLMDgD2SotxFjd9tbJhZk0lDXle/DUukXxY3LI6q5KcNr5QXvhtLfCCCwsU7ZmY
         b/nYdRqA0ulqkYA0gogAXC02Ju8Byt5fI1ZZo56Y5UwgGf4QTBrVFfG84RTsRyvgI5KO
         XvTrqi8KebQTLcpYaMWFI+q6YA+Kug6zRCFwa4dmrFQJWBeaWpdnuXxv1+/Fg9YAf4HX
         sY5w==
X-Forwarded-Encrypted: i=1; AKwUvBwItafX8GaDYml+MirXTYVIFMQbPLFxCbt4ru6mnA2CWkJnGMKRGtXuDFlLC9TW2ipYxtK6L0/UlLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bfG+aWeAR/HXRV0gIv0If+Z0+Y37FJ8VUGcINrTNT6dVojGC0
	jTQcdk0GidqmhNYLz6awzhReLZbUs9ldSxcb+tqk9tD5ctWXfjxdYgLJ39apuBL+QhSwFT2Wo7k
	VZGxDBz9/9kDXE1kDq2jN0rSgqRma0V0LqVHoT8YYZlwyMqR8qjUtFmvIYIJLpxE=
X-Gm-Gg: AYBFou1sYEp8g0lSEuQfHAVw6xKxQnRfyOkvTvYjaG6uoRrJh5lCPIvafx1GCtp7z6A
	uayopMhqYSoOvvNmUj8aq8QNH+03tzuUPXiDHZXpXlM9fxfYE95mMdkFaKZPwtcwgSdyQsFgPhq
	s5T6K1h84KlvjKo9pUjMpKSVElOeDclJWTqP/hYjQbRSlVcaRA/qqLCLnpxDQeVOOz72UyyJl5u
	SpOqsLIss+qJpfvzWEFW/ytMQwhxtmvMk7cy6gyLzhjL+PgJfrYt6Jk9RC10qqo3ri40SMWzIP7
	TQ38sfkruZXLp/CtyH9HuMgsKyWOAi7tkHq3XNEGa0dFBIE7wC3iDHgb++JKnkRfEIwFMgzmVAp
	hg0+pzXso698W6X3ZSbfhT3y+51y3pIUBKNQcdy0/TN9HB5igzJHIyVyCBTc/2To8OO7Zivmp1g
	==
X-Received: by 2002:a05:6102:6b0b:b0:7cb:be5a:c62b with SMTP id ada2fe7eead31-7d286bdf57bmr1198447137.43.1793876163114;
        Thu, 05 Nov 2026 02:56:03 -0800 (PST)
X-Received: by 2002:a05:6102:6b0b:b0:7cb:be5a:c62b with SMTP id ada2fe7eead31-7d286bdf57bmr1198429137.43.1793876162607;
        Thu, 05 Nov 2026 02:56:02 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm9483255f8f.46.2026.11.05.02.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:56:01 -0800 (PST)
Message-ID: <179b3509-7002-4437-965e-e0e47e59a444@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:55:59 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <b4e49e68-306b-41c9-a374-74cf7ea5a7f0@oss.qualcomm.com>
 <auxQ_ZYMHYJPStox@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxQ_ZYMHYJPStox@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX0OYE+zgHVtqH
 Q2SXvsTRb0Vcrc08M2UW1d5bn6WA+9B7DhLx9ZBXBr0RYBuLSvCDxhsRlk3qb0ELL5KxhEKeTXm
 F6FKbE0fZ2WfsKy4Qwf11kUkF3lHVIaZPQmsXWMt/aLPRasf4bKnnXCazzhJB8C8JwCWV2nbSFT
 jpWzLQNe6sOLmuTgwczmqKypcVm95xoCwR0XDAhxjXTGzkjeIovag3Md+gEXJa4o6GhI2BTInmN
 6udWCbs1PJGJJn5feYtV3jtauNNFCSvXcEsY6y2oFEEHRz914UHSRTu9qf3T7b3HnVa9ebHx5aL
 soL7jdh5HaWWZzvMkCtiC+IdVbH0zo/J7nBfryh6/bMdiSFm68tDBS1gPL2/XBjmbhfPCKJ+ie6
 djxwHn9L8p71ORyra22dNMFBPT3WBGOysg6K7vB9aylJOTmztLiadDkp0xq4xkMBgEl8K0iohGK
 RXPdKTtgj9zL1+ZWTcQ==
X-Proofpoint-ORIG-GUID: mZ545Yr5Yia2KyeCV4sIPn9hRLO41OXN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX2fs/15Zd6u2Z
 CMFVujBRpnkbXpZ+Rjx/Ta8LGOyjYjdVlaGdSip4kUqz46YKa5SRuZ4v2nz+6ldOtgcbO48fgMS
 4QiSUnBAoGN4z8RFpxg9B4qZsL0sMnc=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec60c3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=OeTRdiMGzQZ1hgbNYWkA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: mZ545Yr5Yia2KyeCV4sIPn9hRLO41OXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043

On 05/11/2026 10:48, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 10:27:17AM +0100, Krzysztof Kozlowski wrote:
>> On 05/11/2026 10:19, Andy Shevchenko wrote:
>>> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
>>>> Refactoring of driver subsystems or some core driver parts often come
>>>> with change of the actual drivers.  If that happens within one patch,
>>>> people giving "Reviewed-by" tag only to piece of the patch, like one
>>>> driver, and ignoring the rest including the main concept of the patch,
>>>> are not really reviewing "the patch".
>>>>
>>>> As explained in the Submitting Patches document, the "Reviewer's
>>>> statement of oversight" is for patch as in "entire patch" meaning:
>>>>
>>>>   (a) I have carried out a technical review of this patch to
>>>>       evaluate its appropriateness and readiness for inclusion into
>>>>       the mainline kernel.
>>>>
>>>> The sentence is explicit and complete, meaning it does not allow
>>>> implicit variations like: "this patch or part of this patch".
>>>>
>>>> Reviewing pieces of the patch while ignoring the main part of it, is
>>>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>>>> not be applicable.
>>>
>>> I strongly disagree. It's all explained in the plenty threads you have started
>>> on the Subject.
>>
>> Please provide arguments. You keep responding "No" or "Disagree", yet yo
>> do not give any technical, discussible data.
>>
>> You just wrote:
>> https://lore.kernel.org/all/auxGom0XR-Hax9b3@ashevche-desk.local/
>>
>> "No, (partial) Rb != Ack."
>>
>> to which I provided several quotes backing my point of view:
>> https://lore.kernel.org/all/00390a20-7630-4066-9779-06c8f915a176@kernel.org/
>>
>>> TL;DR: As a reviewer for the piece in question I have done my part fully. It's
>>> not my issue that the piece is bundled into a single patch. We have options:
> 
> ^^^ (1)
> 
>>> 1) ask to split (and review as standalone piece);
>>> 2) add (partial) Rb with the pointers of what exactly has been reviewed;
>>> 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
>>> 4) ...something I forgot?..
>>>
>>> (even partial) Rb != Ack.
>>
>> oh, here you repeat.
>>
>> There is no partial review tag. Please read arguments I already provided
>> to you and either respond with counter arguments or just stop repeating
>> empty statements.
> 
> I already provided you the argument, you seems missed it (see 1 ^^^).

The (1) above does not address that statement of oversight does not
include possibility of partial review.

Best regards,
Krzysztof
