Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775893;
	b=zgqYwww5goZPpF3KVc2M2jlgjpsVIEitDzoB5oKRIH4b28Y/8aizTXmcmPonZly/3S0D
	 1bbM8U7IeGx8+Eb1uQxFkMzW8YEepCCuVuZWjTqCH5QAdDu3aR2iPDMqKxHV8kDk5hW1P
	 ItW406IxMdb6XLJRX+Ic2JIZ5EQX84zpTMPgwjeBZrEFFxXI/VA7xAsOTwxXRBN+b1b2N
	 0Kf6BsQqj+5r0dpTmRqggeOwQvpZW6JX+FkIIMuDckJMH+7EUvmstfFKT/4Q3VQxYrLDf
	 VEy5+gPjj4owMXT/kQ5g9P/RDXZPdcZCTuOxcj/oi+zGHAoW1H/G2GYJ236RCbsRpJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1ZUhJ3mPI+qqMp/uxXmGVfm4VBqcoFVidfP/mpyC9/g=;
	b=wivxI/3ZroYdDXCCSdMF3atw7k+WyI5ij/brsyxTeit26dL6N7zkz+Pp7BOEAIFkcM0R
	 WOayIRjWrPVY9Fq3msWpLqj0DRMlVQTNqqpqgikGf6AoTXb3/jtO7VDvRmzPHIvtrC1vL
	 Be6fOboQNi33a0cf9w0Ese3ATKhzfNbB/dug8PCSAy9ingFPNV/JOjhoxQrH6yWtQok0O
	 /M1cYsYJ/a95p0BiEElsYlzozg2RgdtN5/YPeB/bDsGWaJ8qQpGt5gpIsZkI/OkTVwYyS
	 aqZYdf2rs3VD2sqpBxdrzKxnH+gBm9gzFHFLfv0JVQpOKtfmjbdl+IsOCZiYx9nlnkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c62CTsUs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1SYOPFi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEF606CA35
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DEF606CA35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c62CTsUs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e1SYOPFi
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG3r2T3812359
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1ZUhJ3mPI+q
	qMp/uxXmGVfm4VBqcoFVidfP/mpyC9/g=; b=c62CTsUssSa8Fp/j33dU0ED2La/
	mTsyVSuCrnrnEFbwhccDvSBmF/oNOHeWUcLPuRfJZQ2c+jX4DxeOWAGUOIJgLy7U
	4aqgF7rTQjfmtRV05QahlTGlUjvR8TsJdUroLsOkG+RV+fHMfLHEQr+HE5o1hakh
	Our75TiEMREZtuvB4ChTqvsu5GhoVLpWx/pmzdxEOsktw4ztBVBMzwOVpHYph2wc
	fedH6MNvUxAzls15k3bh6uClWSCFh6QEiKKn8wkZD8mwQTQ6GbprkRore9hOlMii
	kWODllbjgJsV+W4fGRDJY1wr3+ucf2wb7T7ovO9dT+gwh/R5ku7O11p25hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas8896h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so188017085a.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775891; x=1793380691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZUhJ3mPI+qqMp/uxXmGVfm4VBqcoFVidfP/mpyC9/g=;
        b=e1SYOPFi1oGI4vwFpHKEWs6SloRtaouhwSOmkxOOqJKfGSl5/O9WlPpbh/3+gEPIdQ
         m2K/PjMTqyJVe5q3y+tmHTa1fNvCzfivzab2YggRg6HQX+8vD1RjLc+BKI1fTGxsrL2s
         ul2vHu5Yo0XftWjn803PrTcGxcecLiB7i4G7HBQE3J1CsnBmuhnQy3Ypebsj41mUm2yL
         5ATx9ZgJ/MUiKHEuEHlRorlyoLMWpCXubpI2LGDRR+XZZAn3iDFOBKf7VklbhDlo1Lfp
         AWc4Vkjh+9wcBVyaQbM1rIYf7BvpMKoYuDaXmlqt0YsIdKGIGAlkZ5jtARAvXDj+8AQb
         AQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775891; x=1793380691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ZUhJ3mPI+qqMp/uxXmGVfm4VBqcoFVidfP/mpyC9/g=;
        b=qdLF6K2iYbUDC/ai9gYog20UdZo1D8yUysDEGdhtejmhwIepTWRVjD2cBnqX5Ax8Y7
         Pypdg4Yq26jDbhQT/VVRcBqd6DuU+JlKgizC8i5EtHTVwebHyozGPxWLByY2olpPHE13
         w0HHF5YED534h/4L08R4I6sN9qAp+m8vajJYcQpQc3OqqKfz3v4RqwYaLYQxrr0v0v/u
         nsDRotxMw+aXheSzo/5iKfMhws1YEPBW9da6h8ql8QsifASdPI8kjf6ZvN0i+B+Lrwsj
         +dwL+xvzVlSRNjiqCpo1k1Iy18+ONEXBfNBKbWutH2hsBaNqECNCQt8nJgyDsm7vi3t4
         jCog==
