Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775874;
	b=5iAv8aCTTyOIjgY4RPSuGXbmyNcfcwysI0vtvGehgPS5xv1a1C4cago+Z68qD5h2MX6L
	 xyWiwlY0pOLNudSjKblyi7rOe7K9yRbSP/ureeBTr1BM8TzoE0DnQnBDsuk3Gi0dRgxHP
	 +TmHsOx0oc0g87lYezJn9frO3AtuX+f75d9HCrtdPM3wRiHqfREMXt58bAIm3gwKTxEv+
	 McBVmuQugXiErLyv6YgwlM7VButH8q5KZW4wOEfonY3VDpBFl4Vf+N08qL6vvikWaF9Rr
	 6rS4ejD60H/1se2dBPODDFsCdfAVCYDJSmZpCLlN9rM3rAP/ymnYamiPrwRgX4+DXwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BL8jiXMh/9teOm1qeQCPk/In5cg60p1T0uUifmtHDQk=;
	b=USh1ZdfEW3Ku9qRg8eChp5WWBmDmV41gRbCqeKwj3B1u+P4f2ODyxpVLdSm9ayWtXb1H
	 ST7eD4VsUOwF6s/w2kMOWWFeqm1WBqI680mUwvjmB7slIVjju/G1TpsEXLgQjxREF2rHt
	 HXJbdSoLou9QY6+DfVnyaukPhZEZMbeQ45KjOJ7bse8Lt0byRxTtPDJed3Mn4oaxq+XCO
	 ixJ9oTEub+MncFGK/IqScgQSYWFZoIklJhfoOtjaEtVAO9eeN1HTm1E82saMK6CwR8bLb
	 RtdsufqN8+H4tLfb71FATP9N9Hc1IBCjsiKqIIL1uq5PXqqrS6X8DfQimoH6zGs9V9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjEt0mZi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3r1DioI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC8606A331
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87BC8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjEt0mZi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3r1DioI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5s3A4072735
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BL8jiXMh/9t
	eOm1qeQCPk/In5cg60p1T0uUifmtHDQk=; b=FjEt0mZix0hU7QhA/wiC0In6yVP
	eX4bWqatAX7+hxB32oRby+2cduc3dWuy0li51mt47h8ey7y73YNpzHe4H9hCGWkd
	p3senYwDhSPp2CyEArmQjpPFGaCGpbjTCMw7RILjuOQBCL/aV9hPpeSvTfi+sOsV
	a6OBFKsJnlqcj9sg3Xr4DDOpihDhQqemD9vDruGwF6gaEWDc3kim963zXBDhwXh+
	bPj5RUsDkPWM+BifhUCpGAwcX21x8+geXsJ8cYx8UCqyXS7tNMJpSMBDNjPJomt7
	VbxlAFPE9jllVgW6WYKVP7z+rAVgKj0K8uTjx3yFfdnpqQLhxPshArUMkug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:17:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so186717785a.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775872; x=1793380672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL8jiXMh/9teOm1qeQCPk/In5cg60p1T0uUifmtHDQk=;
        b=a3r1DioIdWyURy33hTajAunsdssGhDkp0obiZLtWmzJCTOdbVBHH4Z3spSPSqnuvci
         DlajYzcH84fiCuKnJvSmaKiunsZ8Qg1WMzOP6aEozmIawR5elL/HjBj/B6irEEeiCTHn
         zuMgxbNiqOQoJoSvZRj27GJwvqmhO/S1y8/sMsUVssfiZNWy59FRy30NcFPa1yZ8IBWT
         AjLI0CsDow3U09spwNopfYDAfGk+nBrljeCWcoNEQzeBaiUrCLqQZ45OAYGgvLkXRlZd
         opm47cIPQjQgrzFjDOt5YJOm2w3Ubp01yY6FhXH6lifXpA/jWsVieK3X2duwm42jPkaA
         6Rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775872; x=1793380672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BL8jiXMh/9teOm1qeQCPk/In5cg60p1T0uUifmtHDQk=;
        b=P2YzVsgCWL3a7KF1gqbEUXtwSOWuhseOMAFpDtzwf7ty32g6AY0S/AD/gmVgOPAAX1
         0/NMAWtzxwBpzawkRVGQ2CP8x5cgfYE0J+q1XSBZRYa/YuFy8Eg0uhgASXRpQ/z8ii0k
         PZUXEghvB2YLplfRipMXrQKRIYg64u4rfKIIizGNM7sQEGSShhOdG+XLzTprZyvGJ/Iy
         lV+hgr2UoJ2njKWtRxR8pKw7//rOzaRQI7xeuaqC+/5Ro1fwEmvLzmD3BdPijEm1bmD8
         0U4dNpa8LYPTfmntOFkBPMnFrMG5Pn68bItWVvBkRgO2M8KsVb3rp6vogyrynIVyLQvk
         Ni3w==
