Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240DA1CFBA
	for <linux-doc@vger.kernel.org>; Thu, 16 Apr 2026 04:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776313625; cv=none; b=NJVar2YzPu7YtFgN1hNf/brKJMkt7PznGqglEJOFFLxmClB2KIbxqFnfooEqcqesRvMMSxLEwXjdgE8xtB4+NGuO8mxeA8spFnSn/WRs5+3LxZoifu2jJZzfyFMQukFndA9TE1/l2BVK54qxXm3Hm+41SyTvUVdqjkKpQYSIjyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776313625; c=relaxed/simple;
	bh=t1P26FZJonWwvDC3mGQbzKCVjhjqiHd1Q2OcyMf/BV4=;
	h=Cc:Date:Message-Id:Mime-Version:To:From:Content-Type:Subject; b=GG14P4j1ePV+umzUF+wy67lPEfwV/EY321rq7F0CrS20Wv6O0a5a37OmmGAtYnVOC+Y35UGEywNgsS1ZEaWez/iDAigqMVguwC4bw2sC1Ues/1pzuKQMY9txUY5vPQWkfGGKoe9HlIPdzNDY8IqlU0ttYJ1IDBQDaf2XrPMSm+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=I7tUstSq; arc=none smtp.client-ip=209.127.231.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="I7tUstSq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1776313611;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=t1P26FZJonWwvDC3mGQbzKCVjhjqiHd1Q2OcyMf/BV4=;
 b=I7tUstSqrPSwPEKZqhl1zh/t8mSAgXz22xu2z+n0tOeECTcCqyqPzFYagWWLK+TPOzoNOK
 MAH+PoE3MDNVRfQLOBNEGOWCElTl4FpM/rt10WNC5vmwKEV0QqLyCBqU8p6pLiCrQMZdEX
 MWKxeFt5As7ueoSu4od8FijZBFEb1ze0T/jcufiXc+6V6rKeBJFFmAXmC2DDJqMXTlEjh9
 jEqth8fw02beltFami8F8aP36jTiSq19z5DfzksL0HWfr4IX/OrHxIU8TpRxFmSbrN2WeW
 dWU8Q4noK8UCwXTvAo5h0Hrc32ZW4f+sjBGqiC58/CvbGxVCrKT9aiOGtUecvg==
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Thu, 16 Apr 2026 12:26:48 +0800
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Date: Thu, 16 Apr 2026 12:26:46 +0800
Message-Id: <20260416042647.3646595-1-ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+269e06509+389259+vger.kernel.org+ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Transfer-Encoding: base64
Subject: [PATCH] docs/zh_CN: add --no-merges to git log example in how-to.rst

QWRkIC0tbm8tbWVyZ2VzIGZsYWcgdG8gcHJldmVudCByZWZlcmVuY2luZyBtZXJnZSBjb21taXRz
IGluIHRoZQ0KdGhyb3VnaC1jb21taXQgZmllbGQgb2YgdHJhbnNsYXRpb24gY29tbWl0IG1lc3Nh
Z2VzLg0KDQpTaWduZWQtb2ZmLWJ5OiBCZW4gR3VvIDxiZW4uZ3VvQG9wZW5hdG9tLmNsdWI+DQot
LS0NCiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9ob3ctdG8ucnN0IHwgNCArKyst
DQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaG93LXRvLnJzdCBiL0Rv
Y3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2hvdy10by5yc3QNCmluZGV4IDdhZTVkODc2
NTg4Li4zOWVkNzA1NGZhMyAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2hvdy10by5yc3QNCisrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2hvdy10by5yc3QNCkBAIC0yNTcsNyArMjU3LDkgQEAgR2l0IOWSjOmCrueusemFjee9rg0KIA0K
IAlVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIHRocm91Z2ggY29tbWl0IGIwODBlNTIxMTBlYQ0KIAko
ImRvY3M6IHVwZGF0ZSBzZWxmLXByb3RlY3Rpb24gX19yb19hZnRlcl9pbml0IHN0YXR1cyIpDQot
CSMg6K+35omn6KGMIGdpdCBsb2cgLS1vbmVsaW5lIDzmgqjnv7vor5HnmoToi7HmlofmlofmoaPo
t6/lvoQ+77yM5bm25pu/5o2i5LiK6L+w5YaF5a65DQorCSMg6K+35omn6KGMIGdpdCBsb2cgLS1u
by1tZXJnZXMgLS1vbmVsaW5lIDzmgqjnv7vor5HnmoToi7HmlofmlofmoaPot6/lvoQ+DQorCSMg
5bm25pu/5o2i5LiK6L+w5YaF5a6544CC5rOo5oSP77ya5bqU5byV55So5a6e6ZmF5L+u5pS55paH
5Lu25YaF5a6555qEIGNvbW1pdO+8jA0KKwkjIOiAjOmdniBtZXJnZSBjb21taXQNCiANCiAJU2ln
bmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2kueWFudGVuZ0BsaW51eC5kZXY+DQogCSMg5aaC5p6c
5oKo5YmN6Z2i55qE5q2l6aqk5q2j56Gu5omn6KGM77yM6K+l6KGM5Lya6Ieq5Yqo5pi+56S677yM
5ZCm5YiZ6K+35qOA5p+lIGdpdGNvbmZpZyDmlofku7YNCi0tIA0KMi41My4w
