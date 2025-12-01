Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9103630217F;
	Mon,  1 Dec 2025 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582910; cv=none; b=qHYFtJrD2LnpKOJ1OfTo2U9CnH9olJwveT0K+lFMAX7HgNZyza1KGQbyM4KwaLW8LMW2786qsZ+tiUB0lknbRVlt7pW1F+7zabJRHK51Z1vlQnivyGMPAZIPo0Ip4S3ffJAkSlBqxnd5FHwEjD5+Fc5sysKWgi1x8NTs7vHl8jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582910; c=relaxed/simple;
	bh=R54PDiPJQHrypJ6nxOZU3QXEOxGBgYwWh5cI2BJ3WT8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YMWQIMfm0KHAocfRecufTr1ginONEip1QBcCeMmP7yLAN4NR6QahDmXmzYHUs8zcsTNe6PKSSd8KP/icqrrdpemWDXCdl9HwQaaPuHzHTrgPRQsgzikeKtHusYpjfPL5b2DaIPrsFs8SKhKiGQZBAu2M3KWRXaXFW6uU7XlbhqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b=GUiRtJcy; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=honor.com header.i=@honor.com header.b="GUiRtJcy"
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=To:From;
	bh=R54PDiPJQHrypJ6nxOZU3QXEOxGBgYwWh5cI2BJ3WT8=;
	b=GUiRtJcyQhrJ3N5tA5Ur5RhzdyuuJ4jnBvLaWcXzLc31HuDNnmmU6E21jin/4Kd28/OxS/2RV
	fBjcHob/ZsDC6W/278pAVP+wd/h/sCmWFMynDc6ZrA/v7k8V4OSbQRU1CoLAat1WQaqwmgSu3Yi
	F5y7V9tXYxY3zCXP5bFO4kM=
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4dKfNJ5xwHzYl0TY;
	Mon,  1 Dec 2025 17:53:04 +0800 (CST)
Received: from w002.hihonor.com (10.68.28.120) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Dec
 2025 17:54:57 +0800
Received: from w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3]) by
 w002.hihonor.com ([fe80::ef6f:d9c5:cf75:d4d3%14]) with mapi id
 15.02.2562.027; Mon, 1 Dec 2025 17:54:57 +0800
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
Thread-Index: AQHcYBJK8KKXMResfEqv9fHMnnJz9rUHrbeAgAAP74CAA+3ugIAApiiQ//+VEACAAImM4P//h9UAgACJZRA=
Date: Mon, 1 Dec 2025 09:54:56 +0000
Message-ID: <dc8ce4f329d74a24bde62c93818df44a@honor.com>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org>
 <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
 <86c62472b5874ea2833587f1847958df@honor.com>
 <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
 <66c62243a510421db938235a99a242bf@honor.com>
 <CAGsJ_4x0aVkDf-AhhGbBLU=LCxYFqYoFL0ovij-vFEQeJ46jYQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4x0aVkDf-AhhGbBLU=LCxYFqYoFL0ovij-vFEQeJ46jYQ@mail.gmail.com>
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

SGkgQmFycnksDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNvbW1lbnQsIGFjdHVhbGx5IHdlIGRvIGtu
b3cgdGhlIGNncm91cCBmaWxlLg0KDQpXaGF0IHdlIHJlYWxseSBuZWVkIGlzIHRvICpwcm9hY3Rp
dmUgYWdpbmcgMn4zIGdlbnMqIGJlZm9yZSBwcm9hY3RpdmUgcmVjbGFpbS4NCihlc3BlY2lhbGx5
IGFmdGVyIGNvbGQgbGF1bmNoZXMgd2hlbiBubyBhbm9uIHBhZ2VzIGluIHRoZSBvbGRlc3QgZ2Vu
cykNCg0KVGhlIHByb2FjdGl2ZSBhZ2luZyBhbHNvIGhlbHBzIGRpc3RyaWJ1dGUgdGhlIGFub24g
YW5kIGZpbGUgcGFnZXMgZXZlbmx5IGluIA0KTUdMUlUgZ2Vucy4gQW5kIHJlY2xhaW1pbmcgd29u
J3QgZmFsbCBpbnRvIGZpbGUgY2FjaGVzLg0KDQo+IEFsc28gbm90ZSB0aGF0IG1lbWNnIGFscmVh
ZHkgaGFzIGFuIGludGVyZmFjZSBmb3IgcHJvYWN0aXZlIHJlY2xhbWF0aW9uLA0KPiBzbyBJ4oCZ
bSBub3QgY2VydGFpbiB3aGV0aGVyIHlvdXIgcGF0Y2hzZXQgY2FuIGNvZXhpc3Qgd2l0aCBpdCBv
ciBleHRlbmQNCj4gaXQgdG8gbWVldCB5b3VyIHJlcXVpcmVtZW50c+KAlHdoaWNoIHNlZW1zIHF1
aXRlIGltcG9zc2libGUgdG8gbWUNCj4gDQo+IG1lbW9yeS5yZWNsYWltDQo+ICAgICAgICAgQSB3
cml0ZS1vbmx5IG5lc3RlZC1rZXllZCBmaWxlIHdoaWNoIGV4aXN0cyBmb3IgYWxsIGNncm91cHMu
DQo+IA0KPiAgICAgICAgIFRoaXMgaXMgYSBzaW1wbGUgaW50ZXJmYWNlIHRvIHRyaWdnZXIgbWVt
b3J5IHJlY2xhaW0gaW4gdGhlDQo+ICAgICAgICAgdGFyZ2V0IGNncm91cC4NCj4gDQo+ICAgICAg
ICAgRXhhbXBsZTo6DQo+IA0KPiAgICAgICAgICAgZWNobyAiMUciID4gbWVtb3J5LnJlY2xhaW0N
Cj4gDQo+ICAgICAgICAgUGxlYXNlIG5vdGUgdGhhdCB0aGUga2VybmVsIGNhbiBvdmVyIG9yIHVu
ZGVyIHJlY2xhaW0gZnJvbQ0KPiAgICAgICAgIHRoZSB0YXJnZXQgY2dyb3VwLiBJZiBsZXNzIGJ5
dGVzIGFyZSByZWNsYWltZWQgdGhhbiB0aGUNCj4gICAgICAgICBzcGVjaWZpZWQgYW1vdW50LCAt
RUFHQUlOIGlzIHJldHVybmVkLg0KPiANClRoaXMgcmVtaW5kIG1lIHRoYXQgYWRkaW5nIGEgYG1l
bW9yLmFnaW5nYCB1bmRlciBtZW1jZyBkaXJlY3Rvcmllcw0KcmF0aGVyIHRoYW4gYWRkaW5nIG5l
dyBwcm9jZnMgZmlsZXMgaXMgYWxzbyBhIGdyZWF0IG9wdGlvbi4NCg0KPiBUaGFua3MNCj4gQmFy
cnkNCg0KVGhhbmtzLA0KWmljaGVuZw0K
