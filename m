Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363889;
	b=SzHXIsxsMqzLs21jCOr/eANZ8f9zLzLsaSPk0vwF/gGPRc5wzbvjjJt/XMPxwNhZ91M4
	 U/SucRL98BZxEgJmQO3RxJxpTwt2G2psgda8kKt2k0AEIm5YaVtBSc9zi2vagOJGIqUkd
	 3zrY619h0wGwCNNHjh0WpTZseN97pQ1S5D6MVxMxohZ1FK9yS0MKralHoMYGC+/5s2e6j
	 p53B0yU0pbYIVbvxDhRbhWzp67hN+iuWI6EL9HhpVAjHSSqXHnGAb0d277KxVK4suFsFo
	 Zj2nJyEdfO1upn+LwnscrjSAJRmTDhgjLX6K/hImuLVkwY9ZdpzpCbqWV3d8RImTfwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Content-Type:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uGFCaWu/cIHZQz9+4uZRDLPq18hdGdfph6gHjcLracQ=;
	b=Mezm8vM439P8d93/ZOygAfjQex/HRkmQskMmg25WC9dfJ6kgaCkdssnZbRTe0ZVtdXtk
	 mDA2MlP5AP+QwlB27MjAPI2zgsQJ7/lFJMqtUlkmnK99oJkz7FRQw4jOJjIV1npscyyDq
	 rAp7Y96mfJsBZ4bB+6o3BDxuFqD+1YHJasJ3L5EtbHdbmqM3Aqk0WNfc2ZoWzeN+fpLko
	 8CKvRannz+BzDkA77IcIaDnzRwScGvPnizPOz/Ub3UAIGxTC70EIaImxMMAcGk5TaE2El
	 UhB71+aSuw6+kavwlD0bsjdy2UJ+dQyTKmCYQ4dGZs+5VouPhb3kLxdGMH3V2d/FGhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+isHm1r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGVcHtIO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D0606A31E
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 12:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B1D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+isHm1r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGVcHtIO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBFxKp4143798
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 12:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uGFCaWu/cIHZQz9+4uZRDLPq
	18hdGdfph6gHjcLracQ=; b=E+isHm1rIDJ2fbNNGR0Ajn9pTSvXxKdU/gtUi0Su
	j5Q5AR9/RTKhv21IrAqiwAr4m26FWltJ9yzums6i0dSH2jI0LktuDbDhekXcyhrX
	HujMkt5U5Ifj5Tni+lXwJ21KNzWR3sGfV+gYgjsm/ZBSKRW5EICteShk4qS9GwyU
	EVLY+BIAnSxfcCLs24Q8K6eEd+bIPHpLDuM2N4ePBuKdiOAUJiyjkesZPVQbEKo9
	GJgaeM7P/X8PMx+2F8N3CZ3bH7T+4A/DUiqYACN23j0LTcNkrz930v4YALe61hsV
	sHs1RqXUQiyUohOdUCbAOUmh+zm0cikjXye7JlrO3a27kA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7530w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 12:38:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73a1cf1638fso16364137.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363886; x=1793968686; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uGFCaWu/cIHZQz9+4uZRDLPq18hdGdfph6gHjcLracQ=;
        b=jGVcHtIOQETRokLjHIWZr3+yKlSngpnyC5p5Qf3lS7nqqOSpn6dIZzY64sOGotSZvS
         CGsaTqv/EYGSlHYK/pY52v3hfV7NCKGxpJMjvjdEKyKe73yTjEaN/txKRxx3ojfdF1Pq
         Clt4vlouXWcOYcx+7+/nO8WkD+LFpkPxUkCW6q24jo44nXGJUR+dFv3vtfQopFKg/JQ7
         pnJSTDVAApS98UjZBocowMKzt1viO23gkKc5jupxySfABTUW9mX3Oq3qsPvaLxiryMVK
         Az9HKgW432gcc0Gco1NWDDcKz4qq0YO11ikVNX6dJwUBwWuMdB6LR17UO9ikf/IkfDHv
         gzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363886; x=1793968686;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGFCaWu/cIHZQz9+4uZRDLPq18hdGdfph6gHjcLracQ=;
        b=rc0C1Ik4LfO+D4RYRDONdgbmFauMCeVA7wjVJvaGDfT+EFPOyJApeJ0iV2AVKZdGrm
         +hNHKMjVAVR1h045Ef3jUwttj2h2yI4CATmACX8qvqFTQSC5FhOzuzDQNsX97LCbHCAo
         dX4eS3BsxxK1hXiGiStyVqISslH3OuZHfl9DvqRUuDjT4VczFsD2w3hfVMw9AbvdxWuI
         QMb2cjnBNIm00PN6YyUpdbThqYyOI4Krw1tEvnUwD/WTZDqbQUxl5ppyQB1dvGBlv7vr
         Qqqqmr4GK29igsjfkLYII7B054q2skNvdVwE3P3meMPY3/pGrYYlyHyfC5FtJe1zZqp7
         2u7Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8dYPQUvi5s1HRp8/SGIzBTx4ZdQEXOCOaxaqt/4bWMn/oUccm9SXbu6KIvk2VY9QUXFp/izBSuNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6miqdkivqpVb8W746MdNGwhZBiZjCuilp3j38WEabvbJmUkEX
	weZ/+ZIXM7rivPA/WxfYtO8rXUo/V0BhNqkjKvOn39gfUUVgE4yzl8Vmo87xJ2diupg32qVQ8ku
	bc2dchTTlAiqYlOKWYjLWFJq6OCDIoCnGnEy8SUoS8FkK6n68hD3KnzSA6wlKkaY=
