Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870842;
	b=I+kWunpck+RXmY6ROCGNKxtmyRd9lQsUZNrNztswtmSHPegXQ6rNnEdLBb0/0zKeTi51
	 AqS7JOMrX4FSsKwlFkLGuPC4gboPIdQzAP1UGu8uyesG1DWp1qga9ekWai/1LoPqFzVk+
	 1+9LoVH7KkOwTwzTfzry0AixjvN3+S0Vv4pyBZewgnmA1GEnvoyYLjKcdh/h4o30/f9m4
	 teonz4Tk3ToXX39DQyx+LkaJQCY7H2+HPUdm8aKDv71nNocHhjJbqKFS1BcKDDMkecPnP
	 bNHxsj20iv2YiJosoFVrccPKtNtJrDytuL0rdebsH/jfQNDIZJnHlsIsz5XmE4V80PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
	b=b2RTZDNCWFpA56l91yHIcUsAQl7UL8b7fRTw6AuZT+1IGhnc1oO1Q4uhxs3WTuhaqyaQ
	 valMa9AeaXNbqaOolv9K0cqfy686BmaRvEpBvGmZmGLEtKqEUnu8luj+TvZJj2bJqHXxz
	 fYpSONB3CrCtQjlnwNUKQ2sLsItv2eX5uXnrIVs0lb1Pr1Qi+8UYby+VJ90qvnr8CipdY
	 QmigV/GlVEOYi3eNrqkXTE6aKIZLw+/r3afzg9eGrUVvC8z9JtJGoZ2T90SoohpbXz3eB
	 kTpPS5e/2+edK3RPuT2nKivBISoICfv0H/Tybsh/dIKkHqnmJr1vZkpkUKpAHwERKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XQWkIk+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kpWRrQpd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33700606A335
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 09:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33700606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XQWkIk+O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kpWRrQpd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UfSd3625021
	for <linux-doc@vger.kernel.org>; Thu, 5 Nov 2026 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=; b=XQWkIk+Ok7/eQfi5
	IaDYWuVv2yxFE97D8rHVvTqHT0jWQeZHW3rPFIxlSYJDzInXMpqJhJIkegdHGT2f
	TsJIloo+4iGqv8f4lu8OlyF3QYn//kWLeTXBlyzlql6BuaTkkKuHDXIj5K9myXK7
	A0M6Td045rgUbG1TOFX1D1YH3m/YrvcdGT6tfPvsgERJXwyexNgLfLC6/jbXjSLk
	o39sVMbxbeTOjgIQP3oJ4QqK2jT6mng8CPq28tpYSAAd8oAaSDwi8BcCcDkK5L4H
	inYJ7kZtjv6C7Ig//5ADu9o8MalmfputOOkbGNt2gg1d1ANUl3vGdAIDeYkKsSwQ
	3w2nfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br48mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 09:27:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so419668885a.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 01:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793870840; x=1794475640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
        b=kpWRrQpdKnw+PwtLSXQ+4apLLYG+UokhufIDlOztnE6IwtDPA8x+xUClCo1hWb/fgD
         Y47xHGhhUq2YG6paGiptAoG9weMdkGgT8roWDy1o71ZyYWfYB6IPVAKUWParmt29t71P
         AzWtEnLPxcBXSdhSpukOPF7DqXvoO6iDFbkYIXA7b0of5O51FOGmJmEJMaGArCCgfYFw
         M2VlT8B3iXWcT38I6GQiQz/hUecsZOoitt1lnfktL46jKo28edRM8TtsZGcy2TcKBrKl
         aKqiIYoEk64iiyEqu5inHhTFIP4TqS6njIb2NBmpU72rgbFDBaAeI5ENnLYy1vk77Ecc
         K9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870840; x=1794475640;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
        b=uFbqSIQNctU9aAbSJNx1T1s2DblUQusjl1M6WBYg/C7mtPoSvuvsHN3e/m2gFISvgd
         A+fF3W8oN48uKvh7/wnI/ocveEropGSjBHRgkwBQeGkcjyATOrqjazxfkJNZWRcW3VJi
         9LWCotU2TeU3TVZVY/jeHbdhhbt4DY8KTKy9sKC4x6gzjm+WMvxu8INmq3yi+0U8TCo0
         Av2HRmBY6552Ju7cjJe5cARZITimhVnHTI6/YyK09S2DNioAtUr6p3lyV8OGqKbWRRkN
         rIZVbPJGt4SMSUBw56q/GYIVK9x6wRqudga4wh1XWWCEhHNJ0pxJdCXOpNYI3GbwTYKD
         1AlA==
X-Forwarded-Encrypted: i=1; AKwUvBwTXQmj+DHv/7RDBaGVTxTu9c7/oW5Lq1AKfQiCBrIbOUzer4ZfSS5NHxYwS68ryR3CVQksqcEjhD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yww+RKwHXppAupjx6gExpwaX/uL5t1b70gs7fZrjWZTlxgo9s
	PlEBeaHGPovaHHD2sLXjXWEWAGffQtLgTpUeQp66fx6GrNbab91SQ+srDCMR8x/37/l5xGCm2LY
	PqlOtlHkbKIHjkL29QfOsVR1AlyEUieaS3Fv+ZiAQNvhFpHtP7G7/0RQm6JoaClE=
