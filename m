Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C260136351;
	Tue,  2 Dec 2025 02:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764644002; cv=none; b=Krxr+T7WuQycnLwXEvLwsWSXTbMA6EVlVpHdIjRhP1AewSwIJV0BCK3FYPmfcPUglb0h+n5GDX92zzjq5g9XV9yhdVFIFdW8ikuirRDgyiJPtEfn8tHhsxvF1xXyZ0XaKyXlEI6giqkj0rEhchEr0YuG6YERO0sMgYYjcPIymlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764644002; c=relaxed/simple;
	bh=ZQEVZ3zykOevsdXz6RetEkX7VDXIDzKoQwO4ZFh9KPk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k/LUlEgx9H+NcedS+4l09aGXTDI0OCvHGBzlh9PqOBW373WloeUhUI3N+7cmeTS8Eb0z5rAB2wcqBbA5lHZL2nocktIVnJhpudz45oqxeempMpF50JAdBJcFPC6Ul8Ar9N9sBYQGc5kFd3maT5NQORnL8X0+JD1jGrlwdzAy7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=VikGKJ+n; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="VikGKJ+n"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=ZQEVZ3zykOevsdXz6RetEkX7VDXIDzKoQwO4ZFh9KPk=;
	b=VikGKJ+nNh2FmbQj+vHkX/5IKZNXBKVjjrVTOpr+hw4J4gO+yUfO2aK987qXwi4srI4OzHiKl
	SOOa4gEc7XPxNkUvkJS8+jlaeybk4CLQ3o75ZM1l5fRrxU3U5gl+E6K4BZeoherdasZZKw0S/79
	3JoV+YT4RPqRARkb44HXqCg=
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4dL4zJ4YpZzYlGYB;
	Tue,  2 Dec 2025 10:51:24 +0800 (CST)
Received: from a013.hihonor.com (10.68.22.170) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 2 Dec
 2025 10:53:17 +0800
Received: from w002.hihonor.com (10.68.28.120) by a013.hihonor.com
 (10.68.22.170) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Tue, 2 Dec
 2025 10:53:17 +0800
Received: from w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3]) by
 w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3%14]) with mapi id
 15.02.2562.027; Tue, 2 Dec 2025 10:53:17 +0800
From: wangzicheng <wangzicheng@honor.com>
To: Yuanchu Xie <yuanchu@google.com>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"hannes@cmpxchg.org" <hannes@cmpxchg.org>, "david@redhat.com"
	<david@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>,
	"mhocko@kernel.org" <mhocko@kernel.org>, "zhengqi.arch@bytedance.com"
	<zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev"
	<shakeel.butt@linux.dev>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "weixugc@google.com" <weixugc@google.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com"
	<surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wangtao
	<tao.wangtao@honor.com>, wangzhen 00021541 <wangzhen5@honor.com>, "zhongjinji
 00025326" <zhongjinji@honor.com>, Kairui Song <ryncsn@gmail.com>, Yuanchu Xie
	<yuanchu@google.com>, Barry Song <21cnbao@gmail.com>
Subject: RE: [PATCH 2/3] mm/lru_gen: add configuration option to select
 debugfs/procfs for lru_gen
Thread-Topic: [PATCH 2/3] mm/lru_gen: add configuration option to select
 debugfs/procfs for lru_gen
Thread-Index: AQHcYBJL4aaRxfOT9U6Z/I5UwCrlA7UMznaAgADYJYA=
Date: Tue, 2 Dec 2025 02:53:16 +0000
Message-ID: <96ebbb5fb5f14322b0df5714fc23097a@honor.com>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <20251128025315.3520689-3-wangzicheng@honor.com>
 <CAJj2-QFM3iwO==3JKQ4nnHfAxYJuyYXZ6uNJUR8rQdf_Q_1x0A@mail.gmail.com>
In-Reply-To: <CAJj2-QFM3iwO==3JKQ4nnHfAxYJuyYXZ6uNJUR8rQdf_Q_1x0A@mail.gmail.com>
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

