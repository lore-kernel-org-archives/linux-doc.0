Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776674;
	b=L7UB+EdI2aGeehWyqHnQrGVyqQU3nCR34FyH/OTmALZliMMLEPGSldcixctaaUvnc61q
	 Xaw1P3NL0uvso+9U/3E2HNx2aXPylIs4PbdDPZunZcLMuDpIQVIYhXxpvFtogzFTkci/K
	 Y6uqrlsfisOJYzA4xOJADdr7qagrc4CWr+WjeGnuaTkGsYdz7eK1/uT3UM/Qjs7nBoomF
	 cc1LP9/ZIZqSzzZeV0+WyFfpcbzupP6IZbKTYCWNEcboyhHbogEtGsAHVQYRBb8ZmSD4f
	 isnjF/JjlfW7z1jDrh+tXd5ctrWH7khAh/s8Eb1E9MTIdrSkUL8aPHJ/R4jFRjg1GCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
	b=q/42GXnDoX683O7gCr2Pagt/ozr31oUjzUno63haMy4KgVVVc5yDPoMrMFSdtWiAv5mj
	 NsaFyLFh/91j5JBuZ16JiWNZF7FW49658wmpiFnRq2AA9mFZh+Be1EYJUWcOhTlMebrij
	 SlqOwK01AFI9lpH8msMAXsnD+L/tkgckkBFvn1SK4DXopRN8JaqhDO6x5anMmTF1PWCDn
	 +90PM6jj6hCN/PRAZHikOWQLsbh9qfll9RpatrDEGVlcN/7uB9qwC72AoTL3D1hxujI4g
	 vYpoGhymA4Rq2Ccwaz3hv5h7nLV1c1K+Z+PmUG86arOaRhjUxOKcvUKQudMEWp3x+XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oF/0+aqw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni7r6Y3S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C03F606A31F
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C03F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oF/0+aqw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni7r6Y3S
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQtaR3150013
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=; b=oF/0+aqwESMrHQKj
	1sdeu3kSMD22w1XiSlcthjvvll0gokTqAWQcduUSGxstXfrbk2ZG6iFfUbFOyjQ5
	aTKZS6S5OXZshv1BZ5J4zAic2u9Jh4sgnyJKIYDDlpOIbdQJzKgz+jG9DwC8Eann
	z5bjts8xnIiZi37qGDud9gLYe27NQTu1VpLkg1Ua1g4KqAOiYI1QCxgQ/Q/CCl2N
	w4KDO4LXhXvFFM76iN7aQ+GAGWHR28RPg5eXkEBJTT7Vmc9W4DQ+4isg9tAuFCCe
	Dr8UdlI7QApi5P9Gsx5ig5h8CYP0vPKtYja5HcCGUlUrN81DSNoleZkw3O1HzZ27
	4cSdPw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx3vvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2ef6a9f18so2136628137.2
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776673; x=1795381473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=Ni7r6Y3SpAkfsCqPaKjQ1Dhny8x7aOgsUnMOquZg/CFlLsPFLsZ6mQcqytqv0k7NI+
         r42onz+vW2AmiuvVWxJEV73ui70p84kM50AVaKLlIbCo2w4vj5FI04klma7CEvFr8Luv
         QHtsO0HoCr/msaA+Of/pbJeNphtJ2+q1gAjfpNaH67BgwS2UNMsTWCU1FbsIbHlvChaS
         B4nfXURHrNitVoUqWEWG/nt4oUer7d0rDdYbxEOLWnbJOny662D0Jg0OlF3mhwit47lB
         omIBUd4/oaBHsAGHiWTgdIl0/acQ5hUlvfI5tS+3oHuGq+Dx5H/MKg7gO0cSDY81DXqa
         ldCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776673; x=1795381473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=GSW3prBFQ2ypGzcfYCpshubb1pvj0z/tmtmOS32E/wD+4HIWy+o+wjJi538vRXaytf
         AQfv/QdkFtzcfoUwxz5aNYHJiukatbpN/SjcNWgiY+nidchs+ZYW6L2IF80X0aHWJGVj
         /R/GzxVJqVm2y7f12Il/uQItCmTURXoDaaep8XPpxVVz1IeDWgTjDbustqGIopJYDcI7
         54rhJFhK4zpENNVLLR++KXJwYcpoD4RbDD/MpqQgC+KUa1AnlXARsDKGokmVnVzMneMX
         sE8jllazWgIjqFhCscn11gpd6+ruOPZUXktwEA52DJRCa1mr2CmzMkSuC17livO3NmKP
         uKvQ==
