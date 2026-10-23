Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775909;
	b=mfTYUn28cxC8XsE7FikhZAgYy6IxzfEGL4ZcqQQF34dvU2DB0lyNokLQ/4KPObI0RfE0
	 FkWF/IQTzUZdh+2Er9avM34HLq3np1saW9evJcnXh4LuiUnBfyD6P+Q4mfQ+UfH8Bs4X9
	 qip4dWjBhOdziXWWpFtCDG71vc2irvPEJv/g2THqIpTZwfWCIbmUs3MuCuEjLGmYepLLW
	 bjaGLe9OGbwa3/CMk4rLZX+5OCbgBeQ9G9plOV3EkBJkPqIuT4mRyCP/405hp2LDLVa2S
	 3rkPbFBrawlKhWpHELQr1faEdjSh0g8uVdD+8g98FHbXFWX3pNziCLZrdJRW1eEWh7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775909;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
	b=NU40ERXEiJOU1R26mEZDczhjcaurFqgv7IRfsYevPYbWywQV40QCzCTS0fZQSiDF1P4+
	 +icN7d8T9u2QFiGhDZnHtThuiRbhlOzbnQEdvETfYLmlY5iL19oJG1IYc7KfaEW8xM/+d
	 jDeffAd6SMYDJQgG6sc9EjcZ4ZI5KXPSwtxgYuZhWBJeGXvXQx8OMJhAQpp8gpPABE9Ox
	 G2PkxUB5b5/AfyuuxbiIxlZFLKWt7J/V8noHFdRzRr4e4xItKJXxB1dLGACpcNyqCH3l2
	 4h/D8/0+bD8Zu8zZr3U2O5laBRkS+ji+1yPf3j1jVCy5gVEnOEtZCrIkpZxlCDEfgLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i347DQ9x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1lKYjc3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C460A3809
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 999C460A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i347DQ9x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1lKYjc3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5vk94072850
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cXMlmuKppBQ
	b2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=; b=i347DQ9x7D1UCl+LQHDGivzgiQu
	MebQJAqRBiZswZYniNcj5Zv8iP+HMpB7ZwWeb9iYxTazXB48fLHKix2u40Ycdhr6
	p7NSf3OornhiWcGJh4hl7ccTfWWxY7u7hLYeuECdkDdUWlh29adAJ5Ors3c8+4Fd
	ijeNd/z9urcNS2pNIuZDd8tFzJxj1PCDGDNfJsGhPpTUjwHXtddqnOsqGErtY/c0
	anDMxKUASWUX7PV5dXOl9MPxt2RFg0l0a7TMEn4RngvhSjlb5bJ7Wy7eNPVsLGVF
	ZeHqzXvKk2n7J/K+1B9sUfyjlk5unAfG9xxTthDq8F9xGvkMj3/1L2qR+8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw15h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:18:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3969a2a7so188053485a.2
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775907; x=1793380707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
        b=P1lKYjc3lw79SU5QhNz9T24PTWiyXITkOa5Oon/GLu66pYx+jczmCxrkGly0Whu9tv
         3kd4743s8G4LVkLHk0RnyxxJ06soFfeYOFIljif87HeEsy3f/JlAXVWnGstXCKu41V43
         OUW6oKHTk9w81a82xdnfjhpndlNbAi3ukzNP7JP+zluiioEnRhznEd2XZ+j/PP24mK8W
         9Fdy/Lk9eST5VI3xKUxcINqFzualjkeMGpy0UCqRt7Leo1QrZwhLBu3eBfWqYZYwqjv0
         oVDp6PzMjwicF0pWDeNfZtHq98JSO35dKFNyhwK3Xw6PK4zWI/KjTaAeU+X5ALtHoeZD
         UFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775907; x=1793380707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cXMlmuKppBQb2uNG37YMLCql+EtOjLG2XfTFyB1o3YI=;
        b=ZIQZMdTELOzhxcSg05MOvl5UTuTLmLtz06YbYQ33OUhRX26yvEaPUm1TzUg2n2gxlD
         vCU1DzjD54z/zy74yaOr0dhVxJ1uRJvcVKLhWE0LVMoy1MosrieHpKKcQd9B1rnWHUJW
         YikCj/J/pxm2LYQa4GorsVdG6dTRj7PdnS7xLgU9bcPjmijtJfOEJ3d5w5AX7xe2Jbce
         alu6ZkxjiKrUGkT3fshxLwxwcEWLM4Nr9GVTcl2t3P3bpAp/omZXmqGqIc1UliyR/+jE
         mxna3ISanPLp+cs3rl6frVqogGBEF5NAm2pcgKXb0yo/POoqvZP8fqnAxTGjmAMLmEGB
         pFSw==
X-Forwarded-Encrypted: i=1; AKwUvBy6Sfflxn4oGKw7Oj+bkx+b2v6rJY76rO73gYJmVPV+fWjUc6w1oLIp1CXIv6yZYHVWtv8kUvtY7yM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQMmo1ybvVyNJqxKtvj3JUISZZQ6RvbkO4UN++XThfz0AlPsf+
	jznOivsgx3IoLdK5gUt8ma9OLRQmrKmT8eZ25VPAAHGXAdfOV0pgFwgVXnqCeLi+Vdo2aLlRQ7H
	NyUlN219F6QJhZvDfQZxs51oGo9uBRBGsjzmQ7237Q9N6u+HaTQxHy9x6UWtCT04=
