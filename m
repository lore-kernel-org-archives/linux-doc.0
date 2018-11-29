Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6FB7C7D8A4
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 16:26:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbeK3Dcv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 22:32:51 -0500
Received: from mail-eopbgr720079.outbound.protection.outlook.com ([40.107.72.79]:18195
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728562AbeK3Dcv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Nov 2018 22:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILM2XTs2j/KesQFu34MFR0xHBbTVy5zOa5ojDLaMytc=;
 b=l8Ryk+jeHb30eZxXxMEIVUGPlOlFZcs7j+VQoviu25qHyra7RoFEwuIYYhBNhIMsGrO5RKOvqWlyU76ERx5hsgO4rUGae8pxrPS/1TuJeK1WHZ+/dW2x3cy/FOgBnURrPu2NM0G4Ielhh5h09qqOn6mu6YbDHzIElksw7LSVDiU=
Received: from BN6PR12MB1714.namprd12.prod.outlook.com (10.175.101.11) by
 BN6PR12MB1186.namprd12.prod.outlook.com (10.168.227.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.18; Thu, 29 Nov 2018 16:26:48 +0000
Received: from BN6PR12MB1714.namprd12.prod.outlook.com
 ([fe80::f8a7:157:6224:34ee]) by BN6PR12MB1714.namprd12.prod.outlook.com
 ([fe80::f8a7:157:6224:34ee%2]) with mapi id 15.20.1361.019; Thu, 29 Nov 2018
 16:26:48 +0000
From:   "Koenig, Christian" <Christian.Koenig@amd.com>
To:     Sean Paul <sean@poorly.run>
CC:     Jonathan Corbet <corbet@lwn.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dave Airlie <airlied@linux.ie>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Huang, Ray" <Ray.Huang@amd.com>,
        Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Zhang, Jerry" <Jerry.Zhang@amd.com>
Subject: Re: [PATCH] Documentation: drm: Remove dangling pointer from
 drm-mm.rst
Thread-Topic: [PATCH] Documentation: drm: Remove dangling pointer from
 drm-mm.rst
Thread-Index: AQHUh/vyHpVvFObtCUa0zx60nG8HXKVm6JiAgAAD3ACAAADfgIAAAfSAgAABXgA=
Date:   Thu, 29 Nov 2018 16:26:48 +0000
Message-ID: <e84d85d3-f3e7-7269-1f46-695807224c52@amd.com>
References: <20181129155522.33749-1-sean@poorly.run>
 <1e62c728-3bee-fa29-82fd-449fcb77bab7@amd.com>
 <CAMavQKLVipXjNEycU9SXNEM3imdHco2nMh0sLxVdnO9zqHdd9Q@mail.gmail.com>
 <5876d520-021d-47ad-b9d1-0938d154ca18@gmail.com>
 <CAMavQKLJ-ZD51oYzEzwFMHrRnM0hsLAaAayijphfat9w73rbJQ@mail.gmail.com>
In-Reply-To: <CAMavQKLJ-ZD51oYzEzwFMHrRnM0hsLAaAayijphfat9w73rbJQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
x-originating-ip: [2a02:908:125b:9a00:a142:2be6:b7be:5a3a]
x-clientproxiedby: AM6P194CA0013.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::26) To BN6PR12MB1714.namprd12.prod.outlook.com
 (2603:10b6:404:106::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;BN6PR12MB1186;20:U1M0LD+s4hXnipSNS+6nuVix1RFkms0HYMmdSOKLWQIVY87C7uivpQrFA6/FqcQ0gVnWURqg8WPRReYpc+woOKyTzaAJwDjXs9+ILqAihrHvFa1+hmOJ2/mU/YEv0lcR9uvUzz+eEC21+DbejKcvHOdC9nnJiwMP3/ZBV4ldHCep4W9mjpC7mG2eCZi8agu1KqTZFoKiikvWygGzL4ExdrKxDznVk0zUIXSnQgj5DyFLIsXFUcgd15GNWCB/nJEi
x-ms-office365-filtering-correlation-id: e384d021-2baa-467c-ab08-08d6561775f5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:BN6PR12MB1186;
x-ms-traffictypediagnostic: BN6PR12MB1186:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-microsoft-antispam-prvs: <BN6PR12MB1186B3DC7651868C3A82886583D20@BN6PR12MB1186.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231453)(999002)(944501447)(52105112)(10201501046)(93006095)(93001095)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:BN6PR12MB1186;BCL:0;PCL:0;RULEID:;SRVR:BN6PR12MB1186;
x-forefront-prvs: 0871917CDA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(346002)(366004)(396003)(39860400002)(189003)(199004)(51914003)(25786009)(86362001)(53936002)(6306002)(575784001)(36756003)(6246003)(97736004)(93886005)(54906003)(966005)(478600001)(31696002)(6512007)(14454004)(256004)(72206003)(58126008)(316002)(64126003)(53546011)(6506007)(102836004)(386003)(7736002)(65956001)(65806001)(305945005)(186003)(71190400001)(71200400001)(46003)(99286004)(65826007)(52116002)(2616005)(11346002)(76176011)(5660300001)(446003)(105586002)(8676002)(476003)(81156014)(81166006)(4326008)(106356001)(8936002)(486006)(31686004)(6486002)(6916009)(229853002)(6436002)(2906002)(6116002)(68736007);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR12MB1186;H:BN6PR12MB1714.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: I34QxbhjVUs+Ny9rf9yJi33mcXfaevnCfS58Wqj/FzEzFJ9SMJCP4HvU5v0RfpRomLqu2M/aScksfXxwSIcLl9lKjSp7MUaAhOiPzITx9qDdKTm8xH9J7RGluv6zJCMWZHfAYLwdXuLROgGEOUA1huTE3UoNFGoEopGWvYFSZKMCLOxhInkCwIRqBE9goPZi5LWgUiMPn2Oy00BdL4awPcatPMkhU3po+tzaNJk0nmo+sGKXH/C4+/v8dApEgkY1Rm1MBqNAkVYxIYGenHDqi5D7rX8MBmB5g47g5hOQ9z8va+zNoLpiiJdo++amUxmGgmMDCy6mDizGcwvn7JZnwzoIrneW8/FA8zh4t1cd698=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BC4B2AB18E73E4C980282285CBFF5D5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e384d021-2baa-467c-ab08-08d6561775f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2018 16:26:48.5216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1186
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

QW0gMjkuMTEuMTggdW0gMTc6MjEgc2NocmllYiBTZWFuIFBhdWw6DQo+IE9uIFRodSwgTm92IDI5
LCAyMDE4IGF0IDExOjE0IEFNIENocmlzdGlhbiBLw7ZuaWcNCj4gPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPiB3cm90ZToNCj4+IEFtIDI5LjExLjE4IHVtIDE3OjExIHNjaHJpZWIg
U2VhbiBQYXVsOg0KPj4+IE9uIFRodSwgTm92IDI5LCAyMDE4IGF0IDEwOjU4IEFNIEtvZW5pZywg
Q2hyaXN0aWFuDQo+Pj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6DQo+Pj4+IEFt
IDI5LjExLjE4IHVtIDE2OjU1IHNjaHJpZWIgU2VhbiBQYXVsOg0KPj4+Pj4gRnJvbTogU2VhbiBQ
YXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+DQo+Pj4+Pg0KPj4+Pj4gRml4ZXMgaHRtbGRvY3Mg
YnVpbGQgZXJyb3I6DQo+Pj4+PiBFcnJvcjogQ2Fubm90IG9wZW4gZmlsZSAuLi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dsb2JhbC5jDQo+Pj4+Pg0KPj4+Pj4gRml4ZXM6IDJiYjQyNDEwYjFiZCAoImRy
bTogUmVtb3ZlIGRybV9nbG9iYWwue2MsaH0gdjIiKQ0KPj4+Pj4gQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+Pj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+Pj4+IENjOiBKdW53ZWkgWmhhbmcgPEplcnJ5Llpo
YW5nQGFtZC5jb20+DQo+Pj4+PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPg0KPj4+Pj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+DQo+Pj4+PiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBi
b290bGluLmNvbT4NCj4+Pj4+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4NCj4+Pj4+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+DQo+Pj4+PiBDYzogQ2hyaXN0aWFu
IEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4+Pj4gQ2M6IEh1YW5nIFJ1aSA8
cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5v
cmc+DQo+Pj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+DQo+Pj4+DQo+Pj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBQZXJoYXBzIHRoZSBi
ZXN0IGNvdXJzZSBvZiBhY3Rpb24gZm9yIHRoaXMNCj4+PiBwYXRjaCBpcyB0byBoYXZlIERhdmUg
cGljayBpdCBkaXJlY3RseSBhbmQgdGhlbiB3ZSBjYW4gYmFja21lcmdlIGl0DQo+Pj4gaW50byBh
bWRncHUvZHJtLW1pc2MtbmV4dCBmcm9tIHRoZXJlPyBJIGNvdWxkIGFsc28gc3BpbiBhIHRvcGlj
IGJyYW5jaA0KPj4+IHRoYXQgd2UgY291bGQgYWxsIG1lcmdlLg0KPj4+DQo+Pj4gVGhvdWdodHM/
DQo+PiBNeSBwcmVmZXJlbmNlIGlzIHRoYXQgSSBwaWNrIGl0IHVwIGFuZCBwdXNoIGl0IHRvIERh
dmUgdGhyb3VnaCBBbGV4DQo+PiBmaXhlcyBwdXNoLg0KPj4NCj4+IEJ1dCBqdXN0IGJlY2F1c2Ug
dGhlIHBhdGNoIHdoaWNoIGJyb2tlIHRoaXMgY2FtZSB0aGUgc2FtZSB3YXkgYXMgd2VsbC4NCj4+
DQo+IFllYWgsIHVuZm9ydHVuYXRlbHkgaXQncyBwcm9saWZlcmF0ZWQsIGFuZCBJJ2QgcmF0aGVy
IG5vdCBhZGQgaG9wcyB0bw0KPiBnZXR0aW5nIGRybS1taXNjLW5leHQgZml4ZWQuIExldCdzIGp1
c3QgZG8gYSB0b3BpYyBicmFuY2ggYW5kIHNldCBhIFBSDQo+IHRvIERhdmUgZnJvbSB0aGF0LiBX
ZSBjYW4gYm90aCBtZXJnZSB0aGUgdG9waWMgYnJhbmNoIGFzYXAgYW5kIGxldA0KPiBEYXZlIHBp
Y2sgaXQgdXAgYXQgaGlzIGxlaXN1cmUuDQoNCldvcmtzIGZvciBtZSBhcyB3ZWxsLA0KQ2hyaXN0
aWFuLg0KDQo+DQo+IFNlYW4NCj4NCj4+IEVpdGhlciB3YXkgd29ya3MgZm9yIG1lLA0KPj4gQ2hy
aXN0aWFuLg0KPj4NCj4+PiBTZWFuDQo+Pj4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICAgIERvY3VtZW50
YXRpb24vZ3B1L2RybS1tbS5yc3QgfCAzIC0tLQ0KPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAz
IGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dw
dS9kcm0tbW0ucnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLW1tLnJzdA0KPj4+Pj4gaW5kZXgg
ZDBmM2M2YjAzMjAwOS4uNTRhNjk2ZDk2MWE3YyAxMDA2NDQNCj4+Pj4+IC0tLSBhL0RvY3VtZW50
YXRpb24vZ3B1L2RybS1tbS5yc3QNCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1t
bS5yc3QNCj4+Pj4+IEBAIC03OSw5ICs3OSw2IEBAIGNvdW50IGZvciB0aGUgVFRNLCB3aGljaCB3
aWxsIGNhbGwgeW91ciBpbml0aWFsaXphdGlvbiBmdW5jdGlvbi4NCj4+Pj4+DQo+Pj4+PiAgICAg
U2VlIHRoZSByYWRlb25fdHRtLmMgZmlsZSBmb3IgYW4gZXhhbXBsZSBvZiB1c2FnZS4NCj4+Pj4+
DQo+Pj4+PiAtLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2xvYmFsLmMNCj4+
Pj4+IC0gICA6ZXhwb3J0Og0KPj4+Pj4gLQ0KPj4+Pj4NCj4+Pj4+ICAgICBUaGUgR3JhcGhpY3Mg
RXhlY3V0aW9uIE1hbmFnZXIgKEdFTSkNCj4+Pj4+ICAgICA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0NCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+PiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCg0K
