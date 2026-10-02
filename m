Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D1747F3CA
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938056; cv=none; b=SZLb/YejFIq6IG4Y5hXcQxR+pCpYLGWQF86n5ArISSTyLTNgDZdBXyxIUYm59Me5Dwkkn0BcDJDmICgJ9DFH2isASg2zw8ZsQRsXR/VALskzRlpDSvOgXaekmbsVmH9fsclaIl9RAMdaVGCQxqcKQxdRUbTDlkLaqZX7pKdaMWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938056; c=relaxed/simple;
	bh=ve/BU+TMT+pGJv7kXC/UDFkjoe1hOTogshGgfNsRmg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGcZel7cMoAJ4HM+4xghHvySo/T3bMp4nZCWv+AOKYCC74I71Nzl51Rvgl+TxUxFHZtMmgPcAoz0S4tNSHKVLQ3tHEiKqcTW9sGiRVDOI5QLHHyeUAdLE6C/FpripHOJRmtjtaviePR1VfhQcI1bt/W6voDr1dpkZvt0lS/WvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhJVSV5v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmURqD22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhJVSV5v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmURqD22"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nQfO344037
	for <linux-doc@vger.kernel.org>; Fri, 2 Oct 2026 10:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=; b=IhJVSV5vFC0q2ZUY
	Qd2FzSsm7hvsr6ovyMFYBM0WT5pEA3ZJfdURZPpALCWI16rqhXuPgzaADppok3pP
	0O8Fxzz39EeMOk6l69J6T6f5nd8vGRha4EvIJYsFZUn5pgX+5yo/RHIIYZNS0xlK
	A1vNXqDFsNbVbYkdBOJPcAMg6Uh6U6Avjqpi7+NqH65CUJYvkirr0+4Nx3yB3w3C
	ZTLyyCNc4n+f3RFEcKjVHoEoPBTCn10I448I/C4oucJf6g0CpZ5wv1FXpkQX5Md1
	8MjUdEQuxK90VqkCAuFGk7UQW3Zt/5x4eEq+x97b7Z70cxm8M/FCKqkSgUuv6S9H
	FLiA3w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1rvqc6ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 10:47:32 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14fed306427so1156361c88.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 03:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790938052; x=1791542852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=LmURqD22UQKjsBmvTDt7fHL1kgo28Tgp6SqZuedTcJm86oAovW7LfYTmcjiS8DRO1G
         Zr6bdkj58cLjufOWbjJz5AjGm022G9aV/P6CQqUM0Nb+HbCO++9+iiKTvHVnPIa03j6w
         pO1uWBL83rITDz4CbAnQI1cSMCzISWm+N0DD+T+ZZfy8wcFnHKpVJJVXHAbeT1aXFLFS
         gy5JHTbwluR4czQ6px/dPaEI1jSbL/aQfnUnTbbUgTG0a2lFOO2JVIV3v8on54p0k15U
         V0OTWVlKMg/UKBIA+HHktWJ4trMZvGJdq6Tn1D5O0a3K4epzJdv80n4NKiozpKzLYADN
         cN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938052; x=1791542852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JcE/VNendmPfJ887BCBrP94/QxycFFpBFFllayWf30=;
        b=eDpkc+/CDFafAGUSpSZJjjDzBg/CubgcILrxJPJrZMr9Y1a47hao5Pvak77kJIP0xH
         j6PtOZI1PoB7THaWkkU27ydB89Ft5DPmHvDmA6JfOA12UPKLtQU/ETWirvEsNNyTEzBP
         rpVWRGhJaJurO+It2ix79vzUC0NGtp8mk6uF9rTxSrYODTRg1kuHM8EzWkXvjahjxiD8
         XsaCYij9tnB5F29PKBgS0TY1S1kNJRnChSMBKbKUc6Wb2uq0K5kktb4udmNducP5Y4MN
         +huiEmIJKcx0S66kwk5ZjQNT5l7g1J/FUx+G4fmm7bnddvRy4b00B2AGTGR7/cLIHzwd
         CEpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp+CyES8UpyNTZTRJVzFirbYSFDhG0iOmJq6youS95F0ejPvkaX7vyuS0Q45Datb10nniuk+Z6IUs=@vger.kernel.org
X-Gm-Message-State: AFuF++lIzLo7825g4p4XncWTEXxD1l+mAD8cYLnLJSQ9mKyMVS+ZDail
	c9Bds4wH3Lh45oW7glH9ZjIZWWQtf472LBjkPdKSj/GqFgD8kXpWmcAOTJAMoqCKoby/iyYy9Ic
	LaoE4COtBAiAG+TKqjmjkYS0i0O7wafp4spWcVhA8MlTw/VVM5rwucpFyPHOw1Cs=
