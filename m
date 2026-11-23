Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467340;
	b=xdiJE2/sV/j6GdnSphPIKf7h+nwXOJQoMAcAb8lovunRz58pOMM5NrAkCrH5wcoq/8Qd
	 TZukRvatNOtbgKl30Ve4lDXUeUMVZ/vScJgLKVUodPUvF72mdE6eWDBYG4eJam69SKnRc
	 QvDjL2ErsSrCNItxhL60tOuLRqt2+8ln1GnE0MV1Rrf3n7yTfp3qOJ1HrXcWfbTdfTzEo
	 C5pa7loj5FDk2hGNDanUILqaKoAvs5QAIV0jnwXjo2jyJaK1Isa6Fh3wL9EiirYlbr+W4
	 Slpm36H+ZmQnlLW5S/UIWAptRlFvvm7sEkJzQKT+S/7srXp2ib5i34/3PuVwnR9+73A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
	b=F3qkNdjxo1DYvkz0hIMI+mPCQlm5kyyBOdz8IJIyyMqoPzxKm7tqcbWhmFvR447ujEwh
	 Vikp9fcGaL4j/Gs9Rm5IsKK/bOv8twM6boxzUlAvNAC9cGFpcGCqwsNOfOi6rgsnfMHqK
	 cZF3YjTMJbCSW6dD1BCGVcaRwAOs5fCjlWs5l9wGap89NlwWARe4MmsA9xMri/RzX3nN4
	 HQxz4aQFEnJyNfXJGH1LJICfcKdHCPYmc9OCToHQC5g0SOsJdVYxNRv56F3ugiaL3EHOq
	 W0GQmdjhNNtIim96gyPzwD664rwR3YdZ0Xei5XbHZvXfZpxUY1sKANeDDrxl/B33Eqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAjSoauk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B15606A334
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41B15606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAjSoauk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuRqL3255339
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=; b=UWLFtAe2S4Q8jUG3
	mTrIiniGHu/xf1FQ8LVv7WN3T0HiTcefhVSzp70zVDcu46R/EiuwfBGr2oSGGxvg
	9+zfFJ5m3j58wGgTWFJ2oxM6Ul66PA2Jfoqk8jKiMRMaS+zBnoXqDJopwLiOixKi
	EUQo1bGQMsTmjE9Hv76okRuAIWfunDw7UcaTX4vMF/DmWB5Lg1Q7/m2LYJLB+bbI
	j8vvvTDgc2DtbhnxDvcsaHSn9QtDPIiSPz0PO1POE3uk9nj+o5Yw0MP6DkoS/d3x
	KAasvX4e/U31MVLVZNeL35+PJ+8dipLM7OgAOaW/JlbdIGxCwxLTqgvRJJ+Tfd1v
	iI7PtQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbcxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 20:55:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4183184eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467338; x=1796072138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=gAjSoaukfJEXi7HCHnJfD84msTrNSOX5ADp+UcztIDKxPexyTGmRpQJxQPloohS9kM
         JSaeXyzXDFM7XqcScqwbQPei9FsYtZldxFzypyZyoGR4cGm9g6hNvWeOQEkOJ2rlHM/s
         bAIN6wTWrGdaYkSNH0FGWSkbUt61fX58rvEj8qC19YK4Zejx94Fits5neyxOjeUHY6Up
         lGJEi8sTDVDGJy5x5MikXR14JTVDn5rA1WFV8uqP9Z/KUGum74cQJU+p4X7GrdxamoOS
         TCqlTEEVb7zakToV7BedfRbXLQ0OIgUUNhSUUC15t1AoFDntAg4T79CogpM94wI5ZO9m
         1JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467338; x=1796072138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=FRbInyiX/VU4cp7VtWm/NG1x0uyD5wDiG703JeVj5Hxbfye2T1UMaw8kzxalzpzcCM
         7YhwQ9c1p126OPyBTWefP07YkA6oP84fe8YEtZnEyZ7UKit1v1Ni0s4GTC6F3o+zNgk4
         pFc16R5tfkDI22/PY9JSJkBMBLjyPi0qiFf61ceZn1t+cWzjF46uhEDR+OQ2pdkXhh/j
         on/IicsFsg4x+UsDX8YJU/1VTYODr6X2i69XZsaJsGkHbieVcD7KgepbZa7UEdE4SDpf
         dsc8RnCeHIpapbOhyzIVwO/5vCdFNr/yCidGCjxesIMRhThvozXyZEPUmzcSZK9+ZFuq
         jg0A==
