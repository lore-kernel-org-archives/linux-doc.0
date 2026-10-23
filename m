Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775911;
	b=M9toeEFFMengOi12jT0vFdafa0MBjgpbkXp37l9HKhVEgUlb82A/7C9EnLKzdh+b2i/7
	 f4XWHu1wh6YIHMMgfoQuRtyZNO32dXOsDYAi26jW/HcVJR+sIcZn5EEQK5qsYCQRBMN28
	 kWVg+rXoyAexhQnjdp4tjmSbtT5bkb2b/6hECWQnWZCV3xXP1i+OAmrR/dfgmJC94p98L
	 jZB0WSmGvkprbJK6jgGOzUqqQ7r3ccRfuWuKF0RglTdaq4cnQmtoeC3mCl2OzP7b9n7Gf
	 sk++MtdeKLUQ/Tg8tc6BoYY0Nwn01vZInGqHWpz5dmMWBpHbkrRAqS1xMlBTHcbUiug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
	b=ryr44il6J1d1Ja9lF5pWKXpIAPdxa9KStpE6LwkSe4q3OXLOl043KZYqM8K8C798az04
	 ceukAsLa7EXH9uQK5HOxgXLj1q93gUb90v053z+ICy5oik4FrBD9ruByy8RE2GR2g4o5g
	 B6BZsHy92qO9en4I3ehp0qoZcDv1KXqEib168AF/RlZgk1zaa+YS8/BZUbe/q8eQ4imGl
	 X7vVZIiTQeKwVCpIt44Wx9Sz3smxMcxDCEY6tMdfGIb/46b0YUGw0kj+LOSYOXd776TBH
	 slVQnnaZ8PHF53V4kU1sYSKHIh+851JjmMGMIcqT//ZI5W5xzvCIWqyu1VaR16+Xg/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737DF606E9D4
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 737DF606E9D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R45wIbQg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VetaSVmQ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG34473734767
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+nuqdJUBgvz
	q3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=; b=R45wIbQgErXsxYdYO1+Z/I7bC1J
	5d4RNR2zv4FYzqgC34lY9duBrZ/xFRw8HUGTsrjbL5lPqa3AB8s8gdHkRoKMwefs
	IvsHWvvVSSfkR05tt0Vd3XV/fXJ/XB54sPBcqDZ1GJeQOTsJwv+MG8MaV6lx8CJf
	BvdahcESu2MGZjr45UbdqcHn5lqcPrWqpmMprb5DrJLDP/3EAmw9EVpGV+NW7jgl
	Xnrrv1DiYsJSjGzGLWm3fPqGu8ayFg4kTgwQGm3A1lXHSUeBGwpmvWk1UugJYJTe
	mxbVMTGUHEe5NWM8MSGmcuBo1QYoOKHQ/5mBbnebitm5UHvzhGdkJtCJg6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso277445785a.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775909; x=1793380709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=VetaSVmQRVXif5aLmH2WoNwan4zvnfkl7uhA6V4q3b4TnTRv+GdyiSFHjbO0JPuWm2
         blsRrI/cIDMRnvCYI+lhQomai303gm2xcy6Ko/W65Qf9Olf2t4C+JZ1eVhqw5G2jLK5w
         +7jHtTaIiJdCT7ouiw3jnb0YRKpnCbRe+OVNka5caqjowL27x183My4/hcGkftI9TS+7
         QnPOGaSsnT9I3VHAtKorHpP6JsnuC28wwW5iYighCr+qoSnxkmfBsg7/TkURBqTBE85/
         EizWQArBtj20DdiIYO4lDDVRBs0dj9cB4XJW5NZQnfvXuFX1ANH54AxSfT0k0kGjdzsE
         /eLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775909; x=1793380709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+nuqdJUBgvzq3TkkAc7l1O26WfkuwK6Nh8uA2GYF0o4=;
        b=fBsLYtU07pECtzzVJLQFN8f0Dq+RfU3BOIJaHTjc93KthhLWnUsux0lv75+ycc8GdP
         YLMwwIF4jA9ppfZXRP8sC2Ub1otyJgw38dJfxF9A1fcNul5UybXaLcEk9uYddIdsL4A6
         ruxF00DOyC3t6O9iZePBwnpuIph7DraXltiiQBGdNON00bZ7Y3BuBBxDBOYAGRnuJx/R
         j2ZjxYjEx2Bk8T0x5Ckn5qQOgp4Q8ml4JUas1ANzb9C0/tGz0xgteEJifXxzqhDc9LKW
         Mn6fXU8Yw01q3nB6aS0iHvWqKYw9tInRIHD80MR0jJ1WTleHlp4y9gcA9tB1gjcgoRZZ
         UsOw==
