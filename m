Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA09CD4938
	for <linux-doc@archiver.kernel.org>; Thu, 21 Sep 2023 01:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjIUBfp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Sep 2023 21:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjIUBfo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Sep 2023 21:35:44 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 003EBA9;
        Wed, 20 Sep 2023 18:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFlCzsoTGf7Xl7FFdBGB7F+c7P4kHhL4wz94HyxZ13Y7+ixCCILBuR3XPEMnzvi9isQ6Lgf7HrdYEcKzogiQ3EmAhtSURlmXqkAb1jSVMQsf2R1gNZ0z5tyxpOLVxUORXEbHl2rOWab2qgUf5cQIZf8jWhhqunmPXqWJtBISzHnVD+/WU9isuGrQWTeOltyVdCkI3ypcMVuUnmRSAUM96PENTBEgqt00bIKc2XYyJGPXpdC//53QUj3wJdSCHHuEvgJ3bHdMraRm7l9vVSga+qwo7h0t+DNx3mIkyBQq6d2ODq9rVZ6QwUPzagDFc78KsjnjD5r9X8bWilScw4SIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5dJFaBDF1O7J61ivPg/gTdM3YCOSFfFfGW/yA802/w=;
 b=KNcRDc+rckXLrthUa9y0H8CjJba//dhKos2IYpHr8m3ut28L7XU2Kfact8EJXf25U5shM1yxNF+l5rYZbQUsIO3QlQFLbK+VEL3ljIhm4oUUWgV4qa50sgZcz9lIDSVdTFPzAndg/jDasrohypgJ8jDKZbQh/KsI5VbO0RN+ERwlICzKGarb5ulwIdEuVIQmYtXLdfaqBY8f+U1hK+klCvDrYP00rY3Yy0J8VPsnsXi6rd6mItOTia4w33gExGl2yHv3kLeNVA41sAud8OfYhi0ZGEbcjDw9ZI0HxxwS2J7cnt843IfSwY7YIFzVPaEbghHX3K22yyBPoGJ5D3jgGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5dJFaBDF1O7J61ivPg/gTdM3YCOSFfFfGW/yA802/w=;
 b=bPlPhRB3V8tQ13cJuhfHlqEWLwNGhI3IK5fmYP3b2CdX3X1EZhCeqH3xmaV6lafE46Wso+NjLpn1wj6U0RFGdFttYJbpOqqcLWVMEG6uIDL50gHZGPCMMZc+a8T2IteUwhaQXTSj4JhJJwb6KgLLtv+YATRpYngxM5F+UeYV/1U=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB8594.eurprd04.prod.outlook.com (2603:10a6:20b:425::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 01:35:35 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%7]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 01:35:35 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Frank Li <frank.li@nxp.com>, "corbet@lwn.net" <corbet@lwn.net>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "will@kernel.org" <will@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
CC:     "festevam@gmail.com" <festevam@gmail.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 5/5] arm64: dts: imx8dxl-ss-ddr: change ddr_pmu0
 compatilbe
Thread-Topic: [EXT] Re: [PATCH 5/5] arm64: dts: imx8dxl-ss-ddr: change
 ddr_pmu0 compatilbe
Thread-Index: AQHZ66tsGkCfpBRgbkuGkL2GCONenLAjs9iAgADMfwA=
Date:   Thu, 21 Sep 2023 01:35:34 +0000
Message-ID: <DB7PR04MB45059559728668B720C992868CF8A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230920102004.886599-1-xu.yang_2@nxp.com>
 <20230920102004.886599-5-xu.yang_2@nxp.com>
 <afedde62-f887-07a9-82dc-125f6e46c25a@linaro.org>
