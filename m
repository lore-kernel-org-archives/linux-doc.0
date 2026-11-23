Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467386;
	b=XQEJ2+GMCj1+qtfLtzuGZHA+vmyz1HIfKVPLMqlVKAu+C+nxHIOS/hOMy/BwuizY3bj5
	 kTFmtSPgbKTfvMHFW2K4as1zwQBmMv8fLwuMKw1bA67Gb/nRp+LjfMe1pn8J9P1MuV72Y
	 WpOsIngKmZytcLwGLoTD4bWvzwLKRxey4begEgEd9ydm4N86luYpDGyuf3odiD7fOiza8
	 aqf6v2KCgOrKKaX8M16PTl/PytLTSQreoIG3PFUBi2TDLfEg9ZFp61XcqZ0arzGqWSiOa
	 CBsxStjiEs/qedN8lcjACac1fc0aGdMVd97E+Xn/QpKSzxuyc4UIk5jrQbMpwxtJGXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
	b=Ij7yN12QrqgYkh6MiLR6TY5cIlit8H6u3T4zvC0LBkMGj4ezafwTWpxyqEKrSbv/wLjb
	 /Oqq8GiZ5dybYGF/mnF2Fdd/XvtmsjkWSChuJdzhY6Jid8sycRCyUyIZgo30TGwWj52yh
	 wwvgpl/N0021Df3dDrKyvIDc0iUZZUXpb6jE22Ow59KM/qwE2gJUfJMEGefLiKiLmt5kB
	 LHDnxfcDQYK6RehejdReDfJNIjpcAkIG/7VRswR5LJ7tkTh1kz8O3y7vpdHkKXmYezogI
	 GQr08XY/AulEkmHTr39Bm39QXpQSwXE/HkJzO93QhFY/yENAMBGfGpa1V6mEXE1gvRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Olu07rpe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B767606A321
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B767606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Olu07rpe
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuaVb2973605
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=; b=H2z0940Br/B6IYM5
	v050grSbNasErG8gRzb/FuLQCmYqwrHcY7TL6CmETJ3DOvBxKlip3EH3Qqqd4Xmi
	waVlwJpkhabehJ00n0ZtXV+qS5WtOjhWhF/MaR6ySBkRI3aLCmvHo6pKJNtsieqL
	e/2it7vqG5XlXdyboJ8N9rmvxMxFoFkKMRgR7bk73Z36d0TpHMALUCD7syoZZO96
	L69IQ6SpldT5XSP0828uLmaNCwpsp4bQODJcCAc7vm0ZZ9wKvJES7qbp/8fTQmY8
	tew7zVMnodslqlb+AFcCaWEKATXT3yDcWf0CUA3ChfhBD8wHuscNSM8Gk8ZkFnpL
	HIEk4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03fdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869865a304so2098322eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467383; x=1796072183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=Olu07rpeqo3Hu1bcDlZO9+luO8T2OwFWlh2HzFjcEkHEloz3QFb34g8OUJVvKzR1tN
         3bG1b2qsESxtHGiKS0wVjiO5La1l0TYrtgZyIHkRwagSipoRGI9Mmtcz2ngfdKO2Gg3U
         85yhqeR4JN557Ueq8vX1wgCNmxeNbrFP0/RJNr2g+YTHZxFu+IxKoWVX/6SUAn4W0DaD
         CYXskwS95nTLLPdHZjLfSWK2wxUEK11pGdzzgCbXBA9ozEMwMpvVPbotJkrl/x6kB+Nl
         J/o1+T/Uy79oU9pL0h/vQ4vkxd0TMMoxoNc6VwRQ/blo97/YCxfs890mJB3cLQLieeJR
         UvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467383; x=1796072183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=gQTPOcrmvRLdTmLPDVKv8/YaEPhSIpgfu9/8i3jS0u8lH3B+JNtXqy3jqYfXVu/MJ7
         ZX6GEYAYG5FVoa7Y8qW2CJqtMbxCzJiXgXOEFv/WdY3CHQ0ffDm/dDjXmCBaHH3uGN4q
         9WdfrA1MKpKBYV2ZCi5X1nIQBNUB5F/7cULa3snDcActZDOSNVjtgXs321hE/Its1REg
         l0Mdt5dDCqZCWRi2xPG+Y7aaZ3Vvlh1GvVheVkTgR2aZeqXaPQPkHFg3sq82BJ5jc9ea
         fElEAO2eTgLj9CgfdMW1uFGguRNFVhiubzyxlOj2LmG6aMEghfUZ83FM6LvKcMQEXhk7
         zJjA==
