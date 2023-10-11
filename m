Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C351CF4ED;
	Wed, 11 Oct 2023 06:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="sugaoD0B"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81009D;
	Tue, 10 Oct 2023 23:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUhldSns0mMcNDAEZPUS7njVbHUEekxXfU5L6koE3z+VTrZpiage+SEUMspShACUFb49JRlkN94GByPIg94JDSplTKS2VI3D4EXyH8IqE0oAioVeiJevwJ9jA3fpj90aMNwG4TvXs4Ex97ibm3YAZ4XxlfCe+cH3SLAjf7MYNnugx4+TRW3bsfnLuXOMRapKCv8JS+653AIl5T+Td+rSElGOZy6tUW+SDQOsDmShJvs6965vgnOlvBfD1HwDVDow2/2vrPLFysHtcq6BK/GoCSUAZ5tP+kENyxr3dVNymuaT9TKnxGUuRk2SfvTkvW/CONfEFCCHUWsc70X4j2WRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLmYxZ9xCSzfwY6fLjl/i77tUVP1xJXfCDbO6FmeDjk=;
 b=AhOH+7yUdJebQYcvuQQ2jFYJRw0Hotk3jmJROpA4o+FOGmU+BC5UHP9wbt+DqKh0AK10o+5fpO3VCRX950w+9jUBMHgekUkiHGdF3FNHEYUkcjpeZ3Ng0Sy5VwVNYdCtqKcmREGMiw1l2sbZaXp8F7iJf3ank+JTlXkw8RHTxuh/K0LSd69Z11I5T9yDGDlkDHQIgu1tEJXwzel1CkT5e83LBXAYhGDBfaq/CxAyEYwjKjm0+el7q5dFW6SS26IUaWn3nHde87exfzbRmZsWX31VnNyBThTolu3p7ypq9hHVx4EMIy9NAFeO2r8LoqTTPdnkm3HzmravFWxz7928zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLmYxZ9xCSzfwY6fLjl/i77tUVP1xJXfCDbO6FmeDjk=;
 b=sugaoD0BHXUoZWeGewX10XQWvKcJqq00KI2P1Yi+k1cSCbSST7BbYGqO9rBO+ynJH3+0XyWg8L8EN1Fy/WiMYLznU/AymmPfk/197BaDlKk+O+185J8Lf0jvkUDWj2y7XIG98yTMa84n/NtUnA3qbabOz6P0DqMdZI0tdetBurg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 06:03:56 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 06:03:56 +0000
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
Subject: [PATCH v2 4/5] perf: fsl_imx8_ddr: Add driver support for i.MX8DXL DDR Perf
Date: Wed, 11 Oct 2023 14:08:37 +0800
Message-Id: <20231011060838.3413621-4-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32d8d4a8-cf7e-48bd-657a-08dbca1fda6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/mwalncNbknTWT8dNNQnmfWCW16vClYZMV/djp+6hD1Yu9rbZLxhCl+SHZKLgvjs2ZEs01EotVBZC55M8rKsvA1ovtYtmaXoH0rFaDTPOTsEc0pmONTD77oAGdgBPcFfb3sbpchitOTBtS+hszDjouQ3inxqV8sJOtnIHGB7ORX99Wq/Y9neObq81fTeZkqOXatEhp7mdUIRhsYvR2KprVLMPblPk3kTxACua0jvZ63071eX6uTUfg5uJPabD6TGykTnktZWb9HUH4uC9I4T1JkREDIUzU7GESULEVxg7YpyJZlQhYylCyFWEK5ytF8kar27XqlcOadJPz5WO23YvGx8hu+uKg6sFMlSQdaQ0ySyW/17YwAxtvn3i5aW8E8h4cmaetOFIlfLjGs3T3vLLTBnjs7uDNPzombc7aw1T/6v0l/0eqt2zwtLLtva0vbEym4KiZAAbipPSYsHiel2Ra36yzxfxPqEurUxY6og5KMEqB035Kn3jOR7GkGrfbCJcDUv+sxHHf0tWGvf6cxEPuM7thFRdqWYClkeA8TjTsdP50QFtWMANGgifRd2rPArlsGrT6vwDaFryqwz98pO4fqSAaTS3M1jtY+JMqEdDSBAw7myxPozVSkQPnS+FuM0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(1076003)(26005)(316002)(41300700001)(66946007)(66476007)(7416002)(5660300002)(52116002)(38350700002)(66556008)(4326008)(8676002)(8936002)(2906002)(38100700002)(36756003)(86362001)(6666004)(6512007)(6486002)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hg9mJr2v3P1p8M0E48LJVVKCC6oebSKCrLYMCqOnP4Vx6VlaZHbqBDxdkdM7?=
 =?us-ascii?Q?CNbzykM4bH0p04rVibRjKFofGlKOXofOsDLRSAeDS5qGLPID+vtYkZ2yDYMU?=
 =?us-ascii?Q?y2b5fxHlGfqfSf69MFxOvC1TQRlrmke61af3SRLttxI49pW0ObdYPWioHCiu?=
 =?us-ascii?Q?vmEHOqGfOigtBX4AZO0EG9BTMNbuZcX2w8587pZ9Q88CcBK7172FfVmXdmQX?=
 =?us-ascii?Q?749p+rYCjhpacpkDqOJ62e4qzy2+o8ZHHp3JsvrW5ZyD6i8IvMISr2rst757?=
 =?us-ascii?Q?+AWU/K8Svmaylf1XdfPGZG869FEe7Bj21X+MZ9wYgncPQteyv7ta+eqHLfCR?=
 =?us-ascii?Q?9j8ATCGXemUH61dw6iIuf0pejVOKKdGs97foemeqEJI3coNlznefL4lpbwcM?=
 =?us-ascii?Q?c8l/pYcK+bv30l31KuV9YgkP6CVvVa6sxmf2QcXZCFWTQdJjkgrdNYOhEKfz?=
 =?us-ascii?Q?5LgQ3AtD6Hjiz/6g7dEaQxyKBrsTv0m8V3V/xKNvCraVZHHp3kkjcH1KO8ZC?=
 =?us-ascii?Q?Mm3uWydZ2yd46kROQ89lR7v0B08YQ3S0nv1slIWE7NclE+3wAm3SENlRQ4KQ?=
 =?us-ascii?Q?snokMnqs98WgZsb4i/kd8tOSE3XqAJE0UmWyNZ7XSm+XAm3XCwXbCwYYKTUs?=
 =?us-ascii?Q?ihAia+V487GWL2EFWYpO0cFzSToyUR/TL0eAeaWFGhHy472sbRcnxhbwbd25?=
 =?us-ascii?Q?K9XZ7ixbNvUWQLYYuH6zQT9DwRA5XjDgV7QZ9elQovE4lX41mrkpcuKNKVAQ?=
 =?us-ascii?Q?GObVeh85VwdGx9KY0PSreKtmNZLDtIpW8h34EpedI+9R453gy1tHQrg/zsHt?=
 =?us-ascii?Q?ytsMWwZ99PuOgFWYNctuqUyeRTgzJJysDDmH2ndBVSVS3nUDPSvPzcB+SvYM?=
 =?us-ascii?Q?QA7LAOT4QwKC+mbAIKr78bnQWtsRAJdtycLk+KQbwE/bozdp5wz3PY4N3igf?=
 =?us-ascii?Q?SpOxNIrfsa4JKJOrSltmOecL1HR2rQ99+1bpoGw+QiozKpGH6t+ezwNaZi4I?=
 =?us-ascii?Q?ipgsoyg6d+/HszyfFO9YUM3d/ArHGmRokSyGOvmof6FNfOBmH/uZ8QUkDs/P?=
 =?us-ascii?Q?7202kwMw19Lw/lbiqx7zHYltVptcExVR3EhytwY/s6zG+DxvBVT1F80sW5iy?=
 =?us-ascii?Q?Tv4idQBBoJL4DbKvM4leNMDjmdldfqdfATb6rZk2mEjGa1Wc5/pLlTuRQ1cy?=
 =?us-ascii?Q?3m56psprnOQyGg0CKZ+C4/NaTzzk48k3Fpei70NG4PQZL7gUXXTdZtKmDmoQ?=
 =?us-ascii?Q?pKi15CE9MyPIY8mz0udli2ay29RbNlkE7T45OomQ+oCzljX0kdwDzIJ2QhhH?=
 =?us-ascii?Q?Mhd8C1DBDpgLbskZwwP7Wmpux0XyYD2fAU3msHY6b3IGcutX9xDzafI22hTa?=
 =?us-ascii?Q?WgU+NwQy9Ecv2DWbR+rcxRS4bygZn5On/+P8m3GreIpRk7Avwr42ROgk5idw?=
 =?us-ascii?Q?U1/hJ6ofnbarFvTWW1Je6F+eAnJeCYSwijJ6d/eYkMls0AW5JiWvidspARnG?=
 =?us-ascii?Q?g7Z+Bwyj+fv0GFbqYxB5+05nB6B7bOCMXMARI/9wo3LxikG5RxqDgQX5+IGx?=
 =?us-ascii?Q?Bc2Ef9/iOZiddbdZrSqeI09kdXSXsMD3VEqSAobM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d8d4a8-cf7e-48bd-657a-08dbca1fda6e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:03:56.2672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZfc+nsdPNa6Fh6EJ4kbus1N/SHkMyOb4Z9txQmmnPYdouhGn7Bt/fjDrpg3dLfbxPuI3NBiLviULcpTqBYEbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Add driver support for i.MX8DXL DDR Perf, which supports AXI ID PORT
