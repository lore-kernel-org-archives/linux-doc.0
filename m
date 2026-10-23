Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775885;
	b=hKumPiMmwvdtRgw6hFyvwHP7mkNU2fm/GaN36tEgNX8knvHT1GPW/6IqpMxqn5g/t/me
	 mnOyof4Y0RSRHbv8IMacCrKjNB8zVI8qAV82f1Wlimq4uLwV+R6DAvJL7xyP5kUEsOnXo
	 Ivj3aN7pbXcSAb3jIAYVrtRH/TQyKJVaRtaqdn5kdCkEjH6ZZtPPwsStvjRAUYxSlvDbO
	 51ocOY1BCv/5u6/IOeA7uE7r+DXUF2DmRIxocwgQMFiDFAIHmcUaMFCXC5KC78d04gseI
	 Yp/rgrK4v1+NJ2jjzXYaVDkZm+4XCI6MZ7hLFFIIHYrLaR6i5XUDq0XSQAd7Bhr2gxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
	b=UkDQ2Y/mNyy/CTADaVIbRWEpqd6PdthR8ivwCC9Dmd+YsbBP/VckkM9dc5bV5R5VEnlo
	 zppsfXE5xbND+BH59wJClZOIzZqHWdCohgKQckaCJTfsrS4jIEwAtOX6QG8JeKCaQVwOB
	 z+bhdT4qgo4rXBHEjsN/bMwGlTfdSAjmn1B/bxukg04ka/lfGpB5MmGAYXspOyRAB8Ur0
	 KlI1CqW4N5UMkmNMC97yyWj9ieS2Y4KG0aeirrislWUkaDkcKO41/K1t0rr134tQs0hIo
	 Agr4kO4wJFjzN3eoTXuxjqs1szLgDBP0fq/pfvd99EgmHl/ZHFyz95XzQoWDA9/F1qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yvstzu/p";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjqJq5lf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD748606A329
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD748606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yvstzu/p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SjqJq5lf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG30Il3228368
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q/+cvFopqQv
	28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=; b=Yvstzu/pqS6uvyJ8PgFi+yd3AqI
	oHEjJwvjti+d+C/OTu9fcHwsIOxBK0U2viS0KmJL0xaXFhovRwCU2w0mTi/J5dN1
	O6sNIDsQAjB2ZX/FxqErUVFgBS2Kr/n7Y4mdzS50Gtk+4iC+hZ+DWXIjX0kGRMKk
	QONX7Mw7yI1vOu7b/QyMRgk5EAnIGI6JPhaYSZJIBvBjLasmLa+XZFKz8j3q81b2
	TgkSvgCwqL3wMT8oS5W2J36CDeYM34nTmPRKJebcdY+RZaMweLLQjhhNfuBVsBFl
	17HxkNFF/+e1qn+rnHu29CUdP1aCX9nsK5uG1h8BMT/dCFD4F/MifQsiKQQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgart09hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91bc57d4d11so28284416d6.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775883; x=1793380683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
        b=SjqJq5lfTS/Srt505f3ZfyPSqDR7WSW77k2dFjdOup4Vv2ghDfXcSK6eEUjelIEXVL
         urEVd86oJGxqj8TG0fBiAPr4C4JturZ/+wxoul8YEVR5f5VWswFTfLRIELYGVfoGapHs
         FYOesTEprzyl+SVcO1DAnOfpIhrCx4xWjCujfAZPRI+2U+PzHpXKFEV2uQPUIO1+bTkX
         k2izfHjBM8W4lpGxhDfQrhN/Z+FSHz4GjBy/fh3EM7k5r4E++jCR1Qtq3/kg2M1ZzU4O
         GuXObV/L/N4tVsGvtCX42LZRFWMA+CBLmva4cmahJCh86WUhDGb0JoHH1is8XwiPUyXk
         oyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775883; x=1793380683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/+cvFopqQv28D3/PiFB85LG7/G2XyD0ZehhDNJMlX8=;
        b=IQppoBTlD9DQNuNrrAju939z1kgOWvxj9uO/jsvzs/s9XyQ1ysiYv5LFSfBgC+rc/R
         6jFv9xwxrKUlNMH3i+FIfMG3KiQIyqbzmwjL02xFSoyalmHl2LmTwAyDnpBpxLqT4316
         G4eeNENZg9JrlZ8j2rJPEh3pHHvMVjacuTCbQ+7PeG1YvXrK4QT3YwZVOoUyass0N+qp
         MOYWh72YfO9HnkXFKJORLQWthK/3xmseD9yqSyFA3QSc5vDBhcl6wAsWnD+8Em6ZSWJh
         d7zdrdtcPYlg7ovjy5I7658j37EEoDCKrJ/VqZ7BU2PrI/3keI3BFgNib1yYdAzPYPQJ
         YWzg==