X-Forwarded-Encrypted: i=1; AKwUvBzw1WC8FbsKUy4Sv1tA2TP7z1DsHqxHwNbl2ogvfX2rZl8Ffp0SCsoiSnStNtcMkwYmfvNWGNAtM34=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxzBdR04J3AOrDEJ8gYwF7/G8OyFtNHl6XbtnBxZxkpzL5CiD8
	pp6ILh/1t1ZVPbZtEZmCb9J3LsIlynQz+eDoIljZRZZjpxc569hLQhogq9UpU4tpxrBBY3Sz/rI
	rpCO46xQR9lbgdR7dz8XbVVhfwrXYHs+M6eP3ZruXTmcNlxC5UxPNU+VW91ff2eU=
X-Gm-Gg: AYBFou3xj0IhZ72mDS0Hda9FYefxTfvTYfc8V0E1NT0O8ODZYVPD+iqOftII3zq9Rqv
	TxJbotrggw+ygWDVlZARZVzqYXoGk364XGwaDi89I2ROF9kV46eqsaAlGOQ4C8P6OnMWnkPAkq7
	j21zEs6xIQGMYiSTLV5SCPmEubxAyC6FLhLw8EAk82gFbcC2bwrVYoyRXRm1NShtoACqZPS5ZMJ
	mq+LflroQciMoYgGKQDh60/W8xhnLfq7/E4xhyjYuXjrk91izjeAxPuwM8RM7LusEWuhvDU1syf
	Ls2Tr7xAyqKah15R8A/kx2LrAR7p/iv0Nbu0IFRxO6zW5fLPMitQQsh79bv5zZxzg6H0zi8LAip
	R1qJoXPw+p/50
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545739785a.22.1792775908700;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93e:d854:4b83 with SMTP id af79cd13be357-93f6f782fa2mr545734885a.22.1792775908118;
        Fri, 23 Oct 2026 10:18:28 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
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
Subject: [RFC PATCH 23/23] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:33 +0100
Message-ID: <20261023171433.820092-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX/JDCOgvs7T0t
 ThzaHgWQxGyKE7tcxyhxDSpmB7GJAM4fYJ0Od9SSwv5kQkugQIv10p6Uvvva0ct1KDWwVTTGmpz
 6KqYmqhJXNR7fMlqwznnctIn5xpe99k=
X-Proofpoint-GUID: 5GPrIkPc40DCC9L0OOY_TIW3rITISbr1
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=07M9w8tHMIt6-5hUJIIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5GPrIkPc40DCC9L0OOY_TIW3rITISbr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX1S+AakqXtORQ
 hYRo/6tBjjRIbI7qMj4n85hYoePHp++2InTJD3N8W70diWFHcvDsupwJAqqs+IIkqA2XPE46oMt
 C1n/NtoLzBeJ4DcBwwtEQVcdMCfNr6txWMa/mfES8bPgcUP11ffida5yqJisczfg2JSnJa9TmEf
 82esG4yVIVZTHkAZ/pskefqt4tWRfdjaARUUVitTc086z7qfepRURTqsr7P0vJ1sA4xeA75jLy8
 aRCgHc1Kjcr/PBZct4WSuwj4koTm7oYc2h1RwSHc0ywKTUcj38sEZH1xM0atepFR9+ir2vLKkml
 ApW39zmnpyVkFytZclqlH4Y2mwAPP0qaF5m3A9FRuEpqBS3il0U1W8C+RGfGegjlTVGTAU13dAs
 G2VRvF+VqiIkfAWnolNvy9I+f1khjEr0cy/s3svj/j4ISyKtCv2Ou7h/cGx41xbwduDz67RYdL5
 9AjJJWQf/7L6hDKSaig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..d6a921b3c713 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -268,9 +268,20 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_spkr>, <&right_spkr>,
-					    <&swr0 0>, <&lpass_wsamacro 0>;
+				sound-dai = <&left_spkr 0>, <&right_spkr 0>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&left_spkr 1>, <&right_spkr 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>;
 			};
 
 			platform {
@@ -928,7 +939,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -940,7 +951,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3

