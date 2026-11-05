Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883381;
	b=N7TWhfkpxlQGxCOrRuWm5RlVlAw+9UwYtRz4pkGvwvCX6xki56OSZEA6UImYQfaXccOt
	 JIM5epD7XoTu2tnLgfXAgn03uwqZpexetegICVokW+3CPWSUcaQoIZL24pCqcCECOR4k7
	 gtwyXwSFsEcXvH4jEFgUrYtaUUjJwl6Rl8w4OIOhkhQ9hqdC3HWG6tl0LiTl4sj1z39m7
	 FtbquvPmaAMyD7fRyY1cltXRh1Quq6SOXXKDfYgFA5BziCc/+ZfF8MDjjTSoaNNKsQC1z
	 wQXYDCCai71xg11X0rRoo7ojkdbxdA8JHfAl9Dl2nzPpnSK3cscSU7Ubesob8j3ah/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
	b=uP8x8CkRfmB1R2MRF7q7qs/97jkwrNOTl53qmPxWxPNvAsMgHLEz+HVci1mrckMTx56p
	 38r5skGa3xFSEbwJq6yttUTp5ZCsNJ58NuFOTGh22fN/7eYclLG2GGlEK0uupbhZeHpUY
	 bFCJr09JsdlGm1q+WJiJDeVFqc66rPSvW3mIX2TYLWviuMC8AllX19oS3E2KHwXeyaMYg
	 sCCbJED2PeWtok5AVm7bCUVWNlXn6jmyGVy/8BzoYxoK/nB3f4ftpBgrtrmIjOgvHrYU6
	 QHBw+Un4AoLbVdAbKC1Xkvvfk8KwUiPrVuDEbGHY17Uf3rX3O0bns3ex7euDNhmRDdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPttzf91;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLYz0HRP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4580F606D804
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 12:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4580F606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPttzf91;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLYz0HRP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tSOG4084589
	for <linux-doc@vger.kernel.org>; Thu, 5 Nov 2026 12:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=; b=nPttzf91CBJQARfW
	bkoo/u/KooN77NvzUJcL78Z+5zV9UhBcykZ77b+f2vavvCFZrs8t+NNmFB+Rl7ib
	Lc1n3CWTljpRRf5TZVqOzf9a9vAcFK7zfZNMCRs9Zwa+UVcj7pqiFyphc9+7aUP/
	W2cLcp0FBEwi4xFwCxCXm2qVBK3haVqxiVd4G/rz52RYs5tjxMxvqEYo8pbtyoUY
	Yha1//v56ES1/jcT9yZSeUPhIP4HsB500NBlEhMWBSOvDHFSV1DJJiR9SfW781Yy
	8ZCE6KJ/UBLlmqHsZVg0yz6+m995dMt+mrpqscg9FXEV9e5J97FdEDUMaN8QT3Ti
	l7Q6Mg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkrqf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 12:56:15 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99089f9591aso216164241.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 04:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793883374; x=1794488174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
        b=gLYz0HRPCihT9jRPBR0k5DjszsIpORsbv21MwPudWA5rkP1xivSPqwknRV0Fp4ykD9
         saxrgnsDU0tHnd/zReJ7U6hbNvzrN62sBlw0ObCg+F5uWkmK2tgiVSg799lcLIdJHUcn
         8oduvo2tAEqAaCNja/ingtIHhwl8d1kAu6D7len/nlp6bUU5Niq3JzXU8kIlbC90m4o5
         ZsmEkl+0eUqHK1PJtFJk5TNu1++UQWAV/ImlC/oOkZxxwsk7oOJMM+g4Jl4MhGZPXTos
         zOOvS7J+55pSkNoS16CTgZRXAFg1iiRWTSatTXwNJMWflSWCwnHOO7ddd8dOE9hgOCVR
         5RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883374; x=1794488174;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
        b=ozNCvuFIlU/GAY2AOROn2OeFIvZMLIUVk7lRrto9XWDL+urpGBiN+agZRezjZG4fp4
         YGsDjJ9WucsaMoJwm/YzAwTvpptbPmIV4edXjDalFx/1LYAitDV1vhhZN1sM3q3V55AC
         BUhF49aCqNfg64PiDbuwu/nUETDbgfuEJrFCBxQil04xmoK9KFFNXCdeoY7PF5om6gvm
         N6xOpStZhFDAp+6ZO29HDGjhAYSY16WRRmG4R+d8/Q3J9zsQ/ypM1MCkk5CZw2XK+ph/
         YO7rGC7z5naZJmkfmWZ/csS3kJI1rFtf+bazOipJJCVX7KP+hS2X4g/E3i8Zf/AxfKl6
         vacw==