X-Gm-Gg: AYBFou3yUKe/LuGqfqLxWHOxdcFHcAWokywQwDQJqX/AfchS8Sz0SsUECIOrV1xxJuf
	OrE7rGnbygCwj0VQ27H6kRniHX0wS0SeXU0UtpyfT1tPBORaT0R+RYYhGuIo/6TYH0iuKhRbqPF
	QGGrzB55RdNKp+GvS92kZHqDdwXSMzVLigDeS3iXEYauV6+IZrPe8fUTWO61AzISC47A341qHb8
	OoxAZ1mzrtjHDd2jqxvLLX8Q46BvExMjTI8WgrmNJ8CO7KNM/xxiSkn2fhARYmNs0eUXjwF6BVJ
	uJGwT77HsHYZCbvdDbz8nc954eoZ6La+wrYHafkmLnT1FGcWRLDsWTU0Cs7jCUF5bOB7gNp6fma
	yWUoWbBIsM6+/MJSnhLEToDBfGM+aLxKEETmQCh0F7hE2HWbMigP7AsnI4GsuNnoBkpI7+GcjtQ
	==
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr3139966485a.10.1793870840286;
        Thu, 05 Nov 2026 01:27:20 -0800 (PST)
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr3139964185a.10.1793870839833;
        Thu, 05 Nov 2026 01:27:19 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm57928185e9.11.2026.11.05.01.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:27:18 -0800 (PST)
Message-ID: <b4e49e68-306b-41c9-a374-74cf7ea5a7f0@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:27:17 +0100
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxKHF7U1x_Ozwpm@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNyBTYWx0ZWRfX7k6a+PZW1Wiw
 MER7CfuiMAO5m81phjXxKDorp7tm/pu7NYrEEalvbPX4i2xDKA3t/bDhK7sThmsv5EdWyunz7f+
 lFoNUo/5Iwlo8vTt7mHd7p3kIpEda4O0VLM/iNsYVz9ZYB94bnUSf1XPAq+yb7UUnL5E4gLLHjj
 NsICXUj/ANLS2hlPkhffc1p51WjAoq/020xQ/aQsQfiHSBb1HsCgWVoJf4GEI6oSGA0Li3Gnu4R
 uEieilbDkPdqi5isrloZV3nWxvh9G2HtbIjvaRPyGePRMQF+Z0WIJBbBuimqb3QICG20rcf9QVX
 JVxtkUXiYG/ni0+sCV1dJauB/mw5Uscb57RbjQHtSileb4OtryKdUSTR2cx4THs6LXGel5nFUCz
 yIGqHgkAM7fvEpyTtkbkuF1bgZKK3UZEK3fwPIp4ble9+So11mPSDr5N1Z6MJ2xTMqL/YbIAGHR
 SGz/xhz4SZoVadMjoeQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNyBTYWx0ZWRfX2QDnjYC7BA1P
 9GjLDL0ozCnv+WhU4Js1RB9g0FaWBGKcIvrsxcsFlOzp9+UOf26eLv+33UK1anXUpGaZuJ/cjdq
 MFJhDTVjLvEwQQ/3lcuWDfck8AqRB+0=
X-Proofpoint-GUID: zW4a19DRD6ylI966Sz9cbiIkwZ-MpaDh
X-Proofpoint-ORIG-GUID: zW4a19DRD6ylI966Sz9cbiIkwZ-MpaDh
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aec4bf9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=I-sYKaSChvBqotAcINQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050037

On 05/11/2026 10:19, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
>> Refactoring of driver subsystems or some core driver parts often come
>> with change of the actual drivers.  If that happens within one patch,
>> people giving "Reviewed-by" tag only to piece of the patch, like one
>> driver, and ignoring the rest including the main concept of the patch,
>> are not really reviewing "the patch".
>>
>> As explained in the Submitting Patches document, the "Reviewer's
>> statement of oversight" is for patch as in "entire patch" meaning:
>>
>>   (a) I have carried out a technical review of this patch to
>>       evaluate its appropriateness and readiness for inclusion into
>>       the mainline kernel.
>>
>> The sentence is explicit and complete, meaning it does not allow
>> implicit variations like: "this patch or part of this patch".
>>
>> Reviewing pieces of the patch while ignoring the main part of it, is
>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>> not be applicable.
> 
> I strongly disagree. It's all explained in the plenty threads you have started
> on the Subject.

Please provide arguments. You keep responding "No" or "Disagree", yet yo
do not give any technical, discussible data.

You just wrote:
https://lore.kernel.org/all/auxGom0XR-Hax9b3@ashevche-desk.local/

"No, (partial) Rb != Ack."

to which I provided several quotes backing my point of view:
https://lore.kernel.org/all/00390a20-7630-4066-9779-06c8f915a176@kernel.org/


> 
> TL;DR: As a reviewer for the piece in question I have done my part fully. It's
> not my issue that the piece is bundled into a single patch. We have options:
> 1) ask to split (and review as standalone piece);
> 2) add (partial) Rb with the pointers of what exactly has been reviewed;
> 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
> 4) ...something I forgot?..
> 
> (even partial) Rb != Ack.

oh, here you repeat.

There is no partial review tag. Please read arguments I already provided
to you and either respond with counter arguments or just stop repeating
empty statements.

Best regards,
Krzysztof