X-Gm-Gg: AYBFou0iey9HnhXW3c+jpbYmy0em9Qs3YeUEROXgBAH/4VGVd+e0qQXRuGCJq1mUIUj
	1fMpwQcIlQ2cBOBGjRN5dVqml8nZ+B8E1qRVWV0Q8+LQbW/ATLwgAo/0F097qZCLzitcxtx/YkM
	Ep6sRH5kDRcTI/VJ1h88PjRF9Yp5Q4YZ660/srqpyANDaFu2o9DBq2+wJCmUV04Wl6Qj272NKiX
	uyn3JEkJ03bQd5z1t5Pxzpq+Yu7yam1462DKzzXjfKcxDvoS2STvLBIzVimcIs9k8T5oqBZlqW8
	4AcgeucAW0bRGDvK5XdSMupkcZW+fY5HN8olM84LTB20wbIp9q9iy9Ntv4wJwjZVBRMUxAYghfs
	8sTfetzBp44w4mKtcNut418KE1Z11n4h7NXRpGl4QCh4q7R0nVdH7f9eUgN8NhpkZ6MvnnwE=
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr871449137.1.1793363886085;
        Fri, 30 Oct 2026 05:38:06 -0700 (PDT)
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr871435137.1.1793363885566;
        Fri, 30 Oct 2026 05:38:05 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b01b53sm580389a12.15.2026.10.30.05.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:38:03 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------50GfGCps3rCUy0MrQIbZw5d3"
Message-ID: <310594f7-fd4f-480c-a2f9-844e3da73b0a@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:38:00 +0100
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
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <991e6b64-8741-4669-9bbf-e31eed788f42@oss.qualcomm.com>
X-Proofpoint-GUID: -qjP8dn0uVmau4d9Us9MfTRKlpVxrkhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfXzqK1g4aJP7Ud
 jqClhEVAexWZQLutkoWx7wc1lyPnDnLI8ijN1B/zwBWa67wpsUQDggI1sh40axpMUBgphKVuca/
 uOf8+CP7a2OOmrf6JFOp8FWnnxBxp2bEFlucEZS5Q14/6SNcyeHiRcnSKe885+if509vTQI8VG/
 Q+PpUTQBy6+t4rGQn0yw9cr4h5vdUXIp5LHo6+WIBrA2tOplylUglKxT3aabIDWFy1RZLTDb4C/
 rz8s0SuvZBZreGVJfviZTid6vYIGECrzYtu2vKuqnmo9UoSSvq4xRMJBR4UBBArHeW0sXqzRCKs
 xEac1JD0bf54YXVFy9Lphek3LTe2n0S1+phZsZSN5gk9oWGgTXAWow/nyaF3POJAw8gTrFF8xTK
 YIfHyo9RKHisyGHWpuvtUc1jXFNVAEIsn2NkLBiKuXrlsSDzjglcmqAdzmXeiSt9WWQ0A3hhafs
 oK1NYlxYg0OTqEHrSzg==