X-Forwarded-Encrypted: i=1; AKwUvBzsC1Gwl9Oc+WiV961IM5Tt5NKQG10kMJDho1EfR9Zn/7wh7m4PSoasYoXh+W5AJCBNirKWPTvGZSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMV/Z0Rg+/7I1I3zvLDe4DCtuQkINl9FvXrkYLB2WLGYnUO6+Q
	SWFM6zW0vxIq16CaIMKUHWm6xH2WKGwwRnCdVraz58awJzVrP3u6JiNRLDQbpNA1fnIVaJM8q/D
	m0Lfl/xNRzEbz3k29NRqR4iNweRTxF+xbIS87XVp9L+E/yaX0w8ZwFalNGs+Bghw=
X-Gm-Gg: AYBFou2ZurtGh9I1t/jMlR3EQsL4/uYvvAiISAir0R0AwKrCMwEQi8CycPD8giY3pgB
	3SJVKwyWQlhgEN355eLg10c2DnGhYWgFAeT7S+FqOWWYXphcFRG8Ilb4n3pSoDsJut3twn4/bxK
	axF2s17Y45Qp/MsSCCTB0S/tmMK11icNletJD0w6fWZEfFx+FBlJ2lotfzBKjI9ResIgrorl2fZ
	4jnMD7TtXQEVaK+jI90jgokGulWboxUJmxFQJej2d/xBRFRpq/+eo2Ntw9YfczDZACuw2TakArY
	j2bmGyF7iEdhkgLG0agip8gTnSW8ejzFDFerp/8uagCz/NKuKeh/OK96XVYlBO2FRsJminXKndS
	hOGAXKOtDc3NQ
X-Received: by 2002:a05:620a:2b46:b0:93f:34c9:925f with SMTP id af79cd13be357-93f6f79bcaemr486439285a.17.1792775891297;
        Fri, 23 Oct 2026 10:18:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2b46:b0:93f:34c9:925f with SMTP id af79cd13be357-93f6f79bcaemr486346185a.17.1792775880931;
        Fri, 23 Oct 2026 10:18:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:00 -0700 (PDT)
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
Subject: [RFC PATCH 08/23] ASoC: qcom: audioreach: run VI module in calibration mode with per-speaker events
Date: Fri, 23 Oct 2026 18:14:18 +0100
Message-ID: <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX9FvgPiSQcl3a
 TJ1JvI1IQsTsClvXzGXfgcM1XtbAKulWwQY9/nBrpvLpwofJFwYnE/8SDAXMawMlpyBWUDvXn+S
 Y57sx5kxXNNIKNUPAWIvqFWl/aXmgmg=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adb96d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=G-aZ52fNQZuqIlxTME0A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzzj1A42BhOQp
 d/cN9T2mvr3DOd9310e7mr4802gt8U/m5ibdMYgQuKrUtLiwsTdYu49/cD4L/vwe7ZxgdknX2pt
 nABwh8u9mBjnPdcHYkMEbNFrEQsBgKtR/GaHQeBkqweRLGuFBkdqXGctyDR4+HuP7XiY+z2PwDu
 rOg+OimKn+lwEjkClAOaqj5asO9PpIodrc/i/eBz/aljMaVoSCz5oNY8FUBWCHSbOAh2VjAqxT0
 tTC/RyswDgfhUK+KrL5yzbIrVZRTQPFG5HsKIUSlkBYY7eTVFxk7tJ7F+WCqJ1I8TerxWl02nHW
 9Ej6lO5tJ2J1SKmLUfJUbeW2oeB11V1bjL4XnmihOAOnQwDmDLz2pdb1c3wOw0HCdCYRMRkHFh8
 wOrnndWNdOsiO1BFZ/Wk9obiUso7XRo4TJQ1S96ZY2RdFIzlUWEKG/BisgUaw/eejfAgA7mZHfp
 OtxhFN80XAwztPBXdTA==
X-Proofpoint-GUID: QsrEALgKPh9NwJwcVi1ZATtR_RfsFGes
X-Proofpoint-ORIG-GUID: QsrEALgKPh9NwJwcVi1ZATtR_RfsFGes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Put the speaker protection and VI modules in calibration mode and
register for EVENT_ID_VI_PER_SPKR_CALIBRATION, so each speaker's state
and measured resistance are reported on their own.