CHANNEL filter.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v2:
 - no changes
---
 drivers/perf/fsl_imx8_ddr_perf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index d0eae2d7e64b..7dbfaee372c7 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -92,6 +92,11 @@ static const struct fsl_ddr_devtype_data imx8mp_devtype_data = {
 	.identifier = "i.MX8MP",
 };
 
+static const struct fsl_ddr_devtype_data imx8dxl_devtype_data = {
+	.quirks = DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER,
+	.identifier = "i.MX8DXL",
+};
+
 static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
 	{ .compatible = "fsl,imx8-ddr-pmu", .data = &imx8_devtype_data},
 	{ .compatible = "fsl,imx8m-ddr-pmu", .data = &imx8m_devtype_data},
@@ -99,6 +104,7 @@ static const struct of_device_id imx_ddr_pmu_dt_ids[] = {
 	{ .compatible = "fsl,imx8mm-ddr-pmu", .data = &imx8mm_devtype_data},
 	{ .compatible = "fsl,imx8mn-ddr-pmu", .data = &imx8mn_devtype_data},
 	{ .compatible = "fsl,imx8mp-ddr-pmu", .data = &imx8mp_devtype_data},
+	{ .compatible = "fsl,imx8dxl-ddr-pmu", .data = &imx8dxl_devtype_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_ddr_pmu_dt_ids);
-- 
2.34.1

