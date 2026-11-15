Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776650;
	b=DOePPHXhORxSpERqDxuN8QeFslkTAp5QoX3jpgqOHpTe7/F3KYSRqVL5QUKHXS+x6Sae
	 bmoGts4i3BqtpZKlKHAqaFGhhH39yATUhxkipaPlzLI4oalBgU4W9w/8kQkNh61NKioMP
	 4TBr/7oKHbfbRPpRHulR2rmqNe8i7JGza23bkN8CEwlxtuijrsWY5YXqhJk1wUg/EOKMn
	 s1B+z+4Hjznek4MYMvFD6pjcvuaPevZJIgZqO2fcPzYzudmG0gmKV6q0Uv3JfYXfcrB6t
	 TGOEuwUecwVLRQ1U7pr3zmR63h7Mm7FFrToZm2HXPERDjev7apy0d6Z/FSzuJVTPpUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776650;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
	b=tiEWAs68wuRiMeQDXVfycESABkDHJLKi+4BWa21sz4NOqiuEQ4xH8xTJeSHZIx2dVkVu
	 rzyJUmMliBVoRsNEV8iUqIXGb+cMTMj/t1Riv0UoEpj9BHBNbHaESIwI8oBd/B99rq8vp
	 r125niN9ajV/Qrjrqs9bqYga6VRpJhRMj0wb61TgNPXOm+9ZFXYofj1tJ7l6bRIBflyfV
	 b7FLHfbgdlF/wK/XzOq82dH4XVf7f/me2oKsFN329sKTgmzDUIE8JykeDh+zRg6/et2k0
	 4Fy8QMfW8AlQ9u2QzN6CbYyMsiay4KFW+dyN8nmft+pqzDRxUAM+9izNzw/KJfo0DjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MXARMSj/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4C1606A338
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4C1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXARMSj/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIR28O225003
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=; b=nZ78Q9basjtzbufb
	bsGuc5p9DB0g1PCj+faIJPTKWjoMfCYXmUiPHibTlP4jWRRRbiTTM3ubyUQaiKuQ
	ygGtlWFw5d9Z9zSmkTB/6WrZ7B4QM8cUdq6ECTiyasT57LQ9Rn//EliSQ9b3XqB2
	3kylkqLUMLEOca+6q5ypWJoTC/enUbrZ3qpS4OyVxqvD3xCh3WUqBsZicI6KuZRM
	0ELDEvMNwzP/VjZbChoQcwZI57Ov3ctC8DC6r7a+yiV5AAf+9qYXUjVirIrRFJrq
	J73jJRDWNUJ1+5JtpJnL3hUsQQ0noyljMJ7R89a7wannUyX2m/C1mQJ/A3qUJtQJ
	eu+zxg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdurk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 21:04:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2cba05824so2637478137.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 13:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776647; x=1795381447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=MXARMSj/UQW1iD14BO3VGCZEZbg2RKbFpYl5uOVBayL92sueDW2Gbjj04+HOnpWK+V
         kj0p6rhUHC9XWZ6ktOyvB61Fb78qvOWg1T2UDAWFA60Yu+wKIjP4Yby6dCDLp4g94OaU
         WeR/NcSP6drn0brwqH0AUyhWsURVFdRMZA475jIj4qpVnGp+dcswko0RuQ+gQwVg+rJZ
         uQtuazvQwS1RjWKDOiMdRzxIqlrVUDw5W9m/QcQKp+HrEqV7pIkSYJ64kL7oizuDN8l0
         pua14L0/BAhNXG6J4Mi5OcNxQc7O10vbCad5AMbLmbtcOvalYveMygL4JanJDR7tjvKl
         i30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776647; x=1795381447;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=ZFtsp/n5lUCZERwu8BwdSraaxFFtk74syo4MhL5MG6jPRSOWDiIZ+E4EyPCsFeESmC
         B0guJasaXjlVnNDiqYfgHirSJ4Ej5lIv3RUdoWYGoawIlVq3YmPRNwLFARMlp7gfT2dq
         7YHOkyLNIyoiqHH/OCPvdsxZhHo5MXOFlqWU+HfTDsMH4aHmXdFaiOYM7lMM7W57eZeq
         /DqFrzofQweUVBX6VlucMSS9qVpZniK8ZyTaz5a3QpC60vcge362l7jolcVQjQ7HAy7+
         YdC1djVynQzVC2dYOB0H7svC1FvYs8l3a8UFJS3GNKCnLYyN/A6DRmA/EybpOGj7svPd
         V5Mg==