SGkgWXVhbmNodSwNCg0KPiANCj4gT24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgODo1NOKAr1BNIFpp
Y2hlbmcgV2FuZyA8d2FuZ3ppY2hlbmdAaG9ub3IuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFppY2hlbmcgV2FuZyA8d2FuZ3ppY2hlbmdAaG9ub3IuY29tPg0KPiA+IC0t
LQ0KPiA+ICBtbS9LY29uZmlnIHwgMTAgKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9L
Y29uZmlnDQo+ID4gaW5kZXggZTQ0M2ZlOGNkLi5iZTdlZmE3OTQgMTAwNjQ0DQo+ID4gLS0tIGEv
bW0vS2NvbmZpZw0KPiA+ICsrKyBiL21tL0tjb25maWcNCj4gPiBAQCAtMTMyNSw2ICsxMzI1LDE2
IEBAIGNvbmZpZyBMUlVfR0VOX1NUQVRTDQo+ID4gIGNvbmZpZyBMUlVfR0VOX1dBTEtTX01NVQ0K
PiA+ICAgICAgICAgZGVmX2Jvb2wgeQ0KPiA+ICAgICAgICAgZGVwZW5kcyBvbiBMUlVfR0VOICYm
IEFSQ0hfSEFTX0hXX1BURV9ZT1VORw0KPiA+ICsNCj4gPiArY29uZmlnIExSVV9HRU5fUFJPQ0ZT
X0NUUkwNCj4gPiArICAgICAgIGJvb2wgIk1vdmUgbHJ1X2dlbiBmaWxlcyBmcm9tIGRlYnVnZnMg
dG8gcHJvY2ZzIg0KPiA+ICsgICAgICAgZGVwZW5kcyBvbiBMUlVfR0VOICYmIFBST0NfRlMNCj4g
PiArICAgICAgIGhlbHANCj4gPiArICAgICAgICAgTW92ZSBscnVfZ2VuIG1hbmFnZW1lbnQgZnJv
bSBkZWJ1Z2ZzIHRvIHByb2NmcyAoL3Byb2MvbHJ1X2dlbikuDQo+ID4gKyAgICAgICAgIFRoaXMg
cHJvZHVjdGlvbi1yZWFkeSBmZWF0dXJlIHByb3ZpZGVzIGNyaXRpY2FsIG1lbW9yeSByZWNsYWlt
DQo+ID4gKyAgICAgICAgIHByZWRpY3Rpb24gYW5kIGNvbnRyb2wuIEl0IGlzIG5vIGxvbmdlciBl
eHBlcmltZW50YWwuDQo+ID4gKyAgICAgICAgIFRoZSBtaWdyYXRpb24gZW5zdXJlcyBhdmFpbGFi
aWxpdHkgaW4gY29tbWVyY2lhbCBwcm9kdWN0cyB3aGVyZQ0KPiA+ICsgICAgICAgICBkZWJ1Z2Zz
IG1heSBiZSBkaXNhYmxlZC4NCj4gSGkgWmljaGVuZywNCj4gDQo+IEEgY29uZmlnIG9wdGlvbiBk
ZXRlcm1pbmluZyB3aGVyZSBMUlVfZ2VuIGZpbGVzIHJlc2lkZSBjcmVhdGVzIGENCj4gZnJhZ2ls
ZSBwcm9jZnMgaW50ZXJmYWNlLiBDb25zaWRlciBhZGRpbmcgYSBzaW1pbGFyIGludGVyZmFjZSB3
aXRoDQo+IGxlc3MgaW1wbGVtZW50YXRpb24gZGV0YWlsIHRvIC9zeXMva2VybmVsL21tL2xydV9n
ZW4vIGlmIHRoZSBnb2FsIGlzDQo+IHRvIHN0YWJpbGl6ZSB0aGUgZGVidWdmcyBBUElzLg0KDQpU
aGFuayB5b3UgZm9yIHRoZSBjb21tZW50cy4NCllvdXIgc3VnZ2VzdGlvbiBvbiBzeXNmcyByZWFs
bHkgbWFrZSBzZW5jZS4gVGhlIG9ubHkgY2hhbGxlbmdlIGlzIHRoZSBzaG93DQpidWZmZXJzIG9m
IHN5c2ZzIGFyZSBsaW1pdGVkIHRvIFBBR0VfU0laRSBhY2NvcmRpbmcgdG8gdGhlIGtlcm5lbCBk
b2MuDQpJdCBjYW4gaGFyZGx5IHNob3cgYWxsIG1lbWNnIGluZm9zIGluIGEgc2luZ2xlIHJlYWQs
IGFzIGRlYnVnZnMgZmlsZQ0KY3VycmVudGx5IGRvZXMuDQoNCj4gDQo+IElmIHRoZSBnb2FsIGlz
IHRvIHByb2FjdGl2ZWx5IGFnZSBscnV2ZWNzIHRoYXQgaGF2ZSBiZWVuIGF0DQo+IE1JTl9OUl9H
RU5TIGZvciBzb21lIHRpbWUvZXZlbnRzL2V0YywgaXMgaXQgcG9zc2libGUgdG8gaW50ZWdyYXRl
IHRoaXMNCj4gaW50byB0aGUga2VybmVsIGFuZCBhdm9pZCBsZWFraW5nIE1HTFJVIGltcGxlbWVu
dGF0aW9uIGRldGFpbHMgaW50bw0KPiB1c2Vyc3BhY2U/DQoNCldlIHdpbGwgZXhwbG9yZSB0aGUg
cG9zc2libGUgb3B0aW9ucyBpbiB0aGUgbmV4dCB2ZXJzaW9uLiA6LSkNCg0KPiANCj4gVGhhbmtz
LA0KPiBZdWFuY2h1DQoNCkJlc3QsDQpaaWNoZW5nDQo=
