Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364092;
	b=dZ5KjI8uXZppdjCriK9swnHRoQCvnuIcfnOX30+isC4xIcI1zvTICSLpGEO9kYmEuhPp
	 Nwxv1qLyP8gUrmLyPxRy8HSJReAagL3V5QfjlT/IGjrhCP1EQmZblZoaLjooas6cFwl/P
	 /c7VNHr2l1P+kiubCKczF31ZmarKLYqDsG3/k/RRgrXYRtIo8EbXGb4udmylVE2gVLOYL
	 sLmIkZTqpqTUAVYdTUtW7qyuR++//M1H58XlkCdgYtnNBsmmmCL5ar4V0a3MEpHyv3iN9
	 8koEI+ysFdYoECySNMOrnwjzEltyhHhaOoz+YEt3+LtI6DwnQqRQ6JIuzJYRXpN4zIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HKL7pXgslxzbEKC+b2t19QxrZtoW1f1sxCMS7fRY90s=;
	b=1m9OiSJGjBuKfeW5jw6guxUFRmb13tttf9qau1yGVyas1OKJ8OD0R0WnW7FKVPzGTgOg
	 wJJLAW2J1ujmGZPjSU+IfE4ClwaX8uf1hYKDZw5En8C14XuBgfkp9yvIlRO9DVM5rItLK
	 W53g582TbSKa0qiHDPVdX6q1Y60tAyPh74G9rlZiYLCbxvVJZYDSFmbeJ+aA/3n83NzUl
	 iro2r3ovgEFq/EDBosAMG3PNX9kRmec/jpb5fTTgn3LZqQqlOht7NfpTmkq45Aw5HEKCl
	 ON9sjy+GaduDI9qb+SNn2DENtnQepuIYN129NjITIR4bxXmCH2Vu59GRRJ++0Le8e6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GEOV7+fA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ak29ljAl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C104606A332
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C104606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GEOV7+fA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ak29ljAl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQnW63496596
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HKL7pXgslxz
	bEKC+b2t19QxrZtoW1f1sxCMS7fRY90s=; b=GEOV7+fAPT/JX5zd9XudldeXeNF
	iCTPhCJK12Ue6HmJCdfTV0dopwqd23opyWAMgsgJI6MxJ43HymZuWDk66yeJePrq
	L+Zqt1MYVVHcp5QX4fHTK51OaoclzrUyF3q/zDFvqCcGz5uclYV7ycMkoQXsxFN+
	6lTw7D9VNuA3HM5H1xLRRofbHSDDEsfgsIumynGM2BNzv79cv6zKLrdeL0x+/eJd
	vcgFL3jB3hautRdLpuSfkAmBZzTIh5TZ5bJTHK9b0ILmD99GiaGw7ekZO5CHhnup
	+cTcN0rBm0Mml0Jk9aSUvSCPa6M4BQCibrpiss0ms16ULtLi3CH2JOpXFYg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgbtt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso374601885a.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364090; x=1795968890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKL7pXgslxzbEKC+b2t19QxrZtoW1f1sxCMS7fRY90s=;
        b=Ak29ljAlyJLiqa7kFoEs+ql2mckk7hTwbpGmTdYgp2meONogEt/eWABhI9VDiY6C84
         fkIiXhQyHhx/Qve9+QLYz9baPhOW0YS6DBlzvY3cmTxiXvqpYg9XSYXC2UJsoi0lX0im
         eXVZAbpibb33bzuDBLZOk2bbRzDwOVXciSU/NdCmwQ6L0gKgLoRmneX0hsWl8Rqy2hDk
         /Zlrx1inzgI6b3ERuJlqWB7SeycZqOdER3NBzgM5CnomaLLXom4LGI3YQF2jU+jsj1po
         0idKJ0qVfGKSzQSBG6SDT5UPykd1D+tGE23naa43tZ+na0a8quMoVViegIN6x0z0PFuW
         i2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364090; x=1795968890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKL7pXgslxzbEKC+b2t19QxrZtoW1f1sxCMS7fRY90s=;
        b=N9gTJ6kVmr1GQV/PvDgIQqyRLxi5bEw/V4WJ8a8govV2hbQxQqWJCwv9LIT4okw4I3
         27IQCzbBz2EtNrz89WOBhXFHWCPWbFb0cSbS7icCrgMv3EVW5OUSBdaoIZgPNzqAMVuc
         KifnaMMPT9xcq1RUjj+D/Lp9vKDRniJ4eNu1rTCtq8gz9CB2NBkpPW4GOEYWfjLnMypx
         rJOI+qEuLe1Xo6kbySx547LBAZ6LIGpPy6cpOWJP3XpPYhlml56/v45NV0IO2Hj5D/cO
         l/upLOnDtJb7a96NfYGkLSlUiU9sasADmm9NB4C8m62VWAdTncO6499fR8p241g/R4gK
         G3Iw==
