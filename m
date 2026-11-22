Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364097;
	b=ycnAcAdJYrYFEQ9J1HdfcMvXbU5sp3fsAzVRfTBhyDjGkRlZAJkvlpg1zgyrUQjxmFVZ
	 Xe+FTx3cw5nqV4/3/LT/IVVOOJRecbqvTzkfBcQspO8O4SfkV++izaxYkvaWBWrVBZsZs
	 8LY5CRlW11nRvYJlTniyzMfzoXnCoe4HdQC9PKMmfDjRbdFpcXgOPS7x9raQE1m+QNLrx
	 /TuJNuaUnEf39mxaqo4RsHqqrZc3k7qtEqcZ6iH3diAn8NEfnmtnFx/Xd1i+yBy1Fq6vt
	 mMBmrm0nJKQePQfG7yXDsBel4VNGvRQzj+Xiy8ep7lJXypeQRlz5Vd3rVqYDKcoqvAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
	b=w8OigiZLm0S3gsEKW6sr7p3YW0aD40jaU0eyAp3iP/Yc+oyz4SL1nzqycdVJXWbv4YHs
	 eMuHzgLmqtgtZab8vh8FS+EEGUCcrAB0XlalAC6jDtnKjlaTr9e/c6i9MV/2NIkcxQwra
	 vJLzBlJcXAjdFY6754fGhS01vL9u6deGQmn0lbMqqIc9jAcXqoKwjWrbLXzm1D8FuzdZa
	 WGw01LYVRjpx23r2PDC+lxnNFcGKB1vN2o9HdIcpOTt2ZSDNoFkST9XR3pNSwFrcdFhHo
	 gBh+8M2eUm/a7ZvgwrO1eFgnGcT8GfdlIaAAM/17FPyD2KCyyl4yNZVo6UUPQ7pvdpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D1D606A6B0
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D1D606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQbjE1855194
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FZNFp9/0dkT
	sTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=; b=EQRtFRUA42GVrHwo0ldgQX4I3GA
	PAZx8Os3MMJfGEcsywP+egPL4DbHxJYUAmZgcDzK7sWLMMPnbJEG542RgH5Tw54z
	NAlON/htb8L4E1TF+hopzK9kjf2wBDjsetwXs7DkRN4KytENZf80qNO6cl0mFC26
	Ohao35go4UajhGtLaPIKj/se7cSCncqrizmjy8agWQqBcCWypUMFvybR355Jl+C+
	xqv9yOUTjGTQQDaEDHZvKz/GXxR15WM+31vlZUHh+mzMkuoNB+Pj8iaXjz/9YM+T
	rMjx9y8Rx4X/i6xltwPZ1HLlqYuvhctKkL4fkMf5pLcrfe7pN+sPHDI+IVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv3xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944138ed63fso374607785a.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364094; x=1795968894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=QGv1bW25xC33LD76O50/YzWSkmxkQd/HhumnuKIFW67bE+j6l5+v6Qo7jOJc246tAf
         7nYLzkFdI8h2nNwUoThw1wyYziVnHQY56OSkjFBtEWZnb50ALHXOZM8VFxE0vkcm6Ap0
         trCbOjf9rRmL8GlyjvPd6JVeznMXxbrPDIQavEkftn/RHg3N1IWvHqCEz0sfzT1UOrRu
         Sdvlz1KhZImwgjvHmmx2sJx2u+0WKKC2L/QoQDWmW5kYfJgh/dpaHH+LPWIjLe0JrKnI
         jF12kfiDjbRE54kXIrqSbbcZLRTawbslKcf6/7+agYeqfLKcjRBCo+43wpPOJnj5VjM8
         FHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364094; x=1795968894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=U17aq0WynTyB4ZBmUN0J09x1HgVCIFp2oXsKmUhuVCVMoGlJgjx+JVV0hNaSxXCY6K
         3DA6uDdRtc5MiIUiLRcak3O6ZPwlhty8vBoMq8pfQjnzBr4tw7BON3ekoXDA6pn7BmEj
         IW26UuvyqcP5rLIt8Pqu7Vr4wmkhSHIShbLLYfG+mWMphXjoNRPq4SyT5hkvMRf4cMvs
         mHQotnFBLLeH4lfY75NTqFAuewXRi+AFm/xMCmFpIG1w3yvXGZSA0Q3hDw1YToCF9Pdv
         vkAZ8I65hsGIIFNW3w5SyrkGIfPuAUL/Klzg7RaXJnXooVuVBjWpxeMqPw2vl0lrmMfz
         bMlw==
