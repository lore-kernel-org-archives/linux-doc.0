Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775936;
	b=AtLnnBEPqSJX9zZtcx39iXjYhkgJ48f5BbNiyLbmSCEcmkZbJpFn+XGr/N4h9njubZ/P
	 ny0MguTnc2Td1icAXHOwvpgu3Ff//j6c0vREfJBxXGEAuI8OiCUDz4fv0pU+VHgNNoSNT
	 iTgerP1sFTZM8UMGDmBvcHpKBqrNptFzv3/gl+Y78F53G8m1yMcpjnXDDT+LYmiN5ytiz
	 KqFAPzTHX2N4lJ2EikAqpnB79CRCQmi5NoeuDlfxP6DPwL5zcW55F2VTYOGb5mM0w+zSO
	 qJoPAp2X+nMzlF4zRI6hFtYBJDpYYi5TIBbFKP9QXCfuJcBYUHdoTZbKBhuIovfiCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
	b=J5W+3xzV7vMa35sQExqJRk3jrtwW31yzdaDxVIDNkub/gfRBvgbyLCAQniWpde8xMUP0
	 UbfMZlqqmBx7NmqRjDTWfxg7mvB3u45a5byIez7RBoMQEmwN9YLpFLo7oeWx/xNGL9inH
	 /MULgSMG3kopL8EbYp4KXQJPE2lPgYTQo5RC0dmig3PIKfWAMo9nEZGwa1K6j4kItAaOa
	 PEBqsO9mmstP/UNwaGAgI/xlSNLgVGQJgrJoX67dYoMllVvo243NvNNJNco51ebVI9eN9
	 UVOBjw22lIldAQ8FzzPVVtdfodmv2Px/sAjR+9le0HhH8GF/Tec0YqzWxF7eqExkMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h/lk/pa1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Os+QxeHp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6741606A325
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6741606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h/lk/pa1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Os+QxeHp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG6Eqo2215922
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J7MeUmGzDc3
	1SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=; b=h/lk/pa10xaS0W9NPAlVXuIeZy4
	nsospPMSTOXpvfI3Jws8BB8UyU7LWi03hBshcp6IGyida/0d+NaErNFwDga4ZaoI
	mzRR6EC8hGj1TMTCnBuQ0q36x8PqNH8v4KLhQsiHVcK8dDIs1CYNNtB+mlFetMNA
	X+NkLlH1DLqn7VaJ3jhogzi8m6vS2KUwoyBz9LQIOJtdt/zGQ5UmRfVzy0LAQn4T
	4O+WRUqBgUvfLgYWdM6OHSrU8maY1gLgaYNoKECXdMnMIhG4ovPCZiqX4UxqZPE5
	9BlLqSUmo5k10ToscXZiOwOgbe338CNpTysrtbZGC2v2I5vubGFiNMj79UQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc8987-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dd3c3badbso281707285a.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775934; x=1793380734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
        b=Os+QxeHpIYDnihnoDpbF/I01JAnl61SiEu1ebzneB7aw/4inRMMcVD22P2ikWe51QX
         DgvUot4FX3bwdUNEv7KSle2LSwQSDDT3ezKHRxD6wBPXrcHiVNPxvWm8xFfFk6hD5KBp
         rJPA5WOme5umjqwtnmCkTpro5Rry///HZ6xEvMRc/ZiR1aKFPKiXCL0BkEqYeAvbpB6Y
         yFtY63KBf/UzxyBagzduh12V2l0UmzHlEzdHi0hEqn3RqRISwL1y1dPLfPieE1dB8b75
         Guec8Iav4699RzEo54YML9N0EzcjSs41GOsXKBC+x9z6yqqQgtg5WUtsAHC5VAy0bdzw
         8r2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775934; x=1793380734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7MeUmGzDc31SgdSuHsk12T5/Bjqex2jk8PVtUzDBw8=;
        b=xyCc93mjp/7wzqWFU2fukSxZqOFTIWo0td1GAwomhyQej2iGt/WpnTf3gOap2sDX8g
         nBkJ5HThA8490SxM9GZvNCtma1F2jdci/38nQwHTaXjmXR4uPasV4RJR4H6xYqu+phOc
         8NZnbcOkNyoqGKF9dF4aCil74n0jrze4B9twdd1WKzEuJO/00IzIiHMV84K45+C1m0Ng
         slf5ufrT5zJqpnX+7zSkX+h7oS/Uz7AmruFCNLGI2zQuLAO+epW2zTJ8HLwVoGqIQ+sp
         h37isvvhm5NEFd6kgLg77mg6a/43I/WdF8Pl1zvqN99t+z4NkDj9NuzoWDqVgtn3H8/E
         De8A==
