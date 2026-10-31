Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431470;
	b=ZkLaLLuHH+dZH4WaSu1p7asyGQTxEZM/BXgoJIEq5NgzkzMJnpDk1FDoaXEwIYczRxpR
	 nnFm3OV9sV2qhAQ6SFNlEpPvgdYTigPU411UIJuRK8ISWca5Snbh+r4VAuF80l/zl7oJS
	 fNg/SnLFbhSopJIqjBtXxa5czJrVmFpmhLJkurf0I+EeBkJjrj9/ny3mdE6NKLfbaRDo7
	 926qiU7KiFsCwhDW03R5uqi3ijwUgUADnUM9mmfRCqGY1fh7UO3hShVZilXC7O72QhEsw
	 +vq53F2zWyiCsteOEK6J2THT+FH87dkGUO1fuzlrSX5pdcnjzNWFpxrKPsekd51feyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+VcJKDHccdacKhEQX5Ji6SUl5Y+cfn5EtztdU/+jkBQ=;
	b=N/m8byHETMyY0Hc5SyMbrj7UK2fVF2CEvjxwCq2rJxkpUyqvfM5YVhtQJosfVs2uErVa
	 dfeYgO4mwXkjCNyHaTHpxQMkN0BLk2wuVpxrDawR+F9hc2SJHUDuZ4by3E9FAOlcvXrwv
	 C8Yyzz1ohwwDHbQfHDXulqiNFff5tLbI7ssenh6JT7g9/T8sdljiLlOcwiUojTxa/53S+
	 NklocAA5SzLpC34vyYuzqiqgzjSS8QoYxaqmiTKgCJTngeDv2ifhROUC2Xa+gLbcnF9ON
	 DZ7qP7+hxCAqxpNvAKT/rDhjfBt42YZdq1cnl/MFkfh19NvTm5fCnhC11awn6MfH7uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n/inNqA+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6FPuDyz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30111606A31F
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 07:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30111606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n/inNqA+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6FPuDyz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4akYC821359
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 07:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+VcJKDHccdacKhEQX5Ji6SUl5Y+cfn5EtztdU/+jkBQ=; b=n/inNqA+Ersd15X0
	vDi/oojGefVPUmlV/iBGMQ5XFHw99gN0NRJBtk6rR9Su6UQBu0hqmrhNoRNESdMg
	hAqqEF6+r7sykgggBMQ2BLmB6FVEjmYVKx4kgpxy5sRr9MlVyd1OrpvMVtdLAn3O
	xFg4xzzs6Xeo+BZqYKqPs7XXS9+9y3ZwBs3Y3bZ820TGmj9d99+KjcjhEvCqmkUQ
	620MO1DdI+1zbxO1cyI2sJXwPuLep8YVBQTMTZ6EjcQPFDWWZw/CZ1/6qnJ3pcd2
	xA5PQuSjYtPGHgj3AvgmL9LTclTWlfw8PXyQAKg/8qE/HVsO93KhqH5qn5hjJ/p5
	xlKvFw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfrmcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 07:24:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1507045c88.0
        for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 00:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793431463; x=1794036263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+VcJKDHccdacKhEQX5Ji6SUl5Y+cfn5EtztdU/+jkBQ=;
        b=g6FPuDyzzo2aYxaGhq8VwYjQlqIkBx0IGbvQChwy2UShe3L9r+YwGC+LJrT242geSr
         KGgXY45T4Zp8WKURV+9YPEXboHRne3iHWl8xBoZCduD4B0X3t7ZSwarS4GTS3vZ93KaP
         VFTgIl2Gqr+/6d9Ig2mzChmUoMfH9jc50ixLNw5zW6JUz2+LbGyuvth1Rb1zWtAo1ys/
         0+IQbFAQK6DqWm0ngfSaVKnsFfrowl5zaPJBe77aLb92nrgzDQ8SGRwXS8gAOYLUkRLT
         LEMLojbqCxN9c4RL/SU1usn047oAHziGzmaCNpvjvbgIg/PSV/Ym6mhvJmP9bF5IldEF
         Icpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431463; x=1794036263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VcJKDHccdacKhEQX5Ji6SUl5Y+cfn5EtztdU/+jkBQ=;
        b=W9sF4dD/UR8wPYMKC8AUYbKSIzt9CjXEko6s+HkZUrGttb43oNuRq+nZBBHXAmJZb6
         iq73nh7THmzfMk58jrnKKUyf1G8Oj/JDpood/NSwo4SxYaVyG6Fo2UWD8z8A0RhJxD8p
         JxRjXBKZBt+VzAzA4SHpfRDXbCIHMZ+au3pRc47PXbCXacQkMQycFUJLHhp2oype3rO/
         WhC+10zS+iPnNPtOjpOgpYQzstxeQ+TrOgnEDo0KY5q3bwx5f50If5FbQDYCAu4+J03N
         yVw/Ay6ToJgmQE3lVIDZ9NbtNX5soqg2yR3DpYuu0DqLyl21vMV0eA8C/VNJea0AOUEF
         CJPA==
