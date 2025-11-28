Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538025A2C6;
	Fri, 28 Nov 2025 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764314348; cv=none; b=hrMtw3Z5TbC1xoYGEp2OY1z8qofsP+rxRjq4irZttJt9L4Khhdc5zRiTo0+J+IjAhSpUMC/PC4/CIdhhxt1n9wsDZL5UpX+Y+/Cv6kPq300ctuhDx74W+cFLRfG3/9CW0jlzwRy55j1hOfFgTiJBajocEt6JPSkx/0lb5gBo3xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764314348; c=relaxed/simple;
	bh=UD8lLk9lQrrraE2MEjqwZ/F6w1tL9dTzmGzaBm9Gjf8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oi1HLLsve8b8uhs2hfGhIGcJvJmmYqieupsm6JvDVv0NPuTeDPE37QuZn/dRAYUxOtCafD0dnaOWlp8WwVr6lCRPWDl6yER0ArK2u2BVqScGvYPcQDj6emex2bRXBA9OUDX3W6Jmu3tQZyk5hxx+xggILrE7TgeYbDHgjHASpIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=IzVfh/gL; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="IzVfh/gL"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=UD8lLk9lQrrraE2MEjqwZ/F6w1tL9dTzmGzaBm9Gjf8=;
	b=IzVfh/gLVLxheXmRXbkEfFwl7gqGXCuI3oVa78TmLkanzJAd8M5uqW+/oJxEmPP41cSZZWz6I
	YPZthdU0pXTKr17z6k/nJUXp2DtAchGwYuZWHvR5iTAy3hQWkGLkMmoH86F5jp1JtgUNPDW86zN
	KrDRRzvdeQqTNdppUot//FY=
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4dHl3n6zfqzYl3Ls;
	Fri, 28 Nov 2025 15:17:09 +0800 (CST)
Received: from w009.hihonor.com (10.68.18.215) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 28 Nov
 2025 15:19:01 +0800
Received: from w002.hihonor.com (10.68.28.120) by w009.hihonor.com
 (10.68.18.215) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 28 Nov
 2025 15:19:00 +0800
Received: from w002.hihonor.com ([fe80::44a1:cc63:da29:b187]) by
 w002.hihonor.com ([fe80::44a1:cc63:da29:b187%14]) with mapi id
 15.02.1544.011; Fri, 28 Nov 2025 15:19:00 +0800
From: wangzicheng <wangzicheng@honor.com>
To: Randy Dunlap <rdunlap@infradead.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>,
	"david@redhat.com" <david@redhat.com>, "axelrasmussen@google.com"
	<axelrasmussen@google.com>, "yuanchu@google.com" <yuanchu@google.com>
CC: "mhocko@kernel.org" <mhocko@kernel.org>, "zhengqi.arch@bytedance.com"
	<zhengqi.arch@bytedance.com>, "shakeel.butt@linux.dev"
	<shakeel.butt@linux.dev>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "weixugc@google.com" <weixugc@google.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com"
	<surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] mm/lru_gen: add configuration option to select
 debugfs/procfs for lru_gen
Thread-Topic: [PATCH 2/3] mm/lru_gen: add configuration option to select
 debugfs/procfs for lru_gen
Thread-Index: AQHcYBJL4aaRxfOT9U6Z/I5UwCrlA7UG+f2AgAC0C4A=
Date: Fri, 28 Nov 2025 07:19:00 +0000
Message-ID: <7b24d6e38c9e46c4ae98211d5a815eb2@honor.com>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <20251128025315.3520689-3-wangzicheng@honor.com>
 <040e35ca-848c-49cb-bd0c-f91f4a8e2c5d@infradead.org>
In-Reply-To: <040e35ca-848c-49cb-bd0c-f91f4a8e2c5d@infradead.org>
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

