Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F18486620
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938080; cv=none; b=qIpy+ADn6hQA0YVcN9NHWSDbImYFzdH8skTmhjp1sQbrrdB6Ms1b7anfXrHiQFMLQ3JFNLw7Y2S0149xkkQPr7pd6Zz2V4LL8lFi6SI0WvpVFH/noWvUiERI1u1v9HdcOa5593FVVcMjhSMS9Ac2HgdoENwcrc57IF9zFxVwsS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938080; c=relaxed/simple;
	bh=j4Bs3hnA8BSZ3VQLE84UFAh7sza/5IZfI8xwIDhVRIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHReBlySlOlLFOs2YCXWilZt6E3fKAe5dhmAvhbKZXZHY5W6r9lLX1iwvnqYUMx9ShkMb3HvNYaJ+OJYaVXsZRdUFcQOBlbHz6kb5AzB4OqzcMCHlO4ECF3077Dv/uJFFF8S4D/B/8xkOPttwEN8QUQO2RQRMm96WTYWHQNukeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fz9IWWIb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX59mAbv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fz9IWWIb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX59mAbv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929ns822063053
	for <linux-doc@vger.kernel.org>; Fri, 2 Oct 2026 10:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FabfbMMb1AZ72evxr32ilHn9HxRsvfEwkS+N5T0xFvg=; b=Fz9IWWIbW8ApwBQR
	Yu/SwiNSYTjzbEu925oZWKtKVdPsMireFYn8TOVANd3g+ZEBgKaa4x3TWBTw2EtR
	ssbqO1RKXsrWr8dMlAq0ym30dvxO3ymbKqTrWW8ehw6N9CfZg3UUQ0QdkeWqs4bZ
	nH/ZzaTH0xYKH+Ayiejo/lNQXX9Viqr6rA5Bui8LYoAKuy5sIX1E7acKQ2Flpzx8
	DmBpCWKiNRvBOw7wipp5Ay4KUc4S+7VrVy8yFt4NG7Nc6KMBmNthG6gIy9tgds2i
	g8qZToAAyruP2TIC06VCtm4Dg0tM/WUkMkuQjq4xT27KWPy+kTTYirGIsd5yVOms
	pjScbw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256ms55q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:47:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14364a88479so229228c88.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790938074; x=1791542874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FabfbMMb1AZ72evxr32ilHn9HxRsvfEwkS+N5T0xFvg=;
        b=NX59mAbv2LKLp2Uy6uj+ZwtFTgDo3N61CuFGZ+JPWJCVKFluZYNgCQpeK9deKAqCG2
         EiQubLLx5SWZ4xqzZuzvw1PUi3VtnYi6fjqV61Gm4hSgz0c77H6l+R6czNVv9Tgv7gVL
         +9PyE0n+uAFfgcM3C/p6G/jbgUWHEnC6FelUlP6oYyaNvttTmclG3erRoEDS5LtBx1Ah
         nA2sCm3NYjoAIYpoQWGaZUFUW9BInoJJ6VIgOvamcx63QbNiWNyQ4IE1PWgeH2SjtG7m
         0yPFn16FTHvUyuMsxF7V/5rBUOEuS3/uXl03F5HflC0Rolx2XTOKSr/SZXdYEObzKUrV
         iUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938074; x=1791542874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FabfbMMb1AZ72evxr32ilHn9HxRsvfEwkS+N5T0xFvg=;
        b=aVcRgQaJUPtzGDO4/d9RSGSrbft9/RFY83MVBxb0OruTkdGuWqTZUQ32x5SQsaVi03
         HSP/C6oS1b+AO1nCecgr2jJhTdahe141tqrWaMzWGHlUNHWzolE2v7+njBMTR9AaHbLM
         lFS+felviBQjGUJKHvw5z5mUQCsvQ9p/jhQAXHCJsKu82abKntIPVIjyaBc5aB+w5VKO
         uv67YruaiJ+82tCvvRlC9kjs5HVzQ382W+iY9NCeuakJ9o6OxmE17ylapGCjmxD9F2vS
         nIF5F/7cXD8GKHdA3cd1qb/0+9LHyUjMlqdvLXuFcyTst6ixm9z/nNj0BNGP+UpQZWpw
         5STg==
X-Forwarded-Encrypted: i=1; AKwUvByyj43DSYlg65wZ5p8yblm7ppW1Tr6iMcfsMNvVv+Hyt0y+PwMhfz8CnAM6Yl39yAxCnrDM+kVh2L8=@vger.kernel.org
X-Gm-Message-State: AFuF++kJF6pCybK9wZB8kLeF6ASMXt7TQIJLTgClIaJ8Sjlagan+0+Pb
	VbdsOA3C447ZB7OZ/Gt2jBH+0qy+YBJtfYmceQZTAYiyt4e9co0f0+VSO+ZyjHx0UVRQTW8qw6s
	NZjmmZYDNcZlK1agKLBYevToTEUbCdPEdV5ZhF9/nWYk+Ct3hpya7bRPg5MLcBQE=
X-Gm-Gg: AYBFou3WTN7/D5lsD4TBEWDDXUIPNxJHHPb1BGvxpjbg1MXgAEB8En1R6UPMLtZigQY
	9F4aKIDyNDmdjo/VNRqZK6zhOHjSghaghlFME7Yh8fdzco48lVEkLgZbT+EYG0egx79XElFc9mn
	dezLZIOWH6Ppem+OwPZ0qHNZorCseTsiAwIAKe3X6/AEqfRJzYIBG+UQOPlMYqSXAwffXzy6FvP
	b7GYOVTGDh8czjyY60vYnaCOBe4IIsj4IUPqRJ0cQ26epw7H61t6W/J/lsjQ4TrooR92bi/9IgZ
	0hrFgeW6fDCCNV3wuurhyZjMvCuWs4D0E29hs2WG1rnxRF+BiE0kJvikQqy9HEJgrWX/Skbewqm
	rowRWX7y41H7h/bDBe0BK8xY9K0gS
