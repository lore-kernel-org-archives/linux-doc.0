Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364098;
	b=lEF58k2VpltvflYYrZmncmkHrPOhj2iF468MTDRRnh12+0aU0IJ78wtffkyyq8hfjyW9
	 wh+0gFpeYNsVNMChHpH6Ue7G/jiUcIFopmk+HLNKuITTv7FbWVkHe6oUuLt8npJ7dCnwC
	 69phTRzzhptGdOx3Mnm/LZu3dyDuFgEz8tbZFdzeDPejAU8Lnlkf5A2IXOtxHsyLuWwzc
	 Sw3zEmoTavSwEyUvYj2GFjbwiVyZRGepFIazDQonNnnQbtjn1qmw8npryctyGieRmxS1n
	 +d2HbTjEaUjrIiMZSC5Jr5tbNodMKxloBQjykaUFf7Y4u2ib6I8uAhMYFiPPD/KCHBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
	b=w/9q+l2Pqlp2pAL7dr+F+sIsOxSBVZtHzP+CyOHnPPcXV/wBQM7V3GpE20cuPBEFNKLz
	 agZbMXbnASc5kRbtqt+kmF+TjCmI95nVu3tEX0GsiHcZRauQ/O+q6MQWZ3BSgRNfjqmue
	 w1pw3aLnmbdl/ioO6HknAvwVL6xNsNiGVgkLHmr2QeSyKuCv9uImzcXTcj7ufzDQtQ1WD
	 6mcA5im3nuHtFJiDTSWxgYwKiHPItsjh7In55rc8qOHhWWoQfX2/sC5mtbVcJWDPTkNiH
	 mo7GXWGHDZ3HdwAJxKdSvCVc7DoSuGclKAFrMhtdPB0CBdT7Z4llDADy/VinF96Qaug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD170606A6B0
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD170606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQIvq3852905
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CK8GS13yu76
	IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=; b=iIQMXipOBXcfer219SBFft7VYCe
	+Id8znt7MekKPgySSZ14jJyWkBiB+MSVe3x2b4PRdilfmK0+IgS5NjQeW5WLHWM4
	pw94meLN0i77Ge0G5sD65LM/+PRC5zlPDZjQYpV/ymU8oCEdxkVPvSQ2JTZEZmNe
	6Qih8c4tpER5SUKDFs/Y6aL3PuRxPhhwuto9xMoKSfL4YtHZxTV2mG7r39/bUYQg
	cGsUXumqzR0vZrmPBgOfV/cKQP1Tgv0tofMnc7Fh0yX5TTSSgPtS9OJ8JT/A7GjM
	wNhcJSaiR9xZRL8aeB7DasFiPaZ2uyFgn5PkR0ztVroZzK3so6aN3+Hs/Sw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3qyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9211d51dcefso54541676d6.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364096; x=1795968896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=JRppqu18YH5PHHQEo+s0GZY99av/5p/zbgiMImgU1LvV2oR+Hqa5+9j4f/37ohGgwf
         4O0WchXPoebdpQBX+6wUBkl191k6O/Jwfp7RvYIk3e7u2fVqaTf94NKru8vrGm0ieawx
         Rz82+Nt4QedWm2GET/zWwZvkfLIxDDRAGQ9WOZyw9jHsz3LzL9EQ2Vmu+8g4YRsE+Dfa
         c+j2hRfuBbkJGQC+rBnpKpUy8DWplEg3bEbkg+AEJdCUIt3N7GL0TW3M7+mlbvBKbN4h
         FHBzC0ciL47GU9IgtXTfygXxkD6gl528ImhZbOvg0nhRIUsvOERzGtbDeLSV54DxFN/K
         bs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364096; x=1795968896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=TLGOnWI6xhT4HXEo1CzI3CXOI5EpIYAGR2hnQNIid3z2KcAids86eSBCQdcp974eMK
         IPNJsMY3d/9jF+C9rcPEluT41UestK9ev6DzbgvwwuEtPb3rp2mhKWAPeCv7F2WgS+NC
         DD0l7pk+SpT1nTJ77QHDz0g/McsjHxMUW1YDgJWWpiD0iKyvw0Vkdr60sC3PEhEWxKoo
         a6f4dwRIial2aUZvH8+8FKYIvEEO0DU6OYhW3rOLD4EblsqmOqAiwuAAgBvADsSGf8DJ
         kRWaXXcP75TpKBFdv1aHSn2bYVQcLHBBTESePEPWWJxJ1Cvz3SUVid1luFHEsUmo6rw9
         XMVw==
X-Forwarded-Encrypted: i=1; AL+hErEF5nLrKq2CuYFkcFBGcUNNjSyBDQ5zqucfwMAYw32S/R26CCG3P+r7obowRFBn+zFg+vuA4pvONK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xIHDs+N4pd9iBN1J2KPNCXFehX+ewJEK3FXcJOUMYyVZ4noyS
	oZ66fd05HdtB8ywcaw/KzKKxXrev38Mn2dmFLouH1tlakXZ8ONlQm+hoLMIeq6PNXYlHJHGZOMk
	SKLIXZIbovo0UQqF/kqOhYqBK5PMuZr7mYxyEnuMdLuCbVMhgV+J6pHH5EiDRlBg=
