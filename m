Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D1F380FCE;
	Tue, 11 Aug 2026 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428612; cv=none; b=dBN54Q4fYQsd4OSkUlXMWoq/DiyMNy7+6zpilKcBWKD1sVkxq1nw028/qg+scsw3Yt9HTTwq9XJgJrcwtkOqw8UXZlZZLXELw1ynhRkENQbYDdEjz02Q6RIQ46uuxfoUJ2AyEShYsxwyhUVq75YULQg9l3EcZQx5S2/jgZC9yhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428612; c=relaxed/simple;
	bh=ujVyuopUKOGgYUK4OterYvKcQWz3ZvlfGslYmBNu8lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wdxobn1vkIkrWP2oAfyGVR16TCuaSE79M7rFME8mPpFmSTDWw79j2GRckOtSfPGMjevNtm2gcoHwVZa53/XKLPNBqwA4vLtYeOaaV9jajNqfEcd1uHRxrxDftJ8UoLansiywfYYeqTvJjC0aSM9/GUcchzOL1yA+zVOrHl8I0QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b=Rpswp7Ff; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=anka1.top header.i=@anka1.top header.b="Rpswp7Ff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=anka1.top;
	s=fpjh2607; t=1786428574;
	bh=ujVyuopUKOGgYUK4OterYvKcQWz3ZvlfGslYmBNu8lM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Rpswp7Ffeueh2qLtVf3MkVlsLhxsUsz5wsyy8XupkTec5DL6r2wGujdrOATsfgbrb
	 RBtb4gHV0G2XFLvROjtPWLZCMEUkqrS5CoVlgGmC/7ztVTqCUOI5sT3yp63KxKWt0K
	 Nt5fIqaw6Q2lYqFM2sv3cmwEL1FOpOSb4ur/6dtc=
X-QQ-mid: esmtpsz10t1786428572te589061e
X-QQ-Originating-IP: sUoLsawTVrQYiL2rO54HbZ6/5yNLRQzvJFtdmv9fqoQ=
Received: from anka-20eya00ycd.localnet ( [182.139.166.32])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 14:09:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5741776682932295646
From: Siwei Chen <businiaoanka@anka1.top>
To: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net,
 skhan@linuxfoundation.org, Dongliang Mu <dzm91@hust.edu.cn>
Cc: wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] docs/zh_CN: Add ipv6 Chinese translation
Date: Tue, 11 Aug 2026 14:09:29 +0800
Message-ID: <FCFE58C70BFA0AA3+5158853.31r3eYUQgx@anka-20eya00ycd>
In-Reply-To: <c560c763-d522-49f6-b325-96270aa18bc2@hust.edu.cn>
References:
 <20260727073538.56951-1-anka@stu.cdut.edu.cn>
 <20260727073538.56951-5-anka@stu.cdut.edu.cn>
 <c560c763-d522-49f6-b325-96270aa18bc2@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:anka1.top:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MACXe2l6e7j9Tg5CfKkGKqw2YwqcmS01t+gDm3XZBfeGVC7XR1iKz6lw
	63obCFXAwewYV6HGmhNTHJmUH5Pp1ppp8gpiKHi3ly3oDMmlGog+CAdDGoUlSzrd3BgA8dD
	G6pckhN4bcfX0WZg3aKbA3UMQRr3ZsE9tR03cOr6ZRYvUjL28xBeKFC/f78lLuqrPsobmyS
	oz3Frrhr5NLuxbsfXarwogOKNXm0YlIfAZeDVufBJSqXOj6f5GnOa9Tssx5qK6WN/CyAi3p
	FprqvpbvCh6yrq48SP/ssTM5yfwEDNDeV1UUbKurLBtzLV5cGB80/GS+IYnGJ//4e32ORq8
	wTLgrjgPOUQplgv1CLF0UOoJIGsvACnJQiY6TYNCaiewv907hpVcvvwJedYH6EtzxUyvPZF
	0b+z8liAzEWBR7ZMzSmJtV5/pobq4/fgZmvKPWmLnCdAau5iqrpaLRSgxIj+XvKyswLld6y
	qWQnh7XeLXvdnmEQ7NfNbq7Fd/9yw+lWOB+1ZEI3whvus/YdzyFMkXuxbQVVjn1K3ew6Rfs
	SgkCzUklDpv+fGcGqbMvVpIsi2cBaJhoRBofVFlg1cHjZaoANZ7wImZ37QOZhMrheREIivz
	1EQW5vS0zMAlMHcK09d41ncFqfgiyQvm0YGnyQwf5irpehvrpmwwPAObrJN28uZuXQfRUDH
	iz2gr46UgJkQ7s0d+vv7UoPlE8bxXVs4q4gDUjz282GFqD6djD1mh78YmFvuS2zYbX+M8vC
	Y6UjOlb+wgNBAizgA7bycYMTDQuJ3SGCo+bU81GTLCH5JbbAGKsO7raq42HkAqlLXtLEi4+
	sTeTbWU4R4FXFGJBZ7RZf+Ong0L4pVA8fCMBYasBwCV1FrPLyhdrcss7yjchnSjbiWJZ9OY
	kj3z4yxyJTi82gGJ1MXuc37lA6VsebYChzlaKFqqnkJTG9VrnfWmrDPCYONbborjBp2nVnQ
	R4muER/7UKy1GYcTQIj1wMIQDqSENMYpqJbzKB+0nJYszSQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

PiBTdWdnZXN0ZWQgdHJhbnNsYXRpb246Cj4gCj4g6Iul5Li65Ye65ZCR5rWB77yM5qCH562+5rS+
55Sf6Ieq5aWX5o6l5a2X77yI6Iul5pyJ77yJ77yb5aaC5p6c6K+l5rWB5piv5Li65ZON5bqU5p+Q
5Liq5YWl56uZ5oql5paH6ICM55Sf5oiQ55qE77yM5YiZ5qCH562+5rS+55Sf6Ieq55u45bqU55qE
5YWl56uZ5oql5paH77yI5L6L5aaCCj4gVENQIOWkjeS9jeOAgQo+IAo+IHRpbWV3YWl0IEFDSyDn
rYnvvInjgIIKCj4gcmVtb3ZlIHNwYWNlcyBiZWZvcmUgYW5kIGFmdGVyICguIE1heWJlIHlvdSBj
YW4gdXNlIO+8iCBvdGhlciB0aGFuICguCgo+ID4gKwo+ID4gK2F1dG9jb25mCj4gPiArCj4gPiAr
CeaMh+WumuaYr+WQpuWcqOaJgOacieaOpeWPo+S4iuWQr+eUqCBJUHY25Zyw5Z2A6Ieq5Yqo6YWN
572u44CC5b2T5LiN5biM5pyb5qC55o2u6Lev55Sx5Zmo6YCa5ZGKCj4gCj4gSWYgeW91IHByZWZl
ciBzcGFjZXMgYmVmb3JlIGFuZCBhZnRlciBFbmdsaXNoIHdvcmRzLCBhZGQgYSBzcGFjZSBhZnRl
cgo+IElQdjYuCj4gCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuIEkgaGF2ZSByZWNlaXZlZCBh
bGwgeW91ciAzIGNvbW1lbnRzLiBJIHdpbGwgbWFrZSB0aGUgCmNvcnJlY3Rpb25zIGluIHRoZSBu
ZXh0IHZlcnNpb24gb2YgdGhlIHBhdGNoLg==