X-Forwarded-Encrypted: i=1; AKwUvByY2KYHQeH4EQ+6orPP6QPc4NzsN5GUhQQL34viM9lwhMyA+s+4ToQRIlG3cPFBaPwerTe9LpNqxDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2t9CX+lZ0teZRdQuRKzDJY/lqsUUgWGmXiXXEt0q1OcRAb7CG
	cPZ0NUmN9BASsDk6rntbnTCrqlVXgdwTBqp3/19isxEaHL/pEfTRXVsMFt/JnDmb9BbrcC6GsBH
	zmW7R5154rjFM/bcRSjJYMp2uXEkfeMJQMsIluprSnpbZCmM0AiY2FVhpO9okjEw=
X-Gm-Gg: AYBFou2PzRKDL4z4hRBrI8j7ZNq71z16XdEhX7k98an4JGgo5//ssbm4e7iiuKeeRZ7
	DRMu7IhSgL8oFTz84aL14gymW9lvUxHA9ueUFNEMnEp2xyC78BguBgfx6Z+X5MnOAcPjmCDwBYX
	Ww3nCWfsADcNoZKzZ311/JMhZIXRfwulG/WWYnw7TtpeMIYC1/6XqFr7k17ugwMYkqwdJWnIolI
	LM63Ykp8DqrzMvhmdrYHM+wIjGZMIa+ML8QQV3lWZ+D/P3zyxue0kLDmXxmChoSvZtPh2H42zXO
	+oD0QMLl0+P+M1hTvJPaHF7OF85Bi22ddGIuEefyOCCZmQho0T5K89oAtc3OH9J5vCmQ87hCZI5
	EbvSTNp2UaCYrQ3grXOSuFffmGXqY9PReXNqw9XAt47fbFKHCAR4yIH7P+6iLrqjFUsmWpOnHlf
	Liqwg=
X-Received: by 2002:a05:7022:ef07:b0:151:2e62:fe8a with SMTP id a92af1059eb24-1ac5e22897cmr7917026c88.40.1793431462677;
        Sat, 31 Oct 2026 00:24:22 -0700 (PDT)
X-Received: by 2002:a05:7022:ef07:b0:151:2e62:fe8a with SMTP id a92af1059eb24-1ac5e22897cmr7916990c88.40.1793431462126;
        Sat, 31 Oct 2026 00:24:22 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm13184910c88.15.2026.10.31.00.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 00:24:21 -0700 (PDT)
Message-ID: <f566e9aa-fa77-4ede-a4e2-df00bb4da6c8@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 12:54:13 +0530
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
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
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
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
 <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
 <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
 <e7788a12-3cad-4bd4-9f79-82cd118e0049@oss.qualcomm.com>
 <991e6b64-8741-4669-9bbf-e31eed788f42@oss.qualcomm.com>
 <310594f7-fd4f-480c-a2f9-844e3da73b0a@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <310594f7-fd4f-480c-a2f9-844e3da73b0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDAyOSBTYWx0ZWRfX3Erf0iYp7tEt
 SrU+roWe5eEcQEIGYteKjmTAusrNvFeCNog50a9qDwLK6/kK3fubtgZgzJYAHUsgtUfzGo6ddqT
 MJFoQD+dSx7jFnojy97CXJwL/UYU4fQ=