X-Forwarded-Encrypted: i=1; AL+hErGnj/rB1HX7D4f9s3HAp+TFRr2c5RBC/0Gg0TnHxLjNj6A+C9q4n4an0OqZRAx+wdemJRAbkI6wtis=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8ZiyLEQVWK2cW0R7t6S0bfNUbhX0Spzz47t6dCzWgRQ/iM1PZ
	iYT8sibOUQ7CKaG4CDh01V6RKmjOK5OUVnxqlUnFKyXVSzj8LtocRMpTLPVFK8bnzkIv0D37spr
	mHxLlHoiHT5ptheRMm70bintM9QIzQ1s5dcvv/Zr4XUmI+J0liO9sbZ3u+/hGg6A=
X-Gm-Gg: AYBFou0+kFSprRrSj6Ju8aOcwInKrW24AQhV1E/sSpQsjI5lBjklIttI1BbBbL5KKfI
	YdaJJE04mgoh2NWrbaZB8yObhPxBEsSpPBx3+w3QmFUCo+J3RV1rvu55L+q/7HWi5mYNhTk9gLe
	bENdWGRdycmmGgCyNHPzKNSXGyFi/yRiYhxNk4yLIFp6xzg+P2olU0a1idFx6a6i53xcz1HB9PC
	kPPOd/6ktUfCWoxvgdjZ8oQp9rUrvrH914uH2cFcXUYhUNypaG90xaZA86QUeNE85clxaJSxfMz
	BKYcSrHWPG5y+kYvdj3cq5Bjv4vmg6wK/uC2Zfxg5VII0Jcbs6ZNgO7rzksOHz2zG8s9JPnNhoM
	pkchWwj7UVRvykzsDIOWXEuTr22l/JP7vnF3FlCpibcjFU+ydEAkPZe73MlpAiRfZd8KV0CIOYt
	zX
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128296137.32.1794776672591;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128278137.32.1794776672148;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm231653655e9.15.2026.11.15.13.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:30 -0800 (PST)
Message-ID: <e0757b36-cbdc-4282-a30a-4e5f4866cbce@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:29 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream
 runtimes for multi_direction links
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX6tso3ObIUXmL
 MhdpsETbb0G8Y8uhNDvzx3LEEeJ0uEfRHOieoF/0umA/LjK2iS9KPgBGLK4Z68FEbEZpcJzId0T
 KIpr7gZhr/1MMfc/jcxye+I18jvr03VQkvFhbqpm1W2I4Z6KuwgLjVtosp/O9hyESJnZqI3lBNf
 qBAG6rJmYoziaVya1kiHDNMAlKeGu8kn5Qjic6AzEwhu6Q2McZ6N8nYgSt+Ht3ihd9Ukh2TnD7a
 Lg92W0tAvY4y/l6Ok5JxBtEay4j57YRYIWVUB4mJpoKOkjVcucoHSzvxxhcEEqLut9L7DxiPWYV
 SJvO3R0BRNYNzxEY/yFXaDBdLXBwKECO4joGHGEBG+eQPhH+AzllcEixKKwKTcupzTDLa+Ehbhw
 ChuUo9GhiPbvnYf0dIhoM9yqZBrRbQvLNxgt2Jma8rBTgpD3ylgKq2bolS51RXc+VCUvmdXA1xq
 XcmSa5+pmITFmz25o8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX70aQ733YG28t
 77oonywK+Liz6H8T7k+pRG1+czxXulHMdQiqItlIfquFkPYW6HYHlYGjYJuNsdRbN8r8Ts86xte
 ZOEv4mRla8OJjYOjIuxJTUGnfd2GHrU=
X-Proofpoint-ORIG-GUID: z7QlKZVqa9OicustVe8ckS9dyKJ1ROn8
X-Proofpoint-GUID: z7QlKZVqa9OicustVe8ckS9dyKJ1ROn8
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa1e61 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=YIG-ia_FBqWyFDXOZ9oA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> A SoundWire BE link with multi_direction_codecs carries codec DAIs of
>> both directions, and each direction needs its own sdw_stream_runtime.
>>
>> Split startup, prepare, hw_free and shutdown into per-direction helpers
>> and run them for both directions on such links.
> 
>> +/*
>> + * Inline direction check that doesn't require snd_soc_dai_stream_valid
>> + * to be exported for module use.
>> + */
>> +static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
> 
> This looks a lot like snd_soc_stream_valid().

Agree, will fix that in v2.
> 
>> +static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
>> +				  int dir, const char *cpu_name)
>>  {
> 
>> -	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
>> +	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
> 
> Both directions will end up with the same name which won't help
> debugging.
will add "Playback" or "Capture" Suffix base don dir.

> 
>> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>  {
> 
>> +
>> +			for_each_rtd_codec_dais(rtd, i, cd) {
>> +				if (!sdw_dai_has_dir(cd, substream->stream))
>> +					continue;
>> +				sr = snd_soc_dai_get_stream(cd, substream->stream);
>> +				if (!IS_ERR_OR_NULL(sr)) {
>> +					sdw_release_stream(sr);
> 
> sdw_find_dir_stream() (there's other copies).
Yep, will move to using the existing sdw_find_dir_stream()


> 

