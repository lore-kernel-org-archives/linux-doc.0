Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364095;
	b=tBTptzM4NhtMSgSvWC8pqZLxw7FQfkLd+ItTO4IpcSJL9OXBqFmzHsYooBabziERG/KW
	 kDWxD4oQnQz0pTcg+m2MsQ1IdWa+58dQT6PRwH7SPA9e5kwfNKbtsm01Se7d9ask6fjGF
	 s3d+lmQ2DzULTVCFUPoOKvrl3Rl69s5LdzBuiDxB2NY4L9NT5dFnykKZd9pMNN6PtdNNe
	 C8Hde5Ahp8sZVf84q8+gT1m6GrazCsyUmuvSJJnxOXL3L8nG8Y3iyWqVdb4qv+QUbQisG
	 5TEEkHvPkVSxsiCCpGECHoTjfmzZlhAcRtqBdtKEK0UfPNwCENnX+d8TtRpvBWY9+Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364095;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zr6mhKn7AluEtRKKhFoY7jbPMH5R74SCbF/xrFP/Ibk=;
	b=jC8zUwttvLKInrdbnM/Uwhj8embAnNNyp3z89Z7CrjGHqz5rT988/fhaBzFREniHmKkW
	 rcQBKrssmxIDHNqXnl8OBpTrxAWWO/TUtiQ/N83d7PDsnK+VTCVj+a7ircbkQeaKG1JXh
	 qtz3YD6xTq0Wq1tQB44o7DguCbDxh5mHp8Snb7oQivZWHgwxSnyk4KqBLyXaklyqeUiMJ
	 fmnTuBAOIPj8wUjGI7PoiMCgR1ne3z1QFlk83nMc01x1IBmyur+sK1+lt7aT8p7tVYNVc
	 SJSrM/UvyLAVutn0zWQQapXIAO1VSpzw1fWgrhiYxS7f4MId7QDUwK/2b9thaYL453g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K14VMt1f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUnpyoNt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD38606A6A6
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD38606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K14VMt1f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUnpyoNt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQSCS3382503
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zr6mhKn7Alu
	EtRKKhFoY7jbPMH5R74SCbF/xrFP/Ibk=; b=K14VMt1fDcmAWUXUYXK15fcW0CL
	GrOh/66UJSZyG5PIgMYe0m9V3tAiKthN0QomaIZuP+sjlmWXl+tE/inPiRAxCHNH
	mPMroMVjauFsojkknW8XmRh4e3PkeZ3aaxF3s2XRzFBJM3KzIHsxffU7y7WSUJ0N
	vibkV1aUReKemwR4UxNxSpa6Eu2sS945ObrsVnx91JMLZUDjeMwTElBTyXvT1wjk
	RAlCywSCRoVx+8f3DDywfobRZXY7pxTjuHKsVNqOYjoNFdlTugU7w79VTxnK2OEV
	KK6IMDURow7kmhW7Zf8HTSpPB3STXLwFvzyevyC38fAn8/c4vFrwWZ3WUSg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so536326385a.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364093; x=1795968893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zr6mhKn7AluEtRKKhFoY7jbPMH5R74SCbF/xrFP/Ibk=;
        b=DUnpyoNtJPdq92RTrn+fuxyKZasQ59HZowbQBOy9a0TU5MPVQZtG2zlYbSO7KHKUHR
         wV1IyOEQOhAve3OUivfEXKFxZvBwpnmAi5o28BbTX/jwaGNYP7xMT3rkeYOCf3GrQaZJ
         iYlBxlhBAv8lRsrS3nQ25w/aT/pz8gySBEVJhq+oAXFVcqxKzTbDwZLobca+oHPDm5U4
         xV60OSzALt5dWJPQaH293yExLyC1i/hHXC4NleEH/VDaUxAKyFALNtDWVoSP0BWgYgjB
         gT95AUtGYP4OS4exdgFKLlZR5iThrNYISLSxjp0Wi9Y6vS6+USNv6+s9a5EUfLOpfoFc
         SDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364093; x=1795968893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zr6mhKn7AluEtRKKhFoY7jbPMH5R74SCbF/xrFP/Ibk=;
        b=SUb0x0aXGMwCDLgTvaNOZ1nTOYkFUWJXNqvMltCj412PW21bnVe9ZIOqs3bcsRXuKs
         4JFD9AHmijjqUVf1bB/mn74UNma//ggpxWGWdcv8Jg3xDnj6SJAfUeT06UZEorZ5OySU
         0f0GWWY38kW1wk9ReBJWconjccvLu0DzUyhcxDLUhyphRPDUziLQNbAJsZSncx5xlWbP
         ZkWea6bpTyDTq1guaHdawaURrI+NEO9unTZpLuxLQSLVCKRy74lafIfvIghk3P7tC28n
         EaqqqQdJZ4gnkxSLjKe0RYolh2xGmtbk9KKqxysk842IGEoMxIeIQHfab1NR2EttVig+
         Alhw==
