Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224569;
	b=MIZ55XvHTBByeqYisJsk41F2QcSvOvQ+2m+I5/xRxlEAj/84eCGa6i9sz6EPQmdGgPpA
	 7HXAnxKiDj6A14n/X2s3PY1STU8lWHMNpTkZGDr5dVO5IOi5FzqiA7Vx2DFKV1f5GOWcb
	 IleHuSaVEIAEv2+qGlACgmz242oxkLu14q8iqTk+OMIk0zotjO79o/BELJBJI5ZlWrMUi
	 eIGrpQNzZPxstagu5+wSOAc62Fm7oTOFb8MUh8WatDah0iXHTGKTQ02PwR8MXXt2lLy1E
	 8T5xpPXQdXNsWJfWZvcM/Re36k4YiUi6Z8yPcLZW1t5d33wYN0GTg4b9r7jNjURNGCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
	b=KJrQTcH1vGxQhpbjmJC7NUyi3HepmURuC3RT6/VVTJQHoiyUih5IWBm21PgxaLL9aJpd
	 t7LjocbUh9N8juWnrbqTbxzOSjVvjW67+LOAMwHlfWyf0NOE0l7AZamygfyo/d8lygTJl
	 VfyMLDqsIHU6CDttXiEv12OIdXF7tGwjoZr0LCbgdAgasN+JMurox7qKxuSvw+1S+WC6F
	 o8omz3UtTHHn6C5bAxPVrJAIZxN+xfXOB0G0gth1OwsL16rbZM4/fMSHXd5oEuchk8CAX
	 Qyzb5Da5AR7rdIf0WgbeC2jWTyO9s6oHualtRjT1AgtfmlmxL4w4k6kRuP27+PvPTrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6+V08SU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Kb/ZgqIM";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F451606A31D
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 21:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F451606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6+V08SU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kb/ZgqIM
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SIPhlD848481
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 21:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=; b=I6+V08SUWFn8OrJj
	/oc980yhRpnBQ54mN3PIWbEuO1FUMEMdNjS6wI+GTpHqI+3erfHUvhl4JPKS6Kyh
	XhsHfvUi5kNq0lg81sAV56Z83lgeiT6GEiSbLDaybfRwh2ryNGLSRimZuF6aWlY2
	A8iBxYUtmYNACwXeCfNOvdcfUEbrXlzoMkHPcPfWRF7RSGM/Pw12Y1dKtxkzhtSf
	6uzsI+/W2xjo7qSi0D6IrzX4P5rMmEcCnlFmWAJ9BbPMRp/bNoUwMiCPC7vBnuzC
	Nyks3CrstZZZvoWl9+kootfOwOkFWsXcXPAgWGuU41nAKgyxrbu2S62G6VbDT98N
	NquHDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp31k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 21:56:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso332206985a.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 14:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793224567; x=1793829367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
        b=Kb/ZgqIMOFbmJghMIz5wr8TduAUH94lPMO3jGQ4yYylSWZL8hAUUtRhUtyBAuUGAUr
         BlhK/fzmMHeTt84cIDpNadXx3BXzNZ2vguZhyjJ5eQqVAMJf25ZFm/0JHhKfESsnbwQu
         HZ5RO6bzBck9XbD2G3gbfMlIzeWPKkp/hVf8o95i1djCkge/Xn/EdPJRx9N8UAtHu05G
         r9MYyWJKENOjVvGrVm6QiPxiq0yKkJhZ8izo0zqia1d1nNcesbw3kbnOo3sq7KFGAe3O
         2iBAv9UZsnki9296U93dO167MA3OkrV8VZhzCOPZdZfspRNKssTrLYa+ar9UuJZQ8mlq
         lGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224567; x=1793829367;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlZeBbTn4X9bi4Ynurx+tgcFaDtcBUgNgkgkjVTl578=;
        b=I4GvTfxlMy51Ny8XOTU6o50cQiw0jyGB/21DrU7kSXxQ0i7Es0eZ16ZAtgdxXEe+DO
         lhYUaW4CGVdesUIxYqI2zJGyH8Av+R6hhZwUAORQXUlBiW+p3OerXzIhrvZJP4Em7NkA
         G1mBtUYZAvLdExrnrCocIIudGimIDjV9yLBMV6Fy5JHSJpvMNfeYsmBmE+H9qeuymu31
         Ags6gCY1Olg98ykDn6TN7udUaMP6W+QXK7HkMKh0ujCsDUt+O2tugID+6yw7UfBbOSFG
         dbtOc5XbqCrz0AsfkJGgZ5leGQMEozmsGdvd7GTL65YusGfLcSdwxlH+rtPzwr+80aPD
         kUVw==
