Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AF1352009;
	Wed, 15 Jul 2026 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784090876; cv=none; b=W0A6bY3RxysdgLOVF8HgTtfaebVheIwMNg1OqW/VpS/IWZzQIi0sepkbUDRW+o1YIWiMz5AOhv6j8a2dIxuSGhNZluxht5W7RJWY7m0CT6yLYGP2wChz/aaFkvckYWhyjOADaTXVSOg5YvLfsABbfGvJU0qtoBMAIEMURw/A7oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784090876; c=relaxed/simple;
	bh=/mJ/L1nC8Anu3GtDjHiV8GRZA7nBQOxhMaVnH8zkw88=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=kF1ITsRMNroIpIxH5ZtEJX0ZgmDI/EsXlhCQVxZW6OeIt1/19+PrP2p55ZRbmt+mODP0+YuuG6RfhIicQiINloEdBVdSNxyIRf9RM4M8fTWx+FwXaAxYhI7EzzjUdIS14Itc24bvROASaSlJRoVAX5vHDzAp4A67n5VQLsC13Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4h0Nvf39BXz52SFw;
	Wed, 15 Jul 2026 12:47:42 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 66F4ldX9039071;
	Wed, 15 Jul 2026 12:47:39 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 15 Jul 2026 12:47:40 +0800 (CST)
X-Zmail-TransId: 2afa6a5710ec650-0f8a8
X-Mailer: Zmail v1.0
Message-ID: <20260715124740929HC7tDDb2SK3kRxbuPruHd@zte.com.cn>
Date: Wed, 15 Jul 2026 12:47:40 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvM10gdG9vbHMvYWNjb3VudGluZzogcmVmYWN0b3IgZGVsYXkgZmllbGRzIGFuZCBzaGFyZSBmb3JtYXRfdGltZXNwZWMoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 66F4ldX9039071
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 15 Jul 2026 12:47:42 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A5710EE.001/4h0Nvf39BXz52SFw

From: Wang Yaxin <wang.yaxin@zte.com.cn>

- Convert per-field delay members in struct task_info to an array indexed
  by enum delay_type, eliminating offsetof() pointer arithmetic.

- Factor out a common format_timespec() implementation shared by getdelays
  and delaytop, using strftime for cleaner timestamp formatting.

- Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
  truncation check ((long long)time_sec != ts->tv_sec).

Change Log
==========
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
 tools/accounting/delaytop.c           | 261 +++++++++-----------------
 tools/accounting/format_timespec.c    |  37 ++++
 tools/accounting/format_timespec.h    |   9 +
 tools/accounting/getdelays.c          |  32 +---
 tools/include/uapi/linux/time_types.h |  46 +++++
 6 files changed, 197 insertions(+), 200 deletions(-)
 create mode 100644 tools/accounting/format_timespec.c
 create mode 100644 tools/accounting/format_timespec.h
 create mode 100644 tools/include/uapi/linux/time_types.h

-- 
2.27.0
