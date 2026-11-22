Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364127;
	b=nw5Ruhq9mO6tNkUxP+/F+oTWAIhBPZd2+ZMCWmpJiD1q+Mk5JadamXqaAyKBMkC+lCbM
	 4nafb49VFB4nkvqqNvpACzJTmt0xuJak8L+JSDNFPmPTGX5pbpzafAFGR6Ex2R1LmpD0w
	 u4V7vhcu+Px2HVslHQHdjUidGf7nqK04olR0SW/bjpR1A/RIKSwrNT/6ET7Rtm+ceq38w
	 i0S2ffE4s2fS6gxBwnD9yZb2D9bxlQWopehtDHJxUU3f3691XRRf+EbguOJw2gyjrCCI/
	 RcYTq7XIC+iAz+DwoYvOq/bmM5TinCyByCD9EV1p0U0aArib7CywHdHYHzEl4mP4eXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364127;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
	b=niNlt55IsaVZ1YxuWSdQfs1JtzboQeU1uOdzJ0cVRXOjadTw0+m7t1IbXFnJ0lpqTHka
	 0yh3NfoHu/hM+n8tuXny4ITYxf5/QvA3jTCJAF+0zHzIQ3w7aCIeYP9O7RZ3PW/HBAtQI
	 Mk212D2iNPbSWKQr15bsEwG1vTL6LZwbMkDy2gnYCcHD9q457WvcAJBGQIeswysuM3aug
	 jHbIeOydiT6K5mTxg5eFk2Q3W8ypropBn3L4w3ouzCKbwS4VYzJOfakP5P/VmyqwFmTO4
	 /Bhd7WN9cHGxUsqg2Ynn7Rvk87kpcGdFMKraUiV9fXdAKMScw5W6xyauAJIT5eTqlPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA1606DA36
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAA1606DA36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7ZLBf13;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xn+R2jNS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFRQVD1857167
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZXdUoqdbSRJ
	d1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=; b=F7ZLBf13BN2DpneKCSqjS/7EyJD
	A94WvUlT1emakZgFcG5URf5GhdyVec/7ZjBK/JrcWLPpfPH4Tx6g9cAsrbdbCu8m
	Ofjx88MNGFZCtZ4n12ulVJI+y4CJ+x0EmYTHrG8ejAQznNAuLZku7vknakQ07ADF
	naUV98Q0axFU/Nssjc8sBCflRrTNCs0kU6h8KUPa8p6R3GipmnEWZzKeYu+laIgI
	baKvoQHuG/mS4YzZbuembAjfi9IIbh+AVQTqGHrfaQsFY1ZFjGxvcWEz2zL9yiYN
	pSFiN8hB3y7Ky16HuJIWe64Vb52YsqXhi5YQZnMNvxRp6UXhahbkeQvHqNg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnv42x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:15:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920ff6971a1so27826276d6.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 08:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364125; x=1795968925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=Xn+R2jNSxXixcqiAP2Ug8TqFY9Fog3Ba9w/J2Z4coeYFNmNen5hxB6tT//0aPiilTc
         +czWrd+WeHajdb1HkC5wfxVO7uANlPPOat7QKO0uM+aSdF1fnGQbKeUAzh+wiN6OtGtn
         l8wEbWtzUqfvUWlOGOdsSH88hg3Itay3UqcNX/TqpXLvFvXJMGcxcAegq67LdQ2iW+PP
         JyhONMWbIIpXSzG7cmR2iCbxoqhVG6NaV3udXNtNox+Af947WKCYBPD6aSWMiHV4lSGj
         Y0uPkLTO4UyH5Q0umH4AxeDUZi6BVBRiDvLk1x11TdQ5PmpMP5ZUPivR7YC0z3TI0ywJ
         45Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364125; x=1795968925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXdUoqdbSRJd1s6e9oV0QbQ913cHDkV0icZzT/bR1R0=;
        b=JYU5K8jbbdRJ/vEajQX3psTJ9WjCXBZIae24qERBQwCgHdQLLVveZG/DQggEHm0KdR
         zzQcI4dqK79rGm+NoKsB0N0qEVRPT3XEZaxTLiN2dD90lbfmVx4yo8S1mZrvguFc2827
         xWDtawcxUXjz0mt6QAGEZlJfhJGmBYYhocwmfqq3gszjvxVkygvfNiRXlxS6aVxkmKmv
         Q2dhoQFnXJV1sruaNn/XAo39JjLeP4AVLr/bhH7OMzItBY+fbeT3tlV2fPbje/gtR+tp
         PqT2T+NN0WS2vxTkNcFSZgqpLwWRXETjLigiVBeWieenabmh9qPoKJhK9YWQ1n24aOKi
         fldQ==