X-Forwarded-Encrypted: i=1; AKwUvByDTHS+F66MnANi1kNQjU6u3SeJcZ6CIdz8exHoy1CoPbegQDXsSuigH/Z7N+NxsdbYon0w6nR5ymw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfq88pp6gqTI88VYdzQ7hmG08FwJfEh9EZkHpKbzVpsA8fMwMX
	GwOrWsI59biB4dKFTAFJBIaeYud0DF2kIMGfVrHKI+8kBK45qt18hA/ER/GeZZUVobdVDG0L5nq
	5Z5SXc60fPsZyqV42FQl+VTWNMRR1O7e0XOMPxylyiS4njMbKXUo9erq+mje3xH0=
X-Gm-Gg: AYBFou0G7L81TfStFNM1X/SGoY+4pv8yz+8BEsrJ6Kw01kdzGDWG91RGnXiHV+Mna4l
	JfII3jgmuMO4bhviTHPfO8yA7xqVoJUcokwjCkl5xORoUSnYlnCWnvC+cPqN673mA7shbYdAJGD
	S7KIyeRIRU130tv+JiLZUTraF8YGVRZ32I39dXut2d4HY9cWcwrtBlZatiDqRQUtaPWPcZoNL11
	3wnN8Y4PVL0NGuQNM+TplME4Gu3TnwqjhpWO7YPVjeWskbjJNeH0kzdvVYGAd4DNV9WmOhGvH6N
	IbgkmQl4hIWrwHlZWhKse4izqfdDVsmR8EMYqWNjnFJYnX50zD98DqSs8EdS3C+4iztPl51f5EY
	MshsUw19lQkhqRjR31dqdBicoiKRUmbAlvTfIVICNmXhlmOpJl5Zp0s3HK9tlee8NAV4LH57sfr
	8=
X-Received: by 2002:a05:620a:6f03:b0:93c:29b3:3525 with SMTP id af79cd13be357-94408a94fe3mr548788085a.36.1793224567288;
        Wed, 28 Oct 2026 14:56:07 -0700 (PDT)
X-Received: by 2002:a05:620a:6f03:b0:93c:29b3:3525 with SMTP id af79cd13be357-94408a94fe3mr548785385a.36.1793224566702;
        Wed, 28 Oct 2026 14:56:06 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e64ccc693sm1283103f8f.5.2026.10.28.14.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 14:56:05 -0700 (PDT)
Message-ID: <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 21:56:04 +0000
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
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker
 protection for WSA884x
To: Fabian Renn-Giles <fabian@fielding.dev>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
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
 <20261028163152.26892-1-fabian@fielding.dev>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028163152.26892-1-fabian@fielding.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nyjBTP156b2slDJoJOfwIMPhn3OXYcc9
X-Proofpoint-ORIG-GUID: nyjBTP156b2slDJoJOfwIMPhn3OXYcc9
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae26f78 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mQyjg09NGKRehI6BM-EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX0K2frvNaB1ex
 Fjj+Lw7NTKZUfyB0qCeNO0GELBUVPIHpPB4UYkhpMRIa7+N2hAZynHSdbtc8TTkQZRpnLn6OJO5
 G7DIPf049ZVyhDo5DZ+Ep3Su8dR4t41KgbJr7A2IXe1lF/YQM069RRnzzGKjgFowHcsfzNO9M2t
 W1HFqDbKbzL9b0DL3qEouWZig711iH7BmkXID9b9X3GCDvPYzqh76TJp3b3Q+EF1JbtRjgJXrwE
 iBoeZP4Qb4VaAmZEzOrUl6RXw8WxXWViIA80IPnOlekUvZbjGWPkXzkkThN7gNCLzJKJP8j1Rwd
 rmWKwi5933OJIN/JkbNFv1pNYCyAcjwYQkQxxI3YhJnvRfpk7PyziNczfdbyIyrvzvnwLHIO2KM
 tZciM8tXHt0CP3s/bbdMsaprIcftHblKvsrtqCiTK6Gm45pafEwL1aXAN/X+2URKvhtWfxULHLU
 nF7n8iPpN4J+km2rQKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA4NyBTYWx0ZWRfX8y3jIGvXmC5j
 jmVCZaobzP9gQ11avsYo+qz9mNZ8emp8klTZLD5Rp2+qLiBEvgB1juUD9qfcQHVwH5VmsQg1/UA
 2Are6Glbx+sQVRJ57QObJLh4yGqnB6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280087

