Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364109;
	b=uSeXhE7A8gyue+QL1HLsiDpIgTzfhxmLRb3RW02i9doZ01Z0FgNlMQP0pMQ0sfZXzuQ+
	 eo1Y6qHDAoEZdsRxvOgTjGrHmkR1eoiCjenxQZuYFqLCrC+YfDEPv5MeVuDEa8QZDdzBC
	 Ii9ODHxQT2Wl1nha/rTmsZqfuXJ5eSZJWdNaSUzKRsjBdD1xFhXE5RR/eixJ7oHD2CQJh
	 kBkuWR/wn4azI54eGxD/aKUXNWLkfoFLyQ7GJkUqYJclB9cd3BmiEqXTQfBqK4YF/QiMa
	 3sw5J/NpVF1lQh8l98bnMJfuVGoFR6DrsrJ5rmBdwZxytJhPExy0rVEf43XriB7736g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
	b=0pUCkEhrOt6YVXB0kRftgOxgkzA9/kbMex3bB/OZmQHq07K6VyCek67L+HglOFXRnlS1
	 rYq7JfPo+55k9xqSCbvtSpErTZFncJHBTDW5X6Savz/NGL/FstBScZvR5Ia6fLlVnfil8
	 BuZ2G7ychGHoba9GFCNPPprgplYhF2pcoIgOmGM4QZkflIemCesNZ1bdEpCmUrTyEyjru
	 CIFEhAZbQVZ138EZz7plbb8vGYGfDKYePEgYX9zd2HreCCw1Ma+AmJt+aXVbS3meF6E5L
	 CNuJFxjRxH2qiUnxx5KsUCJyWZhH1507OaVAElm0KQzN5dPkXXfl64pE4dvdR54817Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD960A383F
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AD960A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xi9h5i9b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LLDu41YZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQqji280643
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s7yG2kXY4Jn
	+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=; b=Xi9h5i9bgGoE4JL5X8INRZkm2m8
	RnEGRn3wCA8EYxnsv6G26qZ4nHkFtowVLEEyeJqOHYMjyIB6AECNbsyVrldAshwJ
	3dRjCnmSGFQzENLynWfWK85ZpzWUNYzMeZSLVPWGBvd9N3fteopX7+sW0Uu6oNXG
	St/T3tX302/jQIA1Ij59xF9tUEXiuDDlD+E7e5JtTCvVvnV/2+OYKBSYjj+LfMth
	7YtyZISbGmhxMqkWqSJTsovTPutdD3sNOqjy8py14gvXoFAZN/u4qFob5OsESlHO
	bE6S57ruJAT3faqtq93hX7IWhBydWEQLOwXRm/OWaE0s1no+jgZYaK7R5rQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6ktf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-920fb8b9859so83530256d6.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364107; x=1795968907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=LLDu41YZ5P7YFZzHnNeGbdTg4ztt8cJ7KSa8Qz3RCbSEQq9pb0ap///GcKmGnn02FP
         ej/je7EaUOuEe4AXS2Y/0hIuqSkVjaJuJ0k1KSm26zfgMCNQH9BzgHTZsNXhywHLXABP
         DLfU2D2+lvMXLhpXn05wt8i721rUVdZTN5OGHh650GpF/fABJ8tneObrJJChxtneZkuA
         VyxziWipfeFjBvww1Qquacg9n+aRnb89fUP3/oZm3gTcVUykMmlv2C3eQMAdOVJJzCVt
         ralzTEGc7/z1GbF4pA9UdPedhZZBLbUAvMP+BvYTMTTKejIKu5JRIaaJiRg66afmdhyv
         Utiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364107; x=1795968907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7yG2kXY4Jn+xRpX2TDgFE/suD9qmFnNufz4gf4AHV8=;
        b=xaFE7wPNISgPP+kzglInRshCwVJZ13KqZq0ACzMhdtvw/Q88IbdMp//J7q1MPQ9S/5
         eEfMHJheHO2/cxN9y/YvxNe3xIkR58vKYQek5zKWoYfvAWhn7RGDaslBPyU/4VtI3YZj
         ksZSYuJnX/VMLDDrCuEBacmQPVx2rUEkm0iaxqWnGXSKDGRUnJnpWZuUT/8DYU2H81Jw
         dJXkwTmcxBje1eN099AgxVmsItpyIBkWLXZRx5Oad3ZJhAb8d6ru2xd5LYwUh6Z31Iti
         iYmyuKizpF1lBEROWkNlDH8hzfW95i8pGZdCvYQqg2Xc64FmHToMvxN5As3Z17D7Okkg
         bK4A==
