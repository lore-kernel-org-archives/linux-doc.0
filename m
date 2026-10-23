Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775898;
	b=TagTawUMYKZqje5rVXtE2x+KSR5q1u9KJYiiiSG3YtF4nd1qmprb9M0GOI20E4koo7vM
	 v76R9eAqUmw+LgLMAxocWaYsxOrsthgpmYA0bkApYYJCbcCLTJt4HJfdjB3RBkKd0ruIy
	 OWbyLJbYxylg4w6dLBAWr17bU96KUry0zY5Mkrd22q1Y+W72D0JSx/KJrIrdDITcmT5g1
	 3LQ04QbxEfjSq+UqLTbqCwca4p3OB4HINvmuBzwCgAkmNs8riVpgo3hz93tonzA+F4Y20
	 HnMypr2QdD3j+qJmkP9a80bV2wo8vTVknQhl8pnLCnYdZNC9LCN9lArTz5rp6hR4+Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
	b=H/TmLyDtG4bu5tF9QpnXw+Fr+UAj2t6wXqcpH2dA6IOeJHS68Nuo6vnbdyEmKJI1ID3B
	 Hkfsqsi8Nz7CUGffYbvT5fSm4ffdOaC8un5xQB3d4rzFcxBybGt3q66gLadf6X7i1qNxY
	 B0Vx9IcC7gFFQMBYejdS2g2lmEk55zfBcM5z+bBA6qwao+keW1S2il6BnWCD+Zo8friwX
	 yNoZTPhXcwzAzDpTKJTEtgv2OpTpvu01xWqrfDr0kVFFLYpnRKy/IdxwLIB8oA3gm5UZ9
	 SAbfMurxc/MYFnZzE8jwkADM63VOPAoFVgYLm9T7GL1n7r9wakUUV4L9XnRvvITj1EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0BD606A97A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0BD606A97A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9XFIlA2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GT6jvuoU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6DvA2462566
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DZfg246TfQN
	Ytunz0I9gt0EsxySLDi22L36IzvOxp2U=; b=c9XFIlA28Y73lvz+5dq2//1lUGL
	VKgarBj45iMCPHAYBwkiMulg82OsyJ+MY7u20+5VgBmWCLyVn9tb0yWrNYLAkfiW
	4jMCWR41NOS87rNOvQj0atc8nyzqcaDNwz3zKbW7L0iPyBG/xkWNTXnd81hIK87l
	62gzZQhuVlCRXz+HMGm6bQB/HX6mf3KGHQVrRbBHzY3O4zIoS0THO2ijS+AvvQlq
	FGZ+8P15fL3T0Y8YEgz/uQY1B24zCJLQ7k0kv9UBbXQylJEcen3OezjNB4vHeRVO
	QvDyEaxTPqxF8BSbUhBdA0qOyFBcZgRb5euXhA1BYJrCPH3TggDpGCcTx5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvskc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so255524985a.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775897; x=1793380697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=GT6jvuoU9QS3+S74DLDt6SKuUfyyWPUc3Pkov4dOw8QuSXxfY/sDXMliyC1YI4X3tp
         TO+8e8tcuK+UMNsxbC/mvFmhioFu9MrJwm3hXSZzkT+GGLW5f+3E7eDHnRWU3n2NDCvr
         DXuV4A9YHWPgcwVoklcUIzQdOIPDvamOS4IHKuiqN/S0QNUlsGuMEIGB5KDgNILVmPY9
         JJNqaDbUuHGFEZ7MZHnOq9xtASCOSCsAtrBhgBYRtTZ7xSeg9t+n+wpVyqCelJkA1/DV
         mOEr/E85rknnG5yOAo0uen0d3Z6shpxKB9yZI80FHW62ljL0vxtUpnYkKiD2+a0dCNQU
         IgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775897; x=1793380697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DZfg246TfQNYtunz0I9gt0EsxySLDi22L36IzvOxp2U=;
        b=wPF8PUJ54oyzbs3LTBzoaf0f2aOX22io9RBYNPakD6PkB9dMcJFSbYdV96ph+VPR7M
         L3SThAs520R66PiKVyaSF/yqsNw4vWNCg1aAT19MNGFnLohxB7VX838Cq1k01C1mM+lh
         zQIvZ9HBzK9cuynrUJIfa9mTIMxWgjx1cztXZ8D16leb6V6ZuExqvcl+vku7HIuKg4oh
         531ErPFknf3j9YS9tHTTcVL2tbaonlxJrMWa9jxluhQ0P0MREV5qCM7P4aUZ7yZFYpIh
         3qE2LisoFmELds3Hu5OgAd074qb8vCwRvBo82TaCVD6uQYacGhyCblxMN1f35Hl0BQWo
         CH9A==
X-Forwarded-Encrypted: i=1; AKwUvBxv4pmnmu6RNtEAXCS+t4T6DffADeuylvhr34Mvt5fHXFAs2COl2TYkdv8fpiQ0C1DxlST7H6yCNsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXT38DUpAQyCzOQhMPQxzgOqyMp1hWk+xmeNY5pgfo2dzoZBR6
	pgdGX+f/RIJL0x6GxTBJzb8/Mc5MZq08kTviVmKNn3inKQ8N3F0mtEg/UssTpPtMHnpY8M3gcAN
	gU0jS7B67YaLNwr0AgrIf0BHbbFt5IKvJyTh+HL6XXOLI+/W02m7wslxic8T+sV8=
