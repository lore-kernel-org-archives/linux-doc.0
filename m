Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775876;
	b=rI1I2YxlSRkF5F/iz6nxAVwgFL+rzunuAvsOwuQm9AFdzEtCSRzM59HZrC1ahOG/a/R7
	 lwJGEfJCJW3I/LxxtjN4INcAcNWjSu7+YBWoa22z7djTV8x8t57K7hNVxGn+2FbiYXEmy
	 obF9IjwVRbf3jIuUfmt0RkOpBwr1fC8VJ/xkskf50GnaQBzwKth0pmbjugnrAY8gG0//E
	 8yX+WqtWtjM3/+kF2x8SCAGadDsI8ybyrvFGNF/c28abSOluCvSuMiGpR7pk3/sVRrH0t
	 qpe1J0HBuFy6iRLm8LdxEujbU67v7PpsxlbQaX2YKPuhVRub5TGkXK7Zt5QQR4r+sOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
	b=hUmkw4rV08R9J2JTFEhFFgXoqlJpAh5TMwpiQnlp8N2MSJti/cbUkydcHE/nKG7dO2HA
	 7m9ELylmZcRueDsOVifEwn3Tg1ky0QXntQYqWH6YA2TYXb9JEV2TAQFgzsl+Dm9VaSvvp
	 vapHn3cuXSm9c4rQC44Rv/fmtn+k9g6psOBTkYjQ4SVjbIbdEGZvzVl4zQwKIaxSFnoEv
	 7Hq6sfdnfi2GgpXYH8ss0WTTorRuq53s8PmO+r1d6SY2RSsQX9bBtokBiq2uXbPUxR5dT
	 1z1V+4DuDsG7uh/8eQMXqjg+0yAZcx3neMCk9xtVFJUPPRfwT7J3l7m6yaWExzoC36w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYtFqQgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCKEpEIn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D0660A2624
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D0660A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYtFqQgI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCKEpEIn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6AHV2999836
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y96nUAhjj5t
	w9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=; b=MYtFqQgIRtsZ0dkJlz26pnr2M3N
	WkEJI+rVKFuTa9hN/JI76SlNG2Eo5cSKmLuRlMop/O+4mD8w25ClYTwrrAOzuTPM
	+2ztBDL1gcrm2PCL0zmBy525SEXZ2v1VLCSbmsYykeCgEQ7us50gSt4o4l5/aDPE
	aVZLGCjjtFHSXwpwD5479O+yz0i6wfyAzWOSUZSylccNNlsDDt7J97Kt6TsewMMo
	3QvrI5G4oxnKmxGVWqdUz/7pmmMSnLMXDT1JvXbPedcM0I+aI8W5dEj6YzY+oPlO
	0M6Ckid6xaWnCgdX2QDSD3JXTp9KUwXLyV/L/K2VhAXF8Uq11UmTm/qO8ew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn14et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so178545285a.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775874; x=1793380674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
        b=aCKEpEInDZPh4M3t+WJ/sUdbK8puztE3Aut2QY6pJDfdpEcAu6zKyB8nr6YUP0MtHw
         Jn8Z9oddus9TI07UgKy9gLqtE230uSzTRUP5TwJA4T8i1QkSkCBPh8zYmIkyfMKyDmy/
         uyR70CsUhe9uLT7v2FpUJPKnwRTYBqYAPFpXpYEkIpxXjNVF3qGUPW++5cvpuNwGXLh2
         2D19NFrnuw6Y18LJwV4iQgALxdm/pwYEiQJL3txx6oMylrLWUqX0i28YrbxI3KByxoEz
         I5awWQVcfFXAH8hpHS6jt1Xxv+04M8ZgHEttnklRl6KdtPTIVm7SCSYOs0VJH5YDRrYN
         9dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775874; x=1793380674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y96nUAhjj5tw9Gvy14OVTqOC2mEo+gm4oabR5MneKSU=;
        b=LnlBqf+PwXIbKFIEw+aQFraZ08L4ylFgr+ZL8aGxuo8TO36t2UWISUiTL/1k5ASgTC
         8cU8cl97LaGY18sNZ3+2RgJDs7dlB9Fll/NPtapcrr7qCqsgoSk+M9/C5osRHm3VSU1L
         qSwy5bxyacQQhzskuZgeKCsyePef4cxbCUKGaDX/pZ95VOcHjnz0qZkB4M1vnQgDsIE1
         tfXyKR4GadLL5KwQd4m41F096VOxVknVJZIV4hzAwLBAL+rScZOYdljTY0uNtVU2PnPL
         sZ3cI6Hnj0iSswg9ZuHLuWSLwqM15JGDDrzWszHfure48uqI9vEzpugm1ZzuqeOLpbFI
         YBHg==
