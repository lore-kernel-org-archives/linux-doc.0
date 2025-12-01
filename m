Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B666027C842;
	Mon,  1 Dec 2025 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764572584; cv=none; b=JePgfrAs9KVaqUDtq+jbarERuZlZgBL6bd/818gxnwz4QcQaS/DmfXiZD7cOUvNurgPQcN4W46CZYGtsz6ALWiZ3f8XlBJ6qXKD3FDyTL+fOgJmA4pkwhZnqScd5/6EzjhKMFrsok60Nad807ZJFuLqIMLJySpyNUVQByCneey8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764572584; c=relaxed/simple;
	bh=keLVryX8GeIo0Mn0JMDPzQGbake1lsSDO9bIs82o8/A=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G+HCLrB4ES7DpBFMzqeo1EGRz4VU4DV5JiDO2+V0N/yM1at4FJv2+LohHnIb9QW8JWIeJOqwkhkRwU0y2lQEFAZ2Eubap7pmSzGdxr6vFC/PqlmH863D6m96O5uLMs2sgzDPInW8HTF1GunAAZxXGkPO/mPnunSeY+eI3ABCsJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w011.hihonor.com (unknown [10.68.20.122])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dKZZL3V3YzYl9BZ;
	Mon,  1 Dec 2025 15:01:30 +0800 (CST)
Received: from w007.hihonor.com (10.68.16.91) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Mon, 1 Dec
 2025 15:02:54 +0800
Received: from w002.hihonor.com (10.68.28.120) by w007.hihonor.com
 (10.68.16.91) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Mon, 1 Dec
 2025 15:02:53 +0800
Received: from w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3]) by
 w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3%14]) with mapi id
 15.02.2562.027; Mon, 1 Dec 2025 15:02:53 +0800
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
Thread-Index: AQHcYBJK8KKXMResfEqv9fHMnnJz9rUHrbeAgAAP74CAA+3ugIAApiiQgAAOWIA=
Date: Mon, 1 Dec 2025 07:02:53 +0000
Message-ID: <e4cc633a77cb46b6bea4667d3886c000@honor.com>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org>
 <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
 <86c62472b5874ea2833587f1847958df@honor.com>
In-Reply-To: <86c62472b5874ea2833587f1847958df@honor.com>
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

PiA+ID4NCj4gPiA+IFsxXS4NCj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1
MDUxNDA3MDgyMC41MTc5My0xLTIxY25iYW9AZ21haWwuY29tDQo+ID4gPiAvDQo+ID4gPg0KPiA+
DQo+ID4gVGhhbmtzDQo+ID4gQmFycnkNCj4gDQo+IFNpbmNlIHRoZSBzZW1hbnRpYyBnYXAgYmV0
d2VlbiB1c2VyL2tlcm5lbCBzcGFjZSB3aWxsIGFsd2F5cyBleGlzdC4NCj4gSXQgd291bGQgYmUg
Z3JlYXQgYmVuZWZpdHMgZm9yIGxlYXZpbmcgc29tZSBBUElzIGZvciB1c2VyIGhpbnRzLCBqdXN0
IGxpa2UNCj4gbW1hZHZpc2UvdXNlcmZhdWx0L3BhcmEtdmlydHVhbGl6YXRpb24uDQo+IEV4cG9z
aW5nIHN1Y2ggaGludHMgdG8gdGhlIGtlcm5lbCBjYW4gaGVscCBpbXByb3ZlIG92ZXJhbGwgc3lz
dGVtDQo+IHBlcmZvcm1hbmNlLg0KPiANCj4gQmVzdCwNCj4gWmljaGVuZw0KDQpNb3JlIHByZWNp
c2VseSwgaXTigJlzIGEgZm9ybSBvZiAqcHJvYWN0aXZlIHNjYW5uaW5nIGFuZCBhZ2luZyouDQoN
CkVuc3VyZSBhIG1vcmUgZXZlbiBnZW5lcmF0aW9uYWwgZGlzdHJpYnV0aW9uIGJldHdlZW4gZmls
ZSBhbmQgYW5vbnltb3VzIHBhZ2VzLg0KDQpCZXN0LA0KWmljaGVuZw0K
