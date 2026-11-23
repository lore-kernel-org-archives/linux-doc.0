Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467326;
	b=JTBrIM/izm6bJt+gEGJoZl/kYbt5wFo4GEMOZW9ryZFcgBtxSfRJ0TiaBatxqeAhIjwk
	 W3a+At5HfPKWrvQsrjOnkdoyrJElOtqRsDQB6JSk71NZUWC6Js2c8cn6oaPyPMmYpgOgC
	 DkCPJpNjp31flBC6IMOESTSmr69SoeoffXz0MY2UG+i3L9pfzHUU96ow6OiX5/TikkLLW
	 AOy8A/RZ2bdHgNqYh4CpUQBNFXiA3cwInOz8rhq9oatGWQTtPf80/T3Vi6g4RJNKdgrHM
	 GOP8OhnQx8+AT8QXH9oBhaH3dl7T5cqDDQY3U1b0weo4se4+dbefF2UJWphX1huyvrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467326;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
	b=1/9ismADPmzLnBoJwKf/F1a347meb/eJb5D/O/10i4/z0rpKyDfkyq9tZYWVi5S2ksv2
	 Pgn1T8gSJm+uUJdL1rNpJkp+dANS9fQJOsHa/BtzPmGk0BDPBcVLH0SQxseRKNq4Gnzmw
	 ElQO5s0cZbCEejXh/EnG9/+fVWRAxn7rfFk6/5Abl3gYTkVDNWRQF4xS+htK//z4nE6TH
	 DFt++kicVkY2ULAhOwxXiG9CC5ABUJ1ncOG7BbQHBfMwGj9f+7pBFnNBRYhIvcSKmhtPP
	 eP2np1V5LBP7Bs3nVIJxA+GPd04R6QApNCi3tYhcLFrH2puL+9uC/PGvvaj/RfypCvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F61606A32C
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F61606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJufcW026215
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=D1so8nQFSfGWQh3d
	5muophMEI54gtgWnBFN4WI+jf2diOcOOh3E6uOPfZNiGNxwnI/0W0xMEqE/ELUTG
	GCDyzEkm3r0/+3nJdr0w85whv2A2PnRZrFZ71Imryfo27Qm562lS7LDh+mtr0L2b
	BYg5DctVFIU8Lvn3+T+NO2E3CiSLRcVxgwXsKLoObx2RJtxvyxUXcXXh+zDeEo9g
	N6dvyiF02lhyBis2vCBIAWddgX2OcHf++/SL2sc8YZ/Sqn/usSKSsWgsgmM6kOgn
	PjIYIoGxttyTL7vFfoqLmD6uJSAfEphAojM7Os2th1YRyYVhARjRqHWlBn/56J2V
	Nqcz4g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd3fc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so3754726eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467325; x=1796072125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=Ony7BiFtFn9a8vz3aPgK53D05zb5BgBX85SZdMGU9Yqcd+y+NeUog0g7aSLw/oxBMF
         yffb7sCQlmQ2UE+zoBD7h1umndQSap/DnQfFu6OKEJtjNZ/rPMoee2nSbNSmaHtHVx+r
         iUuzyT+Ify9c43EMasqMrEOh9LkM+fJcGI2UxKEtARZyMSfFELdfwMN8/zAq3VFbjjGi
         syZ1+dm8tbfqZv2MgzpMtth2r7rv9rmLCYpViHHXnK/xFn07PvBZFDZMpIWJpCVoP53O
         HpbV2i/6dINc9ADvS+oiGHE+3u7wCOeJRGZ/aQgKoowEu/YiESZ+/UaXqthLm4YIwkUP
         x8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467325; x=1796072125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=qDeHJfDLa/sd988af45XKfbffM/XrJoaC21DSCq4J6SEWCwHW2vPMofATNGMXstaUn
         oyGeTb+/Hvny4dtAC8Nq/Gu569Jjp6sks8DAeZ4T5BuR2W0cwm+dmMFBfvjz+C72DodW
         tXlAhbXGB22aAA7KCRc/YUPJvzpDPDjcXdMCBdHZQy2qhPp/WQXV860OE44AMR+zLLEv
         Wp2z36sMXkj9B6Cql3qINuTp8uzSW1Z8EjwybcMSHEC3FIogdlfU1jx2AM8f7s5DlYkG
         cOPt31lhF3Sr3209ioLB7Grx2EnJ9T8orGE0dTOd27KdUksIBS9C8Af4L0IRSD/O7hIR
         GR6w==