X-Forwarded-Encrypted: i=1; AL+hErHmbwjamHN+gSkr/V7+jzYyGuTk1kJ67GLyPf2B6XZJB4QV9zY25rDORfbQFLtdS2X/rTRbG/pyD5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l8+SXOQ+cHGgqjGJe3EiklkVY4JJTu8fPNSRqloD5fiMZgE3V
	NJ/WHHvTXbd/WzOGbmHsCw++z9k2II2jlzOSCR28YBEVgfWFSUT86iyay7f1LJUhdzA+uYg4j5C
	XVdkkyBD3cQY2yfJXH/wnGukpm9UXB1L1JsR0GxkHJfbK1CgWo7/kkqTfEM6EAr4=
X-Gm-Gg: AZFdTZdAF6sLb5WfYUIO0TRX5G9MMLtp85K++P791nSTRkVwfrrY5AxSuq73KB0LXZU
	yDt5ZNQb5BWP4uC1i7SwgcSvEQmtQoYRuYqLitwdm4YoHbiDdtPTvzjvOMqf/2s7M0H+m52JbuS
	UqHdPbr0dMbsqwjUo+sbbFO83QWXHr2HQgkWivi6Sdil9Dr3sDmpuzZeyneDIV20UxK2/zbZCm8
	XTziekTWN1CxFJMch1/moULVnZDcDiIR9zIolpbOArr9yUlGoJOBtjRXCVieUtXiwVIg0QSmJtY
	fZ/gHQn7e5ExKScbI6aqP8V+qUKeDMTtIEzYAKx2E/d8QVI6n1VaM9zWSde/FxcoGAvplOefjpo
	w67cTbAYp/S7UgIbB0IqatcHi6QJlrNAKkJUIqxyw9+/CWTT2VMMQdX1YZALSLSOd
X-Received: by 2002:a05:620a:6846:b0:93e:c12c:9b71 with SMTP id af79cd13be357-949bab6416bmr1407655085a.76.1795364089675;
        Sun, 22 Nov 2026 08:14:49 -0800 (PST)
X-Received: by 2002:a05:620a:6846:b0:93e:c12c:9b71 with SMTP id af79cd13be357-949bab6416bmr1407650685a.76.1795364089135;
        Sun, 22 Nov 2026 08:14:49 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:48 -0800 (PST)
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
Subject: [PATCH v2 00/24] ASoC: qcom: AudioReach Active speaker protection for WSA88xx
Date: Sun, 22 Nov 2026 16:14:13 +0000
Message-ID: <20261122161437.5994-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX+DpyMhaR13AN
 WKoh0eQBcI6xAU4zUpA37lYunxdsNpSe5135Rv+Ks6JXJssrRdNRflk+JaaYM+z4g71DZqwy99T
 Z22XlOwKbCyCSjxzN6XrlGF4y1O/7KOwM6lRbLn8B7bcKY9BzkCs9tYN3BlCgp5ffuarXKN+Cah
 4mdXdAfGwnd1RboN3jTIO+5nL932ebPIa2OFl0xbuMArGYyVpHB4XEJV+zmZu+LzSY5aQgQI/rN
 jhsyZUoU2DgdaW02g6YQJxluo3IMhT/oVTuf8J+h9ZfZ6HgKW59IPvkzEmC9idGSbcmCHiX63BN
 amMVDBmwEpYPnXt5hrJHOtdfw7vJn3B/1xXhbqpcxDwO8jcEGMfB+9BqgrB65a+l1WXOqr0QGRY
 GptO9puolcVkStSyCDVfrBiHRkxlSQr8kzasJNF0QYsVr4WnpLxDyQoT4DkJd8XqypGZds1t/u9
 p5c1eDglrb7N3G84qAA==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b0314fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=w_6aJf39JUbkyodHB6oA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwYqe4f+l5fQ0
 8IfUJ/VLG4E/F32VdFq+6QyBYwIZZkIme/yI2AGTWI8o2A/PrfmPCvl5iDPGCUWYZF83lDuuDZb
 RsMoriDTxkoMBO5f6spNk9EsKuhFFiU=
