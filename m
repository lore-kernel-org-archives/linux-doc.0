Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079600;
	b=shT3bRW2jS25ieNQaQWzjeJ8XlVSYT4m9CplWdCU9zrOM/dVj61Q1YtDvzJq/WQoO8MP
	 M3BlmS5iw0VKfNvQgr9DauGu5jcje2Bcepp7q/7MueG+m1weMPFBx6pEEO0W4bn6c0jLN
	 Bhj1Rta5cR+iWhE9+iL6zvVz3Nhx6RQxv1KDq/Xaog9EPufat3kC8UuhJ/+c32X2tPagc
	 naOD/VPLvrPHwUZEXlheuEajBxN9nnkc4m1UevSUQfQcPZtK7vXAhbBr7qUVcKJWI4Fv0
	 5pn5dIrPOjqv3AHJhqOC3m/BkZt0qyiko4qo83VLKW1LuB1I9lUYY5K+cQTy3Yl9gnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079600;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=5otj8LqXuoFRDCfkaEq/wgjl2OHeIJseXXzietozvC4=;
	b=Xx2Yz0l32jxA+lrBxmZEh6EeKv/+FacehYvr/3CrhdHHa7aL6vV17llKl5NnuqP7gQxF
	 FRr8tvcuTEBLO+nBEmGwKmA9BIdNTOumTmZ3moxdWt2e+6gPQxRg4uy1jjaNAXNZk9QAD
	 rv5ctDmPPCWnPOjEGOuIp1JFOdY2mRlq43utbinwV5nzc0pc1AQkrgIeiuB2yFJiaYO8v
	 r5gHMQC3moeP8pN8duFjNeBZJdYSXOwlrzvalS98za23cQIOoniXjg9wtfdsVseFQtQ5a
	 drg0KrQrQPHl8uHxayl/3e0F1qB3W1lTBlYLwcFJGwdUXy5YfWLF6K0An8NGnAgeaOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GK3XiyZ3;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DAB606A326;
	Thu, 19 Nov 2026 09:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17DAB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=GK3XiyZ3
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5otj8LqXuoFRDCfkaEq/wgjl2OHeIJseXXzietozvC4=;
	b=GK3XiyZ3IW4xxvuorR9RNJih0Lpv7RqAAGTqcDKRnsRseb27i/YtNCZbqZfhHLNqYM+CxPvR/
	qGEFJzt9DKKgSirKs2IfFS8TygX4xkfzY6xKHTru62jgy0YeGvwtp+eOv1X1uOQ8Qt7fZfm+qYY
	KmvYI9xY/heD9XRwmsQvveA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jVXmf1gGGz1T4Fp;
	Thu, 19 Nov 2026 17:12:34 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id 5C6C04057D;
	Thu, 19 Nov 2026 17:13:15 +0800 (CST)
Received: from [10.174.185.4] (10.174.185.4) by kwepemo200009.china.huawei.com
 (7.202.195.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 17:13:14 +0800
Message-ID: <4550c77f-aecd-4d6a-963f-fdaa2c243100@huawei.com>
Date: Thu, 19 Nov 2026 17:11:37 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] kho: drop the incoming sub-blob debugfs view
To: Mike Rapoport <rppt@kernel.org>
CC: <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<akpm@linux-foundation.org>, <graf@amazon.com>, <leitao@debian.org>,
	<corbet@lwn.net>, <rdunlap@infradead.org>, <linux-mm@kvack.org>,
	<kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <hewenliang4@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
 <20261119063800.698863-1-longwei27@huawei.com>
 <179507678647.425130.13205346175314463200.b4-review@b4>
From: "longwei (I)" <longwei27@huawei.com>
In-Reply-To: <179507678647.425130.13205346175314463200.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo200009.china.huawei.com (7.202.195.26)

Hi Mike,

Thanks for the detailed explanation! I now understand why c609c144b0e8
is not the right Fixes target =E2=80=94 the pages weren't freed back then=
, so
there was no UAF. The kho_restore_free() path in d376e4b55c9a0 is what
actually made it reachable.

I will send v3 with the following changes:

- Fold patch 2 (documentation removal) into patch 1, so stable
  backports pick up both code and docs together
- Update Fixes tag to d376e4b55c9a0 ("liveupdate: centralize state
  management into struct luo_ser")

Best,
Long Wei

=E5=9C=A8 2026/11/19 16:26, Mike Rapoport =E5=86=99=E9=81=93:
> Hi,
>=20
> Please don't send vN+1 as a reply to vN.
>=20
>> kho/in/sub_fdts exposes the raw contents of the sub-blobs described by=

>> the incoming KHO FDT.  KHO does not own those pages: they belong to th=
e
>> producers' consumers and have independent lifetimes.  LUO, for example=
,
>> restores and frees its state in early_initcall, before kho_init()
>> (fs_initcall) creates the debugfs view, so the blobs point at pages th=
at
>> are already back in the buddy allocator.  Reading them triggers a KASA=
N
>> use-after-free in _copy_to_user().
>>
>> The same information is already available to user space from in/fdt,
>> which KHO does own and which stays reserved.  Drop the directory rathe=
r
>> than adding another interface to describe it, keeping the -rc fix smal=
l.
>>
>> Patch 1 removes the interface, patch 2 drops its documentation.
>=20
> Patch 2 is only four lines of documentation for the interface patch 1
> removes. It could be folded into patch 1 so that a stable backport
> removes the documentation together with the code.
>=20