X-Forwarded-Encrypted: i=1; AL+hErHEdI23AbR1ZgLiSvd6FRYNYSsN0olhJ4QFGyb6FVPMPgZSOyYrhXCe9SaXl4h1Sj5fuCHg2o394KA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lcH52ALg/WHqzKpSCj0hm2551beSIAoH/DE2K2Fix0aNJEcPv
	S+M+XQ2aPWErjqhq+OD6U3bspl9PQhCLkcSNswEfH7J14KysrHvO6ONMNgyyivvL8Dbj+noN8AH
	ygUUeKOY+u8jGXdKd9aEVdYynLyOoC2K0uJRd1YIxs94+BogGnw/JI1XUYfX3oq4=
X-Gm-Gg: AZFdTZeaf9uOY/MdYgphWn5R/0WLkQf6rGOJh1usq/AbbF7oW0hQfpAmSb9eihQ9Ijv
	hLZkbbgPTcC8pnLt2QudqFRmdZ2zn5ZPtPODUe4ETa/EsvoBJ15BKbNbKFLZLPd6Bu4Dbl+DCNy
	2eTGUxMGYQ9FgVJsmuYMcqniu5ZW/a85nbKArZVktz616ATFvCug3dLi3/rm3qsU7kGCxhfnNwC
	8v/VkGjWS1kdU1XSc2MEiC+BmdRmf0JfujEd2ZstFJJspvwsxsQV8w2C2ykReEDfjd03aUr742r
	5KdHd8uvv79A7E5sA65jyA0G1GKIDBPL59kz6TXtSqZ7HSLiVx8RhMZ/eDUzoAM4GF9280dGfVg
	FUdDCdiLz6wveh82GUOXUmSqjTfR9cQYsNsHH6z2uYNu/ADRVzkuCJZTnT0ORKo0t
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278948485a.52.1795364125165;
        Sun, 22 Nov 2026 08:15:25 -0800 (PST)
X-Received: by 2002:a05:620a:6491:b0:93f:565f:e46 with SMTP id af79cd13be357-949bab32659mr1278937585a.52.1795364124226;
        Sun, 22 Nov 2026 08:15:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:15:23 -0800 (PST)
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
Subject: [PATCH v2 23/24] arm64: dts: qcom: mahua-t14s: add WSA speaker protection VI feedback
Date: Sun, 22 Nov 2026 16:14:36 +0000
Message-ID: <20261122161437.5994-24-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/6Zyxq3IIrwm
 vzGGhIe0jl9HnTe60ELl8cP1SziaeZwE+THMWzgRHuMUav/4XQyHlOsjWL1pSIo1VwWPhwKQIhw
 2IoiqQhPWzooA+SijwE9lTQ63bllqa9n8bCBcanr2MWAq+DruH56NKWLdiZnXr2AUG1bkymrow8
 Yp7jirNpXM5LdO7XUAQKsqe2NLDO3eX7YHOvIRkN29/KpNdUUfbj3bqwTgaLqHrC1JH70pvsH7H
 tm//niDZrR2R6BPQ1aoTCWZRmfCo3bYwB2cz/c2Y49N/IdH2e4S0F6gmiuB6IItXUYqqa8zmMNx
 bDxsusXvqPXKiM4r47CqIY16F8dECdHq9jpeOViAamKICrKfE70rv2RRereTV48m00c5vbukQO0
 eljIJELu2/y/rPwsUYwd0kZ3OxMFvndNCLwXf18y2OqwOBOrNc04EZu9zfqqpYbYAuIgs5hu7yY
 N44SEGu9iEmfIIxq0jA==
X-Proofpoint-ORIG-GUID: XSbYYYOiqOJ_irZ4h4Fdh9Mdg5D5ZsZO
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b03151d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PlqI54VOmiubEWYg86QA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXyMLVKqLeN1E5
 Z+vOM9UybGSsXN6x6/wEHobiwFGxXyzjwr8TvHgMjNeq6dggaRcxR89ygXmiIi87fw/EWQmBsV1
 m9TGuGPNLmfSCa6qSP7OatarZjnBBxQ=
X-Proofpoint-GUID: XSbYYYOiqOJ_irZ4h4Fdh9Mdg5D5ZsZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Add the V/I sense DAIs of the two WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAI to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

The playback-side WSA SPKR codec DAIs sit next to the speaker-
protection VI capture-side DAIs on the same WSA Playback link. One
MM1 playback open brings up both chains via the machine driver's
multi_direction_codecs flag; the SP<->SP_VI control link in the
topology handles the DSP-side pairing.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index cc7ba3c21bdf..407a8490e6ec 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -273,8 +273,11 @@ cpu {
 			};
 
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
@@ -789,7 +792,7 @@ left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrLeft";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
@@ -801,7 +804,7 @@ right_spkr: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "SpkrRight";
 		vdd-1p8-supply = <&vreg_l15b0>;
 		vdd-io-supply = <&vreg_l18b0>;
-- 
2.53.0