X-Proofpoint-ORIG-GUID: -qjP8dn0uVmau4d9Us9MfTRKlpVxrkhe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX9c27XG6SghiA
 p/s2YfVRcbDKKbVlXDZImFyTvHrOWX5BrQcHBHNjdJu7eMLUdPune5B/TMqNFeaWUOhUCQW8Adu
 NtsOhtTUtm0XxohtTU1TIFomkDW88w4=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae48fb0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=EUspDBNiAAAA:8 a=WEAxI33MgoOtBf6C8u8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=DWDMQnGJAQtB516vxjgA:9 a=B2y7HmGcmWMA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300050

This is a multi-part message in MIME format.
--------------50GfGCps3rCUy0MrQIbZw5d3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/27/26 1:59 PM, Gaurav Kohli wrote:
> 
> 
> On 10/26/2026 5:21 PM, Konrad Dybcio wrote:
>> On 10/23/26 12:01 PM, Gaurav Kohli wrote:
>>>
>>>
>>> On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
>>>> On 10/2/26 12:46 PM, Gaurav Kohli wrote:
>>>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>>>
>>>>> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>>>>> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
>>>>> trip points by hardware version; wire tsens up to feed it.
>>>>
>>>> [...]
>>>>
>>>>> +    /* Hardware-bin values for thermal-hw-bin matching in DT. */
>>>>> +    const u32 hw_bin_std = 0x1;
>>>>> +    const u32 hw_bin_elevated = 0x2;
>>>>> +
>>>>> +    /* Higher thermal profile identification for qcm6490/sc7280 bins. */
>>>>> +    const u32 tsens_chip_id0 = 0x197;
>>>>> +    const u32 tsens_chip_id1 = 0x198;
>>>>> +    const u32 tsens_chip_id2 = 0x20e;
>>>>> +    const u32 tsens_chip_id3 = 0x20f;
>>>>> +    const u8 tsens_feat_id2 = 0x2;
>>>>> +    const u8 tsens_feat_id3 = 0x3;
>>>>> +    const u8 tsens_feat_id4 = 0x4;
>>>>
>>>> Isn't that (also) exposed over SMEM?
>>>
>>> Thanks Konrad, for review.
>>>
>>> SMEM has related socinfo data, but there is no exported helper for the
>>> exact fields needed here, such as feat-id, which is also used as the bin
>>> value.
>>
>> Is that different to qcom_smem_get_feature_code()?
> 
> Thanks for review.
> I am checking internally and will update with the exact difference from
> feat-id. My understanding is that qcom_smem_get_feature_code() returns
> the SMEM socinfo feature_code, while this code needs the QFPROM feat-id
> field from the JTAG ID fuse word.

I traced down some code, only managed to find the sources for newer
SoCs. The JTAG ID is present in socinfo->raw_id. I have a Kodiak
(QCM6490) phone on my desk - the JTAG_ID part of the fuse reads as
0x197 and the socinfo data reads the same. I attached a patch for you.

The feature ID is not exposed via SMEM to the best of my knowledge so
it needs to stay as a fuse.

Konrad

> For this series, would prefer to keep the fuse-based path. The same
> binding is also used by the generic i-temp fuse bit for Hamoa/future
> targets, while the jtag-id/feat-id decoding remains only the
> Kodiak/QCM6490-specific callback. Please let me know if you are fine with this approach.
>>
>>> This jtag-id/feat-id decoding is Kodiak/QCM6490-specific, and the
>>> thermal-bin mapping needs both values. Other/future targets are expected
>>> to use only the generic i-temp fuse bit, like Hamoa.
>>
>> So there are variants of kodiak that ""incorrectly"" set the feat_id?
> 
> No, Kodiak is not incorrectly setting it.
--------------50GfGCps3rCUy0MrQIbZw5d3
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-soc-qcom-socinfo-Export-JTAG-ID.patch"
Content-Disposition: attachment;
 filename="0001-soc-qcom-socinfo-Export-JTAG-ID.patch"