X-Forwarded-Encrypted: i=1; AKwUvBzDMuXr27Haqp7pHMsMzYn6Sx6//ojKTWVXdY3CRc8fiCkNKABk66F9fd5YpJiYZdqRSI+CBhwb7Ko=@vger.kernel.org
X-Gm-Message-State: AFq9FYLasNwJz2DU2xjzf+SxwyUqtm/Tdmk522jR2ntp0vmhniSJuHqJ
	R4zDhCqHRFrQQ7GGeyiTSoHBfr996h9OxVfuQLL+DhvnUdrE8tMQYXO9rngn6O6mUfoMisvZJaT
	MSd4CyZ4uvWwqUdk5jqt+dez7t1oFtSMrf7nLPzJEyyXcTcNQQaWuaX3qAxJOZ4E=
X-Gm-Gg: AYBFou2z/AjpWtyVwE4zfrC6vj8lR3uIWBWoSUq/zFVAl8kHLx/W2bjsLoF9SY5V9Qi
	WZ+a2tzm7sy/Lle61TafprxBBhc21sSwRPYd1LaALzNw26DY2/bWjG8X+X0h30ynn3nsRmCBSvH
	sT10i+hFHnsptaOw5oTSFGeO4DQB48fFfa8IcqzCdREFINSfRDvcvu56wJvGKD7hRtd9gl+d1Gm
	MfJjayq1msa1QfAKtKTsSLYQv4gjJ4xcpZ2kPb39VpSUZg5t1UJFU7HHnATgTC+lbGBlKeTlmsk
	zb9S9iVTU53mRtum3S+cdiYL3bSrGLqLM0kKWWfoSdsiwUEQ/8Q1BO5rDtE2HRZYRlLlEdM/0lD
	QZ4s0VXaUZDXD
X-Received: by 2002:a05:620a:1a28:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93f6f7caf5emr537985885a.41.1792775934081;
        Fri, 23 Oct 2026 10:18:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:93e:96e0:25a5 with SMTP id af79cd13be357-93f6f7caf5emr537781485a.41.1792775904509;
        Fri, 23 Oct 2026 10:18:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:23 -0700 (PDT)
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
Subject: [RFC PATCH 21/23] ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker protection
Date: Fri, 23 Oct 2026 18:14:31 +0100
Message-ID: <20261023171433.820092-22-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1zalnqQ3dvwy
 6FxLLKzx3Ca7JdMP47/4PKuGJSVaSmmN2DkNxekUAqYcoJeb0s4z1lVlU09GhXjJ/7Kk1Svc7aP
 TxQ+xcnQpa7QToird0/zWoOfsovUY8KlNhx2FNlb+Ue7pdXzqZ96ykh7pMA6/wia4OR7t1lgQxl
 SNK/v6kmwLVvlsGGezTavId1KTundE0VVZ3TE6dU7MGJe2bzHUIQH6VGT9DzOF20qIgvIlY9but
 WrqAEL8MwpXEvLcjkrQqKzoC5IVr/PGmQWMdjmpNbrYPng6NunN9rh0u/3gAzcLEk4ZZRtX3nah
 QFg31bKfUdsiBh1PK6F5ywfRANUHZpr8yGJG8rpcMOeqPb1MU0HRM+O1tTOrl6EpF5txQHr9Lcz
 PlrmHQ2gq5uAvPSV6Rp9WIWJwzWQNGZeYWQIsWxEmhpHW45eIJviKoO+GdMEEoEuuM/s0MerVYG
 GbDtOzJSMb37y2xsxLg==
