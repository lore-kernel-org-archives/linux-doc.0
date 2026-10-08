Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D2E4AF699
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471118; cv=none; b=JxeXANWLWADw6ILKC1pHWJclrRSPQUbeeB/Z9Ukv5Z9OcTxCx4nuLH8upWHEyEsyxB/wkCQNpo11fnnqyGKrJOTsxCMHwEGQXxH79q1WDyCpTH476gB9rVUDwUg7E6Ui5dELkad/dpQTLbTpyA/QqYHTH8FKGTDYLQZPTcy96FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471118; c=relaxed/simple;
	bh=4ejXIHXllm/OX7toaawMvjc9fLMF06Wvz+3UPeI3Nfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umbnXIdtfwjBx+Bno8m6V4OycpVAfKw4eZh/0+k7vKmnCsti2jf+3f7N9ygHRzvo/h4tXU39K9LiC2pesxz8lKn2pYdja8lEVUABivOoX64xoqoRjGUorE3i8fVfGYwbWPsh24ji+aAQPCi5MJThwR+cvawm/xpv4fS2ExcaocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+trr0U4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQKNfogD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+trr0U4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQKNfogD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVCt53017325
	for <linux-doc@vger.kernel.org>; Thu, 8 Oct 2026 14:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8wa6N7QHPrG2N+PjfUfKP3nkKREIO0fyU3OWbjBzVg=; b=d+trr0U48J1ceIBI
	sbH/u7BnmaaXMuyqqnIrEtMudn/2iGiqQlxC8DRPlrWBq13xIvaTkXAeIgJQyyjd
	mO/eixiI7lmRCM3Axvs8Pn7VjHU/GxCa1pbPPnuClAIGr+HJr+b8ISTXLyY7QNw8
	6xqhMWJQMuHpfFjl6xhbgJ4gWYroCw6REJKsFFra33zpuiqSMjkw5vDzC1Ls+HlO
	D8FY/QfQpI8Ya6BHUjIbhcg1XE3SA/jV3Ns3t1n1TYKhKUlAdyy7MYeX5zQdqTkE
	7u9PhHDXLo0DmnLnYjVz4KYgOdoRMumMvFvZ8hP8akG/VDse8iyF8XjdkOGATNXp
	vdkuUw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kgghb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 14:51:45 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-895241d7405so75861057b3.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471105; x=1792075905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p8wa6N7QHPrG2N+PjfUfKP3nkKREIO0fyU3OWbjBzVg=;
        b=CQKNfogDOT0+8vgTXK7zlfikX5Is+Sf3zEJj8bEPlQnIqBN7/FOkVjEiwNN+243NKZ
         g6zBPEc88M09Rp4oml2ZNlHpH8cimLtocgVYWxxCff7w89E88RWrULsR9igh1EQpmzrA
         M62HeJcGUfymFQTqcPtWRz2PA7OsQFbA5KmZZQaCSdqxCKRX5ixRn3dbZX487e2VRnvB
         pJtmeYy3A59GMUPganC/FAetYR0u9NW4bGeR7ErfgdJStIC9LLvdqkdXFLimSM/FKyJc
         DIKkz1hUIszIZGilvqezHZ5uSlgXqMnj/FQZAQa/eY08U6s65XZ95rNMBD5c7SR6oCK5
         s1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471105; x=1792075905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8wa6N7QHPrG2N+PjfUfKP3nkKREIO0fyU3OWbjBzVg=;
        b=dDjrR73vf4t+PspzqUi3ke9xB5MiFiJVbW+A+4IqMujlziBMeFQ7SC8k5Of16Wq2x8
         gAtIUOeOmOmdAgW+vhtpGHZ1+Jye1D8+lPJa+t/TX+UvsdiPioPlMaX1k+oA1rAAR0/U
         Q5WGrTg5WLU6+pagFNkWbMkAL/l2O9WyDbXZJ2nRgh3OWrNZEO41b4Xv+fQc6dZ/PzQJ
         bUJy0h2CNi/NY/47pzMFYHRL+Ih9pZ/N22QvWJGKoC+6gersVh6u2XMfEgsgxuIQyNES
         FVzuCXVaORDOGfZWHe6yegCUiGGHu2S3qsNYHo+rzTrN+9t8BuhvrNalUgEnliu+A/gW
         lIXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxdjXgA5x+oBN8vdwUNsA2S+1XiuHYTH1Zka2llJXfMfzwNlp3PdA/z0hQWhjLluT7Awu5EJTj2Qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3tpOzqGjTrzi7k0EJoT0zf8P+QbNFtuTtHN1VNNM8NUJVrRSg
	EB34FfcfZS7op3wJsyqoXggnBiPsZ97U6hkW/cw3C17XiNKm9Jgja2xQEO7ba2o3Zapeh85iGb3
	W1xpcXzXa/xcCCpP8x8WtEZ+SzuO7ywRVomobcOFd1jjl9QqK/sA6zK7sKyE10lo=
