Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467346;
	b=kvn/rRHvf+W64yuLt7mEMo4e/VWpiu5eAVhCRzqq8/h/f/koHSsgQPcQyDTU/e0FBSQu
	 glMGZMVb3uAXvSKkgfGZVlXorSd4fxJgUlMIevXF+bUihVr3Vi8yhWsiGX06FHfU3S3uw
	 yHWS2MiavWqze987ilPnD4AQdwb6FUileW5/kRswhhizmuaFZ6nwFrnajdnF0nKoKmdGT
	 88vXqQ9SRLWytI7TBvbDo/j54aAeN78d9A6BaYRR/GC2BvZm6omfIxnV7/6lmgGp0zWyJ
	 yKXNBqI/jprNS0+PwRE7wLaZIlikvfv4Qt5YAaaaM2XjDlTuvgAyCT7+S47Nkf7fvWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
	b=FNhIjisjgOesy9DQo+qPRZVpE1nOTXH3iSW3QMkPdaNztFIUwGCZg2hJsP69Xh7Vi4C7
	 FDPQbULHk4meW0O+XnkDgMccGJ2PUmy+U7aKzSdVdSSirrnkqnN0H8qAN70btOAifyOd5
	 U7BdukMPDwh3j4lqNEoVr5wPcRaw4WZtiCverVE7JpA8eFnA+w/RxB7E1dZvquwHJDcMB
	 /obpZjFbrZZG9vLbO7HZcbNUxGy52Za3CpX3D8Na1Uy514a1FR+nn7fPcvboFiyfa/U3q
	 M+mycIkGkWbwYBWBdTQ3nPN+OuoUTfffScQaDVwjSv0R3nKACfFHi4gSXHyu7PQnJkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHZhb3Vq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96912606A327
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96912606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHZhb3Vq
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuQML3255325
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=; b=TfhYu3p4HLmEAiBW
	Ys7hkLgYGRWjH2zZ2JTzF/Hy+/oTcf0+qFKPXf+uRkCIdFMimev2n4D8JQvok3J6
	Kh6ZNpFq8m26tpUe/caZfgwnDGhD0vzsoH6Mk6oHJVNfV/6Si9txQhQ0veRvGgzS
	omeA+pcT6ia9XcwcDo81OK+CBnVPr0QXKy+eMtoJIi9bLdTXuienzgQkTjwsomFx
	cpuCZTDG36vYNs+xyjemhHRDbT8E7DrFh+SaOGC7Ei6HpULF8ykRc/3TqA9AQjgZ
	G8Pbu4uTDRZTdZC4pgMKclogz9Y9mkcLm0QOeOrOBoaqz/6JXisJ662s0C+hyK87
	toh/1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbcy6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so5565331eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467344; x=1796072144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=UHZhb3Vq2Giew2FK0Aqmns/RaGLj05VTLHFhNJJQagLICQPuIZMYg+FGZmijYMVgZf
         8xEaEta6924Lh18aY9gBYChrLLAA6LKTSi/ipdYWP1nZNsfbJ1Yei0dmK1MvqoHU+NZW
         X2AkXx3B10nem4zaEzcRYP7ZrbWECn5oQgw1hf3YUXQiRsOFTKnQb9oB+lEzHsFUiZgx
         sEiR0ByL9YCbipF4uTQ1Pv5PEUWv9DtCTkZr2OobNFfrGZsWmSGU7K0MQ3D9CiGhZwS8
         n69nH/ERdpRFG2IJr/A/SXnCNqd+unAFaH8vzdSCadCJVPPK/Uu6nUg+VeF/qUSVzFzH
         DptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467344; x=1796072144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=PmsLTmmIwwqiDvwkUi1VrKFE0+a9pGbDp5ckmHbL71AO6zOxM8KhFvHAXl4eWwKe3I
         bs2YUn0ZVlaNlawImU4I5z2TJKrkmBCALJeCWcMIHGBEGM84kZURU07qMeWZsK3EjL7b
         aQslStzWzki7MYPsdbDcZi0SIfhRo5iwPytsjjjXGb3CVCZyLm/FWfbVZfxtYaeGvzkw
         kujraGlEXGAFdXnNKQfoNC/ZYNvbDK9TS8w9ma0mi1CtvZSw7cLnLh+OMvaF60Ej8lzq
         u31u6RsZZfPpWVW+2E0VyIOXh/z9c2ecb32enJyxu9AA0bXSJIEKqom+avpgqCukEU2a
         zjjQ==
