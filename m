Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364099;
	b=JnlM9LS44YPh3KCc4mpCLJKeRkoA+SP1uaxVuQo177mHSPw9lzS2kmO877EjjGDClOeO
	 dX+bYO+A7yiTTRm1RExojj7vLboB5cJq2VUcRDvgYSiaIVr+YQ8FzQg6X5YZLlKMuK9sm
	 XL/MI0P1LYZKiDM81TUfedNad7aV0kScdQNooQUlcJ+0wrfBONRxtIAx5bGpJh6NFIemp
	 s693q14NH91Tgo7macQ7VcpFRNsP+6g4y27vYW9/5hCUUdpKIZRw08r5RklxkicQ/+KZY
	 eBP3EfMpNFPxCRFKm3jTHXs6u08itptpSUtpdS7wyWuSEnHQAMNlucHU7PpfWuq8JRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364099;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
	b=LyTpu/lipoGGcB4sPaZ2StAuJq6OmrxJdZ6Y+IECzDE2UagSjI7RIH8Z46IyhrBXko9f
	 4ygnP107xty5A3jwsMDyURMbUEb7bJJbSkWfdXPyvbtoD9Rb1db3gZQVsko8vngAgnbtO
	 Xo8++o2HG8vN16RURsoKX64s8kGVdtBeTFiaIKrjXoDpNkqSL4Cy50DIRvKAM2ucCK/+u
	 vqcJzMxDiDllT6O6MZDElDRTCqbSd+bl+n+74Gt6r2glhiiF60j32HcsLRa0GQLIKI9Rf
	 DCzoN71YebxKanKPCfykZZ3scHWeuHksQxTvWwQn+HJ4L8GOCLi0IWCQKiPFPN0tKSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4628606A33E
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4628606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQI8u1854875
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sdHfAwVsSM3
	RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=; b=Pv5rWnXAOHiOMlusuRf6oQBoUF0
	hB7OVlCxAnYy2lRljKUro/mpgAsVeECe8RggnmLu9tQ/X9NPOp6JDokaAl4OgDMm
	0bLYWY0BUWcIF6mTWM2dTXUIYsIp7LEuLImMooQBdP+01nve5feol4hEITT94kPz
	9cbowoOZ5o6xLqlWRyfXYly+B1XFmqpmfaaZIH6bUDXHqfCwSTSQUpOwD1assI30
	MORj/NWCfD1JI+Sy4/Z7WbXLoauyE7+1dnKpms1ivyT+EOraS4Zt5+heUn2f3p+o
	FJ+dWX5o6MmuxNW620OUWUrkCLImb1XAH+Rp7dm5w1hJI2mVb16jwq9Ze1A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv3xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92114c39cadso50961486d6.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364097; x=1795968897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=WCVDwtzrOWwN+i89thKUuaWZlcr4KKpHIF0zmVvqXx1QCUQkZtUB7gBHJ2rBY2Qd1v
         ShA4FUdfa7KZA7yeGsbLuUxmbrdEwdYchuO7n5m2iZ30q0ym6RixIhTi6otASUwEcuid
         uELuMGY4pS5ruxiJ5/DH7pRnK/F50ZQ4C1lfBEAldMKJ1qgDbApCfLDFd1Jtoi/c5ARF
         ScxGdmYaU3M8na62UcWrznmlRFD047N0Qlu9uKbr5C6kIn5MilfaOO1J/2lfHiYJ79NP
         m/ejPbfVnpJKtocYLEDY8aO2FzW+VwqKPR6teIRJDkYRiVRIPBaY0dyuVaGKn5at+CuB
         GmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364097; x=1795968897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=MhxWj9JyW2UZ+cOI8DcGoHSOR4/FYDOJrmtyo/U/R9DObc+8hrhsKsssGXdZhR3SNA
         d8x24LyD8MaeiV7snAAURUeiaWsmHGiLVwb5eTIboWw9iGIz+xsF4HKFICzLVdUBAVho
         o/sAbm4h4RUorc4XkHTNWOGxnzcka8Lukm8qyYAzF20sTkGyLacZCcmaBzVbWXhTxDl3
         b8pBMoAf+my1J9FNLY3pm9TiTVF1shPEzQdDM4qSLR3137pknZJ1S4GXzG4RJ/N7ly7J
         yVCzdgpFOm2m2okksEwGcZPQezxkYIDbvDkK4sqwZuHl5onloYmmk2PUy97Jcd+h4cc1
         BF1w==
