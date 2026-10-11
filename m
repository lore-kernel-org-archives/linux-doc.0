Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1835AC09
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723790; cv=none; b=dg1Y+BLpPf+JCCv+FGwfwDMqo0cStr2FAChpnAyn+mj5AbvabOregWhlPA92cWy0i2mHx6Ep4tYTjIB/Tv2Bif4VDKAOyn4saBoomcIchSidBw4sCD9cCnmpBCmyaPBmFtJMJgRbzsiZOW+NlMkucAb25WJHnY2rg4Akgk6zr3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723790; c=relaxed/simple;
	bh=ziov8GbhVxyyWCk54rcLdc3x5VhT37TqjQTtFkBo29o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHRupo/EzNt5IG071yXR2SXYa+D37Deo6/Crq+KpaPxpxioWTJNCeqVQepcDYUPuK+iWxta/7ocSC1qA2saQ1RbInUCckxdbNec7azc1sDLqBAs7KlCYo/8SvzRsQBRImfDxQEbh/cvNeL+ByVnpg/fj6o0XazXgjIFXNjqEMXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBARF+Oo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4PJoNul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBARF+Oo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4PJoNul"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B85Uil2382082
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=; b=EBARF+OohtdkvH0/
	6FVcC8J4B/B6H+NIsAKPT9+weH7K4LEyuetgi2X7HhD9NMMHCzY+2EC29drkyeAh
	slmmcmKnuwwIH8Nkcqr4tCWtLH8F3m5UpOxL62HdaS6JBE7wmCME6PeKzbaM2tIn
	oHDhyBk73BIStOLAPudliSfiTx+5m/t+BP2hE2VyiPo4FIl9bTPrPvgy4MeghuuO
	4u+3TLsG+ZtZQKia39ozN91n8Ikt81dtBmck8/W2p3FXZDqRx4sGdwU3WNSpi3gx
	EqbCR6C6bn5t37e5dHPrLsI1Yoa1YWI3IU7PXIPsndkERlDCYYLBJLYcMcWW0QvR
	0IEsHA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4eaw8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 13:03:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso602237eec.1
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723786; x=1792328586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=;
        b=N4PJoNulU5x61BdO6z3znKYkXcIv195ftIvURcn2MrxubeiPrChuzgCFVp/JBGMm3D
         w6KKqOOrhkd3I/V3Y/XmW7tJ+Ht/R/x/QrtCSKhMGbwmGaBaGjt6EgTVszCcUUFu+o9F
         7jzdjQAO4NHrt7BaofPj5mN9wk2jCAfYZMf4WpOVawh54xCJFdSCXJZDXzMCO0bTvSnI
         8AVLkhnEuQhENLFQ8G2/mhMLPbB6RyV+jApJR2L9QRL/Wjw+GT5vSQbkNyvPVsVmh8qt
         BhS3xd/WRz3/U8HIFbvfJMdeIzaNG1b8MrKmDeyP9LT5tq2f0+sd/yxhUaZnCOzyn/Cs
         lTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723786; x=1792328586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJ9CalnwFGPLr+NcxwncqOYL/bjkFUk7GOOpj04XafQ=;
        b=oZWUNafgJuVB3DeSKxGEpHLAlhGjl9ajYfuNsqnCazWVfcnYNkLvQ2PBPiC9uO0stb
         GDN5ZBIntlk33ncL72qhTozl4R9nlWONPvfGUJpk7fv2Km+sMFy1vqseGOq6LXxypfBK
         I7od4IoWKFuqHX/Hw/WorEjUhFqhydum0OAR4xa2LRGebDhHMetbhylQjCxEMcJPgJum
         s3/RR5vqKbyPwoeaCno6HilRRG6aEPKalenG7U9PCH1fmGNe3CmOx+6jbV3czHAjPJBh
         nBDPWqOa6ntOt0Nq2BeNnajqIkvqc76d3cAe7We7Gq6uDv1e4+Of3oCTqL/Ut/smYD7N
         LCZw==
X-Forwarded-Encrypted: i=1; AKwUvBz5QDT9uTxDZlTNJySgcWf6caL+auBXJb1D0rYwWpng5mXy+rN3X2PplReoaARxFSPKBndO+b+Y4hM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkZ1ejK7RqxUy7qyq0Wd+QAB1renki+7oOEbmLqZayUsSB2tRt
	ieCU2aMfKwPhnDbUNGTexQpF3cV3rRjsEgmqn833yM42Ar/vnf+iyTNZy86DskRgVl2ZVQ4g8sQ
	xqNdlCmK763phzHhEs3VkRgP+1j1qp1VNykj5wwFSZoBdHLTOjmL++QKfk4+1z84=