X-Forwarded-Encrypted: i=1; AKwUvByHmUCE9/IQlgpSnhrOfu/O/Zvn8r+fe14B0KetdFmNXIQtvj+tot3Z9ZYXBBJlZFw5YW16X/o6WcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2W+WWVHp7k2m2DmB8NpoU002L4o9/cHwSKv4/CKG8pQfQ9zbp
	pyxgPK5vMXsMrByzrpqTHk1zAVNafC+iMYV8sLQX0vK0/aZ9dmBtcS3FZCYJjJmN41T7sk+tMXi
	n4bCsia6z9og0Bf4e9FId76AuP8We1kluNrb2Ep99obmtptaUtiUAep2NYGBuNeg=
X-Gm-Gg: AYBFou0+BGayRTmka5zatt9fQu0TL2ET0WIn3wDSiWL55E8NzoEexiYDiN9O90FpCdK
	kdtvqqAIYVz/U/mSXbTzsaQ3eKs7iyDLjF3/x6+k9yaISBzWElbB7QLu2Dr1zrpsfoZYgKm0Sx6
	uLXz/nWymNZKEAVJUjgV6+UlCcRh2pIr6ItT+iDzCndUTZBH4mowWAV+7LezZrzDyJAkOrDwjYy
	G0MV+m4WuBAnuqRfpb9A9/SMs+zWEdd9AZ1kT1ghIBECm9L2WFMDaHVp7lxfrMbLXUb2s8ADuqK
	gq48n6DjJmDGg70oqJIWd+PVADI1hZOKX8j7SAo+uWkMgyMIV6J95/wPNAXU0ZQPuzrmB2Tn+80
	965OUew/he3fI
X-Received: by 2002:a05:620a:2a09:b0:93e:63fd:40a4 with SMTP id af79cd13be357-93f6f9b4312mr527417785a.55.1792775871456;
        Fri, 23 Oct 2026 10:17:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93e:63fd:40a4 with SMTP id af79cd13be357-93f6f9b4312mr527411885a.55.1792775870821;
        Fri, 23 Oct 2026 10:17:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:49 -0700 (PDT)
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
Subject: [RFC PATCH 02/23] ASoC: soc-pcm: add multi_direction_codecs link flag
Date: Fri, 23 Oct 2026 18:14:12 +0100
Message-ID: <20261023171433.820092-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RQsTGzhu_sK2qqnR7kwOSqbdcoud-oOu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1uwtwYuyKFEW
 99qXE0Ljwdr/w9MSkoRHBv5f0g3qLkXgBJRYa5yoKJDt9hLjRlUTyPChGEwk8XdgHTHuubgZThV
 uUdoe8dimm3W9KnKBbjcx8Bz20x91Ks=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bAVPqq42SAvEUUXqVuEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RQsTGzhu_sK2qqnR7kwOSqbdcoud-oOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzdo6tDXJc8IG
 oC303PZ1SXv43fzbdgFgmBevjTkwJJnF3qW1wRCoIvxcS5xP/0wVunFqXd/g269sWZ5maSeFy10
 MFBx3g7Ww2nCBwFLVG9w/dA46U0BJ4LJv4Qh6+2KlZ4G9dhaoqBUflTpTVqTUry4Lj35Ne/AwG/
 sSlNuaofPy6h5WT+0o7OQagXKkPd6BGO5m+m03ub7lV5b5yAhnheESG5Ucojr4kUewF/euegOzM
 LKXs8TSonKs2ANQ9oHgR4QNGWa1+1kg2Deprte8GfGrfDQh/dFZYLtasTzXJHwRxAlkNjTWtsXQ
 nJKOb+Jh2LE+LF48nMIG4TmruScIRqg27QvZa2lOUb6RvUoz2qZZ/vYuszHACE5mWGXVolLTADT
 zpdWR6ABffXzmNXq7pWDwi1VqcmUTrAyIk6aitcmPP8Vw24eBxm3yg+4c2KrnNMqmbSL2nUa220
 2jqqmZkeK/ZdFBZ8uGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Speaker protection needs the amplifiers' V/I sense capture running