Number the V/I channel pairs consecutively, as the VI capture packs one
pair per speaker without gaps.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 72 +++++++++++++++++++++++--------
 sound/soc/qcom/qdsp6/audioreach.h | 36 ++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 55 +++++++++++++++++++++++
 3 files changed, 146 insertions(+), 17 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 9e45634cafbc..75995426b9f6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1464,6 +1464,35 @@ static int audioreach_speaker_protection(struct q6apm_graph *graph,
 					 operation_mode);
 }
 
+static int audioreach_register_events(struct q6apm_graph *graph,
+				      const struct audioreach_module *module)
+{
+	struct apm_module_register_events *payload;
+	struct gpr_pkt *pkt;
+	int rc, payload_size;
+	void *p;
+
+	/* No event config payload, the packet is zeroed on allocation */
+	payload_size = ALIGN(sizeof(struct apm_module_register_events), 8);
+	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_REGISTER_MODULE_EVENTS,
+				       0, graph->port->id, module->instance_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	payload = p;
+	payload->module_instance_id = module->instance_id;
+	payload->event_id = EVENT_ID_VI_PER_SPKR_CALIBRATION;
+	payload->is_register = 1;
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 					    const struct audioreach_module *module,
 					    const struct audioreach_module_config *mcfg)
@@ -1474,8 +1503,9 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
 	int op_sz, cm_sz, ex_sz;
 	struct apm_module_param_data *param_data;
-	int rc, i, payload_size, j;
+	int rc, i, j, payload_size;
 	struct gpr_pkt *pkt;
+	u32 num_speakers;
 	void *p;
 
 	if (num_channels > 2) {
@@ -1483,9 +1513,20 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 		return -EINVAL;
 	}
 
-	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
+	/* One 32-bit V/I word per speaker, so channels == speakers */
+	num_speakers = num_channels;
+	if (!num_speakers) {
+		dev_err(graph->dev, "Error: VI needs at least one channel\n");
+		return -EINVAL;
+	}
+
+	rc = audioreach_register_events(graph, module);
+	if (rc)
+		return rc;
+
+	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_speakers);
 	/* Channel mapping for Isense and Vsense, thus twice number of speakers. */
-	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_channels * 2);
+	cm_sz = APM_SP_VI_CH_MAP_CFG_PSIZE(num_speakers * 2);
 	ex_sz = APM_SP_VI_EX_MODE_CFG_PSIZE;
 
 	payload_size = op_sz + cm_sz + ex_sz;
@@ -1503,8 +1544,9 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_SP_VI_OP_MODE_CFG;
 	param_data->param_size = op_sz - APM_MODULE_PARAM_DATA_SIZE;
 
-	op_cfg->cfg.num_channels = num_channels;
-	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_NORMAL;
+	/* The DSP calls this field num_speakers for the VI module */
+	op_cfg->cfg.num_channels = num_speakers;
+	op_cfg->cfg.operation_mode = PARAM_ID_SP_VI_OP_MODE_CALIBRATION;
 	p += op_sz;
 
 	cm_cfg = p;
@@ -1514,20 +1556,15 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_SP_VI_CHANNEL_MAP_CFG;
 	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
 
-	cm_cfg->cfg.num_channels = num_channels * 2;
-	/* Convert the physical mapping to a logical mapping of the channels */
-	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
+	cm_cfg->cfg.num_channels = num_speakers * 2;
+	/* Number the V/I pairs consecutively, the capture has no gaps */
+	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_speakers; i++) {
 		if (!mcfg->channel_map[i])
 			continue;
-		/*
-		 * Map speakers into Vsense and then Isense of each channel.
-		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
-		 * [1, 2, 3, 4]
-		 */
-		cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] - 1) * 2 + 1;
-		cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
 
-		++j;
+		cm_cfg->cfg.channel_mapping[2 * j] = 2 * j + 1;
+		cm_cfg->cfg.channel_mapping[2 * j + 1] = 2 * j + 2;
+		j++;
 	}
 
 	p += cm_sz;
@@ -1601,7 +1638,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		break;
 	case MODULE_ID_SPEAKER_PROTECTION:
 		rc = audioreach_speaker_protection(graph, module,
-						   PARAM_ID_SP_OP_MODE_NORMAL);
+						   PARAM_ID_SP_OP_MODE_CALIBRATION);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
 
@@ -1610,6 +1647,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 		rc = audioreach_speaker_protection_vi(graph, module, cfg);
 		if (!rc)
 			rc = audioreach_module_enable(graph, module, true);
+
 		break;
 	case MODULE_ID_AUDIO_IF_SOURCE:
 	case MODULE_ID_AUDIO_IF_SINK:
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 38b71aefd845..4744d3117010 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -720,6 +720,42 @@ struct param_id_sp_vi_channel_map_cfg {
 	uint32_t channel_mapping[];
 } __packed;
 
