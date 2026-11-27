Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761546;
	b=FGdbAIGlYdMt6gehJDmofqoo95H6AmwMJ+tFdxt2IatrIbeoJmmpzgWyXVFq3hCilwmS
	 7jT+Mn0Qz6PDi+34yHQNvaBWq8JeKWtxl0YTSnhDPcuLCH4G4UGMTM2vrAOWybHyNEfqO
	 JUeVGCzS5lco+Rmf8Z8b2BikGSquJZ2lh2F6KtdbPGMgd8wOu6n+KJupy+kq+6KOSk39b
	 HZpf2w+/ayEmGEXJ0xD5mjM7qh/4mOgMbnioSmgOTELO0FZdon/KuIfg5Kf1Vb87Tvx4x
	 /WWdFhQVxZ42nFlAvHK8EllglLRVpK060h90WFGkH6HBdFcxH5rHD+Yeh/8W0HVzDuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761546;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MCSAjc6DzSlT6FCFuOQYU7USlHYMQ+TvwtY7y0+BgR8=;
	b=PBLTCdDPoUo9d2mDnkErtQaXB5o0XKj0CQv2r/lcw4uNOaDOfQuytlxgme0eL0eLX7rS
	 EnoS2wcPhNRKbrrY8wSAYy7RPJ6WJ+UKzUctYf9c0kTAOdCv88o3GLUmQQeqz3fYDyVbf
	 yXY2sJgMB8dNpm7J+BasPsWgA1x2MMN/izO3n+4ezJDfBQX9TcCOusj4iMYMkpHbZqobV
	 M/ptpe+OkGs5FNiRWIgTE3NtvVqCEOZrC8JIR2pHcuDcg/8v/qgG2v7K6YTe6OdSCnYzx
	 AwwzO+e+qMEQ87wnrRQi9MmOlqdgqbbIx/M3OGMLLSWzI/wAecC747p9gwugof+TNkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X9U0Qr54;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A015606A32F;
	Fri, 27 Nov 2026 06:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X9U0Qr54
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761546;
	b=hth7NvjcJyNePQKZyawu5+2+Zddl4J74cGMeIEqA1e7iXFdW+DN4ozJx4dEzUumIJseb
	 9/F8AuAsxELLArbLdbMSyS+JgBS2u+4aGbEUlxShWK47y88sWLqtzZZKPT+YIzsdxPAd0
	 QOKdd9ROh8WTm4zAw1v9dG2eSTsnSm/81B+hoPLkwa3ERYdEYmsHSwCrldN9P9KHJs3fk
	 2Ny6ibSh2NyJbWY9qUKybIFqRCgaMPqOHzFfDAE+jjNIBVu8V/gNQuzIIKkeDi4n+sCLr
	 9XWd+UxMP5VQ6TMnlv0NLbD9cZnUJmB5OrB7yr6lIT3ZaY4OidLRRAWnjuB/jFxcScg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761546;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MCSAjc6DzSlT6FCFuOQYU7USlHYMQ+TvwtY7y0+BgR8=;
	b=mrgxbCDl1mY9ticjoeZTe3ualBCh8z6zNQ6rtfiUYObIFjxjUEF2TYG2qPLcvP0E/Ldg
	 P+MERyJlES8OcdH7jaV+mmBZ4O+UiCAiUQ7vkGEySh/OdKZZjuAYbn/4gDNKi9a/oPHWH
	 TBXUypEGSyQ6h61pMjjUR1ZrrVzSrvcZl087j/ylXWc1bJ00/r1bSyysbKrr0C2eOWAt+
	 nonQuIycyxAYknF2fHborrwO4dZSDE4Ob5OzuDPosR0SNFB1PvuHDNZiQ98yCit5tULww
	 ARiTX3ppcCBnniOOj6alFX6iYsdBgaozkqTKpFVK+VdiYCsuWkFX998+o4kMLKP1W2Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD75B1F0089C;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761546;
	bh=MCSAjc6DzSlT6FCFuOQYU7USlHYMQ+TvwtY7y0+BgR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=X9U0Qr54nsNxOqC4ZzCqi5Xt471dqf3QM2qpCQkFuguPe/E7xmk+or7b1O3uaEbwm
	 Q6PJkp3TvqxPxwhaMf0DgOFuWf1ANjvo2EXEJMgAu3u9dDyzVhQ6b5xkL1TbMuO0SK
	 RMJzNGYArD+xJIL2U602FGI6iiI2hqtNY6MSweY+Vn78yfqslFBM7kbz0LC5Egxdxb
	 cWxLlldo7Ecka4iiOqw+eGcuDSMSWPZ7fbt/+iN7hY94LLZpMTuE0z88Kucv0n7ia1
	 B7ik5TqVf64icmmiIv+gTzLn2HsgGU6/RAUknRaprMbzJvxjNV9LKS5jmKxZILqkrh
	 /j/23HVnJ8rNw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E8A44B5C8;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:41 +0200
Subject: [PATCH RFC 04/10] coresight: cpu-debug: Bound the power up retries
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-4-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=OKoXj3xk8yJN6a1FsEpY+jvEvBIQaBsnTrhXnixY+6k=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqoUHlzLNaDeaHN8Y25xg5q3QzJX17se2/tWX5r2dJ
 XFaRmtvRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZjIh3yG/4WmBxnvb+LcsUfz
 5OSKAxEVMn/kdr14dmhepnPjPZH9qUYM/wPnHf+1ULe+frm62Xlf9tCPs1uPP0qTWvNt3ukVIu3
 /1TgA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

debug_force_cpu_powered_up() starts over whenever the core is found
powered down again right after CORENPDRQ is set, with no limit. Where
the power controller does not hold the core up, the caller never
returns.

Give up after three tries. EDPRSR then shows the core powered down and
debug_access_permitted() keeps the caller away from its registers.

Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index c55de98100a3..9a8ce85fc468 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -84,6 +84,7 @@
 
 #define DEBUG_WAIT_SLEEP		1000
 #define DEBUG_WAIT_TIMEOUT		32000
+#define DEBUG_POWER_UP_TRIES		3
 
 struct debug_drvdata {
 	struct clk	*pclk;
@@ -147,6 +148,7 @@ static bool debug_access_permitted(struct debug_drvdata *drvdata)
 
 static void debug_force_cpu_powered_up(struct debug_drvdata *drvdata)
 {
+	int tries = DEBUG_POWER_UP_TRIES;
 	u32 edprcr;
 
 try_again:
@@ -186,8 +188,8 @@ static void debug_force_cpu_powered_up(struct debug_drvdata *drvdata)
 
 	drvdata->edprsr = readl_relaxed(drvdata->base + EDPRSR);
 
-	/* The core power domain got switched off on use, try again */
-	if (unlikely(!(drvdata->edprsr & EDPRSR_PU)))
+	/* The core power domain got switched off on use, try again if allowed */
+	if (unlikely(!(drvdata->edprsr & EDPRSR_PU)) && --tries)
 		goto try_again;
 }
 

-- 
2.43.0


