Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DE607D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 13 Mar 2019 15:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfCMPvU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Mar 2019 11:51:20 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:18518 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726109AbfCMPvU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Mar 2019 11:51:20 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2DFk5F0027591;
        Wed, 13 Mar 2019 16:51:09 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2r71mb95a8-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 13 Mar 2019 16:51:09 +0100
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB10531;
        Wed, 13 Mar 2019 15:51:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A7E753EF;
        Wed, 13 Mar 2019 15:51:08 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.435.0; Wed, 13 Mar
 2019 16:51:08 +0100
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.361.1; Wed, 13 Mar 2019 16:51:08
 +0100
From:   Fabien Dessenne <fabien.dessenne@st.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 3/6] dt-bindings: hwlock: update STM32 #hwlock-cells value
Date:   Wed, 13 Mar 2019 16:50:34 +0100
Message-ID: <1552492237-28810-4-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
References: <1552492237-28810-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-03-13_09:,,
 signatures=0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use a value of 2, so users can share hwlocks.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
index adf4f000..60a3716 100644
--- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
+++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
@@ -4,8 +4,8 @@ STM32 Hardware Spinlock Device Binding
 Required properties :
 - compatible : should be "st,stm32-hwspinlock".
 - reg : the register address of hwspinlock.
-- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
-	hwlock, so the number of cells should be <1> here.
+- #hwlock-cells : should be <2> so the hwlock users use the hwlock id to
+	represent a specific hwlock and define its shared / exclusive attribute.
 - clock-names : Must contain "hsem".
 - clocks : Must contain a phandle entry for the clock in clock-names, see the
 	common clock bindings.
@@ -16,7 +16,7 @@ Please look at the generic hwlock binding for usage information for consumers,
 Example of hwlock provider:
 	hwspinlock@4c000000 {
 		compatible = "st,stm32-hwspinlock";
-		#hwlock-cells = <1>;
+		#hwlock-cells = <2>;
 		reg = <0x4c000000 0x400>;
 		clocks = <&rcc HSEM>;
 		clock-names = "hsem";
-- 
2.7.4