X-Forwarded-Encrypted: i=1; AKwUvByrKgTG5a2mrXrpdxZZptcNId4PXQPJRv7QXQT/adwucuNWbL+N/gJrrB+ybv+s/w9aWHlD+7CkyrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O6BQbPjXT0O7NhsQcvVLv20D30tnwfX7WWtMivdvPeeUtYkTm
	kJQl3ga48G/43mU2p2COiOa5GkWOWfB2PoxCGRC30bOuPL9ywMSuRLJOoIQrGDlna+ch08A61/h
	hzZ6GjfOYkzcycM39LmdpdJswn6LcqZNOfxcRWP6Y1MBtxncOl7k+QJJ6vG2Fd8A=
X-Gm-Gg: AYBFou1fOzhuS/q7M+uLatJ0XvCGjlnrqIUPcYCuGFRKtbre/VRNtz0+5HmpDTBXl2w
	anUeEcKQxlugnQePATZoMqJPa9D2+xy5l1EjlRpRQBJgYDCdKo8U1mnHPrg7y0vfcc9nwYXh4sP
	+7LSPcrDdg7c/M/4AQiWuPW79erpSI1YUHo0HznrWdYmC1vSo8UP39ayz2K9+EnArBhj/9Ie7fi
	giz0xVvKZG3amSi06rOeRhnaUE2cxL1nB9K2jRspHD03UIr3Y3ZJScUIIEvOZ8RyQvSAuE0WY1A
	JTn/uurcao5nKCeefbfblYANjm8clderN+I3flmAhB6CUUcPFRRdzf+yW24XgnNZ1whf1hudzhs
	6mmpjYkJ6OG7pwwSGJLXJrisu12g9kgmhnt/NPvwUKctvMMlLmAW4+a5/BNNJF1J6LdZEX5dttg
	==
X-Received: by 2002:a05:6102:50a5:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d072c2da67mr7071566137.18.1793883374427;
        Thu, 05 Nov 2026 04:56:14 -0800 (PST)
X-Received: by 2002:a05:6102:50a5:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d072c2da67mr7071534137.18.1793883373890;
        Thu, 05 Nov 2026 04:56:13 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm9850513f8f.36.2026.11.05.04.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:56:12 -0800 (PST)
Message-ID: <a0a17a91-02d1-4c54-8989-ff483a3300ab@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:56:10 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
 <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
 <auxmMrANvWIJi94i@shikoro> <auxuPmopn43wisF9@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxuPmopn43wisF9@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX21dFfGnTPVF8
 17fK8r8NM3Mz28KDvbL0ERJSqnuNMVL8OboMU3DvlUhZ0Q/T8VGNfsMU/D9OY4+Fjw5piMwuc8q
 0xV6OPqemfbk639QiOyW5NgqKXh83NSzk/vrN1RwMcjVNPunMIGhyxomhdxOLuEuvKWrGy91TQd
 hLrn5UY1Lz61uLfKNAUL5WJgUaUciu+Fe22BH7O2Y1eWA/BiQKuQEmEY2OCuq7ELCYvWWldQhI8
 KylUcs3siIXTVhuDVg7//4AHZVlBiWUkwN9pTziCJdOkrtN8+xTVgABYzyZ29bUUrr7sefzjtzX
 SI5ZpvGARRd8Gl6sdk3+sz26fUHU8+ICO6MTlHOIVAuApdRbJ2RPQJgm/2FON9JnR63v4464ecB
 Ye60Jie0w7pIoExe+HWyI6RFTQceu7LHpxYOniOQ1o0e+RbwM2IBhqvAIVs4k/tyK4KZ0datHf6
 8ncxxEeZfK/vcNWL+4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX/EcwBgxpFL+2
 gAk2NrbD+uWey5hQRd/HP5Ut6nhHkkIQKuUcgGXSb/2WscoZa+sO3iCKNrmFaIkyh61EakOUowy
 TijY3Rn7hcXLeOSyhHFji18L1eAY87M=
X-Proofpoint-ORIG-GUID: 4Ce6a45UONQsNYI_qpk4CBu4PFFPmJ0x
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec7cef cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=yilv8eCvnXgz7CWaK6cA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: 4Ce6a45UONQsNYI_qpk4CBu4PFFPmJ0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050051

On 05/11/2026 12:53, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 01:19:14PM +0200, Wolfram Sang wrote:
>>
>>>>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
>>>>> found acceptable according to the Reviewer's Statement:"
>>>>
>>>> So, for the SPI patch: if someone spent time and reviewed the complex
>>>> core changes, but only 2 out of dozens of drivers, this would be an Ack
>>>> according to you. I would, however, understand that this person doesn't
>>>
>>> No, and I explained this in this commit msg. That person reviewed the
>>> MAIN concept of the patch.
>>
>> With that MAIN concept emphasized, I am okay with your reasoning and
>> agree. Before (I cite, upmost paragraph) "*the patch*" could be
>> interpreted as 100% of the patch (including dumb driver conversions).
> 
> ...which may lead to discouragement of reviewing such a patch.
> At least that's how I read the point.

Why Ack instead of Review would discourage? Are you saying people give
Reviewed-by tags for incomplete reviews only because they want the credits?

Best regards,
Krzysztof
