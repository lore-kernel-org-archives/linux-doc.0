Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775887;
	b=h2fRq173fdRV0hh7+x4uknUjT3/n5roHblQDvkxG7RxJqJ6FCDJ879CSJO0qDp1XvHZb
	 iL/4/7hkMoNDYHCxW+0xMslJQpRNf/UGemJOL65rz686zWQurhLlvrX59ML69EoUaNdYO
	 alQw5dtIZCVjlmkJ9xqGZCAJ1zDBVE/1FEzqc5pkTkxISmbFHZ2LP/4gm7FNvXkYvtqZE
	 bSyRWeKEiKzn2uqWQ3U3jlEk4piw3yWSf8Wcs0FAACjCiX/bqgo3u7JU3DMfATAY23Kcr
	 eGfAktgfsasLa2dqDnfqNS/tTeL5axKgru8MXw/uRSufWnEE+E6H2HCCNqT4FZ8Gw+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
	b=s9AJBH35bJB1ZrG14MeFJ1hxo0okxk6XTJEX9R36Q4y1czd12TaETxajzTuOWRPyIXL9
	 GKqpafhHkuW2baIgWIQ3mfxCubvdU8ZrjtX4uGhjI2qmNXghrx+b//tX3v5l1+ajDKDr5
	 Gj/6SLv5G2AJdUQQgKlaFjGzxHAtUHToyJUQyIm6zBCqpxu2qUu9ZDw6RKqlM9BTjuWhV
	 8fEgSHCiRcWoHhaEidzfyHlioxQ7g2M8Cge2Oyb3o7dm9/FqsGiExWXMXjzihCidxDGVh
	 Xlq2nZLf/jVtgVYO2uCQDCxRI8Wx3+vk0zPQqZNbj0gr/FafI7b2XxPMFRXjEVK1mYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479960A261A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D479960A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wIS4063399
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5T+eklRSuPX
	OFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=; b=CHBfgWfYo193RQkrldZ8J0KogoN
	ppn3J4x+BoXgvo6Ii7dPPtTab9kJlel/eIEE3Ed4Yw5Gn5UH1K7296cuSUfGjMoF
	5FqcMZPKI1ZjQr/CrVJdnjfn9c3w+agHBix8+6C9hfSe2TNEdFc//hPs4ZI3g7Lz
	GruvMK/PUYuQcKTpkhyte4Et8bY3H2va6T8bEJQRPQcsYyosF4jiapUgwYBbNnkn
	dbk+79V0OCQAsjEPsWsXUc1yPrr2A3DBTqBccndaaII8kugvthM+40TQB1uZCC3M
	y0M2d+sgDmbSe4552H1MiZF2YG9l81R7luns2EHgwUjN8gZFtGBWBzFxe2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrcrax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so114119685a.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775885; x=1793380685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=JlF5tTdToMf1M8+qngUfLf4dSVnbTeDbH1qstrEDxu32HlUsDBNjqDidKGJvKgGtzZ
         B9UGPi4rPk9XwIByN3B4JoArAbOlx/14pl23T8aMlRtA+ZRIomrOUY3Z0+wU1qEF7dxs
         CnhzVSz7tl2rodGPYDBvOxz8jCCogqlN7DZPwivOnvAM5yGu2X8FXFjuvaoiEOJi01sU
         /620IM9o4qk2SJ+rxCO87/1/iWrJr1QpJ4GxBHy30hm/Y3TTotHfxC7qyARBaqSab/l7
         dg4tatfmnuUGIUW2V0ZFK6RXlpP+f98LCjovVJvsvne6VyPR17KZyvoMm58ZCH9qu8BJ
         trdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775885; x=1793380685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=Hf7W5PQH0OpykcEy18j+iKyk2datCWZvKhrCy+Mr2yqSruqKzdGb29xoHeCyXyxZOa
         bWPp0NBzEoyBscb2VFC/3entjH4nPzLg6cx/8Kl8eaqX/6w+YNT/bz9A3FpRfs7awV5Y
         3TMMuK8kn6pgC8xfzvMhPp6JKJWkd2ASiAcXDznjV7Hme4bdrDn0SRETAr4KkXuHASrw
         IYKwnyg9VC/qPxg6ZlHIg3orVQdO7y3kpF1MBXrz/EMt/piHXU7rQx/J/6hK4sernF8s
         E0yr0QVfJs1HSWhAOOHjDtWsy0q8XtURKUnrvixKMeFr5lTO4mC2JayKozrcPkUFqzGW
         vAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwbsENzpJNiyOfeqbLUte/ljk4b554Z92VXzYV4ySl17U+pdXuFDxrKmO36/l6B+3WggZI8Jdyqlg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzZvnoID0NEjPLju1JijmoaeIs8eLV63F5/QIfH472dw/7ykjm
	vuGx0/OX754Vgcymdzqbi0N7rQ3L5gayEL6InW9No2/+K5ZrPHvBYrQZaLX/Tcon9OaNwQyUxzr
	U6+Yc6uXK/vl60+1BmzKSfXUCO/Mht01g3s11a1ZD3hQrGsgIa8X+6GQUusZMCHg=
