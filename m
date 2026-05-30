Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9B2C029D;
	Sat, 30 May 2026 03:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110979; cv=none; b=DMEr/l6ZwCypW1TRfnMyFycAXv8WYO7dtvtGmbw/LuFuiihkYYYOLyBqgEMoShq8rITjzAv47mrNFkZ6AQE1ecFnRne364UqaY80EsjnNR2jz4ly9NdHjPpUdtuuZ8bIKlS+XucjrM5T7TUeEctNpBXhZTkkVLneZf4hfN8b54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110979; c=relaxed/simple;
	bh=XHsVa6sGBTBHfYzqHrMUtt9KVpdF85JwInZ/BV5N0TQ=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=VU6QXoPRJKaOLNiZArb0WqMpE5TeTnU0QfQ1EScE+C6Y5TwQVpCXleMb3+yvoLpWyeTa9XI0aHymY1RFd+TbSZl31Pm+/dTwg7qKa+lnbpi2xtc+xmRRIiwXNeQj1AhZfqdJIlKjYClYw26zrTWMtWzVUtDR/+6vnaWNePci2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gS53C2SFgz51Srk;
	Sat, 30 May 2026 11:16:07 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 64U3G1mT022502;
	Sat, 30 May 2026 11:16:01 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 30 May 2026 11:16:02 +0800 (CST)
X-Zmail-TransId: 2af96a1a56720aa-c290c
X-Mailer: Zmail v1.0
Message-ID: <20260530111602822agJB6QYfIc2NKfQBK1KYf@zte.com.cn>
Date: Sat, 30 May 2026 11:16:02 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDAvMyB2Ml0gZGVsYXl0b3A6IGFkZCBkZWxheSBtYXgsIHRpbWVzdGFtcCBhbmQgc29ydGluZyBmb3IgdG9wIGxhdGVuY3kgYW5hbHlzaXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 64U3G1mT022502
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 30 May 2026 11:16:07 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1A5677.000/4gS53C2SFgz51Srk

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

v1->v2:
https://lore.kernel.org/all/20260527124210.19726c1c89a94b89310e5a47@linux-foundation.org/
[patch 1/3]
1. Fix potential NULL pointer dereference in get_field_by_name().
2. Fix data truncation by changing count pointer type from unsigned long to
	unsigned long long.
3. Fix column misalignment by changing COMMAND format from %-15s to %-17s.

[patch 2/3]
1. Add missing freepages_delay_max_ts initialization to avoid stale
	timestamps.
2. Fix Year 2038 regression by removing explicit time_t cast.

[patch 3/3]
1. Fix Y2038 truncation on 32-bit platforms by checking timestamp
	overflow before cast.
2. Mark field_delay_max_and_ts and get_field_delay_values as static
	to avoid missing-prototypes warnings.
3. Fix unexpected unindent in the Documentation.

Wang Yaxin (3):
  delaytop: add delay max for delaytop
  delaytop: add timestamp of delay max
  delaytop: sort by max delay to highlight top latency processes

 Documentation/accounting/delay-accounting.rst |  43 +++
 tools/accounting/delaytop.c                   | 263 ++++++++++++++++--
 2 files changed, 276 insertions(+), 30 deletions(-)

-- 
2.25.1