X-Gm-Gg: AYBFou2S19Y6oH1M7GhTiZLHYNxzZkdq4SOacl58sXyhgBEVZdrPGL3n27r60fvPx+G
	EzD8RAWBUY2CS7mLqAL291i27BQKzZBXNctZ5k3E8N+xPspjuPqpWPcUgUdoS7VYzCARBNsUjDu
	Gb3Wgd3e2x6VRBbH6ndavz3FUvvaXdIp2aTqzL0BMOCGch31QH3ll87e/jMZ9xfYRBoYwTwkSrG
	P9KEejeJBNqU54A2/Cy3eQsYVBusWF9Xdeg98clnuU1oMeqN40DDRkpJMpvmEj2P8aibJPf6aWP
	bTDnZaB4bvsKJKkxPDFvA7TEidD/7PC/IQFt/CAZSZOz+yQwUihID9346AlQR24bRSZ1gCgXDds
	hGvmXlbqnSdkDvY6hDFPgpC6cL98p
X-Received: by 2002:a05:7022:ed04:b0:143:2984:6516 with SMTP id a92af1059eb24-14f5c4edfe1mr2299236c88.37.1790938051275;
        Fri, 02 Oct 2026 03:47:31 -0700 (PDT)
X-Received: by 2002:a05:7022:ed04:b0:143:2984:6516 with SMTP id a92af1059eb24-14f5c4edfe1mr2299189c88.37.1790938050544;
        Fri, 02 Oct 2026 03:47:30 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm10645191c88.4.2026.10.02.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 03:47:29 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 16:16:58 +0530
Subject: [PATCH 3/6] dt-bindings: thermal: qcom-tsens: document qcm6490
 tsens
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-thermal_bin-v1-3-5a29be7e8ec5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790938020; l=1770;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=TcfZeA/waj0J1JOXR5aaLYuqHVj1MdThFVHzlUlOpuM=;
 b=bZGu1z48lKEdoWOkvzW7NaXcvtLG8VucQr70EyzMUeWH2md2HRpwHpDjQn4xm9QU6nqhSbZzG
 z1MVxkgomV6DCiGcyyBdI2s+PlvMFyBNyEHDaa7nuJiCo1IypyjvRND
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfXxjGvBe3wGw3S
 qnVNsa8KzFIaXEMr9R6hgMr+TjcSNQmNCgay8jpmI9t/0KH640lMscpO5PdO8PzBJGRUfqGV/+q
 AS3UPCilBwgM6Yqbsp7h4iDl/2tRiWy69wHOsRFUmsTM3r2/QiXt1vfdWUkdXnq2RdcAEBVwBIP
 QL9DFQ0mI++n+aa+p3ZXqmteIPBJQZ+QeLkZYbpgyv6McjOf2sDdob4rOo/jbzjnCTSrAlpTBbP
 4UdrWykfq9n4Kj6TEuTLpLPEwoHCPVQ1+ybkiYllc+g6MuWXhjwp5AV2JtmJ37gciTfRRyiEUwk
 Ncn9nHM82dhFE/P6NPu7z3406k6nNM5jgye5A7dRe8OfAWtsUH+rt+iySJmXNyPKtjwQqbd2vxz
 62EGiddFStOjGGqxtCpKBRuW46uhlZH0HIVsvN6b+F2kbyR07xxeZNclA3zamzLAVtr1TLMgTTf
 ruUjLREP9jzIhIlIXLw==
X-Authority-Analysis: v=2.4 cv=JIauIMKb c=1 sm=1 tr=0 ts=6abf8bc4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VzBDfsQTI6wPN1YFWBEA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: TAKRVmFBVqIR_A898E86ok2RlkW727ZC
X-Proofpoint-ORIG-GUID: TAKRVmFBVqIR_A898E86ok2RlkW727ZC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MiBTYWx0ZWRfX7DMEvlxgKoe6
 jGbGI1nL86yWtXqE7lh9ZYyiIfX4Tdx/19As/a//+lht/pb0oimpQDMiJVRQ00av91Fa5SZU8vb
 fqBLqYMTy/w1lNlJ20iW2q1+GcQmkmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020042

From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

QCM6490 uses a tsens-v2 IP block and supports hardware-binned critical
trip points. Add its compatible to the tsens-v2 enum.

SoCs that support hardware-bin critical trips read their manufacturing
bin from qfprom fuse cells rather than the usual calibration cells: a
single "i-temp" bit on hamoa/purwa-class parts, and a "jtag-id"/
"feat-id" pair on sc7280/qcm6490. Extend nvmem-cell-names with two
oneOf branches so these fuse-cell names validate.

Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 5a8f7673e730..6899f07ec218 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -65,6 +65,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcm6490-tsens
               - qcom,qcs8300-tsens
               - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
@@ -244,6 +245,13 @@ properties:
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
           - pattern: '^tsens_sens[0-9]+_off$'
+        # hardware-binning fuse cells: a single i-temp bit
+      - items:
+          - const: i-temp
+        # hardware-binning fuse cells: jtag-id and feature-id
+      - items:
+          - const: jtag-id
+          - const: feat-id
 
   "#qcom,sensors":
     description:

-- 
2.34.1