X-Received: by 2002:a05:7022:5f05:b0:147:5261:ee2e with SMTP id a92af1059eb24-14f5c4e7dd0mr2580952c88.21.1790938073580;
        Fri, 02 Oct 2026 03:47:53 -0700 (PDT)
X-Received: by 2002:a05:7022:5f05:b0:147:5261:ee2e with SMTP id a92af1059eb24-14f5c4e7dd0mr2580911c88.21.1790938073015;
        Fri, 02 Oct 2026 03:47:53 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm10645191c88.4.2026.10.02.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:47:52 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 16:17:01 +0530
Subject: [PATCH 6/6] arm64: dts: qcom: hamoa: add thermal hw-bin support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-thermal_bin-v1-6-5a29be7e8ec5@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
In-Reply-To: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790938020; l=5474;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=hBHOH9hUzmE9sx8Bc9LFZcHM9fMwkr7GcgBcqYRsJ9U=;
 b=yTAMuPTitFFLtCEPtbLMhr9RlXIRbRCGP4/QyAK/xFtzIYPCQQYaQ1NPhB1mjrr+mQ/Z2OLlJ
 Hkf827x7FWrAGX9CIggAfYNVhWxYg8fJ1WqU0oljEZT21h4NoVdoDTh
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfXwXCup5tzK9JQ
 Zr2hc3mTZ0roTWV1UFE1nGOOH5u+14sw35jN0WIXJqNFd823Qqx6Jp35xi2eT79O0DupECw3MNN
 pdJrhfXIy4c+ljpMWGuyJ6xyOcGvvAE=
X-Proofpoint-ORIG-GUID: yDapP0FEfL2WROBMoeOgr4W5UMWO-pGC
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf8bda cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HHdy7Z-N7RtC6Qn240MA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: yDapP0FEfL2WROBMoeOgr4W5UMWO-pGC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX9jvjympm3CoB
 lBUbXIEODgZ9G3bk44s59OuRkwf6e0fwmGaNMJtyF7IOEGWx+0FByGVlgASUFy4TRsYXhNqb0fp
 aeR9MRcdylYUBSLcuJEaW8o7EW6y/pMCmXU7yhq6pVHMPbM9tUDkJWVfl5Uh/TofMGycN73ciL6
 B0K1b4WinwuSLnrsuNn0hADvMS74gOsE3HJZrvHazRRzhoFbZQRA+XjGUh+SVq7g0INR7Cyjg5q
 Nklya5dV6rEkDuI48RlkOUzVpHDeLhnCp6FQ7OrI4FmaD2CW/dKI83RBJmn8+Y45u7+hqQ3ltni
 dQnNbEaC5BgET9bHlyaILtBLMyh0eh3eqJdsKhJHdZgEc0FCM5z/dE+qKJ8uqDNxBAs7eF/dkJ6
 gSBpjaIHMfOyJzzJKKg9MbRXYuV4eFao3N7SKguwmBC8h7h7ZFbbxK3z8nXxDqTsz3D/9B40+bC
 Cis9pErruRl/G5c7ucg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020042

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
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 41 +++++++++++++++----
 2 files changed, 33 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 776bded3a312..03d753a0ab74 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1553,69 +1553,3 @@ &usb_mp_hsphy0 {
 &usb_mp_hsphy1 {
 	phys = <&eusb6_repeater>;
 };
-
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
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index fcd88e5f5d7e..c81f4bbd5b90 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -2766,6 +2766,9 @@ tsens0: thermal-sensor@c271000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2781,6 +2784,9 @@ tsens1: thermal-sensor@c272000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2796,6 +2802,9 @@ tsens2: thermal-sensor@c273000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -2811,6 +2820,9 @@ tsens3: thermal-sensor@c274000 {
 			interrupt-names = "uplow",
 					  "critical";
 
+			nvmem-cells = <&i_temp>;
+			nvmem-cell-names = "i-temp";
+
 			#qcom,sensors = <16>;
 
 			#thermal-sensor-cells = <1>;
@@ -8809,6 +8821,11 @@ gpu_speed_bin: gpu-speed-bin@119 {
 				reg = <0x119 0x2>;
 				bits = <7 8>;
 			};
+			i_temp: i-temp@180 {
+				reg = <0x180 0x4>;
+				/* bits = <offset width>: 1 bit at offset 0 */
+				bits = <0 1>;
+			};
 		};
 
 		pmu@24091000 {
@@ -9669,7 +9686,8 @@ map0 {
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9696,7 +9714,8 @@ map0 {
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9723,7 +9742,8 @@ map0 {
 
 			trips {
 				gpuss2_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9750,7 +9770,8 @@ map0 {
 
 			trips {
 				gpuss3_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9777,7 +9798,8 @@ map0 {
 
 			trips {
 				gpuss4_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9804,7 +9826,8 @@ map0 {
 
 			trips {
 				gpuss5_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9831,7 +9854,8 @@ map0 {
 
 			trips {
 				gpuss6_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};
@@ -9858,7 +9882,8 @@ map0 {
 
 			trips {
 				gpuss7_alert0: trip-point0 {
-					temperature = <95000>;
+					temperature-bin = <95000 105000>;
+					thermal-hw-bin = <0x1>, <0x2>;
 					hysteresis = <1000>;
 					type = "passive";
 				};

-- 
2.34.1

