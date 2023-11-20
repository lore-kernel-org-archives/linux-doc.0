Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zs80TIwE"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3E085;
	Mon, 20 Nov 2023 01:28:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8hZo2IaSYRhMU4eKtiVlXpqRRQ/a8J6eBFd7Devmt9PMnwmvWfpayDqryyxriWK+f/lvfvve/6cx9lnxuqSEsTayOmss7xdHVo9to6dLS41/CF7wy+jC07hwineQpZ1XBPC7tHTq4aJKIEUUPd37BpxJ25iT2EdRbEUplf7ZUrJeO8STVRDsQX6fZkF+8Rieo//DTqFH9PerjdDGxxie7IVp76K6GKKCZpOX+MfvK8P6C+PnUEpXU6J/p6birHw5DCXOepzWPupKnAw5EY+1O1CH1Uz3y8drDK3/+ahLEvFtdIjeSY2Y2F0kuzJysro/kE+d5IZDDRSVAqYqN9TkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLRXMGx5akvmNDvSE8veCHJpPe80ZAEfmvA3GvqNthA=;
 b=BAFg/XqSUe38sMetMikca5csWMdXpRkaWCtZ9O99TPVGrSX/56hCp+hsDsqHOCrsRFLXHTn8i79hHAyMhrAs++7mghThQjGq35aicZB9MvThQ+aA++v16lmcfmOMHOsIUavWwCvn5kdo9fJ9fPSkMzFiznImU4Zvt0jnJL+677HGmoJ0JgMXyMgsW8bDyAFDXGVtRLxMVdHvT3YD/8YzvnTZsOlblT247245zqHwk+i22/3F0uU2nqWr+QvPEktPy8LUHmCJGfXNgnxoGO0x/ZpYcCOQHTS6OeYdBnrNEn2YU9DeOneRWEbsKlRUfiQTloHqBb3rMg06FSkfszzKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLRXMGx5akvmNDvSE8veCHJpPe80ZAEfmvA3GvqNthA=;
 b=Zs80TIwEm2pV3iTiQ14rclqZyvMbL9NydkpdfoSKC1atsrxrp539nyBc0tCvxdv1tT4vKEuJPljDHeWf7QKGeASa2Eq5BVlzFPCk6ZKeWpZThgQSllDwDseafT9MNZMECOqq4y4sO6ed5dCuDkDU0/J6waDL0Uw6oRt8mm7JdT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 09:28:06 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7025.014; Mon, 20 Nov 2023
 09:28:06 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: frank.li@nxp.com,
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
Subject: [PATCH v3 3/5] dt-bindings: perf: fsl-imx-ddr: Add i.MX8DXL compatible
Date: Mon, 20 Nov 2023 17:33:15 +0800
Message-Id: <20231120093317.2652866-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120093317.2652866-1-xu.yang_2@nxp.com>
References: <20231120093317.2652866-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To DB7PR04MB5146.eurprd04.prod.outlook.com
 (2603:10a6:10:23::16)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB5146:EE_|VI1PR04MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c829aaf-2af0-470a-2685-08dbe9ab00a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QL+WKbXNVfht8e2Q/dJxcz74vDXnWA/TZWqNqKY3eiQQpumvbfrDuS6xb5vNqQjBNmeS5sm5MuN5B4dgMC8qYyhiM0/ypTXaONmEXomwTO6artdNzFOdYDPT0/UVOfMFq5o7AFofT13+hm18IBFIENXESVB846XGZ34nWFfNpHCjiP9tUz+Sg09UOfBfJvxA3RkUY2TyCqUgnxm28VsyHsE3izUZDCokdg9lMIPzNoy4YFobZ4/KM8rh6Dbqu7+43XmTsWr1kdFu8wuezHojQQolZ/xgVXTI3SWfbwyoAa3rkSym1PRWm4tTGSY/ysHbBKLapBSaW5Jm7ZnglczR41MvsG7T+XM25OgINlVW02xy5CQY0kRW5MlI5sH0gIsm1ijdPGwUED/EKZUi5sBCMjefFPOW1DWim3Muk2uOTPFsi8hBuNkbsDVzMiXTZ32+UMgLSnPcavjKzTZKFQW6P9BJR87zokh7BktVDfTHs6R5gmdGslO135lqeftYkinUd30sQ6rYMVH37cokw1nrGP47ktWi9LMbPBdIhnqRaGd+GdcCFBhERaISSnGrw4SrTmNxdtgd0KOqoaERr+hGHpAiwivkM8UCOTGCooLtBaAS+/qIGsLslgO1aQ1rg1jR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(6486002)(2616005)(1076003)(52116002)(6666004)(6506007)(26005)(66946007)(66556008)(66476007)(316002)(86362001)(4744005)(2906002)(41300700001)(5660300002)(7416002)(38350700005)(38100700002)(8676002)(4326008)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NrIpimrE6mpS/6NSLy6ryFN27NP9+X7WEm4EeRjHu1FkFNWSQSs5PtxrVqEP?=
 =?us-ascii?Q?wJEqYSzLNd7BUMxpNaOTCZ4d+RL8Ujee1Y+o/og8abq18qs+UeKqn9OBiErM?=
 =?us-ascii?Q?chYkn3B7d1P1Lw6dG6qub63YMTmYCKTNOVroFtBfMHnhHiqDXoF7hrc0I5zS?=
 =?us-ascii?Q?15yzSMhUhRmTTwA/x7evzU2XASJ4/bEl2nl9fpoRzRNYc5UXo7yNzvuJkpIh?=
 =?us-ascii?Q?2aWd7sG+GDMVkBAh6EzvC4qSQbSSENRRAfQQ8YoipmsqKhWZYaDrv77dSghD?=
 =?us-ascii?Q?msLypwx3DzrOgeCzccQQ8w+U7MJk6BD0D5uVC8nQwD2DLEwk0SyNrp5mE8Ac?=
 =?us-ascii?Q?6fZ3BHgG1PCnh0r1bfGDv45zZ+F9sOzDuc3M12cvyZRdusIJCDX20J47liQh?=
 =?us-ascii?Q?lXM30GwUx49D5KlLWfnSCwZSkTObn5bzmsVMeSzJvLBMUqrYuz9UmXVIMHXr?=
 =?us-ascii?Q?mQibBJ0rKjQBZrtJH8pTmuS0ByW9Aheyal4KHIZWjWhPBVHudbGC0YRH2NzG?=
 =?us-ascii?Q?Q734XVqvvm0l3MXi5MrRfrQFDDQZKynmPGDVXLykgTYs44BOKtx+Nfue2UWz?=
 =?us-ascii?Q?xVHUbh7cX6xGTSXQK+Euh7bTGFOVl+U3SOh2AvyEUxrO8N+tW5emR/O8PH2i?=
 =?us-ascii?Q?HfC3PEOj79G0+OY8KzDC3JPLD9igr9Q+0rs8VVmPS1qBlw0RazpnUQZpGIhz?=
 =?us-ascii?Q?oAJceHAjUcp5JRVOVrizbVO6vZ/VUVhl29dBLShZ8XfKDy4jMIEnJb7KPoKR?=
 =?us-ascii?Q?KxKZWiKmq7NfdSihfaPLQbSE4o3A/d6zIHOcfWN19soY0D+4GqjoGyTNwZbV?=
 =?us-ascii?Q?kVniMHhQXgkMGJDQiHK56YF32E/FhGlXTWKwzdjFXLZ+DAvZmr9bfQVvszra?=
 =?us-ascii?Q?O/ypk0OcWYB0NLkgErdjlBVLhbUphmIoDBY9VZjUe4CyfdrpVWonBhmg4qUA?=
 =?us-ascii?Q?pd3al55Af8c2zJVOWZ30NF2Vgxv0ewoScLKdqaubDykYi0UJ4LFa9dJV62FH?=
 =?us-ascii?Q?pOPC29j8FrCyxiCgfbozxxxZMnsD67wEOH31QLlv0CtgrjLiICBk678dPI0q?=
 =?us-ascii?Q?vt9RqfL8S15YqMJ68QrtwfZljR1QwI0K5vcUvyglMBLyx73x+EwNDEBWgS7h?=
 =?us-ascii?Q?hQftB9n1L25KCqcsNtRjKwuzmHBH9J5ZaEjP5G4EziLYSH1FUO6laTMV4tMx?=
 =?us-ascii?Q?Lg+MbKb28v3KFbx6c1Bkne5TqL6djwjWcV1Z/pycQb9jz+1iGpRh01+CapCU?=
 =?us-ascii?Q?N76m+NRS25W/RDN4FO7xfczl6yKG0Oib8liISpWGc41/zINnTHQtSvsj1s+b?=
 =?us-ascii?Q?JnRwu+EaUr2cv+x+8KIn7zxE8327ExWTxwuxgTtA3j84YsTblefjh8N9AMTV?=
 =?us-ascii?Q?h3fYNYp+kmVQjJEXkA7Ona+5FP2jQ2W6z1npFMlX0eCzKAHaMCeaAFataDTY?=
 =?us-ascii?Q?G+jJKWzBBhf2x0Yh9I1QR9xsPVx7VdrHvP0/TroR0YhXu0JfgmU6h07ymsMZ?=
 =?us-ascii?Q?AUAnVExCPW37+un2iFkS5LujF9cEx6svoLqLUVSWNydWx21VVweh5hhdmoCD?=
 =?us-ascii?Q?2afbzzQCUNPjoHSqMM8i4HFPZa3tr1Cv/6Kvm5ef?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c829aaf-2af0-470a-2685-08dbe9ab00a3
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:28:06.5480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S43t6+CKZdxQOtYPzPehhJ0GZW+/zcDXI58+WDfyv+tF34leW3Eml1mrat/0B9sD/fZpgJ0uPxMPM28pR89fsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880

Add a compatible for i.MX8DXL which is compatile with "fsl,imx8-ddr-pmu".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v2:
 - no changes
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