X-Forwarded-Encrypted: i=1; AL+hErFCWZCuFAPExMNtESaeOhpgZ6UxRtc9ps6bA0nvCwDaj/8MHXCVz1kTjMJJXarkeMS8349UDIEi+I0=@vger.kernel.org
X-Gm-Message-State: APuU4Z//aKSuXyb02rVJAYDbiRv4Z5dJGVUA3WgBv107CkMI1c1sEKDV
	vxUbxCSbb1ZwftJO3yXjkWxPzD1oHJnRI7Epj8fVz32572sP8y2DyUAOtpDUdbidbe7QS1m6O5+
	6m6I69pjMzhxKoBg7NHIyZl1fBR8DiES8FruY8ULDQzmR3XoDT+nCZ8O2MNY0M9E=
X-Gm-Gg: AZFdTZfE9eWRGk1pf2k63/kIwQH5q61ko8ZzQqvCFzqVVD2LSDN15I+mi15hcr2nwJE
	cfu5a9e/7u8UXxBduapbU7Cv0/OHGKYW2GBOyVLYEUY/LpDQ7WzVBE3iX/AkzbQYlf+dcOdXdZ9
	zCQ2OiCIPyTClvVEIq/UfXITTaoENY5xi6ZmkbSmsWKvtL3AbP0lPuEk6Fj4rYF1/K5NzJk8va7
	pCZ0ZUehjz11VBbVIhPmYIzmgHWWv0V+937sSrqSjifeVlgTy0sFUpFUsiA5pU4yGAKOFRWwCVd
	PPjFpKVjZModR8ab1w5D8BwZubihlpEtpZJT7C75XSfG6t3U/Tgrssb+V+Bwl/SbZeBkMig804n
	Az/AH+evcXtht1yreV0KK5YsMdUfhppxx/WBIEGKs/XfdYe3jN/067E1slXDxX1/6
X-Received: by 2002:a05:620a:1996:b0:949:4a96:aec7 with SMTP id af79cd13be357-949ba95e8ffmr1485539685a.28.1795364092874;
        Sun, 22 Nov 2026 08:14:52 -0800 (PST)
X-Received: by 2002:a05:620a:1996:b0:949:4a96:aec7 with SMTP id af79cd13be357-949ba95e8ffmr1485534885a.28.1795364092257;
        Sun, 22 Nov 2026 08:14:52 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:51 -0800 (PST)
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
Subject: [PATCH v2 02/24] ASoC: soc-pcm: add multi_direction_codecs link flag
Date: Sun, 22 Nov 2026 16:14:15 +0000
Message-ID: <20261122161437.5994-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b0314fd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ydLYoo5a1XT2-liKb_8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX8TEQQMd7Ahyo
 C6eF3lImjobRDJ6KxNcHWkzBKUi5cGwooDInsQbOakAOZlbTEcaLRahes88Od7expCjckpAeMTX
 7t6iGMp5uNi0Leacfzix0x8zq6XCUFE=