whenever the speakers play. Putting the capture codec DAIs on the
playback BE link ties the two together, but the core skips codec DAIs
whose direction does not match the substream.

Add a multi_direction_codecs link flag. When set, the core also calls
.hw_params and .hw_free on codec DAIs of the other direction, with the
substream direction switched to theirs for the call under pcm_mutex,
and sends the matching stream events so their widgets power up and
down. An optional multi_direction_params_fixup callback lets the
machine driver set the parameters for those DAIs. Links without the
flag are unchanged.

Document the flag in Documentation/sound/soc/multi-direction-codecs.rst.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/sound/soc/index.rst             |   1 +
 .../sound/soc/multi-direction-codecs.rst      | 135 ++++++++++++++++++
 include/sound/soc.h                           |   7 +
 sound/soc/soc-pcm.c                           | 122 +++++++++++++---
 4 files changed, 244 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/sound/soc/multi-direction-codecs.rst

diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
index 22878d73f7a5..62d01a0a6e52 100644
--- a/Documentation/sound/soc/index.rst
+++ b/Documentation/sound/soc/index.rst
@@ -18,4 +18,5 @@ The documentation is split into the following sections:-
    jack
    dpcm
    codec-to-codec
+   multi-direction-codecs
    usb
diff --git a/Documentation/sound/soc/multi-direction-codecs.rst b/Documentation/sound/soc/multi-direction-codecs.rst
new file mode 100644
index 000000000000..75befb7501b6
--- /dev/null
+++ b/Documentation/sound/soc/multi-direction-codecs.rst
@@ -0,0 +1,135 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+Multi-direction codec DAIs
+===========================
+
+Overview
+========
+
+An ASoC backend (BE) link that bundles **codec DAIs of both directions**
+on a **single-direction CPU DAI** can set
+``snd_soc_dai_link.multi_direction_codecs`` to tell the ASoC core to
+call ``.hw_params`` / ``.hw_free`` on opposite-direction codec DAIs with
+their own direction, instead of skipping them.
+
+Typical use case: a smart-amp speaker protection link where the CPU
+side is a playback-only DMA (e.g. ``WSA_CODEC_DMA_RX_0`` on Qualcomm
+AudioReach), but the codec side exposes both a playback SPKR DAI and a
+companion capture V/I-sense DAI on the same SoundWire bus.  Opening the
+playback FE should bring up both the amplifier output chain *and* its
+V/I feedback capture chain atomically, without userspace having to open
+a secondary PCM.
+
+Without the flag, the second codec DAI's ``.hw_params`` is skipped
+because its native direction does not match ``substream->stream``;
+``snd_soc_dai_stream_valid()`` filters it out.  With the flag set, the
+ASoC core:
+
+1. Still iterates every codec DAI on the link.
+2. For a codec DAI whose native direction is **opposite** the
+   substream's, calls its ``.hw_params`` / ``.hw_free`` with its own
+   direction (by briefly flipping the substream direction under
+   ``pcm_mutex``, encapsulated in ``soc_pcm_dai_hw_params_at_stream``).
+3. Optionally calls ``.multi_direction_params_fixup`` so the machine
+   driver can rewrite rate/format/channels on a per-codec copy of the
+   params (an 8 kHz / S32_LE V/I-sense codec DAI will not accept a
+   48 kHz / S16_LE playback stream's params verbatim).
+4. Sends start and stop stream events for the opposite direction in
+   prepare and hw_free, so the stream widgets of those codec DAIs power
+   up and down with the link.
+
+Links that do not set the flag retain the pre-existing behaviour
+exactly.
+
+When to use this
+================
+
+Prefer ``multi_direction_codecs`` when:
+
+* the two directions are physically **inseparable** on the codec side
+  (same chip, same wire); and
+* a single open semantically covers both (speaker protection, playback
+  with feedback for echo-reference, haptic/boost feedback); and
+* you do not want userspace to see or manage two PCMs.
+
+Prefer **DPCM FE/BE pairs** when:
+
+* the two directions can be exercised independently; or
+* userspace legitimately needs to control each direction (classic
+  playback + microphone capture).
+
+Prefer a **DAPM supply widget** when:
+
+* only the DAPM power graph (clock, LDO, bias) needs linking, and
+* no ``.hw_params`` plumbing is required on the secondary direction.
+
+Interaction with DAPM
+=====================
+
+DAPM edges are directional and the flag does not change the graph.  The
+opposite-direction codec DAIs' stream widgets are powered by the extra
+start and stop stream events the core sends for that direction in
+prepare and hw_free.
+
+Only ``.hw_params`` and ``.hw_free`` are called on the opposite-direction
+codec DAIs.  Their ``.startup``, ``.prepare``, ``.trigger``,
+``.shutdown`` and mute callbacks are not, so a codec DAI used this way
+must not depend on them.
+
+Machine-driver example
+======================
+
+A machine driver that bundles V/I-sense capture codec DAIs onto a
+speaker-playback BE link::
+
+    static int wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
+                                   struct snd_pcm_hw_params *params,
+                                   int stream)
+    {
+        if (stream != SNDRV_PCM_STREAM_CAPTURE)
+            return 0;
+        /* VI capture chain runs at 8kHz / S32_LE / 4ch */
+        hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->min      = 8000;
+        hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->max      = 8000;
+        hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->min  = 4;
+        hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max  = 4;
+        snd_mask_none(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT));
+        snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+                     SNDRV_PCM_FORMAT_S32_LE);
+        return 0;
+    }
+
+    SND_SOC_DAILINK_DEFS(wsa_sp, ...);
+    SND_SOC_DAILINK_REG(wsa_sp);
+
+    static struct snd_soc_dai_link board_dai_links[] = {
+        {
+            .name                           = "WSA Playback",
+            .multi_direction_codecs         = 1,
+            .multi_direction_params_fixup   = wsa_vi_params_fixup,
+            SND_SOC_DAILINK_REG(wsa_sp),
+            /*
+             * codec DAIs include both the playback SPKR DAIs and
+             * their companion capture V/I-sense DAIs on the same
+             * SoundWire bus.
+             */
+        },
+    };
+
+Notes
+=====
+
+* ``multi_direction_params_fixup`` is called with the **flipped**
+  direction so the fixup logic can key off ``stream`` to decide
+  whether the params need rewriting.
+* ``snd_soc_dai_symmetric_set_params()`` runs after the flipped
+  ``.hw_params``.  The symmetric-params tracking is per-DAI, so each
+  codec DAI records the format it was called with in its own
+  direction; nothing cross-contaminates.
+* The transient ``substream->stream`` flip is bounded to a single
+  codec DAI's ``.hw_params`` / ``.hw_free`` call and its DAPM update,
+  under ``pcm_mutex``.  The codec DAI callbacks see the flipped value,
+  which is the purpose of the flip.  ALSA core paths that do not take
+  ``pcm_mutex``, such as ``snd_pcm_info()``, can observe it during that
+  window.
diff --git a/include/sound/soc.h b/include/sound/soc.h
index f6b98324f346..f12fadb64268 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -749,6 +749,10 @@ struct snd_soc_dai_link {
 	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
 			struct snd_pcm_hw_params *params);
 