X-Gm-Gg: AYBFou1lOJ7C4Kp/XeXrXguRz1Fx4YtLct7/q9b1HOJbiUWSWi3sN6K6kseNT+rlbfI
	kQAPEYkaEfZ+WityoJgcMoucwPQbXZue7mgEc9CzZVr8TH26VJj5p3UdF2UfYq1vNihbV5XWUKY
	A5wcj82kHVzp9XF18ixobl/v7wtyZQjlFWNG/V/79c5HGyBx35Ge9ub/e5+p/In9hKNm+K4n85C
	6pWrfUZO1U4Ksf3LWl7fk66VhWDHferlStFTtcWr48seD3yYyeTEVvuoTFldpu8f79kVxrfRw1N
	QR5AzZOu+e85X7x8tKxODvglXB0mrFpTNoVQSxhUt7Nff1cfogH1bRkpOn3B5hTbwj+1pP9YcG5
	FWufRZvbNI9H6
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513761785a.33.1792775896773;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93f:1dbf:6cf9 with SMTP id af79cd13be357-93f6f795ea5mr513755185a.33.1792775896248;
        Fri, 23 Oct 2026 10:18:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:14 -0700 (PDT)
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
Subject: [RFC PATCH 16/23] ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
Date: Fri, 23 Oct 2026 18:14:26 +0100
Message-ID: <20261023171433.820092-17-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb96d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2Irll14qWxTS2nb0BqIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0pgDNGiy5CzlG3QP-YGb7LR4BsXvKKke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/ktxFrnIpdV8
 xLSOxFiJQvQtX45EySvvh63PIQV6XicnO4uzfQl1WrNsg2kYUkCMUZ2hSBMf0vIlkmKsCwbImzs
 5qVZ0fEuU4fA6kPHavjrZsRP6vwaB/zLdT8Wv6FfSHdS4fE0m25UGTfqOBVLwvTdRUv9c8sDa9O
 fPPIqZlcBvhR0jFOeRBe8MzEYrwiRDVrhvvPG7QZrngFojhdrIAPRyNrFKKM1vYLCjtqw1qUIkr
 2811PqZjEWvLWmYsDgb9U2REeI+zO5ljtLb0ZQeyI4vbMaoonjYKRTUrLIMAUklm2mSOA8o8t/R
 y4VbF+vazbZZBVt2FqE5BzxAL6hI9fQHAipntW83Y+GE48Ksdv+SprTJAAqotLv9mxRcv6t6sYH
 f9YOqj1vpKPU0AnFARwh7lvJMDfQ94/FgxFHRn89+txGFWCiwbvgPLXYGgl4UOX8A4mtRubgHpl
 Qlu9Ztd7prjh6D3vJ7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6et1xkaErO17
 ALcrEXucG7SnOuJe4KqC0ze6c7JXEXlQl4NFCsLB5LE8NSwIOw1uaJXw1IQcTPRf6H+DZb9xAUD
 4f3UfwsTYi1err6oqbWVPJx1sMaYtR0=
X-Proofpoint-ORIG-GUID: 0pgDNGiy5CzlG3QP-YGb7LR4BsXvKKke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

With multi_direction_codecs the speaker protection VI subgraph is
opened with the playback stream's parameters, but the VI module and its
codec DMA source always run at 8 kHz and 32 bits.

Use those for the VI module and the codec DMA source in its subgraph,
and keep the channel count, which follows the number of speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 089cc9dd76fc..d027c763eb25 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -2033,12 +2033,41 @@ static int audioreach_speaker_protection_vi_static_cfg(struct q6apm_graph *graph
 	return audioreach_speaker_protection_send_static_cfg(graph, module, "VI");
 }
 
+static bool audioreach_sg_contains_sp_vi(const struct audioreach_sub_graph *sg)
+{
+	const struct audioreach_container *c;
+	const struct audioreach_module *m;
+
+	if (!sg)
+		return false;
+
+	list_for_each_entry(c, &sg->container_list, node)
+		list_for_each_entry(m, &c->modules_list, node)
+			if (m->module_id == MODULE_ID_SPEAKER_PROTECTION_VI)
+				return true;
+
+	return false;
+}
+
 int audioreach_set_media_format(struct q6apm_graph *graph,
 				const struct audioreach_module *module,
 				const struct audioreach_module_config *cfg)
 {
+	struct audioreach_module_config sp_vi_cfg;
 	int rc;
 
+	/* The VI module and its codec DMA source always run at 8 kHz, S32_LE */
+	if (module->module_id == MODULE_ID_SPEAKER_PROTECTION_VI ||
+	    (module->module_id == MODULE_ID_CODEC_DMA_SOURCE &&
+	     audioreach_sg_contains_sp_vi(module->container ?
+					  module->container->sub_graph : NULL))) {
+		sp_vi_cfg = *cfg;
+		sp_vi_cfg.sample_rate = 8000;
+		sp_vi_cfg.bit_width = 32;
+		sp_vi_cfg.bits_per_sample = 32;
+		cfg = &sp_vi_cfg;
+	}
+
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
 		rc = audioreach_module_enable(graph, module, true);
-- 
2.47.3

