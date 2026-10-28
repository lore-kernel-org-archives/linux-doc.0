Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224780;
	b=SDtbROAIFWIV+jpioJF/FX+rKl9iIcrVdAQlJMb7vZdVpfmw0YNGLd6WxK+KyPb3YuZA
	 q1HhThgCU5hyvSLapeBMnE7eQadteThPU5Z9OPIiPePFYEhjyM9iNjKpJQpS2O+t6sjsP
	 slDhv9akUJGnB8tf3AJSgq4cYFrq3K8KZXkMxHWjL6QqjGEUQhXa9UDJNAzaZT+AFq3cE
	 T1lSMxoJEmHAZoMkdHJzs6/R96m1uc305uL9A5sU+ZbpMRdo0ATFPOSt90L4j+zG0DYMl
	 EoMqgQsJVbXpoyB8yLmK8AuSQoAPdz03BvisZTqarP4uhpPm6YspMfExvc1EQ1k/OFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
	b=lawN4ZGpCSeRKqBOznguPRSXiBU7FNEYejdlzerSOqrO1+9eh/uGhPuRPetkWJIFFmHF
	 dkdYTkw45MGVH109ZM+6jDvIGAlKuWiTzOKhYB4rxB7uHCcEf7HLWgfGswhdRg/9z5oiM
	 1L6q+K7vkz7zUbGASsrx965obwt3nllTujppVAyKK2Yv/JLmXYguKLunJHxD+t7we4OYD
	 5VF8yfPsPGXxEh0hBvkUGdmljMnDfCcN5oO3O4uIvhMyCHI5lMWtbO3ztLWbkRV/kV2iZ
	 vydJzdgH2S5lfZ2gcs9562v6HssIPTrOSjS2Sjp4XxwcmiqU2gvncH6QxfAhaXLWWrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzq94gNC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pud78Nrc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED6660A2615
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 21:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED6660A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzq94gNC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pud78Nrc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIkQhQ2546997
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 21:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=; b=Qzq94gNCm29yddEq
	2mnaoytNhDl9X6hqSkD4rl6cke3dTfYXobdfGBw1qXK5XPxuynjoFeOWI0LxuiZo
	Q1zqGflIzEd4iY8a1gmSJpFmjurp1IR6nylxCqKHlMucaP2mEW+PcX5GQ8apj27g
	HnR/B1ZSRZ3+vTs+/eWRttJhTolaZIzzZcnlh8lNDocQgH9S09QW3Kjiw67Sgi/K
	VZSzNZeDxmWhkkhyFHbqhZqqsOQAquJ5MXMlPj+WfQOb+LS24vE0a7SjE/BvKNhC
	rBQXDsbM75balqwCfmKjlEi5V+tSAo3iCGSNGS0mPBV46/lr3QRpN+yrK21NtJ2N
	UIL8Tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc0n5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 21:59:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so303278185a.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 14:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793224776; x=1793829576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
        b=Pud78NrcNSED4MERVPeYoyd4YwNdGAFxjQWEmYZAiKWGBCh04kWTQbh+uQ5Wt4+EKl
         A0X3yC3XPSJvND8+4yLU2oQfyg63Cs78nwiwFFquBlWOVeEh2M+mBMg2PWYzSRvHs5eu
         yXQXtHd1VXj0H7+Tx8c2kLDgW1lszwuSY5rpyN5jybGmQy4gZSLIi3jGbAnTdJFlDcTE
         Q+Z9ZXpfN0gqqvg3iq1kYAnaTB0vhnrsPSulpGgPXfec4AxFDraIXoQCw/EFCJOTloOj
         vXNNT92jPSIhPaxudLEoO2HqR0ZNdbdd8kEttDJpEdT8Vlr8/DAE4pyKecwjGQHjZD1Z
         mF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224776; x=1793829576;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLK10iOzeuWAqnuh3xYH4xFqSBC7B0DkHD7buwOU474=;
        b=CYhGFk1ypKGF6topcuuZk89UtLNAOIU6ECz10p4TtNZ7PUf2hdlwAyjbQEhifxogH6
         g0Zl4ASGkPbxS0PuLiHsFWNWaxNXoGFhYK8kl9Yyh65kyVZs7MSrb0ocIsQaDmehLaEG
         ay/XqCbjTjA4k/DCHYQLeHgaG/YfVB43TNRIMs2ijQzQiGxYXGD43sY4JdixPJOLc4Do
         Q0IZ9Rn7HqLUiwBF3muhZ/t0d/GqqC9/zHjmMUMzDSs9/NM9v/iXHQ2IiTayoib3qdop
         UwTA/eag3C2+0TxlAcFcd4qfV/Mq/QetDnsQrlPTyS/3r+vJ+or2TliKKOZpLju1tCpa
         V74w==
