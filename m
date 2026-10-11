Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C413451996
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723792; cv=none; b=lUqmeKahnjZ8ulm7CgNc/gbDvYlcjtlKQSSwmhX2FUrBgZBOYXOWFtX/Gj7CiLAbNuF6AjTcz2SftW0LLHv4v75PSY1MHh2Jr/7GclwRPp4jUEZmcnvcc/mSZT8WqyBwMYCql4Tc7gpC6PxnWBrx+MsJiGk18lHR6iUHrJyS6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723792; c=relaxed/simple;
	bh=cyX9O++D1EW+PrctAEPAFu+x0C4bmnpkICuaDGScBns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lrn5Kyz4L3kyGQTcqIAFHY/PGxhAE5cWhRXsUjslExNqsc4HnaWfYk+gOf989qhrMYxwZ5866QI65pdMZiLyJ6pChqU6piS/1HNn/i4K1Y7Cb96jbQjksSXfF00v5gmKSEpd+CvU5ukwAuUfuy5VBOJqp5/tmbBNVZS99C3gpMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NArvvHeW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OW6VDL/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NArvvHeW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OW6VDL/D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B86BB72973424
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 13:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yv8ZETeGGwp5WARcyvfI9zIu0Wbuse6bPCkxPkgvqJU=; b=NArvvHeWhe1b9kw5
	lqx0SDOJLmE0vfCEwDChq7AxKVk9zVPRjkM5rXpFxjSjHQhh3wxdkxyEEfrOoZyM
	n20aWg41hBmHqB28I5+wcJGoC7hTx6HsFVaa8P/ZmQUaEXxNfpHffD7QTkJlOAHG
	tNWpZVKvsgj/WdKa73Gr1hKP4tC/NcnMIk3WFCWLezJs+vaAQNXm61X2USTPiOjo
	omsl8JYrO7GEELpayuYju3ZV2ZgUqZHQmrp4/rDsb95vzJjq0wPrL1HYw82oablC
	mVGRfx3e4Rz+q6fdwTONfAXhCuHNmBguvMgpM2ap9+Mmno1gebvWsb7FbxjAPzL8
	mXhYrQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk231dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 13:03:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so293797eec.0
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 06:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723788; x=1792328588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yv8ZETeGGwp5WARcyvfI9zIu0Wbuse6bPCkxPkgvqJU=;
        b=OW6VDL/DsJPyxrkNu+NLZCaALdwTBdbahxBCCComIyKtzCuv47DaTgF9ySAoUdXRXl
         yflGQgYrg7X/6a+Np2J8dVlb2aid5JMnOnQUU8lZmD0uMWHWhoq7QUDOygzKHyi88a7x
         evNFvXZWjtc3HpDqsnqQGhinYDabOlI9HZ0/hw0Vjf5buYTzZAT00kyxPnDIEM/tnJrN
         jgPR60616cYuOU0+A5gtvjp3EDz3svH1ZmAfzODBOsg3ScfWVw81+KJN6G+dxt0ymIPg
         zyFCTLYTBjpchtQHwzNH6hs24A+decavNm3I28uzwHHdJqj6OwZtd4+hiB4lybjUDwr5
         Lb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723788; x=1792328588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yv8ZETeGGwp5WARcyvfI9zIu0Wbuse6bPCkxPkgvqJU=;
        b=Dtw9gbVS6SAwf1yrVcOvJv8BnXHF1+vHXNqcbUo1W2pd8PRwcAoQ2CAcOCQChj8HFy
         Kqy3CgHfbJ6UFp71HV9ffueDhUUjgL5p+A5/rSGiSFF/4JIWSyGU7G34D+eeRv5GewY4
         7y2W6/Kh57Vt87yXU56PXs2X+/ThG1roYkM7vnc9xBPM5px1ujlKv0qAStXZ9KY6mFk9
         lr5NP7HO8GmGU0i9hHDreze7nOZqb4Tf44dNqHX68L6EtBwzR4svxBtu/kuvoU6xtpbt
         SHPQ5Iuf+RDPajZ9zOkZJrr5bV0lInwONhVvPoh5Z0aeigmeiXcNle5xXb/wqJSIL76N
         y2EQ==
