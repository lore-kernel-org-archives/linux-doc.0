Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BCD4908B7;
	Fri, 24 Jul 2026 07:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876691; cv=none; b=bKjz2z1eVw3hUzuaGA0iGRO00yE+mnm7MfbmobOMQ5Z+ixDljtrnaPN6Ia3+E3Nz/6ZgZ1RY7cOa7ilTDrUMXiUyd2tklQnBKRfwh1avGkhSaDUOy4AYRPQ6fJ28MedY4lD6skCmXPDNlzns9rZroOZJTBqMnwwk4wSqwU+7waU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876691; c=relaxed/simple;
	bh=sK6E1vYpI0o09lg5auVFoh0kD1qRIgUL1He0noGtFgo=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=Qm7qLYfmRM5h7ZboR9nF2v95cmYJnyKfxlf0LQuwZGU1TxSEZQ1iyrx4ruPPimBeA0nWVscWwYOZCZ/mPN2+IHb/OoqduWs6wT3Z6IXcMazZzLcKk4K8yv+RS8gbD+lsa/Quc6R133qeLWqpbzyOjo13x7FC0UkgHADYCQ3EX6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h5zWg2GBPz4yjRy;
	Fri, 24 Jul 2026 15:04:47 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 66O74USA054605;
	Fri, 24 Jul 2026 15:04:30 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 24 Jul 2026 15:04:32 +0800 (CST)
X-Zmail-TransId: 2afa6a630e802b0-ca885
X-Mailer: Zmail v1.0
Message-ID: <2026072415043227725SuvoyQ3SGDOmHLp8tdn@zte.com.cn>
Date: Fri, 24 Jul 2026 15:04:32 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIHY0IDAvM10gdG9vbHMvYWNjb3VudGluZzogcmVmYWN0b3IgZGVsYXkgZmllbGRzIGFuZCBzaGFyZSBmb3JtYXRfdGltZXNwZWMoKcKg?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 66O74USA054605
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 24 Jul 2026 15:04:47 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A630E8F.001/4h5zWg2GBPz4yjRy

From: Wang Yaxin <wang.yaxin@zte.com.cn>

- Convert per-field delay members in struct task_info to an array indexed
  by enum delay_type, eliminating offsetof() pointer arithmetic.

- Factor out a common format_timespec() implementation shared by getdelays
  and delaytop, using strftime for cleaner timestamp formatting.

- Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
  truncation check ((long long)time_sec != ts->tv_sec).

Change Log
==========
v3->v4:
update patch 2/3 and 3/3 according to the suggestion:
https://sashiko.dev/#/patchset/20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn

1. add #ifndef __kernel_old_timeval guard to
tools/include/uapi/linux/time_types.h to match the kernel header and avoid
redefinition on sparc64.
2. update commit message to document the nla_len < NLA_HDRLEN sanity checks
added to netlink attribute parsing in getdelays.c and delaytop.c.


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
 tools/include/uapi/linux/time_types.h |  51 +++++
 6 files changed, 210 insertions(+), 200 deletions(-)
 create mode 100644 tools/accounting/format_timespec.c
 create mode 100644 tools/accounting/format_timespec.h
 create mode 100644 tools/include/uapi/linux/time_types.h

-- 
2.27.0