X-Forwarded-Encrypted: i=1; AL+hErH7uWQ1yFL/qoNRwggkpP9SenyoGlaiCML3WyMbmbuZzkfrqkUiFlpKyuS9ZVafyayiV1glc4Qx12M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yl3KF6lIeHMjgWp58Je6BIGw+U5ZPJGrjYgwRl3SVnH1Dy571
	LkhvKFjLIWeXTjOCsm7fYqR64WsLcSqlXVh2XEXG2r1V57t2XcIUUS8RSpEfr3Q8LYmN7jv5Epi
	3duEK39iQjpIZGvJCJTTVG8YGcEJx4PU0b/GgnqCpn60UzvTVmBpFz9LtMRh4AGA=
X-Gm-Gg: AZFdTZfHJlDzky9kDHLPtmj6lFAOEE8Z65T0yPfr2NEeRKU1IFqRw6FY5dMgt4ouRWI
	8sXFQ9Cv1Lgg1v6Zf8jykv1ucTnZ0u56YiFTdX6JKl2Wa2QXUGEWOw+8bSt7vOpr5PoqqUXq7gN
	52bmjJAphivL4ndHu0BM0oJVVIh4w1vqT4pn/NH1xroJVvr+qU7RA3xw8pqoHNhevRjohpSx5HZ
	0Hj6+BmSQoBWSoLiScnb5feMqFs1qKfe8TRd025lS+OMWwvNiagMqS+YJIK6Yh8BKs+PpH3oEDf
	EMerL7kZi6JtXixhtqNR1mnee6OHGgD+KSfCtd/K5JSAwdBQf9uIyg8irN7T1B6VXyMKvCa9Qqa
	ZT4f7v+9B6Tc0qs+82Nf641pSM6Dk4f1D/AuVdep0tNpK7PQwy7hTIRXAxQjKh0pQlFUaOh2wum
	3nENmNQRlu
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202049eec.31.1795467344395;
        Mon, 23 Nov 2026 12:55:44 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202032eec.31.1795467343843;
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:46 +0530
Subject: [PATCH v5 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-6-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1301;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ULRBXyIFz867Nh5qIBr+xcji/05W1S7N0crGceoW2e0=;
 b=XGzMJ068AmLrwGRQFHZFLFtWzDcU2FDiEN2mnxyhJfAeDvIbvp5Ol0ciu4Eu3D4VdRnPuwSnH
 20QpK2bPny5AjjLfjdfTcw0eenprUoAhNjIvJZ2etIKzHw0OSylz7HL
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX2T80kOX+a0XJ
 HmeGb3tTJLk+bZoDuy3fIM+qX0OoBnxcYCUrr3u5i6WrQBhiL1tXoWaVp1qmWdKUe1lHa6yaOTB
 Na5xuvW7vWZw4PB4nGcjbsVnIVUSE7+PYEHYU6l9gF/GzMgkuZ+oYoFEbwqAsMkB1krKvLKnt8y
 PeZj7ZoSPMNCI3km3OLadwo5w8vuFfymOO1zXDiBDHcZM3yEuYhotFS4O0oNpL2bwj5LW8yoh+i
 4sDc99jra2u/MXuVHS2FwPwvgQriNFTitniBEI+ddbeBqRVW4ePhtqEJ445O0jv6P48gmy/DVSF
 EJAeJikMBVhkk14/u9E2saeHdJE4tBXWGoQIy2AEIEJPdmVNpxHJbFOe0Wc4KgSHeXqI+3FtvVv
 mTlxTDEl+GoSwd0teLX71I5cBuaL7nZiCt4EIQbn/blDHmFy+C46wx4vgkmJi3X1SKvuc7YS0ah
 /Vh/hdc+CUn53kGMejQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04a851 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: VTGLM-MwSr2_6XJYJsIbXb5OOBIqzbd_
X-Proofpoint-ORIG-GUID: VTGLM-MwSr2_6XJYJsIbXb5OOBIqzbd_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX1aJuJFyHWAc1
 BPyYEttwn7HInFCgMKysaSjF9sDR+JoxIdzGXZKDQyeuYQdRK4JoSbxeBQtGS9Lpr5A9+jhgGW3
 ecfePG+RICds8ikiyKeAPnsZB1zwQwI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
index 18692893ca41..f0c252a386ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550ba-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550ba_gpios: gpio@8800 {
 			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

