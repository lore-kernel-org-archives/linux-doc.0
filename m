Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261866;
	b=bABZVZVavJMLwbANT7INT8+l8d9Gu4G6LrcrnZTk725OpVFkIV5qH7LbSyHxtpVjaJo1
	 08J0xvP7EOa7xIAUhTC1Kq8spoxE+xO2korb+sOAZnT0k9DEkAuaiRXlTdaP3g4F1+JPw
	 2ih/EFGbg+x/aHuBrRPuemqBn+kaQ6i97E+cStIT489mNsxOalmR3LZ2mO70L3swznvHz
	 Z43NoSF9P3qnbMcMmbzZDNxf1p2vqUw60NZr2BxnSNEXElGvoaKwjFe8bR79UFB9gdnkR
	 Y51dAN+wEsFgt/VKnBGGtAta6EwCv9IzAtPH99wBbgzN/xMcEEhKh2IzIo5usjGz4HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
	b=C7xWBcDWafg+qt5iC/yCfPnvqhYvBJRd2jxaXM/5UnkimGv4ECLOiSkUafpQkeDpLXvW
	 3uzPrt93trSayRIW4fPcVcwE5v3r5Q6zavTlHtpMzda/kPMxagkqfMxYSLSvb1V3qYtxG
	 7la/XEbjWeOfYYz0mKwZ0DKBAqgKqBBcTgV2GWbzCe2o5YPjcjDNA2cZSvTZhTFeFLfLX
	 ZrFbtZOCvzqTXOXr/Y0Po29coTAsLJpVGft1fgpBI/1MEFw0miZyYGmR327FjJFyk7dr4
	 6Db7XVcYkfqs8SjQpZK0RFnqaaJX8pP3pxiX7nZki2IrWDSD6MpRaBJ+c4AC6e6OJoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+8a5gz5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8Wh0s30;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19FC606A31F
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E19FC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+8a5gz5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8Wh0s30
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HMYc3890005
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=; b=E+8a5gz5mE8FXXzB
	7dU6HJoFxJEsPDc1K5cQDbAVcUEzlQHczx+F90ln4xeMzG0yVD/wBZ9yp/E8ZqA8
	l2iVSa9Faw9da3rCY8/Zqtms4r5ypnhoFQNYXJkNdMNofXPhvMsq4kRiWPnZrpGg
	FYO9u1gFcN4EavpgfirAzGfir0Z7IfoRP9v0P39XnSOrHy7tzROg/XgRypJM7tG9
	SodkDhrFCXhxiuZjGwuPGc6b12RPyknhPfa1VP7N4g/vLn2TslK9XAx3/chyDMHI
	7HiXrxtQzUhpqTxoGuAwYNDvpEjjwLTTCoavmWdHwrRaqI87EwAMffOVf5qSl/Id
	hHl6hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2k0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:17:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944102381acso24652685a.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261864; x=1793866664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
        b=i8Wh0s30wwQ8+60Q4lgSWrocQzkGhURYk+4rb2090UuebIqh+mMGsHZ4S7GvIFTM83
         kZT8QIgAbjfnoGd9wECU6zMIgvczBcvFhRp9yOY//n6SNW4UDjQTwLhQknFnKgPvMUVO
         g2vGPUsdv0sAMIY7e+ABGgRh8Lwi2Sew535RITbTH6EEou4R9hPAbzAHp0EMnHkRqRC2
         EXgZyJ5Y0YTmWCf50kn7GpuUps829IhMeq39BvMQV2TnA4kr7U/v8zOcfSX1PpB8pfd0
         TtImLFvBuNMSfVlWVbqFj/YukRcdQ+BLqK57vG/V33/sYrKPtCjP6Ub0CyVHtNc3Ay0n
         G24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261864; x=1793866664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2+7KRMYUUdk3+JsUexMv8qpOj90cSDYUOtSMZTSG60=;
        b=Ddvqox27ql0k8L2HnT0bU7LOZz+1LW5HTiCBHAG3vFfALfqKLSmFdA4JHyCMmzreJo
         1NAphVJOnVLNfKLB8/Ucx2faZCxelxIaJUI93Njt4TwwWRQm/03yjqVTuFOr82hYSeA7
         sjIFM+jdbXO1Pwm6qYtwYwX73DVK76RgglbuDmR6J/CJFBHeK/kWmlAf76fowvAT6CxM
         GN+LOUnOAkCSRy7V2xlxHfAt5UMgxFdBZsO8ZrivQqC6eyKqlCQ385+TVlRwF5WD8jJ/
         kPzs8UcxvQ/AUqXgwIovjh88oDfSGfriG/nOWqMrrHxIfKrPXhj8aK6iDUPWCE2LI93u
         ZNUw==
X-Forwarded-Encrypted: i=1; AKwUvBwfdanmQkHxghGOb6yXLkD1U02V5jAkcwv3fwVjxnInMXkXe/0MzkHPwvvlFtpJStmC38Oh2CsSPow=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZmVPmF71Co5T6orlKM33AK72fYCU5RvQlsCFQQSXZzucqmxHl
	1Xln390NXEwwnX0oy4L52edSdV1UwWmIDsBXPG09k0lOh1Y3Z1Q/WH9Gtc4IwaKMUCItXW0XPSm
	Cy+tF1Yyajqc/PZb2pdnVELHahTyVyY65rSyYsxzv0MNCgRG1U3tnW7IQHywFdOU=
