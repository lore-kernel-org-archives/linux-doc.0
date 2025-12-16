Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9EA223328;
	Tue, 16 Dec 2025 02:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851886; cv=none; b=ZF+gpdQcOjyamnFQNUyCz4me5aZIogI3LQjZRJ1K9301fowJDRgTJLRr8hsl67cTALx2NeZzJc3QumSf5gO8xUJZVM4Dv9Hh3icl1LuZywL9YuUyhjuD+YwNxqzhAc5M6Xdyv4sD08A5lP6N13bvDsqIhTmWM7WP1YZ3Bkqx38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851886; c=relaxed/simple;
	bh=08VCGfxGBygDebj0UMTfZAR9kmbn/DHWW65lHjjH7YM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JHxuaTKCwk1RFwozF/LQjH2PQ0OZc7GmQPq2eULRkBgoQEG0x+C9Omb3QrVRE4A0up+eMMgQ/h6AOvLnaLTKMMv0e8aYf0qrfR8I9ZnGpReRTswXZLhXS1MjCHZ5HupvwValeThd5aEqRpbn7cOu4GZkH4i+dh/J4HNCT52Nv1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=av1WV9Yw; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="av1WV9Yw"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=08VCGfxGBygDebj0UMTfZAR9kmbn/DHWW65lHjjH7YM=;
	b=av1WV9Ywogbj1/c5oRY0v5UH3ZyXMk/jKVGrT17rK+MVE4czYV3UMfh5AdcE4i0o8RVzlR48k
	o4bHnfZHAodkgWTSH2jcnBrI24HfRvhI4UP4WCX6gOlWKejm6j5Wo7qavaf3D+W0/PYUGcVYthr
	dwB5h6Apavo4QhSoPY1kQ+w=
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dVggg3j5Fz1prKH;
	Tue, 16 Dec 2025 10:22:39 +0800 (CST)
Received: from dggpemf100007.china.huawei.com (unknown [7.185.36.214])
	by mail.maildlp.com (Postfix) with ESMTPS id BC283140132;
	Tue, 16 Dec 2025 10:24:40 +0800 (CST)
Received: from dggpemf500012.china.huawei.com (7.185.36.8) by
 dggpemf100007.china.huawei.com (7.185.36.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 16 Dec 2025 10:24:40 +0800
Received: from dggpemf500012.china.huawei.com ([7.185.36.8]) by
 dggpemf500012.china.huawei.com ([7.185.36.8]) with mapi id 15.02.1544.011;
 Tue, 16 Dec 2025 10:24:40 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, Matthew Wilcox
	<willy@infradead.org>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "ziy@nvidia.com" <ziy@nvidia.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "npache@redhat.com"
	<npache@redhat.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"dev.jain@arm.com" <dev.jain@arm.com>, "baohua@kernel.org"
	<baohua@kernel.org>, "lance.yang@linux.dev" <lance.yang@linux.dev>,
	"vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>,
	"surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>,
	"Wangkefeng (OS Kernel Lab)" <wangkefeng.wang@huawei.com>, Sunnanyong
	<sunnanyong@huawei.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH next 0/2] THP COW support for private executable file mmap
Thread-Topic: [PATCH next 0/2] THP COW support for private executable file
 mmap
Thread-Index: AdxuMYKVGEAb2cBdSXaqz2NhdGENWw==
Date: Tue, 16 Dec 2025 02:24:40 +0000
Message-ID: <e133c19e47324cce97a1c8f3752489c1@huawei.com>
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

ID4gT24gMTIvMTUvMjUgMTU6MDAsIE1hdHRoZXcgV2lsY294IHdyb3RlOg0KPiA+IE9uIE1vbiwg
RGVjIDE1LCAyMDI1IGF0IDA4OjM0OjA1UE0gKzA4MDAsIFpoYW5nIFFpbG9uZyB3cm90ZToNCj4g
Pj4gVGhpcyBwYXRjaCBzZXJpZXMgaW1wbGVtZW50YXRlIFRIUCBDT1cgZm9yIHByaXZhdGUgZXhl
Y3V0YWJsZSBmaWxlDQo+ID4+IG1tYXAuIEl0J3MgbWFqb3IgZGVzaWduZWQgdG8gaW5jcmVhc2Ug
dGhlIGlUTEIgY2FjaGUgaGl0IHJhdGUgZm9yIGhvdA0KPiA+PiBwYXRjaGluZyBhcHBsaWNhdGlv
biwgYW5kIHdlIGFkZCBhIG5ldyBzeXNmcyBrbm9iIHRvIGRpc2FibGUgb3INCj4gPj4gZW5hYmxl
IGl0Lg0KPiA+DQo+ID4gWW91J3JlIGdvaW5nIHRvIGhhdmUgdG8gcHJvdmlkZSBkYXRhIHRvIGdl
dCB0aGlzIHBhdGNoIGluLiAgV2UndmUNCj4gPiBkZWxpYmVyYXRlbHkgbm90IGRvbmUgdGhpcyBp
biB0aGUgcGFzdCBkdWUgdG8gbWVtb3J5IGNvbnN1bXB0aW9uDQo+IG92ZXJoZWFkLg0KPiA+IFNv
IHlvdSBuZWVkIHRvIHByb3ZlIHRoYXQncyBub3cgdGhlIHdyb25nIGRlY2lzaW9uIHRvIG1ha2Uu
DQo+ID4NCj4gPiBNaWNyb2JlbmNobWFya3Mgd291bGQgYmUgYSBiYXJlIG1pbmltdW0sIGJ1dCB3
aGF0IGFyZSByZWFsbHkgbmVlZGVkDQo+ID4gYXJlIG51bWJlcnMgZnJvbSBhY3R1YWwgd29ya2xv
YWRzLg0KPiANCj4gSW4gYWRkaXRpb24sIHRoZSBzeXNmcyB0b2dnbGUgaXMgcmF0aGVyIGhvcnJp
YmxlLiBJdCdzIHJhdGhlciBjbGVhciB0aGF0IHRoaXMgaXMgbm90IGENCj4gc3lzdGVtLXdpZGUg
c2V0dGluZyB0byBiZSBtYWRlLCBhcyB5b3UgbGlrZWx5IG9ubHkgd2FudCB0aGF0IGJlaGF2aW9y
IChpZiBhdA0KPiBhbGwgLi4uKSBmb3IgYSBoYW5kZnVsIG9mIHNwZWNpYWwgcHJvY2Vzc2VzIEkg
YXNzdW1lPw0KDQpZZWFyLCBpdCdzIG5vdCBhIHN5c3RlbS13aWRlIHNldHRpbmcuIFdlIGNvbnNp
ZGVyIGVuYWJsaW5nIHRoaXMgb3B0aW9uIG9ubHkgd2hlbg0KYXBwbHlpbmcgaG90IHBhdGNoZXMg
dG8gc3BlY2lhbCBwcm9jZXNzZXMuIElmIHRoZSBzeXNmcyB0b2dnbGUgaXMgdW5hdmFpbGFibGUs
IHdlIHdpbGwNCmV2YWx1YXRlIHRoZSBvdmVyYWxsIG1lbW9yeSBpbXBhY3Qgb24gdGhlIHN5c3Rl
bSBhZnRlciByZW1vdmluZyBpdC4gVGhhbmtzIHZlcnkNCm11Y2ggZm9yIHlvdXIgc3VnZ2VzdGlv
bi4NCg0KPiANCj4gLS0NCj4gQ2hlZXJzDQo+IA0KPiBEYXZpZA0KDQo=
