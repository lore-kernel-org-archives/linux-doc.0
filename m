Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B903346B1;
	Tue, 16 Dec 2025 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870976; cv=none; b=A1rM9GquA9bUK1skRll7Cbup/2g3kD6cmr868tnU2nJwGxEXBX9cyDkwEcKX6l7zZChjhAIRfRds8ui7eJb9Uae5P7zbj0CJ3JqzJGQnhb+h+kXl4GoD6U731qYDcqTj4ZPTalXPFh4HOCL0z4rqaGzamhBzF7bhlp/fEBZuGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870976; c=relaxed/simple;
	bh=/ZdW0RTzwMImTVMjvdyw8BTiP7546TOTsFudL2sFvQg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PDBUQwz4X5AZ7OeYXKoLqbfbuI8+JJsvl6K1NGTqz/W8nk0zc8QyL3xgsTCmMc4FsFMJbSA6Rbb0Ia5d+EQXb2G+wrFvphWcVENE6WlAPC4n5Zrh6B2VU+G7suqZKo8jmOJp6ZDU2u2LMlsVn9e2h3BmK7NfOICGwxkUrPX6+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CU+jXv4v; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CU+jXv4v"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/ZdW0RTzwMImTVMjvdyw8BTiP7546TOTsFudL2sFvQg=;
	b=CU+jXv4vbzZQPYmJs+5boLCKM9sdZvLpdtGfynJp62/WcLvcCQyXL7uH7Nvb767Sm1S4INVgk
	BhLXm6sCbyXBwGQr1TlsjXanBbIU1sAXLKEzXA1hM/GFFIT4WZ6YAkc+qLpY+4zVs+7+LBjFv21
	ukavIPJxT9IZZbUD/LKOfX0=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dVpkh63MjzLlVV;
	Tue, 16 Dec 2025 15:40:44 +0800 (CST)
Received: from dggpemf500009.china.huawei.com (unknown [7.185.36.50])
	by mail.maildlp.com (Postfix) with ESMTPS id 805301A016C;
	Tue, 16 Dec 2025 15:42:44 +0800 (CST)