X-Gm-Gg: AYBFou0oRbdIQmWjbRPvy9pAverGVGp58Kb9RtimuprtypVa7L4zoicuEC4OF0CAIeb
	7tu/bvuEMWkYvnes2FbQVJch/oknCjnU/jYf3SOghYB152d9SuiW5KLuiN7jHU24CTCS5QpFguM
	LcJErWfHStjqlbaUAhwbAOBRnrJ+tN1IM3COlDtH9uzENqmWW47x8ovbrtalq3WSU+y/pLyusHx
	gADj/KybcLgrqegWaITq21YL5w5/ce9mbq7tGVDCKzqMluENU+LMQKXcoynZ2M759/S67bNkTJ2
	UHjp4xcR9rjm1hlR5gp3/q5X+icJxg1owqKa6xUVgZb8kk4Z9lolHB3S8NqsLIy/TibvZ/HNn0b
	c1cwhlhvS0dwc
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502264085a.26.1792775884609;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502259185a.26.1792775884048;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
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
Subject: [RFC PATCH 10/23] ASoC: qcom: audioreach: support up to four speakers in VI feedback
Date: Fri, 23 Oct 2026 18:14:20 +0100
Message-ID: <20261023171433.820092-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: PkCYlPaFTrhCixgNCEm-I6HoMyEtAz0N
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6cbCIHfur6GO
 LXy4JZ07byn1NRL+e0okJW6v32S0eA1Mxzxy4Nv4LrGCj78ebTTLOk3foJYASvOU8xu8dDGJy1b
 AI4+BFIfQALmdWwaSvg46miHkB5grVo=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb96ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0B2h0znxLllEwdGFOn4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX4o2xk7hyp6tC
 CPtarRtNvvyzqkNLJeDxmWOpBLqLahkbnU4/qN/YPKqILnIrEnzyJinDyK+PBcDKGmEJSnSDJzP
 HiQnfER0rlgB0cG9NgKWMX39SI7GMuH0hi9k5ql+wrle3tJd6lxfSaPiFIP9bsj5IMUi482wIaV
 xWPMmB0RiA190tueC3tAYJVj+ygyAGGWZtwLR8k8inPqqpT92fxZGSpFoQdmWl78ZIbyLvNNThf
 eceZo3P7w00ij9hqcei/d3cQKqv3zR/JaOVLMtSaQ8NeaO13mKbCUjL4y+od3PpMlwNjm5EKubj
 Rw/+qWpC0hncYaKqksyI5K0idq3phC1tBjPJ4V73Y6ojZlHg6cvNh6TTCn9m1DUhiVIpaQQnwvU
 EK2TzXR5G4vTWS0HsqivEPzaTBFaYFNP22FwPMXu6+lcRXhgitPQrracGVxJ4HUEMUrZ0HwAsY+
 dT0ZQDo8A0lcQiTWSyQ==
X-Proofpoint-ORIG-GUID: PkCYlPaFTrhCixgNCEm-I6HoMyEtAz0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

audioreach_speaker_protection_vi() rejects more than two channels,
although the rest of the function scales with the channel count.
Laptops with four speakers need four.

Raise the limit to MAX_SP_VI_SPEAKERS (4).

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 sound/soc/qcom/qdsp6/audioreach.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 75995426b9f6..24198cde8158 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1508,7 +1508,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	u32 num_speakers;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > MAX_SP_VI_SPEAKERS) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 4744d3117010..c8c7fa4f6f70 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -696,6 +696,8 @@ struct param_id_sp_op_mode {
 
 /* Speaker Protection VI */
 
+#define MAX_SP_VI_SPEAKERS			4
+
 #define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
 #define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
 #define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
-- 
2.47.3

