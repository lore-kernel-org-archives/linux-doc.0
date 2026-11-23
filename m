Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467379;
	b=qLei4kr741329UOepe5RGkMoOIoSxUD+3Jp3WFW+q8t1/reHiZsUuQV305IyGM5z4yU0
	 Sw0VL2h6Lv21jpC+uUaQNyorXLtzaai/Cp9sQ8KTJsS+SU9chXa1eip3vyQbAIlNOCnAb
	 Iudgs2MUe+AnS0osgZtIQE15zQCcObVcbenzRGGQmguheVtno2XO7kOKvodnehHxu4ykD
	 0Ats7X65YeUSTf03rv3ExmcWcnpz13KOWTwY7kHAPnAucX5QiR6hrRkimLvz9RDBwqdj6
	 h0QAtgOPMUfrfrC0Om5on+2MSL6EO24Aq1jB4EXgXu6HH/12OA60Z5c2WNphu1ZUnag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
	b=v3B6S3YGXUWMixI8McsCTZHio2ZRU0xHtUyJKAGXyvSqxPVKyP+NztHSUbS4xNad7Vys
	 HMVYieZQxPSeYsKPy4Hnb5/FmNCJSPyzGKgqbbK4tP7/eV9svlIZWWsJhVN7UBLi6tyuT
	 UCsD074EdQrcuO+2Ja3W8s3iB/+5/3+YNemYIo43Iikgx7VGtbhdwK9dXtrT1pd29chtM
	 JykNxMRizJqB3Vo1znxuiYWaRyA4HrKZYbrtCP5APeQskkMJeqp+Zq2i3zIKJnkBx/y88
	 y0ClKA6GlAPGp5bZXF/Hs3BDLBepWz3DudDyDG1WZIISAgi1kzFDkQOP8LT03xDInRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjCaLaHr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C21606A338
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12C21606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjCaLaHr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuRil720763
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=; b=PoyNcrf1UJTCCSFM
	OZDfLj0txBnlx9abpng0AGg36Y/GVefkTUoiVav6wUTNW1aGZR2rGgxRSibv+J51
	PaPNGSLvIBd/Ot/FVAAsaWDwEwtVcLRKbYQ+TaeMfe8zXXe1OCWia62s3Lv+LgYv
	u4Th0xLmdBysF6TaqA2P2PVadMhQxF+FJlGkkR2GMXx8LZGuTavH/aXTcEhqCjt8
	siGLyrTUDEYziF9SZdg4jmpWP/kk7AnsTs9qAoSMC7C/UgBCEIjCEiE8EIKDuRC7
	dzgah3U/3zNb2lig5lgCWOrKRvEDhy30ffBV5WnV6AHQm4Xv474uRh/zH5xYARrY
	DMY02A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqgamx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4156187eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467377; x=1796072177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=WjCaLaHrx+MIa971TDIrXmWt+lfhOR0F67xIaoDkw+8IN+GjN5wBl+kOJbqTYjZTA1
         Rj2b2t0nrYvkLJ/uteq6lMAd5HcGXFe81GBnv5yT47G2X4BsnuzeUnOhm+QesTkfHt9Q
         6/gpY78x9tcDY4UuGLY5HSVMzn85nhYLwUVwczluCg9bZHv9S06ASTWSKr7zaBCe+ehK
         zjpHk9TZycrxDOdklfhSp23dheLzvTVCcCx/Io0O2gIOmMN8G0hcJwtVphjGu7NbIIra
         yghUny9IvMd2F9kGbM/4gY5wniHI6MoQwZHrSjRCOU+ndivrHS7/umwxj4dEc5Pcn7vP
         IM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467377; x=1796072177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=TDNr9vB+0hVtli2SSfPeVSUHFx1RvEWzj44yGh46oYDId0iSI1SIM99ZGMGgldrL7j
         W+S+mahvxTKmdiZ2dFkH9s2U+XDYHsiAcCeg89CAeW4/YZfzhvVJxFBv+NDsZkUB3vQT
         wzUo1Mgb6STcW8D5o+Bjbc9zeeRi99hvJY8Jl6qmXxDZ8tOzJWBc1GbThcCkdtpRm6Gu
         Spm+HpqcXsvm6+hLHgQjFlm+e1f5/6ExdhPicJoXw2Qdqzi/x84jzV69xyxHR3ZCQhW2
         w3SdIQpR6ZDu4PEPACn7t2wx1/Nw8o2qWJKHHfQ7oj6tadmMPiDGxYVytg9iC0tLxw1Q
         p8RQ==
