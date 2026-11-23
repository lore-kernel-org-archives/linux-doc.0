Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467365;
	b=LzHrmQkcdu1Rytrh59DN9iNY3BKuOi2EKBLyReGuMWj4WQ5OzwaJcxRVO6YN54iwfaGz
	 P9osRGE8LE+sla5jTJR41Csz4fhakexRPWKYJVk+oZb5SkaiorB8sOoq/8KVAOTeqaSg7
	 YwGuIbSc4jFMUAuBW7/NxEC0TFY+tDKsPlzvKiu5dWyzZtqLV4QuMh0HF56mvTmDuasEm
	 G6s4OGUdBl0a6oNNOLVVOpVvfU+ICw1lyYZMieZst0isig8HdB4GfbdIzf+FuRj9c8JDC
	 gFK8wZlrcYVWlF6tCaQcCDk3s8FZ/cStS0vNSlVbLCTFXHVKzBmfnEgy5gLB6N8oKHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
	b=sTgnB/xrWa1S4zxYxVG8wpnPiMBBMiFDyK109TLLOdrGw9ar4zft31qN6rNaZLxTzIfC
	 DE3DGpVIsfZSL+NIf6PyBYPChOQmsA9nMXazDKQj6SRQ9KxjmUye05/pyFdFLC38dI1Xa
	 LqyLpMJNjle2MAHk46G7zgf0AlwNmF5rI+n2gJF7H91WzKX9zR8aM58kqCExVpqLpsIrj
	 ghdCiShkSRGsnUJ/6TcXEqUCFj0CejZChc2T7cVjPnURTIRmo4JQPx0XbHdmudEc/pjsn
	 XsjMmDX50d+LeklGzlXiEK7cNZBrgqkcRH3BUoBqtpBlEguxUuxTXrwlzslDS7uQ9vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j3MwRn5L;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C387606A33F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C387606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j3MwRn5L
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuufM026550
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=; b=jSvXuoSOUp29r3YP
	UGRAlBHjsoytB7EKyciLou6y6Ceo1/+Vr6tOBvCHevzLQ1PYMCTqYotBKpz/hTXU
	mYpoceh776OjlZHBSmpiCxE0773FZS7pKC3c8cNPBP5fIBaMeEX9KGvp5VevBcf2
	Y/x1AyvfPZqBGS+VTHtSginFptiCkGyOeibs4hRRDuHpU8KzkqhzGl0Y7xN4J6t9
	jnYN9Y8Z0PlGpS/4E+SKkQ1QLLH8MVol1fY0s/ApF0zATZtWPt0KLHFmUbW6yvoR
	cSavC3wKzwPcKJwOwVdZ00SNAEbvhBZkcHz2ca+f7+We3st0L66nyhsCLBHmshNS
	l+ozgA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd3ffg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:04 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso3871593c88.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467364; x=1796072164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=j3MwRn5LXavpEvkUQoKaNkNGPR7CAlr00zMATQ708aeyeBL3pmg57ttO5pcGQNG3if
         vliX8vLl/bcYH//QMkEscw02SOZ/enZl3XAOIVdRCK8/pgxM49PTNAHUHXRX7Uuu1DjB
         FryEj9cGqCtw4F9VbvZ6NMq9TvICAQTDo+zE6i9AW6dNjBuljf85gnwf/yHn5Je15sAv
         CdCzL0VMf4xGWrBLaJKxWP+GCFPwyDazSeKFhyZ4VlGiwQGyeFUekK8b+VNx4clt/ggA
         M8Xsvi6Gt0nykj/KqRVsZTavJSeLcnbx4gkEEkTNQHjOv/IyRLeeZoOf4LcKBqVoFej4
         djmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467364; x=1796072164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=qOzjXCCahs1lXhJRj6uehkunw29N5yuQXXeZkdDI0vcfdHlSK0u2ACQbg8bhIxe++y
         h42slv6gXSaevX4Q/2Y5AItzspYgQKsxbEFMReQ43YQNhnA9fdtuQuvfXO+IClJzPmLz
         o4ADqUiHc+XhEpt10i00f1J0u3SiCnfk9ua1vuuWSE1ikN8chNn0Wh4wWJR6W9suRK8D
         UnBtNTVNvpfp1kHopiZsICCK1xdUQ83wF4xDHkMI7VH9ITO9EGLyUXAmbe3UkPuygrIa
         QsHZZvnTH+2K8TbRTtqzSxXtBjVHb2f96JCVeoMvHHBhHrfAhrmWTIlG2/Ki/KZOxQod
         0EZg==
