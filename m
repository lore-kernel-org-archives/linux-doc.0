Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9DE3C2B84;
	Wed, 27 May 2026 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890129; cv=none; b=P5xAAakNLdm9Wg04qYmxcM+zYlicn70jGci7Mlrnr97liV/PczqV1Ty3t1vPv4TtxD62LTCB+s7L1N3P4DthWzilyNTS+x3LiEYVPJvIPOr4hYmlYinqj5zL0COr1gK9U9S2amisKkRp0a8Jtr6K0qJFCG4gUOG4Q7wioKXjiK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890129; c=relaxed/simple;
	bh=NHz39xYLTeVYIKj/UzhyJPaWvoqcWWwv9ZkniHT/Tvg=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=C1VBqucMnxQyO+OUUOJvAklYNtwmMp9yPZUDiwdzGAW1Da2uZ3KsO06dk2lswPgBTkXowXuPMXHq4X0XVEoI7Fe7auI+P5rJS0hnWPHBPK1NCQ4Xrvc9Gs2Tpx9VLtgSwwV/KI0R63utIFr1hThwxoonY38As5Eopfq155s/80s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gQWNB1s5gz4xNtl;
	Wed, 27 May 2026 21:55:22 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 64RDtKKQ073485;
	Wed, 27 May 2026 21:55:20 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 27 May 2026 21:55:24 +0800 (CST)
X-Zmail-TransId: 2afa6a16f7cca0e-0721e
X-Mailer: Zmail v1.0
Message-ID: <20260527215524044fG7XSpgveHiaFhraq0yAi@zte.com.cn>
Date: Wed, 27 May 2026 21:55:24 +0800 (CST)
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
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvM10gZGVsYXl0b3A6IGFkZCBkZWxheSBtYXgsIHRpbWVzdGFtcCBhbmQgc29ydGluZyBmb3IgdG9wIGxhdGVuY3kgYW5hbHlzaXM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 64RDtKKQ073485
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 27 May 2026 21:55:22 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A16F7CA.000/4gQWNB1s5gz4xNtl

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

Wang Yaxin (3):
  delaytop: add delay max for delaytop
  delaytop: add timestamp of delay max
  delaytop: sort by max delay to highlight top latency processes

 Documentation/accounting/delay-accounting.rst |  43 ++++
 tools/accounting/delaytop.c                   | 232 +++++++++++++++---
 2 files changed, 247 insertions(+), 28 deletions(-)

-- 
2.25.1