X-Gm-Gg: AYBFou1kxItpjCM6GP3C8amSfBOC84GZdvbFB9ZjvR+1NZhhtgeLOS+T4S4UU45sURT
	1vFF4Bsd+eUwszKlP2gmoqeAtLiPDKZ4BlqX1rqALP3msXjtLvoYau6EFYX7mxOymtp7vPuHio0
	XJoz8asBKiEsdCNCR632vXFnmgwE2va3frHdkxVdKpvnoUGNRYrw1pjOtDFJQipvUou1IlBvE2Y
	HzFw2w82flkE7gIUKh2SIiLFYKqCSgFaXM/5eJl/tjve6Gmqmc0LVWXyWgm/jCdprRLOkgXHu6m
	hF3juSdbEMqg5eoDSsSw8MP/KLPwtoF2f1UbEuztxVR/u/I2j6Zw4rBkwubP4Brn2QFoXyu1WA6
	A75SifqVUWF4MC2rSnLwhHkFTbMNyNGShAM+rS4pRPqI=
X-Received: by 2002:a05:7300:881a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-3537df8cec0mr10273178eec.9.1791723785150;
        Sun, 11 Oct 2026 06:03:05 -0700 (PDT)
X-Received: by 2002:a05:7300:881a:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-3537df8cec0mr10273127eec.9.1791723784477;
        Sun, 11 Oct 2026 06:03:04 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:04 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:07 -0700
Subject: [PATCH net-next v2 01/11] dt-bindings: net: qcom,ipq9574-ppe:
 Split EDMA reset into sys and apb
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-1-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=2245;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ziov8GbhVxyyWCk54rcLdc3x5VhT37TqjQTtFkBo29o=;
 b=6b5djGaOjwahzdPW9P/w6Kwygh/n+EiZYc1i1zSI2qquUhZSTrt9L/g7M0Yv0ClR7iRM+2n1j
 ZE9bX+nsMEoBnnGeXHyw+xqbJYGk8xayaD80qXg8Y4l/PavFFajj33u
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX0hNEHkEDdYxj
 YRtZOK6w4L3CUhspx+waREHMuKUanQjVufcjwtyUPBpfTOFN6IbbQRsCPj6Z7QSa68IsMu6iOry
 mMw9e/qHmLJnAjoULmEdz7YoK7D2NOrrqBoEwMmVbLXgCrxBJbC1czYD6xM+S4+7TcTSDP5wT2g
 K0voTwgoSCcWvK0vRlR282annXCMt5OcZi0WczdOxCW+Y3o7mrvy7fRz8S+WDl1Azg8+pbhT0+w
 F0KdoMZrzTDGY8K31oNsDIqVropoZhrrjAljnqkX1zZTrn+zdlcu3L2woqGrFdWTKshQVj5wADB
 RqHMZTnUWi9iRVdvEMRw7cZ7Vycq/THgt4cD59+0lf71dvEODYZ1PF42cYWLPGJnEi4l4LK+aW5
 hBgn2KTy/f2V5QW1VjjRqgptUqm0MfQlc7+asO9xLQ2gEBDa0LDRL5SxDcCGqFG6UuRXGiiXJHt
 eX6a9/lj9QeZgdlfzpQ==
X-Proofpoint-ORIG-GUID: Ymrz_SmN879kC8tlrNk2LXhdt5KTTWiQ
X-Proofpoint-GUID: Ymrz_SmN879kC8tlrNk2LXhdt5KTTWiQ
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acb890a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0cszTrF_nvGlpc-19gIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfXx68slblbgtPw
 KZm9Y3HFfu9XfbiPib7nmEG60Ad2aJgpn7Um2HIUAdeoyj7S8qppmuVBXm3nnwva2F4rhBSKGpj
 Pf6MGb/GXmPdY8TY2n1Sh818QsL5iTc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110051

The EDMA reset is described in the binding as a single reset, but the
hardware has two separate EDMA resets, the system reset and the APB reset.
The reset used in the example is a combined reset that covers both of them.

Describe the EDMA resets as two separate entries named "sys" and "apb", in
the same way as the EDMA clocks, and update the example accordingly.

The EDMA driver has not been merged upstream yet, and no in-tree device
tree uses the ethernet-dma node, so there is no existing user of this
binding and it is safe to update it without breaking the ABI.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml        | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
index 6d0b21a10732..c899f4b56945 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -144,8 +144,14 @@ properties:
           - const: apb
 
       resets:
-        maxItems: 1
-        description: EDMA reset
+        items:
+          - description: EDMA system reset
+          - description: EDMA APB reset
+
+      reset-names:
+        items:
+          - const: sys
+          - const: apb
 
       interrupts:
         minItems: 65
@@ -170,6 +176,7 @@ properties:
       - clocks
       - clock-names
       - resets
+      - reset-names
       - interrupts
       - interrupt-names
 
@@ -273,7 +280,10 @@ examples:
                      <&nsscc NSS_CC_PPE_EDMA_CFG_CLK>;
             clock-names = "sys",
                           "apb";
-            resets = <&nsscc EDMA_HW_RESET>;
+            resets = <&nsscc PPE_EDMA_ARES>,
+                     <&nsscc PPE_EDMA_CFG_ARES>;
+            reset-names = "sys",
+                          "apb";
             interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.43.0

