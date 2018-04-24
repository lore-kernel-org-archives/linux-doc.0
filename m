Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68BE67DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 09:28:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752928AbeDXJ2i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 05:28:38 -0400
Received: from mail-by2nam01on0065.outbound.protection.outlook.com ([104.47.34.65]:46080
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752789AbeDXJ2g (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qag8q62XLW7frtLyHNQ5a+p1OtTEj75pa44vXgflJBk=;
 b=RBYhU6sLBYqAjyOFTXP2PgPiodHA7czReowW3yEScPRJ9TNI0jW/mFOE585iWMGYnVOIOBIqarJZKMH/nrgyKAGit7UB3+L/Sp7YtdvF84ivZ0xncMS4CEQHa8bWY0W9PN/Ns4tIoxJkoIv+j5j/jhaH8qfJLPqW1taeu/kC0fQ=
Received: from SN6PR07MB4512.namprd07.prod.outlook.com (52.135.94.11) by
 SN6PR07MB4654.namprd07.prod.outlook.com (52.135.76.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.696.13; Tue, 24 Apr 2018 09:28:33 +0000
Received: from SN6PR07MB4512.namprd07.prod.outlook.com
 ([fe80::619b:e1c4:c2d0:7e98]) by SN6PR07MB4512.namprd07.prod.outlook.com
 ([fe80::619b:e1c4:c2d0:7e98%13]) with mapi id 15.20.0696.016; Tue, 24 Apr
 2018 09:28:33 +0000
From:   Alan Douglas <adouglas@cadence.com>
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "kishon@ti.com" <kishon@ti.com>,
        "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>
CC:     "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC 00/10] Adds pcitest tool support for MSI-X
Thread-Topic: [RFC 00/10] Adds pcitest tool support for MSI-X
Thread-Index: AQHT0O90yDxqCBo79kmidlAQjKomXKQPjFiggAAkLICAAAnwIA==
Date:   Tue, 24 Apr 2018 09:28:33 +0000
Message-ID: <SN6PR07MB4512656ED4FA817D3276665CD8880@SN6PR07MB4512.namprd07.prod.outlook.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
 <SN6PR07MB45123840F0C9487F1CD119A9D8880@SN6PR07MB4512.namprd07.prod.outlook.com>
 <767b50e3-8890-c241-bc97-1687bd0661c1@synopsys.com>
In-Reply-To: <767b50e3-8890-c241-bc97-1687bd0661c1@synopsys.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWRvdWdsYXNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1kYzBkMWFjMi00N2ExLTExZTgtODZlNS1mNDk2MzQ4NmY0ZWNcYW1lLXRlc3RcZGMwZDFhYzQtNDdhMS0xMWU4LTg2ZTUtZjQ5NjM0ODZmNGVjYm9keS50eHQiIHN6PSIzMzM3IiB0PSIxMzE2OTAzNTcxNTIxMzQxOTgiIGg9ImdyYTU5cFRaZ0dlRWJ0WFlHZWxvZ0kzcjI2dz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=adouglas@cadence.com; 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;SN6PR07MB4654;7:xnuYudH8zSFE/BcwMc199KaQnUQCHDrg/URHB4YI5BRPVbLBn7ecVtead7R5pw8Ws1qsjJZznGgQemcnRH5pP9JXiYscmLkLEVUHfvVb268GMRFCBkCZOPWrVusVW600B+U8uB0p5vKf20wRvXO1/vOvezMYudglPxHT127xCQqzA2aiPpqVFeF1BjGvqW430MRc3/9kREp1ETln5oFVj1WvhGrfI842yCqFAesK74Ihx141A1u2zv2hBiix2QNr;20:+R7MiOc4/jCwerZZILSvJgw//POM2qROWZJM6Lu44ZrR4YPnPo+9toTdU7iKJDmBQ8NalXYNG4o3QOjUT5tK8gFeSJO6FCht7sPBeEmpHi2BmsBlT+fr/dSmMSSlIcqUQC3NGD8MKyy3zh8s6pufURTl88bVh1xZyqKTkFbRZm3MUgRD1KHcOZDSfGIvzGPNHOVMGvPu/CIUqjrfEr/NCrN0webX122KmGkTad4IXC+gGnndOfId675CWqqh6HtS
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:SN6PR07MB4654;
x-ms-traffictypediagnostic: SN6PR07MB4654:
x-microsoft-antispam-prvs: <SN6PR07MB4654D30692123E3CA38EC7E9D8880@SN6PR07MB4654.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(788757137089);
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231232)(944501410)(52105095)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(6072148)(201708071742011);SRVR:SN6PR07MB4654;BCL:0;PCL:0;RULEID:;SRVR:SN6PR07MB4654;
x-forefront-prvs: 0652EA5565
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(366004)(39860400002)(39380400002)(396003)(189003)(199004)(51444003)(36092001)(3280700002)(2501003)(102836004)(81156014)(59450400001)(6306002)(6506007)(6436002)(966005)(74316002)(53546011)(7416002)(26005)(55016002)(4326008)(316002)(99286004)(186003)(2906002)(5250100002)(6246003)(25786009)(14454004)(305945005)(33656002)(478600001)(7696005)(446003)(76176011)(106356001)(66066001)(68736007)(7736002)(2201001)(5660300001)(8676002)(9686003)(8936002)(105586002)(6116002)(229853002)(39060400002)(53936002)(2900100001)(81166006)(11346002)(3660700001)(476003)(110136005)(486006)(97736004)(54906003)(86362001)(3846002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR07MB4654;H:SN6PR07MB4512.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: LtmD+t/p6syTOU0BjhZFMbw6YOgF1fIkKpiYTiqaIduxNzM/LKMu9x2ZPPj8E0m6Xwwm2fmJhkGwbC2nF886PeayfTpmtbGoatUwPOVI7ldJrAb6AochZup/qJSPzDCCo9CrY3rIEpahr91AR/QdvkwnQfUKeHkUPBKkxVScncjnTQ9NlqG+KYkBWcewfLBW+Um9feD9+6bTxXFFivFj2A==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 071df651-d61a-479f-7b0f-08d5a9c5bfeb
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071df651-d61a-479f-7b0f-08d5a9c5bfeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2018 09:28:33.5231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4654
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gMjQgQXByaWwgMjAxOCAwOTo1MCwgR3VzdGF2byBQaW1lbnRlbCB3cm90ZToNCj4gSGkgQWxh
biwNCj4gDQo+IE9uIDI0LzA0LzIwMTggMDc6NDgsIEFsYW4gRG91Z2xhcyB3cm90ZToNCj4gPiBI
aSBHdXN0YXZvLA0KPiA+DQo+ID4gT24gMTAgQXByaWwgMjAxOCAxODoxNSBHdXN0YXZvIFBpbWVu
dGVsIHdyb3RlOg0KPiA+PiAgaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvNC8xMC80MjENCj4g
Pj4gIFRoaXMgc2VyaWVzIGFpbXMgdG8gYWRkIHBjaXRlc3QgdG9vbCBzdXBwb3J0IGZvciBNU0kt
WC4NCj4gPj4gSW5jbHVkZXMgbmV3IGNhbGxiYWNrcyBtZXRob2RzIGFuZCBoYW5kbGVycyB0byB0
cmlnZ2VyIHRoZSBNU0ktWA0KPiA+PiBpbnRlcnJ1cHRpb25zIG9uIHRoZSBFUCBEZXNpZ253YXJl
IElQIGRyaXZlci4NCj4gPj4NCj4gPj4gUHJvdmlkZXMgbmV3IG1ldGhvZHMgb24gcGNpX2VwZl90
ZXN0IGRyaXZlciB0aGF0IGFsbG93cyB0byBzZXQvZ2V0IEVQDQo+ID4+IG1heGltdW0gbnVtYmVy
IG9mIE1TSS1YIGVudHJpZXMgKHNpbWlsYXIgdG8gc2V0L2dldCBNU0kgbWV0aG9kcykuDQo+ID4+
DQo+ID4+IFJld29ya3Mgb24gTVNJIHNldC9nZXQgYW5kIHRyaWdnZXJpbmcgbWV0aG9kcyBvbiBF
UCBEZXNpZ253YXJlIElQDQo+ID4+IGRyaXZlciB0byBiZSBtb3JlIGdlbmVyaWMgYW5kIGZsZXhp
YmxlLg0KPiA+Pg0KPiA+PiBBZGRzIGEgbmV3IGlucHV0IHBhcmFtZXRlciAobXNpeCkgYW5kIHJl
cGxpY2F0ZXMgdGhlIHdob2xlIE1TSQ0KPiA+PiBtZWNoYW5pc20gYXBwbGllZCB0byB0aGUgTVNJ
LVggZmVhdHVyZSBvbiBwY2l0ZXN0IHRvb2wuIEFsc28gdXBkYXRlcw0KPiA+PiB0aGUgcGNpdGVz
dCBzY3JpcHQgd2l0aCB0aGUgbmV3IHRlc3Qgc2V0IGFwcGxpZWQgdG8gdGhpcyBuZXcgZmVhdHVy
ZS4NCj4gPj4NCj4gPj4gR3VzdGF2byBQaW1lbnRlbCAoMTApOg0KPiA+PiAgIFBDSTogZHdjOiBB
ZGQgTVNJLVggY2FsbGJhY2tzIGhhbmRsZXINCj4gPj4gICBQQ0k6IGNhZGVuY2U6IFVwZGF0ZSBj
ZG5zX3BjaWVfZXBfcmFpc2VfaXJxIGZ1bmN0aW9uIHNpZ25hdHVyZQ0KPiA+PiAgIFBDSTogZW5k
cG9pbnQ6IEFkZCBNU0ktWCBpbnRlcmZhY2VzDQo+ID4+ICAgUENJOiBkd2M6IE1TSSBjYWxsYmFj
a3MgaGFuZGxlciByZXdvcmsNCj4gPj4gICBQQ0k6IGR3YzogQWRkIGxlZ2FjeSBpbnRlcnJ1cHQg
Y2FsbGJhY2sgaGFuZGxlcg0KPiA+PiAgIG1pc2M6IHBjaV9lbmRwb2ludF90ZXN0OiBBZGQgTVNJ
LVggc3VwcG9ydA0KPiA+PiAgIG1pc2M6IHBjaV9lbmRwb2ludF90ZXN0OiBSZXBsYWNlIGxvd2Vy
IGludG8gdXBwZXIgY2FzZSBjaGFyYWN0ZXJzDQo+ID4+ICAgUENJOiBlbmRwb2ludDogZnVuY3Rp
b25zL3BjaS1lcGYtdGVzdDogQWRkIE1TSS1YIHN1cHBvcnQNCj4gPj4gICBQQ0k6IGVuZHBvaW50
OiBmdW5jdGlvbnMvcGNpLWVwZi10ZXN0OiBSZXBsYWNlIGxvd2VyIGludG8gdXBwZXIgY2FzZQ0K
PiA+PiAgICAgY2hhcmFjdGVycw0KPiA+PiAgIHRvb2xzOiBQQ0k6IEFkZCBNU0ktWCBzdXBwb3J0
DQo+ID4+DQo+ID4+ICBEb2N1bWVudGF0aW9uL21pc2MtZGV2aWNlcy9wY2ktZW5kcG9pbnQtdGVz
dC50eHQgfCAgIDMgKw0KPiA+PiAgZHJpdmVycy9taXNjL3BjaV9lbmRwb2ludF90ZXN0LmMgICAg
ICAgICAgICAgICAgIHwgMTIwICsrKysrKysrKystLS0tDQo+ID4+ICBkcml2ZXJzL3BjaS9jYWRl
bmNlL3BjaWUtY2FkZW5jZS1lcC5jICAgICAgICAgICAgfCAgIDIgKy0NCj4gPj4gIGRyaXZlcnMv
cGNpL2R3Yy9wY2ktZHJhN3h4LmMgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiA+PiAg
ZHJpdmVycy9wY2kvZHdjL3BjaWUtYXJ0cGVjNi5jICAgICAgICAgICAgICAgICAgIHwgICAyICst
DQo+ID4+ICBkcml2ZXJzL3BjaS9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMgICAgICAgICAgICAg
fCAyMDENCj4gPj4gKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPj4gIGRyaXZlcnMvcGNpL2R3
Yy9wY2llLWRlc2lnbndhcmUtcGxhdC5jICAgICAgICAgICB8ICAgOSArLQ0KPiA+PiAgZHJpdmVy
cy9wY2kvZHdjL3BjaWUtZGVzaWdud2FyZS5oICAgICAgICAgICAgICAgIHwgIDQwICsrKy0tDQo+
ID4+ICBkcml2ZXJzL3BjaS9lbmRwb2ludC9mdW5jdGlvbnMvcGNpLWVwZi10ZXN0LmMgICAgfCAx
MTMgKysrKysrKysrLS0tLQ0KPiA+PiAgZHJpdmVycy9wY2kvZW5kcG9pbnQvcGNpLWVwLWNmcy5j
ICAgICAgICAgICAgICAgIHwgIDI0ICsrKw0KPiA+PiAgZHJpdmVycy9wY2kvZW5kcG9pbnQvcGNp
LWVwYy1jb3JlLmMgICAgICAgICAgICAgIHwgIDYwICsrKysrKy0NCj4gPj4gIGluY2x1ZGUvbGlu
dXgvcGNpLWVwYy5oICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArLQ0KPiA+PiAgaW5j
bHVkZS9saW51eC9wY2ktZXBmLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4g
Pj4gIGluY2x1ZGUvdWFwaS9saW51eC9wY2l0ZXN0LmggICAgICAgICAgICAgICAgICAgICB8ICAg
MSArDQo+ID4+ICB0b29scy9wY2kvcGNpdGVzdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTggKy0NCj4gPj4gIHRvb2xzL3BjaS9wY2l0ZXN0LnNoICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyNSArKysNCj4gPj4gIDE2IGZpbGVzIGNoYW5nZWQsIDUyOCBpbnNlcnRp
b25zKCspLCAxMDQgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuNy40DQo+ID4+
DQo+ID4gTmljZSBzZXQgb2YgcGF0Y2hlcy4gIEkgaGF2ZSB0ZXN0ZWQgdGhpcyB3aXRoIHRoZSBD
YWRlbmNlIEVQIGRyaXZlciBhZnRlcg0KPiBhZGRpbmcgTVNJLVggc3VwcG9ydCwgYW5kIGZvdW5k
IGEgZmV3IGNoYW5nZXMgcmVxdWlyZWQuDQo+ID4gSSB3aWxsIHNlbmQgeW91IGNvbW1lbnRzLg0K
PiANCj4gT2ssIGdyZWF0IG5ld3MhDQo+IA0KPiBNYXliZSBhZnRlciB0aGlzIHBhdGNoIHNlcmll
cyBzdWJtaXNzaW9uIHdlIGNvdWxkIHN0YXJ0IGEgbmV3IHRocmVhZCBhYm91dA0KPiBuZXcgZmVh
dHVyZXMgdGhhdCBjb3VsZCBiZSB0ZXN0ZWQvdmVyaWZpZWQgdXNpbmcgcGNpdGVzdC4gSSB0aGlu
ayB0aGlzIGNvdWxkIGJlDQo+IGhlbHBmdWwgZm9yIGV2ZXJ5Ym9keS4NCj4gDQpHcmVhdCwgSSB0
aGluayB0aGF0IHdvdWxkIGRlZmluaXRlbHkgYmUgb2YgYmVuZWZpdC4NCj4gPg0KPiA+IFRoYW5r
cywNCj4gPiBBbGFuDQo+ID4NCj4gDQo+IFRoYW5rcywNCj4gR3VzdGF2bw0KVGhhbmtzLA0KQWxh
bg0KDQoNCg==
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
