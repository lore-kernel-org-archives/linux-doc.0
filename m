Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42D030F8B;
	Thu, 12 Oct 2023 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="U/Gzy6hS"
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F141C9;
	Thu, 12 Oct 2023 09:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqkWh3z9pRc8CeDVM6F1d3HADumnoWhAjSX/Xm0lR/FwgzBcRXHKsdEK/NcIIIHslHloguzdFNyV8cm68TfwRhrRoiQeXz3ttvoaFcJ3uOCBm2Bw9EfENUKjYmKXRHTHPpP99dQFXK52UKAyNKQqFFRTGgOk0BAel6qoGDPjkg5kXLKctkAaMqpnqwCG4FMSPqXHAkGUf0CLpjfYd0HulLZypBUq38smBj1BwIMNlR7dkaSX9WA1W0x8Smbed83s44zjPWnca8b7iDNBnp38WkiV9hu1tECPM6l2f8tC+aZA1LaSmBrZz/1ZWxnV9D1KXmAqfEQOStlYg7GpkJ0NEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNMAmaTqgUFVxmmUo5yjAQgFCSRfrBy3eZxcWWDy1H8=;
 b=HdL03qeXU7Jws5rjoy7sxyDjEl52N+9S2FMxwTONubkb3nztzj0yZfSkNtT+8Jq/94isVrgoE51QrzikijLPg8RgMlM2MXpLaVrpuWjTuhjmCuTRsF9luv1A6O+ch8oDdxmN9Z2iEsDBWBnA2aY6gYT3q1DLFlRo41sWBUPSrjDEe2yaiJmxJn+tnu8vRCHohgJJggRn6ONMsXgXvrWRYuxrlIQLIbv/SMVcTdBMEFer7+gMw+CLttS3qbQ4EZpij605EzPtGhHe2WjVuakhdyPUB1PLQJ0M67MK1Jtwym2ObmbxXQoHvOq3mn9HOMqiKcUhCLp8z+erEu07eSaTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNMAmaTqgUFVxmmUo5yjAQgFCSRfrBy3eZxcWWDy1H8=;
 b=U/Gzy6hSHuYKIavbP5boEeKjgnztdbVpVE7gG9xhFYtkDDIYqCO4GKvL/mVJfJxdeedOqD4S+coAW8xSstkMTYgWe8lv6InVEHheAqI2mrNw6gNhEARv0E+4SvUxnQ/IWMswkDK+cOb3wDgM8x9intfgARNNBoIl0tEjQskQHlA=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAWPR04MB9807.eurprd04.prod.outlook.com (2603:10a6:102:384::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 16:09:50 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6863.040; Thu, 12 Oct 2023
 16:09:50 +0000
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
Subject: RE: [PATCH v2 4/5] perf: fsl_imx8_ddr: Add driver support for
 i.MX8DXL DDR Perf
Thread-Topic: [PATCH v2 4/5] perf: fsl_imx8_ddr: Add driver support for
 i.MX8DXL DDR Perf
Thread-Index: AQHZ/Ai4IwbfnRZK5Eu/7r7AEBR0prBGVOoQ
Date: Thu, 12 Oct 2023 16:09:50 +0000
Message-ID:
 <AM6PR04MB4838FCCC6C0630036F5ABA7D88D3A@AM6PR04MB4838.eurprd04.prod.outlook.com>
References: <20231011060838.3413621-1-xu.yang_2@nxp.com>
 <20231011060838.3413621-4-xu.yang_2@nxp.com>
In-Reply-To: <20231011060838.3413621-4-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4838:EE_|PAWPR04MB9807:EE_
x-ms-office365-filtering-correlation-id: 2232b9ff-efb4-46f8-737d-08dbcb3da99a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jOL8U2Jtwy6uBOsWvRnvZ4I1c3ZUcvf/tTdxG8SSpzSwSP6JMAQ9RdWqOSCF4IbGeOQ2Kf/xG5kkZAYKggxK0gr4ZznA/DlSwd8rtEGgkOkOYZJj+Fo0Gr9HAlTTOz+gaLznxfwMKdFUkWNEaTzw0cZ9GKWiuMGFq2svM0F/SyxhCbkBWmcKxiKJa/Q5KHNFVI5NeCbs/seVnZcEqm7G/PLOXKB37n/RrktcF2vOWyjQHTNLfJK82FyJEuU5o6Uqn+MAVzXGtuueoBPi8zuOBmC/8DAa8BOptJn99OBWsQ+RfYUBJg9G9pPajKJg97F4hX54z41zI2OP3kr/aAeWdynxyjuY8R3h70CXUDiK3vzYiqPtwC9W+L7nXTEftyIWqjFVVD7C8W/aenfYpC32U9Rpb2EGwyA2IABK9/G5bS58frdrtmkCGcfWRuYUmYXuzMlwq/u11wNpkr2YJHUyfmYLkf3uX33dfDl9H8jjvoDRZWc0Dg1Z6XitPlCLn/8FxOym+pOf8VUjEAf9ccdik9cdVei+P/k5loPIXyJEKHsrZ87RcNEfq/U61RSrzaiPnz+Zfyl6lQH1QBuLL06Ic7kTLCJfJn74Q/2qYfsB2HA/2HlZ0FXqPUPK4KlWeSHo
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(7696005)(55016003)(55236004)(53546011)(9686003)(38070700005)(33656002)(71200400001)(86362001)(38100700002)(122000001)(44832011)(2906002)(7416002)(76116006)(4326008)(6506007)(83380400001)(478600001)(8936002)(8676002)(52536014)(26005)(66556008)(41300700001)(66476007)(316002)(110136005)(66946007)(66446008)(5660300002)(54906003)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GCV1QY7IVv1jSV5cKKXgYs9Y4Acpw5UWjwZBc5bik/iZHNH1ACOZgbOMXoR4?=
 =?us-ascii?Q?+DKKv+0nWIptML0/76hY6179f1S1gQu5aTv0B89hyKNhrKGh0x0xKxddPF5A?=
 =?us-ascii?Q?gEATmaD9FKU8ke4dNEuA10JDENqqDwbDILwRBDp+8AOVrgvwrcAR04lFXvHP?=
 =?us-ascii?Q?Yvq+2A7N+ghZ6pv4aBM2hxaYtZhLg1W5V0ia3FCWchFHAPEAbR1ABtKQw4tL?=
 =?us-ascii?Q?hAYlrqpnKQo7Nw+jWiineii52GtLfTS40I9eGwqRdMYOeP/46R/rJLDdPV3Z?=
 =?us-ascii?Q?8rNOy65CVHdZ285U/ldxAEVGfgP6Sf2mSi15/4KSntSF6cvLDkkbrsbyO8dm?=
 =?us-ascii?Q?2Vzs92SgMLvdg0422km9zxEmdahi47fIpgCPlqQkg88pIFnyeGrOA943ybtI?=
 =?us-ascii?Q?c24FoPjbcV/8FbSXaFQ7mDg8y4/RzeSaLzRE2A8C2+LV1NPXvoXScyS5Z7m2?=
 =?us-ascii?Q?QhPqCLrl5j/dveRkZxL07WiwAWxZXIKdONIj7Y7RKjTneouA92B+gbSHiHME?=
 =?us-ascii?Q?tMMSb5yA/oroTxp3e8AV4DWj7rFLQClE17VxYNwF3lTFE1y/mTxxDSXxHT6x?=
 =?us-ascii?Q?8QhGv4gUMT6GDFKcghMqU9h6n976c4Mm2gHtu1vaEgyYGrxScOkercPCrW2G?=
 =?us-ascii?Q?2Ie7jdyOLKIyMDydIhF9sZeZ72TXzn0TfBmZf1cxZUdrfgrCpp/yCxMRlg1H?=
 =?us-ascii?Q?/zSUDXmX16dZUTr9XaTl44BWJDqReFm5bSrw5CPw8e/GiqS6eRkSu9SUAsCy?=
 =?us-ascii?Q?755RfdJlRtQzXhRvWtKKEHLG9KtVXDKDInt7FaPakLTKOmYl7CsEPxibqgnt?=
 =?us-ascii?Q?YXd+c7Cf8HaKpmC0fgsikOjNrq1YankJAG/X6IaXdJhUMw57Lck9IuEDbtJg?=
 =?us-ascii?Q?pjdyyYpH+7MGx4V/U0KrtX9m2ozbM6YQLqL4RLBHPiahnsUel7TDsmIQqY0J?=
 =?us-ascii?Q?KB6uYqY+/cJ+3IDLxzBpveUjhoKE66lErNmPeVo9FxJUVM2NG9JsAuP7vyzq?=
 =?us-ascii?Q?0aGGlRNZjF+ioPtakXkK0gJ5VkL9PpGTjg1HAqGq618/GF2o7KdSRoQ+hCZr?=
 =?us-ascii?Q?NxJzAg1l8ypdXotJwZZ9lGZ94aeAT05M2TJMbpReBJxokwjSKSHcPbv8zNrA?=
 =?us-ascii?Q?waAnr6NvT9pou7AMvJ6FkG5RKV25/Tyl7RpUu5JcPmBC8XBn+MgH3HjURzzQ?=
 =?us-ascii?Q?kgHnXEmaUTDANuMswXs68/ZNe5H41uAa95Gb6m9alr2qHfsXRDLDu0526DVt?=
 =?us-ascii?Q?DF3TrkXTbJwMImxAXVg5+iW13R/wrWMOCn/7akGwHmAFDCrMv81rS4/rA8Qv?=
 =?us-ascii?Q?UDvfhGXqPcnuS/wG8DeIZk+p81NyOBllR/YUAlNF4WhJW7ZftAP/jxE/e0O2?=
 =?us-ascii?Q?A3PnCYsKvdxladhHMWgzdj2x0dipGusDao191e1ecPURzju241clsmd/qohC?=
 =?us-ascii?Q?afGImDixwL2TnpAdIpteeyzLqXB2fq6uNi/CazFApPdvZeCpUgyGKBiyNGHX?=
 =?us-ascii?Q?jPvkxlwbH6W+jlQYudyBc96e6Ny7Fkqx/X0jCfTxenH1r+h/qVNlzAGV/VBM?=
 =?us-ascii?Q?N9yuMIcmlKENuPwQgpw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2232b9ff-efb4-46f8-737d-08dbcb3da99a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 16:09:50.1810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AyujFlGFNJC8YNgyqHWkiZ7cMVRC+8jx96pspmgrkRUivUgXUVzaC8bTI7H+eWCpOGujhHUuUQa80p75i3cj8Q==
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
> Subject: [PATCH v2 4/5] perf: fsl_imx8_ddr: Add driver support for i.MX8D=
XL
> DDR Perf
>=20
> Add driver support for i.MX8DXL DDR Perf, which supports AXI ID PORT
> CHANNEL filter.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>=20
> ---
> Changes since v2:
>  - no changes
> ---
>  drivers/perf/fsl_imx8_ddr_perf.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/perf/fsl_imx8_ddr_perf.c
> b/drivers/perf/fsl_imx8_ddr_perf.c
> index d0eae2d7e64b..7dbfaee372c7 100644
> --- a/drivers/perf/fsl_imx8_ddr_perf.c
> +++ b/drivers/perf/fsl_imx8_ddr_perf.c
> @@ -92,6 +92,11 @@ static const struct fsl_ddr_devtype_data
> imx8mp_devtype_data =3D {
>  	.identifier =3D "i.MX8MP",
>  };
>=20
> +static const struct fsl_ddr_devtype_data imx8dxl_devtype_data =3D {
> +	.quirks =3D DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER,
> +	.identifier =3D "i.MX8DXL",
> +};
> +
>  static const struct of_device_id imx_ddr_pmu_dt_ids[] =3D {
>  	{ .compatible =3D "fsl,imx8-ddr-pmu", .data =3D &imx8_devtype_data},
>  	{ .compatible =3D "fsl,imx8m-ddr-pmu", .data =3D
> &imx8m_devtype_data},
> @@ -99,6 +104,7 @@ static const struct of_device_id imx_ddr_pmu_dt_ids[]
> =3D {
>  	{ .compatible =3D "fsl,imx8mm-ddr-pmu", .data =3D
> &imx8mm_devtype_data},
>  	{ .compatible =3D "fsl,imx8mn-ddr-pmu", .data =3D
> &imx8mn_devtype_data},
>  	{ .compatible =3D "fsl,imx8mp-ddr-pmu", .data =3D
> &imx8mp_devtype_data},
> +	{ .compatible =3D "fsl,imx8dxl-ddr-pmu", .data =3D
> &imx8dxl_devtype_data},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, imx_ddr_pmu_dt_ids);
> --
> 2.34.1

