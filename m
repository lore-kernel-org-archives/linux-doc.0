Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DCA4D5964
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471113; cv=none; b=tlN4It3dfR/WjwHgMibHEuCnsME7Bp+mV2ENOlpkQvaFI/iUhtwYhdvffNPyESFTBdZBrKBDx0X87yHWpPHjaW77OxYWyGTZYhtUISaD6iXp7O/svD01rzpOucMSgJUPtZbii7P4oRcVyK7DIP8Y1RjnU77EZEk6ekcJqbojkww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471113; c=relaxed/simple;
	bh=Fc8DPTCRSdH6TiRTxXzABfwA6hiMN7wUWSgkQoT/pb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OvyNyyjWS1fRivIgAgAaKZbVKvILmgTuhck5ur5RAv6jdfXZ3E8sR6WgWalFatXPvqCzhb902q+XsSUfXl6bbqfcWrwvb9WFyDQZBTyiCkY7xO52j81SsSiGK8ySMSnsXsWNDKj2x8H2Vg82Cc7fOj5XQtu3bKsSETf18zcXZOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxMNi3XD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oj34WcjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxMNi3XD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oj34WcjE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVGKg3145625
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 14:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W5VbzzqxEuqAL7ZI39slBiv+oJQ2DZO8sYucQl9fLu0=; b=mxMNi3XDSKq9VvA9
	usoQYlGxvEmlWbFIgEhxTehCA7RsC45S+kTlLW4U7XY5lM8ZbEHWhJf60cVcAt6E
	3wnE33TKS+uJ/8Y7zTLlBs/i/WZE96JPur0elsF5RK0MKkyCYLpCo7xK6QwEpwC3
	Bcd9Cda5VaNMpExtGgH2lF3CCMDg2dG3IPrNOlfDoCyVY4QuZNvEVLNNAAAchrqN
	gCN7hOBJFOt+Z2PReOdpAyUCEcTeejU1sTQtZMnm2eWqLkk1Bt6N5AebKxWx2H3Z
	V+SHrkZxNh5hTxSKKKAemIZi61ia1M6kyoJunE2SJlwadsySkWP120qc3mBuGP0z
	QKxFXQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj0fyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 14:51:41 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-837aaa9a3f6so9893337b3.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471100; x=1792075900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5VbzzqxEuqAL7ZI39slBiv+oJQ2DZO8sYucQl9fLu0=;
        b=Oj34WcjEXliV3xIhdjE8IZPsZd6OE42CXQdBfExpqLTLzYhdI2FrpoVn6ynH9h/nHd
         Flu/LoDMRf7uNoESviCoEn0knGaXRlBK7zaGqfYeuSCb+ogeb26Xu1nY9LCjnu07vqHH
         UiUdW4pOdDWXwlJCEX+7l4T68TXtGa5YzxogIbaSmM1ZxnxiIT4LnX8cQWEpcMRTl/hK
         hDRbK3T41HQqwZIeObLXGn9wAGrVhKrYMfQ6iqfe0/WuFerYE8As50tIWRWCDXg+W4F1
         zJJwxfJyyhOHCSM3opMGld/3mQp0XtBGH+wkQxWtsAequLrU5O4EaoxwB4TIe2JY1V/7
         4DSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471100; x=1792075900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W5VbzzqxEuqAL7ZI39slBiv+oJQ2DZO8sYucQl9fLu0=;
        b=buyyuNeqHLFOe5tthX0MAkjpndbp18MjFA9V3soMk3vZIHAIC2xyOAhOkoqVgFZJNQ
         7K5mVgIST1h1et8lgD725VxQVGIop2d3vfI0x/Sw2oPCzIroBESJMdwvgTrQAqAKoay5
         aduT/kztzU+DYTbdLaD2UguuzkxyBL3dbOE94jfpTPRxDdj4pxbEoaF9VmDkeJLxfTe9
         nAV/L8C7T6R7ZsKvbhaO1IdAd2sYYb8aXNvu10P0qbIu504FUbN1ye8KDFgYOIbex7Jd
         kamyEEuemxDUSBk4vUeLEJ9cXG863LHNXf+5erKH2rMGeEDzHtq1O9R3BgoxTaAmIkur
         yjQA==
X-Forwarded-Encrypted: i=1; AKwUvByB9JpkSPyGrzbGbfuECps79USrqGHMianz2LZpBEM7aRwU1XnMWaa7Xbhsfk/aesvijFzlg47Qs+k=@vger.kernel.org
X-Gm-Message-State: AFuF++nHyCADmx646TvAilbo5E+H37y6WyQ/5P82HtMMZtDxbTcty6+M
	1KbVJsRB+vGB631Q61Y3U+5ZqQhhGGu9YR2EcvZrnd5rHuMSLO12k7dUdeb03IzmN4oB7tdUIig
	ms4tutPw7XI25HZgDHiAoRpu1MaxU1rTTgY5GHrWgy7vfJJeAsyI+E58y/kXS+Qo=