X-Forwarded-Encrypted: i=1; AKwUvByC0/bo8quA5o8rcpbvcmDxMcjCgTVL5DjkYOO3VH7duBi/DleM5fB03f6e3+T3daOQWMLsC45fGvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJZH72ge+OrSFaKrosE7ghtFN8ZyQKI5noom0EAEq55CG8FyG5
	guNHFKuZaNuhHDw04jpQbOeu02pjD0z3DunXnoCFkzU/WT8IVm8LvXf+8Zl2UJgE0IvDh8h72DL
	en0nBhpXxGXebjfrXc2dZ3TqEs8C9X37MX4QO9wmLEpkMgHXhafnHe5nvET65mcs=
X-Gm-Gg: AYBFou2bpn/ZiKUnCfcp2XOI5fhQ9ykzScLRzPa0p4yWo3QK7g7KhO2ozJkNVWrjeOL
	X8SeEatQ8+v18zPHvvs7ya8RFGC/LL8eT0HTmFnty2niZR+Mhg5dwfESC0HuGkuvAXNQacFQvlT
	Z12m5hSVUrmfs1pSUQxlir2oVwOOlK51XSBZPEna+iS+FSqSJNbGBU+q7xTFNMBo2ud6O8DvxTq
	aNtSBhVxqIlMmcgDtF/7XAVGR5eqwX9p7BYdjblf5FrBhohU53C91Ct6VoxYsSXCSuWEgHNkn6n
	H5NByPwDDb4Y6g8DYusOgm5FGIzNlLvh+kwhyBuBoNp1i5qrVNfHDdjvw4HhZn4EHMasAPV7+fK
	Aamfuw5PL7swwi+Mpg3cBg4F5Tgur4NaJxC1K4g6i+mGLy6x7BM16ehj7kLUwvPk2kie87g4Im8
	M=
X-Received: by 2002:a05:620a:45a2:b0:93f:31f0:6a7f with SMTP id af79cd13be357-94408d5db27mr592892785a.69.1793224775875;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:93f:31f0:6a7f with SMTP id af79cd13be357-94408d5db27mr592889485a.69.1793224775294;
        Wed, 28 Oct 2026 14:59:35 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa82516a45sm24352855e9.15.2026.10.28.14.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:59:34 -0700 (PDT)
Message-ID: <2b9c44de-6379-43b5-933f-54074cf99930@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 21:59:33 +0000
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae2704a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qbwID_QRwwrUub8pYvkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: X2gAoc6QXYP54qzWg6ZFHef34h8uQaug
X-Proofpoint-ORIG-GUID: X2gAoc6QXYP54qzWg6ZFHef34h8uQaug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX0XYsi4Q5r0iC
 We0x5RUmIfL1D3Y6pMRALmpFGiWj/nGEkn2r4/p5S/YSY8qB/aQGWg6XkAuI9r/nu/VeYybKjaG
 U9THp4RPsS4i3u/jFbr8e96iJ/+Hn2wWmFGn87AsrF9F6HOL26Yhsugc4egduxftKB1I8elWmVk
 32AaQSvosnU8A9MlKRAdwOrrvueptzyVz+jhrZtWUMQvApb14Q4ESWuidTi4OFsutRTG1XSbmSL
 A/oAStSn4wbdQDodpLI6jtMvE/PYntcjgiCQJsTqqy0uATsddNhkUk8sxAJqpDDDCHBmFq3kmk2
 YGoybPoG2E8+M4I8IOw81GtRtT4Vbe3JxGR0EGHGrOwWf2Jsbg7luHguMy/ua0pSM/mU+uQR06L
 odhte5WeE5F+VpZ7ueqO/xO6cfSTn6xi8ddRMo+XJViZc+PlAV1jtK3ZtzszncQKji4/M3dd5Hh
 hhI21YonfSFaXEFEXcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX0n6S8sQHfz/U
 CVOGiNr4krWWSTdVyM+7Hj2oqXzhOx1us3vJiMPMfbRMaHyBEbZOxNN6wJNieLXds+GuX5Y4/B+
 8uniylszoEbhHsFgUlllO+YdyDzu57Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280087

On 10/28/26 1:38 PM, Konrad Dybcio wrote:
> On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
>> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>>
>> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
>> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
>> speaker protection. The speakers now expose two DAIs, so give them a
>> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
>>
>> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index 58158b51fe29..fddc76f59557 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -256,11 +256,26 @@ cpu {
>>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>>  			};
>>  
>> +			/*
>> +			 * WSA SPKR playback-side codec DAIs plus the WSA
>> +			 * speaker-protection VI capture-side DAIs on both
>> +			 * WSA (left) and WSA2 (right) buses. One MM1
>> +			 * playback open brings up both chains via the
>> +			 * machine driver's multi_direction_codecs flag;
>> +			 * the SP<->SP_VI control link in the tplg handles
>> +			 * the DSP-side pairing.
>> +			 */
> 
> I think this part belongs in the commit message instead
> 
Yep..
> Otherwise, do you think we could bind the speaker protection
> channels in the driver to avoid having to modify the DT?
> 
Nope, it has to be a codec-to-codec link that should come from dt,
giving more flexibility.

--srini
> Konrad