X-Forwarded-Encrypted: i=1; AKwUvBzy2MspTvms2jDwZLBT1ovtRmTVkroAT6K0vNGIJALXBrZbeCJ4NmbhU0msWsx/fBksEfPMoQxZy9w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS/lBklr00sTIK+Y+4s3XXYo1XsAlFrFqnIb4+6/UVH6h94hMZ
	9FadYoGagDylAs6RJKsD+hH9fBCHvvz5EalBLzxoGfjbEurH7SrESWsQj6K3Z1hZapMtzus4rlw
	363HuKGK7kPq+T1JQgS9Y4amYhMakTqp3GD/2SX2fA1lbVJzeYC/pj/BVnhVSF2Y=
X-Gm-Gg: AYBFou292BEjv5++UOoKtvrr1BMNmIBebfnla6ZvXvfVDh+poxkYMZ38Y/q1lJZT0AB
	fcySCYRIZ1y5Ekmd/rohr+jrV5HSmKZmU6glHCzZE5KQkd9PsTEXncFm+EqzoxaNG8kSGKLnn0m
	64ANztc5OP+eONif+7izfdW52QcyB16+klyy/ZF32Ej/md2bXgxnmBE2KxaBiUOeIs5ibwaZwU4
	2vhfm50qlpyPTMAwwRMcRECkuvQQ3mTvK8UqyT+Y2OYOqHzZxwhCDpliJoi/FIa0ewKu4v7IBtO
	uL8eiidMQJkvkDov+5OA9lGaVSBmM1/Q8/kOC8WD9wupIcqOsTdI/YC+ZKe4/UzS9rlsWhajoOX
	51btQGlYnSivM
X-Received: by 2002:a05:620a:2688:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f6f54da23mr506242985a.10.1792775873612;
        Fri, 23 Oct 2026 10:17:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:939:4a44:5f99 with SMTP id af79cd13be357-93f6f54da23mr506235785a.10.1792775872870;
        Fri, 23 Oct 2026 10:17:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:51 -0700 (PDT)
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
Subject: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Fri, 23 Oct 2026 18:14:13 +0100
Message-ID: <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6Y57L0YjtAQk
 UdpDH0BrzGZSNEd2E5+fGsbjh5lPsSQTIjsILJezK50LkvPdm1C8GQ9VZ1CyqpZIPNoddzZgY1b
 yokmgm+hSkhZhOFbWrBaN9NH3jGC9aULVdGGnCLutwBjXoWGuolNZ8iL6Xr3G5MJCuNPpnG3Eto
 rQTlp/mOqrt4BLbBOctyC00SV1spvTlE/cRJ5USzywZhjKqO8iY1zzH+kEIwcfI9MOhfn0EtmTT
 8V2D2TUNAtQ/KVtYQpyhChBumsdgJsXhJtTQ7AE4Vu8kdeFHWbZrFalwFWcpm0J8N5TUH2Y4yeL
 +1y5TTOIdOO7wTJk+hdIMz7zTeZQSV8T2zahiTfnBK8QksPYfnBMB+K039t1hcdoa23xDtmP19N
 BtqRIo2SrJC3vcieeKdFuPHqm4uv5RpkGm6L43IGUu2TYsUyptuWeKVOFMRIvvBc9/iCtve9L+D
 3NP3yzoHv/f6KpFi2vw==
X-Proofpoint-GUID: XM6XqP88TLCjK70YIHpQ3LTdM9cjIQEf
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb96c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3gksVG7zvlp-C0s-nSsA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XM6XqP88TLCjK70YIHpQ3LTdM9cjIQEf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXyBUxK3DTjFru
 omYUyibdQmV66deAGcmgKQ6NddqRdqM3zLi0/jH6j5SW3Y1yLYDKN/ko78gRYAvRUS81Zsqd+zY
 06KrPkmMKm+hXgmXFDRG8QduRiqAv4U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 236 +++++++++++++++++++++++++++++++++----------
 1 file changed, 183 insertions(+), 53 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..e72424ce5cb0 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -8,6 +8,15 @@
 #include <sound/soc.h>
 #include "sdw.h"
 
+/*
+ * Inline direction check that doesn't require snd_soc_dai_stream_valid
+ * to be exported for module use.
+ */
+static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
+{
+	return snd_soc_dai_pcm_stream_get_i(dai, dir)->channels_min != 0;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +58,42 @@ static bool qcom_snd_is_sdw_dai(int id)
 	return false;
 }
 