X-Proofpoint-GUID: Yoe11VWZNGVXgwCgUUYoxcJHpcLP1Pr_
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae597a7 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mvxzE3OFXQA7EaUyAoMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: Yoe11VWZNGVXgwCgUUYoxcJHpcLP1Pr_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAyOSBTYWx0ZWRfX/4mYU+OK7Vcw
 vRwq2iYbb0scZVlEewcHTccHoJdQUQadE8F0YNcZ5xgCVlzo5TbTnH1fMerwZPL3b7RIOvCJOED
 g9X+AmBW1wCS2Mi0DhGTlbWeLBgyKHJKnZatJOIXm8/SEuwXHXjBw6g6KO0bfBo7VaovsXClOl+
 2adNWAPE0XpUipsloId54cjECcSl1xsimImsmaqR6ATCUDpaisACk51/vPNFyRWlcTru9ZzMCoM
 yaSISKRw/ZaPCptqZ5Z4WtrC0+8BSqrpyxX2IcaFtoLYuot3401/tv28izTjVH3XNjwzavbGcch
 8wQK9DedYMJiwdOFPnAGthI87Pd/yAcLA6l2qKi6aRCnJXETBap2SoYIG1dDgj/d9Fj7guE4N70
 uLEvLuLOl/4ewaqSKiHFX5UOthvCIJJmGA5TW8W+PkHiiKZ10J8GFZnVUYDbe+rNIk+7nN7FvnD
 CgoXMafP+sMUrYuLU7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310029



On 10/30/2026 6:08 PM, Konrad Dybcio wrote:
> On 10/27/26 1:59 PM, Gaurav Kohli wrote:
>>
>>
>> On 10/26/2026 5:21 PM, Konrad Dybcio wrote:
>>> On 10/23/26 12:01 PM, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
>>>>> On 10/2/26 12:46 PM, Gaurav Kohli wrote:
>>>>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>>>>
>>>>>> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>>>>>> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
>>>>>> trip points by hardware version; wire tsens up to feed it.
>>>>>
>>>>> [...]
>>>>>
>>>>>> +    /* Hardware-bin values for thermal-hw-bin matching in DT. */
>>>>>> +    const u32 hw_bin_std = 0x1;
>>>>>> +    const u32 hw_bin_elevated = 0x2;
>>>>>> +
>>>>>> +    /* Higher thermal profile identification for qcm6490/sc7280 bins. */
>>>>>> +    const u32 tsens_chip_id0 = 0x197;
>>>>>> +    const u32 tsens_chip_id1 = 0x198;
>>>>>> +    const u32 tsens_chip_id2 = 0x20e;
>>>>>> +    const u32 tsens_chip_id3 = 0x20f;
>>>>>> +    const u8 tsens_feat_id2 = 0x2;
>>>>>> +    const u8 tsens_feat_id3 = 0x3;
>>>>>> +    const u8 tsens_feat_id4 = 0x4;
>>>>>
>>>>> Isn't that (also) exposed over SMEM?
>>>>
>>>> Thanks Konrad, for review.
>>>>
>>>> SMEM has related socinfo data, but there is no exported helper for the
>>>> exact fields needed here, such as feat-id, which is also used as the bin
>>>> value.
>>>
>>> Is that different to qcom_smem_get_feature_code()?
>>
>> Thanks for review.
>> I am checking internally and will update with the exact difference from
>> feat-id. My understanding is that qcom_smem_get_feature_code() returns
>> the SMEM socinfo feature_code, while this code needs the QFPROM feat-id
>> field from the JTAG ID fuse word.
> 
> I traced down some code, only managed to find the sources for newer
> SoCs. The JTAG ID is present in socinfo->raw_id. I have a Kodiak
> (QCM6490) phone on my desk - the JTAG_ID part of the fuse reads as
> 0x197 and the socinfo data reads the same. I attached a patch for you.
> 
> The feature ID is not exposed via SMEM to the best of my knowledge so
> it needs to stay as a fuse.

Thanks for checking and for the help.
Since feat-id still needs QFPROM, let me use same implementation and 
source the bin data from nvmem. That also keeps the approach uniform 
across the targets handled by this series.

> 
> Konrad
> 
>> For this series, would prefer to keep the fuse-based path. The same
>> binding is also used by the generic i-temp fuse bit for Hamoa/future
>> targets, while the jtag-id/feat-id decoding remains only the
>> Kodiak/QCM6490-specific callback. Please let me know if you are fine with this approach.
>>>
>>>> This jtag-id/feat-id decoding is Kodiak/QCM6490-specific, and the
>>>> thermal-bin mapping needs both values. Other/future targets are expected
>>>> to use only the generic i-temp fuse bit, like Hamoa.
>>>
>>> So there are variants of kodiak that ""incorrectly"" set the feat_id?
>>
>> No, Kodiak is not incorrectly setting it.

