Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B50EAFA;
	Wed, 11 Oct 2023 06:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="nNPBPxKL"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBB594;
	Tue, 10 Oct 2023 23:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQSe/pLsjdZ5kBh69M9G36/6hPC5Zwzn0Jc0jEc6iXFbQepnsi13QFn/pK/dZYhOa0sGmcI/4+cPIxFZ+vLIL7oJYv4q41NKDa8Da3j671OhcIMJMKsIQRv1IV627viJYkt4h9/JKMImIv2HOigr0wqNJgnKlHtgo7U3XEKpMdEXpMUPZi1xZ9Xy1mzQAlN3t1zkGIxxos2e63q/aZKwyar6x+ZVobmnfK+IhU0H+RJNe6khFtjLrBfyF0uCF0R8QUDqfelCWYKl1FJDRYXoKsqd5QrTjs7bZywo8pxiIcU1YqOoEj/nWr9Womf6s51yoVu0OYmrqZ/qXIdlwjRjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLRXMGx5akvmNDvSE8veCHJpPe80ZAEfmvA3GvqNthA=;
 b=GX6/sV5pgXOFzaHSavP/n2XIRrtRVcb9ZWAEc6Vw1SXwrzjXcM5cKoywy2xFI9gwLVGjjuNdjnbyomOtN7kUUEDMQ8TgQ7ThO2MzeAf0ZsOkAO0ruuJc/K7W2I79DekpIo+vGPfz+utD3xWN6T3TDNZlOkchf4zrw3bG7XuxvjZb1C/uE3XWxZ2+g52tGAUXjmJDrYdQuAaIIWYFpi9WgzzT0FmLeRy90EUtkRCtq3u0GrJR46rhJ3PPWPcagb7aeEwAlDYJ62YcLecaT0FzaKxVbNGKxCk03Pi+25EohCSaHX1ekALm+RcQk4+T2vf5PDPkMjVMggoRKB/xarax/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLRXMGx5akvmNDvSE8veCHJpPe80ZAEfmvA3GvqNthA=;
 b=nNPBPxKLqe8Cpl4srOWzApIgqmudWni5MRSaEAI33/oJUDjowxUgK0qAkUeEKJ6+kgW0czmjH9/SLyce9VQuEL6sMslwBpD7r7dxmQAXkHfwIAIoMWuGGfZJX8T8kySTjTIad4/wueZNlwivaUx5YWy9sAtp1cOvc+S8Y0aI3g0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 06:03:51 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::f4f8:a4d6:fe5a:3e1%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 06:03:51 +0000
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
Subject: [PATCH v2 3/5] dt-bindings: perf: fsl-imx-ddr: Add i.MX8DXL compatible
Date: Wed, 11 Oct 2023 14:08:36 +0800
Message-Id: <20231011060838.3413621-3-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 13afd079-56ee-4749-bc08-08dbca1fd78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AUQWNmCx8LMy5aJu2Rl+1KsZyW1IcdKDME+262QKkpCX55YPTeidmrCr3jIQMgm9+cHT/7X9FDGOhr03bATgNDELgtZzBkoMIICU2eaufajft1HvXP6Y2gu8eYMEeuay7D9OgM6wtBjlD/6OuaHHA55InYug0Q/thteZi923gLmaHrWqspnSAWcSVHH6C5Wc6+L3WRzt9fISYFvHQErjpPAPMOSOk6unecMcPFZW35do11eEQOESSlIZh1oZAxlKYxV1zoTLH+ZvwG2Nj8GzW1owzWI6WdpLrQjOgX5NnlRqypQNxQQvPDYqSwTDh+3hhdUp0w+Nz8f0Tltj6ua9OP9/Ran/pZX+xL+fiNmqC5Uav1xZz/l0UieH2bvMhb5gx1gP72qvxeXJCUNxqnN7aHXYDAPx8ISAPpldod5lrpDH+9wn0dWjlTIDlk8uvQ4LqZSGQkVaHG/NfZYsGKjpPa88ZIpSxv9nLtFxcCYkONBoU4f39u7mptPPN6ugyw7vRyb10jyTfiizzf3GznYiEaRaZF5a2B/mYehgHYlsNkysj47hUVSmWbXMzkX0EhhG7JOkQuas074DD7yxqwxVscjPM66fPt8q0b+t6EsH+ZnmEMftrgio0J6TAGSh9JWr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(1076003)(26005)(316002)(4744005)(41300700001)(66946007)(66476007)(7416002)(5660300002)(52116002)(38350700002)(66556008)(4326008)(8676002)(8936002)(2906002)(38100700002)(36756003)(86362001)(6666004)(6512007)(6486002)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DQcLEOPiSxl+ZnqPQ3ME6opPcOil0zmFNhYb71xR5cKFaJm2eNP+LmM+uXYM?=
 =?us-ascii?Q?fwkYw2HOnK2UG+JsEkNb1MWsbSnyBnqnqZFU+0GEnshn9vCWCCDVwZJ6Nh5U?=
 =?us-ascii?Q?b7LbNsHiTWtN5VWAXOEztt+X2wzAycuMW0BdE+au11I0FYYdiAXboOa+fLjv?=
 =?us-ascii?Q?QVy7Gmy+pJDsyZ/NgSxLJTjoQFyqpIPaaeJcEpPl4YzFrxMNFg3JMLXq1jMW?=
 =?us-ascii?Q?IQvkla5OYHazxiVzACZG4E3OfltbKSnGREYuH84PRUvR4bvZhxMwHbuP/5aS?=
 =?us-ascii?Q?i4cZ/iX6MgJt4/6n4gnXHpToJw6L/YnIGY+9wAM6390VyvP0SNhok7H0QgB8?=
 =?us-ascii?Q?DVr2Jlo1tVXfyeZBdtBWD2SVPPnyG5wt9BwBSUnZC4p/OMmaA56z5fxMaqmf?=
 =?us-ascii?Q?dNhYuduiJiltC0E09px/43V3X1eIfJSzkZHdM5HWH/V8+yTlQegICoSOoPDK?=
 =?us-ascii?Q?C53YKJHRSVw1hidagIlMmSjDcq7zoUbTcOG1x11hZdZposWHSEZPZL19AXJa?=
 =?us-ascii?Q?PnATVmMzEfMFFR+6ASbX61vGYSnPHwKj7QrKpmsiai1QoO9zJl2RTMR6OuJ0?=
 =?us-ascii?Q?EbfrZwQnoP6XmyoZjOrNu+bwmj1yIufi5g/x1sOuWgNelN1vEdRvhWTCnIIl?=
 =?us-ascii?Q?N/dW5erUVW2RsBav5LkUpUlWQH76oD5iYfSEgtJWy/rlJrGENgOoy1ebeFZx?=
 =?us-ascii?Q?wE4TgLcqk7RVL27OWPWT29E+fr+0OtHRmq8+rg0c57HyFubuNNPr8ZDhM2/m?=
 =?us-ascii?Q?UMkyAz0CIf8Mpcx0ca2r8O/ytOu2+y9ykGcGqmbWjFsZ/9JydF+XUKi2deRu?=
 =?us-ascii?Q?NNcaGbo3BlEZvOXlsNfDgUw79iAjmprcq83Ul7QFoByQGsmx/u0LlyKLdVXA?=
 =?us-ascii?Q?Nxfdu9fnomPSCMJZTDoDy3gnkF7GWXR92Yfjwsw3rVenIJYUWMwDdSBi8mGv?=
 =?us-ascii?Q?589LPXUu9/BEs7HDPVwfTHQ0bHC+wAfrdF8AA+JOJw0m10iocECRLmpeF0Lh?=
 =?us-ascii?Q?8/00ClXRzbVHU7fm5F/bNjaHHibTd/rjiGVdpKKH+hRaRng6dikzaqaUp2t8?=
 =?us-ascii?Q?zwZTyU1lwIo+MmrsKwiM75KJ9eBsoRPvIZdVryd+ZTVWhbumA7tXeMMouIXc?=
 =?us-ascii?Q?KO/8w5K6KkKecc4hayNjTP9pGoAPGNtaicWXSj5O0rOs1UHBquH/nfQGNHd8?=
 =?us-ascii?Q?yXDsOfYOLTPK7L1yYFMXE5YY3oKWkNKQG/MbZEipxVnqKgLgHo0g8XQXWKLZ?=
 =?us-ascii?Q?bVOpEq4gN43X5/E7qDcev8Q5kq/zKq2czIG0BaGxVFo1HNkZx9lYFG0jZZm3?=
 =?us-ascii?Q?bmB5DtjDrYU+WYooIeOWPVAa0lPDGWwZqVfoZ5CF2KauGOhc4pvXdLsZl3Ax?=
 =?us-ascii?Q?Vp8icXeYTSYkb3TqKi8MPGEDfZm7WD3KbS2UUs4qX9ZxPx+AarkdvChxnc74?=
 =?us-ascii?Q?y5UEfxnTPecFqwH3nl4YJ1k4P/VQHyUyasJ+OTM6RNUTkg+qDtOSlKxwdFOC?=
 =?us-ascii?Q?+xZK/XJyfvPbj8ASrQZyJvivN4bvPvPrk6sDsRZ7E4rXq6PcI75ZhUlzc6cq?=
 =?us-ascii?Q?2kS3OKVOHxsFPUfJfXhpsE+TK7ivJoqbUemG1Ig8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13afd079-56ee-4749-bc08-08dbca1fd78d
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 06:03:51.5514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sq/cd4EqR7j4LQUvN2d7dXKmxnI3pVjYYUS3B7XRNZuq5fkqKoHNZI6vLs8RELxOyqNvQSeD4LlCZXAYyNHH8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9080
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

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

