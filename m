Received: from mta20.hihonor.com (mta20.honor.com [81.70.206.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069DF78F4A;
	Mon,  1 Dec 2025 06:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.206.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764571830; cv=none; b=BVUlxHFvVG5HP4YDh70zK3oNrbOcL051Y675TT1B9nvFggW9qBhvlKY6DXk1csgf1zwsP+DnM5Q1Jl7cSFdXVZSc98O+EXkFU+AAQYAWEenaZeZqQNNzlR+QhDynX+K00LtaadXCGAGWguWWepnLnM7FvKK4fTTOLiT16zTWagg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764571830; c=relaxed/simple;
	bh=eGlWUGAG7s6EVRk38wAAIjcC4lcOcxHd2i9TUzWkFf0=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TTbDNM0o9XgAIVYTRBP3uLuqhloQqegIpZe3yBZWDR8gqL63WKxzr/n9JnYoAPKuQJrua/d8HtonoL0gmq15DJTEPzwj5QoiPi0NHFX5DtJlZe1DfBt2fqWM8r7brLMJmVdcaWiRS7sY3Lhy9LGoa9/xjattxl93g2aWQFvEpQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.206.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w011.hihonor.com (unknown [10.68.20.122])
	by mta20.hihonor.com (SkyGuard) with ESMTPS id 4dKZGg5FmSzYsjNR;
	Mon,  1 Dec 2025 14:47:55 +0800 (CST)
Received: from w007.hihonor.com (10.68.16.91) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Mon, 1 Dec
 2025 14:50:18 +0800
Received: from w002.hihonor.com (10.68.28.120) by w007.hihonor.com
 (10.68.16.91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Mon, 1 Dec
 2025 14:50:18 +0800
Received: from w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3]) by
 w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3%14]) with mapi id
 15.02.2562.027; Mon, 1 Dec 2025 14:50:18 +0800
From: wangzicheng <wangzicheng@honor.com>
To: Barry Song <21cnbao@gmail.com>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "hannes@cmpxchg.org"
	<hannes@cmpxchg.org>, "david@redhat.com" <david@redhat.com>,
	"axelrasmussen@google.com" <axelrasmussen@google.com>, "yuanchu@google.com"
	<yuanchu@google.com>, "mhocko@kernel.org" <mhocko@kernel.org>,
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>,
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"weixugc@google.com" <weixugc@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>,
	"mhocko@suse.com" <mhocko@suse.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, wangtao <tao.wangtao@honor.com>, "wangzhen
 00021541" <wangzhen5@honor.com>, zhongjinji 00025326 <zhongjinji@honor.com>
Subject: RE: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
Thread-Topic: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
Thread-Index: AQHcYBJK8KKXMResfEqv9fHMnnJz9rUHrbeAgAAP74CAA+3ugIAApiiQ
Date: Mon, 1 Dec 2025 06:50:17 +0000
Message-ID: <86c62472b5874ea2833587f1847958df@honor.com>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org>
 <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
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

