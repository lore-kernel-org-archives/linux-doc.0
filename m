Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D9AC43464
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 04:22:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9A272076A
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 04:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgIREWg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 00:22:36 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3608 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726117AbgIREWf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Sep 2020 00:22:35 -0400
Received: from dggeme762-chm.china.huawei.com (unknown [172.30.72.56])
        by Forcepoint Email with ESMTP id 71C61E7FC19F8D3FF83D;
        Fri, 18 Sep 2020 12:22:33 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 18 Sep 2020 12:22:33 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Fri, 18 Sep 2020 12:22:33 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        "tiantao (H)" <tiantao6@hisilicon.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "anton@enomsg.org" <anton@enomsg.org>,
        "ccross@android.com" <ccross@android.com>,
        "tony.luck@intel.com" <tony.luck@intel.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "bp@suse.de" <bp@suse.de>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "pawan.kumar.gupta@linux.intel.com" 
        <pawan.kumar.gupta@linux.intel.com>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "gpiccoli@canonical.com" <gpiccoli@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH] Documentation: arm64 supports cma
Thread-Topic: [PATCH] Documentation: arm64 supports cma
Thread-Index: AQHWjWplVrE+Ci8vAk+SKjBjOwg7mqltueLQ//+FqgCAAIs9wA==
Date:   Fri, 18 Sep 2020 04:22:33 +0000
Message-ID: <cb0c08c6f4c645c1be176a96d9b2124f@hisilicon.com>
References: <1600398953-55893-1-git-send-email-tiantao6@hisilicon.com>
 <ba0827edbdb54d4da445107afa80f3de@hisilicon.com>
 <bfecb650-aa00-27bc-9859-d6b1ed168f7a@infradead.org>