X-Forwarded-Encrypted: i=1; AL+hErGy3jdD2Py5R7EttQivXHzbyIuJqWE49BMztJ7yehhYMLHgGC1SCTSj7WfNzRrA5k0na8U/MdE6Oy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FrVyoCxn/wXpOIBaEclTAUYMTIhneK8Yy/C4jSj6FumQ2VPkP
	BMCeLeFsxxdGbvcoFBAPukH/OZE/OE3SsPZuJEcgRNY5CHqu3F5MnEthe8G77XMnttD4mfotmgF
	P9S6yw2jCs/hyIP8h7TlAfrFO342ZtwWbOcxrSc9PVKyeTqUMHPyTNcXHQuaEP6c=
X-Gm-Gg: AZFdTZe5kq2yNcZeqHT6k80xeHtm8+nr/v4DSdE+wywj4KJJY7984ql4sj6fM6Bxi2X
	ruMb3akuCFeNMxxUJjkktYGSa/M7bDBBZzAEPrPolOaFM1cxjl3N0+s+0A8Q1gjS9b5hDXPC1k6
	m/49/Nsu6jots9j+1lHobPpT0ttZ4Jk+WJ34dqVEaXVZuYghGgwSt4kt3ZW0ALv8EE9aN5R6Jlj
	A2zcHPwcPqRmxwxa+zJyrpFUok7ZHW8uYBbdi1fchvLYE8ZkO7H0+vsyYxxhLRxpI108lyDb3YR
	A7ay4qgHwDAHNZhtUv6RflQVDCxykdbRV7JbmwCuVNvK/dPISTQ+HnPJAbgYaP2VM3Ztp0kzymW
	5Jo7sdZWrQ0ktgr5BrICmCZD8po/cizcP43bRoL8PJiTwH7YvqbxZ3ntAu5QjX7Ge
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412218885a.0.1795364094269;
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412216185a.0.1795364093887;
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
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
Subject: [PATCH v2 03/24] ASoC: soc-dai: export snd_soc_dai_stream_valid
Date: Sun, 22 Nov 2026 16:14:16 +0000
Message-ID: <20261122161437.5994-4-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2BD73b/wemPQ
 sEkXz+yaCrtdQyB0yq+d/Xf5Rsstm5dy7xP3C3GPChlFbp0IpXwfFCocAkTWWLlaygKtqDjvBGx
 gtBWToSWUw3/icSKwYkb0ijJmjsccAJdgRuB8qlG9RhDk/Rhd2t9z3vR+GKFiSkDxW9+LvTIzJY
 8oXAgsetRDIt37V8lg4Lf0XRHwYd0jkJ3+eDaiY08qYxF1FDZjLmR42ZT2Q6TeJEhxqLQgtiP3l
 3pa54qZen780+dSwsiFdLibbPHg3870AHRtWH9Z4XTXh6ZFSeP/lDB+NNUPQvReqxbit60eY29j
 eOAIOeD1jECKt9TeT3t+aF0bWcc1VYT62lXNAF4PdaXLFYz/ffTXz7sOWlLNPQ5W6KQ/zn1fSeu
 VGe2xQBS/Y3vtF9PTr7UF262IsPzEAnniCxs6RD0FBr/NzHL8ZTvk9jWPhWC1LhQmkM8YVMzIQ4
 C1vcQOXo252iWk04gNQ==
X-Proofpoint-ORIG-GUID: 8Xd1fID3x-tJdDnm4lcbeib87fxvDH0Y
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b0314fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=cE0UM4t--Vybx2cbpv4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXyH12x74s3UTG
 pKsaAgbd8Mdmnwl67l9ciLGSTlzQ144oeVa6NXfvHuwiNA5/6/HLJ7gDsT58jDYvk4lw4h8zfsw
 3UjyIgJqhQrT0A8wuDvnStSw1RqAHJc=
X-Proofpoint-GUID: 8Xd1fID3x-tJdDnm4lcbeib87fxvDH0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Modular users outside soc-core need this helper to filter DAIs by
direction (e.g. the qcom SoundWire machine driver, which iterates
codec DAIs on a multi_direction_codecs BE link to handle each
direction's stream runtime). Export it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e34f34eac3d..5d6385b02719 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -706,6 +706,7 @@ bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_valid);
 
 void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action)
 {
-- 
2.53.0

