Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5B1F9EE;
	Wed, 11 Oct 2023 06:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="OdHGZ8Fm"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5E79D;
	Tue, 10 Oct 2023 23:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jlfw2y/7A7drmEP7UXmrWe+oWjLhhZ5rEk2dughsff8CEgbC0j0Ht1dKWreovm8i+DiS1QdfYE4SBURaC/i//p03dZVLqmRvlVYoaE8hggzAWJurFnHzCY8aZ1oC47qXJ9V6N11gNYiRWU76BKFb3hwn3rMW7eYBspgI8T4RT37DR+7b7PZteUE3uUfCIU5CBKnFfaAEYlyWKqWxgHceq/Lj7DOKufgYg2rBpRPZAV4vTXxHI8gyUIBpzG5F07/B5TJA9VIKlywWl05WVswXhya6VxediTcs2o6M5DVRnQm+EsqUAXv0GF5IYSoxoBWfHTFJ408pAs03OTU8XfiOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKBVDhtpxcL4cmVIcfnpqKpGZa9abExu8mt9ktRc9H8=;
 b=e6Le2lrc1pTXcHcBzko6QFdhS+LgXAURFs0POt88KgBHsc0Zg+udNKI3wx19JG1n+UBowkek1fDNto7n5P6+5WQYe7qAPZhD+E2fbY1IWIzkZJ9iEm+EeGopqeuzKLvIKM0fwI1PWoVjzCIFTglbEBj+6KqQeng2iGkyUUFrkTkjXjunJ9L/Ny4TimE/TJTFXualTNV7YDx2WNSXBF/jlJoVqn2dzZhxS/q0zU6M61XH6yBYS+bhdUtkxoZxIhJK0W5MNm13+zAkcNbM1oNrs7miC+wdqi8lfHPeu3S8lLLJQT1pMTWbDkQ/0NBHYmStvdNC6NfzddRQ8waM4m5wvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKBVDhtpxcL4cmVIcfnpqKpGZa9abExu8mt9ktRc9H8=;
 b=OdHGZ8FmGYX1G5LEB2Upc3IxNC268VpaKIzKPB0o2d61PkZWiFc+AIywiXnsUUIG7S0tGsHzuSYGGsSoftB+srqMYliXmr959BMjBq+LbjXKiiNDKXs73TzWMBgIlqjbNB0KpILCQMmG35/Zre1W9DMF2xhLYY8orH++M6hfPdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 06:04:01 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 06:04:01 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank.li@nxp.com,
	corbet@lwn.net,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	will@kernel.org,
	mark.rutland@arm.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: festevam@gmail.com,
	conor+dt@kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	xu.yang_2@nxp.com