X-Forwarded-Encrypted: i=1; AL+hErHY+9bCR6M/iBLIxfiA4c1ZyjJKWMNVaWKzKFkel4TEvY/Q+YgaMSqMxe20mp6NUODx34wsrvkTcJw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p55Ptb5Z2pGQQIJUB/VnUJPHM43YiChWSi2g4R2s5FPneL8WK
	QEyTZ+KfT12Zx6ycu0w77zT+5uVFGPJlGa03gFAirByJWu5zftHAbPSZtzATUsx5MsiChLFahwh
	xPr7gdRFOpwLZLd86bMwkNWx3kgOC9CG2MBW71R1o6d2irW34jIyNX+MkDEtkmw4=
X-Gm-Gg: AZFdTZdlbk/LT9jlZlUXk8heQfltdLZ9xu+/nY9TrJ6JyhU3hpZ7ksDUR4R5dBf67Y/
	dAEaMIayvW3riMjvHGsTsEpybZeNQtxlxWa3qquZtJrwUe1DVC1Ntv4xTJQIQ8iFPIKdO8BovO8
	uqXhJdJnlneSugubYq1qqLRs7C/Bk/O2TiALMn5NGB7JncP1Xokf76AcFbR1cHpZXu+T/YbFdNp
	9QrdWQtQAPsVNCU+kDxHDEsyXLq/fS6fCj3DFgC+klNfq+Ybg2GuYeZE3u4TD3cZkwe1kNXhmdw
	mmIENR7ZyYaLoOzdtuhWZC5GM5vciAKCpIj55SrU0+gIOLKFHzpPJi0CPaQIB4hJyIbx5p+894T
	C5Q64CcZ/A2QP7BC9QLpKC+ZnQWu5Ra4QHCJyOCNw//iveyG3rwAWiBFjNhsOtvIUgJV2DxpXAo
	Sy3ve+d6k7
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275543eec.18.1795467376950;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275508eec.18.1795467376284;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:51 +0530
Subject: [PATCH v5 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-11-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1270;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=47aN023hxv9OOnDCfygfziDOOhs2YVDNkTzqFv8vus8=;
 b=hM3yim468dCAZZp+27L7bqnFCF4BVqSMAsVAklDuWBZmBDI1auh+1HvrljOPuRq2pQrG5Fws4
 nZOhGgmi+RwDP0siclczf/aKCddVq5f5v0VoeRTAGrBt4uZK5IGGnhf
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04a871 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXwJbSVJeETGJl
 MMJib2s7x1B3OM5CS5FOiYBzPtgyBXyKBVuApTBFpT5MMwahXuHp6r41hXusUoCwSPhnvV5Zp4h
 GVhOkfY3vdG/I6xbnOXOmk8fsuJfQdJbeyxB0kZuJBst0CtDwJyAoT7IqOUr43k+mIcvC0/p6Jj
 pDpttdPpw9DUtNfJSMABBXX+/9w6ANY3qoOu0RnEDrjWeIJX7xulDCiTyS7gfBf+iKDPEIm1rGN
 z3sFGfnOTLxq7YcnDYq0D8IC6CUaH0dtkvdfX94mQxSJVy01TiVGMXV5N5fDmZ+4V1PY0iJPMF4
 3gD4dI++lnzgWFUhP6ASz1JHLbNbhJhSVIHB/s/62ZOMISk7tAs9DjpV/+yyMR6hAfYYyKPmmww
 rmj1QlDUh1cp2IHesI6alapnxGnKLb40HwuRi2MC/RU/1s6xkytvPIfSQW0IuvqEvAKp2YatgEn
 JYfc1AFQIHjM955GaNg==
X-Proofpoint-GUID: _11lJ_hFkkmm7Xm22v1PgFfah3sw0jhM
X-Proofpoint-ORIG-GUID: _11lJ_hFkkmm7Xm22v1PgFfah3sw0jhM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX7m5yhOnCvZS5
 ZHsObL6Ubi6GbE88Tpq/7zXSYD86sCnj4bA6RDVdzZRLgomSNOnnKECrdlcTNzFZ1H6l17PW1Nz
 jvT6DAwzZ4DCi42zUMy1yZWq4/+BAqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