X-Gm-Gg: AZFdTZcXsrEyLSXj/5UGOF+dcUQ/p93xgIX08337WejoQPBCzsUTr1PZjHFdp8Iucrb
	Bxj2/nIRQbzE5UZICN0Vz/Fx+Z1ZiN8zwn10MXB3m3bUqf/FJYGqlRudirG2gNNVpRQnYGuxON7
	oVSKa6nL+Q4VVjBr909SjC77awrT3eD/Mf2yoazmUISTHsUhmXbQUT3CbuiZIWL7sdeD34LpvUW
	twUBemFNFMnHAQr5zEKKJx7EmHEMjMgWcbi/TOsgliKIuOMgPr5gM/op3Fas3fPPglYUcht4pL5
	NO2N234fuB61kJmTV+bsPRpHINokdaLSy7Kq7+k1jtFayx7dAQKw86NcXZ+ublo1XUyM6s/gKmY
	t02QIGi1ceDuLDHNnbxvqcw3P4PjN83+L++yw/+ADbXkgzDO9zS8+pEMmTDm2dDAT
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738823985a.72.1795364095841;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738820485a.72.1795364095325;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 04/24] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Sun, 22 Nov 2026 16:14:17 +0000
Message-ID: <20261122161437.5994-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: xHXcCsLObcCRBBcKtROp3kcsXN5ev4Fi
X-Proofpoint-ORIG-GUID: xHXcCsLObcCRBBcKtROp3kcsXN5ev4Fi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX68TM4aOfoyX5
 DFelBHom0E/gE2yxre6vd09xbCUW0gLw368UueReuO0VAKDYWTCX/O1ck4FlQp76FXDiiBLEFrL
 7jPRwkqMSFs0g8g5ohXuBLRoQM4NArklbqjLNo76xxSR5+S1AEzQtnR2vumlt9N592xnt64IMwx
 GBS9ScaUtHvSlkKJYXc2ME1lkTXxvCgrM+/B6gCsSGtYcR1eQ4fZ9yRnQs2DA0pi07dZ3UaeSVW
 /Ad/WQ8mpyIKJFsE88RC9ng4cSS4UXsFlllxbrHAjihcG6JNhp8JEsmmdplOOdDcms/kka83k6C
 0xK8eepdyNiKY33dNPxGj2Mi1PY5yebLqrVqgG87GXiz8TlfkIQVY3SHs2SMLRkj3Xphau2yFu1
 tIOSetZFC+rSjGJHtLvpsMTs8wuhR4qcinqveHtwUkjquCBn+qAiq0x6uKy0gXVWAN46cutIA8/
 z70ODTYIzyyvupqq8bw==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b031500 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NbmS5_GTq9OgXFR-vLoA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXzVGg86wUHDNv
 mFMrkNs2H8ICjz8qr1ocCQY5h8pRvuPeJ39PrscH+Bj1HW8HVuhElExFj7PHFwBiFRrhFbA+7jL
 wH3V5RO3VCp+11MjQ8GjcUvCNhWrekM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links. Stream runtime names
are suffixed with "-Playback" / "-Capture" to keep debug output
unambiguous. A small sdw_find_dir_stream() helper centralises the
"find the stream for this direction" lookup that was previously
open-coded in each callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 225 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 171 insertions(+), 54 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..953a6eaae127 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -5,9 +5,55 @@
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <sound/soc.h>
 #include "sdw.h"
 
+static struct sdw_stream_runtime *
+qcom_snd_sdw_alloc_stream(const char *cpu_name, int dir)
+{
+	const char *suffix = (dir == SNDRV_PCM_STREAM_PLAYBACK) ?
+			     "Playback" : "Capture";
+	struct sdw_stream_runtime *sr;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s-%s", cpu_name, suffix);
+	if (!name)
+		return NULL;
+
+	sr = sdw_alloc_stream(name, SDW_STREAM_PCM);
+	if (!sr) {
+		kfree(name);
+		return NULL;
+	}
+	return sr;
+}
+
+static void qcom_snd_sdw_release_stream(struct sdw_stream_runtime *sr)
+{
+	if (!sr)
+		return;
+	kfree(sr->name);
+	sdw_release_stream(sr);
+}
+
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +95,42 @@ static bool qcom_snd_is_sdw_dai(int id)
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
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd, int dir)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
+	const char *cpu_name = snd_soc_rtd_to_cpu(rtd, 0)->name;
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (snd_soc_dai_stream_valid(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = qcom_snd_sdw_alloc_stream(cpu_name, dir);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
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
 
@@ -93,59 +138,106 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
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
+				if (!snd_soc_dai_stream_valid(codec_dai, dir))
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
-	sdw_release_stream(sruntime);
-
+err:
+	qcom_snd_sdw_release_stream(sruntime);
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
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			qcom_snd_sdw_release_stream(
+				sdw_find_dir_stream(rtd, substream->stream));
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
+	struct sdw_stream_runtime *sruntime;
+	int ret;
+
+	sruntime = sdw_find_dir_stream(rtd, dir);
+	if (!sruntime)
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
@@ -153,15 +245,25 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
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
+			struct sdw_stream_runtime *sr =
+				sdw_find_dir_stream(rtd, substream->stream);
+			if (sr) {
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
 
@@ -187,9 +289,13 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+
+	qcom_snd_sdw_release_stream(sdw_find_dir_stream(rtd, substream->stream));
 
-	sdw_release_stream(sruntime);
+	if (rtd->dai_link->multi_direction_codecs)
+		qcom_snd_sdw_release_stream(
+			sdw_find_dir_stream(rtd, substream->stream ^ 1));
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +303,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
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
2.53.0