X-Forwarded-Encrypted: i=1; AL+hErHQTH8x4zYWI+dYsbMmJ6+eSyi7yKWVA3Bg99huhShKcCUdIBmkNNxnf4uIiB+TuJfaGWPyNmIL6eU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qshWaNwbi8bPIrPMieBNb1st5M8ICncRcYL/3brsbVlOcKmTl
	ER/pvHWzdcoPzLXHLezH4bq/icTku1hsTZzNXI/BoGowtcPH+98iXspskwVJ1eTC1mpAkC+JYCz
	Fh8eXggPJFvoXo8VPwBiBp0ccP9soxHb8Xyyb+C0LHRG1BbOGchAFvJZLrRzNOTg=
X-Gm-Gg: AYBFou2uPDewOgYctBGu2Wxxp2EPGKYdTx/bFEs6XbPVHdoInCbbrMbcRSdbZiz+jF1
	1sT2Zs+56Uk5xccWg54LyuITmN/5t3qO04Wjs7BskYLCUX74c8wdayoCI5ooDMmCfuifKTUehkV
	xK21Vo0fvIphZc0grquHmTK22AWfiz4HAz/1wPAttUlVeOfi6ZI9xnRra8tTM4Y3HFHX9GY6pja
	oSvffahKvrJv+dWuoY8iPFiFkE5Xy+wG9mF572HD7s1Y5LVM4IiB2lzXbS0P+hdZh4Qq0EGvWP3
	KZTcjJG5AllkfmRvKehEn8h8QMRuRGuxkQxuQz71UNATwTwcBhkh9eSWF6YzLle229jzj1g6Qz/
	zxsns57zXE6r3JIxKAS3pOVZ2B4mK/zJIjkqvDuDu/JQbiYhu7OEtKfKSRZZhH+0G5UW4MnQM4+
	uF
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103472137.2.1794776647526;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103456137.2.1794776647090;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:06 -0800 (PST)
Message-ID: <43da6a90-3a5d-4a2d-b2ff-7f007faf7abe@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:04 +0000
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
Subject: Re: [RFC PATCH 08/23] ASoC: qcom: audioreach: run VI module in
 calibration mode with per-speaker events
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
 <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.6938504071664790577.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.6938504071664790577.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afa1e49 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=tHvR0g-A6sjxE3NzUXEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX4CIQOIl0W37d
 jzD0JyETYohG/jTFBS2Hnfc3+bi/1tykq5GnSr6FUZ6cbogB2CMd785STbnEzAa4VQ5ScIVmfIM
 ZxNX4J0uH5LNVxMrdFmhDamAQBt0ubw=
X-Proofpoint-ORIG-GUID: yk_ovYFCVy2qM1b5yMxR1IPuMVtzzVge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfXyoKjSeI/wC4r
 0LMSxzr6ADLN/rs8HyVa5BqYUEcFTuWoXNg8nXKYdHO7ypjlt5/yvTx/AJVwikIju5F1uX1iV9h
 vmw00DBZv1Of+Yx5DucRCnQJjYuDXv12JViXS2cOYstoqri3IFnaO7/axG5ZJqnsZqvqpiy8C24
 VppJqO6Z2vUc8oMQGumswtr5cMu6E5ZSRtJxpruriS8LbSHRnqPTcvDZlo7uVS7ZoSziOesiVwt
 F1Hq1CuY5gNUx+S2oLdSog6Mk2nOBLNWCUtqsqCnkYvffFj4GR2OBiIrXJzetQRcw541XtkAKx8
 aHsuV6+FixAkpHyTssB6VGXvvS7bCJPIJT4b786a3j5pcYijelGAO0y8UUvGRjvorGRXfbgdpSx
 1s+tWiPUDcTNnlZxYGVIYXkfcLc8a2Hu3YCJ5PKlV5oi7VKLQADo3yzEo637CdtrymyuL3AszuF
 BgarTHHvQzNaZksYDEw==
X-Proofpoint-GUID: yk_ovYFCVy2qM1b5yMxR1IPuMVtzzVge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Put the speaker protection and VI modules in calibration mode and
>> register for EVENT_ID_VI_PER_SPKR_CALIBRATION, so each speaker's state
>> and measured resistance are reported on their own.
>>
>> Number the V/I channel pairs consecutively, as the VI capture packs one
>> pair per speaker without gaps.
> 
>> @@ -1483,9 +1513,20 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>  		return -EINVAL;
>>  	}
>>  
>> -	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
>> +	/* One 32-bit V/I word per speaker, so channels == speakers */
>> +	num_speakers = num_channels;
>> +	if (!num_speakers) {
>> +		dev_err(graph->dev, "Error: VI needs at least one channel\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = audioreach_register_events(graph, module);
> 
> What unregisters these registrations, or does it just not matter that we
> do this a bunch?
These events get automatically removed after the graph gets closed which
is on every stream close.

--srini
> 