X-Gm-Gg: AYBFou1IlxgYmUuGanEb8rVQ2ljQMdgOS7sXW2CJdMhlvJqjBFE2C+EiaUCGZEkuNb7
	hRZxnBGXnJGgtbwV76tVil+Qb65vfN/BUzcYTm7zIGE5TQE2pt5nyOP0qUx/icN0n1qEcV5J9Ih
	YzbgydhaMQ60hmwD+c2ZNI9lYNt2mXIguSPoPx4XxFmoNyaQ7VP6nKiOVrNCluJeqdhbxNhHdE5
	bsqGNTTvvn02WhqNCSZlTCRoWeqNL9LmBtgmy0XLB4fwmEDaK0OIs47Ef/+bAjRZ9tvQasNPCv2
	/SeSekawhpw8niWlpfFTsMFbRZB2LRCmDZbJ7sYNkQ0wE2mZNV0YzARQmE2zy7LMkMkmO28hJE0
	Gp2WjpU8qU16a30bbHA9zMb0Nc8nHnSG2b3oxIn4NbawzZ91duRNykv5aPFqbwZi09bAHL9E=
X-Received: by 2002:a05:620a:1135:b0:936:2f59:dfe4 with SMTP id af79cd13be357-94408845854mr747552785a.0.1793261864096;
        Thu, 29 Oct 2026 01:17:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1135:b0:936:2f59:dfe4 with SMTP id af79cd13be357-94408845854mr747550085a.0.1793261863581;
        Thu, 29 Oct 2026 01:17:43 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49641f64csm2408328a12.21.2026.10.29.01.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:17:41 -0700 (PDT)
Message-ID: <f8c823b4-9879-4a8c-8824-a745b5426c85@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:17:37 +0100
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
Subject: Re: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
 <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
 <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30128 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LyDrgX5eIXfwpl7llHQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: GFc04PEf3d8ZzvbkCnOjx6AbqRupoOI9
X-Proofpoint-ORIG-GUID: GFc04PEf3d8ZzvbkCnOjx6AbqRupoOI9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfXzaoUvHYlI4OP
 H7fsEK3u6Yvm+EB/qhQJmXzr1O9G9VI5wQrEyvheg6MzBtnCwMUDtWOvy/7qsNZ3uAp7gWjAaRO
 EgrbEkLJy3XxGrhG5LwX5C1lHonvoebNKv28vQ36n8CdSvF6hOlHMjsJhqvD8LXKRleySYnkvQY
 Gq98Zg4BEp3p7dCqyfVAcvGjtcTeYt4PPB4pdKdNJizXxAe7sWXWe2g4wUvkWLPHGxYkwOS+JUq
 jMjcoBNc1u/+P1gg7s9kOqcz3i3EPsNc4SIn8zh1kCnj3yOAPW5DKEBDvi6OkjHEfSFDCxVm/Iq
 pRRZsLJqS0+ZPYh+hrZmbK3kYDfCWG+6izWCsOKsIPK1hJLh0OkWQZIn1b5VjQjQugaHw/SfSrh
 xYiFNgJ5kbfPH8Wk8Lcq9uGderP8pQYNywzkQM5LIwa29IAXv5ZQSOEDYuQW5RwSgmIvYPHyYAw
 M/82J2sobVkzmYIMDBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX+nxP9MclE/5S
 0hecvQgExLyNPZfNDsRmwR+hAi33G3kDfm1VvS/TWNckfkb85zXrX/q7OtvxF71aveo7C8I9yPl
 zb72sbiBjEIej9vPeLnaBKnUTMZOBO0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290031

On 10/28/26 10:59 PM, Srinivas Kandagatla wrote:
> On 10/28/26 1:38 PM, Konrad Dybcio wrote:
>> On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
>>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>>
>>> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
>>> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
>>> speaker protection. The speakers now expose two DAIs, so give them a
>>> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
>>>
>>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> index 58158b51fe29..fddc76f59557 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> @@ -256,11 +256,26 @@ cpu {
>>>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>>>  			};
>>>  
>>> +			/*
>>> +			 * WSA SPKR playback-side codec DAIs plus the WSA
>>> +			 * speaker-protection VI capture-side DAIs on both
>>> +			 * WSA (left) and WSA2 (right) buses. One MM1
>>> +			 * playback open brings up both chains via the
>>> +			 * machine driver's multi_direction_codecs flag;
>>> +			 * the SP<->SP_VI control link in the tplg handles
>>> +			 * the DSP-side pairing.
>>> +			 */
>>
>> I think this part belongs in the commit message instead
>>
> Yep..
>> Otherwise, do you think we could bind the speaker protection
>> channels in the driver to avoid having to modify the DT?
>>
> Nope, it has to be a codec-to-codec link that should come from dt,
> giving more flexibility.

OK

Konrad