X-Proofpoint-GUID: 6gU9J4Ur6PSu_baksJMMKUn5KmgWfXyf
X-Proofpoint-ORIG-GUID: 6gU9J4Ur6PSu_baksJMMKUn5KmgWfXyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220064

This series adds DSP Active speaker protection (SP) for WSA88xx speakers on
Qualcomm AudioReach platforms. It was tested on the Lenovo ThinkPad T14s
Gen 6 (2x WSA8845), T14s Gen 7 (2x WSA8845) and the Glymur CRD (4x WSA8845).

Speaker protection needs the amplifiers' V/I sense capture running
whenever the speakers play. Rather than a separate capture link that
userspace has to keep open, the VI codec DAIs sit on the WSA Playback BE
link, using a new multi_direction codec-codec link flag that makes the core
run .hw_params/.hw_free and stream events for codec DAIs of the other
direction.

 - ASoC core: default ch_maps for links with more than 8 DAIs, and the
   multi_direction_codecs link flag (documented).
 - qcom sdw: per-direction stream runtimes on such links.
 - wsa883x/wsa884x: VI sense capture DAI, die temperature as a thermal
   zone.
 - AudioReach: control links, VI calibration run with per-speaker
   events, R0/T0 cache and restore in normal mode, static cfg blobs,
   mixer controls for status/R0T0/live T0/calibration state, and a
   "Speaker Protection Calibrate" trigger to arm a run.
 - x1e80100: VI feedback on the WSA Playback link, speaker thermal zones.
 - DT: VI feedback for glymur-crd, mahua-t14s (Gen 7) and x1e78100-t14s
   (Gen 6).

A topology with the SP and SP_VI modules is needed to use it.

How it works:
1. The topology puts the speaker protection (SP) module in the playback
   graph and the SP_VI module in a VI feedback graph fed by the WSA VI
   sense ports, joined by a control link.
2. Starting playback on the WSA Playback link also starts the VI sense
   capture (8 kHz, 32-bit, one V/I pair per speaker), so the DSP always
   gets feedback while the speakers play.
3. Calibration, once per device with the speakers cold: userspace writes
   "Speaker Protection Calibrate" and plays silence; the DSP makes its
   own stimulus. The VI module measures each speaker's resistance (R0),
   the driver records the amplifier die temperature (T0) with it, and
   "Speaker Protection Calibration State" reports the result.  The mode
   auto-returns to Normal on terminal state or graph abort.
4. Userspace reads R0/T0 from "Speaker Protection R0T0" and saves them,
   e.g. with alsactl store.
5. At boot the saved values are written back (alsactl restore). In
   Normal mode the driver sends R0/T0 to the VI module, and the SP
   module uses the live V/I feedback to keep each speaker within its
   temperature and excursion limits.

How to test (card 0, two speakers; for four, use aplay -c 4):
1. Boot with this series and a topology that has the SP and SP_VI
   modules, and select the speakers as the output so the WSA path and
   the "VISENSE Switch" controls are on. Stop all playback.
2. Play one second of silence so the amplifiers have been on once and
   "Speaker Protection T0" reads a valid temperature, then wait for
   DAPM to power them down (about 5 seconds):
     aplay -D plughw:0,0 -f S32_LE -c 2 -r 8000 -t raw -d 1 /dev/zero
     amixer -c 0 cget name='Speaker Protection T0'
3. With the speakers cold, in a quiet room, arm a calibration and keep
   the graph running with silence; the DSP makes its own stimulus:
     amixer -c 0 cset name='Speaker Protection Calibrate' 1
     aplay -D plughw:0,0 -f S32_LE -c 2 -r 8000 -t raw -d 15 /dev/zero &
4. Poll the state until every speaker reports 4 (success); 5 (failed)
   or 7 (timed out waiting for V/I) means retry:
     amixer -c 0 cget name='Speaker Protection Calibration State'
5. Stop playback and read the result.  R0T0 holds R0 in Q24 ohms and
   T0 in Q6 degC per speaker:
     amixer -c 0 cget name='Speaker Protection R0T0'
     alsactl store 0
6. Reboot. alsa-restore writes R0/T0 back and every playback runs with
   protection in Normal mode. The kernel log shows the values, e.g.
     SP ch0: R0 3.102 ohms, T0 45.000 degC