Received: from dggpemf500012.china.huawei.com (7.185.36.8) by
 dggpemf500009.china.huawei.com (7.185.36.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 16 Dec 2025 15:42:44 +0800
Received: from dggpemf500012.china.huawei.com ([7.185.36.8]) by
 dggpemf500012.china.huawei.com ([7.185.36.8]) with mapi id 15.02.1544.011;
 Tue, 16 Dec 2025 15:42:44 +0800
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
Thread-Index: AdxuX44yGEAb2cBdSXaqz2NhdGENWw==
Date: Tue, 16 Dec 2025 07:42:44 +0000
Message-ID: <0ce50058e6254a29baee1271ae0ef31c@huawei.com>
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

PiBPbiAxMi8xNi8yNSAwMzoyNCwgemhhbmdxaWxvbmcgd3JvdGU6DQo+ID4gICA+IE9uIDEyLzE1
LzI1IDE1OjAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToNCj4gPj4+IE9uIE1vbiwgRGVjIDE1LCAy
MDI1IGF0IDA4OjM0OjA1UE0gKzA4MDAsIFpoYW5nIFFpbG9uZyB3cm90ZToNCj4gPj4+PiBUaGlz
IHBhdGNoIHNlcmllcyBpbXBsZW1lbnRhdGUgVEhQIENPVyBmb3IgcHJpdmF0ZSBleGVjdXRhYmxl
IGZpbGUNCj4gPj4+PiBtbWFwLiBJdCdzIG1ham9yIGRlc2lnbmVkIHRvIGluY3JlYXNlIHRoZSBp
VExCIGNhY2hlIGhpdCByYXRlIGZvcg0KPiA+Pj4+IGhvdCBwYXRjaGluZyBhcHBsaWNhdGlvbiwg
YW5kIHdlIGFkZCBhIG5ldyBzeXNmcyBrbm9iIHRvIGRpc2FibGUgb3INCj4gPj4+PiBlbmFibGUg
aXQuDQo+ID4+Pg0KPiA+Pj4gWW91J3JlIGdvaW5nIHRvIGhhdmUgdG8gcHJvdmlkZSBkYXRhIHRv
IGdldCB0aGlzIHBhdGNoIGluLiAgV2UndmUNCj4gPj4+IGRlbGliZXJhdGVseSBub3QgZG9uZSB0
aGlzIGluIHRoZSBwYXN0IGR1ZSB0byBtZW1vcnkgY29uc3VtcHRpb24NCj4gPj4gb3ZlcmhlYWQu
DQo+ID4+PiBTbyB5b3UgbmVlZCB0byBwcm92ZSB0aGF0J3Mgbm93IHRoZSB3cm9uZyBkZWNpc2lv
biB0byBtYWtlLg0KPiA+Pj4NCj4gPj4+IE1pY3JvYmVuY2htYXJrcyB3b3VsZCBiZSBhIGJhcmUg
bWluaW11bSwgYnV0IHdoYXQgYXJlIHJlYWxseQ0KPiBuZWVkZWQNCj4gPj4+IGFyZSBudW1iZXJz
IGZyb20gYWN0dWFsIHdvcmtsb2Fkcy4NCj4gPj4NCj4gPj4gSW4gYWRkaXRpb24sIHRoZSBzeXNm
cyB0b2dnbGUgaXMgcmF0aGVyIGhvcnJpYmxlLiBJdCdzIHJhdGhlciBjbGVhcg0KPiA+PiB0aGF0
IHRoaXMgaXMgbm90IGEgc3lzdGVtLXdpZGUgc2V0dGluZyB0byBiZSBtYWRlLCBhcyB5b3UgbGlr
ZWx5IG9ubHkNCj4gPj4gd2FudCB0aGF0IGJlaGF2aW9yIChpZiBhdCBhbGwgLi4uKSBmb3IgYSBo
YW5kZnVsIG9mIHNwZWNpYWwgcHJvY2Vzc2VzIEkgYXNzdW1lPw0KPiA+DQo+ID4gWWVhciwgaXQn
cyBub3QgYSBzeXN0ZW0td2lkZSBzZXR0aW5nLiBXZSBjb25zaWRlciBlbmFibGluZyB0aGlzIG9w
dGlvbg0KPiA+IG9ubHkgd2hlbiBhcHBseWluZyBob3QgcGF0Y2hlcyB0byBzcGVjaWFsIHByb2Nl
c3Nlcy4gSWYgdGhlIHN5c2ZzDQo+ID4gdG9nZ2xlIGlzIHVuYXZhaWxhYmxlLCB3ZSB3aWxsIGV2
YWx1YXRlIHRoZSBvdmVyYWxsIG1lbW9yeSBpbXBhY3Qgb24NCj4gPiB0aGUgc3lzdGVtIGFmdGVy
IHJlbW92aW5nIGl0LiBUaGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQo+IA0K
PiBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdGhpcyBhcyBhbnkga2luZCBvZiBkZWZhdWx0IGJlaGF2
aW9yLiBCdXQgdGhlIHN5c3RlbQ0KPiB0b2dnbGUgaXMgcmVhbGx5IGFsc28gbm90IHdoYXQgd2Ug
d2FudC4gQ291bGQgd2UgdXNlIHNvbWUgcGVyLVZNQSBvciBwZXItDQo+IGZpbGUgaGludHMgdG8g
YWZmZWN0IHRoZSBwb2xpY3k/DQoNCkl0J3MgcmVhbGx5IGEgZ29vZCBpZGVhLiBNYXliZSBjb3Vs
ZCBzZXR0aW5nIGEgeHggZmxhZyB0byBWTUEsIGJ1dCBpdCBuZWVkIGhvbGQgd3JpdGUNCmxvY2sg
YW5kIHRvdWNoIFZNQS4gbGV0IG1lIGhhdmUgYSB0aGluayBob3cgdG8gaW1wbGVtZW50IHBlci1W
TUEgb3IgcGVyLWZpbGUgcG9saWN5DQpvciBvdGhlciBiZXR0ZXIgaGludHMuDQoNCkkgaGF2ZSBh
IHRob3VnaHQgdGhhdCwgaG93IGFib3V0IGFkZGluZyBhIG5ldyBmbGFnKGluIHB0cmFjZSwgdXBy
b2Jlcy4uLikgYW5kIHBhc3NpbmcNCnRvIGZhdWx0aW5fcGFnZSgpIHRvIG1hcmsgdGhlIGV4ZWMg
UE1EIENPVyBwb2xpY3k/DQoNCj4gDQo+IE5vdGUgdGhhdCB5b3VyIHByb3Bvc2FsIHdpbGwgbGlr
ZWx5IGludGVyYWN0IGluIGJhZCB3YXlzIHdpdGggdXByb2JlcywgYWZ0ZXINCj4gcmVtb3Zpbmcg
dXByb2JlcyBhZ2Fpbi4NCg0KWWVhciwgZ29vZCBjYXRjaCBoZXJlLCBpdCdzIHJlYWxseSBuZWVk
IGJlIHNlcmlvdXNseSBjb25zaWRlcmVkLiANCg0KPiANCj4gLS0NCj4gQ2hlZXJzDQo+IA0KPiBE
YXZpZA0K
