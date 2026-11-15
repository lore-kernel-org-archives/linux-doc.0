Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776644;
	b=VatK8izoAIZTt/9lVAupEACfN8tbqTEVcSXxFHKq5LT8geSr0S9PPx8xpkuPj0siZ9Pt
	 I9dyiNUjM0zFeT4dFi1kM0pGFFRisQnW+/8+27z05dDRmOskufUc7/qeLwBwOJHOonY+z
	 Jb6rpG0UTHzYqkB2tol1TDMpE+nwljGdIMbhGzsOhAHTFkp3fdYer1jPcj2cOf/vIm/cc
	 s+pCbFTsyLGWJpqwKBnbQFOnRIyHXVwuei1LfrAi8Cpxzg4UOeP5GIEYV6rIHCTPcn2tc
	 D3QOCyv5u/el44ZA8qsKWZcflWGBbSReAiEHdEVqZDX9ohgwtUiaN21Wac86SMj/UNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
	b=xH7cO9natUOIES9szQY9j6zKRCrxGkgaT6lWKVbwHIpvtOirwwncS6EKV67JwEztOGTs
	 +YPy5UHiyjeU84LkiHxdA8fjdY8FzXYb0iX9x1C4F0BxND42+h3MS4ChmkPupDi8OpZao
	 b9LJFPgTv9Whi44MKpb/Zi+fw6LY5Fi2CCP6F272Rv6EDGRBxKTCNNsgnrhXEFs5f3gwC
	 9CzQgeyn417h9H/KorPqyvZrZDxh8pLo1rQpkVRDhZqa3Mot+BAf0GdbAjxYKmMRUkvAm
	 msNaj4mP+1cbChWcs+c/K3XUipJZyYfMgPmf4fRgz5L6GJVxkj8kXEzdPU9KJOkBe6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAlmRE7j;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746AD606A330
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746AD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAlmRE7j
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQbUJ2474416
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=; b=kIyRG5j3dYGOflKz
	T/SJjWzn5BO2NwkWRAPPvcI0paR3tQ9SoO8w2rMVBEPh9gXicFfLqYUkBQdAFUzA
	PjoZQyi9pWqdZ7ia2WQz1JhlYRHQ+d33XHAwCMsfGVg7F50wmOog7dZCe9kBiW+Y
	bBzkCiBFrzx+DfWdPAfM2x00H3xt7TeuQEw+kTG4G9aYI2QDg55JCMAjS2dJ1aQT
	xegBQ8GmK6ZU6lE0+7clSV+lrcXh1XiEhwyqXyR1UTaqUPx5400lLNRZid0ghgn+
	SS7fedKzqVIfQk67OkECg8QBxcZmna/0977iJHgUNhwBsdKDhUyZgVFstZnzgnp3
	cThh8w==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhkr9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99e0e6de971so89511241.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 13:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776643; x=1795381443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=PAlmRE7jvY+k5ii5pl2ZimDDlF4Tla3G5Iqxnm6b/znK2vsXGX5m0icod1mAqm14aL
         VYU753CG6hje7VyyUhVH99IENb9sduZa7/jdKlP7saLh8RGFGeNb9SlVEwplS9ABzcwP
         TxrC4CoHqr/bwdBzfFIq9CVethbuMM4+S+lijvSfWspPpr5a0RAiWxp/MtBMsFyrSgIu
         Z5rrmUZSE3JatQDuFkaNEAq+d+UWRTv4Lz8ITrsJkiLvRxf/5ukVmR4z0K3OExvVDRxe
         oROUtzSAgZevx3vs3r0r2kS8j5gFwLX8beU+L78QvyZHpYkYWNU2PAh3Jo3CqsMe5u46
         UkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776643; x=1795381443;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=NBCN79A8a0PXikd6Q8gXgci5buUOBPnJAwCYx4vcq3MDcPPCqdK9xjOeqKQ86ZrClZ
         NJhOGIOErZj2tcGCE9nqepg9ku7oaZGimKnniaWtn5ZtHMHUOrXCJxWboVhY+aYiSqs5
         dovOyhBlPvMMeWd3ObrxutrI+IglUBPMJnDJokjBOSdii2roElEdwiivPZQJMCIoxYIS
         Dbll7vEbJxH6fpxFOEUY/T9rRJR+03Y2fBOP39w5qhW/tagtGTNw1ldi7MrFsPYi0hFj
         c+yOZudEIhgVqxGCRj+zoSjql25zora8wYIns7YqkWI2QyHyCVGNpoYd7kTpgR39+93M
         E+XA==
