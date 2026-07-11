Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F532FA2E;
	Sat, 11 Jul 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762287; cv=none; b=GHuMbu1+SKeMvAcfxDYr9SUUeUbrFjauB9S1LgN8swo0nKZz+OMW7JCmqTFjBhBMWyM74qQeDDqf3nlk/TCAlgSVKm7KFPUEtfYB7Z6CBm4xD1wqsuAFRb7JKfrISyfBlo05/6AaiWB9Bu4Bm41T8VnrHAlp53PHiR4j/ONAVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762287; c=relaxed/simple;
	bh=IL6Ca0UtDOHBNlQSoMxICnh8tqtIr84TO3CdWcd3n8g=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=oedYRDMOdLvueLERNd+zdTp28/F5XtOZrjtc+Z0FvHEkCR1nT9np0Vjk1XgAJMdGeoUPDndD7qWjDFCsjh/FD3yWUsvTpJ6l5SAbKc/yohCNp3bD/MJXvLFHKQ6FAB3PFCTvQ0xF+3nsagfLfBCPnNe2cafT3pHdmzHWDAtTf7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gy3Ng2hrZz8XrrJ;
	Sat, 11 Jul 2026 17:31:15 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 66B9VBUe000738;
	Sat, 11 Jul 2026 17:31:11 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 11 Jul 2026 17:31:12 +0800 (CST)
X-Zmail-TransId: 2afb6a520d60dc7-e2736
X-Mailer: Zmail v1.0
Message-ID: <20260711173112482SCQEM08VED2PT1pxUYOXk@zte.com.cn>
Date: Sat, 11 Jul 2026 17:31:12 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDAvM10gdG9vbHMvYWNjb3VudGluZzogcmVmYWN0b3IgZGVsYXkgZmllbGRzIGFuZCBzaGFyZSBmb3JtYXRfdGltZXNwZWMoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 66B9VBUe000738
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 11 Jul 2026 17:31:15 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A520D63.000/4gy3Ng2hrZz8XrrJ

From: Wang Yaxin <wang.yaxin@zte.com.cn>

- Convert per-field delay members in struct task_info to an array indexed
  by enum delay_type, eliminating offsetof() pointer arithmetic.

- Factor out a common format_timespec() implementation shared by getdelays
  and delaytop, using strftime for cleaner timestamp formatting.

- Replace the complex sizeof/ULL/shift Y2038 guard with a direct narrowing
  truncation check ((long long)time_sec != ts->tv_sec).

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
 tools/include/uapi/linux/time_types.h |  18 ++
 6 files changed, 169 insertions(+), 200 deletions(-)
 create mode 100644 tools/accounting/format_timespec.c
 create mode 100644 tools/accounting/format_timespec.h
 create mode 100644 tools/include/uapi/linux/time_types.h

-- 
2.27.0