X-Forwarded-Encrypted: i=1; AKwUvBwB3PFSx9QdZnrZs9Ceu31cW0nZE7dwIk1I+CAgACHw/0GVCV9peuxLgCmA+U9d2et98AQUylfLiN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjNguNPmb3lAFNao+bQ8I0WyN99n8RIxMgu5qqh+IjrzXC3X9+
	JhcCJX6IeAllSHdSCf0kDw1jA2prWNtOlXtWfXBP3MmP7ITcVD532hI6gP/so89nF8+UznBK4wZ
	4mAEIu3pCc866KutIDVXd4AEW9H/5H6XqwG+J+wtZJZiD37HiOJ5nN1whtYJzOMU=
X-Gm-Gg: AYBFou0xkkNglUweMBLlpZCaxO0ktlxIIe1tvbJNJwuYk8JiA5TrvAD4WsWHtYTSby8
	z/RqGofg9NqvtdBqLLtiafRBovN4IFAVLAqqY8v+H9rwYul5B6T7iPV32OvL0zGWR8/LTkNOsyl
	4LKpCDhgE4Zm8ilm37ckPwivtwvRBpaFF3COmZHKPm32U9pOopBGAphKw5RxsnxFDHhLxjBoIGs
	NN4oj99c16g9uinb15qpcgqWorgTEBCxBDH94pUR74rWgKzSsrAE1VCUDZdw6v9FHcULymfxPlW
	uKbplHhMqL6Ba8Y+M8s6MewO7e1c4zEMhdFdem4DCscPKUTBQgzhYkxS0m1nf1PyGMgEGYcyhWB
	62otht8QCPO6yvvFPlKe9fw48XQ7xZpOZCpqx3n+3mJw=
X-Received: by 2002:a05:7301:2127:b0:359:27e6:b684 with SMTP id 5a478bee46e88-35927e6b814mr3597224eec.3.1791723787492;
        Sun, 11 Oct 2026 06:03:07 -0700 (PDT)
X-Received: by 2002:a05:7301:2127:b0:359:27e6:b684 with SMTP id 5a478bee46e88-35927e6b814mr3597158eec.3.1791723786533;
        Sun, 11 Oct 2026 06:03:06 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:06 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:09 -0700