In-Reply-To: <bfecb650-aa00-27bc-9859-d6b1ed168f7a@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.98]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuZHkgRHVubGFwIFtt
YWlsdG86cmR1bmxhcEBpbmZyYWRlYWQub3JnXQ0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAx
OCwgMjAyMCA0OjAwIFBNDQo+IFRvOiBTb25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpIDxzb25nLmJh
by5odWFAaGlzaWxpY29uLmNvbT47IHRpYW50YW8gKEgpDQo+IDx0aWFudGFvNkBoaXNpbGljb24u
Y29tPjsgY29yYmV0QGx3bi5uZXQ7IGtlZXNjb29rQGNocm9taXVtLm9yZzsNCj4gYW50b25AZW5v
bXNnLm9yZzsgY2Nyb3NzQGFuZHJvaWQuY29tOyB0b255Lmx1Y2tAaW50ZWwuY29tOw0KPiBwYXVs
bWNrQGtlcm5lbC5vcmc7IHRnbHhAbGludXRyb25peC5kZTsgYWtwbUBsaW51eC1mb3VuZGF0aW9u
Lm9yZzsNCj4gYnBAc3VzZS5kZTsgbWNoZWhhYitodWF3ZWlAa2VybmVsLm9yZzsNCj4gcGF3YW4u
a3VtYXIuZ3VwdGFAbGludXguaW50ZWwuY29tOyBtaWtlLmtyYXZldHpAb3JhY2xlLmNvbTsNCj4g
b25ldWt1bUBzdXNlLmNvbTsgZ3BpY2NvbGlAY2Fub25pY2FsLmNvbTsgbGludXgtZG9jQHZnZXIu
a2VybmVsLm9yZw0KPiBDYzogTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIERvY3VtZW50YXRpb246IGFybTY0IHN1cHBvcnRzIGNtYQ0KPiANCj4g
T24gOS8xNy8yMCA4OjI4IFBNLCBTb25nIEJhbyBIdWEgKEJhcnJ5IFNvbmcpIHdyb3RlOg0KPiA+
DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogVGlhbiBU
YW8gW21haWx0bzp0aWFudGFvNkBoaXNpbGljb24uY29tXQ0KPiA+PiBTZW50OiBGcmlkYXksIFNl
cHRlbWJlciAxOCwgMjAyMCAzOjE2IFBNDQo+ID4+IFRvOiBjb3JiZXRAbHduLm5ldDsga2Vlc2Nv
b2tAY2hyb21pdW0ub3JnOyBhbnRvbkBlbm9tc2cub3JnOw0KPiA+PiBjY3Jvc3NAYW5kcm9pZC5j
b207IHRvbnkubHVja0BpbnRlbC5jb207IHBhdWxtY2tAa2VybmVsLm9yZzsNCj4gPj4gdGdseEBs
aW51dHJvbml4LmRlOyBha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnOyBicEBzdXNlLmRlOw0KPiA+
PiBtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3JnOyBwYXdhbi5rdW1hci5ndXB0YUBsaW51eC5pbnRl
bC5jb207DQo+ID4+IHJkdW5sYXBAaW5mcmFkZWFkLm9yZzsgbWlrZS5rcmF2ZXR6QG9yYWNsZS5j
b207IG9uZXVrdW1Ac3VzZS5jb207DQo+ID4+IGdwaWNjb2xpQGNhbm9uaWNhbC5jb207IGxpbnV4
LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gQ2M6IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWku
Y29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0hdIERvY3VtZW50YXRpb246IGFybTY0IHN1cHBvcnRz
IGNtYQ0KPiA+Pg0KPiA+PiBhcm02NCBhbHNvIHN1cHBvcnRzIGNtYSwgdXBkYXRlZCBkb2N1bWVu
dGF0aW9uLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlz
aWxpY29uLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dCB8IDIgKy0NCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCj4gPj4gYi9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiA+PiBpbmRleCA3ZWJlM2Jl
Li4zOGExNjAyIDEwMDY0NA0KPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRl
L2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiA+PiBAQCAtNTkxLDcgKzU5MSw3IEBADQo+ID4+ICAJ
CQlzb21lIGNyaXRpY2FsIGJpdHMuDQo+ID4+DQo+ID4+ICAJY21hPW5uW01HXUBbc3RhcnRbTUdd
Wy1lbmRbTUddXV0NCj4gPj4gLQkJCVtBUk0sWDg2LEtOTF0NCj4gPj4gKwkJCVtBUk0sQVJNNjQs
WDg2LEtOTF0NCj4gPg0KPiA+IFllcy4gSXQgc3VwcG9ydHMgQVJNNjQuIE9uIHRoZSBvdGhlciBo
YW5kLCBpdCBhbHNvIHN1cHBvcnRzIG90aGVyDQo+IGFyY2hpdGVjdHVyZXMgbGlrZQ0KPiA+IE1J
UFMNCj4gPiBTMzkwDQo+ID4gTUlDUk9CTEFaRQ0KPiA+IC4uLg0KPiA+IFNvIEkgYW0gbm90IHN1
cmUgaWYgaXQgaXMgYSBjb21wbGV0ZWx5IGNvcnJlY3QgZml4Lg0KPiA+DQo+ID4gQ01BIG9ubHkg
ZGVwZW5kcyBvbiBNTVUuIEl0IHByb2JhYmx5IGRvZXNuJ3QgZGVwZW5kIG9uIGFyY2ggdG9vIG11
Y2guDQo+ID4NCj4gPiBJcyBpdCBiZXR0ZXIgdG8ganVzdCBtb3ZlIHRvIFtLTkxdPw0KPiANCj4g
SG93IGFib3V0IFtLTkwsQ01BXT8gIENNQSBpcyBhbHJlYWR5IGxpc3RlZCBhcyBhIGJ1aWxkIG9w
dGlvbi9yZXN0cmljdGlvbg0KPiBpbiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnJzdC4NCg0KU291bmRzIGdvb2QgdG8gbWUuDQoNCj4gDQo+ID4NCj4gPj4gIAkJ
CVNldHMgdGhlIHNpemUgb2Yga2VybmVsIGdsb2JhbCBtZW1vcnkgYXJlYSBmb3INCj4gPj4gIAkJ
CWNvbnRpZ3VvdXMgbWVtb3J5IGFsbG9jYXRpb25zIGFuZCBvcHRpb25hbGx5IHRoZQ0KPiA+PiAg
CQkJcGxhY2VtZW50IGNvbnN0cmFpbnQgYnkgdGhlIHBoeXNpY2FsIGFkZHJlc3MgcmFuZ2Ugb2YN
Cj4gPj4gLS0NCj4gDQoNClRoYW5rcy4NCkJhcnJ5DQo=