X-Forwarded-Encrypted: i=1; AL+hErEWZTsdlivE5WZl3xd1jFPmoDTKHXeDIzIyOF1u8xpx/cZKfhvTMGUxkzQQol0HQK4j9xiK+IgbEr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dcVB0jsWqMNoNK38tUZa0Fgmt1fcecLeb0/S25ZJE0+BEIYwq
	S4Iopm/8MhP5sTfJrVqo/+of9zLIHKKAUdtTpwwC2zQoac9C+LRlZ+ajhYcaFCX+8d7Zr9w4f+w
	kJbSqtaOkiQnxuIfDODozLcfddOOCYRIrWB+9ln2kJJjzpWbe11mfg5m8B7fJYkM=
X-Gm-Gg: AZFdTZfjnh4FPKXmKdFRRGnc+NmztCgIBJAz8IPYXWBn8xRvox+rW+3WR80s4d3+sbl
	mSJI5XNWcGEy/PSj82XOAkMxUa9Zgh6bdcIAzPCuaAjV8roouylc/L0CpiHudGJGob5N2o2Kel1
	q2vIQ35LfWb+qoTWiz0CMIeSI+zrwEN+UtZK3qOFJnq6drM9gDOCt7XlfVsaSZihTVBgnkYhwwB
	tJ9nrXwe5lrWqWEqY8pfG82hq5jJ+ti51FNlSeJCdohojwEq7ai0R3mrWr4FsdDPxi6kSI2uXQv
	274JAe2BTNKq+aMPyX+dpVJznSGyL3CA2jJgk4UWtycwdFTNNFl4Cv6T0QyE5r7qfaIqV7MhMQV
	FIV1M0Z7AV8WasekQDCuXF2toREdJZzKq2xE6X+TMUbHv0scGMqp7/oUnOozmgY9O3Uzli9L4sn
	OINanR7W3R
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905434eec.28.1795467324820;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905387eec.28.1795467324257;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:23 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:43 +0530
Subject: [PATCH v5 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-3-747d5383d538@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=JUF+Qvr1MfhBjQofxRFWz8itf9IQztM3tWFITF/Ndgd743dfOYnitwBPWbZGE0CaK4sM7mgmL
 BxKmzmW7mDgCmk6pKpOjoazilMJLtWkZCPzxl3zdJKpzLxtemj9S+hx
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: TEsztC_Ysl8bv2AuDcbndugFVmeKyx8P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX3JDXPb73g9xs
 IFIMwdLpJRaiXnyozH98EVMChco6H6iMm0x52UmtiVmXxp1UAMxJqz/HMe5qfDs+4K9tmqjiSPc
 +DXc4ZqwF0V17fgn96/aZxKgMOk+rIIjpWVDHPdhySd1w0cG32jlAZJutmuVg2xHtQoHsdQl9EO
 ZRRzyRng1V2Xlajcobv7DsLZUFPK9D1m7ijTC5QhbSeTTJu0726RMwueGNQst6Zkvco4xEq8cSi
 9q02hkiRM+bPQWAUBd/FKULTeNAYqMkG1MZLPxSrCg/IGzUN7irpvthcw7WEnAPIVEQMJ3ExOOk
 gGoJ9r1sFmiwoijVc/OpWsFvdrTX8HLlOszva7IHWxULAhZrLF0qKGEBfyxEdK4d6ujXVcF2Jsg
 qZ80gOCLpGBH0Bay2fdO8dXYxAVp+yQjiJX1uYUXha+giqnmh86EXHOHpfoShmECzzXRpwCpESp
 2KehVGHAo47q7tznrEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXy5ZiO8kNn7TX
 oytJO10M64axeiM3DYiom+kfkzNUkvzn71DLnEkQ8xPyru8qSSQPNHr2uzFM5P8UBDABO0xozP/
 uwyHlBjatLfKpaw43FmWACYlr7+d+co=
X-Proofpoint-GUID: TEsztC_Ysl8bv2AuDcbndugFVmeKyx8P
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04a83d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
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
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