X-Forwarded-Encrypted: i=1; AL+hErEofMnw0C+0mSdh0Ay79tszKeTkY0pw1pj/z7XAX/KG5Ne/ocGeU58eI2BP0KAoh+PM8wwBQwdSmDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lX5VWhNbJCeWoSJgeg2lWtEpXtlgOw5M+ZDbPsxbTX3jYrx5N
	kB9QVdoK9UQ05wekBeJO3Du1/6Xbmvf43RlX1nbs+2RVnwNiwGGSAMqZUJIZnKd4eaxmm6yG2Zg
	x0N8e3naR0vz+BDaFAH9GSb+LYPcmT/Lkz+Favp7KdKuEbHVf+ryo0EKdc80bEV8=
X-Gm-Gg: AYBFou37i2E/1HXoE+/rsa9+Ys/lVWU+UNDXCz5EvatjAUPqP7m9t1jAwpAgC1CCdqj
	0v5pocWP4R3xja86w3EaDT2f/9yjBcIMePoLIgXl7sXQr1fKwY0n+UXsyt74oKQIw9FVzpz3Mee
	dFnmiN7d9kwEu3kq1brsEDYKigemzHESho7j+0R0pDt3DbEbILFf0C+t6ESUvVZeySmbhLp6m7I
	RfudeQVk3Z2NmofliLegk7kBmH01mafHviNkedqOSq+j042uV3LTQkKnZcY9+frzoDjKv9ei7g3
	sEV6MdFm7tTYzEAnTAiJKnu+iN4lV+qKYdFMmNcp3/z791Xb5O9wXFfPAWkFSive8WV0la2j6+5
	/OrOxqw0b697bIezpxHZxdTR9106it7RGKNri5Ide+CC3GKMDJvW9alulUARue3j7cpta99MhfC
	LE
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317666137.14.1794776642086;
        Sun, 15 Nov 2026 13:04:02 -0800 (PST)
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317658137.14.1794776641568;
        Sun, 15 Nov 2026 13:04:01 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:00 -0800 (PST)
Message-ID: <c86bb364-0a7f-4c7f-8ace-586f5aa85adc@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:59 +0000
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
Subject: Re: [RFC PATCH 05/23] ASoC: codecs: wsa884x: add VI sense capture DAI
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
 <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.10822957842494469444.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.10822957842494469444.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x5YS2tlagEFm7rH2q1qKMyPKclpWi3pm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX6rKvXgGPkeLJ
 jyGjihJ4DbvxSSZJCQbNDvHeqpKwVZhW362iCZog8WegMNyfXpmrMQcB0lj2aVufWxLatNB6u7G
 mrZjrCi+rAe1P9eYvPYqompg6vJjX0g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX3g2P1CWkK/6a
 SUIGss3u71rnxYoiGff7VGjewsgAZRRRqZjPJ3BfGoZ9JZ18/17K2vo1b9WCwUSHZO397fN45k1
 ACW8tlgIIHzoCSrfNXNlclK0IN24I4/L5BZtMN2ZStm7eL6HkCdoytw/Vv9GK59n1R4urSFQ75Y
 ZPgphA/+0jbF2v//KuhTuKd0cZxHoygaf2qRZBWVh/k88FSQXKpcObxWFBl/Z0Rqhu0TpAwtUJy
 feBghaWXlW+GWiAlp+x6DF+/nyqjOCec6QnF7ialyW5IveVX2D+aBGSvH+6f6i2vhOn1BuBZikW
 uVSmCY4WgdVHWA+gB1wNzcdpWsEwQ6+xOzH8YKtMucqWAKkD8z3aPg113jmGk+LjAqD/BYIaoH+
 dyqrZ7FehGmdgCp0dbJLVFMK7y/1mZWzMC81pqa56kGmFSchvK9BIDm/1URZ2cdTcbzMc5Qx06S
 Giq2D963hB8GN0puQTQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa1e43 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=I4NBp-wbhaHMoEEwmPUA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: x5YS2tlagEFm7rH2q1qKMyPKclpWi3pm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> The VI sense port carries the voltage and current sense data that DSP
>> speaker protection needs, but it is described as a sink port next to
>> the playback ports and has no DAI, so nothing can capture from it.
> 
>> Make it a source port with its own capture DAI, ops and stream runtime,
>> and leave it out of the playback port list. sdw_get_slave_dpn_prop()
>> searches the sink port properties by count, so pack that array densely
>> now that VI sense is no longer in it.
> 
>> @@ -1795,7 +1826,10 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
>>  {
>>  	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
>>  
>> -	sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> 
> The VI DAI has it's own ops so it could just have it's own hw_free()
> which would be a bit less fragile/surprising.
Agreed, will spin that in v2.

--srini
> 