+	/* Adjust params for codec DAIs of the other direction */
+	int (*multi_direction_params_fixup)(struct snd_soc_pcm_runtime *rtd,
+			struct snd_pcm_hw_params *params, int stream);
+
 	/* machine stream operations */
 	const struct snd_soc_ops *ops;
 	const struct snd_soc_compr_ops *compr_ops;
@@ -783,6 +787,9 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
+	/* Also run codec DAIs of the other direction on this BE link */
+	unsigned int multi_direction_codecs:1;
+
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ef8ccf52798e..5dbd0a78933a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -986,6 +986,9 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 
 	snd_soc_dapm_stream_event(rtd, substream->stream,
 			SND_SOC_DAPM_STREAM_START);
+	if (rtd->dai_link->multi_direction_codecs)
+		snd_soc_dapm_stream_event(rtd, substream->stream ^ 1,
+				SND_SOC_DAPM_STREAM_START);
 
 	for_each_rtd_dais(rtd, i, dai) {
 		if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
@@ -1032,6 +1035,56 @@ static void soc_pcm_codec_params_fixup(struct snd_pcm_hw_params *params,
 	interval->max = channels;
 }
 
+/*
+ * Call .hw_params on a codec DAI of the other direction, with the substream
+ * direction switched to the DAI's under pcm_mutex.
+ */
+static int soc_pcm_dai_hw_params_at_stream(struct snd_soc_dai *dai,
+					   struct snd_pcm_substream *substream,
+					   struct snd_pcm_hw_params *params,
+					   int stream)
+{
+	int saved_stream = substream->stream;
+	int ret;
+
+	if (stream == saved_stream)
+		return snd_soc_dai_hw_params(dai, substream, params);
+
+	substream->stream = stream;
+	ret = snd_soc_dai_hw_params(dai, substream, params);
+	substream->stream = saved_stream;
+	return ret;
+}
+
+/* hw_free counterpart to soc_pcm_dai_hw_params_at_stream(). */
+static void soc_pcm_dai_hw_free_at_stream(struct snd_soc_dai *dai,
+					  struct snd_pcm_substream *substream,
+					  int rollback, int stream)
+{
+	int saved_stream = substream->stream;
+
+	if (stream == saved_stream) {
+		snd_soc_dai_hw_free(dai, substream, rollback);
+		return;
+	}
+
+	substream->stream = stream;
+	snd_soc_dai_hw_free(dai, substream, rollback);
+	substream->stream = saved_stream;
+}
+
+/* DAPM counterpart, so the DAI's own direction widget gets updated */
+static void soc_pcm_dapm_update_dai_at_stream(struct snd_pcm_substream *substream,
+					      struct snd_pcm_hw_params *params,
+					      struct snd_soc_dai *dai, int stream)
+{
+	int saved_stream = substream->stream;
+
+	substream->stream = stream;
+	snd_soc_dapm_update_dai(substream, params, dai);
+	substream->stream = saved_stream;
+}
+
 static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_pcm_substream *substream, int rollback)
 {
@@ -1053,6 +1106,9 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 
 	/* run the stream event */
 	snd_soc_dapm_stream_stop(rtd, substream->stream);
+	if (rtd->dai_link->multi_direction_codecs)
+		snd_soc_dapm_stream_event(rtd, substream->stream ^ 1,
+				SND_SOC_DAPM_STREAM_STOP);
 
 	/* free any machine hw params */
 	snd_soc_link_hw_free(substream, rollback);
@@ -1061,9 +1117,20 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 	snd_soc_pcm_component_hw_free(substream, rollback);
 
 	/* now free hw params for the DAIs  */
-	for_each_rtd_dais(rtd, i, dai)
-		if (snd_soc_dai_stream_valid(dai, substream->stream))
-			snd_soc_dai_hw_free(dai, substream, rollback);
+	for_each_rtd_dais(rtd, i, dai) {
+		int dai_stream = substream->stream;
+
+		if (!snd_soc_dai_stream_valid(dai, dai_stream)) {
+			if (!rtd->dai_link->multi_direction_codecs)
+				continue;
+			dai_stream ^= 1;
+			if (!snd_soc_dai_stream_valid(dai, dai_stream))
+				continue;
+		}
+
+		soc_pcm_dai_hw_free_at_stream(dai, substream, rollback,
+					      dai_stream);
+	}
 
 	return 0;
 }