Subject: [PATCH net-next v2 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-3-8c7b057e2c43@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=5173;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=cyX9O++D1EW+PrctAEPAFu+x0C4bmnpkICuaDGScBns=;
 b=q9XCCwp5weL800g9Ws0+7uUbJ0scjfKL1KATc/UNBnNr0m/H81AQX2socHZ5PdwswDiFQpny5
 TQp2P5FTWHFAqEsc7pp0OaMs6Q5cznp1BirVW/KqCknTmJplf+xlkJH
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: TYEj6qSarlTufDl4BF1tiy33vkaaNeG_
X-Proofpoint-GUID: TYEj6qSarlTufDl4BF1tiy33vkaaNeG_
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acb890c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z2bihl_UAZW2wbEoO2AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX2NJZjyc+l9WJ
 TeJrRDr7pISvmtz81WK1QDmKzjVZjzUsO2mArwylnhO3/RUc3qitBmSACe7h28vAkVCb6u/sig9
 9E1ynGzxszuwDBbpPoNcbDxJsp4Y1miUZ7YxfFKPItNHL5HIjxNRF4mzl8D47SnT+CcEfb0xnUz
 4KA5B8I9NNULDwrd52BIzV0GU0XvdflWKKK9Q07f1C/8jbc6QtqHuknYJFCJsZXCxqgFLRKRhgt
 khEcRJrseXvvfIyItdb2TEZCxa5n3C2k4V1rurD2o8xA1YH2d4oCdy603TVn3wVhhztUKSOMP/7
 ZflsHv+HFq8TfgaGoXjPFeDnKX0lUXM7lIVohwyHpHSDniUjsym8SMNQQST1oowenU/AveC5oWt
 eM3ah16HdYuI75yl0Y1WNqGdEERoRCLxoPNuNEnyvmMv7X2yAx6CRG7qKLKJiMuQrhfZ1fcUYGZ
 4F644uL2hLGzIylbxTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX/HEsNj4SDEbK
 rXnDjM9OSuELu8IMDGpOuVhMfyh1YUPmn/uOD4BANu6hMQP/LNPQ+JXhw7KB+mjHrLI0nCpNDjW
 vu5fZL/11mFG8R4q6MImhSLZWfA8ssg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110051

IPQ5424 integrates the same PPE switch core as IPQ9574, but requires a
different, smaller set of interconnect paths, and has only 3 front panel
ports plus the EDMA FIFO interface, without the EIP FIFO.

Add the IPQ5424 compatible, describe the interconnect paths of each SoC,
and limit the Ethernet ports of IPQ5424 to ports 1-3. Also match all
Ethernet port nodes, so that ports out of the supported range are
rejected by the reg limits instead of being left unchecked.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 86 +++++++++++++++++-----
 1 file changed, 69 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
index c899f4b56945..96e9b9420892 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -74,9 +74,14 @@ description: |
     +------->|             QCA8075 PHY             | | PHY4  | | PHY5  |
      (clock) +-------------------------------------+ +-------+ +-------+
 
+  The IPQ5424 PPE reuses the same switch core, but wires up only 3
+  front panel ports (GMAC0-2) and the single EDMA FIFO interface; it
+  has no EIP FIFO and no ports 4-6.
+
 properties:
   compatible:
     enum:
+      - qcom,ipq5424-ppe
       - qcom,ipq9574-ppe
 
   reg:
@@ -105,24 +110,16 @@ properties:
     description: PPE switch miscellaneous interrupt
 
   interconnects:
-    items:
-      - description: Bus interconnect path leading to PPE switch core function
-      - description: Bus interconnect path leading to PPE register access
-      - description: Bus interconnect path leading to QoS generation
-      - description: Bus interconnect path leading to timeout reference
-      - description: Bus interconnect path leading to NSS NOC from memory NOC
-      - description: Bus interconnect path leading to memory NOC from NSS NOC
-      - description: Bus interconnect path leading to enhanced memory NOC from NSS NOC
+    minItems: 5
+    maxItems: 7
+    description:
+      The number of interconnect paths depends on compatible, 5 paths for
+      qcom,ipq5424-ppe and 7 paths for qcom,ipq9574-ppe, enumerated in the
+      allOf conditionals below.
 
   interconnect-names:
-    items:
-      - const: ppe
-      - const: ppe_cfg
-      - const: qos_gen
-      - const: timeout_ref
-      - const: nssnoc_memnoc
-      - const: memnoc_nssnoc
-      - const: memnoc_nssnoc_1
+    minItems: 5
+    maxItems: 7
 
   ethernet-dma:
     type: object
@@ -182,7 +179,7 @@ properties:
 
   ethernet-ports:
     patternProperties:
-      "^ethernet-port@[1-6]+$":
+      "^ethernet-port@[0-9a-f]+$":
         type: object
         unevaluatedProperties: false
         $ref: ethernet-switch-port.yaml#
@@ -236,6 +233,61 @@ required:
 
 allOf:
   - $ref: ethernet-switch.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq9574-ppe
+    then:
+      properties:
+        interconnects:
+          items:
+            - description: Bus interconnect path leading to PPE switch core function
+            - description: Bus interconnect path leading to PPE register access
+            - description: Bus interconnect path leading to QoS generation
+            - description: Bus interconnect path leading to timeout reference
+            - description: Bus interconnect path leading to NSS NOC from memory NOC
+            - description: Bus interconnect path leading to memory NOC from NSS NOC
+            - description: Bus interconnect path leading to enhanced memory NOC from NSS NOC
+
+        interconnect-names:
+          items:
+            - const: ppe
+            - const: ppe_cfg
+            - const: qos_gen
+            - const: timeout_ref
+            - const: nssnoc_memnoc
+            - const: memnoc_nssnoc
+            - const: memnoc_nssnoc_1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5424-ppe
+    then:
+      properties:
+        interconnects:
+          items:
+            - description: Bus interconnect path leading to PPE switch core function
+            - description: Bus interconnect path leading to PPE register access
+            - description: Bus interconnect path leading to CE AXI
+            - description: Bus interconnect path leading to CE APB
+            - description: Bus interconnect path leading to NSS CSR access
+
+        interconnect-names:
+          items:
+            - const: ppe
+            - const: ppe_cfg
+            - const: nssnoc_ce_axi
+            - const: nssnoc_ce_apb
+            - const: nssnoc_nss_csr
+
+        ethernet-ports:
+          patternProperties:
+            "^ethernet-port@[0-9a-f]+$":
+              properties:
+                reg:
+                  maximum: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0

