Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467372;
	b=hFOK/Ir9DwaXhfDAj9rnf58N2GTKq8UU21pXWnFqRk/zRLnYXbmBq/x/ovDIyDaaeFhq
	 2iv4bF14qsdqRhN21pn5waXUU0NXjk1yWcLQ521ZabbntGYcxJVyyBq+7QzReGgUwSot1
	 LfZT2Arnw1en1SghVk+MapQnADyO0Guh5riVAW0QCHS+2aD4MX423wXarD0gv6OTp9x1I
	 TdZd0OPhGcHZht5UW+Td+YS20CAWMqHkCPlas4U3RfFRvISXZ8ErZ7qLbqvx5yFVzuQht
	 FcUvBJWGovFapwJOEb3AUZCxg2bUF7gmEQu5n5zpUL+mq7aJo3CH0XKJ10kqedcDobg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
	b=uaJmS9VjTAHwTdb6xTILSpHV1mgNfRDcJOPFsfQ6n2/d6T1rcnPqNxQU6HsoviV33gyd
	 xg+yjkuxGJH8639kFN5YxQDHi2/nGbVLvBdr/eRN04uRPKoxQ1OqoZcKRWw5+DBXdgNfP
	 W4yRvZB3jX1U5P3x5rjEdbqKSS4U4bsAWhtuFM/gbbq6wGcQdUyQtcicrRoo6h1otfUxs
	 7wMco4/NgwRR5b5X4tj1w/27CIMtPSCXPFPcDIz6ycWhDNeqsn4V8UqMTNJj3OBVRwGfK
	 d5kjRZ9DnAQpEa2mWMbPVwjltFnlJ0DZ3/le8NafDWb+1hx59D/0DaeId3nhCkXaZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKYlQclY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE362606A32A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE362606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKYlQclY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJufNc2827631
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=; b=YGlpvE3185+zcNRC
	Ke6y79Wm6NsMW7wrJaITFCutoGy0RJTFyhQrSd3f/2P5YJLxm4aWKl5/u+q+Qx+v
	pUHFraYXZFCvEenCOgBvUsiH+fGFlBg9Xl2YzVhGOHr7DuHoOfYuTSt4/KlL3qzC
	1vmlAHOdP4TSU4zPU2SyUILNxISbbbYrHOQ2wla1ehB4I+X96fAc1lJPE20vcSbS
	kYU7r+y69Cuxtt70ZuNo25rIm7jnVjK9VwMDQq88ic5epIueLXk3Ak8CrSZdczwV
	l0fHUmOJC9Fh0iBgQ2deWU1IuMKOgJnjoFJ3L18DiryGGcMrnpPYrWQiDynPS4H9
	1BmFeQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3m9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a65fca25so2356014eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467370; x=1796072170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=JKYlQclYuzvlvYssp9dqZgpBlRc23gqEK/pkCbb/vCXIKAW/2boZ4q5ZwK+64/ND5z
         hbv1PH3UGz9/BuvwBM8Z/BrQzL/BLDutgdgukmmWfbn/m06BFsrLXTu0ePDEShpUx5MH
         acPPgUiE/7MT8wr3/QTv+SnJgIGA8PE6m6joLKorRoUinpdUji5RhF4SbxnF63Hecvf9
         ooPzhOE5aiks7cC4EcZLGdcVbxqC7K9M5udOGoW/0S9Zo2+ObEhMVzIWRsr4damQMmn7
         zlZXQLXWLXlsvmvkZPooD+l+zmT7j4kq88WwI2fbyBg8n9azZ/qnla+R20NN1wqS+h2U
         fJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467370; x=1796072170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=NnKnCStbXg1A00UC02VAXkb+EYoAQgXCCoS4HHGdUP/SGDkzB6bT1fUBzXzgAtZ/Pd
         5NNVKJjyyB5DJDE0lckTR2vHHewBGmizyNiea9MRm+kBmj/U9ZqaCfXRyO9Ti8mDThfz
         V6xyX119lu7qqrS6PL4HiI5zGFzSiNi8fyaDbtw3flrKIgt71MjjEhIzLFv4Qbu6i43t
         qOInWAA5rb2/3sVvRTarnoLU99Dn+/kxDU9dvtibpwo/o5OCBw/br5cZyzLwKRL5Smlf
         BX/BgGYw+2mcrqBYwjDZQGUbH/sSmTKffuosnK9xXY2lKnBxuqYZpikT/WRoyi/h5m+1
         yI9A==
