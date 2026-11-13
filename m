Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559502;
	b=yJgvGF4enwZvX+SeEM+/4m5IJbjq0Dk0qC+qVc6+QkB8I9KeGlE/GK5eLDl1VPkuXfAi
	 kEH/hjh+HPaYeOQ8nL9QhOU0w3vkE9p7FmmMf5DJbknwm1XqxXIGIWsRFDRNqU97NUorx
	 zr+q1khY0SDW2Ys/NI/7EYdrZt/nTelRSvcZBaKH0se2T0oz74bxJENLEQYB4Z+cLbE4O
	 dPpK97pvuYurkYHZZmPAfahZ93yJp+W8Ty9r6ijrcU+1pkGFNNVoUJOzRYM6UFe4fOuYr
	 uKd58nYQvbawRS3xn6nnMv2axL2efy4W0fhBjci/fj3DxfDwor/XmJWBrKeFNsbD9IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559502;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4B+k4N/WxVciI3gaNDWzFpGczUzeXz/gtMtUvkPRnj8=;
	b=OaAFxFgUxF+SvQc6ontHxZ56laiL+LqcqKZ4Bg7R7Ogfb8XLWx+JgjeljEgdQYjnHdn7
	 uNBQqgd5OFofhOpDE9K1QwZbuKuol5lq6GxNNWlg6AOL6azDYq97WM9ySHXcZWQpMJp+L
	 m2JmCJWtu+lu9Is+pu4rzxIxEyy+8j5XHpBDOlF2gSxEW73liXKakcBxwUpIFQK4yNucE
	 qdbL9cjHE1QfL8kB+FTvvyyzh9ARX7KYlZhqBV4q/aBd8ZG+3uehv9MUUNYQoc7bNs6xF
	 r4IYAfkG1mLkmGkSns9N8yXBtvu1QX9VAFZakXEWT28gWlsRAEW77z9AoTExEy/ynCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dom3x4pk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b1ysmHWc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E42560A5BDA
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E42560A5BDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dom3x4pk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b1ysmHWc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VHu53653112
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4B+k4N/WxVciI3gaNDWzFpGczUzeXz/gtMtUvkPRnj8=; b=dom3x4pkyLZav7kJ
	NBsEngBMtcc0Djs71P6R/T3Bcrjdc72HpbrHPIJB6Ui8AJre8inGfB648giq3Fl3
	UgLySVcffL6nEOYYpiT3og2/pOi8oQ3lphtQwyxelv2H2ThhMuLCsXPktR8HiXCo
	AHjlXJvP+/YYR38zeN2Uir4OFu9LTOMgkkKOBYLQsEN/twfpDcATKq3/G2jiddWC
	1DPPgSDeGUy2y/XDwwPWOTYhIGgAQ9PKJ8Km8f1SHgXXfKlgMC1doKO+B+A1YSDR
	6l7bfa2ikEl17AASKG1z9TNUEvJk7j4Ox0TxnMycnaffvNfESpa8h5Wp8GurIoTZ
	OHYcNQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwa8f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:45:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1155190eec.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559500; x=1795164300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4B+k4N/WxVciI3gaNDWzFpGczUzeXz/gtMtUvkPRnj8=;
        b=b1ysmHWcROO0CzlmtI0KZNIFUTypatg2J0hElZn/VTxurAS7/i9TN/6/L/5F0xnM1o
         djui0CVBJ65/YrpJH1B8ot8QTHoonP3BLt34/PfeqJzeMyBnZHqKnGYBpWMiWZ5WoObo
         9A5GfeLatpRZKFlwYmHT7GhCgiqN6hGMZTznmWoMQ4mk7Ix43CSMieSUW8ldXwMKmvYf
         3vGo33vQ5FtZdXyZuBNXooIXEdozlfbxq3p+WqIxaInKQdw4Iw9ofM1kqMqYTmNviSKn
         TTw9Any6iC/hFipy5yA84M1vmj8bH/Z2mFU71khYZtFwo+CvQfqJR8pYhZYjosk7+GI6
         h5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559500; x=1795164300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4B+k4N/WxVciI3gaNDWzFpGczUzeXz/gtMtUvkPRnj8=;
        b=wBIw1RR4lS7OcST80eodpOsd19sMFvU5AJDySo1SAY1/9sb0JdNlAr4CrAQHZNddsK
         xZPVYu6EVq6fKfTQIbHMv9rNSi6EOMBcJUX1BCGz+Gi9bdunkGlHaSGrqwpqcPCihrGG
         8ToOx0ki1otgLpre1PPek+3gimnoi/jJGb7bamPx18Cx7G37rEPaII9WAqTPh4lwoNRM
         oDnGTj+tQiwwx/bB6V8zd1QuhD3lU1N1jtDyj5tpVRWpu0jQ2YBmch40B42qo+9kdy1m
         RXR/4Cx9F0jET43fp7KsuGzNb7EfjaflOav2FdskRl+/kWFFLVruFDOMyZWPwkqf16xc
         uoDA==
