Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467359;
	b=DD3YN7dEVU0Cpt6t8X/YN5AarxBgrZhZbkRtCgkqJc4pv47vsVHF8bCct008R4b+WmQt
	 hsXtjOqKQFMhAr4omqXFUyLHEeOUupaavipU0GEgRv8cBDrOy3o/rxW33QLxj1axaxKF9
	 UCNjchDvSreizk4F/+yx2qbTH4yPu+nSs8RtND1qg5qs57HqpTIWrZJpc4DGiLUkUx+fI
	 YPWiDp9jQxb2BWyHReDEyWQllqI7D+FL1BwOoGqMmTWluouIEQ33D3dlDxlqzWBRB7/tp
	 ZTsW2TCjEQeFLs8f+cy8CKvvajV1VePNY4a4M6fncPxraQHikNRTNlf8LD7rfVI0IDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
	b=pnMWpCh2srRYIRc/Qpqms6GcCTFjS1/qcgIzALeUMbjGG+dz967dcpJnsAvxx8GPDY0E
	 I3+S9DBfa8sFkapJiOVHcimaiO74v5XBxYag0CSnyEqA75Rx23Ivwrs0Lk+3db+XMPlAq
	 JmjfUMnrqGXPRtxhTTd7M4wQSXFXnB+DzU5JCtwf5QDCkwllnWq/LPHhP6gi1kWwlGhM7
	 L+gYRYNFlBWp6oCOLQclTYPud4qaAPMgpcAYJYPKlBNLV4iwsipt4KdQaVyy3kyALF8pi
	 wje5e4BxAvK8vLpDxTM+XFhSfSAouVFtyBfoaWZBGdieSDCx3WsQ2/1ejmT2FeOpedA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yutb2C6u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5BF606A32A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5BF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yutb2C6u
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuRYa3255335
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=; b=Fx1YEHePkEIEbEYW
	DhVG9OabOyItaKaqLpwpyI4QA/LS+r/OrKMZgfdc4s/lr6s6EwLJPK60p7kkpryd
	WANzPuSP9hqabKBLljK4ssJXXQHaybm1EiEo9QMshW2DzsKe4qZ7PnBSAa2OQkgO
	yCr0PLdvqy5HR89EB8+Ox8UG2MLfsnwyFNhfSy83Iil6GjH3R6ZZQm5CzRiwOFiO
	kYv8Kt9E675aXNprt1l81qcCAeBy/YBJMqeBdpXU2r065eyDJdu70OTXJVESlWl9
	l0CKzKthG9HGgGxzuhx53iJSBiiQQcMQDBDq4hPNVhIbmdj9W+AhhcnyJp20RKJY
	pST2xg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbd08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6712828eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467357; x=1796072157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=Yutb2C6u/HiwDijPC4cRR10cCND9KDbXjo3cw4EX+zZ/3UOkA9XoYevI37tgEs/UHQ
         XkNjpscfp9tnJFvfk8ufboPr6kwm5nS4DFI7v2Je6zO9mEQHO1/WxAMetxYtwlapLU5I
         tFFdgRdm5LrEo68T+9HXsULk8mNnK+qMowhR/CF47QKtOMauT5rcBTipEE/Y0ck5N1ls
         a+dOaGUoudUBUrLxWQ9uB2xqZ/Biw808AY1fFrp0YPeqpY44bdvu+bgi0wzfAkq6NAK+
         +GaQK4RM5bR70StC6ENd+bRm7reWSWU2P9dDWd1N1WTkueymZn4tm+GMJRJac37EZ1ua
         PvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467357; x=1796072157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=ZXZTKUTJnnYvWQbftqBa13Oof9SEFjtp4PgszHG/9XTANRyj+ZV0CHAcDUv24AG6/D
         74xELfwZ0Gw48Dj7ZESfRO5zOs0hyS5yXwWlauqEhh2o/9qI0ZTxrlG85hQ7DI8mXcd5
         JWrWlEfL93nF7VeSiFs0hseih0mah0cyKhrR58YRSgx1uJ2mR4UYaQErGFysw9mjTPb/
         wzI8BTz3kF1OEFfRWsQlkRnb/jQckLdTSzGbDzfJojxg+fY0QYZxQsWUGX3g4oFAMPqO
         FIQjkPid4VBqcJXOV2bY1v2Fvn/mpsPVXcARtUngPDhguBXCJojL4qAqQuwuejdzd5jJ
         psyA==
