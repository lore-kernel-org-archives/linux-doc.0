Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586EC14263;
	Mon, 23 Oct 2023 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="KKN8dF58"
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2051.outbound.protection.outlook.com [40.107.15.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9E6F9;
	Mon, 23 Oct 2023 04:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0zvVS8rAYyq4t0HY6rq4pP0B3UPOaxplSCSPd84yCFIda3xsraR0uEApe+4H9qXWWnYXDSt4xTWx4DTvweqsFWU81oFUypXYwPdhuPs1w01ZX0XC8DcAqqQJ5jLEpPQGygbNzpYvqNR3xCeG1t4ZkYAN8qbD0ZTVQenrVC2PHbwoIOe1HfMSXuixTRRplM1xhBgq7wRbqyF3VIlJDhy2XW3hhLKKE4pd8Hoh5AlyNM3qt4D6RWFn4GPOttNi46GjuDNZGQXnUq8mqIKdiKVvHMAlqtKosovtbQld9IQhrGQAKCQrRE6iqdZTms+qY913y5sL87ZxHcHiEj6u1BWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/kpXQShqgiNkedPruKVeIyrSyoT+gaS4Mzf1uJKw/Q=;
 b=V7TNOBmIY1Vvx21sKhV7/qZ+4zZt7AbKHzg2vTvU2bo2rsGkT4sj4Hox52H+0T9VaqAkLgQBLwhd7CgGzlfC6A4XUWnzo/YXFoRakAcXK/lJ9mz8/lKBaV5KCoknqv6TsL1oYVqwwHsNfGvEXdZ1loMpgT6DYNenCl3zUbo9kqrEpwNJSnh1nuCNKTdH2lQW0hFeE2wKJxGooXQTABbFYwlz6BkyyERjNE2n3KXK9Vo31NkQ4YkobaiQKqY1dHQvjeT3AWYmPt07jH6cUBiWou7uSXZQykhiksfokBdIWgKS4oW8HzUtzYQJpAC9nLweqUAr6JaRQGYdbyfJQ6JaGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/kpXQShqgiNkedPruKVeIyrSyoT+gaS4Mzf1uJKw/Q=;
 b=KKN8dF58MyQ2FCY8LY7lf9toqQITuOfwRuXZq6QAwVan1XGIvYjjZloBUzU2dDMqaXnz9LYqFQAx1jJfCVlHag17XWHFgfpThhilox9kmLH6JH7Gg9JyKcupg8CSWgYv8AtnnP3sqlQzPAxLWl2yjMI1B7G32C22kUapEL4QlIY=
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by AM9PR04MB8764.eurprd04.prod.outlook.com (2603:10a6:20b:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 11:08:55 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::cfad:6c90:d915:c7a5]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::cfad:6c90:d915:c7a5%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 11:08:55 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Will Deacon <will@kernel.org>
CC: Frank Li <frank.li@nxp.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "festevam@gmail.com"
	<festevam@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT
 CHANNEL filter support
Thread-Topic: [EXT] Re: [PATCH v2 1/5] perf: fsl_imx8_ddr: Add AXI ID PORT
 CHANNEL filter support
Thread-Index: AQHZ/AivYaheMWWeQkGcbusOXLc1x7BRP4MAgAXzHkA=
Date: Mon, 23 Oct 2023 11:08:55 +0000
Message-ID:
 <DB7PR04MB51465ECD68F0F183EE0F51578CD8A@DB7PR04MB5146.eurprd04.prod.outlook.com>
References: <20231011060838.3413621-1-xu.yang_2@nxp.com>
 <20231019145150.GB19567@willie-the-truck>
In-Reply-To: <20231019145150.GB19567@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5146:EE_|AM9PR04MB8764:EE_
x-ms-office365-filtering-correlation-id: 0bec1a57-bb99-4e56-5297-08dbd3b872a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SpiRU+hk2dkIlO0HM+bXo7jaHWClQakwREl/g9naNoL3yyWRZ0VTCZ3y3AQB3gCc9TwcEmfPhphcsJadcLi9Eso811z8UUuYapG7wQ+iprKC1w6ya8tceK4cAv3wGTdGOMSGaEn39keSc0Z1OyuoKXqYlTBlFLt0GyBSaikdKUZeV62wxleAKkMGEK0aP1c89wGSbHvz8xOm1Zfmzh7sS4DPmjHZv/JgZvMPLtzM/Yvf2GD9kp0FGmFOHVPsA029vRYV19c3U8EomQjvK+64LPAL2VMvE2ZzqzAtkBqr+fdiq/NdValFhY2/dHHB1A30svml3CpG12HjjzhR87HlG//2jQKBMrAOiiCljmMBrTWRdnEZZMp34hJ8Yyr03a3ueoUVx0n9NgSAgBFdhVKBHeFjCSe+k6XK+WNcLN/RDmTyOvebDU5AhNOqyJYGP8oVX/XA3nlGS1E50Q5Vuen76xX/IDMcgL0EjLqcrYBcK7FAtif4zKh+eEJXjUSLOhfQHgckBfRMNbYPYa6DYYTyrckSIbwtcl2YFZsuK/hwoIry/rRW8ng2bLv990FeB80pXgLJy89360C//TT87dqfdQ48YxZAigsQhSxMwXZGxn17vhkF8x+Z10ZZ8H5fKa/O
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(71200400001)(9686003)(6506007)(122000001)(7696005)(66556008)(26005)(33656002)(6916009)(54906003)(64756008)(66476007)(66446008)(316002)(478600001)(55016003)(38100700002)(86362001)(66946007)(76116006)(52536014)(41300700001)(4326008)(8936002)(8676002)(7416002)(38070700009)(2906002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?86/tFTGwNZjkxMu8cPGyezOKWpUKOT0l9tMgWi2t9948flOaB5atXY8EdGpO?=
 =?us-ascii?Q?Ks5j03mrf0wYzFNItS8gFj+Amu9dz00dM59BYMyLljiy+KGid8JrDwdfII6R?=
 =?us-ascii?Q?jH7VQLzuTrPyh4pnAlxUAiXF5/c1R9nRsygFB0o9i/k/qF6zbQ/sFFnockOq?=
 =?us-ascii?Q?fvrlWqb4PGVRnOugjzo2Eq00r4EZb9U0z4OVG0mzlqaHmVQBDRvoe6Ahx4g8?=
 =?us-ascii?Q?LJvVK4m6BJ95keNzges+I3ScCn9TEbf1d3kdEz9JxVyAjdxuHMEdZKzWXbQN?=
 =?us-ascii?Q?ATemcotxPv6xLEVi2fAvpZIlhLr9ivWap9+nrcIcyMm2nzEunsKt7D9WFzaV?=
 =?us-ascii?Q?VCDfNDxwPbfCv2d0avq5IRzwOnycNGYu8r9JnyBjrg57ZQLF/ytAowrDX0FE?=
 =?us-ascii?Q?FLPRClweABrKjIx20dRiGtQ+87JqY5Ys9hTzGDgC5MiJASun4b+dtShLmwkr?=
 =?us-ascii?Q?h8l5sctUdoPUpV2+vs2+sV1MXF7UIS8+MujWQEbTGizEFjL5kL9QAdSQSf11?=
 =?us-ascii?Q?r4VvpkwSQUKyTbqdnCXgipiQbWDvzqIJDapViysih0rZgcsfr3kRWGQprhgc?=
 =?us-ascii?Q?aoVgF4MIN9LQfKHsX9HTrpTY0yyYiaY2nZMKLAG0rVNnQS4RWJ3HNi5gI872?=
 =?us-ascii?Q?EzF+F6fY+CWQymrmE0uv+iG9sn+EQZTyC4X9UXoBhqmJ1fkP+TVn4FPivEvo?=
 =?us-ascii?Q?MAdRCXmuchi6SuBQtS3mdH60ZFJahVjjQ6CpIAhwKn4yYKzAr46MjZx5QpwW?=
 =?us-ascii?Q?p7QL7wxdNarm7ti4mmyz6J+sXxlUu6SVkGGAOs/FVHGOUAYbtk5o3On1tq2m?=
 =?us-ascii?Q?+cyMFYGY74HXosN/XP8ORc5jqnD/InJi7e7KZfphoW8xxGQ38glJ0oVa8W48?=
 =?us-ascii?Q?Tj9xG7gUUZ01iTMpbv4c24zSqmKSF1q7lu3M8YEkIPR4yfhI4gjpSKwNAqnr?=
 =?us-ascii?Q?x7MHDzitIm+Riq/kFylGbTfkSxkONPS19aFCDXyVlb+prpqIo/Zch1AYHJHx?=
 =?us-ascii?Q?mN7bRlK5oOTbduKITVfpvqh7ayZ0yS8cpGZJRt4ZkFUKEnwoeYue3LRh9tsw?=
 =?us-ascii?Q?ut5ywiyN0URPv08dOk/NElCy4tJasiPgSo16DOqnL4YkorJn5s8MlqI7oW+f?=
 =?us-ascii?Q?fz/oM109eqAr/Zf5eqHFcLGXBZ28U5gUq/SkGxhVN6OT+St/3Uc81kjnTTWO?=
 =?us-ascii?Q?2o+MilxhO40ycVV6YDYDVAJ5YbnX+dBJu1ueLEqrKc8O9wdPGt9/D6cOygWe?=
 =?us-ascii?Q?n0AZHJGL6mp+ECCLm3BEL29Hjv7Hbd3h/2Y9R72C9zIfKCMvGPQG4bTWQdX+?=
 =?us-ascii?Q?dXlXZaY5smXDg8fCCmTnurqfrZOlx2NAN3PHxPiQJdsmhmwA74B+b4c7rGNN?=
 =?us-ascii?Q?+yBd1xbG94lK6OYbuNRpWiIvKPuiPmOcCiok1cBWKkXpeJsr6D/UCeJyZQpE?=
 =?us-ascii?Q?UhcMbsnYb1JnRtP972FoPNzJKYE2uV2QQJ7YAPtEqaUvQDtWuzkkB8P9DKNF?=
 =?us-ascii?Q?pfDQs6SN5d2+T1ZjyZDtjFP2JzbY1Br8RNYZAldw31YnZyjkAGA1ZK92vdYe?=
 =?us-ascii?Q?nadlpFWho/udNI5bnUw=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bec1a57-bb99-4e56-5297-08dbd3b872a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 11:08:55.3574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IksG8UYVq77zdwFOnFJ8Nak0jjp9T3GmWK2Z/rNzo9FlBZhjvIdnm4YRVGIo8SBOrhzuNbIF4mOUssvLxHqsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8764

Hi Will,

> On Wed, Oct 11, 2023 at 02:08:34PM +0800, Xu Yang wrote:
> > This is the extension of AXI ID filter.
> >
> > Filter is defined with 2 configuration registers per counter 1-3 (count=
er
> > 0 is not used for filtering and lacks these registers).
> > * Counter N MASK COMP register - AXI_ID and AXI_MASKING.
> > * Counter N MUX CNTL register - AXI CHANNEL and AXI PORT.
> >   -- 0: address channel
> >   -- 1: data channel
> >
> > This filter is exposed to userspace as an additional (channel, port) pa=
ir.
> > The definition of axi_channel is inverted in userspace, and it will be
> > reverted in driver automatically.
> >
> > AXI filter of Perf Monitor in DDR Subsystem, only a single port0 exist,=
 so
> > axi_port is reserved which should be 0.
> >
> > e.g.
> > perf stat -a -e imx8_ddr0/axid-read,axi_mask=3D0xMMMM,axi_id=3D0xDDDD,a=
xi_channel=3D0xH/ cmd
> > perf stat -a -e imx8_ddr0/axid-write,axi_mask=3D0xMMMM,axi_id=3D0xDDDD,=
axi_channel=3D0xH/ cmd
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes since v2:
> >  - no changes
> > ---
> >  drivers/perf/fsl_imx8_ddr_perf.c | 39 ++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_d=
dr_perf.c
> > index 92611c98120f..d0eae2d7e64b 100644
> > --- a/drivers/perf/fsl_imx8_ddr_perf.c
> > +++ b/drivers/perf/fsl_imx8_ddr_perf.c
> > @@ -19,6 +19,8 @@
> >  #define COUNTER_READ         0x20
> >
> >  #define COUNTER_DPCR1                0x30
> > +#define COUNTER_MUX_CNTL     0x50
> > +#define COUNTER_MASK_COMP    0x54
> >
> >  #define CNTL_OVER            0x1
> >  #define CNTL_CLEAR           0x2
> > @@ -32,6 +34,13 @@
> >  #define CNTL_CSV_SHIFT               24
> >  #define CNTL_CSV_MASK                (0xFFU << CNTL_CSV_SHIFT)
> >
> > +#define READ_PORT_SHIFT              0
> > +#define READ_PORT_MASK               (0x7 << READ_PORT_SHIFT)
> > +#define READ_CHANNEL_REVERT  0x00000008      /* bit 3 for read channel=
 select */
> > +#define WRITE_PORT_SHIFT     8
> > +#define WRITE_PORT_MASK              (0x7 << WRITE_PORT_SHIFT)
> > +#define WRITE_CHANNEL_REVERT 0x00000800      /* bit 11 for write chann=
el select */
> > +
> >  #define EVENT_CYCLES_ID              0
> >  #define EVENT_CYCLES_COUNTER 0
> >  #define NUM_COUNTERS         4
> > @@ -50,6 +59,7 @@ static DEFINE_IDA(ddr_ida);
> >  /* DDR Perf hardware feature */
> >  #define DDR_CAP_AXI_ID_FILTER                        0x1     /* suppor=
t AXI ID filter */
> >  #define DDR_CAP_AXI_ID_FILTER_ENHANCED               0x3     /* suppor=
t enhanced AXI ID filter */
> > +#define DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER   0x4     /* support AXI ID=
 PORT CHANNEL filter */
> >
> >  struct fsl_ddr_devtype_data {
> >       unsigned int quirks;    /* quirks needed for different DDR Perf c=
ore */
> > @@ -144,6 +154,7 @@ static const struct attribute_group ddr_perf_identi=
fier_attr_group =3D {
> >  enum ddr_perf_filter_capabilities {
> >       PERF_CAP_AXI_ID_FILTER =3D 0,
> >       PERF_CAP_AXI_ID_FILTER_ENHANCED,
> > +     PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER,
> >       PERF_CAP_AXI_ID_FEAT_MAX,
> >  };
> >
> > @@ -157,6 +168,8 @@ static u32 ddr_perf_filter_cap_get(struct ddr_pmu *=
pmu, int cap)
> >       case PERF_CAP_AXI_ID_FILTER_ENHANCED:
> >               quirks &=3D DDR_CAP_AXI_ID_FILTER_ENHANCED;
> >               return quirks =3D=3D DDR_CAP_AXI_ID_FILTER_ENHANCED;
> > +     case PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER:
> > +             return !!(quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER);
> >       default:
> >               WARN(1, "unknown filter cap %d\n", cap);
> >       }
> > @@ -187,6 +200,7 @@ static ssize_t ddr_perf_filter_cap_show(struct devi=
ce *dev,
> >  static struct attribute *ddr_perf_filter_cap_attr[] =3D {
> >       PERF_FILTER_EXT_ATTR_ENTRY(filter, PERF_CAP_AXI_ID_FILTER),
> >       PERF_FILTER_EXT_ATTR_ENTRY(enhanced_filter, PERF_CAP_AXI_ID_FILTE=
R_ENHANCED),
> > +     PERF_FILTER_EXT_ATTR_ENTRY(super_filter, PERF_CAP_AXI_ID_PORT_CHA=
NNEL_FILTER),
> >       NULL,
> >  };
> >
> > @@ -272,11 +286,15 @@ static const struct attribute_group ddr_perf_even=
ts_attr_group =3D {
> >  PMU_FORMAT_ATTR(event, "config:0-7");
> >  PMU_FORMAT_ATTR(axi_id, "config1:0-15");
> >  PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
> > +PMU_FORMAT_ATTR(axi_port, "config2:0-2");
> > +PMU_FORMAT_ATTR(axi_channel, "config2:3-3");
>=20
> Any specific reason to allocate from config2, rather than the upper 32
> bits of config1?

No. Either way is ok for me.

>=20
> > @@ -553,6 +572,26 @@ static int ddr_perf_event_add(struct perf_event *e=
vent, int flags)
> >               return -EOPNOTSUPP;
> >       }
> >
> > +     if (pmu->devtype_data->quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FILTE=
R) {
> > +             if (ddr_perf_is_filtered(event)) {
> > +                     /* revert axi id masking(axi_mask) value */
> > +                     cfg1 ^=3D AXI_MASKING_REVERT;
> > +                     writel(cfg1, pmu->base + COUNTER_MASK_COMP + ((co=
unter - 1) << 4));
>=20
> Please can you explain what this "reverting" is doing? It looks like a
> user-visible change in behaviour to me, or are you saying that the driver
> currently does the wrong thing on hardware that supports the new filter?

In sys/metrics.json table as below,

"MetricExpr": "imx8_ddr0@axid\\-read\\,axi_mask\\=3D0x0000\\,axi_id\\=3D0x0=
065@",

We have set axi_mask to 0x0000 for most of the metics and assume that
bit 0 is used for masking. In hardware register, bit 1 is used for masking
axi id. So there exists a reverting operation. It also works for me to
set actual axi mask value in sys/metrics.json. But, because this patch
is just a supplement for filter, and previous axi filter already use a
reverting operation for filter, so I did the same thing there.

>=20
> > +
> > +                     if (cfg =3D=3D 0x41) {
>=20
> What is this 0x41 for?

IMX8_DDR_PMU_EVENT_ATTR(axid-read, 0x41),
This 0x41 means axi read filter event.

Thanks,
Xu Yang

>=20
> Will