X-Gm-Gg: AYBFou3DQzpG0G/d6WjPIH/O47e+OcYi8FfmgScfzVeldm7t/T7++nWd060uBX1goFb
	23yBRR3NHtc6qmWZBad7Plas3ANYjRPh9CFBFbdY4ol7pla9NIgnKgzb/GVJaYw7QXFBpj3sI6f
	C076d5aCDEMbpG+4L3UghgzipuKp0GLllGS+4Q3mMROrMnGmn9YAYqyN0sWouZns9GVBBe1EWTc
	hJkD9C3+p0LQZib5YBWo1G6HRE2O6G+lz0lrFwQMKn3cQyB+ec7E69iyla9wDuEiCdvnryujgZz
	AxRaAot5xtJKbEyqlB6Q3PKPJffm4fHlzBIYHjXZpBCK7WdPzGTO62ntNCc8SwJ1nH6UlHIM2Yj
	Qp28Dw2kQK7wRRIuDH4xrt0Nehd12EX3w3o6ydphUsPY=
X-Received: by 2002:a05:690c:39d:b0:87f:32fa:aa08 with SMTP id 00721157ae682-8b06e42a786mr13089897b3.14.1791471100138;
        Thu, 08 Oct 2026 07:51:40 -0700 (PDT)
X-Received: by 2002:a05:690c:39d:b0:87f:32fa:aa08 with SMTP id 00721157ae682-8b06e42a786mr13089497b3.14.1791471099385;
        Thu, 08 Oct 2026 07:51:39 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:39 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:33 -0700
Subject: [PATCH net-next 01/11] dt-bindings: net: qcom,ipq9574-ppe: Split
 EDMA reset into sys and apb
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-1-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=2271;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Fc8DPTCRSdH6TiRTxXzABfwA6hiMN7wUWSgkQoT/pb0=;
 b=b+FpFRVL4POiYtkzHxu3F+D0thVdUcIWdbmDDfdbjkg6daS+Aig9EGSgJwCFpKD+HAcwR430s
 EDNzq1gNVbOCDT5MxBO6gBENfqK7kpAjXDKvLIHd1biYWQWbM18/0j6
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX4ybgO+cmOpjY
 iAI3EJ2NaBds8XLDtfPaoAPdqHw/rF5a9K9qQeTNR8wcwLHNq9jdNIRSXrdnmGtm9MVDCWe9EUd
 gsqFzk2x5QQXSonJGHY9QgYm2KtG7Q0uP+YtDx1SwWVC7m2gJRt5u/8mbZ48KMt5NQEdSQrpbyM
 EHHNEs9vN451yI0D8p1ZRaQTZ/IeT6FJBPY/7KCau1O5ByCd2Wl5XaoeE3Ewc9TjoJcgUvhonUL
 XWzmsYxwaHh5PWBce6fuuN9ma7gUwCaSAtsuLnoQlc0+DenAZRoCuwS4RxwY8x0lRQ2UgFZnDHr
 sDbUudFWpXs/MX47sH/E6s6luBzmjKk7s6U0reGyZMVx3SrOxfMOFTqHrZ6XkKrrV7r+Z0gLLxB
 1ca0eCSuifuQUBOaeq5em1RkhN2bWEbXYw3g62EGsMkq9pHsmpPnBojx8LxYJsSbwUnDEU0o76T
 B4b5of05OC9Wu5Auv2w==
X-Proofpoint-GUID: JGJHCQ2BtJKISvZUyIoBlkAscCXc-B4A
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac7adfd cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0cszTrF_nvGlpc-19gIA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: JGJHCQ2BtJKISvZUyIoBlkAscCXc-B4A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX0G9vhMHwJ2b9
 sNWPsh0G+g9RW9SPyW8pJx9Lm+YcYDnOnKpiw8lG/4GnfoN67j2+o5gkvx+i3uloCqKLVs43nJI
 SgvsJJpcj2NUEc5Ak4lIrR/d2avKe94=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080059

The EDMA reset is described in the binding as a single reset, but the
hardware has two separate EDMA resets, the system reset and the APB reset.
The reset used in the example is a combined reset that covers both of them.

Describe the EDMA resets as two separate entries named "sys" and "apb", in
the same way as the EDMA clocks, and update the example accordingly.

The EDMA driver has not been merged upstream yet, and no in-tree device
tree uses the ethernet-dma node, so there is no existing user of this
binding and it is safe to update it without breaking the ABI.

Fixes: 1898fc572118 ("dt-bindings: net: Add PPE for Qualcomm IPQ9574 SoC")
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

