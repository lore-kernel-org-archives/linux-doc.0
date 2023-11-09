Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84909D506;
	Thu,  9 Nov 2023 06:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZM94UIo1"
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2060.outbound.protection.outlook.com [40.107.6.60])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F319119A5;
	Wed,  8 Nov 2023 22:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WN8nCLpitkjCCkNCDDyzuWPGA4RZ7ROcWAo2lCI8HX0AkiItb4Bjl1mxxqQHnHlGh+JPhXYlkBAQOA+wNELsdPolnA42r3vhGha7HBDZqDScvTUgHpUZ1gExXESiwoZtDwst8XbKDgGHt8WSAfmoUjmFSgdUcbSHEY1xA/NmL/yjYpZhoEDRaIYeKpWzjxSRLAXZcEND52d6QB3lhfYaA46B5DkAJM0XIPBLrBDCCGVHC4eEJa/QeqD9uHrLaBkQ18+4o1acre8Ba+d7JdnEbiRLPF8nXZ9UQsSfMITj7KnK3tMVYMXxlMuJXGLf69pMyQlHzQ2uEVaLvbKQiGmwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzIgsHdqEN1tV4KqN5koVwnQ441WVvEZz1fcFJNi1GE=;
 b=W+pY8fa1qy9LGV3PWqUzm8In/6pVNuFYZA2X/flUVONZAiHZubz0xcgqZ1/t4Q7XoxVIzSACBkhoDu/zmNuYoO+Uid/NONZg54TdjjPNnVkzBz4+NNODgGyTLs/fCKbupvW6KEGdAsakiU/lVEUMJ0lYg0iomgy8te26Mb8Zn/VYE+s1PlBK39SoUkt4P/HXTwWGZ4CGTTPb9rbyP04vMmC5rFEXu/AyuTisCtXwS5VRnmJ73JuM0j68sW6cdF1dt/Ztn0sTJ2ThEMQxlsqdavyk69PBGolBZq5UP2Q+wosmbrTFztIucDD3lyJYMk9zbgBiwQMfzaKnXejJkbJlkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzIgsHdqEN1tV4KqN5koVwnQ441WVvEZz1fcFJNi1GE=;
 b=ZM94UIo1yLrcPM7F6vgmfXjXbsms1M/a0GtXzQDgDwoPqrfKawYjJOWLp0qu16ecozDODo2MoCfE9XjfOrr9kv3l52TvMZIciy3p0jQ25gUlwzk5X+ZjMWAsFYSYbA4H59jeqNw9PyXDKP9LrCiKF2v5D+BALXS9lQXTZuGOIGU=
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by VI1PR04MB6896.eurprd04.prod.outlook.com (2603:10a6:803:12e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 06:26:30 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%6]) with mapi id 15.20.6977.016; Thu, 9 Nov 2023
 06:26:30 +0000
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
Thread-Index: AQHZ/AivYaheMWWeQkGcbusOXLc1x7BRP4MAgAXzHkCAGoAuUA==
Date: Thu, 9 Nov 2023 06:26:30 +0000
Message-ID:
 <DB7PR04MB5146E63E855A3F9F38EF1F778CAFA@DB7PR04MB5146.eurprd04.prod.outlook.com>
References: <20231011060838.3413621-1-xu.yang_2@nxp.com>
 <20231019145150.GB19567@willie-the-truck>
 <DB7PR04MB51465ECD68F0F183EE0F51578CD8A@DB7PR04MB5146.eurprd04.prod.outlook.com>
In-Reply-To:
 <DB7PR04MB51465ECD68F0F183EE0F51578CD8A@DB7PR04MB5146.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5146:EE_|VI1PR04MB6896:EE_
