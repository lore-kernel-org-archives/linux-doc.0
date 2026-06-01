Received: from outbound.baidu.com (mx22.baidu.com [220.181.50.185])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 93E5D1A6839;
	Mon,  1 Jun 2026 01:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780277325; cv=none; b=WEaeNJRDf0PUcoqQ1K8RdjGBzM51GVnavEZN5n7LObD8A6ysizFBGj2s9eBdGDjpRLzGPPKzZN4D6UHZr+qzrbF1dobY41lV6ERlaaM4phWYh/26/TsWVP4bJzasZoCfUM97+FPhE8f6XsEWx/2Q22smgEgwyn1WAU9Tif54+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780277325; c=relaxed/simple;
	bh=k3N3V29pMushKp1K2JrVyDY0/Gr3rXOOVNFYfNNJgcQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qKjzt5siRicejTTWtwBe6YRY1jrQ5+fnHvDmR93obyxKOSYB5TeKjn/Bf+RkDfxPBAEdq4Z+9epea+xCm3zXKTy/GioXEr0oGrTx/ZZL22So7b1sFejDlEIWhXcVDBAQj89tDgNuZAMpBLKYLTKIQFLXITYjOVkBDd12CUY+fyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=dyvmkW95; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="dyvmkW95"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.3.12
From: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Usama Arif
	<usama.arif@linux.dev>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Hao
 Li" <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes
	<rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlOWkjTogW+WklumDqOmCruS7tl0gUmU6IFtQ?=
 =?utf-8?B?QVRDSF0gbW0vbWVtcG9vbDogdXNlIHN0YXRpYyBrZXkgZm9yIGJvb3QtdGlt?=
 =?utf-8?Q?e_debug_enablement?=
Thread-Topic: =?utf-8?B?562U5aSNOiDnrZTlpI06IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdIG1t?=
 =?utf-8?B?L21lbXBvb2w6IHVzZSBzdGF0aWMga2V5IGZvciBib290LXRpbWUgZGVidWcg?=
 =?utf-8?Q?enablement?=
Thread-Index: AQHc7cYaHc/KlS0U5Emb14FdSgycW7YhUMwAgAFsxkD///uqgIAAiCNA//+gpYCAAVpxgIAEs1yw
Date: Mon, 1 Jun 2026 01:28:15 +0000
Message-ID: <d22239c31657481483e25ab347231d53@baidu.com>
References: <20260527104634.2434-1-lirongqing@baidu.com>
 <20260527130337.983366-1-usama.arif@linux.dev>
 <fcf5585aba18414cbd0ab01935eeb1df@baidu.com>
 <ddb499d5-6821-4fa7-9fec-563bdfbc8cbc@linux.dev>
 <b9d53cb0be024778b09e1bb1ef7d0211@baidu.com>
 <6ca2af4a-90ed-4d7e-9c21-42ebffddc3fe@linux.dev>
 <2c1b8eff-f613-4407-b5f3-4d8b12d34321@kernel.org>
In-Reply-To: <2c1b8eff-f613-4407-b5f3-4d8b12d34321@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1780277311;
	bh=k3N3V29pMushKp1K2JrVyDY0/Gr3rXOOVNFYfNNJgcQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=dyvmkW95/WsqhKTa8BRyIlmTTB8XEQhAxR4ZX+3oJa+FFm+swdA6otXUkK13fINLw
	 vy/+ACn1fTL1caLmd3/RLSJgyjNZDV7nmwfqstagoZsGv09S42fQ4vxo0LGx69L+ct
	 PoEJ2tlUZIf5evv93Uq6vVYVksbbGRTF1QdN+FdrfqMDSVaZV6sJPSIj1MdmzHDorK
	 RaPOm1ID6MTKHnjwHZVZSaIGHmYt4G2F3N0MlY+hVDqdMWbXeb6GqX9AAchmHmOqvj
	 VUm2B1YETwPpTBK3rOLczOXMpSa3mtEt2YGmKfW1nR/m45531zcrz5CDCziUH+bYjG
	 CRFvzgk9e0KFA==

