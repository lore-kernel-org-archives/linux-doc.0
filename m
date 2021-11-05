Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651FCC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 01:56:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F156603E7
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 01:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhKEB7D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 21:59:03 -0400
Received: from mail-eopbgr40062.outbound.protection.outlook.com ([40.107.4.62]:3937
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231532AbhKEB7C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Nov 2021 21:59:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2/dQytu1ecmWcQBP2p467tntdf9FRicDrRONJDQBzVL+CpuI0iFvr0++WPwiU9oLyySBh9ad9oUKFzPmRGFDeVgiI9kFw6KHrrZQZqrmboQUMY1e2nQp9zrjFqs2OHvOqZyws4PLUMDn8sq+A0BN/f3xJDrYNm1hVHkLFCxCjFnQcsa501vjnFHpjI/SVuMXwcL0tFiwlEW8Qs5qHCDvMtX+QmYVoll6Vg8vxUTGG/GXvGF57hWcfHBYQ9Y85oJsYVVKD6PS4e1VpSw5qzfkTNtOI6K7ujW9LmJkLw7VH7JPfckv0dV/7untGkaSPzSint1SeUgmkyp9cOolTc3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CHENvXIuR9J2jjI0kB8eidN4IYowzmcw+naZB3vkMM=;
 b=SFpe7byyEEDvfP3aEI8IHvbQJa1L9lKKrIKGoJdsEqwOxBOoTWE6bU2ZJfnmD1+nw2X3jThxA2MSwbKz35CFGaqYxXGAJcmmIFrp6UF3jtsi7mXx69PQ2eloJd/M2vx31AwXp2rBt1BV8K/D0Ks/+4TtX1Y4T8wqHsxhltAprlS3JheTSsbNOxMLN0gSqe8wwIZxcoxDxUNKhEyr+xnpRlqBuhylGcN+m1boeGNfpuonLwa+sP+tF1M73VhDiBDhs+jAmQYVJADQJcE3tplNasHPa5wW9ssUDsj/joUNxRbzjicQ1NQgXCMPNMrxjp3hLRmDHTlcNOxkRYW5j0/zHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CHENvXIuR9J2jjI0kB8eidN4IYowzmcw+naZB3vkMM=;
 b=NxsjCFIS2UwhCYe114ssaUJizcup5GWfaKtfhQqzZPW+NJflPwYxC5DB+KZ5x+8qT7SfSyBZNW6V8ZdHMElLzIYYgrHoRT6aZwafaePzMiNZXqiom/7O31k+MGxRW3GuEDb49xSNI0IlJbXzG5lPOc0AicQNnm/6BQsHqDRw0PQ=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by AS8PR04MB8964.eurprd04.prod.outlook.com (2603:10a6:20b:42f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 01:56:21 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b%6]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 01:56:21 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     yanteng si <siyanteng01@gmail.com>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "alexs@kernel.org" <alexs@kernel.org>,
        "bobwxc@email.cn" <bobwxc@email.cn>,
        "seakeel@gmail.com" <seakeel@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
        "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "realpuyuwang@gmail.com" <realpuyuwang@gmail.com>,
        "src.res@email.cn" <src.res@email.cn>,
        "wanjiabing@vivo.com" <wanjiabing@vivo.com>,
        "bernard@vivo.com" <bernard@vivo.com>
Subject: RE: [PATCH 2/2] docs/zh_CN: update sparse translation
Thread-Topic: [PATCH 2/2] docs/zh_CN: update sparse translation
Thread-Index: AQHXzvVCuG8q/BV6ik+mXQCDksbufavvIzrggADMtICABEJiYA==
Date:   Fri, 5 Nov 2021 01:56:20 +0000
Message-ID: <AS8PR04MB89468C71C5A853C7515A6FA38F8E9@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <cover.1635752631.git.siyanteng@loongson.cn>
 <d975a715c010c7ddb26bad8377de5f18a617bd78.1635752631.git.siyanteng@loongson.cn>
 <AS8PR04MB8946BFA628F876B63DD9D80B8F8A9@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <CAEensMwks67zyjUxUjoBQPNgMduwiQzyJjT=ubwNrO5==v5W5g@mail.gmail.com>
In-Reply-To: <CAEensMwks67zyjUxUjoBQPNgMduwiQzyJjT=ubwNrO5==v5W5g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23bf6085-0c80-46ae-6270-08d99fff7739
x-ms-traffictypediagnostic: AS8PR04MB8964:
x-microsoft-antispam-prvs: <AS8PR04MB89648893C39A9A008B1D9C758F8E9@AS8PR04MB8964.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ktUP+UQkWgSaxnhwKlxwFfEF+fT+8Pe5v+SE6S5AVUOTr0CWCfMGVd0ZQFL6diyJzC/l92efCtkrrGmEg9ZYGcD38elKfgPJrrp7iQr/vE/5uW/VrXmqkXJ3PhIpSmvPi1WRO+HfUpNtzTY0OmXMkAf5p+xcwUUSJ+7rCZYlXn+rioWFNw7MvRODtgx+U5HwYaibbZ8Idp4uVpe8wH19p2Cs9zLrVNOlee0jqD2ITsDaYf//i59txqW5enUfor72XZMSgJF9eLgQQphoQqUpDFzRUdiCH1B6PqO0OMplsMnn3in9DNz29C4edhWoXMumDC/ZeubpssvDorVkJ8Am9me7TDEIBHN5YrCpTthQLxKH5K3OycLW0BpESXnBzASe5Uq8NX2kKTsGJkPIEEvTXfPag2lLliLw4xZ1FdtJ3wz4jBJAmes6Z6qKUUmOQt8ZLNEvu75IwI6RCvotWeTn7xWg97h+5XvDOO8JorbAySLP1FMjqjJzDMwYhLL/UlM/pBDf45EewdtenKElvBCQqcevcp+AnmuhHOi42yzGzhpnpUWhVKHb8LeBPaPq2KxWPMJNXmsm1mUayChBlGarWLRskyjoHPUDI/QBA1N2wpf2XUrAt/9eMdHTYDIPjXqV2xw62MNAcuGxoQK3kFYh3bVTh9znZcdSFdzeJEJdf/FfASXDQzYQSYgW+Czr99E7VjktPEe/pZhEXTd9wIC4+O+WBm2VOKXrP82K8CasDxsiCPFYPmUv40lJKPA+b46Uyb9or6ROLS8QtdCuQn1d+kasdYUOLVsdQ3c7HFAPk40+lP+QTk+K7fIFMbBehsQlcYdvNw1SHo9PCTGLKwF+DA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8946.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(7696005)(7416002)(55016002)(71200400001)(9686003)(76116006)(66476007)(186003)(66556008)(64756008)(86362001)(66446008)(54906003)(83380400001)(2906002)(66946007)(966005)(6916009)(316002)(45080400002)(4326008)(38070700005)(508600001)(8676002)(5660300002)(52536014)(122000001)(66574015)(38100700002)(33656002)(53546011)(6506007)(8936002)(15650500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y1dmcm5Ud2RzbjBkVi9kSDlQQUYxcW1xSmtZaUR0dnIrNFFFR1FETlROYklQ?=
 =?utf-8?B?RzIzSjZzUmpWcVQwd3hTRFNCSEgyOUpacFFSeHd0QXUyeFBReHVmUU1kLzNH?=
 =?utf-8?B?Y3Bkc1A2Y3R4a1NUWHgyZGppN25SU0k0V1d5bDZVZVN6d1d4MzNiTWppSDVi?=
 =?utf-8?B?bkFqaGpDSnhYVk1BSmU3Y1lBdzVTTXhWdEFMcTVyWDNzZGxEQ0RUR3RXaFBQ?=
 =?utf-8?B?T3RCeUNvSmJsUGpVbW1mUnBCdHI5cDdmUXFSc00zS3ZQY0VpUnI4MWdSaDNn?=
 =?utf-8?B?WFdEeUZZbGhidkFDNG9PQllvVFJtanVCRFYxMTFyUkw4a1RxbDBzb2RPQTZY?=
 =?utf-8?B?dzNEZmFtRUdqZm9BU0lKb0JsemVTeFQvS3ZnMkFWVkhManpaWlpQc2g3aEtB?=
 =?utf-8?B?NFVtdUlTdVUweXFHK1h0SmZXR1lUYVZWdWVBd1JWUlczclVTRGt5S0ZrUDBY?=
 =?utf-8?B?YnZ1alBYZEpJWWNuQWhnT3EzcDNTRnRnSmhESWxNY2hWWnVWRWZWOEltQmpI?=
 =?utf-8?B?Y002OHUwbnZMeUUySmY0YXJGVnQrdUxrdWs5K2g0SUkyVlVreE5PTzgvaUpS?=
 =?utf-8?B?ZzBJRHpUODMvMGIwaEN4NWtIUU4yWkpSKzJkSEdIUHcyVUdZdTlXaVFZRU12?=
 =?utf-8?B?SnJnTjBpbEdRK1NEMGcvdlBTS3JzdEszRjByZmhoMkxTMVhUeGVnRlJmYUVP?=
 =?utf-8?B?Y1pkR0FNQjZ1Ujk5ZjNkWG5LcW5DOW1iVFZNS3RNUEQ4WE1tdVkreWpCWnk0?=
 =?utf-8?B?QXRBNlB4MmFZTTQ4MTBUMjVFZVNhV2Jhc1BjOUZvZkh4RHhVUFVZcVhzeGh2?=
 =?utf-8?B?eHZoMWRQekN6YTBpK2pGY2ZSOGlNZkd6cGlNVlBKRG9OaWFYN2dSdTBRTktX?=
 =?utf-8?B?Uk9QNjRRZkV5VkNSWTlBVVV4UTRhTEVHN0dud2Z3WnJOUW5RcUJtYW50L2NW?=
 =?utf-8?B?cGFzMVMwSFR6ZDVYcXZtbDBqa1BSYlZUWEJzVlhHODRFUUp3Vy9URERwVFI3?=
 =?utf-8?B?UjAzak1nNGgyUVRTempYdWQxOEhLSzgxRC9FbnhmZzJJRzU2TDlmT3ZrVE1p?=
 =?utf-8?B?a1QzQi9sQk5HbVNhb3VDY1V0THhPTktMS3prRmNUOXRjMm4xaXVVVjh6MlBL?=
 =?utf-8?B?bTZtRVJLeG13WFBsMkFqaDFVOVM4RDVIcCtid0pwYzl3cGZFTkhudUs3ODNE?=
 =?utf-8?B?ZitCWHRRbGVIUkVSK1NGYldzdmZqb1FnY0VudTIwQVE3N3ZsMWVJMmYxYjQy?=
 =?utf-8?B?elBkcGhaQkkvTkgvWWVvV0Nyd0pCSGQydFd6MFN3dzhjaGR2dzRzK1RGSXdO?=
 =?utf-8?B?aTFtajFkQi9oUjBDcHhGb1NhcVV6TUYxWWM4MlRUdk1lcms0c1MraEJGdUVW?=
 =?utf-8?B?MG1waXJQRk1kZUQ3NUhSZXl2YzgySGl2MTdpT1FOS2owTWRNZG1DcEJWaVE3?=
 =?utf-8?B?U3g4bjRYNUcvTVYvKy96RnNxTkMvYW04SW5EeVVBb2V6aTZYM3p5VHo1WGky?=
 =?utf-8?B?cDM4cmJBdG5kWHFiUWlycm42bGdvaU5FeGIyUFdPOEk1NTc1ZFBkbVZtaCtr?=
 =?utf-8?B?U2x2UXFoZFFiKzN5WS9ibm5aTE91RzZXMWFuc3pyS3ErOGNlcHluYjUrcDFJ?=
 =?utf-8?B?cURRYmQ0aHJHanpadTk3RGFKMDFXenFJbDFFckNpZG1XSys0OUkzYTJiZzB2?=
 =?utf-8?B?MkRpcHZTMUQydVdaVFJLMmRRc2UzeHorT2phSERDQ3FWaS9Pd1ZJZFZjSXcw?=
 =?utf-8?B?bUhla01aSlY3K1NZNUx4M2puT21nQzZDcUEyQWFwbTVsVjVSZnB5RjJEQk0w?=
 =?utf-8?B?dmtIclkxMytjaVk5ekZOdXpzK3F4bWptaFRWdSs5RkpQZTk1bkx1VUdnUFVo?=
 =?utf-8?B?Q0pnMXZHSitwT2ZPTEdKZG9ycitWT1JnSnZjbGZHY1gxS1AxaHlrZVZrZ3BQ?=
 =?utf-8?B?Ti9LNGNuM1FSYjVKbU4yNmFrSitVWjBPY0k4RVphTENTYW9pYlkwZHVWMWsz?=
 =?utf-8?B?dExZRnY1STlBcFhRRG12aXFpaWsyUUNLMXltQ2xhc1lpVWJlbjEyczB4SkI5?=
 =?utf-8?B?cStrMDNjZzh4RGpqNHZ1MzNHb01lRDZkV1lmTDhsa3FOZFR1Zk4wTS9vQ1Vp?=
 =?utf-8?B?bm5GQ1QzR2N4SG5mbkNobDUzSDM3cHdzN0pzNVJCa0FxRk9KcG5HbmdHY3gw?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bf6085-0c80-46ae-6270-08d99fff7739
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 01:56:21.4047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HcIqjc0W9aLOzpjRYsz7Vru9jT7M+G3gEsfS2oUK2XrRuk8G/alsZ+F8uKiPvzh27JISYvd2CIxGcu1dH+SP3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8964
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogeWFudGVuZyBzaSA8c2l5
YW50ZW5nMDFAZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyLCAyMDIxIDM6
NTIgQU0NCj4gVG86IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPg0KPiBDYzogY29yYmV0QGx3
bi5uZXQ7IGFsZXhzQGtlcm5lbC5vcmc7IGJvYnd4Y0BlbWFpbC5jbjsNCj4gc2Vha2VlbEBnbWFp
bC5jb207IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj47DQo+IGNoZW5odWFjYWlA
a2VybmVsLm9yZzsgamlheHVuLnlhbmdAZmx5Z29hdC5jb207IGxpbnV4LQ0KPiBkb2NAdmdlci5r
ZXJuZWwub3JnOyByZWFscHV5dXdhbmdAZ21haWwuY29tOyBzcmMucmVzQGVtYWlsLmNuOw0KPiB3
YW5qaWFiaW5nQHZpdm8uY29tOyBiZXJuYXJkQHZpdm8uY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggMi8yXSBkb2NzL3poX0NOOiB1cGRhdGUgc3BhcnNlIHRyYW5zbGF0aW9uDQo+IA0KPiBMZW8g
TGkgPGxlb3lhbmcubGlAbnhwLmNvbT4g5LqOMjAyMeW5tDEx5pyIMuaXpeWRqOS6jCDkuIrljYg1
OjAy5YaZ6YGT77yaDQo+ID4NCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gRnJvbTogWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwuY29tPg0KPiA+
ID4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciAxLCAyMDIxIDI6NTAgQU0NCj4gPiA+IFRvOiBjb3Ji
ZXRAbHduLm5ldDsgYWxleHNAa2VybmVsLm9yZzsgYm9id3hjQGVtYWlsLmNuOw0KPiA+ID4gc2Vh
a2VlbEBnbWFpbC5jb207IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPg0KPiA+ID4gQ2M6IFlh
bnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj47IGNoZW5odWFjYWlAa2VybmVsLm9yZzsN
Cj4gPiA+IGppYXh1bi55YW5nQGZseWdvYXQuY29tOyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3Jn
Ow0KPiA+ID4gcmVhbHB1eXV3YW5nQGdtYWlsLmNvbTsgc2l5YW50ZW5nMDFAZ21haWwuY29tOyBz
cmMucmVzQGVtYWlsLmNuOw0KPiA+ID4gd2FuamlhYmluZ0B2aXZvLmNvbTsgYmVybmFyZEB2aXZv
LmNvbQ0KPiA+ID4gU3ViamVjdDogW1BBVENIIDIvMl0gZG9jcy96aF9DTjogdXBkYXRlIHNwYXJz
ZSB0cmFuc2xhdGlvbg0KPiA+ID4NCj4gPiA+IFNwYXJzZSBkb2N1bWVudHMgYXJlIHRvbyBvdXRk
YXRlZCxsZXQncyB1cGRhdGUgc3BhcnNlLnJzdCB0byB0aGUNCj4gPiA+IGxhdGVzdCB2ZXJzaW9u
Lg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4NCj4gPiA+IC0tLQ0KPiA+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vZGV2LXRv
b2xzL3NwYXJzZS5yc3QgICB8IDEwMyArKysrKysrKysrLS0tLS0tLS0NCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rldi10b29scy9z
cGFyc2UucnN0DQo+ID4gPiBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rldi10
b29scy9zcGFyc2UucnN0DQo+ID4gPiBpbmRleCAwZjQ0NGI4M2Q2MzkuLjQwNTY1M2QxNTZkOSAx
MDA2NDQNCj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rldi10
b29scy9zcGFyc2UucnN0DQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9kZXYtdG9vbHMvc3BhcnNlLnJzdA0KPiA+ID4gQEAgLTEsMzQgKzEsMzQgQEANCj4gPiA+
IC3vu79DaGluZXNlIHRyYW5zbGF0ZWQgdmVyc2lvbiBvZiBEb2N1bWVudGF0aW9uL2Rldi10b29s
cy9zcGFyc2UucnN0DQo+ID4gPiAr77u/Q29weXJpZ2h0IDIwMDQgTGludXMgVG9ydmFsZHMNCj4g
PiA+ICtDb3B5cmlnaHQgMjAwNCBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4gQ29weXJpZ2h0
IDIwMDYgQm9iDQo+ID4gPiArQ29wZWxhbmQgPG1lQGJvYmNvcGVsYW5kLmNvbT4NCj4gPiA+DQo+
ID4gPiAtSWYgeW91IGhhdmUgYW55IGNvbW1lbnQgb3IgdXBkYXRlIHRvIHRoZSBjb250ZW50LCBw
bGVhc2UgY29udGFjdA0KPiA+ID4gdGhlIC1vcmlnaW5hbCBkb2N1bWVudCBtYWludGFpbmVyIGRp
cmVjdGx5LiAgSG93ZXZlciwgaWYgeW91IGhhdmUgYQ0KPiA+ID4gcHJvYmxlbSAtY29tbXVuaWNh
dGluZyBpbiBFbmdsaXNoIHlvdSBjYW4gYWxzbyBhc2sgdGhlIENoaW5lc2UNCj4gPiA+IG1haW50
YWluZXIgZm9yIC1oZWxwLiAgQ29udGFjdCB0aGUgQ2hpbmVzZSBtYWludGFpbmVyIGlmIHRoaXMN
Cj4gPiA+IHRyYW5zbGF0aW9uIGlzIG91dGRhdGVkIC1vciBpZiB0aGVyZSBpcyBhIHByb2JsZW0g
d2l0aCB0aGUgdHJhbnNsYXRpb24uDQo+ID4gPiArLi4gaW5jbHVkZTo6IC4uL2Rpc2NsYWltZXIt
emhfQ04ucnN0DQo+ID4gPg0KPiA+ID4gLUNoaW5lc2UgbWFpbnRhaW5lcjogTGkgWWFuZyA8bGVv
eWFuZy5saUBueHAuY29tPg0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+IC0tIC1Eb2N1bWVudGF0
aW9uL2Rldi10b29scy9zcGFyc2UucnN0IOeahOS4reaWh+e/u+ivkQ0KPiA+ID4gKzpPcmlnaW5h
bDogRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvc3BhcnNlLnJzdA0KPiA+ID4NCj4gPiA+IC3lpoLm
npzmg7Por4TorrrmiJbmm7TmlrDmnKzmlofnmoTlhoXlrrnvvIzor7fnm7TmjqXogZTns7vljp/m
lofmoaPnmoTnu7TmiqTogIXjgILlpoLmnpwNCj4g5L2g5L2/DQo+ID4gPiDnlKjoi7HmlocNCj4g
PiA+IC3kuqTmtYHmnInlm7Dpmr7nmoTor53vvIzkuZ/lj6/ku6XlkJHkuK3mlofniYjnu7TmiqTo
gIXmsYLliqnjgILlpoLmnpzmnKznv7vor5Hmm7TmlrDkuI0NCj4g5Y+K5pe2DQo+ID4gPiDmiJbo
gIXnv7sNCj4gPiA+IC3or5HlrZjlnKjpl67popjvvIzor7fogZTns7vkuK3mlofniYjnu7TmiqTo
gIXjgIINCj4gPiA+ICs657+76K+ROg0KPiA+ID4NCj4gPiA+IC3kuK3mlofniYjnu7TmiqTogIXv
vJog5p2O6ZizICBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4gPiAt5Lit5paH54mI
57+76K+R6ICF77yaIOadjumYsyAgTGkgWWFuZyA8bGVveWFuZy5saUBueHAuY29tPg0KPiA+ID4g
KyBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4gPg0KPiA+ID4gKzrmoKHor5E6DQo+
ID4gPg0KPiA+ID4gLeS7peS4i+S4uuato+aWhw0KPiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiA+IC0t
DQo+ID4gPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+
ID4gPg0KPiA+ID4gLUNvcHlyaWdodCAyMDA0IExpbnVzIFRvcnZhbGRzDQo+ID4gPiAtQ29weXJp
Z2h0IDIwMDQgUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IC1Db3B5cmlnaHQgMjAwNiBCb2IN
Cj4gPiA+IENvcGVsYW5kIDxtZUBib2Jjb3BlbGFuZC5jb20+DQo+ID4gPiArLi4gX2NuX3NwYXJz
ZToNCj4gPiA+ICsNCj4gPiA+ICtTcGFyc2UNCj4gPiA+ICs9PT09PT0NCj4gPiA+ICsNCj4gPiA+
ICtTcGFyc2XmmK/kuIDkuKpD56iL5bqP55qE6K+t5LmJ5qOA5p+l5Zmo77yb5a6D5Y+v5Lul55So
5p2l5Y+R546w5YaF5qC45Luj56CB55qE5LiADQo+IOS6mw0KPiA+ID4g5r2c5Zyo6Zeu6aKY44CC
IOWFsw0KPiA+ID4gK+S6jnNwYXJzZeeahOamgui/sO+8jOivt+WPguingQ0KPiA+ID4NCj4gaHR0
cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNB
JTJGJTJGbHcNCj4gPiA+DQo+IG4ubiUyRiZhbXA7ZGF0YT0wNCU3QzAxJTdDbGVveWFuZy5saSU0
MG54cC5jb20lN0M3NzliMTE5Y2I3ODU0ODYNCj4gODA1NA0KPiA+ID4NCj4gNzA4ZDk5ZGRlMTg4
ZiU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2Mzc3MQ0KPiA0
Mzk5DQo+ID4gPg0KPiA0OTYwODE2NDYlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRSWoNCj4gb2lWMmx1TXoNCj4gPiA+DQo+IElpTENKQlRpSTZJazFoYVd3
aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9b2hTUHlLT1RaRml3QjINCj4gJTJGJQ0K
PiA+ID4gMkJEWFIyJTJCREprMWF2bzlNSlhVVkxQN3ElMkZ3JTJGSTAlM0QmYW1wO3Jlc2VydmVk
PTANCj4gPiA+DQo+IGV0JTJGQXJ0aWNsZXMlMkY2ODk5MDclMkYmYW1wO2RhdGE9MDQlN0MwMSU3
Q2xlb3lhbmcubGklNDBueHAuY29tDQo+ID4gPiAlN0MyMzNiMjU2NmUyZjc0OTI4MTY1YzA4ZDk5
ZDBjNjQ0YyU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5Yw0KPiA1YzMwDQo+ID4gPg0KPiAxNjM1
JTdDMCU3QzAlN0M2Mzc3MTM0OTg4MTQ5MjEwNDYlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXkN
Cj4gPiA+DQo+IEpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhh
V3dpTENKWFZDSTZNbjAlM0QlDQo+ID4gPg0KPiA3QzEwMDAmYW1wO3NkYXRhPTZwMkZHSWNmV24l
MkJTckNtSmFVUm9QYTFLME5zR2kwYUQ3cHNkSldEQWINCj4gPiA+IE1vJTNEJmFtcDtyZXNlcnZl
ZD0w77yb5pys5paH5qGj5YyF5ZCrDQo+ID4gPiAr5LiA5Lqb6ZKI5a+55YaF5qC455qEc3BhcnNl
5L+h5oGv44CCDQo+ID4gPiAr5YWz5LqOc3BhcnNl55qE5pu05aSa5L+h5oGv77yM5Li76KaB5piv
5YWz5LqO5a6D55qE5YaF6YOo57uT5p6E77yM5Y+v5Lul5Zyo5a6D55qE5a6YDQo+IOaWuQ0KPiA+
ID4g572R6aG15LiK5om+5Yiw77yaDQo+ID4gPg0KPiAraHR0cHM6Ly9ldXIwMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGcw0KPiA+ID4gK3Bhcg0K
PiA+ID4NCj4gc2UuZG9jcy5rZXJuZWwub3JnJTJGJmFtcDtkYXRhPTA0JTdDMDElN0NsZW95YW5n
LmxpJTQwbnhwLmNvbSU3QzIzDQo+ID4gPg0KPiAzYjI1NjZlMmY3NDkyODE2NWMwOGQ5OWQwYzY0
NGMlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSUNCj4gPiA+DQo+IDdDMCU3QzAl
N0M2Mzc3MTM0OTg4MTQ5MjEwNDYlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2kNCj4g
PiA+DQo+IE1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZD
STZNbjAlM0QlN0MxMDANCj4gPiA+DQo+IDAmYW1wO3NkYXRhPUhHZkx6TkxhRk9BS2lSMjg4bjJH
JTJGTHJkYXFlRE85VDZJY0pnYjlvMFZQdyUzRCZhDQo+ID4gPiBtcDtyZXNlcnZlZD0w44CCDQo+
ID4gPg0KPiA+ID4gIOS9v+eUqCBzcGFyc2Ug5bel5YW35YGa57G75Z6L5qOA5p+lDQo+ID4gPiAg
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiA+DQo+ID4gPiAtIl9fYml0d2lzZSIg5piv
5LiA56eN57G75Z6L5bGe5oCn77yM5omA5Lul5L2g5bqU6K+l6L+Z5qC35L2/55So5a6D77yaDQo+
ID4gPiArYGBfX2JpdHdpc2BgIOaYr+S4gOenjeexu+Wei+WxnuaAp++8jOaJgOS7peS9oOW6lOiv
pei/meagt+S9v+eUqOWugzo6DQo+ID4NCj4gPiBUeXBvLiAgX19iaXR3aXNlLg0KPiBPS++8jFRo
YW5rcyENCj4gPg0KPiA+IEJ0dywgbm90IHN1cmUgd2h5IHlvdSBhcmUgY2hhbmdpbmcgYWxsIHRo
ZSAiIGluIG9yaWdpbmFsIGRvY3VtZW50IHRvIGBgLg0KPiBzb3JyeSxJIHdpbGwgcmVjb3ZlciBi
YWNrIQ0KPiA+DQo+ID4gPg0KPiA+ID4gICAgICAgICAgdHlwZWRlZiBpbnQgX19iaXR3aXNlIHBt
X3JlcXVlc3RfdDsNCj4gPiA+DQo+ID4gPiBAQCAtMzcsMTYgKzM3LDE2IEBAIENvcHlyaWdodCAy
MDA2IEJvYiBDb3BlbGFuZA0KPiA8bWVAYm9iY29wZWxhbmQuY29tPg0KPiA+ID4gICAgICAgICAg
ICAgICAgICBQTV9SRVNVTUUgPSAoX19mb3JjZSBwbV9yZXF1ZXN0X3QpIDINCj4gPiA+ICAgICAg
ICAgIH07DQo+ID4gPg0KPiA+ID4gLei/meagt+S8muS9vyBQTV9TVVNQRU5EIOWSjCBQTV9SRVNV
TUUg5oiQ5Li65L2N5pa55byPKGJpdHdpc2Up5pW05pWwDQo+IO+8iOS9v+eUqA0KPiA+ID4gIl9f
Zm9yY2UiDQo+ID4gPiAt5piv5Zug5Li6IHNwYXJzZSDkvJrmirHmgKjmlLnlj5jkvY3mlrnlvI/n
moTnsbvlnovovazmjaLvvIzkvYbmmK/ov5nph4zmiJHku6znoa7lrp7pnIANCj4g6KaBDQo+ID4g
PiDlvLrliLbov5vooYzovawNCj4gPiA+IC3mjaLvvInjgILogIzkuJTlm6DkuLrmiYDmnInmnprk
uL7lgLzpg73kvb/nlKjkuobnm7jlkIznmoTnsbvlnovvvIzov5nph4znmoQiZW51bQ0KPiA+ID4g
cG1fcmVxdWVzdCLkuZ/lsIYNCj4gPiA+IC3kvJrkvb/nlKjpgqPkuKrnsbvlnovlgZrkuLrlupXl
sYLlrp7njrDjgIINCj4gPiA+ICvov5nmoLfkvJrkvb9QTV9TVVNQRU5E5ZKMUE1fUkVTVU1F5oiQ
5Li65L2N5pa55byPIGBgYml0d2lzZWBgIOaVtOaVsA0KPiDvvIjkvb8NCj4gPiA+IOeUqA0KPiA+
ID4gK2BgX19mb3JjZWBgIOaYr+WboOS4unNwYXJzZeS8muaKseaAqOaUueWPmOS9jeaWueW8j+ea
hOexu+Wei+i9rOaNou+8jOS9huaYr+i/memHjA0KPiDmiJHku6wNCj4gPiA+IOehruWung0KPiA+
ID4gK+mcgOimgeW8uuWItui/m+ihjOi9rOaNou+8ieOAguiAjOS4lOWboOS4uuaJgOacieaemuS4
vuWAvOmDveS9v+eUqOS6huebuOWQjOeahOexu+Wei++8jA0KPiDov5kNCj4gPiA+IOmHjOeahA0K
PiA+ID4gK2BgZW51bSBwbV9yZXF1ZXN0YGAg5Lmf5bCG5Lya5L2/55So6YKj5Liq57G75Z6L5YGa
5Li65bqV5bGC5a6e546w44CCDQo+ID4gPg0KPiA+ID4gLeiAjOS4lOS9v+eUqCBnY2Mg57yW6K+R
55qE5pe25YCZ77yM5omA5pyJ55qEIF9fYml0d2lzZS9fX2ZvcmNlIOmDveS8mua2iOWkse+8jOac
gA0KPiDlkI7lnKgNCj4gPiA+IGdjYw0KPiA+ID4gLeeci+adpeWug+S7rOWPquS4jei/h+aYr+aZ
rumAmueahOaVtOaVsOOAgg0KPiA+ID4gK+iAjOS4lOS9v+eUqGdjY+e8luivkeeahOaXtuWAme+8
jOaJgOacieeahCBgYF9fYml0d2lzZWBgIC8gYGBfX2ZvcmNlYGAg6YO95Lya5raI5aSx77yMDQo+
ID4gPiAr5pyA5ZCO5ZyoZ2Nj55yL5p2l5a6D5Lus5Y+q5LiN6L+H5piv5pmu6YCa55qE5pW05pWw
44CCDQo+ID4gPg0KPiA+ID4gLeWdpueZveadpeivtO+8jOS9oOW5tuS4jemcgOimgeS9v+eUqOae
muS4vuexu+Wei+OAguS4iumdoumCo+S6m+WunumZhemDveWPr+S7pea1k+e8qeaIkA0KPiDkuIDk
uKoNCj4gPiA+IOeJueauiueahCJpbnQNCj4gPiA+IC1fX2JpdHdpc2Ui57G75Z6L44CCDQo+ID4g
PiAr5Z2m55m95p2l6K+077yM5L2g5bm25LiN6ZyA6KaB5L2/55So5p6a5Li+57G75Z6L44CC5LiK
6Z2i6YKj5Lqb5a6e6ZmF6YO95Y+v5Lul5rWT57yp5oiQDQo+IOS4gA0KPiA+ID4g5Liq54m55q6K
55qEDQo+ID4gPiArYGBpbnRfX2JpdHdpc2VgYCDnsbvlnovjgIINCj4gPiA+DQo+ID4gPiAg5omA
5Lul5pu0566A5Y2V55qE5Yqe5rOV5Y+q6KaB6L+Z5qC35YGa77yaDQo+ID4gPg0KPiA+ID4gQEAg
LTU3LDM1ICs1Nyw1MiBAQCBfX2JpdHdpc2Ui57G75Z6L44CCDQo+ID4gPg0KPiA+ID4gIOeOsOWc
qOS9oOWwseacieS6huS4peagvOeahOexu+Wei+ajgOafpeaJgOmcgOimgeeahOaJgOacieWfuueh
gOaetuaehOOAgg0KPiA+ID4NCj4gPiA+IC3kuIDkuKrlsI/mj5DphpLvvJrluLjmlbDmlbTmlbAi
MCLmmK/nibnmrornmoTjgILkvaDlj6/ku6Xnm7TmjqXmiorluLjmlbDpm7blvZPkvZzkvY3mlrkN
Cj4g5byPDQo+ID4gPiDmlbTmlbDkvb/nlKjogIwNCj4gPiA+IC3kuI3nlKjmi4Xlv4Mgc3BhcnNl
IOS8muaKseaAqOOAgui/meaYr+WboOS4uiJiaXR3aXNlIu+8iOaBsOWmguWFtuWQje+8ieaYr+eU
qOadpeehrg0KPiDkv53kuI0NCj4gPiA+IOWQjOS9jeaWuQ0KPiA+ID4gLeW8j+exu+Wei+S4jeS8
muiiq+W8hOa3t++8iOWwj+WwvuaooeW8j++8jOWkp+WwvuaooeW8j++8jGNwdeWwvuaooeW8j++8
jOaIluiAheWFtg0KPiDku5bvvInvvIwNCj4gPiA+IOWvueS7luS7rOadpeivtA0KPiA+ID4gLeW4
uOaVsCIwIuehruWunuaYr+eJueauiueahOOAgg0KPiA+ID4gK+S4gOS4quWwj+aPkOmGku+8muW4
uOaVsOaVtOaVsCBgYDBgYCDmmK/nibnmrornmoTjgILkvaDlj6/ku6Xnm7TmjqXmiorluLjmlbDp
m7blvZPkvZzkvY0NCj4g5pa5DQo+ID4gPiDlvI/mlbTmlbDkvb/nlKjogIwNCj4gPiA+ICvkuI3n
lKjmi4Xlv4NzcGFyc2XkvJrmirHmgKjjgILov5nmmK/lm6DkuLogYGBiaXR3aXNlYGAg77yI5oGw
5aaC5YW25ZCN77yJ5piv55So5p2lDQo+IOehruS/nQ0KPiA+ID4g5LiN5ZCM5L2N5pa5DQo+ID4g
PiAr5byP57G75Z6L5LiN5Lya6KKr5byE5re377yI5bCP5bC+5qih5byP77yM5aSn5bC+5qih5byP
77yMY3B15bC+5qih5byP77yM5oiW6ICF5YW2DQo+IOS7lu+8ie+8jA0KPiA+ID4g5a+55LuW5Lus
5p2l6K+05bi45pWwDQo+ID4gPiArYGAwYGAg56Gu5a6eICrmmK8qIOeJueauiueahOOAgg0KPiA+
DQo+ID4gTm90IHN1cmUgaWYgdGhlIGl0YWxpYyBpcyBhIHN0YW5kYXJkIHdheSB0byBlbXBoYXNp
cyBpbiBDaGluZXNlLCBtYXliZSBib2xkDQo+IG1vcmUgY29tbW9uLg0KPiB5ZXMsICIq5pivKiIg
aXMgYm9sZCxUaGFua3MuDQoNCkFjY29yZGluZyB0byB0aGUgZG9jdW1lbnQgaGVyZSBodHRwczov
L3Rob21hcy1jb2tlbGFlci5pbmZvL3R1dG9yaWFscy9zcGhpbngvcmVzdF9zeW50YXguaHRtbCNp
bmxpbmUtbWFya3VwLWFuZC1zcGVjaWFsLWNoYXJhY3RlcnMtZS1nLWJvbGQtaXRhbGljLXZlcmJh
dGltDQoNClRoZSAqaXRhbGljKiBpcyBmb3IgaXRhbGljLCB3aGlsZSAqKmJvbGQqKiBpcyBmb3Ig
Ym9sZC4NCg0K