Content-Transfer-Encoding: base64

RnJvbSBiZThiYmExZTU4ZGMxNjkwNzk1NjdhNmQ1MDZiYTBmNDAxMGIyOWU1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9z
cy5xdWFsY29tbS5jb20+CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMTM6MjI6NDYgKzAxMDAK
U3ViamVjdDogW1BBVENIXSBzb2M6IHFjb206IHNvY2luZm86IEV4cG9ydCBKVEFHIElECgpU
aGUgSlRBRyAoInJhdyIpIElEIG9mIHRoZSBTb0MgaXMgZGlmZmVyZW50IGZyb20gdGhlICJz
b2NpbmZvIElEIi4gU29tZQpjb25zdW1lcnMgbmVlZCB0byBjb25zdW1lIHRoZSBmb3JtZXIu
IEV4cG9ydCBpdCBpbiBkZWJ1Z2ZzIGFuZCB2aWEgYQpnZXR0ZXIuCgpTaWduZWQtb2ZmLWJ5
OiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9zcy5xdWFsY29tbS5jb20+Ci0tLQog
ZHJpdmVycy9zb2MvcWNvbS9zbWVtLmMgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL3NvYy9xY29tL3NvY2luZm8uYyAgICB8ICA2ICsrKysrLQogaW5jbHVk
ZS9saW51eC9zb2MvcWNvbS9zbWVtLmggfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDI4IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9x
Y29tL3NtZW0uYyBiL2RyaXZlcnMvc29jL3Fjb20vc21lbS5jCmluZGV4IGI1ZTdiZDhjMTUx
Mi4uNjY1OWYxOTk2YjI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvYy9xY29tL3NtZW0uYwor
KysgYi9kcml2ZXJzL3NvYy9xY29tL3NtZW0uYwpAQCAtODcwLDYgKzg3MCwyOCBAQCBpbnQg
cWNvbV9zbWVtX2dldF9mZWF0dXJlX2NvZGUodTMyICpjb2RlKQogfQogRVhQT1JUX1NZTUJP
TF9HUEwocWNvbV9zbWVtX2dldF9mZWF0dXJlX2NvZGUpOwogCisvKioKKyAqIHFjb21fc21l
bV9nZXRfanRhZ19pZCgpIC0gcmV0dXJuIHRoZSBKVEFHL3JhdyBJRAorICogQGlkOglPbiBz
dWNjZXNzLCB3ZSByZXR1cm4gdGhlIFNvQyBKVEFHIGhlcmUuCisgKgorICogTG9vayB1cCB0
aGUgSlRBRyBJRCBmcm9tIEhXL1NXIGJ1aWxkIElEIGFuZCByZXR1cm4gaXQuCisgKgorICog
UmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm5vIG9uIGZhaWx1cmUuCisgKi8K
K2ludCBxY29tX3NtZW1fZ2V0X2p0YWdfaWQodTMyICppZCkKK3sKKwlzdHJ1Y3Qgc29jaW5m
byAqaW5mbzsKKworCWluZm8gPSBxY29tX3NtZW1fZ2V0KFFDT01fU01FTV9IT1NUX0FOWSwg
U01FTV9IV19TV19CVUlMRF9JRCwgTlVMTCk7CisJaWYgKElTX0VSUihpbmZvKSkKKwkJcmV0
dXJuIFBUUl9FUlIoaW5mbyk7CisKKwkqaWQgPSBfX2xlMzJfdG9fY3B1KGluZm8tPnJhd19p
ZCk7CisKKwlyZXR1cm4gMDsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKHFjb21fc21lbV9nZXRf
anRhZ19pZCk7CisKIHN0YXRpYyBpbnQgcWNvbV9zbWVtX2dldF9zYmxfdmVyc2lvbihzdHJ1
Y3QgcWNvbV9zbWVtICpzbWVtKQogewogCXN0cnVjdCBzbWVtX2hlYWRlciAqaGVhZGVyOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvcWNvbS9zb2NpbmZvLmMgYi9kcml2ZXJzL3NvYy9x
Y29tL3NvY2luZm8uYwppbmRleCAzOGVmYzVkYjdmYTguLmFlYWM3MTZmNjM5YSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9zb2MvcWNvbS9zb2NpbmZvLmMKKysrIGIvZHJpdmVycy9zb2MvcWNv
bS9zb2NpbmZvLmMKQEAgLTIxMSw2ICsyMTEsNyBAQCBzdHJ1Y3Qgc29jaW5mb19wYXJhbXMg
ewogCXUzMiBjaGlwX2ZhbWlseTsKIAl1MzIgZm91bmRyeV9pZDsKIAl1MzIgcGxhdF92ZXI7
CisJdTMyIHJhd19pZDsKIAl1MzIgcmF3X3ZlcjsKIAl1MzIgaHdfcGxhdDsKIAl1MzIgZm10
OwpAQCAtODQ0LDggKzg0NSwxMSBAQCBzdGF0aWMgdm9pZCBzb2NpbmZvX2RlYnVnZnNfaW5p
dChzdHJ1Y3QgcWNvbV9zb2NpbmZvICpxY29tX3NvY2luZm8sCiAJCQkJICAgJnFjb21fc29j
aW5mby0+aW5mby5od19wbGF0KTsKIAkJZmFsbHRocm91Z2g7CiAJY2FzZSBTT0NJTkZPX1ZF
UlNJT04oMCwgMik6Ci0JCXFjb21fc29jaW5mby0+aW5mby5yYXdfdmVyICA9IF9fbGUzMl90
b19jcHUoaW5mby0+cmF3X3Zlcik7CisJCXFjb21fc29jaW5mby0+aW5mby5yYXdfaWQgID0g
X19sZTMyX3RvX2NwdShpbmZvLT5yYXdfaWQpOworCQlxY29tX3NvY2luZm8tPmluZm8ucmF3
X3ZlciA9IF9fbGUzMl90b19jcHUoaW5mby0+cmF3X3Zlcik7CiAKKwkJZGVidWdmc19jcmVh
dGVfdTMyKCJyYXdfaWQiLCAwNDQ0LCBxY29tX3NvY2luZm8tPmRiZ19yb290LAorCQkJCSAg
ICZxY29tX3NvY2luZm8tPmluZm8ucmF3X2lkKTsKIAkJZGVidWdmc19jcmVhdGVfdTMyKCJy
YXdfdmVyc2lvbiIsIDA0NDQsIHFjb21fc29jaW5mby0+ZGJnX3Jvb3QsCiAJCQkJICAgJnFj
b21fc29jaW5mby0+aW5mby5yYXdfdmVyKTsKIAkJZmFsbHRocm91Z2g7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3NvYy9xY29tL3NtZW0uaCBiL2luY2x1ZGUvbGludXgvc29jL3Fj
b20vc21lbS5oCmluZGV4IDMyNDljYmQyMDE2Yi4uNWQ3YTNjZmIyMDAwIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2xpbnV4L3NvYy9xY29tL3NtZW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L3Nv
Yy9xY29tL3NtZW0uaApAQCAtMTQsNiArMTQsNyBAQCBwaHlzX2FkZHJfdCBxY29tX3NtZW1f
dmlydF90b19waHlzKHZvaWQgKnApOwogCiBpbnQgcWNvbV9zbWVtX2dldF9zb2NfaWQodTMy
ICppZCk7CiBpbnQgcWNvbV9zbWVtX2dldF9mZWF0dXJlX2NvZGUodTMyICpjb2RlKTsKK2lu
dCBxY29tX3NtZW1fZ2V0X2p0YWdfaWQodTMyICppZCk7CiAKIGludCBxY29tX3NtZW1fYnVz
dF9od3NwaW5fbG9ja19ieV9ob3N0KHVuc2lnbmVkIGludCBob3N0KTsKIAotLSAKMi41Ni4w
Cgo=

--------------50GfGCps3rCUy0MrQIbZw5d3--