X-Forwarded-Encrypted: i=1; AL+hErGAs7fUbA+2FVGeuRSWibl3nbmaB2NRialpTVy+xTMddH0dowSsqX4+Xd/qopux46qWtP611NS7rLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uiWe5xDkoach7AVZ9+z2S/3OXakj8cfS6MQ4VLTY/xv3ASyud
	d4Ilxx0MHWnjWWe5LbaW5sOk3ZLsWDnme0LA+5y0eIxL4xN45T4nE0u2FyTs8pMr4Yy/DTBTiWS
	LG4i0rt/gYpxqjmt8GCJ82g7lEuZnn1yE5y5KBnB187jJFbKNOmuKUHvxVE7HWM4=
X-Gm-Gg: AZFdTZfbQmiV90Vd0RvXJlv0O+KiNhABc/df44QeJBBe6QokC9XhhPMdZ6vLIgkgCDx
	APVwASxVKkP86hYXYol4BN5PV/EUhBYqZxDU1BlxJgxDeefK9tD5E4MrRluBsRNQwMYdrW6umpD
	C8yTAq7A8MT3ortdPd2rhNnhsZvtKq8bUF8cTBVMwAHpFbz4e3oEhImQg5ct3o0HVLQ79ZMV6O0
	mPbqZEs8THRkCtBsI+7QD7/Rpp9hl4m1t3ece9Zvx3ZbuEsESm5fRXlen20tkgFB94JvvrA21xm
	jlj0jqhVdYFiagJshseN61VULoTYzWZf6nw0i1VaIDCYgmqZcZMa3jflVbuoSg3dwRZur3KFoq6
	5k1IhDPI/ap7GYd4QQ0SC+uCL/jMNS//aUxwfTvnpKHsej+su8YEDENVslllFFlNOliukGg7C0o
	sqDCGhHOTL
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463348c88.32.1795467363952;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463318c88.32.1795467363407;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:49 +0530
Subject: [PATCH v5 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-9-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1260;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=L6nSizHG/y+HmrSiyaptHCLW4K4aN1EFqVoX6vPricw=;
 b=WBO0DXaIYcrZfed6MtS/D0ti+xN8r+XNBuwf+df2d8oFiTs220C7lXXMY9zB482qMtmxdWwxd
 Snsqm69g5abDtBFFihGQduCh2F/DMNTqnj2OanknbZ+y+u2i4FRVODH
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: vuGMiCADWoQmpP9Fv42d7xsrDgX_Q5tX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXzPJl0PNpz1LY
 pqInpLvY9uWxvTlRATplYV7Bu+zug5p3Qs2kWb01eXtRFzxKqubiXg65KhGmOZKvlQqk+EaI6zT
 RAtL8ZgwB4Jzac4g0sMq9KrM+9P8/thT8lUWFAIIq9e6BZff44WmJ0Y06Wvc+++hnDd5XR1nZyh
 R0/vl89uSi4IVRJMnF3kkMk+T882pmAMcUrY2Z4+PAal3+ZEXq6lyxcUj3Dk7hYd87mCYr0tyZU
 Pu1IGcSPQFR9Hsa9OAUVQ+mo4X0j9vcUG4SCN07tWS0sW4mdVdTZt0B0Kk7ogoYZQ2r/YRVyzc7
 8cOOfABk1ZtnYJtmRd9eFrdND+AaWGFCGcQrqcoadrl4ylGShXb7gUUT8ppaRdbnfa/Bgn21PhS
 hBG/lklLjauW+i4BDK3nSXeqwZD6HYjeApAlwHPr+TzlHZWQJ/DCN9qlbq4AP1LP2fCOTbFUV84
 qQiBKLclapVk05Hyfxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX3IyP0Ti7bA0Y
 UNqaA/YTDrCfdJCEjrD476tEU8jzH/+fZAjTWuLnbFbMojQ5WMLG3+iG5tQg672FMh8ZKPvFUcG
 W7M6qE7HXL8gytXhu1BXj5guQWKz8Xw=
X-Proofpoint-GUID: vuGMiCADWoQmpP9Fv42d7xsrDgX_Q5tX
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04a864 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