X-Gm-Gg: AYBFou2BRvpUyUE+nwplSJNlrfchKvJhlcElawqlIj/7SJudBR77svCWvRUHNO1AeMf
	+X+MGTDXCHVzO5k4SXstZq3UBEA2i1i7Wvj33c55VADRldf0NcZNiNfFY4+bQ2DKyXgEnhN43Pw
	2r+ytbBvKT994DY0oa5QwXydjQ5QdjgA/r9ySqDsqN1k3xT3vG59cbmM0j8xqMK9VXuVK4jkUB8
	uOP+m+gZdEuPoQ4OPLHQemU18tn5us8lHGGI7QOIJRx1KeC8YOJu6QklpdjTAVkLI+AsPA4hp75
	FAtdaIafG9gotlHBkmynacacntYrK7LrD1PiQ6XQCzDhdy6CFqHW2fVCFLUMgev60lf3nkzWX4S
	rdXG2fmUerDb3U3Rn/cqukt28GmqVZbsuzodzLUe/fSM=
X-Received: by 2002:a05:690c:4902:b0:866:7724:3bcd with SMTP id 00721157ae682-8b05b01cd14mr39157487b3.16.1791471105006;
        Thu, 08 Oct 2026 07:51:45 -0700 (PDT)
X-Received: by 2002:a05:690c:4902:b0:866:7724:3bcd with SMTP id 00721157ae682-8b05b01cd14mr39157097b3.16.1791471104208;
        Thu, 08 Oct 2026 07:51:44 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:43 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:35 -0700
Subject: [PATCH net-next 03/11] dt-bindings: net: qcom,ipq9574-ppe: Add
 IPQ5424 PPE support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-3-16caf43e44ee@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=5017;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=4ejXIHXllm/OX7toaawMvjc9fLMF06Wvz+3UPeI3Nfs=;
 b=L1EmTXZqUYIEviKnSUJ5xS6ppzQFL+i8pPyCv4ceiHPry+wkpyFsjyroR8d4yQHm0JMNe8Ls0
 B0+V2ALB2R2DMPhBFO74PZ5az02oFHCSix/DSKQjPlWanVZJIfaCfrH
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: FPK7YNF2kaIH3o5mwcU-ooQqx6qNE_I0
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac7ae01 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=88jBO_RzNVI78HEcs5sA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfXwXSInqmdTOqg
 4RflzLkzQ17l8//0iadHlW9cQpGCjQWuyF/OXrTb54GKlKzEdEWGbmtn68glKBWuCbGuCuBa+br
 2mOwvAHWQi1+8RiUDBRU2NGv5YqvG84=
X-Proofpoint-GUID: FPK7YNF2kaIH3o5mwcU-ooQqx6qNE_I0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX6fB/DjV7plJx
 I1hl914m+3GUJjazgp6Ao7HlMsd6UBgW3noCDBS4fk6vO2Qs7v649OO30qQjPYx/jLbYcxr4+PU
 HMogHmIZPUeunDjYb16q5aQ5X7HziCesTKRQ+ojnvnac+U3qQgwEa/aXibPvAkK91ba5ZZt82t6
 H5rm9D88KRTCGzSuJavG8hfk0XmvtUpzSzWZIlig2DXNgTRL3j5salS5g/VXKB0shnmcGB+S+ja
 wpo/p0zLkHYZ1WWhlN2HEiH6E8IDyM0sA0dkDfIRbpjQT66cNFH4SPFSEEsFSxpWxciZtMHNk5k
 9+k+p8yALxwkrACqDQ3VAs6jh6C1fXVN1MwrO+LfyS8MaD19VURGcGrYJ6twZRE+G7Gp+Arebgb
 TNHRsPMwsEtgubc6XQIFfA0xAfpkwNDDe1eZ1xG3NHD7THfPuOp3NPSPQILXlZc7RZR6zMCvOjm
 lvXyWeBeNkMa6s7oj3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

IPQ5424 integrates the same PPE switch core as IPQ9574, but requires a
different, smaller set of interconnect paths, and has only 3 front panel
ports plus the EDMA FIFO interface, without the EIP FIFO.

Add the IPQ5424 compatible, describe the interconnect paths of each SoC,
and limit the Ethernet ports of IPQ5424 to ports 1-3.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 87 +++++++++++++++++-----
 1 file changed, 70 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
index c899f4b56945..e5d218fc5d82 100644
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
+      "^ethernet-port@[1-6]$":
         type: object
         unevaluatedProperties: false
         $ref: ethernet-switch-port.yaml#
@@ -236,6 +233,62 @@ required:
 
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
+            "^ethernet-port@[1-3]$":
+              properties:
+                reg:
+                  maximum: 3
+            "^ethernet-port@[4-6]$": false
 
 unevaluatedProperties: false
 

-- 
2.43.0