SGkgQmFycnksDQoNCj4gSGkgTGlhbSwNCj4gDQo+IEkgc2F3IHlvdSBtZW50aW9uZWQgbWUsIHNv
IEkganVzdCB3YW50ZWQgdG8gam9pbiBpbiA6LSkNCj4gDQo+IE9uIFNhdCwgTm92IDI5LCAyMDI1
IGF0IDEyOjE24oCvQU0gTGlhbSBSLiBIb3dsZXR0IDxMaWFtLkhvd2xldHRAb3JhY2xlLmNvbT4N
Cj4gd3JvdGU6DQo+ID4NCj4gPiAqIE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZyYWRlYWQub3Jn
PiBbMjUxMTI4IDEwOjE2XToNCj4gPiA+IE9uIEZyaSwgTm92IDI4LCAyMDI1IGF0IDEwOjUzOjEy
QU0gKzA4MDAsIFppY2hlbmcgV2FuZyB3cm90ZToNCj4gPiA+ID4gQ2FzZSBzdHVkeToNCj4gPiA+
ID4gQSB3aWRlbHkgb2JzZXJ2ZWQgaXNzdWUgb24gQW5kcm9pZCBpcyB0aGF0IGFmdGVyIGFwcGxp
Y2F0aW9uDQo+ID4gPiA+IGxhdW5jaCwNCj4gPg0KPiA+IFdoYXQgZG8geW91IG1lYW4gYnkgYXBw
bGljYXRpb24gbGF1bmNoPyAgV2hhdCBkb2VzIHRoaXMgbWVhbiBpbiB0aGUNCj4gPiBrZXJuZWwg
Y29udGV4dD8NCj4gDQo+IEkgdGhpbmsgdGhlcmUgYXJlIHR3byBjYXNlcy4gRmlyc3QsIGEgY29s
ZCBzdGFydDogYSBuZXcgcHJvY2VzcyBpcyBmb3JrZWQgdG8NCj4gbGF1bmNoIHRoZSBhcHAuIFNl
Y29uZCwgd2hlbiB0aGUgYXBwIHN3aXRjaGVzIGZyb20gYmFja2dyb3VuZCB0bw0KPiBmb3JlZ3Jv
dW5kLCBmb3IgZXhhbXBsZSB3aGVuIHdlIGJyaW5nIGl0IGJhY2sgdG8gdGhlIHNjcmVlbiBhZnRl
ciBpdCBoYXMNCj4gYmVlbiBydW5uaW5nIGluIHRoZSBiYWNrZ3JvdW5kLg0KPiANCj4gSW4gdGhl
IGZpcnN0IGNhc2UsIHlvdSByZWJvb3QgeW91ciBwaG9uZSBhbmQgdGFwIHRoZSBZb3VUdWJlIGlj
b24gdG8gc3RhcnQNCj4gdGhlIGFwcCAoY29sZCBsYXVuY2gpLiBJbiB0aGUgc2Vjb25kIGNhc2Us
IHlvdSBhcmUgd2F0Y2hpbmcgYSB2aWRlbyBpbg0KPiBZb3VUdWJlLCB0aGVuIHN3aXRjaCB0byBG
YWNlYm9vaywgYW5kIGxhdGVyIHRhcCB0aGUgWW91VHViZSBpY29uIGFnYWluIHRvDQo+IGJyaW5n
IGl0IGZyb20gYmFja2dyb3VuZCB0byBmb3JlZ3JvdW5kLg0KPiANClRoYW5rcyBmb3IgdGhlIGV4
cGxhaW4sIHRoYXQncyBleGFjdGx5IHdoYXQgSSBtZWFudC4gIA0KDQpBbmRyb2lkIGxpZmVjeWNs
ZSBtb2RlbCBpc24ndCBvYnZpb3VzIG91dHNpZGUgdGhlIEFuZHJvaWQgY29udGV4dC4gSeKAmWxs
IG1ha2UgdGhhdCANCmNsZWFyZXIgaW4gdGhlIG5leHQgdmVyc2lvbi4NCj4gPg0KPiA+ID4gPiB0
aGUgb2xkZXN0IGFub24gZ2VuZXJhdGlvbiBvZnRlbiBiZWNvbWVzIGVtcHR5LCBhbmQgZmlsZSBw
YWdlcyBhcmUNCj4gPiA+ID4gb3Zlci1yZWNsYWltZWQuDQo+ID4gPg0KPiA+ID4gWW91IHNob3Vs
ZCBmaXggdGhlIGJ1Zywgbm90IG1vdmUgdGhlIGRlYnVnIGludGVyZmFjZSB0byBwcm9jZnMuICBO
QUNLLg0KPiA+DQo+ID4gQmFycnkgcmVjZW50bHkgc2VudCBhbiBSRkMgWzFdIHRvIGFmZmVjdCBM
UlUgaW4gdGhlIGV4aXQgcGF0aCBmb3INCj4gPiBBbmRyb2lkLiAgVGhpcyB3YXMgcHJvdmVuIGlu
Y29ycmVjdCBieSBKb2hhbm5lcywgaWlyYywgaW4gYW5vdGhlcg0KPiA+IHRocmVhZCBJIGNhbm5v
dCBmaW5kIChkZXN0cm95cyBwZXJmb3JtYW5jZSBvZiBjYWxsaW5nIHRoZSBzYW1lIGNvbW1hbmQp
Lg0KPiANCj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGFmZmVjdGluZyB0aGUgTFJVIGluIHRo
ZSBleGl0IHBhdGggaXMgbm90IGdlbmVyYWxseQ0KPiBjb3JyZWN0LCBidXQgaXQgc3RpbGwgaGln
aGxpZ2h0cyBhIHJlcXVpcmVtZW50OiBMaW51eCBMUlUgbmVlZHMgYSB3YXkgdG8NCj4gdW5kZXJz
dGFuZCBhcHAtY3ljbGluZyBiZWhhdmlvciBpbiBhbiBBbmRyb2lkLWxpa2Ugc3lzdGVtLg0KPiAN
Cj4gPg0KPiA+IFRoZXNlIGlkZWFzIHNlZW0gYm90aCByZWxhdGVkIGFzIGl0IHBvaW50cyB0byBh
IHN1Ym9wdGltYWwgTFJVIGluIHRoZQ0KPiA+IEFuZHJvaWQgZWNvc3lzdGVtLCBhdCBsZWFzdC4g
IEl0IHNlZW1zIHRvIHN0ZW0gZnJvbSBBbmRyb2lkcyBsaWZlDQo+ID4gKGN5Y2xlKSBjaG9pY2Vz
IDopDQo+ID4NCj4gPiBJIHN0cm9uZ2x5IGFncmVlIHdpdGggV2lsbHkuICBXZSBkb24ndCB3YW50
IGFub3RoZXIgdXNlcnNwYWNlIGRhZW1vbg0KPiA+IGFuZC9vciBpbnRlcmZhY2UsIGJ1dCB0aGlz
IHRpbWUgdG8gcGxheSB3aXRoIHRoZSBMUlUgdG8gYXZvaWQgdHJ5aW5nDQo+ID4gdG8gZGVmaW5l
IGFuZCBmaXggdGhlIHByb2JsZW0uDQo+ID4NCj4gPiBEbyB5b3Uga25vdyBpZiB0aGlzIGFmZmVj
dHMgb3RoZXJzIG9yIHdoeSBpdCBpcyBhbmRyb2lkIHNwZWNpZmljPw0KPiANCj4gVGhlIGJlaGF2
aW9yIFppY2hlbmcgcHJvYmFibHkgd2FudHMgaXMgYSBwcm9hY3RpdmUgbWVtb3J5IHJlY2xhbWF0
aW9uDQo+IGludGVyZmFjZS4gRm9yIGV4YW1wbGUsIHNpbmNlIGVhY2ggYXBwIG1heSBiZSBpbiBh
IGRpZmZlcmVudCBtZW1jZywgaWYgYW4NCj4gYXBwIGhhcyBiZWVuIGluIHRoZSBiYWNrZ3JvdW5k
IGZvciBhIGxvbmcgdGltZSwgaGUgd2FudHMgdG8gcmVjbGFpbSBpdHMNCj4gbWVtb3J5IHByb2Fj
dGl2ZWx5IHJhdGhlciB0aGFuIHdhaXRpbmcgdW50aWwga3N3YXBkIGhpdHMgdGhlIHdhdGVybWFy
a3MuDQo+IA0KPiBUaGlzIG1heSBoZWxwIGEgbmV3bHkgbGF1bmNoZWQgYXBwIG9idGFpbiBtZW1v
cnkgbW9yZSBxdWlja2x5LCBhdm9pZGluZw0KPiBkZWxheXMgZnJvbSByZWNsYW1hdGlvbiwgc2lu
Y2UgYSBuZXcgYXBwIHR5cGljYWxseSByZXF1aXJlcyBhIHN1YnN0YW50aWFsDQo+IGFtb3VudCBv
ZiBtZW1vcnkuDQo+IA0KPiBaaWNoZW5nLCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgSeKAmW0gbWlz
dW5kZXJzdGFuZGluZyBhbnl0aGluZy4NCg0KWWVzLCBidXQgbm90IGxlYXN0Lg0KDQoxLiBwcm9h
Y3RpdmUgbWVtb3J5IHJlY2xhaW06IHllcywgdGhhdCdzIHdlIGFyZSBhZnRlci4gDQpXaGVuIGFu
IGFwcCBpcyBzd2lwZWQgYXdheSBhbmQga2VwdCBpbiB0aGUgYmFja2dyb3VuZCBhbmQgbm90IHVz
ZSBmb3IgYSB3aGlsZSwgDQpwcm9hY3RpdmVseSByZWNsYWltaW5nIGl0cyBtZW1jZyBjYW4gaGVs
cCBuZXcgZm9yZWdyb3VuZCBhcHBzIGdldCBtZW1vcnkgDQpmYXN0ZXIgKGluc3RlYWQgb2YgcGF5
aW5nIHRoZSBjb3N0IG9mIGRpcmVjdCByZWNsYWltKS4NCg0KMi4gQW5vbiB2LnMuIEZpbGU6ICpi
aWFzIG1vcmUgdG93YXJkcyBhbm9ueW1vdXMqIHBhZ2VzIGZvciBiYWNrZ3JvdW5kIGFwcHMuDQpX
aXRoIG1nbHJ1LCBob3dldmVyLCB0aGUgb2xkZXN0IGdlbmVyYXRpb25zIG9mdGVuIGNvbnRhaW4g
YWxtb3N0IG5vIGFub24gcGFnZXMsDQpzbyBzaW1wbHkgdHVuaW5nIHN3YXBwaW5lc3MgY2Fubm90
IGFjaGlldmUgdGhhdCAtLSByZWNsYWltIHdpbGwgc3RpbGwgY2xlYXIgZmlsZSBjYWNoZQ0KaW4g
dGhlIG9sZCBnZW5lcmF0aW9ucyBmaXJzdC4NClRvIHNvbWUgZXh0ZW50LCBmaWxlIGNhY2hlcyBh
cmUgYG92ZXItcmVjbGFpbWVkYCBpbiBzdWNoIHNlbmFyaW8sIGxlYWRpbmcgdG8gYSBkaXNhc3Rl
cg0Kd2hlbiB1c2Vy4oCRaW50ZXJhY3Rpb24gdGhyZWFkcyBnZXQgc3R1Y2sgaW4gZGlyZWN0IHJl
Y2xhaW0gb2YgYW5vbiBwYWdlcy4NCg0KU2VlIHRoZSBjYXNlIGluIHRoZSBjb3ZlciBsZXR0ZXIu
DQpgYGANCm1lbWNnICAgIDU0IC9hcHBzL3NvbWVfYXBwDQpub2RlICAgICAwDQoxICAgICAxMTk4
MDQgICAgICAgICAgMCAgICAgICA4NTQ2MQ0KMiAgICAgMTE5ODA0ICAgICAgICAgIDAgICAgICAg
ICAgIDUNCjMgICAgIDExOTgwNCAgICAgMTgxNzE5ICAgICAgIDE4NjY3DQo0ICAgICAgIDE3NTIg
ICAgICAgIDM5MiAgICAgICAgIDI0NA0KYGBgDQoNCj4gDQo+ID4NCj4gPiBbMV0uDQo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNTE0MDcwODIwLjUxNzkzLTEtMjFjbmJhb0Bn
bWFpbC5jb20vDQo+ID4NCj4gDQo+IFRoYW5rcw0KPiBCYXJyeQ0KDQpTaW5jZSB0aGUgc2VtYW50
aWMgZ2FwIGJldHdlZW4gdXNlci9rZXJuZWwgc3BhY2Ugd2lsbCBhbHdheXMgZXhpc3QuDQpJdCB3
b3VsZCBiZSBncmVhdCBiZW5lZml0cyBmb3IgbGVhdmluZyBzb21lIEFQSXMgZm9yIHVzZXIgaGlu
dHMsIGp1c3QgbGlrZSANCm1tYWR2aXNlL3VzZXJmYXVsdC9wYXJhLXZpcnR1YWxpemF0aW9uLg0K
RXhwb3Npbmcgc3VjaCBoaW50cyB0byB0aGUga2VybmVsIGNhbiBoZWxwIGltcHJvdmUgb3ZlcmFs
bCBzeXN0ZW0gcGVyZm9ybWFuY2UuDQoNCkJlc3QsDQpaaWNoZW5nIA0K