X-Forwarded-Encrypted: i=1; AL+hErHt0+DK4pZ88ykgqiCIsh8IyFuQuwe+24cPKcIs1QvQZwwQeA7yRdxQ5KGFKcAg/ykX9XPnPX8yBlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z98Sg4vsVSvbGvFGir1cxCh7HEp4x/1xhtwPM0XVMt5TdrpbeKn
	aKlfhbQfi4jgd3Hrch+l5CL1GaL/DfMY20kGZB3mNR0lQvTjpcz4Ru+VrDnpa2ApA6doALkFzPo
	CO1bZTfzj4QqyLSgXnsHauvLgzuYeq3PUyAZEtHEka9fBVzKGivsFmhhpkzDEAiI=
X-Gm-Gg: AZFdTZcPQ/SwP663xe5vVq3vTbpR2qzfsWS4qlDGKr+WvG6GXXs4JH03JSaTFANcDZl
	+26qLwFfSiwObLPxuqHfYUc9rmtmfRVnFc6naQkfS6X+M05WSTMfI69WBCa5WGwSTKIUtU/pGz4
	qNym3tWogwFnhGA4nGvpyemG/7y6wTYtK0dzaiH7mt9RrbrOMYf8holZZlZPGcAYkSSTzLhgzrn
	0A/5IWHkptT3NiIWEsioN3u9Q1vX7jCQKgF5NKfjCjS9fULjbkPicEdhjm8zyV4DWNe8JS2ssAr
	4zkVaDa9YLSmjESsgqjAR+wFnZ2KlRW8A8tw4CiC0bUJaWWV8DAT3zy7/doo5FVwrl0XGz85Taz
	U/MF3LuCRChzSt8tKJL6iexluYKbUDbAMnD9lvIPOvB9Mo7PxKpef/QSR5dHV4ZdrFT+2L6/TsX
	/0UXvxOf8t
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818077eec.19.1795467383422;
        Mon, 23 Nov 2026 12:56:23 -0800 (PST)
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818038eec.19.1795467382818;
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:52 +0530
Subject: [PATCH v5 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-12-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1198;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
 b=c1lfg4TaQF9XXCtiV+bWHYb+IQQy3xyZxsYuABAYVnTRz7kwnthdKHQVzbWpLFWVTQ0yUfG/o
 wCE+6d7SD4uDvya0APz5YCTuTN4NDHptzSZdB82hrfdPR3sFiuqSBT7
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXx+CoxVbJ5WT3
 pgV/B1vvyZyj2Qb5A3Fg97zCBLnD+yHje3M6IVO0EdV44gwxpNqCbXOYBKnAtYycq9jk0fxbpPg
 d/FD7c5AON1bt+AlURtHsbC60MfDGwcA1m7UVpMh1ANIZodDdcHvpiEIxQtw+TAK4MoU0dOSMjS
 yiWgJsGFUuuANqUc3Bs8jfUUUn0K9ZyKgwiF4LcKg7HHFo4/UACc19xXoZjBkbL1jYa5f+w0J3M
 I0OKor7wlU6xLvZOduI4u2yXBq6ZHSvfRwMcaKgfNUZ4b6MOkEKLz0CdWFDOWe3766C7SgUSzjF
 tgmI5b407zEOoejAxtIHaUuzSLTIMjl6PVgmkTwg4X0C91d6iVknUAp6M/rWH3ZeaynEYor0lUN
 tHdlTXwMAJtPvA08qmVN2t46Qyr2EYjeVzNI/Oku0Du3X3FA1fwyot19R5wiO60K3nhvoDyKGn9
 RvretggjCbZ0/X2XPxw==
X-Proofpoint-ORIG-GUID: To7u8NRkF55yR-MiwkVkrBjCHbqFDwNd
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04a878 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: To7u8NRkF55yR-MiwkVkrBjCHbqFDwNd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXw1MTm6S4zL6S
 Risk3qHFKeK/Pjv7S7Q3L5ptlyubH1srmdNjrm/+ETrEIBdvGguRMlTaaEqnywNmNXlsW/ZBdWU
 V08w2nJkhaw0gLw3nJzkjCzT8Al8kb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

