Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679180;
	b=5ALoT78r81m/i4lSQ4Kt4FIGX7ZmdwfbmVWRbr2cMrKL+hfg7/947slu/4pp46ltt8I6
	 NPdhpukhTWPIjigJ74YQMKftPlfDFg8GVoFNsB3D/IBwKojnurvNtMyKsIlaV7pAlLcQp
	 +mY4pJNlENGn628W/T3crGH+mjVHmm+ZQLU5sc5epjATEnZdYtyiWSa6J0T2wNuIqjrhC
	 +j1vASHc4Q4Hn+anpa6g6/2CpEtt3n6FFtRecNGtthyzOUiCGbnkHMx77hTkRDofGfyzv
	 RV15oy/7aaARd4MGyWhEWzpOB+qT6gPyDriccNjMGjhS2UQs+kRo7wEM0JHMUfHv2rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
	b=x71vlnGZpC+pd/m406+6uKaCYkspBYjGoq/525mMEesAXIgGFJY47jsCvT2iaRiw7rQv
	 VDSiE76CVLPM2ppxWzLa6XDvqnR4wAC4WXnMhDJV/wgKS1Wow7QL7aZPVmkOHDDq2a7jN
	 kTEQxMCVqxrGpElx7Vxm1jFqV6jpcvK9LcKjFrOEcstwPvROj+lRJ2ZX8e4XPNcdQr5Gx
	 JAhHlHJ2uMvJ8Jx92M3natGntOG4xBodORr0TZRybCoQoT8ZCwJwANitUdajI0t0/VzOy
	 c+z898EpxkmI4CQfC9HYqW2GWciczGXmGisaGjZCeqM0Dro18cRDYZgdh1dO3HZLYGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Be6NBfr9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NVZCD/mu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4F1606A31A
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 14:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA4F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Be6NBfr9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZCD/mu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA02bA1962798
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 13:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=; b=Be6NBfr9WxHlkwvF
	6nOUpLIAC3TICYgkTGSPqkQGmc9FrbjdwwbEoeyHY4x0F4/oPnHenlt1Ed9kc2Hu
	jhAiWVqtYm+bO4j5UPJaLOWq8OAL80XWTnv8l0j7n+APsNAuw1Gkh9KD61DwQQN+
	lOQzfqTo3WkpCSZsUjiNGvviNfyK4OYpTTxyAN9bqw4SU3yMczekcce5hfcfyR/3
	+3HeutSj7kN9AKcFVnLGpCtK9O+FkzZxnnw93IbTFBDw6Zpzd4dbv+fdIzqdqsza
	wNQARzANHSc0UN5oOnySx9p1vBNM/MU/XOqmgSq1rDh5xrXo4IsghUysItnogfRS
	szIYNA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93akqcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 13:39:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3477352eec.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676393; x=1793281193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
        b=NVZCD/muE0lO60jqUZKKgtOyvNnOmvIHPHMpENRJ9MFesMq5HIM4e7aaNAT5m8FlzB
         i8wMySKrS2V1v+n2mOUtgeUXgG3yEMnnUhoFE+FfHwcoNN0z1jEdATXO9a0S3HrRwiSt
         VEbN1A3V6NoSGJnjw6H4XSL8SqEiddkKq04tOdpFtt5jlUu7eneVaGHxabIGUZJhIdXQ
         VGlIJdqcs1xzOyMXRH+T4oeUF4Kwb7OcvrBUCiimnxiSHCrbohwmAfKc9V7b19lB676b
         ThWpPSYgamnOap4DplpqCj5dU4P6USpYroA1Iw6Douqxuc7WR3xRE46EXop7F4YjyjF0
         VQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676393; x=1793281193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
        b=QdZ1eJsFk23Bl8Wf0adBeVKpg8NPNyM7J1a82RV+vsXTbTxkuYCZ2QNIrWRhujlMae
         MNG31z1lCDgQJAd1AdpjHVWdfHKiiJDGn6YCYkQPWRFUHLm4bYOU1BGF0KzYatztbYc3
         Y8GUWgqCpoTf79+nSB1fMoUog1XzxZXIIvpp7I9/Hb3l4dWB6sE/mS0LjMoATqb//IOO
         GYq1feZoTqoTqq13dmgJr95WPS5juWo9YnE/RLJkVZ5UvG/N+ZB6mCUujsDhloLW0gl6
         c9gQnZnqbJjxFzIv/fbCy3nlI7m7vQWib5UlY7AEFo0e+OJtMFXwGmNHDxNofqiLfAkO
         E6Zw==
X-Forwarded-Encrypted: i=1; AKwUvByDlnfoNux4Oa1hpTAXjVgYk4gEVGfl/nsOiU9dMCq5ShzwV2XCxHZUZInhG0r0aWZtHWXVJxxSKDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYILFgel8cc7VbhqppdJNpv+azvCmnclgNIyeg963NV7t00yWqQ0
	e6yDB1arxXv1Khnc4hMA6rubPnwc4ERpmejlwTQ8sFfpquNQLTQD90WZnGBQ9j/VcsWOMlihOVz
	dqoYIOsujL6F41t36tLrwksrnxMk3C77NlZSGH7UeeTC28AhbeMPp/Hl5OzGQnvg=