x-ms-office365-filtering-correlation-id: f5ce45af-fd32-49ed-af3b-08dbe0eccff0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cZQEJ+5jFX4lNH62F/T1wA81XYXmqX0Lis7GC+sDr8C59e+TFiaMdjChFU5R5mEkXv6wPIeiE7OfwjhdqOpQol01xg/I5+kyS1mvxh84dD3hWAvQOcedfgwTff+G/BWHXkb9K1R5liJO0Uj2jP7GX/abRN8GL9nYn0qizbLwRnE5ZdVKU0P9i55M01NcwLzlxp9NBzlpldct/rAJISEn/sDig8eseFGT6eR0GqOppylOMjKxT/eTWR5k0d/4Au9kWY6wCaTAyKYLljyTlyzhYsjs1FewDsfkzx+fPXNH0sEg/+umHvPGXgJwVPoeh0fGBlSZFjFIprK/8ZFuOAcFsUlXeNZHSmZGl9vWFuaS1b1k7OSVMo3BdpCtB86OkeUlWc+EvtKiG1YlylT/ksI04YRJpXIqdeoJ1R4SJEh01ffmGzhCHdTQxUYui26rvyklh8OxgyDsuAaxTo/ErXGu1Dzdu35WdZwHuZ1DawSTh/U42JmQIPo5j0zD0NotZfjwV9uPfhl0Ts+ZiCDCkcrhsYkawtJ4gWMpdIyPB6OUt6x3s59FW1mP7I+svUm3H56yGYMze+cEHUJd5lqk5Z3k71iJ23o5AEq1idrkwfRSZreTHCrv9z/oOwotGg519KeM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(71200400001)(7696005)(6506007)(38100700002)(9686003)(26005)(478600001)(38070700009)(33656002)(55016003)(52536014)(8676002)(64756008)(54906003)(66446008)(4326008)(66946007)(8936002)(66556008)(66476007)(122000001)(5660300002)(7416002)(6916009)(76116006)(316002)(2906002)(86362001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e4zfQ6l4f48uzsWMFgvaNSuxThXDE357Jgxvyyt3ULLlCo4QP1DpdymqYfE+?=
 =?us-ascii?Q?VylKqeo06k98MPDUWeP5VQkhTbz7oP6SVsNLw98o+Kn6Y9wfbdqY0LCa3kjt?=
 =?us-ascii?Q?t2Tt1XND4J848nQufALRmkEcGsdbwT26P9XCugG8zpjA5gStHhCBPrtQyKKl?=
 =?us-ascii?Q?++ikaIjnH8hcQWuFyji9jkqqTcLA3+I4aEK5LvBQcysGSwYI+asXB/sVOQzP?=
 =?us-ascii?Q?5rvMCiT29F2WrcNBl+89KOI1bTgTnUIGPzQw2vLR/+XyCMLHK6IetV/XEDPr?=
 =?us-ascii?Q?0iBpQVydSBgrZ9tV0WWZXolHAad1oAtUnvDbHJNsEBjD3muqhpu1hr8R+h1X?=
 =?us-ascii?Q?ePLCCOlaBvLBh0QJxbgzfrwPhDjwosbmZIIWBQhHtJjoVeMO/Ecyetti5haS?=
 =?us-ascii?Q?pqNEmWS6T6cLyeeSqRr9tjm6JwTCfDhZUvn+hvEbs4LCRvRU4JCO/rFLz5Gp?=
 =?us-ascii?Q?Tro8PYqn0BwgiTawxyhIFKHexSvxn1FHdYyIPovG/Xj9CB65LdV/s91n2OcW?=
 =?us-ascii?Q?Qq2pQHSa8uCsT3UKquz4hUfHnrMQ8AqeGerSTf854eyHnnbCX1cvWftwXEys?=
 =?us-ascii?Q?gn/SuWz4h5VPsJIE0Z/aj4b32gTM4JbARsHM4qyDd4sTRTde5HkJJ3w4hlRD?=
 =?us-ascii?Q?NC2Pnva4U/rVh6vWAqiWYTSKjnZCZA+kJoPbqCo/lPuZXH8IVTkBEOEiZ9hq?=
 =?us-ascii?Q?KkUOgzL0mdsFW0vdPVa8eV2IiDnldZcY2xF8JAWqNXQEga51lDiRgj67naGV?=
 =?us-ascii?Q?8WG/fPBW/0HBt4jG/I+4yApSdjWOc1/TknUsGFOm7OvV8BrlKAiDIc/ndyIs?=
 =?us-ascii?Q?Q059urWFpjeojeVIojSuTEU+O8MebJqSlrC6+RtJSnHUARH/d4LWJzFzqgxF?=
 =?us-ascii?Q?PN/diimrmBhi2iJ01xraPuxFADrvGwxYE4oNhULqKTrnv4Ex4A94gZV6TNfH?=
 =?us-ascii?Q?LDk5of+Z3JqzEmtgowBM40PVlz1k4wX+ntYkA9/jEMkIBRZKyDTre4zKFcEt?=
 =?us-ascii?Q?hgAu5Nn/zGfs5jaCzetmVYwTNPquwAlacNu8/PsEtYg5BPUnTeO6v7dN7Iyu?=
 =?us-ascii?Q?SE0otGJG/sBgMWv1iN8ABnoe0/4j401gXVhbusgY+yzW3z3+pXIdRmjb845T?=
 =?us-ascii?Q?e+5AS1y+HY+96fJ6L61on5ZsFm871qJivaXX94CBLFSNjIu9StIaYtGXJtFY?=
 =?us-ascii?Q?WBWkEqFnst+GAhOiDJPeLBo75po3TBov/L7kVjQlkPbEBAS8lPntfSBOMLiO?=
 =?us-ascii?Q?EXey/tWHsKKfgdI2RoXxy+LJi2bJZW9KRfdVqxzn8/CPNkY8UjdwViK1QiID?=
 =?us-ascii?Q?z0oWTVaSOY4CVypQapRWlJzxf326fIyNgpPonqz9kX1ZdjMmjqE7kjUkNX3+?=
 =?us-ascii?Q?u/rpJGrtgdX6CUmu5Y5vuSkkCXBON1nxziYSI+bmAYQvK6JLaOwv+BahNcn3?=
 =?us-ascii?Q?6rqZXt1X0AUH3fGub1ZBIulLoVnkH61TTW/8wFvfK2LpexjAHZ41R5jPU2/B?=
 =?us-ascii?Q?cwMtwz0O1BlaWlcBoTNNtXnxUoXWy+pabhefcNo0l6jyAqm5AlQwGW8N20s9?=
 =?us-ascii?Q?/KR2x2yU4KB6EfF65f0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ce45af-fd32-49ed-af3b-08dbe0eccff0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 06:26:30.8079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxNifheQqeXDduWfUjgZ2cJFcsY2HxaL5OCoeM9DLes83CMAjCYjAUnGcl94ZgTe/xh7KFbqjpm80gfWBHeu4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6896

Hi Will,

>=20
> Hi Will,
>=20
> > On Wed, Oct 11, 2023 at 02:08:34PM +0800, Xu Yang wrote:
> > > This is the extension of AXI ID filter.
> > >
> > > Filter is defined with 2 configuration registers per counter 1-3 (cou=
nter
> > > 0 is not used for filtering and lacks these registers).
> > > * Counter N MASK COMP register - AXI_ID and AXI_MASKING.
> > > * Counter N MUX CNTL register - AXI CHANNEL and AXI PORT.
> > >   -- 0: address channel
> > >   -- 1: data channel
> > >
> > > This filter is exposed to userspace as an additional (channel, port) =
pair.
> > > The definition of axi_channel is inverted in userspace, and it will b=
e
> > > reverted in driver automatically.
> > >
> > > AXI filter of Perf Monitor in DDR Subsystem, only a single port0 exis=
t, so
> > > axi_port is reserved which should be 0.
> > >
> > > e.g.
> > > perf stat -a -e imx8_ddr0/axid-read,axi_mask=3D0xMMMM,axi_id=3D0xDDDD=
,axi_channel=3D0xH/ cmd
> > > perf stat -a -e imx8_ddr0/axid-write,axi_mask=3D0xMMMM,axi_id=3D0xDDD=
D,axi_channel=3D0xH/ cmd
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes since v2:
> > >  - no changes
> > > ---
> > >  drivers/perf/fsl_imx8_ddr_perf.c | 39 ++++++++++++++++++++++++++++++=
++
> > >  1 file changed, 39 insertions(+)
> > >
> > > diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8=
_ddr_perf.c
> > > index 92611c98120f..d0eae2d7e64b 100644
> > > --- a/drivers/perf/fsl_imx8_ddr_perf.c
> > > +++ b/drivers/perf/fsl_imx8_ddr_perf.c
> > > @@ -19,6 +19,8 @@
> > >  #define COUNTER_READ         0x20
> > >
> > >  #define COUNTER_DPCR1                0x30
> > > +#define COUNTER_MUX_CNTL     0x50
> > > +#define COUNTER_MASK_COMP    0x54
> > >
> > >  #define CNTL_OVER            0x1
> > >  #define CNTL_CLEAR           0x2
> > > @@ -32,6 +34,13 @@
> > >  #define CNTL_CSV_SHIFT               24
> > >  #define CNTL_CSV_MASK                (0xFFU << CNTL_CSV_SHIFT)
> > >
> > > +#define READ_PORT_SHIFT              0
> > > +#define READ_PORT_MASK               (0x7 << READ_PORT_SHIFT)
> > > +#define READ_CHANNEL_REVERT  0x00000008      /* bit 3 for read chann=
el select */
> > > +#define WRITE_PORT_SHIFT     8
> > > +#define WRITE_PORT_MASK              (0x7 << WRITE_PORT_SHIFT)
> > > +#define WRITE_CHANNEL_REVERT 0x00000800      /* bit 11 for write cha=
nnel select */
> > > +
> > >  #define EVENT_CYCLES_ID              0
> > >  #define EVENT_CYCLES_COUNTER 0
> > >  #define NUM_COUNTERS         4
> > > @@ -50,6 +59,7 @@ static DEFINE_IDA(ddr_ida);
> > >  /* DDR Perf hardware feature */
> > >  #define DDR_CAP_AXI_ID_FILTER                        0x1     /* supp=
ort AXI ID filter */
> > >  #define DDR_CAP_AXI_ID_FILTER_ENHANCED               0x3     /* supp=
ort enhanced AXI ID filter */
> > > +#define DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER   0x4     /* support AXI =
ID PORT CHANNEL filter */
> > >
> > >  struct fsl_ddr_devtype_data {
> > >       unsigned int quirks;    /* quirks needed for different DDR Perf=
 core */
> > > @@ -144,6 +154,7 @@ static const struct attribute_group ddr_perf_iden=
tifier_attr_group =3D {
> > >  enum ddr_perf_filter_capabilities {
> > >       PERF_CAP_AXI_ID_FILTER =3D 0,
> > >       PERF_CAP_AXI_ID_FILTER_ENHANCED,
> > > +     PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER,
> > >       PERF_CAP_AXI_ID_FEAT_MAX,
> > >  };
> > >
> > > @@ -157,6 +168,8 @@ static u32 ddr_perf_filter_cap_get(struct ddr_pmu=
 *pmu, int cap)
> > >       case PERF_CAP_AXI_ID_FILTER_ENHANCED:
> > >               quirks &=3D DDR_CAP_AXI_ID_FILTER_ENHANCED;
> > >               return quirks =3D=3D DDR_CAP_AXI_ID_FILTER_ENHANCED;
> > > +     case PERF_CAP_AXI_ID_PORT_CHANNEL_FILTER:
> > > +             return !!(quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FILTER);
> > >       default:
> > >               WARN(1, "unknown filter cap %d\n", cap);
> > >       }
> > > @@ -187,6 +200,7 @@ static ssize_t ddr_perf_filter_cap_show(struct de=
vice *dev,
> > >  static struct attribute *ddr_perf_filter_cap_attr[] =3D {
> > >       PERF_FILTER_EXT_ATTR_ENTRY(filter, PERF_CAP_AXI_ID_FILTER),
> > >       PERF_FILTER_EXT_ATTR_ENTRY(enhanced_filter, PERF_CAP_AXI_ID_FIL=
TER_ENHANCED),
> > > +     PERF_FILTER_EXT_ATTR_ENTRY(super_filter, PERF_CAP_AXI_ID_PORT_C=
HANNEL_FILTER),
> > >       NULL,
> > >  };
> > >
> > > @@ -272,11 +286,15 @@ static const struct attribute_group ddr_perf_ev=
ents_attr_group =3D {
> > >  PMU_FORMAT_ATTR(event, "config:0-7");
> > >  PMU_FORMAT_ATTR(axi_id, "config1:0-15");
> > >  PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
> > > +PMU_FORMAT_ATTR(axi_port, "config2:0-2");
> > > +PMU_FORMAT_ATTR(axi_channel, "config2:3-3");
> >
> > Any specific reason to allocate from config2, rather than the upper 32
> > bits of config1?
>=20
> No. Either way is ok for me.
>=20
> >
> > > @@ -553,6 +572,26 @@ static int ddr_perf_event_add(struct perf_event =
*event, int flags)
> > >               return -EOPNOTSUPP;
> > >       }
> > >
> > > +     if (pmu->devtype_data->quirks & DDR_CAP_AXI_ID_PORT_CHANNEL_FIL=
TER) {
> > > +             if (ddr_perf_is_filtered(event)) {
> > > +                     /* revert axi id masking(axi_mask) value */
> > > +                     cfg1 ^=3D AXI_MASKING_REVERT;
> > > +                     writel(cfg1, pmu->base + COUNTER_MASK_COMP + ((=
counter - 1) << 4));
> >
> > Please can you explain what this "reverting" is doing? It looks like a
> > user-visible change in behaviour to me, or are you saying that the driv=
er
> > currently does the wrong thing on hardware that supports the new filter=
?
>=20
> In sys/metrics.json table as below,
>=20
> "MetricExpr": "imx8_ddr0@axid\\-read\\,axi_mask\\=3D0x0000\\,axi_id\\=3D0=
x0065@",
>=20
> We have set axi_mask to 0x0000 for most of the metics and assume that
> bit 0 is used for masking. In hardware register, bit 1 is used for maskin=
g
> axi id. So there exists a reverting operation. It also works for me to
> set actual axi mask value in sys/metrics.json. But, because this patch
> is just a supplement for filter, and previous axi filter already use a
> reverting operation for filter, so I did the same thing there.
>=20
> >
> > > +
> > > +                     if (cfg =3D=3D 0x41) {
> >
> > What is this 0x41 for?
>=20
> IMX8_DDR_PMU_EVENT_ATTR(axid-read, 0x41),
> This 0x41 means axi read filter event.
>=20
> Thanks,
> Xu Yang
>=20
> >
> > Will

Do these patches still need optimization?

Thanks,
Xu Yang