In-Reply-To: <afedde62-f887-07a9-82dc-125f6e46c25a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB8594:EE_
x-ms-office365-filtering-correlation-id: 650e6753-b6d1-4e28-27e2-08dbba430d65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ERX7a4NxGGnAjL/2xUQXVbSBdn5k9GM8HUE8AJns+s+8UuXBJo9DVuv+umtdLuXZe7EILWENSHTj1NSHB1qLgomHv84fhPinbxQOh36dzVOM1PEZoTUKmkaqEOe7yLA3eCN1c+oBd/A+UekP5PKVz0h09YcoIt3SKdu/ZzwTf5KNZ9H5lsDTfxmJJXf9BFn3mVWqCRjMB9xgiRKy0mTiDCMUmh5Bkwce1LcOUtNNEoWW3gqjmGziM8PRRPCm9rIc6jSwGjQibtSIN8lmeDqcMbDvwm9VronVQRgQJ75FNwL0L84smLQ81ZTtGGISB8/HHxfHIyZgoPO70twrAsSfxqmrMxMlbjynRlDC8UwKFLcSR/yaPpBm0JOFdVGPeUKkcwZ8scYQw4fV7kYOJlXyY4SNRDM1P1B9V4Ie1nM6QW8Wob+KKZV28chXmYefLMO/InSLKV38mUa4HXHjd1GifeenqgdLK7uxmNHPBSjvMIwmokG7vPX0Eg3LXvEHyLZP1pG/SoKUFAj9tc2QvZrHqtdzLVt6opmloeoLH/hum1cXhXfDwOmfqG5eoKuuzGokgBAC12VedrhYysrS7gJoYlDQ7iCtXt068UaIAN2C8Cijafdc3QAnK9r5C225gJXEJB+KB6ztRQZBP3Um9r09ueBkleuOkoBE9RQR48IR+iw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(376002)(346002)(1800799009)(186009)(451199024)(316002)(54906003)(4326008)(41300700001)(55016003)(26005)(6506007)(66446008)(9686003)(38070700005)(71200400001)(7696005)(53546011)(478600001)(86362001)(921005)(122000001)(558084003)(33656002)(38100700002)(8676002)(8936002)(64756008)(76116006)(66946007)(66476007)(110136005)(66556008)(2906002)(5660300002)(52536014)(7416002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2VWU1lORmhTV2c1dUsyWThRMDhaZjZuR2ZGbmxBYXRWZmhsc1l4NDhlTTNm?=
 =?utf-8?B?N05UcHRuVGhXbkgzT0JlaUNma3lwbzdlTzZERUdTdG1Db0pCSFpPQ3FnYU9t?=
 =?utf-8?B?V2wwMVVDWGdjUG5WcUtzUThvZmRnU3NzeWVra2NvOElxc0lxRmdnenB1NkE4?=
 =?utf-8?B?MnltK3ZxVEZNYTg1bS91aFpnSis3TDRJKzY4RjBydXRwTXc0UUF3ZkZjdWho?=
 =?utf-8?B?L1FlLzJ6cm9ScTQ5UUlsMDlhcWZRTmdqaUxad2hyZzdvL3FHU0w4NW9DZVBu?=
 =?utf-8?B?MU1uRWl5NDl3aU1JK09NbHFiVWRobmd3dnBJNDNTUGtVYnc4cmlJdHRWeWVk?=
 =?utf-8?B?WVE3YmtHY29QMjIvSnNSSzI1MFBWTWw2aXlOWjdxQ2ZHNHliZTdMd1RPQ2U1?=
 =?utf-8?B?SWhoMi8wLzVDNXVad2VsS05nRUorM2pwTkwxSGhKTGtPRVF1cm1wdkhjN0NK?=
 =?utf-8?B?VFovYjQzNjY4aVBYeXdsUUZmM0VReGJ4VDI0eTJCY1BvNTRlZk9MQWRqSmJj?=
 =?utf-8?B?WUdCUFJpRU5uNFc1OEcvUXErTlR0OWpTRDNMYUtLY2tYbFpodFZweW5SR3pr?=
 =?utf-8?B?U1BQL21rdzZIT01Sbnl4OW4zam9yWUtpb3B2MmpUcXBRM3lxaFdEbUVvRDg2?=
 =?utf-8?B?UUtvTUVRMHU2KzNqNktLK1FZRThYSGpSdGR1SVhHUXBJZDNFRkFsQ1pRWFlx?=
 =?utf-8?B?MURxZXlNck1acXJOVjV2UU5xdlFEbUJkaUVhdW5XdGEvOUdBU3hHTkdja1g0?=
 =?utf-8?B?MVM2T3RuamRMY1hhdEVneW0yNWhGM3l5NVgydDJyUzhJZC8ydzZ4dDlGZGhs?=
 =?utf-8?B?Q3hQd3kzVkpkdDVhVFZFWWRhWjBLbWwrdERtNGRaVlljUC9nZXFUSXhQS25T?=
 =?utf-8?B?QU5GMExyWmp4ZFNYTFl2MEc2eTgrZWVoWnd2WStBSzRjZnJiMlVMN082L3ZS?=
 =?utf-8?B?MEVxYm90U2Y2MXNHZENZT2hTdkhoN2Njc3pYRk1VMWkraTJ1WHdLcHBrSnFm?=
 =?utf-8?B?T054YkhEQ3MxalYxS1M0eFRDVE4wejJlczZSVzYwNmh3L2w0MkRHTGp4cEVv?=
 =?utf-8?B?RW9jMHd6MnE5OWdha0N6NENSQ08xWHA1VG4yQk1PVzRTU1Y5dUtGbEZHczA2?=
 =?utf-8?B?SWpjMnZFTjl3VWg0ajExTkdEZ3JRc3hjb3JPMmdWNWhuVmVUa1A5aXFRWmp3?=
 =?utf-8?B?eUJ1Q2lFNnBLVmx2eFV0K2o1WVJ4eUxNWXQvTlRMam4yU2xBc0pyakFLWVBj?=
 =?utf-8?B?TzdJYytvWTd3ZkhMMHpYSEowdXlFR3NTTnRKUTNaYjlMNk5tSGZiT1FXS0lI?=
 =?utf-8?B?VDk1ZDRYVzIxeXYrUy9teWJ3bTBkOUJMMVl6Q3d2NmFpZTlreXkvQml0d1dN?=
 =?utf-8?B?Y1RxdUMyZWJuV0IzbmplOTY1alU2YlIxeExTdHdUbWFsZkZVcjdXTDRrdHRt?=
 =?utf-8?B?cTYxYWszL2FBZDR2UXNndVA5R1RzUU1uZmp1RW5lejVINEFic3JjTWRMUjZZ?=
 =?utf-8?B?d09JYVlJbzh1a2VRUDBZOC9keUhVbUVTL3F3UzZLVit4aEUzZkJEUytaaWdT?=
 =?utf-8?B?QmdJSUZScStTdm9NaTJjcTBOK3pzdGVyTWx6OElUVitVVmZpTlVuUEZrWmY0?=
 =?utf-8?B?cTZ4MWZ3Y0dxaEtxb3Vpelk0bldzZ1FSZldNQWtHMDBTUXNoNkFWbG93bkJJ?=
 =?utf-8?B?emdVcWZwUFhBdFlPVFQ2ekJNVklSaWM2MmlLNnlublRvTFYyOUd1amRVWkd1?=
 =?utf-8?B?bzNKL01QWU9hZjM3Z0QwZTNOdHRDNWFwRmhhYWNjallHZ2lFVVkxTkRJaW4r?=
 =?utf-8?B?Rk5TSVB6M1VRbzJPUFN2M2xkeDEvK1AyejhZLzlzUERnR1RhazMycXRpbmFU?=
 =?utf-8?B?Q1ZnRWhnTm1BRk45VnZtd0QrQ2RsNXZ6U3M2Snl0MXFzTzYzcFVXdzNuS0Fl?=
 =?utf-8?B?Uk9BWFFLRDBUSDNQOWREUEYvaXRKbFJGaFFZZlY3Ry82NUVBU1pjYkxmeEJG?=
 =?utf-8?B?akg1aTJ0TjJQMmdxSUMrMjR4VGE3cXM0Q0xPUDZkUXR4RnN2VzZSVUd0UDBk?=
 =?utf-8?B?UWNRRGlJZEUxaks0ZSsrRUpZdmxPdWFVU0NDTUx2RTQ4RHJxQmxEZHZiQWxE?=
 =?utf-8?Q?rqBg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650e6753-b6d1-4e28-27e2-08dbba430d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 01:35:35.2983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bztZlSTxddj333dS027hmd2tfY25YIuPV2CzToPZiC5XFDNH1aQqvZnTcDf/ywxDnvPc+5UvFhqYLx2zWLpDrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8594
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIDIwLzA5LzIwMjMgMTI6MjAsIFh1IFlhbmcgd3JvdGU6DQo+
ID4gaS5NWDhEWEwncyBkZHIgcG11IGhhcyBwb3J0L2NoYW5uZWwgZmlsdGVyIGNhcGFiaWxpdGll
cywgYnV0IGl0IHN0aWxsIGlzDQo+ID4gY29tcGF0aWxiZSB3aXRoICJmc2wsaW14OC1kZHItcG11
Ii4gVGhpcyB3aWxsIGNoYW5nZSB0aGUgY29tcGF0aWxiZS4NCj4gDQo+IFR5cG9zOiBjb21wYXRp
YmxlDQoNCldpbGwgZml4IGl0Lg0KDQpUaGFua3MsDQpYdSBZYW5nDQoNCj4gDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQo=