PiBPbiA1LzI4LzI2IDE0OjU5LCBVc2FtYSBBcmlmIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiBPbiAy
OC8wNS8yMDI2IDExOjUwLCBMaSxSb25ncWluZyhBQ0cgQ0NOKSB3cm90ZToNCj4gPj4NCj4gPj4N
Cj4gPj4+DQo+ID4+PiBPbiAyOC8wNS8yMDI2IDA0OjAwLCBMaSxSb25ncWluZyhBQ0cgQ0NOKSB3
cm90ZToNCj4gPj4+DQo+ID4+PiBJIHRoaW5rIDMyIGJpdCBBUk0gZG9lc250Pw0KPiA+Pg0KPiA+
PiBZb3UgYXJlIHJpZ2h0LCAzMi1iaXQgQVJNIGRvZXNuJ3QuDQo+ID4+DQo+ID4+IEhvd2V2ZXIs
IHRoZSBjb3JyZWN0IGFyY2hpdGVjdHVyYWwgYXBwcm9hY2ggc2hvdWxkIGJlIGZpeGluZyB0aGUg
Ym9vdA0KPiA+PiBzZXF1ZW5jZSBpbnNpZGUgYXJjaC9hcm0vIHRvIG1hdGNoIGFybTY0ICwgcG93
ZXJwYyBhbmQgbTY4aywgcmF0aGVyDQo+ID4+IHRoYW4gY29tcHJvbWlzaW5nIGNvcmUgTU0gY29k
ZSB3aXRoIHRlbXBvcmFyeSBib2lsZXJwbGF0ZSB2YXJpYWJsZXMuDQo+ID4+DQo+ID4+IEkgcHJl
ZmVyIHRvIGtlZXAgdGhlIG1lbXBvb2wgaW1wbGVtZW50YXRpb24gY2xlYW4uIElmIEFSTTMyIHRy
aWdnZXJzDQo+ID4+IHRoZSB3YXJuaW5nLCB0aGUgcHJvcGVyIHJlbWVkeSBpcyBhIGZvbGxvdy11
cCBwYXRjaCB0byBhbGlnbiBpdHMNCj4gPj4gc2V0dXBfYXJjaCgpIG9yZGVyaW5nLg0KPiA+Pg0K
PiA+PiBXaGF0IGRvIHlvdSB0aGluaz8NCj4gPj4NCj4gPg0KPiA+IEkgdGhpbmsgaXQgd291bGQg
YmUgYSBwcmVyZXF1aXNpdGUgcmF0aGVyIHRoYW4gYSBmb2xsb3cgdXAgcGF0Y2gNCj4gPiBpbm9y
ZGVyIHRvIG5vdCBicmVhayAzMiBiaXQgYXJtLiBJIHdpbGwgbGV0IEFSTSBhbmQgc2xhYiBtYWlu
dGFpbmVycyBkZWNpZGUNCj4gb24gdGhpcy4NCj4gDQo+IFllYWggd2Ugc2hvdWxkbid0IGp1c3Qg
a25vd2luZ2x5IGJyZWFrIGl0Lg0KPiBCdXQgSSBraW5kIG9mIGRvdWJ0IHRoZSBhcmd1bWVudCB0
aGF0IGNydWNpYWwgbWVtcG9vbCBhbGxvY2F0aW9ucyBoYXBwZW4NCj4gdGhhdCBlYXJseSBpbiB0
aGUgYm9vdCBhbmQgd2UgY291bGQgbWlzcyBlcnJvcnMgaW4gdGhlbT8gVGhleSBhcmUgbW9zdGx5
DQo+IHN0b3JhZ2UgZHJpdmVycywgQUZBSUNTLiBTbyBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdGhl
IGRlYnVnZ2luZyB0byBiZSBlbmFibGVkDQo+IGVhcmx5Lg0KPiANCkFmdGVyIHNvbWUgZ3JlcCBp
biBrZXJuZWzvvIxJIGFncmVlIHdpdGggeW91LiANClVzaW5nIF9fc2V0dXAgc2hvdWxkIGJlIHBl
cmZlY3RseSBmaW5lIGZvciB0aGlzIG1lbXBvb2wgcGFyYW1ldGVyLg0KDQpUaGFua3MgDQoNCltM
aSxSb25ncWluZ10gDQo=
