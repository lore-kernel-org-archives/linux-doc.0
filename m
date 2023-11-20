Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fCtMFGYY"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546ED99;
	Mon, 20 Nov 2023 01:28:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2TCpt5stt5XSgSyOLz3pxc65dF6ZZ/Z3wrAoF3/AxDEnF2YsWQEs/YCDDGcWaLkJfe5S0bKpLNcGZ0PP/O/aitg9E6fr6TYuhup0l7IoWMpb+LH9QkfjvfGFF11Fa5iNPjPbU+JeVZmP67ZFWtsdXwxDbnQRHF6DUFEMymmj259KZohMX3u9qIiWe3l9Y0hgl7pWhZwuC5q7bdv2sSMO2iyGR3XleK+5QzDePib5hU6h6fygipnls7w4Xbf+UOOicy16SQ/xl+zHjVM0bbHil6gaVNyOhxaPKYI0ORT+6Ghes4+G+X5GAdX89RDR9RVQOmIYNR80mjHp9jifx5sNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZQtnIIf0m98UZG90cDdzUJe/d6g11iqrj+uXH9pzm0=;
 b=JqN33JKV78O4T4UJ9aSLND7B+WdVLI9Nh6ADI6ofcYxTTAn8g9GnWgBapIJVl7+qJqeaIIC3SHJ3Q2JrFVIYjfy5q5xcqFnuW9VHIgqe87jXiHfD/u3WW2zmO1CUseuHSt9werCQPcfGvycLDKQE3hlu35YudiyC6/2UdFcElWiK4+52lrvtVh3CEA1Xy7UI+z+5Rszi7yZMZL84WynUhARS6xE/3h5rh+S6tDeeac9yAUJtEaSgJcIdX/3qpOTBdXX+q390Gv2Im6RO7zNut1vAKKleAPKg2rX0Rsk+o7IfjZWBjviutMKFCZokzeHrfXj5BNv0vl2B/NEViK6vmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZQtnIIf0m98UZG90cDdzUJe/d6g11iqrj+uXH9pzm0=;
 b=fCtMFGYYZQ3l8M55Wzz+r5XH6FnYcxbkAcvr+rHNRQ/CxlxOG/ZzjER1CVCggUwAqgYtPzthqV962ShP6nwqmE41Uwc8ih1QiAWTo07mP9d+eGiUDOjhF5XmB001TuuioIv+HNiUrIjQ8HbdNuFkF9G/06hnlLRbLYgyXb76jTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 09:28:23 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7025.014; Mon, 20 Nov 2023
 09:28:23 +0000
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
Subject: [PATCH v3 4/5] perf: fsl_imx8_ddr: Add driver support for i.MX8DXL DDR Perf
Date: Mon, 20 Nov 2023 17:33:16 +0800
Message-Id: <20231120093317.2652866-4-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 41e2aaa3-d247-4588-d7db-08dbe9ab0a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aCMY/faeWTAs5UW5CDqaR5eCkvE65QsBuX/ukwtI1oj8lDjVMbEnXdaUx8x0mNScrCCCe+luvTQKYhgmh+v13wjVdbVZvbiXM+bdeiG3LLLy2uQSHwCKz7azEgVFcPaGrJxuVh6di9/s8YQtQByJeMMdi6kASs3YxEUmv9iAC+aLoxihYSrmHk1GOrvNhkrnoTHLpTbm0H3IQG8IstPETnhCYouYapCU0OHw1wuW75k6vg3Lh1gY+0GuhpJ1gfJ2Ofx/zeVi2fJT8MZPDl0KqHRcpFSf3JCH6bFWldaPCSbk/tFnCKP65r78pfRPclRh7Xi3WKhUuam35i/6q6gLeVO3tN+sUYY5N8Uq0EBQ+18V8BsuDZ0xv+GTDzLkrZnnfm4HbWOPXQCg2xcWyMKurGFWMxGGiHRLxigYN3LIFKVO2mmVTIduOgDarLtzwETBoaF3+G0/JUTaYzvVT8dDfUmszernwwSx9xWAwhm2DSg+812lLCRZ6zOHTVLfR6Z/3IHSNjOTWWdkymYP0TLTXMtjqiAugrkJ9rKoOCySQ6YYmnYoPneyQvEWk/KdpSPbY4P0Abdn8oVAmaFa5hZ59FjB9sdMkr6KAM/aU1+l9wtKCCoxuoSUmPRdKl9NC/e5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(6486002)(2616005)(1076003)(52116002)(6666004)(6506007)(26005)(66946007)(66556008)(66476007)(316002)(86362001)(2906002)(41300700001)(5660300002)(7416002)(38350700005)(38100700002)(8676002)(4326008)(8936002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R3f3+rskltJkxZSu8N4SftR7Zwm7VyeNSGzLuPSuHBP1G9f+bBMXxrE8wIi1?=
 =?us-ascii?Q?oUJU0ZWJ2T8LqdZuhDiVzsygSCZCQdm6ND1/uS87S4q5y5pb6QwJMPJWCXy7?=
 =?us-ascii?Q?vqaaiwUmoP/mShBpANJ4RkrlEYGuVYrQMHZ/6uTEeyb6AwH336astmD2ui6A?=
 =?us-ascii?Q?jTIayzNCZjxT5B/gG/hPwp0ykRAx0eBckQDif93dgx/kK+kiY3JkSFIGMFz1?=
 =?us-ascii?Q?h58EheGAgUfBuckcZUo3oFAFcr6rrw0VNLNidVthfWt7fqv6iL/Fk8igrA3t?=
 =?us-ascii?Q?H55Nm7hyVFHF6qyv0zWCgG27NyRpJENDJF/K0NuMlXPlfSTU7TxNeWJMW34n?=
 =?us-ascii?Q?192zwPNxU3M/f8i+Ulr7sMKsF8VqZRbNVVnEXz+WqV3CCc2JmQDWsRAiJdJE?=
 =?us-ascii?Q?/Lur9TLvzRFNTmXDM0jP6vJoHtsDkcfnyvrG27aXlUXJasIdaaAt+z7J9tlj?=
 =?us-ascii?Q?Hj9JXOsZMTqmoI6NQSrrYNvsrnJFGDlXHc9OJ12wyFzRIwo/6f3zpyg36MrO?=
 =?us-ascii?Q?LSY9IPIkfgqVLaYHWp0BNclM+fOaYCfgHim0TvBdg5s9HBwfoItFZqmtK6rM?=
 =?us-ascii?Q?QkElewYP0hzML8LvQcPS+AKlPiEA1hN/2ZJ1qEle44/7KkSILI6AZ2WfdrIF?=
 =?us-ascii?Q?50tvpveTW3QsamvYD6GZHyZFU+ZpyrlpkI/fzbWWiRdtK56tC7K5GZXDigJN?=
 =?us-ascii?Q?cH24zU3t7a7ZGyJtcLRE4OTyuO0ZeAbap/wfACEj6q5CDXlzTPV8VMbfpwpX?=
 =?us-ascii?Q?BKSEJXFbPWPoQXdQ/aeTWKszQR9HlBxrUDMQmHsfhXsG2HdNJbihlIi5PEXf?=
 =?us-ascii?Q?Z/0mN5i1sxWP7MXfzP1aMUuFBVtmPqQcMGOTb+TSnmeMslmN5XHM5gzOILo+?=
 =?us-ascii?Q?j9ctPIx/4xM54heTE0WILeZB4v3fK6s6070w7oNHjmwM+kEsJ6Xx/7+kCxfI?=
 =?us-ascii?Q?X9/coOD6YaNmoQ7LMy6lb2a0v2kjGMHbxMX6S1G+ZtZM9TOuDpELjPsGWHoL?=
 =?us-ascii?Q?rwwL8lHo1IJXz99E+7y08HPS9tmC96cnjbPbtg+mnnVw0UEj6tld6Y+o4Lvv?=
 =?us-ascii?Q?lmM1Ez4TubLCm2PEYtWA02ykjo1MrP3i/PIJHO5L7G6HuA/NCM70zLj84Qfd?=
 =?us-ascii?Q?Rlv8t5c7nRK8Cl0G4cCIuW4PMrEJXBGwlM2XzURm3ZKC6ypamiYfpwpmschY?=
 =?us-ascii?Q?m7fM7bgzGwWZpbiRtjH0HZOn0WemLO6HbJMLD+wOxjwsajwMJGFXFzurs2Lx?=
 =?us-ascii?Q?2CRGi1t1GsqdyTbbY0yBLNfS+iH5t3X9ULHHuVGqFwo9FH4PWLsUZyq78FgO?=
 =?us-ascii?Q?y7M0EiT7yPjoUnziEtuA7mkbTMwHvMCIf7FcGSRWUOgTJ0b9J6KrIMexmGiN?=
 =?us-ascii?Q?9OB0gcfnyPptYjZoNm5blv1tWG5ilX7U2JoN+wSS5HNfAm0BjnMiKjwNn60l?=
 =?us-ascii?Q?h0fBNq3hU3OpdAGKMoIEDnyJJBJrZ1Vnnkz7PNOSRc6PNmGKKbLe9sgBHxDg?=
 =?us-ascii?Q?dp4Bq1Jx98gtK9PNuCuxYp2fJZIzeGcmATaCdFMUrgZxRmqp3oYBkL9kwKyk?=
 =?us-ascii?Q?eBYWhs7ZV3FIz7wgWeQK/HNvmJ70b1Sn2FXcy87T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e2aaa3-d247-4588-d7db-08dbe9ab0a78
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:28:22.9497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icclBscCucSfIDcHr50GP/DO9P6L3M87z0C7UIc1VadYvEURn3MU+XXsLwVeAFYlScEK4ZTZm2vRmEM0uK/2zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880

Add driver support for i.MX8DXL DDR Perf, which supports AXI ID PORT
CHANNEL filter.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes since v2:
 - no changes
Changes since v3:
 - add Reviewed-by tag
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

