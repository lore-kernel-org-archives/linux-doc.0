Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="S2iYYDK/"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A7D9C;
	Mon, 20 Nov 2023 01:28:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUl2bxMaUDtcrv43MlqWvreVACc2a2nLaSRo4K+hC98KesfJxVKsR2jICmGBy66g22pG/ZiMNwXuTDb7yDzJlTon8K8VkpZJ8oyjjdgwWqN2svOy9AxkJy9e8cAcbze7aGsLAmzGzqtiatTpKTk/tC9gd9CU8Z8czMrd206GsLlzoEM4E+55yHzsTGSGisKqMKgyjYzGnpe+VkCQ4f1EqHXenlhF5z0FN5MglFnrL7fDKl2qHnDdj4dLMgql/xJgED4gJnMFJEMIbTh6hgrXxmT2eAa7J13YtH/vZpuxCPnoZxVWLJoyi2idYgsPsGf+QCR2+S716OgczLAd8Dab1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKBVDhtpxcL4cmVIcfnpqKpGZa9abExu8mt9ktRc9H8=;
 b=DCaTGrK3VcJYIhCxygoPmILayerXf3Y4hbvQk1cktYAitvnjpnzkufso7VRfSqD/oB1HOaEbMfZLKogv2o2muMIZ9ZC/ruwVYCXYuLRVzPh6m9JeGoKw+5ZEepp3kLksoV1ZV3HD1BKwlOrU6QznAOxsK3VYUST0QcdNyYq6V4RVgT9sZWuDdW8ml4I5GTFtSGBg+/a1kFetURnH74OEpJ5yamDTXYjBR8FRyFiSwQBj2f/P3GsDEZn63shhAE8MaXm4ZX/B+q6BGtiMKyMnLdoB7s+hO44KdJZZcoFy5tvvdD/afpZUT++Ua9LAqqUJX69s4z+8znp0CW4GSDvH1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKBVDhtpxcL4cmVIcfnpqKpGZa9abExu8mt9ktRc9H8=;
 b=S2iYYDK/+gT7TWQWiJZNfMvSIrjXGDH82ydtlyEM0KW8smm4Ty8oWbQvLuGbFC1LEaXkqqqg5xxR3JLuwJIoldtQD0d62RWqjBz8g/u7YDrjJXAi+3VsGdy5wf9fpnZmT0XqG//WysBvWOprp9JTdvjc+Ep7d21ERT7ZcgycoEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Mon, 20 Nov
 2023 09:28:28 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7025.014; Mon, 20 Nov 2023
 09:28:28 +0000
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
Subject: [PATCH v3 5/5] arm64: dts: imx8dxl-ss-ddr: change ddr_pmu0 compatible
Date: Mon, 20 Nov 2023 17:33:17 +0800
Message-Id: <20231120093317.2652866-5-xu.yang_2@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7f3e370d-e524-4059-7533-08dbe9ab0dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ikks+9au4zjC8noznqjeI66AfIhTTSbX8LCexwtZ3DOrwJ/3vfaMYT41rZaQzzq1tWd+vLJI5Ki0gNx7UmMtQqZSUW6h9c6PIH6xp5LRCCV4C8TbGSWQp46XE1sqM1j9GsNgxyolAQD7K1hr3iqsWiZaBloKKs01MT2TLTMucHfyg+nYAeAuYf2DK0lQfxnXKWf6HZqTWsr7eRMEvnJuesESJ7h52LG0Kv0ikrSyfX2HYWce3x0rzXb+MJjtDEC7LzhRXTk+UOnbdgv44IGezOPxuoY8k5oOD9++1E8QXbIfevBsm0/ozT2H2vY0X93M3km7C1a+vHtlqqV74hGMQcTENZ1upvItb3mhnyn5j4DpEQG1y1BnUTKYKV17gkv4Fw7eCH8mTyNl7BEqVRxG2QUa5Xfqet68cNiJSxbbH4GUhClbFOWbzcsKQcZa3wh0wxZccQOIfuxmXLH7gtcgZeW7PnYFNf5XTW0Xc9J9yQ0/dSDp+QKQzuaLoZllFxgZoYRkp7VW7ufTJ5aeBSNTrY0kRjWPYXTDPKp9tyAVCTMY2GQjEIPxWdWVB0GB0braSEoKHEVOxkFXFPG3PdvJSuRAyirj2NFuLeyfEV8AtFsoJySDwAbmcsogfLWeM/Ki+hKeM9DoMpiyy0GBB+OnSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6512007)(83380400001)(6486002)(2616005)(1076003)(52116002)(6666004)(6506007)(26005)(66946007)(66556008)(66476007)(316002)(86362001)(4744005)(2906002)(41300700001)(5660300002)(7416002)(38350700005)(38100700002)(8676002)(4326008)(8936002)(36756003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IeNFGmL4xrfV3dmu8pG0VdhTySrdIjLw+2gvpvL3oDxSWdB6dptchNYFqaj8?=
 =?us-ascii?Q?gagdAisMIL/5z2jv30yiH9A65vqMuW2UY2WvuyPhXpIwqikGuvO0p2Q2zmOe?=
 =?us-ascii?Q?G3PQA1a1U4N/F5dH8F4dt0sm2a0BcbsbaOHFgmnx3kya+Jt06DoM7ZB/BiDf?=
 =?us-ascii?Q?P9WPzMj2ZOr0kypiP8nkZ4gG+u9XM49bGWDaTW4h7gTO0W5J5qv2tZEKyFsp?=
 =?us-ascii?Q?uCboV+U/U0GAUg71tCRIaEHAfiVALvzEoBEm3aMEgzhsadS7vsH6mR4YwwJf?=
 =?us-ascii?Q?uJT3J2sYwTO/zp2A2bams9mHuD6tW7RgERt7Cv1opTApcS3TM3Vyi+ri6o+9?=
 =?us-ascii?Q?X6rLa3QCtioRcxKRzPf+hLAduR/FRuDjkWKSxZmyj0H9wFKVGTqqugTcy6Rb?=
 =?us-ascii?Q?YupQz1N493VzmsvW4ZxPAUrj0C1AUE6zVK/UZ6WkLWozZMl5ITIQZhCOxwbZ?=
 =?us-ascii?Q?UEMB/y6IylWEcGCUbqetOgQC7AQsha69Jb0iwiXBrN6gtKX2ag84yoI78WF2?=
 =?us-ascii?Q?jtE+fGfKirL9053N3Se3EZBs2EPU5+6ERpZvam+WIAdfmXbSzWAT0qqnAHkL?=
 =?us-ascii?Q?NP/x2ubHAwxHbhL4ARro1rSa4EV5zsKN8Ds+ffRzPyG9gQPyCq9wpxnv+PIB?=
 =?us-ascii?Q?vfPdSWJrJiSc1DrWu2qnKy2Unc4WmLuFLIOnVaSfl/6aNa6yPqmMBh508Zj2?=
 =?us-ascii?Q?iOc8bDH6UWZZHPAG0PxHCTqbshs4wd+Q4lsjROiaPZBjuO1TO3sMqmLYv8Ig?=
 =?us-ascii?Q?JuQNPhs/+fjwOqeusIfqTAr2WYcl7JG3XLiuVl6UPX4d9c1Do3PcGZmTqEhB?=
 =?us-ascii?Q?NMG79WWF25S99/vlYoegKImHcXPld9mWMJB52Fup5i2Cd6TGXFXIYUv7QBUK?=
 =?us-ascii?Q?VpwjFbJJXxF8Z+LTtamlNlR84302Gm3ZEQzj0lHRcHxMYnA/UCCjuJTVxC8f?=
 =?us-ascii?Q?e3NBTNyCNHFVWvadEdEQ4p5r1/j6Hd0potZKYfig0erYJT74dL3X+Oy0eCoF?=
 =?us-ascii?Q?ze/mPFmM40sGKlD7SfOI84uMguKEY6aQnuiWlufgqzE5h3YsTr51m5WlX6/3?=
 =?us-ascii?Q?e3vq/5j7tJQgOIicdvjcUxoD5QYfwixJ+a6cz8wygrVF3jCW/w2+VgN4JzZV?=
 =?us-ascii?Q?R1FL/r8zW6pTL/5n6L1UtexA7jmXdZMB0VrFnmu3Y1TPRlC+TZcyWBawyu6I?=
 =?us-ascii?Q?LTS83WeO73O3vrpWduG03HhHpINJQ4yY/0MIsHm/AB0q3zsQjTcZ/d9e3KJ/?=
 =?us-ascii?Q?XG3z3NXjVOlikNqcjR5RMI+lrcsjTO3TXZZ0zJhT1iWn5SjgBTzyd+5+JOpz?=
 =?us-ascii?Q?g/ScjGGq/k5Y0IBJowjJY7SZRwfQIQIwmg00KpLzcCtw1D7M9wrDKu6L1qRQ?=
 =?us-ascii?Q?0nrdc5YCz8Pm8OQMitWFjL4WNq/vTnpM6u8U3N4nDW2z2pDRjIbff7YwEoTU?=
 =?us-ascii?Q?gpV8cSdAwT/xBUP2xN7CMZs7HABmPucsnEIJe4JxEDQy3xN6oUNJsWQ8jFEf?=
 =?us-ascii?Q?t5Ip7gNoUeR/hI3Ed5FUCYP35KXA+PjvKzgnWQ8jBVAeF3tUsBAG9yoHX5Vn?=
 =?us-ascii?Q?O6IwPx8XBlIHZwmLvMPFkj8OYFsxuHzpkNaZ/BRQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3e370d-e524-4059-7533-08dbe9ab0dc2
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 09:28:28.5693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SN+qXxg8Ix4SjxkYd+yzOn/botQsk9I+0HPqj6ZZmzN83LzR145DyUyl6QKnfLhe2LRFYmymKe0/IQvtTuZhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880

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

