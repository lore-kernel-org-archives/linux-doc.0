Received: from outbound.baidu.com (mx20.baidu.com [111.202.115.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA9E35E1B9;
	Thu, 28 May 2026 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.115.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955203; cv=none; b=h2RtguYHA/ewzMrpVJLf+4EYIrSNKSqNp6zBl9bFXd8zze+o/Nul7kyOKSRzB/pc/CSjJEbF3Swqfx3X8x0CzuxLRAGDEJM9mfoYE+LnlLhmPGXACaY/mekiuN4vBMEyk4u/rYQH2URy+hN3qeJNEWp//64xrx4R9S0cUz4q4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955203; c=relaxed/simple;
	bh=+YrfQsXLKHJUVY9avcxI8Z40i3pKR5bSqb9Q32axvfg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aIgHcXvxmMY/Tf1Wxl9A7Tjb2nqrCxn642CYu7OI3jZmtkV0U9UIiTwvXoiePpxSTcTd/C6axMRdze/+nqvKQyhmnF0/+m4owrDSKEM9XXR1eS0x3fLrCz0iul06teqNo1nfXa/acrMP4lG+QhUCZG/os0xp1AZoV5Us53yOqFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=QhFwdHQ4; arc=none smtp.client-ip=111.202.115.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="QhFwdHQ4"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.46
From: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
To: Matthew Wilcox <willy@infradead.org>, "Christoph Lameter (Ampere)"
	<cl@gentwo.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, David
 Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: =?gb2312?B?tPC4tDogWz8/Pz9dIFJlOiBbUEFUQ0hdIG1tL21lbXBvb2w6IHVzZSBzdGF0?=
 =?gb2312?Q?ic_key_for_boot-time_debug_enablement?=
Thread-Topic: [????] Re: [PATCH] mm/mempool: use static key for boot-time
 debug enablement
Thread-Index: AQHc7cYaHc/KlS0U5Emb14FdSgycW7Yh3hsAgAAMTYCAAA7JAIAAAM8AgAEY/6A=
Date: Thu, 28 May 2026 07:57:41 +0000
Message-ID: <ba0c2d92642e4d38bdf403faecb5b1d7@baidu.com>
References: <20260527104634.2434-1-lirongqing@baidu.com>
 <4da5d090-8272-7f26-9e83-ea4ab489f1f4@gentwo.org>
 <ahdsgyYYDn6juR_R@casper.infradead.org>
 <7f4ec43c-0d9c-190a-0ce5-bc3276b45cb0@gentwo.org>
 <ahd5mIMCnI4DQFn9@casper.infradead.org>
In-Reply-To: <ahd5mIMCnI4DQFn9@casper.infradead.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1779955064;
	bh=+YrfQsXLKHJUVY9avcxI8Z40i3pKR5bSqb9Q32axvfg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=QhFwdHQ4OjzQijNSrpiquIWLJ91ueUpPGsDxgEX+S1C7L+snIUlMrxxvgWP8WPVfG
	 RgNLZqNN0v93HQ4jxkMj75DxWi/Q3gxFOKQswt/soDWP4EbjzHTg4hvyIYlMq8TZBm
	 QJbvKhevzFWCi6jl2WUXU8OmXy2RfXJ4vKMeGdmUZZOENwC1AM8tc7F0BrgjkRO8wV
	 1djzlEaqd1Ajk8TeE4t4ip7rGVVBgnSzPAU/d3k1W0TyVK/Qqce+io6kHIO83uZrOx
	 5mKiWePMw22UhdBYT0Cn9GzokNvCeyd9F1Fq/QoQOwc0om9MROj/HRIKkFIPvE+b6i
	 gBjPi8eGacVTw==

PiA+ID4gPiBQbGVhc2UgY2xlYW4gdGhpcyBtZXNzIHVwLg0KPiA+ID4NCj4gPiA+IElzbid0IHRo
YXQgd2hhdCB0aGlzIHBhdGNoIGRvZXM/DQo+ID4NCj4gPiBJdHMgbm90IG1hcmtlZCBhcyBmaXhp
bmcgc29tZXRoaW5nIG5vciBhcyBhZGRyZXNzaW5nIHRoZSB3ZWlyZG5lc3Mgb2YNCj4gPiB1c2lu
ZyBDT05GSUdfU0xVQl9ERUJVR19PTiBoZXJlLCBBIGtlcm5lbCBidWlsZCB3aXRoDQo+ID4gQ09O
RklHX1NMVUJfREVCVUdfT04gY2FuIHN0aWxsIGJvb3Qgd2l0aG91dCBkZWJ1Z2dpbmcgaWYgYSBj
ZXJ0YWluDQo+ID4ga2VybmVsIGNvbW1hbmQgbGluZSBvcHRpb24gaXMgZ2l2ZW4uDQo+IA0KPiBS
aWdodCwgYnV0IC4uLiBpZiB5b3UgbG9vayBhdCB3aGF0IHRoZSBwYXRjaCBfZG9lc18sIGRvZXNu
J3QgaXQgZG8gd2hhdCB5b3UncmUNCj4gYXNraW5nIGZvciBpdCB0byBkbz8NCg0KSGkgTWF0dGhl
dywgQ2hyaXN0b3BoLA0KDQpNYXR0aGV3LCB0aGFua3MgYSBsb3QgZm9yIHN0YW5kaW5nIHVwIGZv
ciB0aGUgY29kZSBsb2dpYyEgSSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIHN1cHBvcnQgDQpvbiB0
aGlzLg0KDQpDaHJpc3RvcGgsIHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgb3V0IHRoZSBzZW1hbnRp
YyBnYXBzLiBUbyBhZGRyZXNzIHlvdXIgY29uY2VybnMsIA0KSSBoYXZlIGNvbXBsZXRlbHkgcmV3
cml0dGVuIHRoZSBjb21taXQgbWVzc2FnZSB0byBmb2N1cyBzdHJpY3RseSBvbiB1bnRhbmdsaW5n
IA0KdGhlIENPTkZJR19TTFVCX0RFQlVHX09OIGFidXNlIGFuZCBzd2l0Y2hpbmcgdG8gbWVtcG9v
bCdzIG93biBydW50aW1lIHBhcmFtZXRlci4NCg0KSGVyZSBpcyB0aGUgcmV2aXNlZCBjb21taXQg
bWVzc2FnZToNCg0KLS0tDQptbS9tZW1wb29sOiBVbnRhbmdsZSBDT05GSUdfU0xVQl9ERUJVR19P
TiBhYnVzZSBhbmQgc3dpdGNoIHRvIHN0YXRpYyBrZXkNCg0KVGhlIG1lbXBvb2wgc3Vic3lzdGVt
IGhpc3RvcmljYWxseSB3cmFwcGVkIGl0cyBkZWJ1Z2dpbmcgbG9naWMgaW5zaWRlIGFuDQojaWZk
ZWYgQ09ORklHX1NMVUJfREVCVUdfT04gYmxvY2suIFRoaXMgYWJ1c2VkIHRoZSBjb25maWcncyBp
bnRlbnQgKHdoaWNoDQptZXJlbHkgZGVmaW5lcyBjb21waWxlLXRpbWUgZGVmYXVsdHMgZm9yIFNM
VUIpIGFuZCBjYXVzZWQgdHdvIGZsYXdzOg0KDQoxLiBPbiBwcm9kdWN0aW9uIGtlcm5lbHMgd2hl
cmUgQ09ORklHX1NMVUJfREVCVUc9eSBidXQgQ09ORklHX1NMVUJfREVCVUdfT049biwNCiAgIG1l
bXBvb2wgZGVidWdnaW5nIHdhcyBjb21wbGV0ZWx5IHRydW5jYXRlZCBhdCBjb21waWxlIHRpbWUu
DQoyLiBPbiBrZXJuZWxzIHdpdGggQ09ORklHX1NMVUJfREVCVUdfT049eSwgbWVtcG9vbCBkZWJ1
Z2dpbmcgc3RheWVkIGFjdGl2ZQ0KICAgZXZlbiBpZiBhIHVzZXIgZXhwbGljaXRseSBkaXNhYmxl
ZCBkZWJ1Z2dpbmcgYXQgYm9vdCB0aW1lLg0KDQpDbGVhbiB1cCB0aGlzIG1lc3MgYnkgcmVtb3Zp
bmcgdGhlICNpZmRlZiBhbmQgc3dpdGNoaW5nIHRvIGEgcnVudGltZSBzdGF0aWMNCmtleSAobWVt
cG9vbF9kZWJ1Z19lbmFibGVkKSwgYWxsb3dpbmcgbWVtcG9vbCBkZWJ1Z2dpbmcgdG8gYmUgdG9n
Z2xlZCBjbGVhbmx5DQp2aWEgaXRzIG93biBib290IHBhcmFtZXRlci4NCg0KU2lnbmVkLW9mZi1i
eTogTGkgUm9uZ1FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPg0KLS0tDQoNCkRvZXMgdGhpcyBy
ZXZpc2VkIHRleHQgbG9vayBnb29kIHRvIHlvdT8gSWYgc28sIEkgd2lsbCBvZmZpY2lhbGx5IHNl
bmQgb3V0IFYyLg0KDQpUaGFua3MsDQoNCltMaSxSb25ncWluZ10gDQoNCg0KDQo=
