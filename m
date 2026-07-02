Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048548B372;
	Thu,  2 Jul 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997043; cv=none; b=ZVW+QEZ5u7m2tDXXDSn9GE74CQZPpZ5xF3QRS506gUvsXUFDKW9n8J02ahc7w+HezrDqdCW7QjnMoQAeg6vEzbQksbNofWW9nEpBGGO7wd+tWUvY6wnlL8PiHvemEOgxYWiOw7Meb2/1UlnaWY23WoSo81tmX5nFuL1Csc0dGZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997043; c=relaxed/simple;
	bh=e2CUiPwsFQzhse/XjSkwHAeMSJTGjBYL7oeWQicAi1M=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=G4F6+HSHVNUUiXvrDD0DRC5jUCfJml8tIufOqZh2ICrneTwxEDkKiDszPjxWi2e6Q0b4nvglOkwOQ78mGnrh+4c1Pr4NMH+Pp3/iQKDgFo7HLd73XVNenQIjWdU0KBplE5Qf3aSN1QHstjAp9ams4Q+/Z7VlOKt/coJqrqvcGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4grcNP2P9Lz57KTp;
	Thu, 02 Jul 2026 20:57:09 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 662Cv1ds001426;
	Thu, 2 Jul 2026 20:57:01 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 2 Jul 2026 20:57:04 +0800 (CST)
X-Zmail-TransId: 2af96a466020718-537e2
X-Mailer: Zmail v1.0
Message-ID: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
Date: Thu, 2 Jul 2026 20:57:04 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDAvMyB2M10gZGVsYXl0b3A6IGFkZCBkZWxheSBtYXgsIHRpbWVzdGFtcCBhbmQgc29ydGluZyBmb3IgdG9wIGxhdGVuY3kgYW5hbHlzaXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 662Cv1ds001426
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 02 Jul 2026 20:57:09 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A466025.000/4grcNP2P9Lz57KTp

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Previously delaytop only showed average delays. This patch adds:

1. delay_max fields to track the maximum delay value for each delay type
   (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy)
   per task.

2. The -t/--type option displays only the specified delay type with avg/max
   values side by side, allowing focused analysis:
     delaytop -t cpu    # Show only CPU delay with avg/max
     delaytop -t wpcopy # Show Copy-on-Write delay with avg/max

3. Wall-clock timestamp when each maximum delay occurred, displayed in the
   MAX_TIMESTAMP column when using -t/--type option. This enables:
   - Identifying the time when a process experienced an abnormal delay max
   - Correlating delay max across multiple processes at the same timestamp
   - Cross-referencing with logs, traces, or other metrics at that time

4. When using -t/--type option, tasks are sorted by maximum delay value in
   descending order (largest delay first), enabling quick identification of
   top N processes with highest delay spikes.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

v2->v3:
[patch 1/3]
1. fix get_field_by_name() MODE_TYPE filter breaking --sort for non-type fields
2. zero-init stats struct and cap memcpy size in netlink response parsing
3. fix compare_tasks() count field read as unsigned long long for 32-bit safety
4. strcmp → offset-based access via field_desc.max_offset

[patch 2/3]
1. fix 32-bit time_t overflow check to use max representable value instead of (time_t)-1
2. fix gmtime() pointer aliasing by assigning timespec64 tv_sec to local time_t
3. dropped pre-2000 check; gmtime → localtime_r + stack struct tm

[patch 3/3]
1. fixed Y2038 overflow false negative in format_kernel_timespec()
2. switched to localtime_r() with stack `struct tm` for thread safety.
3. `field_delay_max_and_ts()` `max_ts` nullable; removed unused ts_scratch
4. `-t/--type` mode: hide `[o]sort` and `[M]memverbose`, show only `[q]quit`

Wang Yaxin (3):
  delaytop: add delay max for delaytop
  delaytop: add timestamp of delay max
  delaytop: sort by max delay to highlight top latency processes

 Documentation/accounting/delay-accounting.rst |  43 +++
 tools/accounting/delaytop.c                   | 286 +++++++++++++++---
 tools/accounting/getdelays.c                  |   5 +
 3 files changed, 296 insertions(+), 38 deletions(-)

-- 
2.25.1