X-Forwarded-Encrypted: i=1; AKwUvBybiibuO2zEXh43YJIm3S12+akxVl74nCSQJqrB0jUHsI4LvmXWwjVeERXjJPtTWAfRGi89NqBWEdU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkhQLVBXQwtxhmJIf0Tjin2fJvzs2DSr4TZvahqPK8EaZy9zUv
	w/iXp9iDW4NlCA1wiQqzD3MR4sFqI9oMOiDb9fMwUD6H4RhMkrjfd0arOuGBNNGj7e0vkNH4hd8
	eYkBsRk/KUSSforXRyJ03oZcQYBvkJICfWjjKoiRxyaFe8hByx2O82U+Dc4mo+nA=
X-Gm-Gg: AYBFou2oCCdhdOD64F9eUkjbRRDgrBw6mlKv6rk3C4u0LS+8u7ud5ykWnj/6C5Bb6n5
	Rps5VDNLEysSOvdLJOhWRPUiOUozmvbdeBml3djcb0zwuZofbNvp1kfQHZCqo0rlLstZMYJWOnH
	OIh3lfvqfkz5VcNfo3osquG8nh//Ye5Clk2kkDlUCzasrHwpdSVKKD7mCNDg3+nSVvjmzK6VnJh
	0k5yXPa1KysTvNPURHs+5fkosC5KvdKU0xIQ8XW4FMWqJVE3ugfvwccBgiUfEL+q7fzNBLFw2r3
	yN+ptnMaP68IIGhowlUJG5rgP+wnCc57SDawp1aqASZwgte10eT+Uc3VRN0BX4GSCUJ+by0DMjv
	BtR0z24TV71BD
X-Received: by 2002:a05:620a:4725:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f6f7dc78emr554390185a.23.1792775883174;
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93c:c1e8:6504 with SMTP id af79cd13be357-93f6f7dc78emr554386285a.23.1792775882595;
        Fri, 23 Oct 2026 10:18:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 09/23] ASoC: qcom: q6apm-dai: add S32_LE format support
Date: Fri, 23 Oct 2026 18:14:19 +0100
Message-ID: <20261023171433.820092-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX2TjKgLXy5u7C
 87wnjHHoLj/AnNWjdqilA6ctrgKQZfJvh0+aRFSKEVkp17/9++phqb76ecJiz/Ets8XWqdvjEgt
 wqaERXWlKHXfMO3aoncpwm3ZkLw+J0vDIGtcUJcIwEq9BynnXF6+RzH7MjsREFLvDvC24P9ZzU3
 rvy09Fs4Lh69k8ezr1Y7j9TquEp4QNJr9epQU66/mJQK5Wd60rgkaLhQHRXms0x2R0NodUcHnTl
 bx+EbkdTz86e5ZjEBghJcBV7Wh0DM+DbaDR6YBTW5wu4dNAxRfaVuc00YAupbKQ2tdPKMUgdfGC
 qbm7ws8f+ZIp4C+nlZJTn353d/eqUJW9VNoWsaE8YSHpF7OtsvE1TzW7jKDMER7Nd02gYyhe8gi
 p8PFXq0xR+ZB2VGrKgJ13e7SvdAo8Yak4AaAQAdq4YiMzUU2iejyrFy4gDG18Ks8ve1FLLfxXga
 Hcakg9QJCxBAsY7w+NQ==
X-Authority-Analysis: v=2.4 cv=JI+uIMKb c=1 sm=1 tr=0 ts=6adb96cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0GeEMZVGUYcv1euD6hYA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4nmBhPVjGsk6
 VumAMQfULcsTLc7kDrfhaOec0PE0QqCORHvn5LFhV01NYN1dNFkHzj36FBKiwEInclRbUKB3hzF
 Ehcl0crPN/rQKlb4iqMO4RraIfuwG6A=
X-Proofpoint-ORIG-GUID: 7wrWUuu_rmGK783RHHyGmVatZwnOdM_z
X-Proofpoint-GUID: 7wrWUuu_rmGK783RHHyGmVatZwnOdM_z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The speaker protection VI capture carries one 32-bit V/I word per
speaker. Add S32_LE to the q6apm-dai formats so it is not converted.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 58beaf906b9f..9002acf0e0cd 100644
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
@@ -641,6 +643,9 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
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
2.47.3