X-Gm-Gg: AYBFou2qTbp/GEBITC57MarbrJZWTHRwya5OBf1mKfFQuMbgAAJTRVu9VhSYegxvZfO
	OulqEzE9bd3f78sPD+RT5qRKXmCV27rUUQxwdtw8PxLSKeu83eet+6y8+3tCNUsaawXOA7JCxaU
	Ss4rEpSZ6OQ9yo5Mw8gtkz7jrGCNCdXqAkQDSJNa01Xh5k/HTAuzNpQKovyZZ7CmmIXQIrX0k2M
	DUE7hvPaK8zq4cqw6sqeSKpL3Z+N521WV8fg0oo1uZ6w9laoNt4a4jL+iVb6MmN0ZIXr8KgKd8s
	NcD45TTfIImSsRM8U4yTulKg1ftMuuiHUIHYxaXul/NdepzkaafVL+4p0Fp/ItIMqw04gSC82+n
	fzcGB6BgOJZvXWp9Fxzk5vmGmY5WCAA==
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr2325118eec.14.1792676392893;
        Thu, 22 Oct 2026 06:39:52 -0700 (PDT)
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr2325059eec.14.1792676392215;
        Thu, 22 Oct 2026 06:39:52 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm14556522eec.20.2026.10.22.06.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:39:50 -0700 (PDT)
Message-ID: <f83c366e-e3fe-4921-8407-ffa90b7f933f@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 19:09:42 +0530
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
 <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX/xbc0duJbJn8
 wdBJ0KoyVj/D5NxoWYNW2wHGcL+l2Rq8lmuMqIhCHewag7pSiK8Vm5YPZ7sEfJe72ismQ1azG6b
 cuVt7ihxEN451vS8las+sEb8+WoRru5FEK3XSXRmNgeb+fqdvhIa8+dPJVLWPLotOwsJVubRcFa
 FVzNZwh37Qa5l3Gv3vf7LA54JIpxsgkBwT0V1bq55PkPCCDAMz8NyVRlHdoFYlZMCSfxdd9urWR
 xjZsn5x7RxTTWAHt2QXMTDgpmUsfKm8G1jgJAcZen7mZasnmh7ANRF33Nh2rfFunJoZzVqSrbsh
 c65Bt9JOTYULFc+99r6R8LLBRwW20ECsQwH88ww5VFOx0RjRag69uLxHNkbr3l0xqxH2j2QcGdP
 7//wW/ftFG9KYBqlOEjLkcsqLN1zCV9SBWIXBO+baEc0xJXdP5/HvTb0XPCUfwJ6xTqrc9P9iHp
 lyOdgpGxFWFMogq8TLg==
X-Proofpoint-GUID: EgwgzqXgojriAYS0HoMCb0lZpPnV7zYQ
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada1229 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2wNLjvyEnIyB1ESV7yEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: EgwgzqXgojriAYS0HoMCb0lZpPnV7zYQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfXy5Hbn91rTmTV
 2jXjrU59LWj1bSe3CaQiVL3kSw8mCk3I/r7RN76HuwwMRp/+ZyMMhNhgPSs+5WOJ/BwMn+VM5au
 329oVzf+6tL9bCmQsGxZ+L/nZqrx08Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220054



On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
> On 10/2/26 12:47 PM, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> kodiak-based SoCs are binned at manufacturing time, with the bin
>> computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
>> now reads these and feeds the resulting bin to the thermal core, which
>> selects per-bin trip temperatures.
>>
>> Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
>> the passive mitigation trip points from a fixed 95C to per-bin values
>> (95C for bin 0x1, 105C for bin 0x2) using the new
>> temperature-bin/thermal-hw-bin properties.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 56 +++++++++++++++++++++++++++---------
>>   1 file changed, 42 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 347815e5983e..f3bb9cd8f393 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -1019,6 +1019,16 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>>   				reg = <0x1e9 0x2>;
>>   				bits = <5 8>;
>>   			};
>> +			jtag_id: jtag-id@180 {
>> +				reg = <0x180 0x4>;
>> +				/* bits = <offset width>: 20 bits at offset 0 */
>> +				bits = <0 20>;
>> +			};
>> +			feat_id: feat-id@180 {
>> +				reg = <0x180 0x4>;
>> +				/* bits = <offset width>: 8 bits at offset 20 */
>> +				bits = <20 8>;
>> +			};
> 
> Couple nits: please keep a \n between each subnode

thanks for review, will fix this in v2.

> 
> 
> [...]
> 
>>   				cpu0_alert1: trip-point1 {
>> -					temperature = <95000>;
>> +					temperature-bin = <95000 105000>;
> 
> Please do <foo>, <bar> instead of <foo bar>

Sure, will update.

> 
> Konrad

