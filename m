Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 373357D913
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 04:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfJGE02 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Oct 2019 00:26:28 -0400
Received: from mx.socionext.com ([202.248.49.38]:42902 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726889AbfJGE02 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Oct 2019 00:26:28 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 07 Oct 2019 13:26:26 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 450E0605F8;
        Mon,  7 Oct 2019 13:26:26 +0900 (JST)
Received: from 10.213.24.1 (10.213.24.1) by m-FILTER with ESMTP; Mon, 7 Oct 2019 13:26:26 +0900
Received: from SOC-EX01V.e01.socionext.com (10.213.24.21) by
 SOC-EX01V.e01.socionext.com (10.213.24.21) with Microsoft SMTP Server (TLS)
 id 15.0.995.29; Mon, 7 Oct 2019 13:26:25 +0900
Received: from SOC-EX01V.e01.socionext.com ([10.213.24.21]) by
 SOC-EX01V.e01.socionext.com ([10.213.24.21]) with mapi id 15.00.0995.028;
 Mon, 7 Oct 2019 13:26:25 +0900
From:   <yamada.masahiro@socionext.com>
To:     <adam.zerella@gmail.com>
CC:     <michal.lkml@markovi.net>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>
Subject: RE: [PATCH] Documentation: kbuild: Add document about namespaces
Thread-Topic: [PATCH] Documentation: kbuild: Add document about namespaces
Thread-Index: AQHVfLvKaUcRuTir00qxbF0t6ep77adOlJGQ
Date:   Mon, 7 Oct 2019 04:26:24 +0000
Message-ID: <a5dfd064b9c14065a5be171cb68876c7@SOC-EX01V.e01.socionext.com>
References: <20191007030319.GA32575@gmail.com>
In-Reply-To: <20191007030319.GA32575@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-securitypolicycheck: OK by SHieldMailChecker v2.5.2
x-shieldmailcheckerpolicyversion: POLICY190801
x-originating-ip: [10.213.24.1]
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgQWRhbSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBZGFtIFpl
cmVsbGEgPGFkYW0uemVyZWxsYUBnbWFpbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAw
NywgMjAxOSAxMjowMyBQTQ0KPiBDYzogWWFtYWRhLCBNYXNhaGlyby8bJEI7M0VEGyhCIBskQj8/
OTAbKEIgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPjsNCj4gTWljaGFsIE1hcmVrIDxt
aWNoYWwubGttbEBtYXJrb3ZpLm5ldD47IEpvbmF0aGFuIENvcmJldA0KPiA8Y29yYmV0QGx3bi5u
ZXQ+OyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBBZGFtIFplcmVsbGENCj4gPGFkYW0uemVy
ZWxsYUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gRG9jdW1lbnRhdGlvbjoga2J1aWxk
OiBBZGQgZG9jdW1lbnQgYWJvdXQgbmFtZXNwYWNlcw0KPiANCj4gU3BoaW54IG91dHB1dHMgdGhl
IGZvbGxvd2luZyBidWlsZCB3YXJuaW5nOg0KPiANCj4gRG9jdW1lbnRhdGlvbi9rYnVpbGQvbmFt
ZXNwYWNlcy5yc3Q6DQo+IFdBUk5JTkc6IGRvY3VtZW50IGlzbid0IGluY2x1ZGVkIGluIGFueSB0
b2N0cmVlDQoNCg0KT2gsIEkgZGlkIG5vdCBub3RpY2UgdGhpcyBmaWxlIHdhcyBhZGRlZCB0byB0
aGUga2J1aWxkIGRpcmVjdG9yeS4NCg0KSSBkbyBub3QgdW5kZXJzdGFuZCB3aHkgaXQgaXMgcmVs
YXRlZCB0byB0aGUgYnVpbGQgc3lzdGVtLg0KU28sIEknZCByYXRoZXIgaGF2ZSB0aGlzIGZpbGUg
c29tZXdoZXJlIGVsc2UuDQoNCg0KVGhhbmtzLg0KDQoNCj4gQXNzdW1pbmcgdGhpcyBkb2N1bWVu
dCBpcyBpbnRlbmRlZCB0byBiZSByZWZlcmVuY2VkIHdpdGhpbiB0aGUNCj4gZG9jdW1lbnRhdGlv
biBpdCBzaG91bGQgYmUgaW5zaWRlIHRoZSB0b2N0cmVlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QWRhbSBaZXJlbGxhIDxhZGFtLnplcmVsbGFAZ21haWwuY29tPg0KPiAtLS0NCj4gIERvY3VtZW50
YXRpb24va2J1aWxkL2luZGV4LnJzdCB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9rYnVpbGQvaW5kZXgucnN0
DQo+IGIvRG9jdW1lbnRhdGlvbi9rYnVpbGQvaW5kZXgucnN0DQo+IGluZGV4IDBmMTQ0ZmFkOTlh
Ni4uNWRkMDE5OTdjOGVkIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2tidWlsZC9pbmRl
eC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9rYnVpbGQvaW5kZXgucnN0DQo+IEBAIC0xNCw2
ICsxNCw3IEBAIEtlcm5lbCBCdWlsZCBTeXN0ZW0NCj4gICAgICBrY29uZmlnDQo+ICAgICAgbWFr
ZWZpbGVzDQo+ICAgICAgbW9kdWxlcw0KPiArICAgIG5hbWVzcGFjZXMNCj4gDQo+ICAgICAgaGVh
ZGVyc19pbnN0YWxsDQo+IA0KPiAtLQ0KPiAyLjIxLjANCg0K