Subject: [PATCH v2 5/5] arm64: dts: imx8dxl-ss-ddr: change ddr_pmu0 compatible
Date: Wed, 11 Oct 2023 14:08:38 +0800
Message-Id: <20231011060838.3413621-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011060838.3413621-1-xu.yang_2@nxp.com>
References: <20231011060838.3413621-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) To DB7PR04MB5146.eurprd04.prod.outlook.com
 (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|AS8PR04MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a92ef7-24aa-4c4d-ac86-08dbca1fdd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4yaQ97RMZv1d5nZQi91bFRFHsyC3/ojIU7Rv0gOD1VaA2vwxIqxXTScowTYwQtyJlP1x7WN6PhOMEdPw5F3QTGFGGjHI1z8+PzcGh5zHwpPvFdZKVvJuU6Z1qwxzu+GfxuPVFtp0PxqEESHkPSQmfdgTKt4fp6/W19uvwiy535ZTcNEaHUK9+JVm184+8x5gz5blT1zcbiNLoViKDdHCettoVtul0jXJp1yupNM87ErCiEsgr1pRSF/dbcMpJBqPBgm3BT7fTrur4sLnYBqo1rBrCfoqkYWj6pPuQ/HTIdV756yDaKURzdsXQ3OOlWYi9i4rRH3bgdh+pxcctVkLX1ggvxUp9HJuiQJ5qUChEB9yaOdvG/RhH44RFG4s071M9OOye6h9pV5N8zoc5oW4YT7UqX3V9TvUcFcG+l6sTvuYENGNXV66Lc0LYgYO4/xUXoos5KGuqyD1b9wfAaLOF9LECdFbvMzzitpzxJelkihZwa4vL4WPn4SvOTA6v2Bl6JsMigSKXceYGPoykK7HB/G62iRXv7pjLmAa9mtIhoc0k7n10aVhvZMAPV2BuQJ6gt6poO4zSP1Qki4ROGlG9PRDgNwmjfRGPzaQNdz5w84mBUasdjYSTONz9OsOLR6AywDimj96Od60i7ogqPPGkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(83380400001)(2616005)(1076003)(26005)(316002)(4744005)(41300700001)(66946007)(66476007)(7416002)(5660300002)(52116002)(38350700002)(66556008)(4326008)(8676002)(8936002)(2906002)(38100700002)(36756003)(86362001)(6666004)(6512007)(6486002)(6506007)(478600001)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oCeUiUHDRd4H8beF+MziDLtoDFwfLgSy9qcE25DWIxE16tAbxWJEU+UA+oxt?=
 =?us-ascii?Q?jYqK2XZQelUbQMxFd8ZUnDe8LP8HiJVMvCr9cjKpsinsTbonXXzuNpIEJi0+?=
 =?us-ascii?Q?yY8CxGuq6+cwLz24TMXAic4j+KYYPTsVusvMdVFQJj/XATWoEYCjfnTqMLh7?=
 =?us-ascii?Q?z1W+ulMu4VfgSv5LukacNc4xy93/SAc8RpvU4V7G2sNr4tpIvpB87Atn59Vv?=
 =?us-ascii?Q?PlSRsPDu0Ubd4S36csG7KlMFsjFB5Ny2u3pwx29JVLyhDF8ZyJ4jHA/7qPeR?=
 =?us-ascii?Q?wwo+2SxAR8FA2GZTqExKj8+b3PDqBwIQYM/SpZAKxFpDgg5FMdYfctPMIgoS?=
 =?us-ascii?Q?ksgeSsx1XPo/yWtYj7n54qkQAL3hNvnwVAlCdOnThU9uvjFk92VYCqqINpG/?=
 =?us-ascii?Q?wQvCRkmICKFkia2az1kPAv0yoAZLxzZ/oYMeEiM8qF8+anKXN7ned+l8IUAV?=
 =?us-ascii?Q?cq/sonvtdn+AmK39Ds3Y8W+z/zGh09+pV3nlGuvfiabcurBCQz4+k0RW5WVo?=
 =?us-ascii?Q?RvYk4qVWURwlyYzql4vu6lKhxjupHsJm03zjAlI8W/T7t35C8pLBysa8J7xc?=
 =?us-ascii?Q?I7B4obslOBGnqHlIRxVPrQnyZptxhVVQtAEOA5O7OOmC6s9PQFFqmsxg/A9u?=
 =?us-ascii?Q?T+OaWXcL2VMIkttvrzCjGHd04yjs90gcVddL1uJK8cl1EMi0ekWAGNAz33kz?=
 =?us-ascii?Q?/X299VcMqzrM3NVvIeFW4tlG7wRTixlbGYslISpO11CbvqY2W5wpG1yZU9NJ?=
 =?us-ascii?Q?Kbj/O5IvYUWKajAo56r8bhQ3PYQrMaiTrywy6koo9yNuszeWUHMAGFbyxxQS?=
 =?us-ascii?Q?0UXOqi27lI07Yu2KzQ5NSA/m9WGEk/0TW9fXrDSQf7etrYn+62hLkiD5CjeF?=
 =?us-ascii?Q?NSgd15GkTbKhzOjMkD+ktBjq/I2MHKjZ+MhShWHRty8WCGhDH+JA6CAGbNX8?=
 =?us-ascii?Q?Fyx4jm3JhMby7N1zTZSgr+A40Rm4J3qmQDvfEny6BTnt4ORflybH7ONx7m/t?=
 =?us-ascii?Q?+AMwE8NOlNRXg4v4dwuiQ9T0SIOMsofRZaDm0QDcQckjs/E8erwsZhzTFn1s?=
 =?us-ascii?Q?QK9hcGalPI2piNCd3T6IKR1Kz80Xkkbi+OwOmQbjmJrhq/n0YQuYpR3mjuUe?=
 =?us-ascii?Q?E9hojofT435uydPYk+DwSxDrkuGOMIrePvP9SiMNIIaENrlPEZxO9F6ay9rg?=
 =?us-ascii?Q?uA7W4HGY7uC9T+rMWXA3/Bz5/+/IWqUZ8SUlqF9/Uc4OL58loYmfmrFgf9iT?=
 =?us-ascii?Q?xcscgIcf8KkoNexNm68YZo7wo+hupwWSXY0q4HVhS8uddzkB4sieptSRFcqV?=
 =?us-ascii?Q?/JfkGrztRkpdW2bwErf5XxQ0MnG3E2VGDnlLWqQ8w+niQM9yEEfA4X+L1kWv?=
 =?us-ascii?Q?BPgaskfm0y4LA+2NkDzs0j8k3J7GqMbFadFa8+vO9K9/B1Ud+CAAEprnkhYG?=
 =?us-ascii?Q?WYoZ9BxYDBHNM2sifyF9usVKaHf+q8fBiReDi9CStVaINP8GLQGKoPntvN4w?=
 =?us-ascii?Q?TCLgMJ2Fg4a8fgA2jOBANy+MBv4rAi7LsuCxQHD+xnvceToi9u+NBVFTH+rm?=
 =?us-ascii?Q?15Ks/qg3ZbfgcWeWVbQM4upwg5lkAijkSuBK6+q9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a92ef7-24aa-4c4d-ac86-08dbca1fdd4c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:04:01.1765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCwx5jjmNT8ADd+HzNxRcUDVRmvuUascIwHI9lp4sUO23y0fcIaPOScK6kGBmgkBwZUbYmKIFgtGdJXgYWJGCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

i.MX8DXL's ddr pmu has port/channel filter capabilities, but it still is
compatible with "fsl,imx8-ddr-pmu". This will change the compatible.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v2:
 - fix topo
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

