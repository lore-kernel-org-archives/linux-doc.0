Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4E6FB1;
	Thu, 12 Oct 2023 16:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ABraugs+"
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8086CC6;
	Thu, 12 Oct 2023 09:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Di0VHUJHoJX2xgwfJfT+YfX7RearNzkRvXbWrQNZc/Rxp62IiXilxAFgQZaK2WHKQoI5nRiPn3VPbQcw7YJDHdE5joOu39oun+LEJPem9moT+lfxQdbeFVRUifnmP1Xi2CfcGsINbsyqCN6uAb8JaiNdlN28TIRM0q1/CH074RYb0bb7kAiA9+kP4wkkCXu1ba9AdImNTIdRu4heSSxm2AnZWb+a+9OFPc4QoGmRtqHvTP+B7GP2Xt22lzlyYZOQhmWue8NDdiw2Pb3Iatl5b/Gfy5KvuBFa1AT1kIRzJFpf+k0H3SvQbEdsAFEUek2Fk+csdwJ0zHaKbKFxJ2q/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTisqEtnBudQ5PsFstH5LD9bDUKw8YLhwJrFt0EtoC0=;
 b=LxRBVDh63/Hi5BHFlF5t8xggIHUKrnWPuxWGcjEJ4RW/167ie6T6xnV/ErBxrbGPJH5RRUhLTXNbGHgWKTzkaXkPZT/68UbescaFuE2oA74mbuP8LSi9Mmx6CsmJW9iwXthsJgOQoNOK/Z+Bc9ZzbmgRFuVsZ0ig2HSuxtjTP7E0BoRhRV16mmNZHoLjg199I3zNbamQF9qNdJdT1jQ1RtB9rTiOh3a2EMVPXVgsBdKcD43nk6xYbjh7gmQZHyB3vbr+xzn7vYPmubFfs60SH3wxr+zL/AoxNG92yfaSJRfeRhLj4h23WpGhXkICe7ZQACLX733s/AHd2hlYOxK0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTisqEtnBudQ5PsFstH5LD9bDUKw8YLhwJrFt0EtoC0=;
 b=ABraugs+JS3oUF4Q8CFVGiP0JA2Hi5s4gO4N094rC4Qul3CtvdugDB0iabtOLMerePx7mnWTjho3lQnXLX47Ugn85c/rp9TCoAzPf3++4vQjCBnz9y5MnJkUQCMO6mdoPDT/lqn2dxna10NQKtDhDOTy5sGFCqVSicmYruGI4tU=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAWPR04MB9807.eurprd04.prod.outlook.com (2603:10a6:102:384::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 16:09:24 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6863.040; Thu, 12 Oct 2023
 16:09:24 +0000
From: Frank Li <frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "festevam@gmail.com" <festevam@gmail.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL filter
 support
Thread-Topic: [PATCH v2 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL
 filter support
Thread-Index: AQHZ/AiwskGAwpaXoEOJ/yRprwzam7BGVKiQ
Date: Thu, 12 Oct 2023 16:09:23 +0000
Message-ID:
 <AM6PR04MB4838AB52DA34833B05BBD04D88D3A@AM6PR04MB4838.eurprd04.prod.outlook.com>
References: <20231011060838.3413621-1-xu.yang_2@nxp.com>
In-Reply-To: <20231011060838.3413621-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4838:EE_|PAWPR04MB9807:EE_
x-ms-office365-filtering-correlation-id: c970f726-b084-4d55-d1d2-08dbcb3d99fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sedVWhfvbD+op8oqnykIDRv64IGYqZNd11LUB4Zh7ft1crKRjaqw5MSQ3zkP+1p9hmVZW2bj98YQPmRCiVyFjkzohnt8fTn+kjETOm/N2rjM0lnJ603vQIioKFGRjn3BRxVQMqbge39iD71drrMnaBouwos1Wy2xPHxUP0qvf9vfZ4mJ7OCA37C9oFVrlniUFHhpC/Fvr3tZz6WI2nGXuSnMtEBR23UZRfJxIHGEtRFns6hmxUI9s78kffnhYsC199upDaEaQoG0jPms43Q52MsVwwG3DGWTABvXNZvmLX1ZBOGFU+vLym5rqahbChimHyIaw/KI+2LVvvFLuz3/ny7UzLitU+qEuwRUMsjNP2rj1GHa1XOStc6p/DBp8lP0cCeQhiTl7ucA9LJqkZqcT/Q+wmfGhqo/iPP1QR0uUffoJQeRHaLBsJri+VnOL4Dxpm6wrZWMoUaynZpC8Ikj2PYjd9bdnNK2bbo2vH2wDDefTpDm0+zC+ciZqckVA8vL2ZJ7ZUAadTGAR1Dry4jpHIRWIIqRK6D9McgSpYteadTOv3NaHnzgOl2rX79bvXFr1X2RF4wQvxVaZkGGGehf00slWb1p6OxAbI/oQdTDp8Uia+ERJhV5WDQT/HEiewF5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(7696005)(55016003)(55236004)(53546011)(9686003)(38070700005)(33656002)(71200400001)(86362001)(38100700002)(122000001)(44832011)(2906002)(7416002)(76116006)(4326008)(6506007)(83380400001)(478600001)(8936002)(8676002)(52536014)(26005)(66556008)(41300700001)(66476007)(316002)(110136005)(66946007)(66446008)(5660300002)(54906003)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I+X7lj6wTJY2D+rb8f0TqViTsrkxjkYusPaG1SJaRSZh9F/8xh4bya6qxcd1?=
 =?us-ascii?Q?xIYQxKMZiuTnVR2dI+ruOBlrOVPOJvu+d4ViuwsrmKN6uj9VYfLY6ER09vTr?=
 =?us-ascii?Q?iEJ/ZUyXs6aDa7AmJGahA1SWxR71+MksQfA7QC3G3niTALD8hmhFZ37Vqy6s?=
 =?us-ascii?Q?2uSaB5OJC9mE17pkgxrX8KfiTZxAfW57FDLl1REVhkpgCp1d+d3ps9URwmP8?=
 =?us-ascii?Q?u+ylvdE78+Zo1kUlMZRQmkvDoMj52z77NR72aau8UwuZXqEd1FNbLlk24faK?=
 =?us-ascii?Q?xzxv1Cn9MTYIUDUkzb0Znwaa5LC8YnJbVFBIpgoqBwakDBLZR1YOMntV4aT1?=
 =?us-ascii?Q?zyRe5NV7h7zNCKQ7VB40miv7GtpNSjLOgfkpyzmy2bGwa9FTU4YIaYHvFExU?=
 =?us-ascii?Q?Wt57QW9OVKmYzTuDUxY2Dc4K8KKpCxvd3bf7YCAJfsybImto8yA6A91ZCS5M?=
 =?us-ascii?Q?J4Pb1cfb+5PCBaSyRMfhSudATjkfynLjIcrbL0pTiioz+VVsrGW/LT6mmPtn?=
 =?us-ascii?Q?CBtlXsPQRzN+kREbGb7K8BKlSJt705tCVmRPQspaluNv9+dL8xbkJ2lRvbhO?=
 =?us-ascii?Q?JvcEZ1BGl8V91BvMCIML+hrrbz1t60cxecaX1pvVhOn4NRTBcP/d/fVdgXZ9?=
 =?us-ascii?Q?AT6HY1ctMKPAPBqhrqM2GWXcOY8yPBglkh8lPymKIyht/ENTr6XVcMEDcR/0?=
 =?us-ascii?Q?TQ+b0nUjr+UDM/zbZBqBTnn2/GWXOmbX33j834r5H8zHm5p3JG3wyR7kxLm+?=
 =?us-ascii?Q?L8gAOgikeYM7SgxkWBxdQPBDgyVTtMrMcHVCoccl5ZLTSiYH9TJ24z+WL16a?=
 =?us-ascii?Q?rrTVmGX5mR5v6UJdZrO8mD/Bxsyxoi/y0hrUdTmnqIQhpqF6g+xmVkZuoB+r?=
 =?us-ascii?Q?m7XC7bZzDYiv0CUaEANwAL//Ih+9O+xesLjnXLinAqXl9NkQd/4ENmcV30ss?=
 =?us-ascii?Q?M4/aj9kFUKCr723v9kL04dL9webq2EzQBYgmsExv2NTYUsmp+dJT913YW2xq?=
 =?us-ascii?Q?NyjHcA8n4WGHCM+Yu4W9wyiJNfGBgz3u+XlwVD7wq7r7mfkpt3bVIt8UurMh?=
 =?us-ascii?Q?tm8TTL7ziLE3L4NpNgL4ffAgEB3p4GftKg2zs/3a64O+/Rd7RnHhiAAvu2qP?=
 =?us-ascii?Q?BBxW2Rv5FbVMFGzrj8MrmTWdiYVnwbqAuaxb1vqsmDS6G1jfdnFXd3O1enyw?=
 =?us-ascii?Q?hx8J01+ySeEmV24ShuyFKX1H9WZdnrcW3jSRQa0qKa0QlcaCP0UOIiNTHSJ6?=
 =?us-ascii?Q?OhJNJrQxI7r4SkWAxen+vnF2+q8omIVTfSNke348mOtZCJphPOt4MpCdGhVS?=
 =?us-ascii?Q?CaTN3/wul240IKxNpivpeN99JdAvUOGw/XmRTOGHXelsz6kcErLMju6ZTaCl?=
 =?us-ascii?Q?k8w0ssE91fjfk/3I3dyhLueGkO5kpvlazkmZJ35gSa5Lc0Nzw6MeZ9zT2tw4?=
 =?us-ascii?Q?OwelNCVVK5JYT9Tez4wopq3PNn27XDfhWljqNYVNLlQbWcTeE/NCa61PXpwC?=
 =?us-ascii?Q?Sqg/2Eg0PAVh+8y2ujfvznAwHpmGoQWd1mqbfyejpQ0HqiHEVnuDBrVpkJsB?=
 =?us-ascii?Q?6VeGEX64jDHn+q6QeOE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c970f726-b084-4d55-d1d2-08dbcb3d99fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 16:09:24.0041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNWL/6Ihq6jaGk15jFtxQM3Je7OKAvYWjkoG687+cOxkOKtPGy53nI5+IJs/Su7eNlmRetKTjYMS8rhy9Eze7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9807
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



> -----Original Message-----
> From: Xu Yang <xu.yang_2@nxp.com>
> Sent: Wednesday, October 11, 2023 1:09 AM
> To: Frank Li <frank.li@nxp.com>; corbet@lwn.net; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; will@kernel.org;
> mark.rutland@arm.com; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org
> Cc: festevam@gmail.com; conor+dt@kernel.org; dl-linux-imx <linux-
> imx@nxp.com>; linux-arm-kernel@lists.infradead.org; linux-
> doc@vger.kernel.org; devicetree@vger.kernel.org; Xu Yang
> <xu.yang_2@nxp.com>
> Subject: [PATCH v2 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT CHANNEL filte=
r
> support
>=20
> This is the extension of AXI ID filter.
>=20
> Filter is defined with 2 configuration registers per counter 1-3 (counter
> 0 is not used for filtering and lacks these registers).
> * Counter N MASK COMP register - AXI_ID and AXI_MASKING.
> * Counter N MUX CNTL register - AXI CHANNEL and AXI PORT.
>   -- 0: address channel
>   -- 1: data channel
>=20
> This filter is exposed to userspace as an additional (channel, port) pair=
.
> The definition of axi_channel is inverted in userspace, and it will be
> reverted in driver automatically.
>=20
> AXI filter of Perf Monitor in DDR Subsystem, only a single port0 exist, s=
o
> axi_port is reserved which should be 0.
>=20
> e.g.
> perf stat -a -e imx8_ddr0/axid-
> read,axi_mask=3D0xMMMM,axi_id=3D0xDDDD,axi_channel=3D0xH/ cmd
> perf stat -a -e imx8_ddr0/axid-
> write,axi_mask=3D0xMMMM,axi_id=3D0xDDDD,axi_channel=3D0xH/ cmd
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>=20
> ---
> Changes since v2:
>  - no changes
> ---
>  drivers/perf/fsl_imx8_ddr_perf.c | 39
> ++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/drivers/perf/fsl_imx8_ddr_perf.c
> b/drivers/perf/fsl_imx8_ddr_perf.c
> index 92611c98120f..d0eae2d7e64b 100644
> --- a/drivers/perf/fsl_imx8_ddr_perf.c
> +++ b/drivers/perf/fsl_imx8_ddr_perf.c
> @@ -19,6 +19,8 @@
>  #define COUNTER_READ		0x20
>=20
>  #define COUNTER_DPCR1		0x30
> +#define COUNTER_MUX_CNTL	0x50
> +#define COUNTER_MASK_COMP	0x54
>=20
>  #define CNTL_OVER		0x1
>  #define CNTL_CLEAR		0x2
> @@ -32,6 +34,13 @@
>  #define CNTL_CSV_SHIFT		24
>  #define CNTL_CSV_MASK		(0xFFU << CNTL_CSV_SHIFT)
>=20
> +#define READ_PORT_SHIFT		0
> +#define READ_PORT_MASK		(0x7 << READ_PORT_SHIFT)
> +#define READ_CHANNEL_REVERT	0x00000008	/* bit 3 for read
> channel select */
> +#define WRITE_PORT_SHIFT	8
> +#define WRITE_PORT_MASK		(0x7 << WRITE_PORT_SHIFT)
> +#define WRITE_CHANNEL_REVERT	0x00000800	/* bit 11 for write
> channel select */
> +
>  #define EVENT_CYCLES_ID		0
>  #define EVENT_CYCLES_COUNTER	0
>  #define NUM_COUNTERS		4
> @@ -50,6 +59,7 @@ static DEFINE_IDA(ddr_ida);
>  /* DDR Perf hardware feature */
>  #define DDR_CAP_AXI_ID_FILTER			0x1     /* support AXI
> ID filter */
>  #define DDR_CAP_AXI_ID_FILTER_ENHANCED		0x3     /* support
> enhanced AXI ID filter */
> +#define DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER	0x4	/* support
> AXI ID PORT CHANNEL filter */
>=20
>  struct fsl_ddr_devtype_data {
>  	unsigned int quirks;    /* quirks needed for different DDR Perf core */
> @@ -144,6 +154,7 @@ static const struct attribute_group
> ddr_perf_identifier_attr_group =3D {
>  enum ddr_perf_filter_capabilities {
>  	PERF_CAP_AXI_ID_FILTER =3D 0,
>  	PERF_CAP_AXI_ID_FILTER_ENHANCED,
> +	PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER,
>  	PERF_CAP_AXI_ID_FEAT_MAX,
>  };
>=20
> @@ -157,6 +168,8 @@ static u32 ddr_perf_filter_cap_get(struct ddr_pmu
> *pmu, int cap)
>  	case PERF_CAP_AXI_ID_FILTER_ENHANCED:
>  		quirks &=3D DDR_CAP_AXI_ID_FILTER_ENHANCED;
>  		return quirks =3D=3D DDR_CAP_AXI_ID_FILTER_ENHANCED;
> +	case PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER:
> +		return !!(quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER);
>  	default:
>  		WARN(1, "unknown filter cap %d\n", cap);
>  	}
> @@ -187,6 +200,7 @@ static ssize_t ddr_perf_filter_cap_show(struct device
> *dev,
>  static struct attribute *ddr_perf_filter_cap_attr[] =3D {
>  	PERF_FILTER_EXT_ATTR_ENTRY(filter, PERF_CAP_AXI_ID_FILTER),
>  	PERF_FILTER_EXT_ATTR_ENTRY(enhanced_filter,
> PERF_CAP_AXI_ID_FILTER_ENHANCED),
> +	PERF_FILTER_EXT_ATTR_ENTRY(super_filter,
> PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER),
>  	NULL,
>  };
>=20
> @@ -272,11 +286,15 @@ static const struct attribute_group
> ddr_perf_events_attr_group =3D {
>  PMU_FORMAT_ATTR(event, "config:0-7");
>  PMU_FORMAT_ATTR(axi_id, "config1:0-15");
>  PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
> +PMU_FORMAT_ATTR(axi_port, "config2:0-2");
> +PMU_FORMAT_ATTR(axi_channel, "config2:3-3");
>=20
>  static struct attribute *ddr_perf_format_attrs[] =3D {
>  	&format_attr_event.attr,
>  	&format_attr_axi_id.attr,
>  	&format_attr_axi_mask.attr,
> +	&format_attr_axi_port.attr,
> +	&format_attr_axi_channel.attr,
>  	NULL,
>  };
>=20
> @@ -530,6 +548,7 @@ static int ddr_perf_event_add(struct perf_event
> *event, int flags)
>  	int counter;
>  	int cfg =3D event->attr.config;
>  	int cfg1 =3D event->attr.config1;
> +	int cfg2 =3D event->attr.config2;
>=20
>  	if (pmu->devtype_data->quirks & DDR_CAP_AXI_ID_FILTER) {
>  		int i;
> @@ -553,6 +572,26 @@ static int ddr_perf_event_add(struct perf_event
> *event, int flags)
>  		return -EOPNOTSUPP;
>  	}
>=20
> +	if (pmu->devtype_data->quirks &
> DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER) {
> +		if (ddr_perf_is_filtered(event)) {
> +			/* revert axi id masking(axi_mask) value */
> +			cfg1 ^=3D AXI_MASKING_REVERT;
> +			writel(cfg1, pmu->base + COUNTER_MASK_COMP +
> ((counter - 1) << 4));
> +
> +			if (cfg =3D=3D 0x41) {
> +				/* revert axi read channel(axi_channel) value
> */
> +				cfg2 ^=3D READ_CHANNEL_REVERT;
> +				cfg2 |=3D FIELD_PREP(READ_PORT_MASK, cfg2);
> +			} else {
> +				/* revert axi write channel(axi_channel) value
> */
> +				cfg2 ^=3D WRITE_CHANNEL_REVERT;
> +				cfg2 |=3D FIELD_PREP(WRITE_PORT_MASK,
> cfg2);
> +			}
> +
> +			writel(cfg2, pmu->base + COUNTER_MUX_CNTL +
> ((counter - 1) << 4));
> +		}
> +	}
> +
>  	pmu->events[counter] =3D event;
>  	hwc->idx =3D counter;
>=20
> --
> 2.34.1