X-Forwarded-Encrypted: i=1; AL+hErGGoOsp4sdf2u8wtf97Htye88psQjxb2snDfEmbZWaivwdkG2akBZS23C/5CWuExGuE8Nx+AW/64OI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sADQHOpWJ1YkNNGkSylOHiO8HL6g5RPPLZpaoykziNX57wx3X
	GJeZks2Fh3DOXwAQsZpFajs3FhiGNi0C90BegSqdKIOeYkJ+i1TsuB211M1BYbTyTqHeE/pCk6R
	lcUrIuZljNiVo8Np6xVJWvk3KOSsc/QESB8rT6dNu4pWIDq1Aq2Pp05IIdjC40Q8=
X-Gm-Gg: AZFdTZcEmY9tQ1FDy95TdjEoEwy37GQMRjWFu9m1rz1kuusvQYNeuPWAqKm/5nbtkFa
	5XrCnc+RhGusNXqWT7qE8o0GmE8QlanSvu4Aek0dcqk1ADAWDTITc4rAFekOOpewiVAUpQqkLeB
	n7ewYej9mI5qsLhGWsshrZpv6VaRFYNrdNkn2RJ5NNvla4JM0SXKSHlrPfEf790x9x0CvlTGqiz
	Zixpu37qa7r81Dj0CaqeDSrTghJYvyr8CzaHwzakQxzJa/l051pvXwPLgeTf15sE//V7TeVSCEU
	ZryDR+v20g3QynFlpCqjSwmFZVGmzcLeTNSiMGS611GBNB1F+KNPx0SsxbSnCoh+VM7nOmLwPwl
	UqW4AUBvWckfnN1e8GmDlEW2Kn8hFsgtI/Y2FPYba8oUUUrkOglljtz2gfoZHl8coKh5FqKuW2w
	IizBUthN+l
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946899eec.2.1795467370517;
        Mon, 23 Nov 2026 12:56:10 -0800 (PST)
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946867eec.2.1795467369912;
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:50 +0530
Subject: [PATCH v5 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-10-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1326;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vQA8tXnjMgCPq3216Osyn7C4Zn7d/iM3eHvItTtMIyQ=;
 b=7o1OGucmXYOKDo2bVa0gCDnP/K9W9ENk6/wgM8rCg5bs4t98Mb2pKpchVkjKTEeowv0fgDD6U
 tX3jHhP85+KAH932WIpkebZ5iOE3RIZeitr08mZfWSp0Qe5nSe0i/vd
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04a86b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: kGWs3LabhLtm_qrxu3jGUU6J-OWXTl1p
X-Proofpoint-GUID: kGWs3LabhLtm_qrxu3jGUU6J-OWXTl1p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX56655oiwe3uH
 JmMTQgRkauvWZRDi3sARVuuEeaYFrgslAJvkxrg4p1utv29lCqXMs0FWifooADDQs/xl/NU3qhA
 uTwzQLBUr5yB4Q2qaQ0U40j4cANXz5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX+GAsAurAoouQ
 qDXvRmk6I1t/RRS0l6lGmCP3iDsbgAuCITiDjSTu+VODCMpWlOFd2+mNKJgxeDUYNPQxvpbGjbg
 ZXMDikhzXk2yeBz8cV4WHrZttGmuK8SsjGmD362nx440ijviA6JSKLJzZVnUKnhnsMS+hAy7XtP
 nLC0D2GHVgdSXb51fFgP8/2IRgMXKDS2SPU/1M8QkzT+iLcJc/N4PbvzkFNieQwdlHtLgsKVZYP
 Igk1Xh9DiYdq3ORmLAnkffMSxrLv6qIIkAX8Els+7ftY0R53j2cywnZOczJZ/VK7VvOQQYh/Kkb
 9cdXU8qLCmyXAmIKRp8YRwGITrI9rMI91xl+GC2TdLGg9rOk+11SZECgCZhQ2WWMr0zdIJz87Tn
 JsAH0B8EwfmKQsi3JhhRWT46EM3m7nIHzT9zi111lNvPgYGGlokSLvvh63tKqHn7ZTQFFFOJarX
 RRHrfhfuSIfaAdjMMtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
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
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