+/* VI per-speaker calibration event, raised every frame in calibration mode */
+#define EVENT_ID_VI_PER_SPKR_CALIBRATION	0x08001511
+
+/* Calibration state, as reported by struct vi_per_spkr_calib_param.state */
+#define VI_CALIBRATION_STATE_NORMAL_MODE	0 /* Not in calibration mode */
+#define VI_CALIBRATION_STATE_INACTIVE		1 /* Port not started */
+#define VI_CALIBRATION_STATE_WARM_UP		2 /* Warming up */
+#define VI_CALIBRATION_STATE_IN_PROGRESS	3 /* Calibration running */
+#define VI_CALIBRATION_STATE_SUCCESS		4 /* R0/T0 within range */
+#define VI_CALIBRATION_STATE_FAILED		5 /* R0/T0 out of range */
+#define VI_CALIBRATION_STATE_WAIT_FOR_VI	6 /* Waiting for V/I data */
+#define VI_CALIBRATION_STATE_VI_WAIT_TIMEOUT	7 /* Timed out waiting for V/I */
+#define VI_CALIBRATION_STATE_LOW_VI		8 /* V/I signal level too low */
+
+/**
+ * struct vi_per_spkr_calib_param - Per-speaker calibration result
+ * @state: Calibration state of this speaker.
+ * @r0_cali_q24: Measured DC resistance in ohms, Q24. Filled in regardless of
+ *		 @state, so it is meaningful for both VI_CALIBRATION_STATE_SUCCESS
+ *		 and VI_CALIBRATION_STATE_FAILED.
+ */
+struct vi_per_spkr_calib_param {
+	uint32_t state;
+	int32_t r0_cali_q24;
+} __packed;
+
+/**
+ * struct event_id_vi_per_spkr_calibration - Per-speaker VI calibration result
+ * @num_ch: Number of speakers the result covers.
+ * @cali_param: Per-speaker calibration state and measured resistance.
+ */
+struct event_id_vi_per_spkr_calibration {
+	uint32_t num_ch;
+	struct vi_per_spkr_calib_param cali_param[];
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index bb2f18a64644..0e02cadbc14b 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -560,6 +560,58 @@ int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
 }
 EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);
 
+/*
+ * Convert a Q24 fixed-point value to its integer part, and to the first three
+ * decimal places of its fractional part.
+ */
+static int q6apm_q24_to_int_frac(int32_t val, int *frac)
+{
+	*frac = (int)(((s64)(val & 0xffffff) * 1000) >> 24);
+
+	return val >> 24;
+}
+
+static void q6apm_vi_calibration_event(struct device *dev,
+				       const struct apm_module_event *event,
+				       int payload_size)
+{
+	const struct event_id_vi_per_spkr_calibration *cali;
+	unsigned int num_ch, i;
+	int r0_int, r0_frac;
+
+	if (payload_size < 0 || payload_size < (int)(sizeof(*event) + sizeof(*cali))) {
+		dev_err(dev, "VI calibration event truncated (%d bytes)\n",
+			payload_size);
+		return;
+	}
+
+	cali = (const struct event_id_vi_per_spkr_calibration *)(event + 1);
+
+	/* Bound the array by the received payload, not by num_ch alone */
+	num_ch = (payload_size - sizeof(*event) - sizeof(*cali)) / sizeof(cali->cali_param[0]);
+	num_ch = min_t(unsigned int, cali->num_ch, num_ch);
+
+	for (i = 0; i < num_ch; i++) {
+		/* Only SUCCESS and FAILED carry a measured R0; both are worth reporting */
+		switch (cali->cali_param[i].state) {
+		case VI_CALIBRATION_STATE_SUCCESS:
+			break;
+		case VI_CALIBRATION_STATE_FAILED:
+			dev_dbg(dev, "VI calibration channel %u failed, R0/T0 out of range\n", i);
+			break;
+		default:
+			dev_dbg(dev, "VI calibration channel %u in state %u\n",
+				i, cali->cali_param[i].state);
+			continue;
+		}
+
+		r0_int = q6apm_q24_to_int_frac(cali->cali_param[i].r0_cali_q24, &r0_frac);
+		/* Raised every frame, so keep it at debug level */
+		dev_dbg(dev, "VI calibration channel %u: R0 %d.%03d ohms\n",
+			i, r0_int, r0_frac);
+	}
+}
+
 static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
@@ -583,6 +635,9 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			client_event = APM_CLIENT_EVENT_WATERMARK_EVENT;
 			graph->cb(client_event, hdr->token, data->payload, graph->priv);
 			break;
+		case EVENT_ID_VI_PER_SPKR_CALIBRATION:
+			q6apm_vi_calibration_event(dev, event, data->payload_size);
+			break;
 		}
 
 		break;
-- 
2.47.3

