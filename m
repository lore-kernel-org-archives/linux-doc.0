Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEA5CE79BE
	for <linux-doc@archiver.kernel.org>; Wed, 20 Sep 2023 10:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbjITKPt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 06:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234229AbjITKPs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 06:15:48 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2043.outbound.protection.outlook.com [40.107.8.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07614B9;
        Wed, 20 Sep 2023 03:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M49/7xsRXcm5B6ZgeBzvxuea0AMgUOsTRGa5Z4VcTBmmDQTrseo+OEV0egX/FxIJpORj5jZjhIFTsUDlwkfHsU1ZoPD2qUC0KiIiJJ44as25K10IHWyxJ3n1wd2NFzpC/0xGPO8M1Lx3TtQTxMtc6vr4blBVZyYOmqsrwcvPpSANb05wk6FXyUd2+8qLBAyB6U4mA9BHQNnWYovspusw4vSi7TSUdwrL8khb4l27MkMZYgTENXiHnfmK/wRQOdaLn8I7wOFJWThlx2GdaxSF8cT3Sq9bdPg7RzZUZOk8eu+T1A2n1Gktx7rhIhumeT0prOMwzqq28dEv+uddQrZPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMIi6HCHrUHlQQvTn4Or2PJF9Ksj+NjGKWyq7dMDavw=;
 b=F4ciASGC3KtUA0n3H7OFMC/R6A77opuIhvPM1f/9TWmeD9mrCc3VI3Jz1cWmD849v7hL5ePmtFVMMpC/ivpOU+j9M/jAeR0bvkEObjFY7qUYLerQmmjfh66LPRQiyNfIJLov7MwJuwIybIUlJD7O/AMcOzwnxU9iRUlRYsmq3LLG7IbdaNhCWwI27OIYN5GjBtq/GqvpWvk7EPqe3TGilkxISWRfaNU6AtkvoT5f+E1U0vA9r7z0MLMCnYK7LkQLB3D2kUmu4rLU62sRF73a6ojhi16MphgdsOSBGQ5QMLVxRFs9RhFaIEu2tydTywnsu922qmmdnFYqrD9oLDNgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMIi6HCHrUHlQQvTn4Or2PJF9Ksj+NjGKWyq7dMDavw=;
 b=Emej1H5uVNPIpD1ZhGUvIdoc9110jUQlnMuC8NrOkZdbR5POMXrDzIPrUoGfI7+l9Nc4jrZpNwdBqXRWr0LFlO1aBm9ZGPvi5Zai6PvFDzokH3kguKlxOGi2cV4mi24aeMy5BGWJKexmhpT5/mdvgleWN9MqN6LrX9t9uy9tDH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PAXPR04MB8375.eurprd04.prod.outlook.com (2603:10a6:102:1be::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Wed, 20 Sep 2023 10:15:37 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 10:15:37 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Frank.li@nxp.com, corbet@lwn.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, will@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     festevam@gmail.com, conor+dt@kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com
Subject: [PATCH 3/5] dt-bindings: perf: fsl-imx-ddr: Add i.MX8DXL compatible
Date:   Wed, 20 Sep 2023 18:20:02 +0800
Message-Id: <20230920102004.886599-3-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: fca9eb0a-3ac4-4405-4eb0-08dbb9c2886f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NEH52KyNADJfzxIq5XblC7o6pw491F6BD8R/WCgID75j/hRHrH05bFSVuPYi075cV/TdN9cyUSYiQT0rpf3BayoDvr3RWgneYkvr6iHKbyxrVAYM8d74gNVC7vfd+Y3mbqfvt5wUkvX5AAUFKgo/xgU36KVYvDWcRpfgxcGdinIhBVGcQuJvK/J1QOfwlYJHrijC5DkaBXKyiX8Z5GX31aCTjfUlFNNIuWceZSJXmjnNLepOYHy8lZ2D1o7iqc+AigzpZm1G7iTAXa919cWP5JDmHpaks57g1fdYUEAicrJ1cmQEJkDDlZ694MhUm4iIKFBacqqT0jHLF4bq/TbM/QliWhFnVAkrfm3gh2pft5TFsD4ZnQi9+55+9Whj/w/aAFF+Bf0lBVWUMfxKdUueELp2q5N8djTY3iaf31JT1cqatWGgN+YUfHNCsby2beYqQ/wW0fTT1QQpkZe4bDSwIKxidXB1YD8Bl2l7tmtz1mPrJckYIri6BvZXGMdZ8VE0YFDxKOaJQgy3ol4WAGVJzOG1Xd3nr3t8SWGAUCkCDUtGQXZKXsWftvkG+WGwZJwWdWntub/UhsA8HtNwmmpk9gVgubkworvqPuTkg7qTgAzPvsLyEJDW0lsW0E0+kRlB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(316002)(41300700001)(66476007)(66556008)(66946007)(478600001)(6666004)(38100700002)(38350700002)(2906002)(4744005)(36756003)(86362001)(7416002)(8676002)(4326008)(5660300002)(8936002)(2616005)(26005)(1076003)(6506007)(6486002)(52116002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mqW0FfAe8c5iQYlZr7wKMME2nchFIVWZxsTwLbRFsMybbqoZhiqJ+sFvOrqV?=
 =?us-ascii?Q?4EWiSJSi2IPKrLl2SRaEknwW/l9zCoua4lg70cGhNmRGwjWoM9cd+3TBGoDR?=
 =?us-ascii?Q?36CWXDd3zb1rYhY1ELLqXIQF8FBRSP4OTH2aRfjP6oty3E6IIdvNoTbMpdOM?=
 =?us-ascii?Q?NZ8N9aQ8ystcJ9F8C83thzUOj3AB3JS5YMPKUrSBNV63+VqZ9JrgMrd7YCOk?=
 =?us-ascii?Q?KbYyRrwGcDgmETs4fOf68LDl0K3XtBh8hkLCpYgVBU9BDXm6Ptu1FtKNS3E+?=
 =?us-ascii?Q?+Uor1/LLhauHPBx5YQTuKEln98wSRiGkSNwooH9QkV3d1+R1E54QEkAxruCn?=
 =?us-ascii?Q?yRzNsrA7H4Z/eAbcUBMHWmPodWJ8iWjqhsOVI+Oi9va2Dfddrx7xgoCnGYKi?=
 =?us-ascii?Q?i7J6RjcYJlnXU+I7pnOLm5qSIC/rTqa+Z3MMt8fvS5UoTMrGVEbyD2vus9eQ?=
 =?us-ascii?Q?fnRNK6z5Dkyi+zvawfVlftSfAlta3UpNzurfx0H3jfFXof5mdQg9emLd0d/p?=
 =?us-ascii?Q?pCon2gsbZlchxQM/t8cw5JLMode9+O2jL1ePEyYQ8XTFXo7IC+yRtP8VrMf5?=
 =?us-ascii?Q?WC3hEkaXx9RQEcQczlC/pmBe/tEFzP/EUuLvbx5A5ddtlfG9SGhr2BT6ETPw?=
 =?us-ascii?Q?3FFe82E0khFrDcBXbL/9s0NhUgN1fIIKvJfI7VLD130uPXnpQeOdjJHCPvA7?=
 =?us-ascii?Q?XeNVmcYYPuC8V+lFaxmsdFbKryLGBprj7p0CMmgghCAvyazBlOTE5Nr7Qj/X?=
 =?us-ascii?Q?gul8uvC/2RoF28z9mZMQC7KpanWnw2Y3yeGKZHNGNpfTYyiTZxufHQQCdCoo?=
 =?us-ascii?Q?SRZ4FAITe9o7GpKbnfVK9y8C6OMsVSHLRM7L6+rhHj4NK+a+mG1og7dY6KMY?=
 =?us-ascii?Q?fNj0LcBqHPR8Q06gcmmkrsDNX5zAkk111YHuXaAnLhTLLRXv3k7VNeiNiNnT?=
 =?us-ascii?Q?Gkj6FrVVUr7ULu5AUrgaxwwf0Wiyy6X6f1QzMXJZN+QDVMqsiN+J8dfskW/+?=
 =?us-ascii?Q?vrYvQGqad8zaA1pX6bb0UztHLJgAOUWSfqWMnTAMvwxAySE7FDyhkf/c1yyO?=
 =?us-ascii?Q?qZqeTVQcRSEsdpbd8QQ8/vigbQZlfXUMmhx/S74I5n3bskg55mTsdPbQeuh3?=
 =?us-ascii?Q?Owxmc69KJQtKfwkMrylPW+JVstzvXYgC7u79+fl/odEqsWbXw/UrXBCi4eyD?=
 =?us-ascii?Q?BVChe3q9xiYgMcWLidi9v0H3LuwMuTxTXyyN251ECCR203gwap0d6mZ1LNDi?=
 =?us-ascii?Q?YE9F+DKx/egDKVFFf2Sm41LX65RYQGdZsBo25lIOzxzAanvHF1naE6lPJf4n?=
 =?us-ascii?Q?a5nB4LyEdseOaavYJZMfDo5KUskg2XuctlMom+f3d+ULXlBM3OT1xKyAaMax?=
 =?us-ascii?Q?6IHiqmU7M1zHnOqCOR2V+F7CoqaHNYkEl24b6l1L65CpP5I1coIXOYw5cike?=
 =?us-ascii?Q?50HBiG5xEu0XTBrBqXXPIdVf8LUsOpRJqPAmofxOSc8W2isvWbuNrkkV02l6?=
 =?us-ascii?Q?ES+3dh0Wfbx8wr2JmuK+fqDWzEHkMKw1KlJOvrsTnm9XQwptXbHZASOCk7aC?=
 =?us-ascii?Q?SN6EExoLCzLdR9FVhjVEoiyDItGu3Ia4JRE1hlhw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca9eb0a-3ac4-4405-4eb0-08dbb9c2886f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:15:37.1297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DjIfa6lE09+3hLFMnQnYbEJwZs5UXwIzALYLm4gi9lygWp+752aMIUK/deO1BK++viisPohx3Efqd6mgFE0wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8375
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a compatible for i.MX8DXL which is compatile with "fsl,imx8-ddr-pmu".

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml b/Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml
index e9fad4b3de68..6c96a4204e5d 100644
--- a/Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml
+++ b/Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml
@@ -27,6 +27,9 @@ properties:
               - fsl,imx8mq-ddr-pmu
               - fsl,imx8mp-ddr-pmu
           - const: fsl,imx8m-ddr-pmu
+      - items:
+          - const: fsl,imx8dxl-ddr-pmu
+          - const: fsl,imx8-ddr-pmu
 
   reg:
     maxItems: 1
-- 
2.34.1

