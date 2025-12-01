Received: from mta20.hihonor.com (mta20.honor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127DA2DAFC8;
	Mon,  1 Dec 2025 08:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764576859; cv=none; b=FK8Hct8+SzXRH7hMJURIIwGf8neHR6Mm1a4hjo0nXmbmnzr6HUEy8GKB3cvE1yHROfi497taeV0Ow6A7qu/gGcYTSqKPfFy4Vx+sQlaGi9efjMQaLR7DaKRbnl7MpVnyuEphgceRPvqr0LKxonIN0JkLMef08MGVdN5rBiaAbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764576859; c=relaxed/simple;
	bh=4W91DC4srourSKv6KoDRLsqHbZbIZMR8Hu3Xm+Wqip0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bwD1tsYnu7z06JxpCLMvQ4gnZfULNiWyRY24CQAVVzDm9ysfj1fgRrfeR410a7j+AqAq7wCww9/rArk4WZ/Y/Iesr3YhUPVT0liwwUGoIxRt2UszRgPLSEayh33v+wHeb8UE95L567apII6sXjgg4qVmr6TMk4O82xPf2c1PO4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w001.hihonor.com (unknown [10.68.25.235])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4dKc7W6jvzzYlt03;
	Mon,  1 Dec 2025 16:11:51 +0800 (CST)
Received: from w002.hihonor.com (10.68.28.120) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Mon, 1 Dec
 2025 16:14:14 +0800
Received: from w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3]) by
 w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3%14]) with mapi id
 15.02.2562.027; Mon, 1 Dec 2025 16:14:14 +0800
From: wangzicheng <wangzicheng@honor.com>
To: Barry Song <21cnbao@gmail.com>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox
	<willy@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>,
	"david@redhat.com" <david@redhat.com>, "axelrasmussen@google.com"
	<axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>,
	"mhocko@kernel.org" <mhocko@kernel.org>, "zhengqi.arch@bytedance.com"
	<zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev"
	<shakeel.butt@linux.dev>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "weixugc@google.com" <weixugc@google.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>,
	"surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wangtao
	<tao.wangtao@honor.com>, wangzhen 00021541 <wangzhen5@honor.com>, "zhongjinji
 00025326" <zhongjinji@honor.com>, Kairui Song <ryncsn@gmail.com>
Subject: RE: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
Thread-Topic: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
Thread-Index: AQHcYBJK8KKXMResfEqv9fHMnnJz9rUHrbeAgAAP74CAA+3ugIAApiiQ//+VEACAAImM4A==
Date: Mon, 1 Dec 2025 08:14:14 +0000
Message-ID: <66c62243a510421db938235a99a242bf@honor.com>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org>
 <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
 <86c62472b5874ea2833587f1847958df@honor.com>
 <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
In-Reply-To: <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
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

