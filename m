Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5630FF08;
	Wed,  3 Jun 2026 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479705; cv=none; b=nl3ce50D8ey5vjfXVoWRhl64cY66q4mA2r2D4Vjm0zTaqMJ8ss4W0ViyLZrK3EFkjcAIdSzEvmiwxq1JalJXag5s3ofQsEHgcf3iJC2Hr7daSSIEmORKD94Q7NqipssZTAQa9/vNjLQD7ClTR5iRbYfaDnT9vNKRFRxluG1mSmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479705; c=relaxed/simple;
	bh=YCuy0RoHf6fRf1p8RarwpEwPk43mOzcD1sQBfvrj/O8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndNKyVVCcCEmErZjGd4JVRelemrn/KUqt4sq0YRt8O/5ekPxnKzQNDsrcYRJ/lgEpD13UmuaBgZHQ/pb+/9EtoUXdKokBgbRK6Fvrfbg+a9m5Z8cUkyDKy+BkTYeNzrNKeUMwo/eo5GVIfbrTZfKLOH11iat4OcPQOB4eDW9M44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WmIIED4O; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sfClTibg; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WmIIED4O";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sfClTibg"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gVjQF5WW5z9vC1;
	Wed,  3 Jun 2026 11:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780479701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RMjVj7Rb6CckJMh7Od7nssx7qdWIz98Y2GWdthTl/w=;
	b=WmIIED4O2i25egYLrpK9KhDlAxdLEGH5gm4upVncTz4RSZY6Z0HBnuncsgDmm86wY+WSfF
	1mwI74YXO+fU8JWOj2co0/3QVLmHdAIilVxagLAp4ZICmWfmnElJdJIEeF2SFBKZMXwgGu
	I4sUvlUKkYVBV2mjpImN9LaP9Af5V/8mjuLg/vTNtKIxiR7d822RzFqYKHtyQothGiLwno
	WmYfRU1ojNV8tgyVuQ+yY2+Td8JN3I5yuuPZ5FMEHUm3+lx/wclv8Hf+hvDs+gRSoWv5hX
	YIx6SuB75w9tnmCm4XyLLbt0/VMZCg5BYdb7WCSzA5x3sbFXfgYyhkxZQHAx8w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=sfClTibg;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780479700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2RMjVj7Rb6CckJMh7Od7nssx7qdWIz98Y2GWdthTl/w=;
	b=sfClTibgCmnFlapYVU7vdmRj7YJvqJv4PpJpuooF2TVxN8hyji3yau8M6mFbYq05V9egZp
	jGLPF5pZObeDrhdq2q7qHvh0zPVWWnc/8JxPpcnx0JG1wgKEU36lNnyZmwiEFup9V8p9Vw
	nthvtNOeWseKQ6jBawzIOJZ7EvHD1SctledSS9NBjgIKZF2Xp7kzWHbnIf/6k+3xgBojom
	0e+ldW5Ym/bZ0H+9A049UdQm826b8ROeoli2tl8I7j9VBxVR6t0Xl/wp4sg3fEzevQhxYw
	hM/wXzZIoNWnc06XCYWzQCQK4pOlRG2k6EA0+uFLCcRFbYbSvJjYsYRGfFLPEA==
To: manuelebner@mailbox.org
Cc: bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org
Subject: [PATCH] Documentation: real-time/index: add entry
Date: Wed,  3 Jun 2026 11:33:18 +0200
Message-ID: <20260603093317.352149-2-manuelebner@mailbox.org>
In-Reply-To: <20260603080430.344391-2-manuelebner@mailbox.org>
References: <20260603080430.344391-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1io6hs51g51wbm6rrqdihzhreyzse66d
X-MBO-RS-ID: baca012336ed6f9d2a9
X-Rspamd-Queue-Id: 4gVjQF5WW5z9vC1

I figured out the subject and changelog aren't good. It should be:

[PATCH] Documentation: real-time/index: add entry

Add reference to realtime/index.rst pointing to scheduler/sched-rt-group.rst

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---

I'm waiting for feedback before making [v2].

Thanks 
 Manuel