X-Forwarded-Encrypted: i=1; AL+hErGkzd0qfKhD7xIVGyeJwMm9HO1X8sm4o5q5iNbEDpkZ0CsO3si8kFCr96PIkZGdT6T6StQbF/GAXQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kK2vI4DRDJxQpB5WK7kDNPuvIuGh4b+mstUZ7LIr4FtsZ53LO
	SXcZ8zcO2aFGO0gRAR9/vPEmvRCNoH32Awc76/KwTpgl/kFxyVvDOtWbX9A76WYgAXAcZyn3Kje
	ysjvY+mjIC20Bo2xJjsRbwHqU3cXYnJPHNprFlarh5GTx8sOIEpuKRqH2RFA2WEg=
X-Gm-Gg: AYBFou0xuV3LjSCa6OInF9ieMntXr9438IiLGW/cMJD5ugB7NNjEPADSt5xhH5/KwwQ
	H9x2If0RwmXY7Hp8vOeFCDs3wL9yCrfqd6a2e6qEhMSHOxQrOQ0P73XjJnJlHzpj6HUImx3Yqog
	J21oNtIGzSF6VDTZsmvjERz2Adf5BJFC9femetAbILU6089bDuIIggJZjRGlsJiren86jEFgZr6
	hatjBlcPqdJtjWWJUe+P0vgcmax37mcSh+QPzYU0uUwvDRFZsMbeOi42WtKouM9elwm7Btp3lTz
	pegZZ2BLgK+Satu17eXyUfuVdJEAcF27tOrHxl/GUwbMVdUZOAsj/HcP/hmE48qB47wgrID2+f2
	w6fFQWp8uCCZZt65We9oJosnisfvMm/SUn75CK5pOxSN+W0ExMP3KjY79Wfj6I9GpI3K+4AOExG
	/VXtU=
X-Received: by 2002:a05:693c:87d2:10b0:36e:53bc:467d with SMTP id 5a478bee46e88-3796047ef7dmr1517266eec.0.1794559500036;
        Fri, 13 Nov 2026 00:45:00 -0800 (PST)
X-Received: by 2002:a05:693c:87d2:10b0:36e:53bc:467d with SMTP id 5a478bee46e88-3796047ef7dmr1517245eec.0.1794559499442;
        Fri, 13 Nov 2026 00:44:59 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm9662357eec.20.2026.11.13.00.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:44:59 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:13:49 +0530