Hi Fabian,
Thanks for trying this out,


On 10/28/26 4:31 PM, Fabian Renn-Giles wrote:
> Hi Srinivas,
> 
> I tried this series on a Lenovo Yoga Slim 7x (X1E80100/Hamoa, 4x
> WSA8845, Linux 7.3.0 based tree). I found one bug and have one open
> problem.
> 
> 1. Over-read in audioreach_get_module_priv_data() (oops on topology load)
> 
Have you looked at
https://lore.kernel.org/all/20261023171316.819857-1-srinivas.kandagatla@oss.qualcomm.com/

this has fix for the exact issue, along with the VI fixes in codec,
please pick them up.

My Next target is X1 T14s Gen6 platform, I have not tried it yet, but am
hoping that it should work.

I will keep you posted.

> The function allocates
> struct_size(pdata, data, le32_to_cpu(mod_array->size)) and then
> memcpy()s from the topology blob. It crashed on the first load of a
> topology containing the speaker protection module config blob. The
> cause is in the size computation. data[] is __le32, so struct_size()
> counts elements while mod_array->size is in bytes. The allocation is
> 4x too large and the memcpy runs past the topology data. This is what
> I used instead:
> 
> 	size_t len = sizeof(*pdata) + le32_to_cpu(mod_array->size);
> 
> 	pdata = kzalloc(len, GFP_KERNEL);
> 	if (!pdata)
> 		return ERR_PTR(-ENOMEM);
> 
> 	memcpy(pdata, ((u8 *)private->data + sz), len);
> 	return pdata;
> 
> 2. Slim 7x bring-up: V/I feedback never reaches the DSP
> 
> DT changes for the Slim 7x:
> - The WSA codec list is extended with the VISENSE ports
>   <&swr0 10>, <&swr0 11> on the left pair and the mirrored ports on
>   swr3. The speaker nodes get #sound-dai-cells = <1>.
> - The static port-mapping is <1 2 3 7 10 13> / <4 5 6 7 11 13>. On
>   Hamoa the din ports are 10 and 11, versus 12 and 13 on Glymur.
> - I cloned the CRD topology and UCM, using 4 speakers, with the
>   WSA_CODEC_DMA_TX_0 VI capture at S32_LE/8 kHz.
> 
Speaker tuning data might be different, but overall it should work.

I will have to recheck on the port-mapping.

> What works:
> - The card probes and the SP/VI controls appear.
> - Normal playback through the SP graph runs without errors.
> 
> What doesn't:
> - Calibration (Operation Mode set to Calibration, then silence
>   played) times out waiting for V/I. R0/T0 stay 0.
> - I read back the SoundWire master and slave port registers, the WSA
>   macro SPKR_PROT TX path enables, and the DSP module config. They
>   all looked as intended.
> - With the SP graph active, the amp stays gated and playback is
>   silent. This matches the calibration never completing.
> 
> Question: is there anything Hamoa-specific on the VISENSE path (din
> port numbers or channel masks, the macro TX decimator routing,
> multi_direction_codecs handling) that I should check? I can run any
> debug patches you want on this machine.
> 
> Unrelated noise: SoundWire parity errors/clash messages appear in the
> logs, but they also show up without the series applied, so I don't
> think they relate to it.

I did hit some soundwire issue related to runtime pm, which was
triggering the timeout too, Can you try to disable runtime pm and give
it a spin.


--srini

> 
> Regards,
> Fabian

