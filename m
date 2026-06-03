Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F855383C88;
	Wed,  3 Jun 2026 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477707; cv=none; b=Ku0AUUpnlT9b8Rq04FGpRt6GTAjSFs92z+YktZALhiJTvZ428hUn+3u7tZTf+SB8S/vqW2JahrlLsI0TJMAIzEW7PSc2dIMzsDOm5i4aYoz734B7BAQ12+01JSI2oLb/HwAsmuJjh5gykTuXwI/M4cji0rwpRldctzNXyA34t9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477707; c=relaxed/simple;
	bh=MhEggEhLtJkCYnpllsxfUzKNPa3nR8mHPL8GcLfw8h4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jw/Pbs5N7rM2WCuy5oGDjx4HoOX0PnBhFB4rF8uCNozmhXdYjiyK2v53bUMKFfoBAlEWfFuTtXOdhnNjVuZ8Rezl+ydu2DwtW64Cugwx0UfVQlIrfFTjefqQYn8h3HK+lKocEvBln9JZCQpgE3Ki7mGvDyDrzo00nvLBDCAidpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RzzByd/i; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vHA/U65a; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RzzByd/i";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vHA/U65a"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gVhgp4S4qz9v0k;
	Wed,  3 Jun 2026 11:08:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780477702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sIGMcHmhv5arFG51+YUHnI0pygJcWQtPQF0pLRiQrx8=;
	b=RzzByd/iel7ErcQjDws/QfTVu5DH2WSTqU4rnfaRGVZ05+f+U17g0ctCddMBKpLruL8qiu
	M4Pfl0jEr1RnOQ0bUlRJcqib8Dd5ovBQxamYvpqULlea029281CJwZKyG7b54YxjtfCjoo
	y7SVTzYXlraZ0AC3HzjIr2qDrRHAfnbiiGU9WFrWt3sR5fuiAFUwLr0Hetnij9ww6QYz00
	ZV7PfHOlT/N6Lci6bGFBHB2PGVeBd2mWW3NuYshMW9kfvHxhp9ufEforOy7UltSiYkw0UH
	fJAAT0MxTncPZqqfsoGm+rjzxNdSILp5HZwkul9kghOXnQRwFq3uI2tdihZv6g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="vHA/U65a";
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780477700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sIGMcHmhv5arFG51+YUHnI0pygJcWQtPQF0pLRiQrx8=;
	b=vHA/U65aXB47tGbR6opbghwna9Apwu0JLD7XpECSfJyjT4BJTTi/xOsvrjUlvcTmiNj8/B
	Fe6FKxjAMR8Luu1CyCkO3BF+h1vbe3BpckTuYsI793MKJ+W3q4RH1bGudx0MrA63+FfCP4
	Q46qm/JObzFtG8X6rwRCPjwMKRMQNmUUTh936/Z9CmgVub614X2Kt9+VIUPsDv34msRcyR
	qV82GBOgndy9At90i6dVr75pNhBfVz9tUwqDosXkOjRi2uSpiy1WC+gGqbWMRJbjv8rxJN
	TAsGd2Hi9F/WtWZdwYUy5uqkIpmnI2XaYaLXj2dHkDkU7re1GtEdYDuzdJEGtg==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-rt-devel@lists.linux.dev (open list:Real-time Linux (PREEMPT_RT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: realtime.rst: adopt type aware kmalloc
Date: Wed,  3 Jun 2026 11:07:13 +0200
Message-ID: <20260603090712.350245-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: h7kdg9h8m5z7z9rxri4z1j1q6bef5d49
X-MBO-RS-ID: c1613c91afe2c4dd87b
X-Rspamd-Queue-Id: 4gVhgp4S4qz9v0k

Update real-time/differences.rst to reflect new type-aware kmalloc-functions
as suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/core-api/real-time/differences.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
index 83ec9aa1c61a..6c2cc97b4938 100644
--- a/Documentation/core-api/real-time/differences.rst
+++ b/Documentation/core-api/real-time/differences.rst
@@ -128,7 +128,7 @@ PREEMPT_RT, the timer must be marked with the HRTIMER_MODE_HARD flag.
 Memory allocation
 -----------------
 
-The memory allocation APIs, such as kmalloc() and alloc_pages(), require a
+The memory allocation APIs, such as kmalloc_obj() and alloc_pages(), require a
 gfp_t flag to indicate the allocation context. On non-PREEMPT_RT kernels, it is
 necessary to use GFP_ATOMIC when allocating memory from interrupt context or
 from sections where preemption is disabled. This is because the allocator must
-- 
2.54.0