@@ -1114,30 +1181,41 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		unsigned int ch_mask = snd_soc_dai_tdm_mask_get(codec_dai, substream->stream);
+		int codec_stream = substream->stream;
+		unsigned int ch_mask;
 		struct snd_soc_dai_link_ch_map *ch_maps;
 		int j;
 
 		/*
 		 * Skip CODECs which don't support the current stream type,
-		 * the idea being that if a CODEC is not used for the currently
-		 * set up transfer direction, it should not need to be
-		 * configured, especially since the configuration used might
-		 * not even be supported by that CODEC. There may be cases
-		 * however where a CODEC needs to be set up although it is
-		 * actually not being used for the transfer, e.g. if a
-		 * capture-only CODEC is acting as an LRCLK and/or BCLK master
-		 * for the DAI link including a playback-only CODEC.
-		 * If this becomes necessary, we will have to augment the
-		 * machine driver setup with information on how to act, so
-		 * we can do the right thing here.
+		 * unless the link runs them in their own direction.
 		 */
-		if (!snd_soc_dai_stream_valid(codec_dai, substream->stream))
-			continue;
+		bool direction_flipped = false;
+
+		if (!snd_soc_dai_stream_valid(codec_dai, codec_stream)) {
+			if (!rtd->dai_link->multi_direction_codecs)
+				continue;
+			codec_stream ^= 1;
+			if (!snd_soc_dai_stream_valid(codec_dai, codec_stream))
+				continue;
+			direction_flipped = true;
+		}
+
+		ch_mask = snd_soc_dai_tdm_mask_get(codec_dai, codec_stream);
 
 		/* copy params for each codec */
 		tmp_params = *params;
 
+		/* The substream params describe the other direction */
+		if (direction_flipped && rtd->dai_link->multi_direction_params_fixup) {
+			int fret = rtd->dai_link->multi_direction_params_fixup(
+					rtd, &tmp_params, codec_stream);
+			if (fret < 0) {
+				ret = fret;
+				goto out;
+			}
+		}
+
 		/* fixup params based on TDM or ch_map masks */
 		if (!ch_mask) {
 			for_each_rtd_ch_maps(rtd, j, ch_maps)
@@ -1148,13 +1226,15 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
 		if (ch_mask)
 			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
-		ret = snd_soc_dai_hw_params(codec_dai, substream,
-					    &tmp_params);
-		if(ret < 0)
+		ret = soc_pcm_dai_hw_params_at_stream(codec_dai, substream,
+						      &tmp_params,
+						      codec_stream);
+		if (ret < 0)
 			goto out;
 
 		snd_soc_dai_symmetric_set_params(codec_dai, &tmp_params);
-		snd_soc_dapm_update_dai(substream, &tmp_params, codec_dai);
+		soc_pcm_dapm_update_dai_at_stream(substream, &tmp_params,
+						  codec_dai, codec_stream);
 	}
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-- 
2.47.3

