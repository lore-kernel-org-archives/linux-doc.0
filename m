Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAAECE79B9
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 10:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234216AbjITKP4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 06:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbjITKPz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 06:15:55 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2085.outbound.protection.outlook.com [40.107.14.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EBAAC;
        Wed, 20 Sep 2023 03:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZACM0mCXsBLosF7x8A0oB89kfWInDtC7NC3VAxgn6MywztCOMjuSq9VevYNyjRQi+156FxfUZnkvhWfyg+bzfdwJIHNOnBfcqJRwgxHriGElqRH48K7nYhahebP+lrbn5toXFe8BahSlFHzRALXTcGH2vvJtTyTuoHRVPKKFLmUAADA8+7cI8yQG1/F5eyglOQY3yOqb6hD8X8wUCZ4xAxExfRmfgH8numsyHhzy/5Uo+cUCtOK85l0OLNh0d1McMIW8U7hVf9dWk1MoIHJ1gkmEomUVo56nayQJd/ZtNoLa+gT5meKHUpPkHqKDucaaCmIxPX6LEEUeLRpe9VxWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w3oPvnn71JuIR3NzRn8b0vrZY3TCB/qtSAo7U7xMns=;
 b=mU2DEA+DEum2Bm5MuDKCOJkALUlxoGX5dTOGt59UFe/1C4c25RRN/CcgT/9Mw4L53sJvPTR8L1CscaZcjyyup0DiP/G73yP/ka3jryTA+NjUIwBghhtGv+GiflMS/SuBHS/2iJG2aJVWXCgK1qnh+onfM10NWyS0OwlY7lPFtquUaqN3MHqMCnCvA7mCz2G5OdPGoN7BQkRjtOrz9QM1ddStmFcZD00t4cTCl7pIkXxnEpiBu4El5QxeBdA+kLxyUTWB+wWHbkMI1p9jy7CzpHBHwlNZQwm6/c2o12xIUNOlBrmo3NZFqCG+Zs0Tg3w10QQ0ll2U8hDLlrCaW2ZiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w3oPvnn71JuIR3NzRn8b0vrZY3TCB/qtSAo7U7xMns=;
 b=VhtjYvcXECYMlbOFdMD9e8U+nnc1iRYQy2eyd8YqN2vw8aZBKlBuWHIkkyQ2IMg2LDhhB5kxKx8jqCvmSZPQi11thCTnpJtxbrPD8Ckj30cBxoztSN36zdTqJ80N111nkBeg5HGXhGA4z8zGVu+9N/6cgFLhAQn+5wGVgwqpx3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8375.eurprd04.prod.outlook.com (2603:10a6:102:1be::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Wed, 20 Sep 2023 10:15:47 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 10:15:46 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Frank.li@nxp.com, corbet@lwn.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, will@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com
Subject: [PATCH 5/5] arm64: dts: imx8dxl-ss-ddr: change ddr_pmu0 compatilbe
Date:   Wed, 20 Sep 2023 18:20:04 +0800
Message-Id: <20230920102004.886599-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920102004.886599-1-xu.yang_2@nxp.com>
References: <20230920102004.886599-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PAXPR04MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 765cbc2d-b242-412d-6306-08dbb9c28e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHKQRfPtQxzmT5LgPotXradRz8SFbzubKoOj0/dlUvjZ7NCUBhpDT02xdnYEwQDbUsuRRycUFVcsO6ILrE/UQRgluGocg8LHjrgrmPbCO00K3CdwdVDHran3EwsIp+gdqP9WKU+goIqFe2VEs4GHGhDp/i83YsKoDhz16+Lw+jEDB1l0K3tyrVJNKOAPD+RsDvMesrnWVYYqFJCl0Wg9jlfvGXY3vk5zJ6WR4yigTxYCTQbfAenNpeAugYkzCU/jWhWYWhwENYsGq/8xq1+8QU6znITmemyAhUgJ02sCY6d8k8CD5+5yGmHL7gRip+b9aDNd/mEjg9lhuiX1UlhMFMVmHoLXOVgT1EelQwVfmVbe+OA9OdAUe/ZFmlVfBGpT0Nu8AEjBTQyMk20BSHplj/iH0wdxODYsW0Lh+FaeId5SwOM1G2o3hr/nXG+SdD2Z6jIJf28MW6QY0dYYkNDRV9p3w9lodeiXFHrAm3kQrXGn7YkG7XWfCc2CnGMnPP14HhSK8aDHTgcnYGvL2aK2J0ukTE3ilws6TH+yUVIuRrpdWOhci+Ek3GEMzFIl60Olsg7vlXqIqHNMRoADuaFbK05yFliHGWw6BMTnKp1QPxf3j8Bq8uwE1zXBQA7ES6WDOc8isccu8VgNXCPwjuh1YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(316002)(41300700001)(66476007)(66556008)(66946007)(478600001)(6666004)(38100700002)(38350700002)(2906002)(4744005)(36756003)(86362001)(7416002)(8676002)(4326008)(5660300002)(8936002)(2616005)(26005)(1076003)(6506007)(83380400001)(6486002)(52116002)(6512007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1fv0jlwCehoprxAAe1mfouTxDAyg96A+53FMLqxozIeBKHQf68yMELZlmk+c?=
 =?us-ascii?Q?2Z+Itmh6xsmVAFtRBqWNZ+7FOuz5slf4WwnmSQ8BuX/BInJMJTMEWkC5mtDv?=
 =?us-ascii?Q?rU/fR/FfYZ4Nc38VIvl3DkktKDoQmmszaBA+LP2qRNbSQWnnsvbRa3pXVZ12?=
 =?us-ascii?Q?fHjlUsHl4kzNyYNxBRyWNvhymMXfJ3/OR2kYfsGhvD6le5pdhaJ2zhqIPdNz?=
 =?us-ascii?Q?4qArO3E4/+pwT4baaSyy6f1N36D62g6+9g0LCbBrXQtmzfcV1LfjV6sJPjp3?=
 =?us-ascii?Q?93/2rUg9oJj3PoapdXuuQXEpKQl+J23YV7BAbvv+k5GyGjzbtLLg6HyRrVGa?=
 =?us-ascii?Q?U5EeLoVKqD+pcFHI7DCBDMwq5Cmg8yPwu1YX6NeyU478c4qbDtm5G/KJbDNg?=
 =?us-ascii?Q?kvS/gTtNhMlPZ2HdS8HZg8MsAGRIWtnEP6zPLROsjhRdAP4zCE8upIOWC5ya?=
 =?us-ascii?Q?qSPoPioLx/8KR3VQqY18Y2vnKyoWfjacHsZn69Qycz9T5enRHSmuAb2SZsJa?=
 =?us-ascii?Q?9Ef7s591MEyT8NLIF1G/OI2A0GLNHaiTSxCHpDQFjBnc6NSxkiufw5nf1m86?=
 =?us-ascii?Q?jzyWa+VxhzHf5M5Jkk1v2+94DrBMGx9hqzj2nnxpomTbeLH+9TDvA898ZW3f?=
 =?us-ascii?Q?RUDOrmHdTtaMNxmNloGC7yirq6WYGlFOzcAAJKdndHULweYnuGa4q8ZCtQ2G?=
 =?us-ascii?Q?A8yW/cP3wnGIwZZiRXoPdqJoMnM4FrtpoEjt9pSZQQF65u8SBmsmmKcJ516N?=
 =?us-ascii?Q?hvP1dPmgaKraPHeXHAmNViLJtee5WYL4Onpxm4OrWR9g4wBBp9YnI30DSOyR?=
 =?us-ascii?Q?LRFJyrfRtfzKVu/rM8Cl6aPAkM68tJkffXZB/fsRZExY8inezJvzsU4S+r+t?=
 =?us-ascii?Q?xuUbFyfjmwc1CMhKBf4qv3yiJKYf3sEt69irddvi73gCEhpwshJXpOvR/5tA?=
 =?us-ascii?Q?m7Muo495GpHELbDIzpnyLhGHil3SxtuP8HOcOwcKEHl3yhRZ6mOzpp5uaKbf?=
 =?us-ascii?Q?EjzKNyoL/B8aSbmJE70R3/nE0/abC7TAsE/tKc50Lv20wculggMVf0I6qhxm?=
 =?us-ascii?Q?TfdayAU+r3IsbmLcsvhqer3ySqARbgJqrfu1eus46cGDBRh4D0H1PuktO3dg?=
 =?us-ascii?Q?nj1BEfFad2sEKGdNTfvKHrts7tPAu0LTpKHws22gaWJWcNirX3QvwMeQ4wah?=
 =?us-ascii?Q?SFIXejsjG9Rfcb3yPzg0pPpynYEPooV/t8GgYIGRORqdgMfdeKO/s/xJoLLC?=
 =?us-ascii?Q?Mve4PHz+vZog3m+gqxD3IrTkkAqDfpVIT399JBfaNrQSth+wLqA4s/FwGVvF?=
 =?us-ascii?Q?4SbD435nUNK+V2VRe3IlNEtIxHdCMS5VJUVbg7oI8aSAxh1/90esqaTqy0ZG?=
 =?us-ascii?Q?hZI0eN9ktNfkLYFOw+YyPFZfxZIme6xhtieQ1jRVq4c/gbbnefD/sqlwrLOn?=
 =?us-ascii?Q?PjQIB4FhdqIX/AzseERmIa9EIT/AZd9Y3TWIgzpBaUfD2GXbn1P7UzG2PfFw?=
 =?us-ascii?Q?bxkvQmZM7OpuJhEbGK4gRuaLXdi0zPjMd3oaZLikDpt4FK51QkhsaHnmMBoE?=
 =?us-ascii?Q?baqDZ+xH/ULX4AJTyD9LkmefSRK9Mg7lZYxux2Pi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765cbc2d-b242-412d-6306-08dbb9c28e54
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:15:46.8767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bgeqi/yswmI62zpIlg435jvJxeIjAnFYqJpZ2WXm4urPDI0nXL2mt0iUMtG/NFzpS7kRYrcZ0TqL/zVXsd7Qlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8375
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

i.MX8DXL's ddr pmu has port/channel filter capabilities, but it still is
compatilbe with "fsl,imx8-ddr-pmu". This will change the compatilbe.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
index 550f513708d8..3569abb5bb9b 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
@@ -4,6 +4,6 @@
  */
 
 &ddr_pmu0 {
-	compatible = "fsl,imx8-ddr-pmu";
+	compatible = "fsl,imx8dxl-ddr-pmu", "fsl,imx8-ddr-pmu";
 	interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 };
-- 
2.34.1