X-Forwarded-Encrypted: i=1; AL+hErHMBNpjuZB2PJDe79S0D9UbLcAKq+xEl4gyjjT02qmNbFtIQbR/FBdIdu8htyms6/cAe/SQNe+BGO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nlnYVhLJO8OfK3Dta5eVnaTCRzrzlYhA+DffzBw4SQxSFdc6r
	rZNyL/HgsuBdrS6RdG7Tp4z3F+7rru8hNfSqP3J/Jyp5e2/rHp00BpUcP/qZqnE6MeJLH/nOXwu
	tFbb12tKt9il/nIC8itcz+YFI1KjofOl0Hb9kSeV/4D8oFHdqFO6aCWykLVvUM3E=
X-Gm-Gg: AZFdTZdgpzQKKC6B74v4zndH09WiX5VhTPOZSnvmyh6GPp/y06zpeRdRqFyAyBFTlPQ
	njDVgaotckIjrEM0mupGn3KWqdr/7uGqp0OmXBmoDqg3DNlP3liONQPclwX9FY31lZBphbJZVgA
	5XAttEq7VuutSE71ZZNRnAvD+zygPkQoLOyTvJFbsmb4XTxyWwf9JYe3KFr4fM0wTffdD8/zI59
	xre4+4+1howLTP/ZtBppmdKTrByQQ8lr3hvc44WPZ9wfNNmR34Y+m4sjLmcLyF1nHPNqgKN0Gu7
	zHa1sXNoSvNuaX0Hfx56nQ6ouN/WQ1gAOYpF0g4JMPHksXIQ0WlzoMoP1QlneRz9ghQZS7wbam2
	hSUYxyTjUUelidZFCg7Fw/qwoktsengqTW796/2b/0YXGnTcnlXQlQDTRw15zrDLQkoTAnmEjyA
	xOl5POy/js
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295861c88.18.1795467337937;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295807c88.18.1795467337385;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:45 +0530
Subject: [PATCH v5 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-5-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1300;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=TQ8oMR4dp6+o4PLOcph+lfW15bcDXGH73jPsR+cwzaE=;
 b=C5ta8bd5Vrxxa5KbLb19w2pR0Zq327fKQRmZ4/uw81a02s8hsXDOFC662q0c8jyTj7xt/Wwxl
 kTo+phYoe7qDJH4Q+Mo6ZhjupbPnOQacYERjTqPlw/DkZBFXITGkTjB
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/mQni9tuVGZj
 ADtIJi647KkY/QWYBqQjd5gtY1auoiqS1PATO84SUtfkzriMqd5b2v+gyc4Zw1OFCCMV31QVwZJ
 NV0m/F3w2p+34f6YSWfPjg4L7IgnDCHGHSbdMkZen2MIEJbuCKiABrYB9KFuO0GLfojljCtR1Rr
 256t3xSfpixrpp/Bnhkp7zwXqexG/OQXPbx7ETK4Zh/HvQzR3tXvsPrT6wYih67AQlDg++TBaju
 ocd4V0RB88EqqpWF7M65SR9//t6SRNyXZt8OcdO7yjE3o7uiDvuet7e+D6nmC/VDHmxF+rHV16h
 PLKSc9J3r6Y42oujEM2yVblS5lFhf8gljKgJo2LhZQWhHwz61QLUCmI8ZSBGyL/8AKDTL/UAA/G
 rWCRdLWOkKYo5+J+Ke1Hsmf8l05tLAVZqQkfu8/hk/zmBHYl47DQ0dRiGMzo3dny/y1MPU25wG2
 n1UxZf9hcXajoQKbaQg==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04a84a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: KjLKBUTWPhHY0r7TTY4pouA_uwqeXcgd
X-Proofpoint-ORIG-GUID: KjLKBUTWPhHY0r7TTY4pouA_uwqeXcgd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX+qz8w02GqZf5
 vhWbzQp1zpJUw9SCgMgVPZGU8l+2GkwyqlXreY+MQYANjqSoPmJUUt8pgnnXV37VFBdYVNBlP2O
 Le5zLtHQSEh+oPVzZN8YV9F/JCHclXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..72a70b5dc9f5 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl", "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

