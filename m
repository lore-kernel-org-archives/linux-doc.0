Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51E233921;
	Sat, 18 Jul 2026 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784352878; cv=none; b=FSigB7DeO6Q+DY0NJLQE3dG6PZPrAgoZStPzZ0hpNUUHZuOqyCPJBBKY5ZMovjblDzJzhlT/MP0c3GHYZV4q4recrk4tNzpfZIzBexkPY5yg95QT/Ci2jrlU9l9f1Wtu4qibgKiVvpakhuX85GwpfumZHueOLrOliDavZytKZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784352878; c=relaxed/simple;
	bh=TrQg09b/b5PhZEeEx7r51ujwX2dhSFKkR2JKOqo5/g0=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=rRL1hHE3TdwMv8p/eCK7xYA7T5+IgLxDV1d07qrOgaJzSmfmD6QY9Ij1sn+UhmmUUWMyqXUHCl9RD23unpH5Sea9Oj0pDXc1RJ5snKbxz0YHqJLjUizgLu1Jx37U9x0+Nb788/WZU4Bq2NdUl2eKjtPIl1t4tWuKyaUk5SusCR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h2FpB4tXvz8Xrnt;
	Sat, 18 Jul 2026 13:34:26 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 66I5YKus054680;
	Sat, 18 Jul 2026 13:34:20 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 18 Jul 2026 13:34:20 +0800 (CST)
X-Zmail-TransId: 2afa6a5b105c0d2-e0e6b
X-Mailer: Zmail v1.0
Message-ID: <20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn>
Date: Sat, 18 Jul 2026 13:34:20 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>
Cc: <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>,
        <wang.yaxin@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYzIDAvM10gdG9vbHMvYWNjb3VudGluZzogcmVmYWN0b3IgZGVsYXkgZmllbGRzIGFuZCBzaGFyZSBmb3JtYXRfdGltZXNwZWMoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 66I5YKus054680
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 18 Jul 2026 13:34:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A5B1062.000/4h2FpB4tXvz8Xrnt

From: Wang Yaxin <wang.yaxin@zte.com.cn>

- Convert per-field delay members in struct task_info to an array indexed
  by enum delay_type, eliminating offsetof() pointer arithmetic.

- Factor out a common format_timespec() implementation shared by getdelays
  and delaytop, using strftime for cleaner timestamp formatting.

- Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
  truncation check ((long long)time_sec != ts->tv_sec).

Change Log
==========
v2->v3:
update patch 2/3 and 3/3 according to the suggestion:
https://sashiko.dev/#/patchset/20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn

1. tools/include/uapi/linux/time_types.h: use __kernel_long_t instead of
long to fix ABI mismatch on x32
2. tools/accounting: add nla_len < NLA_HDRLEN checks in netlink attribute
parsing loops to prevent infinite loop on malformed messages

v1->v2:
Only update patch 2/3 according to the suggestion:
https://sashiko.dev/#/patchset/20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn

1. tools/include/uapi/linux/time_types.h: expand stub to full set of
  6 structs from kernel UAPI to avoid shadowing system header
2. tools/accounting/Makefile: add $(LDFLAGS), $(LDLIBS), $(CPPFLAGS)
  to restore compatibility with standard build variables

Wang Yaxin (3):
  delaytop: refactor repetitive delay fields into array with enum
  tools/accounting: factor out shared format_timespec() implementation
  tools/accounting: simplify 32-bit time_t overflow check in
    format_timespec()

 tools/accounting/Makefile             |  12 +-
 tools/accounting/delaytop.c           | 265 ++++++++++----------------
 tools/accounting/format_timespec.c    |  37 ++++
 tools/accounting/format_timespec.h    |   9 +
 tools/accounting/getdelays.c          |  36 +---
 tools/include/uapi/linux/time_types.h |  49 +++++
 6 files changed, 208 insertions(+), 200 deletions(-)
 create mode 100644 tools/accounting/format_timespec.c
 create mode 100644 tools/accounting/format_timespec.h
 create mode 100644 tools/include/uapi/linux/time_types.h

-- 
2.27.0