PiANCj4gSSBzdHJvbmdseSByZWNvbW1lbmQgc2VwYXJhdGluZyB0aGlzIGZyb20geW91ciBwYXRj
aHNldC4gQXZvaWQgaW5jbHVkaW5nDQo+IHVucmVsYXRlZCBjaGFuZ2VzIGluIGEgc2luZ2xlIHBh
dGNoc2V0Lg0KPiANClRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24sIHNlcGFyYXRpbmcg
aXQgZnJvbSBvdXIgcGF0Y2hzZXQgbWFrZXMgc2Vuc2UuDQoNClJlY2FsbCB0aGF0IGltYmFsYW5j
ZSBmaWxlL2Fub24gZ2VuZXJhdGlvbnMgaXMgb25lIG9mIHRoZSByZWFzb25zIHRvIG1vdmUgYGxy
dV9nZW5gDQpmaWxlcyBvdXQgb2YgdGhlIGRlYnVnZnMuDQoNCj4gTUdMUlUgaGFzIGEgbWVjaGFu
aXNtIHRvIGVuc3VyZSB0aGF0IGZpbGUgYW5kIGFub24gcGFnZXMgY2FuIGtlZXAgcGFjZQ0KPiB3
aXRoIGVhY2ggb3RoZXIuIEluIHRoZSBuZXdlc3Qga2VybmVsLCB0aGUgbWluaW11bSBnZW5lcmF0
aW9uIGlzIDIuIEZvcg0KPiBleGFtcGxlLCBpZiBhbm9uIGhhcyBvbmx5IDIgZ2VuZXJhdGlvbnMg
bGVmdCBhbmQgd2UgZGVjaWRlIHRvIHJlY2xhaW0gYW5vbg0KPiBmb2xpb3MsIHdlIHdpbGwgZmFs
bCBiYWNrIHRvIHJlY2xhaW1pbmcgZmlsZSBwYWdlcy4gU29tZXRpbWVzLCB0aGlzIG1lYW5zIHRo
YXQNCj4gYW5vbiByZWNsYW1hdGlvbiBpcyBpbnN1ZmZpY2llbnQgd2hpbGUgZmlsZSBwYWdlcyBh
cmUgb3Zlci1yZWNsYWltZWQuDQo+IA0KPiBzdGF0aWMgaW50IHNjYW5fZm9saW9zKHVuc2lnbmVk
IGxvbmcgbnJfdG9fc2Nhbiwgc3RydWN0IGxydXZlYyAqbHJ1dmVjLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBzY2FuX2NvbnRyb2wgKnNjLCBpbnQgdHlwZSwgaW50IHRpZXIsDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxpc3RfaGVhZCAqbGlzdCkgew0KPiAgICAg
ICAgIC4uLg0KPiAgICAgICAgIGlmIChnZXRfbnJfZ2VucyhscnV2ZWMsIHR5cGUpID09IE1JTl9O
Ul9HRU5TKQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgICAgICAgLi4uDQo+IH0N
Cj4gDQo+IFRoaXMgaXMgcHJvYmFibHkgbm90IGEgYnVnLCBidXQgdGhpcyBkZXNpZ24gY2FuIHNv
bWV0aW1lcyB3b3JrIHN1Ym9wdGltYWxseS4NCj4gDQoNClllcywgb3VyIHBhdGNoc2V0IGFsc28g
YWltcyB0byBzb2x2ZSBzaW1pbGFyIGNhc2VzIGJ5IHByb2FjdGl2ZSBhZ2luZyAyLzMgZ2Vucy4N
Cg0KPiBSZWdhcmRpbmcgdGhpcyBpc3N1ZSwgYm90aCBLYWlydWkgKGZyb20gdGhlIExpbnV4IHNl
cnZlciBzaWRlLCBjYy1lZCkgYW5kIEkNCj4gKGZyb20gdGhlIEFuZHJvaWQgc2lkZSkgaGF2ZSBv
YnNlcnZlZCBpdC4gVGhpcyBzaG91bGQgYmUgYWRkcmVzc2VkIGluDQo+IE1HTFJVJ3MgY29kZSwg
YW5kIHdlIGFscmVhZHkgaGF2ZSBrZXJuZWwgY29kZSBmb3IgdGhhdC4gSXQgaXMgdW5yZWxhdGVk
IHRvDQo+IHlvdXIgcGF0Y2hzZXQsIHNvIHlvdSBzaG91bGRu4oCZdCBpbmNsdWRlIHNvIG1hbnkg
dW5yZWxhdGVkIGNoYW5nZXMgaW4gYQ0KPiBzaW5nbGUgcGF0Y2hzZXQuDQo+IA0KPiBQbGVhc2Ug
a2VlcCB5b3VyIHBhdGNoc2V0IGZvY3VzZWQgc29sZWx5IG9uIHdoZXRoZXIgdGhlIE1HTFJVIHBy
b2FjdGl2ZQ0KPiByZWNsYW1hdGlvbiBpbnRlcmZhY2Ugc2hvdWxkIGJlIHByb21vdGVkIHRvIHN5
c2ZzIChMUlVfR0VOIGFscmVhZHkgaGFzIGENCj4gZm9sZGVyIGluIHN5c2ZzKSBpbnN0ZWFkIG9m
IGRlYnVnZnMsIGlmIHRoZXJlIGlzIGEgdjIuDQo+IA0KPiBUaGUgZm9sbG93aW5nIGlzIHF1b3Rl
ZCBmcm9tDQo+IGBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21tL211bHRpZ2VuX2xydS5yc3Rg
Lg0KPiANCj4gUHJvYWN0aXZlIHJlY2xhaW0NCj4gLS0tLS0tLS0tLS0tLS0tLS0NCj4gUHJvYWN0
aXZlIHJlY2xhaW0gaW5kdWNlcyBwYWdlIHJlY2xhaW0gd2hlbiB0aGVyZSBpcyBubyBtZW1vcnkg
cHJlc3N1cmUuIEl0DQo+IHVzdWFsbHkgdGFyZ2V0cyBjb2xkIHBhZ2VzIG9ubHkuIEUuZy4sIHdo
ZW4gYSBuZXcgam9iIGNvbWVzIGluLCB0aGUgam9iDQo+IHNjaGVkdWxlciB3YW50cyB0byBwcm9h
Y3RpdmVseSByZWNsYWltIGNvbGQgcGFnZXMgb24gdGhlIHNlcnZlciBpdCBzZWxlY3RlZCwNCj4g
dG8gaW1wcm92ZSB0aGUgY2hhbmNlIG9mIHN1Y2Nlc3NmdWxseSBsYW5kaW5nIHRoaXMgbmV3IGpv
Yi4NCj4gDQo+IFVzZXJzIGNhbiB3cml0ZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQgdG8gYGBscnVf
Z2VuYGAgdG8gZXZpY3QgZ2VuZXJhdGlvbnMNCj4gbGVzcyB0aGFuIG9yIGVxdWFsIHRvIGBgbWlu
X2dlbl9ucmBgLg0KPiANCj4gICAgIGBgLSBtZW1jZ19pZCBub2RlX2lkIG1pbl9nZW5fbnIgW3N3
YXBwaW5lc3MgW25yX3RvX3JlY2xhaW1dXWBgDQo+IA0KPiANCj4gPg0KPiA+IFNlZSB0aGUgY2Fz
ZSBpbiB0aGUgY292ZXIgbGV0dGVyLg0KPiA+IGBgYA0KPiA+IG1lbWNnICAgIDU0IC9hcHBzL3Nv
bWVfYXBwDQo+ID4gbm9kZSAgICAgMA0KPiA+IDEgICAgIDExOTgwNCAgICAgICAgICAwICAgICAg
IDg1NDYxDQo+ID4gMiAgICAgMTE5ODA0ICAgICAgICAgIDAgICAgICAgICAgIDUNCj4gPiAzICAg
ICAxMTk4MDQgICAgIDE4MTcxOSAgICAgICAxODY2Nw0KPiA+IDQgICAgICAgMTc1MiAgICAgICAg
MzkyICAgICAgICAgMjQ0DQo+ID4gYGBgDQo+ID4NCj4gPg0KPiA+IFNpbmNlIHRoZSBzZW1hbnRp
YyBnYXAgYmV0d2VlbiB1c2VyL2tlcm5lbCBzcGFjZSB3aWxsIGFsd2F5cyBleGlzdC4NCj4gPiBJ
dCB3b3VsZCBiZSBncmVhdCBiZW5lZml0cyBmb3IgbGVhdmluZyBzb21lIEFQSXMgZm9yIHVzZXIg
aGludHMsIGp1c3QNCj4gPiBsaWtlIG1tYWR2aXNlL3VzZXJmYXVsdC9wYXJhLXZpcnR1YWxpemF0
aW9uLg0KPiANCj4gTm9wZS4gVGhpcyBpcyBqdXN0IGFuIGludGVybmFsIGRldGFpbCBvZiBNR0xS
VSBhbmQgc2hvdWxkbuKAmXQgYmUgZXhwb3NlZCBhcyBhbg0KPiBpbnRlcmZhY2UuDQo+IEhvcGVm
dWxseSwgS2FpcnVpIG9yIEkgd2lsbCBzZW5kIGEgcGF0Y2hzZXQgc29vbiB0byBhZGRyZXNzIHRo
ZSBiYWxhbmNlIGlzc3VlDQo+IGJldHdlZW4gZmlsZSBhbmQgYW5vbiBwYWdlcy4gRm9yIG5vdywg
eW91IGNhbiB1c2UgYHN3YXBwaW5lc3M9MjAxYCBhcyBhDQo+IHRlbXBvcmFyeSB3b3JrYXJvdW5k
LiBUYWtlIGEgbG9vayBhdCBieXRlZGFuY2UncyBwYXRjaHNldC5bMV0NCj4gDQpTb3VuZCBncmVh
dDopLCB3ZSBhcmUgbG9va2luZyBmb3J3YXJkIHRvIGl0Lg0KDQo+ID4gRXhwb3Npbmcgc3VjaCBo
aW50cyB0byB0aGUga2VybmVsIGNhbiBoZWxwIGltcHJvdmUgb3ZlcmFsbCBzeXN0ZW0NCj4gcGVy
Zm9ybWFuY2UuDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtDQo+IG1t
L2NvdmVyLjE3NDQxNjkzMDIuZ2l0LmhlemhvbmdrdW4uaHprQGJ5dGVkYW5jZS5jb20vDQo+IA0K
QW5kIHRoYW5rIHlvdSBmb3IgdGhlIGBzd2FwcGluZXNzPTIwMWAgd29ya2Fyb3VuZCwgd2Ugd2ls
bCByZXNlYXJjaCBvbiBpdC4NCg0KPiBUaGFua3MNCj4gQmFycnkNCg0KQmVzdCwNClppY2hlbmcN
Cg==