-/**
- * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
- * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
- *
- * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
- * Soundwire stream runtime to each codec DAI.
- *
- * The shutdown() callback should call sdw_release_stream() on the same
- * sdw_stream_runtime.
- *
- * Return: 0 or errno
+/*
+ * Allocate a stream runtime for one direction and set it on the codec DAIs
+ * of that direction.
  */
-int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
+				  int dir, const char *cpu_name)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (sdw_dai_has_dir(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime, dir);
 		if (ret < 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name);
-			goto err_set_stream;
+			goto err;
 		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
 			continue;
 		}
 
@@ -93,59 +101,125 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 						  &rx_ch_cnt, rx_ch);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to get codec chan map %s\n", codec_dai->name);
-			goto err_set_stream;
-		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
-			continue;
+			goto err;
 		}
 	}
 
-	switch (cpu_dai->id) {
+	switch (snd_soc_rtd_to_cpu(rtd, 0)->id) {
 	case RX_CODEC_DMA_RX_0:
 	case TX_CODEC_DMA_TX_3:
 		if (tx_ch_cnt || rx_ch_cnt) {
 			for_each_rtd_codec_dais(rtd, j, codec_dai) {
+				if (!sdw_dai_has_dir(codec_dai, dir))
+					continue;
 				ret = snd_soc_dai_set_channel_map(codec_dai,
 								  tx_ch_cnt, tx_ch,
 								  rx_ch_cnt, rx_ch);
 				if (ret != 0 && ret != -ENOTSUPP)
-					goto err_set_stream;
+					goto err;
 			}
 		}
 	}
 
 	return 0;
-
-err_set_stream:
+err:
 	sdw_release_stream(sruntime);
-
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 bool *stream_prepared)
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (!sruntime)
-		return 0;
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream, cpu_dai->name);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1,
+					     cpu_dai->name);
+		if (ret) {
+			struct sdw_stream_runtime *sr;
+			struct snd_soc_dai *cd;
+			int i;
+
+			for_each_rtd_codec_dais(rtd, i, cd) {
+				if (!sdw_dai_has_dir(cd, substream->stream))
+					continue;
+				sr = snd_soc_dai_get_stream(cd, substream->stream);
+				if (!IS_ERR_OR_NULL(sr)) {
+					sdw_release_stream(sr);
+					break;
+				}
+			}
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
+/* Prepare+enable the SDW stream for one direction. */
+static int qcom_snd_sdw_prepare_dir(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct sdw_stream_runtime *sruntime = NULL;
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+		sruntime = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sruntime) && sruntime)
+			break;
+	}
+	if (!sruntime || IS_ERR(sruntime))
 		return 0;
 
 	ret = sdw_prepare_stream(sruntime);
 	if (ret)
 		return ret;
 
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	return 0;
+}
+
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
+	if (*stream_prepared)
+		return 0;
+
 	/**
 	 * NOTE: there is a strict hw requirement about the ordering of port
 	 * enables and actual WSA881x PA enable. PA enable should only happen
@@ -153,15 +227,34 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	 * accumulated resulting in Click/Pop Noise
 	 * PA enable/mute are handled as part of codec DAPM and digital mute.
 	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
+	ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream);
+	if (ret)
 		return ret;
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			struct sdw_stream_runtime *sr = NULL;
+			struct snd_soc_dai *cd;
+			int i;
+
+			for_each_rtd_codec_dais(rtd, i, cd) {
+				if (!sdw_dai_has_dir(cd, substream->stream))
+					continue;
+				sr = snd_soc_dai_get_stream(cd, substream->stream);
+				if (!IS_ERR(sr) && sr)
+					break;
+			}
+			if (sr && !IS_ERR(sr)) {
+				sdw_disable_stream(sr);
+				sdw_deprepare_stream(sr);
+			}
+			return ret;
+		}
 	}
-	*stream_prepared  = true;
 
-	return ret;
+	*stream_prepared = true;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
@@ -185,11 +278,37 @@ struct sdw_stream_runtime *qcom_snd_sdw_get_stream(struct snd_pcm_substream *sub
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!sdw_dai_has_dir(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sr;
 
-	sdw_release_stream(sruntime);
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr)
+		sdw_release_stream(sr);
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr)
+			sdw_release_stream(sr);
+	}
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +316,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *sr;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (sruntime && *stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
+	if (!*stream_prepared)
+		return 0;
+
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr) {
+		sdw_disable_stream(sr);
+		sdw_deprepare_stream(sr);
+	}
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr) {
+			sdw_disable_stream(sr);
+			sdw_deprepare_stream(sr);
+		}
 	}
 
+	*stream_prepared = false;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-- 
2.47.3