Changes since RFC:
	- addressed Mark's review comments on ch_maps (clear
	  dai_link->ch_maps on devm release) and on
	  multi_direction_codecs (codec-side stream events, scoped
	  ->stream flip, symmetric hw_params/hw_free, ordering docs).
	- split qcom sdw patch into the snd_soc_dai_stream_valid()
	  export and the per-direction rework; added wsa883x VI DAI
	  for T14s Gen 6; wsa884x VI DAI has its own hw_free/ops.
	- replaced the Normal/Calibration enum with an edge-triggered
	  "Speaker Protection Calibrate" control + 60s watchdog, so
	  alsactl restore cannot flip the DSP into Calibration.
	- x1e80100 VI params fixup: also pin channels.
	- moved DTS patches to the tail.
	- tidied up the VI calibration commits so later patches do
	  not undo code introduced earlier.
	- dropped RFC tag; rebased onto next-20261120.

Tool use: an LLM coding assistant (Claude Code with Claude Opus) was
used for some of the patches in this series, to debug the bring-up and
to draft the code and commit messages.

My wip trees (kernel, topology, ucm):

https://github.com/Srinivas-Kandagatla/linux/tree/glymur
https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/glymur
https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/glymur

Ravi Hothi (11):
  ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
  ASoC: codecs: wsa884x: add VI sense capture DAI
  ASoC: codecs: wsa883x: add VI sense capture DAI
  ASoC: qcom: audioreach: run VI module in calibration mode with
    per-speaker events
  ASoC: qcom: q6apm-dai: add S32_LE format support
  ASoC: qcom: audioreach: cache VI calibration results per speaker
  ASoC: qcom: audioreach: add speaker protection calibration trigger
    infrastructure
  ASoC: qcom: audioreach: send cached R0/T0 to the VI module in normal
    mode
  ASoC: qcom: audioreach: send static cfg blobs to speaker protection
    modules
  ASoC: qcom: audioreach: add speaker protection mixer controls
  arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback

Srinivas Kandagatla (13):
  ASoC: soc-core: always allocate default ch_maps
  ASoC: soc-pcm: add multi_direction_codecs link flag
  ASoC: soc-dai: export snd_soc_dai_stream_valid
  ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction
    links
  ASoC: codecs: wsa884x: register the die temperature as a thermal zone
  ASoC: qcom: audioreach: add control link support to graphs
  ASoC: qcom: audioreach: pin SPEAKER_PROTECTION_VI media format
  ASoC: qcom: audioreach: add live speaker temperature (T0) readback
  ASoC: qcom: audioreach: add speaker protection calibration state
    control
  ASoC: qcom: x1e80100: carry WSA VI feedback on the WSA Playback BE
    link
  ASoC: qcom: x1e80100: register WSA speaker thermal zones for speaker
    protection
  arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
  arm64: dts: qcom: x1e78100-t14s: add WSA speaker protection VI
    feedback

 .../bindings/sound/qcom,wsa8840.yaml          |   5 +-
 Documentation/sound/soc/index.rst             |   1 +
 .../sound/soc/multi-direction-codecs.rst      | 156 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      |  20 +-
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  11 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  18 +-
 include/sound/soc-dapm.h                      |   2 +
 include/sound/soc.h                           |   7 +
 include/uapi/sound/snd_ar_tokens.h            |  13 +
 sound/soc/codecs/wsa883x.c                    |  77 +-
 sound/soc/codecs/wsa884x.c                    | 165 +++-
 sound/soc/qcom/qdsp6/audioreach.c             | 818 +++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h             | 105 +++
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  16 +-
 sound/soc/qcom/qdsp6/q6apm.c                  |  42 +-
 sound/soc/qcom/qdsp6/q6apm.h                  |   1 +
 sound/soc/qcom/qdsp6/topology.c               | 313 +++++++
 sound/soc/qcom/sdw.c                          | 225 +++--
 sound/soc/qcom/x1e80100.c                     | 100 +++
 sound/soc/soc-core.c                          | 101 +--
 sound/soc/soc-dai.c                           |   1 +
 sound/soc/soc-dapm.c                          |  32 +
 sound/soc/soc-pcm.c                           | 136 ++-
 23 files changed, 2159 insertions(+), 206 deletions(-)
 create mode 100644 Documentation/sound/soc/multi-direction-codecs.rst


base-commit: 9af49ea13d5e2fa82c0067e48a135d7c6cac5825
-- 
2.53.0