X-Forwarded-Encrypted: i=1; AL+hErH8lzPnXKPLPqMr6XjvYt1cIdG5HN54Fc963vXJ7CLOutEL2NJHQBVjAsf+PWrPeMKOtK6W4MXPufw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qefBq5FUYdUBOCAUK6CUHStgE3BM3UpowgG88Qgwovz1n//1N
	4VLETvSqwOokg38JXnjmgfwuSx3wIYwHnrFYeyH6A0oquPsa9/Pm1bMJUZjstlgplMvLPF4GFr4
	mfOAKJxuIDNrvuvbncqpxVxqF/H80bJVeGHc6aG8GmXDMcfcE8t97BF/tJttVDo8=
X-Gm-Gg: AZFdTZddWOmfvmDvViwknNQvXpLHqdaBtZRdz9gx+Wih471X1jYZsKLOi0JkY1rA3US
	mJENdy0k6UcTF6DOY5zHUp8YBMrSHG+gYOtSi7WE9IOhLVP2LkCPMELig2jPkBN7zNuRjT4rEK2
	ZtE9T+I0/uY32JCMdZMs5Z6C8ebs6Gzfnwl1/pndMaLy9Ys1277ERctJdGh41CaZjkW4Xb9vrzp
	kTmZAKxitf9ga1+fy/WqkHplM4b7VtCpxLhkSwIrxCIFrU/+n3GZy+IkOaf2roq6ql8Fvd2B6BB
	eecuhJ90yBRl0yc7miUtW0nRc61ll/fPoJH6Nnne1fDJAi/Ktr+1WFMKDQNawteCaYBNJvN1BEs
	2O9wurYrMglNA0uVVFCe1GngunbeQAVNcK7hBz3ikxQ1QdqvREC69vHD+DVdpUXhx
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581393885a.46.1795364106981;
        Sun, 22 Nov 2026 08:15:06 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:949:8639:ee6f with SMTP id af79cd13be357-949bab25ee0mr1581389385a.46.1795364106613;
        Sun, 22 Nov 2026 08:15:06 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:05 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 11/24] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Sun, 22 Nov 2026 16:14:24 +0000
Message-ID: <20261122161437.5994-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qFq8Whqgp_2Huz5JCT5FTmLDdKpB6Bs_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX9B1K1vGBsjRd
 TT40lNMuFKItQHIRUmNjuGBZu6a5KJ/qyr1+DDHZFrxYsz6FVjr7AEMss6LsPIpwcqFtud00HnS
 1jNON0qUMrGwsAtgk+RIwz2r78eJfQg=
X-Proofpoint-ORIG-GUID: qFq8Whqgp_2Huz5JCT5FTmLDdKpB6Bs_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5Ex/dwyu3iY6
 i9Kk1Aadpjrf5c5EmWJD/OPGgXtOqg66pbf69l4CNPGDB8Ud7oLUk7cF8vcrlhK//CNWBx3/dn+
 m4o7P1aDEL2l6FoBgkLXB7ZbG1FStRs1i9SzilBxcv+NrNHE/p6G7mQXxV+RKtT1xXpm3dCJGIE
 EZKIwqKb59tXTAd+/INAqxzdQkSZpyEU8tk6+wQgNCyBLl0Cz7mhZ97EOat+g9btd2k3Dur9rUX
 xoD2uJd6Q/R9bsXmEBo1izbm+cDZTZQdFsXokpOfcaULB3sHQe+SpSka24KQXokYDJU5bjbEM2P
 DXKkNAW4SPi/OM3SiyHivE0kFrKSQnQSE303xLU0ZGIuHegp27adOjV0QgfrrcS2dDAFlxFC57m
 xGpC3ikEZgMFj8OYX6XUxxmErpiCiiWMDWcGokFC9csn7Zrc+iMVsmyxmvmEb+ru8bytcujREap
 TEA7129cYwzq9Pdn0Kw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03150b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index afa4bb095e09..4a86e7dd48e8 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -202,7 +202,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
 	.rate_min =             8000,
 	.rate_max =             48000,
@@ -222,7 +223,8 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
 				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
-	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+				 SNDRV_PCM_FMTBIT_S32_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
 	.rate_min =             8000,
 	.rate_max =             192000,
@@ -643,6 +645,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 	case SNDRV_PCM_FORMAT_S24_LE:
 		prtd->bits_per_sample = 24;
 		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		prtd->bits_per_sample = 32;
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.53.0

