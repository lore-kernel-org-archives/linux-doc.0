Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775905;
	b=QmjSAZQaquy2ajjChIAWzSMjTk7EbWcoDawD0ijlA7UzeOqKKZblkbyADmLtSqTxBnKR
	 MhEmidI2wZTumcyeaHt3465LDbFI5mhyEmHAkAnF5/42NakR7ArDCg39ohbGtHTYzKOMS
	 QDxqku5qtrRxXYyfBBZAM3JxMATJzj8e9kGSAIMsKXKLRyrDjmYNA7mL+p4yUS4CeZjNC
	 R8sWyb+Qbvll4G0aqM34dR5ODDb97xP3NZkKDPmTGkSv3JL/E/CLYbRe2sniJpsGClsUG
	 IJ1/Aq5sNdjseAKpSmPjYMe+wXIY4gaAdje+wWYd9Z9cT3syswFHi4+c8XoaASe0dBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
	b=h7wvO3Jeu4ZlLNoa3GTzd+dyQeLia/mQXlf1hK/ZnHM5fUxgngHiEJBTi/90BQb1GARU
	 RFrtQORDpOFR6BmMCz/k75FvDWEFMjU3T33OKHqk8YoD4tidG78cvn34Hq/x5N3cFTbue
	 VMb5lr2KBdwQKceJO0YW8nalsZHLj4140fTb8zJObpTX8zCVf2G9hAelEJROFTznubm2I
	 +W3ArIWzO/Ux/LV+CHAelwpIWJSeyaeNiPH963ysuAePzOZi67xa9T8QOv64dTaH7pSjO
	 +GKF3TwVOCkz5TE0Yr1lvATiFyF1K6tfHUMPet10i9qnB+qcFAuoX5gH3E/HY/8jvMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLEwDo0Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgVMQG5d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F80606DC55
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F80606DC55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eLEwDo0Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GgVMQG5d
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE69492999826
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2AxabcwP1wd
	LQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=; b=eLEwDo0Y9THbq+Cv2a8kMWTVYFZ
	ffKuUL0fxL/g4CesQIjb6FWgd8miI8Te0TYsTJAufQ75f5lxf8FB7wF2U4/XpGH5
	LIoOFKaJRz1E26vatvfUB37GUpftBICkEywphBNIjf611Z/noua54FbxeBo8hgUf
	jJpyPyqJtmv5LkfjxdMheuLowvdK0OL65eJPY81D6eJxynwxG+rQMAZw5fWHXZap
	1R0aTO/5JqGRs+lRtZtWMEpiFeCNymOjIKvTZB1N/zaipbqJRN9Q7KOol+uzUPWy
	7Tu4sRKR81Ax8k/Ii7itQavDXhZARedmb72llQE+zzGFK41OR9svCnyjqpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so119876685a.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775903; x=1793380703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
        b=GgVMQG5dcObUSFXg5F8eY4fTgFCJrOqqhSSEPvhlIOopBrY8eZk2bWM+drxhpm5jSs
         wCQPWNW/DtTizX7YelbutBIzGEpbLDSpYfieUgFwkk3j4EdctdStLdB2qnILzqXnS9rS
         r9HlXun0YUL893imMWUyiAoD27NRiUhAYF+yU1gmTe5GVTnFyCESU6YKKB6JVEPt3SFv
         noTjc9GlNg0EVd/6bVZupVkLf0g6N1gFNSlcmhOgd50iGqs7wqFkIHWrRMJBwyI5Hbk9
         A5ay1crxCi4vXBHAhiFrFdF+7RC2JBEYWQ77WTj655RO0mmo1XG76/rurosVrgdKkFXt
         ncZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775903; x=1793380703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AxabcwP1wdLQylwZLJfYrMIN7TXVc6ukYLWP49lQy4=;
        b=di79HuYnfK7x1WDPQictq0yXULDvXwHrH3uKWmvmtoVYb4be9RM0QfpJu+gPjgfteB
         B0EoQCAw+RJ6OyHwn6jQG6H34QG9EkU4gZbw2bAu0DAfRPGOT3Jk2OuFEJnLC8carlYm
         YWcEAScfNxxT/Jbkmbs2iuB+8B+cGp8I5sgYnOFHZDgPISwmRFCBHFy4EdPmfP0rE8Uj
         3scvncF2dcEaAfF3p/JEh7iURBmb7JeUod8OHJW51Plqr1ud+ROPfFQsc8S6np0rc3If
         ssNOBHsadfNMHT5Trwi4qCl/EM4VUyXkqKMalHoKEIWhFzlIY/znuQ/3GnqcpKoszHYh
         lAKg==