X-Forwarded-Encrypted: i=1; AL+hErGlzGZiJGm9HupF4oY1EddjhQyPwCJOal/emfX+LZpHNOkLVDzzsLfOI2QoxmzgGdP+qMvJMWR5GzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cpmEBLK8UVlhZSEZsO83yZwPbiHMlaCr/7IaUb4KU6n2vpDiM
	f+uy27pIvGngiB3dUmLkcXQeAFrAEqpyP9WgRzBkhQlWuVQXn+P0Xxqqij0+p/FYBJGUJn5+F21
	DsMH8XfDtjkkWe4YtgUbIUr9Lw8PQOxjlEjxRNjzgXeZBns3LvcC7IsiCJDVpGyM=
X-Gm-Gg: AZFdTZe3+ov4JdMkf1litLv2zl8BOEGL7j0NwXyP6IGwmP2l5cOxGYlNKz3JElw+fqV
	NVA/7VwkmdbsiYZJK4W5x+sLiJ4aqUsMEVH1Meg2eqHGq3uMvnK6QWuzFY6I49cNpHsWk+QzvGf
	YsTuXfGSD7c6baMTq9THcEwmJbeiD8uETEvktg9pT/yB+yqnB+yLmiWF2eb3msmsFnh79C7HVe5
	2x1qs9BoFO+PeQWVjm9A1bnbRA+LGzp3MSliTTrm763Dg4az33ZnjLAHKXnOvV1ziR8xeeJ3Cne
	0JCoDtNHiT9+GPf+QZ37lJbyo8T5I/sbw+xNG8P4nvUXsrNlyU+Ym5syIIF3vTbCy4lcpYkCaeO
	nT5Szn1XxXQTcZGf5PlVdoWSj86yPjjg/unEzxW3v+Iwdm4fQ8hI4ofXQnwTX4Am55Fiq5q1Qh6
	LBklLazdiX
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805732eec.2.1795467357368;
        Mon, 23 Nov 2026 12:55:57 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805680eec.2.1795467356775;
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:48 +0530
Subject: [PATCH v5 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-qcom-bcl-hwmon-v5-8-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1250;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=p+DrbvohnZm70RkY44JTffgUjgoL+i7eEMdPZYxTZjA=;
 b=/V7wXZSXhkt0EpHZdk8xNOAG5ylHqm/2+sfQJBwLcAfPocvgsEIMFDithwf9rfQD/kDQHODQL
 b5oQJaQ2G7RCTZwrGScrPunlmiaQhmnr8+GWNz7DdAJeMCtTTR8zh8h
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/NEjceKkD0mY
 Aj2tJYjGia9Jj5xGvdVr/J5BiYp0hyIpSIk78ks49w2LO/Sz0faGs9J83Agpok1u3kkCDIi78e0
 xaiT3c+c5e21pzEPIk7vzHKP2xg+ZnaUau1NKDL9AwEPheFR2Gm+YF+6kmXeroiz1lECIammATM
 IhnManunNYTP6VOo8rHSHoTkbyan9kbBy/ZE9rLwre5zu32WuxQBxxPVjdjxviz1dwg7VRuGPX/
 q2Zx7K6LaQw6g2+befHfQea4vXZs8FS0YsHjFOostpc/4O4vs1HF3jY5apvZCtE+kR0reWCJlTM
 jqyQaeoh1shBa31IGlSP7OqQ2LU56tV9/6GBea8PNH6qDnGWVMIb+G+ey3VjEvgvIyskeVPJo3d
 4L/z54Yi5qj5z8/X1YNKR1A4y0723assyYOc1/cBgGcI13HLPjetINICrj1ty+Szayr8A2tIjq2
 LYEco4uyzfIGD1B24lg==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04a85e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: p16IEHg1Mm-5m4GgfX5yjv7YEmM-Yj-o
X-Proofpoint-ORIG-GUID: p16IEHg1Mm-5m4GgfX5yjv7YEmM-Yj-o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX54uRNjDSCCJ0
 fFqIs5TDP28J7vLWj0RuXY6s2s+7EmVZz3NtggDindEVli+ON0WDZPONKLt9aQVvZcw7fyint/+
 rr92W66VRDTm2x/+TEmh5sDEzr9jNQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

