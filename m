Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643B81ACD;
	Sat, 27 Jun 2026 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782551338; cv=none; b=e6E61cX8ZFPFVfcB4pR72TP2bWhNDIIsrHdaGY9ZJNgPffVjuzxy5tUOlvZNgxasfWTt1/cfmrIdy605ATdyRppV77MwPIKDo6SbMPVJIrLPQj4umjggFGBy6BGOYyTTa/vGtuHnTaKOfJJX9xbnD3A/AGrPrUGi8UGYMPISuds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782551338; c=relaxed/simple;
	bh=IAiTq5vQRKdRUcJS9OWfQSm8Xuq84AwPxoZsWsY5clk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfWwpFMghzUW65giBPFPhhOuTCQaZt9/BrRuzXtH1MXlUBIlacXBVK3RpGA+VPnvNIAkukeUDfZgsJm2n6Osvnccpo1D31Lw4WoqiqNwOERin0MxsqyGuHOhxf5Xd6dR/SCsoQTW6edRQ4GPZsN++1bjGlu8B3/ziBgSER4eOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LZfLlsau; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jWKvmbTb; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LZfLlsau";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jWKvmbTb"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gnRYC4g76z9tvB;
	Sat, 27 Jun 2026 11:08:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/y7B5JvdYRXwDHLgBnHY1/dWi4rAUck+xQmzYFmTSFI=;
	b=LZfLlsauISaGcxnntIUN8iSooJpm5i0GyBEjXc3/eVaXjDxS09PriYhLBkKdJQeyBqaJYc
	NpD5PMzitsNiGb5tCQTXs+64vRTSIBGkOO8B6mSEszYPBaos0vha7EDefMoCVllhyGacit
	BIIxz2tNCgO/WFOMVnW49N8zPghVfwxAqWBnd7GoDIDXjumyA7mW9UgJuXbab3rsrCQOlm
	RjTzktOphChMcCHkO+rfa1WKUBVMnbYUhry7hsC044dvenlobpvP4obNS6TL6S0HPL+o0M
	rlB1c63hsCFSXkcHb7NiEgpl06ETYIBGDDi7NYyLIKGYYDbLjR7kyLqXdQyoVQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/y7B5JvdYRXwDHLgBnHY1/dWi4rAUck+xQmzYFmTSFI=;
	b=jWKvmbTb9HAsKagyJc0Diw7XPpPgVzPXhnBbQzYlR1wragAK5tT/6bEXuTGkN5aJ67Jgqc
	KEm9CFpv9PAPjiDWhAk2DDtL2dkrTfxWuagMbjP1qqjhlEWnfZHSKsC1bt0TbOtbfKBsQV
	STO8JwiltdoOpbLbQdL3RZ7dkGag/U8j5HfI3Q4xc7YxvRLbDp/iJNjjnCwqeWoIvcjGPv
	WngJsXrWAn2tsLd8fg/wxIJTSxi3fFvIlbXBrSK5e3TzDuCRmEmmLpvDILoPt3KRw/9dM4
	XHfdWowvUh1W43bO2dORAZDI7ulUED1rAHNWKAwIskyyNwcT9CdI29QzBuDesQ==
To: "Paul E . McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	Kees Cook <kees@kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: RCU: adopt new coding style of type-aware kmalloc-family - part 2/2
Date: Sat, 27 Jun 2026 11:06:06 +0200
Message-ID: <20260627090605.28955-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: toms16ezruedieimsoq8tumxnnaxn4th
X-MBO-RS-ID: a345aeb498d2b7c5200

Update Documentation/RCU/* to reflect new type-aware kmalloc-family
as suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
and family")

p = kmalloc(...);
 -> p = kmalloc_obj(...);

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
A similar patch sent by me has been applied. Back then I wasn't familiar
enough to convert all *alloc(*. That's why this is " - part 2/2".
Part 1: f61bf5fdf77d ("Documentation: RCU: adopt new coding style of
                       type-aware kmalloc-family")
---
 Documentation/RCU/rcu_dereference.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/RCU/rcu_dereference.rst b/Documentation/RCU/rcu_dereference.rst
index 2524dcdadde2..5bc3785ebfc2 100644
--- a/Documentation/RCU/rcu_dereference.rst
+++ b/Documentation/RCU/rcu_dereference.rst
@@ -236,7 +236,7 @@ precautions.  To see this, consider the following code fragment::
 	{
 		struct foo *p;
 
-		p = kmalloc(...);
+		p = kmalloc_obj(*p);
 		if (p == NULL)
 			deal_with_it();
 		p->a = 42;  /* Each field in its own cache line. */
@@ -293,7 +293,7 @@ Then one approach is to use locking, for example, as follows::
 	{
 		struct foo *p;
 
-		p = kmalloc(...);
+		p = kmalloc_obj(*p);
 		if (p == NULL)
 			deal_with_it();
 		spin_lock(&p->lock);
-- 
2.54.0