X-Forwarded-Encrypted: i=1; AKwUvBx1VEQ+8W0odGvYVafB8FwHUUC9Sbox+b6xcNgIJYL4DJwY0j3OYEBWto0D920l7IuhmNYHNe8UZ18=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3iSS+xuKJ1utVhDXbZ0klPOeLKUITGgKgQa3ulPptbWWZRFa7
	iFD2WfKlHkpYe5d+2+a+qT+5EgdW1Jk0NjWm+BL9kaFs7CKbjjlEcmLDxxb2dSoSwugfq6/0VRa
	OxZTXsqiIQEGojviT5gSl6l2kWYSkmvwxExfBm2N/NWc/q5p+n8xqC+fHWBiskAw=
X-Gm-Gg: AYBFou0EgJkt2TG2qTIQm5GtS8jf3MVxKi/MJShLDj8/hunrhgaNbfKiiTpXBCxZT1E
	LoCty9Igc2kT70p2YuOOEyRtk35fPKApB7trysENX/uTcjlY3t2kunfHMQpTlZ1naY2xNzPg0WQ
	70EkEfou25h/b2y8kCuKNsYTuY+ZFHnWQEMI+pHHhYVcTVw7jOEPxBXY4SAAy4VDos6yVsfjLr3
	VCM0uz/BKfPG0Z+YsL39LZsVRNjZdDAH4tKy7+C93Pi8lftCkJ+Jf8J06Wex9cPCBazpiG051IL
	aM3I4Y+S+yfvnhrXYw10VbYLsRb6EgPoVnEbPpQILQMXJeUpDFjvOUx16dLU8TqrFJl3m3vBNsP
	Of4Uxn3yqcRXv
X-Received: by 2002:a05:620a:4042:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93f6f94f9bemr520783185a.34.1792775903409;
        Fri, 23 Oct 2026 10:18:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93f6f94f9bemr520777785a.34.1792775902790;
        Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:22 -0700 (PDT)
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
Subject: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE link
Date: Fri, 23 Oct 2026 18:14:30 +0100
Message-ID: <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXwhAqvHcm5I+i
 AqACtX0n8lpGwkYJdHqDcP8I0WD7CZ1SzQt7+25Uc3WqLEH7TzjhUacf1WeUy6T4cB5VkWb27cp
 Ig3rQ9jKicAB1tLmMv83sHDlYslf1TA3O7xskzHesLJgN/MeWsP7KM76xWPSlC5fFcwkD8Xzydp
 +Ug7NU7XoPdd8X5zTfAgZv4JJ14+4dP9AZFWe3RjD18aQdJmzUwZIbc6EO49yd/KqMnGO3zob5s
 lCbRenp2DeyGAp5T6J/m+LgLAoUtx3dxegBVqj8dhZEWD9bf+vyL42+xzvMc2Epf1SCeFicWV/Z
 bm5Rlo9PaDxc5IAm43VX0rNAEHp0x7yKfyNxMGhlouWCWcRvZZ2txrEgr97VYv2JuPEcgE+UNb2
 7gT7jhQHgFSFi/yvIp8qNLEGYEnSyWK3oX2oLp+YWucJyZCZcsgiBU7WSiMg0Z7jxUHgO/Rq/He
 sAb9oMtJ0iueZaeoWUA==
X-Proofpoint-GUID: YKM_M4NHI9Q1Y4NciE1CwqbHoJiCUYLo
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UI3T6_Nygtay_5UDmqkA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: YKM_M4NHI9Q1Y4NciE1CwqbHoJiCUYLo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/uyE8HodwWQn
 R5NjPSrhLSf/I2XVgGNxTqouHODYemFAMuN5fZCUapSCHU2VXV/NOkf0xWO73dVw0CpE5DxydOi
 T7U5atqsGPzO2uyg2dnfzuYSvsAC5gg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Speaker protection needs the WSA V/I sense capture running whenever the
speakers play.

Set multi_direction_codecs on the WSA Playback link so it can carry the
VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
core's capture stream events for such links power the VI widgets.
Nothing changes until the DT adds the VI DAIs to the link.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c81df41ace88..23a28c60bfb7 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -6,6 +6,7 @@
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -68,6 +69,25 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
+static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					struct snd_pcm_hw_params *params,
+					int stream)
+{
+	struct snd_interval *rate =
+		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_mask *fmt =
+		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	if (stream != SNDRV_PCM_STREAM_CAPTURE)
+		return 0;
+
+	rate->min = rate->max = 8000;
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+	return 0;
+}
+
 static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -175,6 +195,13 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
+
+		/* The WSA playback link also carries the VI codec DAIs */
+		if (link->id == WSA_CODEC_DMA_RX_0) {
+			link->multi_direction_codecs = 1;
+			link->multi_direction_params_fixup =
+				x1e80100_wsa_vi_params_fixup;
+		}
 	}
 }
 
-- 
2.47.3