Subject: [PATCH v3 6/6] arm64: dts: qcom: hamoa: add thermal hw-bin support
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
Message-Id: <20261113-thermal_bin-v3-6-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
In-Reply-To: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559450; l=5534;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=HcVpcdcZzfHLlTRXvDjqWWHGSNDZWIS0xPcIBTiDguc=;
 b=hf+U5PczZx/kTtYo/BjrMS8HHButnfof4VbnSGNlrM131+LQsr9/hXS8vVqi6jXkQnX1L+s4c
 nDHP8vv/ABKDQyzlZCEv/Atdkpm8Ob9kdbJgvp1q81ahGw+aKgxS3xc
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6ce0d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=HHdy7Z-N7RtC6Qn240MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 9W3thY2y7jxmGrYE18LN6GtU-GhXdFV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX9a6Zsp2YJ696
 2fK4/Id0/ySf6NEoTgkWhTVskFUkF06WQyh4SXJ4JEzk60kB7TwF2pU+DWcxKvQnOrSCFkjSkK9
 1mCEirFlOFW9wfnMwoB8l5WTdOilzcXw3ZYdeYc2TPKHYCa37KuhHpVOXjuvwpJ9B+OTxhbtb5N
 h6aI0H2epzemwLCiN3jtc0Uryozc5GJgEsM6HeonDW1XaeCblb5HrHMXLFfRTaqN+fy8FVrQ/0z
 C8ziI8nWZZRYxMCMXwFcJnSMwIV6rGXKTO8sYt5hQ9+LGFj4LrmcNvxWIzlXm/TW4uQs/x2/6l6
 dV1bRrxtK/WXs3fnmHFC5tx/HvnPpFf4zir19cAdFdaTibp2RaBPR7SU+UFKi4YAiVQ96+pfT9d
 BWOQmcZ5b1t4clxOc2Oh4NufhQpOiKL6MCDuJN8Kq1qiPuwFahiBI2x23bxEe/bLgZPul0yAHvQ
 8eg+0RFxLImrNq8THlw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX2QN+b10OMxwe
 JDlHEilorFFvHfpHBBxJaNojXXKYQdWPnNP45JoFOJf9QEkSR495TexzhJ036J4lVQSpd5K8+9P
 HBMrHGNPBh48lqQFTYjharVPyDdWYaU=
X-Proofpoint-GUID: 9W3thY2y7jxmGrYE18LN6GtU-GhXdFV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

hamoa-based SoCs expose their manufacturing bin in a single i-temp bit
of a qfprom fuse. Add the i-temp nvmem cell to the qfprom node
and wire the tsens controllers to it so the tsens driver can feed
the bin to the thermal core.

Use that bin for the GPU passive trip points so industrial-temp
parts keep the higher 105C threshold without a board-specific
override.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 66 ------------------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 42 +++++++++++++++----
 2 files changed, 34 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 484cb9ee18a2..1124da9817f4 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1478,72 +1478,6 @@ &usb_mp_hsphy1 {
 	phys = <&eusb6_repeater>;
 };
 
-&thermal_zones {
-	gpuss-0-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-1-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-2-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-3-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-4-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-5-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-6-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-
-	gpuss-7-thermal {
-		trips {
-			trip-point0 {
-				temperature = <105000>;
-			};
-		};
-	};
-};
-
 &nsp0_alert0 {
 	temperature = <105000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..e25729ff23c8 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2767,6 +2767,9 @@ tsens0: thermal-sensor@c271000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2782,6 +2785,9 @@ tsens1: thermal-sensor@c272000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2797,6 +2803,9 @@ tsens2: thermal-sensor@c273000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2812,6 +2821,9 @@ tsens3: thermal-sensor@c274000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -8829,6 +8841,12 @@ gpu_speed_bin: gpu-speed-bin@119 {
 				reg = <0x119 0x2>;
 				bits = <7 8>;
 			};
+
+			i_temp: i-temp@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 1 bit at offset 0 */
+				bits = <0 1>;
+			};
 		};
 
 		pmu@24091000 {
@@ -9751,7 +9769,8 @@ map0 {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9778,7 +9797,8 @@ map0 {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9805,7 +9825,8 @@ map0 {
 
 			trips {
 				gpuss2_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9832,7 +9853,8 @@ map0 {
 
 			trips {
 				gpuss3_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9859,7 +9881,8 @@ map0 {
 
 			trips {
 				gpuss4_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9886,7 +9909,8 @@ map0 {
 
 			trips {
 				gpuss5_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9913,7 +9937,8 @@ map0 {
 
 			trips {
 				gpuss6_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9940,7 +9965,8 @@ map0 {
 
 			trips {
 				gpuss7_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000>, <105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};

-- 
2.34.1