X-Forwarded-Encrypted: i=1; AL+hErFD4mA9h8qmX4RjRZ/jiXHkurm+ZCAM38nC3UjViqyef0HNZD8Ku9ZcGUZTFBmxkMXrpZHpWjZn47A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+APD+tRmDJAK95LREJ4FYlgXKSywSwmhZX1KAkTCXnPsQX/LQ
	CMOjjckmsJ7dXYnfwxbbfjiQG9/OgnC1V856orZZhTDXGmYoyXJYmEboOBK7vqOfxkyf+cb+uPV
	zhBAS6q5J2BnPjHqpxEliJ9Bie+tsk5WHkl2e3v2EVJoORTzwiHIiJxQ9AGy55RM=
X-Gm-Gg: AZFdTZc3SsyOHbFt+79aIS4XaSU5PNfVNPd4SQIi3avN0DAdQu/+SlsubHe8JfXavaO
	oV05vHJmt66AbDKzltRxHSb62qgg/ZCUSeS/J+Er6AHAJy+xj3tks2a//475lfDRiBMceU7xpdq
	l2vTX3/hXiBtEI9/iaIu2XQt4Q7IWuC7qJolvhbWSpyM2MnT9l2ODA+U4YjeBC+2ht0QG3gYmmF
	mI0uh/ejHf3wrKWcPAHPljzRyYMOk2sg9KqxtpY1Mv+sqzjPE+a03HN6ETUh0mK13A81wOH/4bh
	sd/8pe3Uyt7Q7YggkSzFUVzR2tJBu81Xhln+BpJTiib4xxqgvQwd0sI3XeVJ9lQaZlVpf1x15DO
	fAfxrp7JixR+/uUOoyMy98wXigrBY16EOm6JNVxWVrWMIklxNwluFBHAkAiPaGzxM
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532057385a.4.1795364097185;
        Sun, 22 Nov 2026 08:14:57 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532053785a.4.1795364096750;
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
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
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 05/24] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Sun, 22 Nov 2026 16:14:18 +0000
Message-ID: <20261122161437.5994-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX+9HVkh9CD+xl
 b9K7h5tvdWBkjPC347L6Stz/c3zN3ZifqXq5SEAsDLxPgTjEgq15kewmyZYYc5FO2CjfSajAhIq
 QSqEIQ8l5mP+iEEVHbB8TRipvLRww1hmjnIsD++0pfJSSB5bBMMolo4rUcGf+ilktHm7O+6h5v8
 2ep/eS0g7XshPv1rQiKVvrI9F/oiZ+OUEQDQzRKnUvn7hQyt9QVEEfUp3bGANnpPHK48DqssDJV
 p39+TTJ5QBwIQtERhhu4Gjt3la7PQ7o8wOWmo8RC75/dZsifN/6lRLaWx0Olsh7zMdcz0YJY1Sc
 MRVpdS70dUQQlwDSfyGLCUypU5UlVRfKl1y+zOg8s+zjSeGBKYiFlOwX6T2UzzYPva1otdRITr5
 R9xo4bkEUxPehh8wPEO9sIJjmG/Wvh7jjpwHlsBUFLFhANaxAUtUeRBrDmeArofWnZPkl6Q1vap
 LIDiomaQOyK2rUcFDww==
X-Proofpoint-ORIG-GUID: R_9Q_AQIG8QMfy8q0qYUA-ZDq2JYaPMY
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b031501 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5bU/Za9iHa+B
 IvTSZvWFL1I7mUrwBJG860eP/n8UOmYxxeJdAiyypHwnrnUygSxFwj/hO0cdXcKc2S14SLY+WbE
 gUiBwfG6OVtFTVoAhpGqUqNo+yJHvQw=
X-Proofpoint-GUID: R_9Q_AQIG8QMfy8q0qYUA-ZDq2JYaPMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.53.0