X-Gm-Gg: AYBFou1lSueQXf1oz3mRLbNwuEs/kKZ8+FgM6AfFjVuEma3qJLC6PM4qXPDGPqxMrUg
	2bowFoVcCbGW2n5950XyomK2p8I9OU8j6J86ldcp/R31JEF2uu7GJdVJuAXmDoDpZdwydAn/Pov
	2RZlT9Q0ryZxtEk/b3e+P7u18y8m8oLc/6s47HinVnCg/rEIbEKRUbrHZFcZFD0EEqJHsdoWuUb
	1lHMd7YAKA05ZW1T9QPznbvLtDdgr5Zvoh6dP97yqIePcokz6sZO+vxlAtkY/gxAW8Gue+ULGg6
	O3vrR5RfgLfboMz28aDLIRaq3NXjbt/NFHcyhfN1At+jd7ALSLtxOhqArp/9eG0P/pdzgtEqjIk
	EC3jC+Zx+ZEJO
X-Received: by 2002:a05:620a:8702:10b0:940:7e5c:7424 with SMTP id af79cd13be357-9407e5c748bmr97337885a.66.1792775906841;
        Fri, 23 Oct 2026 10:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8702:10b0:940:7e5c:7424 with SMTP id af79cd13be357-9407e5c748bmr97335285a.66.1792775906330;
        Fri, 23 Oct 2026 10:18:26 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:25 -0700 (PDT)
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
Subject: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker protection VI feedback
Date: Fri, 23 Oct 2026 18:14:32 +0100
Message-ID: <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: H3Gzckr3fB7-r2imvbuMKvmMNNwFaS7R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX+5kakUU3uB/R
 Ev4HUbyRUjn48HNOYxrqedcEb5LnhDc64GFOj0HacAk64uyPX/ub1E0IERhNjN3d8oBP+SCrfMF
 +kPUlEKa/8dPL24WW8mmFjtBNVmoZTU=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb96e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=gpxm3BjZcJp1ZicY-GEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: H3Gzckr3fB7-r2imvbuMKvmMNNwFaS7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXzTptAC9WTWXl
 HsZHF9MEcXLMgfgWFHjEY8a1+CsPokNlWbfFEORsSl8hk3EVwiXin4HlBqDJi1tJViz2m8M7cYD
 AaEa/NUb1wgO8GsxwlhM5776aruC9UlT/sj04EF2XTKlj8Vd2z+eJE+4X/bD+sww/ZBT2tISk97
 ol4hUY/h9KpMHQQhtfp6AyKrLIj6Ke4lwwYcTHYK3yyH6PMWw9Q6bfHGQRvpQeZxjqlQYeBXnPw
 teb7RHBYQICoa8p2X1z8pFWPNiAmnC2tN2rzNJS7suzAQiTjCqQV/p5lgIxKEFtRZfIr+QoXK46
 KaYhtts59p/a4/MsR3QrncLzce0moJL/x5lp/o/iCWwVOCwB33k0k7ydVSplVibGa2Wz8JQHkOH
 +V4Zhy78kKgdcHhSp0ypzMOE1YfND6kNNvaXh3LrX4hJoQbRWl1mDueFjerFHz2S5Dd+Ecg5unF
 s8Rac6tDvWP0CMdyCug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
ports and the WSA macro VI capture DAIs to the WSA Playback link, for
speaker protection. The speakers now expose two DAIs, so give them a
'#sound-dai-cells' of 1 and address the playback DAI explicitly.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..fddc76f59557 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -256,11 +256,26 @@ cpu {
 				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
 			};
 
+			/*
+			 * WSA SPKR playback-side codec DAIs plus the WSA
+			 * speaker-protection VI capture-side DAIs on both
+			 * WSA (left) and WSA2 (right) buses. One MM1
+			 * playback open brings up both chains via the
+			 * machine driver's multi_direction_codecs flag;
+			 * the SP<->SP_VI control link in the tplg handles
+			 * the DSP-side pairing.
+			 */
 			codec {
-				sound-dai = <&left_woofer>, <&left_tweeter>,
+				sound-dai = <&left_woofer 0>, <&left_tweeter 0>,
 					    <&swr0 0>, <&lpass_wsamacro 0>,
-					    <&right_woofer>, <&right_tweeter>,
-					    <&swr3 0>, <&lpass_wsa2macro 0>;
+					    <&left_woofer 1>, <&left_tweeter 1>,
+					    <&swr0 12>, <&swr0 13>,
+					    <&lpass_wsamacro 2>,
+					    <&right_woofer 0>, <&right_tweeter 0>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>,
+					    <&right_woofer 1>, <&right_tweeter 1>,
+					    <&swr3 12>, <&swr3 13>,
+					    <&lpass_wsa2macro 2>;
 			};
 
 			platform {
@@ -923,7 +938,7 @@ left_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -935,7 +950,7 @@ left_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterLeft";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -951,7 +966,7 @@ right_woofer: speaker@0,0 {
 		compatible = "sdw20217020400";
 		reg = <0 0>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
@@ -963,7 +978,7 @@ right_tweeter: speaker@0,1 {
 		compatible = "sdw20217020400";
 		reg = <0 1>;
 		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
+		#sound-dai-cells = <1>;
 		sound-name-prefix = "TweeterRight";
 		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
 		vdd-io-supply = <&vreg_l18b_e0_1p2>;
-- 
2.47.3

