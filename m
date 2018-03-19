Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,RCVD_IN_SORBS_WEB,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B213C7D0DA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 11:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933119AbeCSLE2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 07:04:28 -0400
Received: from mail-db5eur01on0072.outbound.protection.outlook.com ([104.47.2.72]:27360
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932734AbeCSLE1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Mar 2018 07:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vZaN+kRYuB7UUgcHisccyhsxAVYz/j0+L0ENpbUm3OI=;
 b=cmKbS5g8zw3InCByHVQyUbM4LiklXdYfO7zjIKbTUenyPAcG2f0Pn1aNxztm9GHtmhNcUwKjjvO8CcA28C9pdGN4TOnw1A8ua5TTu1P2eUhCRZnZp3jmngKv5UIa1rP9dlkokIpK0dxJdk6A+qYooeY9A46Qn48CoFMfvVXbM9c=
Received: from AM3PR04MB452.eurprd04.prod.outlook.com (10.242.110.155) by
 AM3PR04MB257.eurprd04.prod.outlook.com (10.242.17.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.588.14; Mon, 19 Mar 2018 11:04:24 +0000
Received: from AM3PR04MB452.eurprd04.prod.outlook.com
 ([fe80::5833:9128:f42a:7e20]) by AM3PR04MB452.eurprd04.prod.outlook.com
 ([fe80::5833:9128:f42a:7e20%16]) with mapi id 15.20.0548.021; Mon, 19 Mar
 2018 11:04:24 +0000
From:   =?iso-8859-2?Q?Horia_Geant=E3?= <horia.geanta@nxp.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>
CC:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] crypto: doc - clarify hash callbacks state machine
Thread-Topic: [PATCH] crypto: doc - clarify hash callbacks state machine
Thread-Index: AQHTvTnS8kcR1bt5RUucTQuU3LKxuQ==
Date:   Mon, 19 Mar 2018 11:04:24 +0000
Message-ID: <AM3PR04MB4520497CC3D9B2B98B8E63798D40@AM3PR04MB452.eurprd04.prod.outlook.com>
References: <20180305103945.3517-1-horia.geanta@nxp.com>
 <20180316151642.GA6606@gondor.apana.org.au>
 <AM3PR04MB45284A83B66E00785872DE698D40@AM3PR04MB452.eurprd04.prod.outlook.com>
 <20180319092458.GB12302@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [86.34.165.90]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;AM3PR04MB257;7:bINScIKzZGg0QVTOouG+Ni/5W4qqiukqo9UBxA4x0FRze3enwJnjepuYfZ80p0BLSsV2/cpmgkJeVoZqTmyIkIlgfH1FNzjTtLHLYTW/ayb87AwKDWK5T9gSGTkZrsq2GP6SHfuM9Fn6kKdbwfyGfHbXQMSo5b41QgGpQwG3nO8AKLEZl0GkXbYt+HHkLJ3zsvugm71aSMWiT1YuSQagVpktIRiO6KTm0TAp2nbhlydAsNg/W4wppyCH8bFVoUky
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4d96e18c-4199-4ab5-0ba0-08d58d892ce7
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:AM3PR04MB257;
x-ms-traffictypediagnostic: AM3PR04MB257:
x-microsoft-antispam-prvs: <AM3PR04MB25767DB7EC166398CFAE1BD98D40@AM3PR04MB257.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231221)(944501300)(52105095)(3002001)(10201501046)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);SRVR:AM3PR04MB257;BCL:0;PCL:0;RULEID:;SRVR:AM3PR04MB257;
x-forefront-prvs: 06167FAD59
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39860400002)(346002)(396003)(39380400002)(366004)(199004)(189003)(74316002)(478600001)(86362001)(229853002)(3280700002)(53936002)(7696005)(7736002)(305945005)(2906002)(5250100002)(316002)(93886005)(14454004)(6916009)(8936002)(25786009)(26005)(81156014)(81166006)(2900100001)(54906003)(55016002)(186003)(33656002)(106356001)(68736007)(53546011)(59450400001)(6506007)(6436002)(99286004)(3660700001)(5660300001)(102836004)(9686003)(6246003)(8676002)(66066001)(6116002)(76176011)(3846002)(105586002)(4326008)(97736004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM3PR04MB257;H:AM3PR04MB452.eurprd04.prod.outlook.com;FPR:;SPF:None;PTR:InfoNoRecords;A:1;MX:1;LANG:en;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 5QccyISDbCYH8yxPk9f3vwvhZti0qmwEVJk/VIHfbGlme/9NTIUzurajGikwz1a2alAFcShL1w/6tUU809w+5uKSZ2LP1iGmcjFI2nOs/W0sb7dUnPwcgcGF19cEyBWjfiq3Aln5yHfrWD8LDH3gmzA97ww/N33NPhEcu3NRsek20iXl14lEMSZXbxIid1CzbMHEujzuHwCoW86azCZbC6fwsy/sLh8WKtcoj+nqOWMCTG9R4mMU057h7UT27ybifBFczKJ+3hg4bO2mIZgCFh7b5nteFIquuinSmnfNx4WwXlJP2Lsj2hNxzb0I9FUCa7bmihrTv025nMicCNWi4w==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d96e18c-4199-4ab5-0ba0-08d58d892ce7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2018 11:04:24.4605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB257
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/19/2018 11:25 AM, Herbert Xu wrote:=0A=
> On Mon, Mar 19, 2018 at 06:39:50AM +0000, Horia Geant=E3 wrote:=0A=
>>=0A=
>> The fact that there can be multiple requests in parallel (for a given tf=
m) is a=0A=
>> different topic.=0A=
>> Each request object has its state in its own state machine, independent =
from the=0A=
>> other request objects.=0A=
>> I assume this is clear enough.=0A=
> =0A=
> My point is that all of the state associated with a request needs=0A=
> to be stored in the request object.  If you're start storing things=0A=
> in the driver/hardware, then things will get ugly one way or another.=0A=
> =0A=
Agree, the request state should be stored in the request object; I am not=
=0A=
debating that.=0A=
=0A=
Still there are limitations even when keeping state in the request object.=
=0A=
For e.g. an implementation cannot DMA map a buffer for the entire lifetime =
of a=0A=
request object, because this lifetime is unknown - user can "abandon" the o=
bject=0A=
after a few .update() calls, or even after .init(). By "abandon" I mean not=
 call=0A=
_ever_ any of .final(), .finup() or .export() on the object.=0A=
=0A=
The only solution to avoid leaks in this case is to repeatedly DMA map & un=
map=0A=
the buffer.=0A=
IOW, if one wants to load/save HW state in a buffer after an .update() and =
to=0A=
instruct the crypto engine to do this operation, the following steps are in=
volved:=0A=
-gpp: DMA map the buffer, get its IOVA=0A=
-gpp: program the crypto engine with IOVA, wait for crypto engine's signal=
=0A=
-crypto engine: load HW state from buffer, perform the partial hash, save H=
W=0A=
state in buffer, signal gpp=0A=
-gpp: DMA unmap the buffer=0A=
=0A=
I'd say this is pretty inefficient, yet I don't see an alternative.=0A=
=0A=
Good or bad, the documentation should reflect this limitation - hence this =
patch.=0A=
=0A=
Thanks,=0A=
Horia=0A=
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