PiBPbiAxMS8yNy8yNSA2OjUzIFBNLCBaaWNoZW5nIFdhbmcgd3JvdGU6DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWmljaGVuZyBXYW5nIDx3YW5nemljaGVuZ0Bob25vci5jb20+DQo+ID4gLS0tDQo+ID4g
IG1tL0tjb25maWcgfCAxMCArKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcN
Cj4gPiBpbmRleCBlNDQzZmU4Y2QuLmJlN2VmYTc5NCAxMDA2NDQNCj4gPiAtLS0gYS9tbS9LY29u
ZmlnDQo+ID4gKysrIGIvbW0vS2NvbmZpZw0KPiA+IEBAIC0xMzI1LDYgKzEzMjUsMTYgQEAgY29u
ZmlnIExSVV9HRU5fU1RBVFMNCj4gPiAgY29uZmlnIExSVV9HRU5fV0FMS1NfTU1VDQo+ID4gIAlk
ZWZfYm9vbCB5DQo+ID4gIAlkZXBlbmRzIG9uIExSVV9HRU4gJiYgQVJDSF9IQVNfSFdfUFRFX1lP
VU5HDQo+ID4gKw0KPiA+ICtjb25maWcgTFJVX0dFTl9QUk9DRlNfQ1RSTA0KPiA+ICsJYm9vbCAi
TW92ZSBscnVfZ2VuIGZpbGVzIGZyb20gZGVidWdmcyB0byBwcm9jZnMiDQo+ID4gKwlkZXBlbmRz
IG9uIExSVV9HRU4gJiYgUFJPQ19GUw0KPiA+ICsJaGVscA0KPiA+ICsJICBNb3ZlIGxydV9nZW4g
bWFuYWdlbWVudCBmcm9tIGRlYnVnZnMgdG8gcHJvY2ZzICgvcHJvYy9scnVfZ2VuKS4NCj4gPiAr
CSAgVGhpcyBwcm9kdWN0aW9uLXJlYWR5IGZlYXR1cmUgcHJvdmlkZXMgY3JpdGljYWwgbWVtb3J5
IHJlY2xhaW0NCj4gPiArCSAgcHJlZGljdGlvbiBhbmQgY29udHJvbC4gSXQgaXMgbm8gbG9uZ2Vy
IGV4cGVyaW1lbnRhbC4NCj4gPiArCSAgVGhlIG1pZ3JhdGlvbiBlbnN1cmVzIGF2YWlsYWJpbGl0
eSBpbiBjb21tZXJjaWFsIHByb2R1Y3RzIHdoZXJlDQo+ID4gKwkgIGRlYnVnZnMgbWF5IGJlIGRp
c2FibGVkLg0KPiANCj4gQS4gbWlzc2luZyBwYXRjaCBkZXNjcmlwdGlvbg0KPiBCLiBUaGUgaGVs
cCBtZXNzYWdlIGFib3ZlIHNvdW5kcyBsaWtlIGEgcGF0Y2ggZGVzY3JpcHRpb24uDQo+IA0KDQpU
aGFua3MgZm9yIHRoZSBjb21tZW50cywgd2lsbCBiZSBmaXggaW4gdGhlIG5leHQgdmVyc2lvbi4N
Cg0KPiBJZiBzb21lb25lIGRvZXMgbm90IGVuYWJsZSB0aGlzIGtjb25maWcgb3B0aW9uLCB3aGF0
IGhhcHBlbnM/DQo+IGEuIGxydV9nZW4gZmlsZXMgc3RheSBpbiBkZWJ1Z2ZzDQo+IGIuIGxydV9n
ZW4gZmlsZXMgYXJlIG5vdCBwcmVzZW50DQo+IGMuIHNvbWV0aGluZyBlbHNlLiBJZiBzbywgd2hh
dD8NCj4gDQo+IA0KPiAtLQ0KPiB+UmFuZHkNCg0KUmVnYXJkIHRvIHRoZSBxdWVzdGlvbnMsDQpJ
ZiB0aGlzIEtjb25maWcgb3B0aW9uIGlzIGVuYWJsZWQsIHRoZSBgbHJ1X2dlbmAgYW5kIGBscnVf
Z2VuX2Z1bGxgIGZpbGVzIHdpbGwgYXBwZWFyIHVuZGVyIC9wcm9jLy4NCklmIGl0IGlzIG5vdCBl
bmFibGVkLCB0aGUgZmlsZXMgcmVtYWluIHVuZGVyIGRlYnVnZnMsIHdoaWNoIGlzIHRoZSBjdXJy
ZW50IGRlZmF1bHQgYmVoYXZpb3IuDQoNClRoYW5rcywNClppY2hlbmcNCg==