X-Proofpoint-GUID: _Ji65AGWghYEr7XMzx2EfwINCSS7oNiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX+6NCdqzA/H4R
 nDkuj2L5+lAd5l5CytT1ddPiWGgHiTP2Aw0NRJIlYVhx2soZVRqCHB593Iv0ALkUkIrf2g5rYX9
 GzcCOLQGgjVjEOqnZlhjynHxPfqtfLG+UWw8vFpffgxL8MAs1zBRTiuyKqvnbkvAQRb92zcdUOv
 +tnZjcNJR7sj3GjAQvW8+Kur9P/YFfI8+7EE7opErP7qNh7S4qx6Lr84sHtS0u1TWQRJQaTD6F/
 MQ3UIYOqEFe01NG03Lr+Gr1FPhPaOfzbJ0VMdrgiX+HLYtVmu6FReeEtoy+3M+yZqgknVUXbKEa
 dzCAuTGKEGlPbvstGMP7+aO5sSenvfp99yqnjW8gUQLCejSnYirgfFpPbg1shudHAWhwo1hPFP9
 jK/8UuxZlCAreKHOu0EZPtQcKVVfrMnj5YJa90NocTfCC7B+SRpTZjWQfBXA5uVEIDPWzlMPN0R
 mhbvg+efC5zkkcAXr+A==
X-Proofpoint-ORIG-GUID: _Ji65AGWghYEr7XMzx2EfwINCSS7oNiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

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
 .../sound/soc/multi-direction-codecs.rst      | 156 ++++++++++++++++++
 include/sound/soc-dapm.h                      |   2 +
 include/sound/soc.h                           |   7 +
 sound/soc/soc-dapm.c                          |  32 ++++
 sound/soc/soc-pcm.c                           | 136 ++++++++++++---
 6 files changed, 314 insertions(+), 20 deletions(-)
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
index 000000000000..2af61598dd7b
--- /dev/null
+++ b/Documentation/sound/soc/multi-direction-codecs.rst
@@ -0,0 +1,156 @@
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
+Ordering with other fixups
+==========================
+
+``multi_direction_params_fixup`` runs per codec DAI inside
+``__soc_pcm_hw_params()``, after link-level params have been settled
+and after each codec has its own copy of ``params``::
+
+  snd_soc_link_hw_params()               /* machine driver .hw_params */
+  be_hw_params_fixup()                   /* DPCM only, applied by FE */
+  for each codec DAI:
+      tmp_params = *params
+      if direction-flipped:
+          multi_direction_params_fixup(rtd, &tmp_params, codec_stream)
+      apply ch_map / TDM ch_mask narrowing
+      snd_soc_dai_hw_params(codec_dai, substream, &tmp_params)
+
+The fixup sees the stream's params after link / BE adjustments and
+may rewrite rate, format or channels for the flipped-direction codec
+DAI only. It does not affect the originating stream's params or
+other codecs' ``tmp_params``.
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
diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 33c4a3e9c1d4..90e527406a54 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -661,6 +661,8 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 
 /* dapm events */
 void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event);
+void snd_soc_dapm_codec_stream_event(struct snd_soc_pcm_runtime *rtd,
+				     int stream, int event);
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
 void snd_soc_dapm_shutdown(struct snd_soc_card *card);
 
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 338662645b42..87c6339373c5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -747,6 +747,10 @@ struct snd_soc_dai_link {
 	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
 			struct snd_pcm_hw_params *params);
 
+	/* Adjust params for codec DAIs of the other direction */
+	int (*multi_direction_params_fixup)(struct snd_soc_pcm_runtime *rtd,
+			struct snd_pcm_hw_params *params, int stream);
+
 	/* machine stream operations */
 	const struct snd_soc_ops *ops;
 	const struct snd_soc_compr_ops *compr_ops;
@@ -781,6 +785,9 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
+	/* Also run codec DAIs of the other direction on this BE link */
+	unsigned int multi_direction_codecs:1;
+
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3ef13d2b1f5e..4bda3e5b930d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4670,6 +4670,18 @@ static void dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int e
 	dapm_power_widgets(rtd->card, event, NULL);
 }
 