X-Proofpoint-GUID: DvWzyqXJ2VovkTZtZRLfXvWvhtI69dW_
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adb96fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=CEpVYLg39VmosHVYFFMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: DvWzyqXJ2VovkTZtZRLfXvWvhtI69dW_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX3v/WruzN2JYM
 HlamHX+jS8IMc00z9p35Dr/F0X6G7ShLjzYe+0rmivcVPkRK5tD1xQHLR4W0Wf+diYTmlwY615e
 gGh5P9gszQxenwTeQaXAufZ3TcOPcoM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Look up the thermal zone of each WSA884x VI DAI on the WSA Playback
link, in DT order, and register them with
audioreach_sp_register_speaker_map() for the "Speaker Protection T0"
control. A missing zone is logged and leaves its slot reading 0. The
map is cleared when the link is torn down.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/x1e80100.c | 54 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 23a28c60bfb7..8cf7dad37c7f 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -5,6 +5,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/thermal.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
@@ -12,6 +13,7 @@
 #include <sound/soc-dapm.h>
 
 #include "common.h"
+#include "qdsp6/audioreach.h"
 #include "qdsp6/q6afe.h"
 #include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
@@ -24,6 +26,55 @@ struct x1e80100_snd_data {
 	bool jack_setup;
 };
 
+/*
+ * Register the thermal zones of the link's wsa884x VI DAIs, in DT order,
+ * which is the VI channel order.
+ */
+static void x1e80100_register_sp_speakers(struct snd_soc_pcm_runtime *rtd)
+{
+	struct thermal_zone_device *tzs[MAX_SP_VI_SPEAKERS];
+	struct snd_soc_dai *codec_dai;
+	unsigned int num = 0;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		struct snd_soc_component *component = codec_dai->component;
+		struct thermal_zone_device *tz;
+		struct sdw_slave *slave;
+		char tz_name[THERMAL_NAME_LENGTH];
+
+		if (strcmp(codec_dai->name, "VI"))
+			continue;
+		if (!component || !component->dev)
+			continue;
+		if (num >= ARRAY_SIZE(tzs))
+			break;
+
+		/* The name wsa884x registers its thermal zone under */
+		slave = dev_to_sdw_dev(component->dev);
+		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
+			  slave->bus->id, slave->id.unique_id);
+		tz = thermal_zone_get_zone_by_name(tz_name);
+		if (IS_ERR(tz)) {
+			dev_warn(rtd->dev,
+				 "no thermal zone '%s' for %s (%ld); SP T0 kcontrol will read 0 for this slot\n",
+				 tz_name, dev_name(component->dev),
+				 PTR_ERR(tz));
+			tz = NULL;
+		}
+		tzs[num++] = tz;
+	}
+
+	/* Also drops the zones of a previous bind when none are found */
+	audioreach_sp_register_speaker_map(tzs, num);
+}
+
+static void x1e80100_snd_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	if (snd_soc_rtd_to_cpu(rtd, 0)->id == WSA_CODEC_DMA_RX_0)
+		audioreach_sp_register_speaker_map(NULL, 0);
+}
+
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -34,6 +85,8 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
+		x1e80100_register_sp_speakers(rtd);
+		fallthrough;
 	case WSA_CODEC_DMA_RX_1:
 		/*
 		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
@@ -192,6 +245,7 @@ static void x1e80100_add_be_ops(struct snd_soc_card *card)
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
 			link->init = x1e80100_snd_init;
+			link->exit = x1e80100_snd_exit;
 			link->be_hw_params_fixup = x1e80100_be_hw_params_fixup;
 			link->ops = &x1e80100_be_ops;
 		}
-- 
2.47.3