+static void dapm_codec_stream_event(struct snd_soc_pcm_runtime *rtd,
+				    int stream, int event)
+{
+	struct snd_soc_dai *codec_dai;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai)
+		dapm_dai_stream_event(codec_dai, stream, event);
+
+	dapm_power_widgets(rtd->card, event, NULL);
+}
+
 /**
  * snd_soc_dapm_stream_event - send a stream event to the dapm core
  * @rtd: PCM runtime data
@@ -4691,6 +4703,26 @@ void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 	snd_soc_dapm_mutex_unlock(card);
 }
 
+/**
+ * snd_soc_dapm_codec_stream_event - stream event limited to codec-side DAIs
+ * @rtd: PCM runtime data
+ * @stream: stream direction
+ * @event: stream event
+ *
+ * Variant of snd_soc_dapm_stream_event() that only targets codec-side DAIs.
+ * Used by multi_direction_codecs links to power up/down the flipped-
+ * direction codec widgets without altering the CPU DAI's direction
+ * tracking.
+ */
+void snd_soc_dapm_codec_stream_event(struct snd_soc_pcm_runtime *rtd,
+				     int stream, int event)
+{
+	snd_soc_dapm_mutex_lock(rtd->card);
+	dapm_codec_stream_event(rtd, stream, event);
+	snd_soc_dapm_mutex_unlock(rtd->card);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_codec_stream_event);
+
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream)
 {
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ef8ccf52798e..cff34a6135a8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -986,6 +986,13 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 
 	snd_soc_dapm_stream_event(rtd, substream->stream,
 			SND_SOC_DAPM_STREAM_START);
+	/*
+	 * Only flip codec-side widgets; CPU DAIs must keep their recorded
+	 * direction so later state that reads it stays consistent.
+	 */
+	if (rtd->dai_link->multi_direction_codecs)
+		snd_soc_dapm_codec_stream_event(rtd, substream->stream ^ 1,
+				SND_SOC_DAPM_STREAM_START);
 
 	for_each_rtd_dais(rtd, i, dai) {
 		if (!snd_soc_dai_mute_is_ctrled_at_trigger(dai))
@@ -1032,6 +1039,59 @@ static void soc_pcm_codec_params_fixup(struct snd_pcm_hw_params *params,
 	interval->max = channels;
 }
 
+/*
+ * Call .hw_params on a codec DAI of the other direction, with the substream
+ * direction switched to the DAI's under pcm_mutex.
+ *
+ * Only ->stream is flipped. ->runtime is not; codec .hw_params callbacks
+ * on multi_direction_codecs links read from @params, per convention.
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
@@ -1053,6 +1113,10 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 
 	/* run the stream event */
 	snd_soc_dapm_stream_stop(rtd, substream->stream);
+	/* Flip only codec-side widgets; see __soc_pcm_prepare(). */
+	if (rtd->dai_link->multi_direction_codecs)
+		snd_soc_dapm_codec_stream_event(rtd, substream->stream ^ 1,
+				SND_SOC_DAPM_STREAM_STOP);
 
 	/* free any machine hw params */
 	snd_soc_link_hw_free(substream, rollback);
@@ -1060,11 +1124,30 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
 	/* free any component resources */
 	snd_soc_pcm_component_hw_free(substream, rollback);
 
-	/* now free hw params for the DAIs  */
-	for_each_rtd_dais(rtd, i, dai)
+	/*
+	 * CPU DAIs go through the unflipped path only, mirroring
+	 * __soc_pcm_hw_params(). Only codec DAIs can be direction-flipped
+	 * on a multi_direction_codecs link.
+	 */
+	for_each_rtd_cpu_dais(rtd, i, dai)
 		if (snd_soc_dai_stream_valid(dai, substream->stream))
 			snd_soc_dai_hw_free(dai, substream, rollback);
 
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		int codec_stream = substream->stream;
+
+		if (!snd_soc_dai_stream_valid(dai, codec_stream)) {
+			if (!rtd->dai_link->multi_direction_codecs)
+				continue;
+			codec_stream ^= 1;
+			if (!snd_soc_dai_stream_valid(dai, codec_stream))
+				continue;
+		}
+
+		soc_pcm_dai_hw_free_at_stream(dai, substream, rollback,
+					      codec_stream);
+	}
+
 	return 0;
 }
 
@@ -1114,30 +1197,41 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
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
@@ -1148,13 +1242,15 @@ static int __soc_pcm_hw_params(struct snd_pcm_substream *substream,
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
2.53.0

