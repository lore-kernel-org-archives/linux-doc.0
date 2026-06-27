Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1A22097;
	Sat, 27 Jun 2026 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782551801; cv=none; b=LHqudU5NOq++DWaTES8tO+2rUiAvZfkpkThM1Fa6+IeGrigSoW/pG1sugtKrdQdeuGkEivOxoUvuW63NPr/nIPuiGiBn+MYKyWKD6jQC/h7TymPulQx9vY8jAkhE/mZmS8oBKjJuOjL7W48qvvNizc1BUaLEafeykKgDdUtGmQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782551801; c=relaxed/simple;
	bh=0+39H+jlZQFrrSVDZvt5cw7adjvZy8wUGui2JNU2wYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fey7oxftokDPqp0xBrSpDsMZAkwo3iXEFfIll5OIUWQBXPNMire5o754LaaYl2vF4x75eaqJD7t4iGMcdx2NBPYGDKLOKncvMmdCz9DZ75i0dPXJUsWXGOXJye2WLuX48aau/R/AD+IwnNb+f5eu/jxVmlqF0XdwgUMn1pJ4cM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LXcX1LKO; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=N6g/A4d4; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LXcX1LKO";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="N6g/A4d4"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gnRkF6G7Nz9tZg;
	Sat, 27 Jun 2026 11:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tTLV8NGeGUyXhIO1u/kKgJ3EjxcxbtPXot/QVNHuLGE=;
	b=LXcX1LKOwaRyvC8ap8quE0YVKP06EBxiQwc9cZRrV/lbBYIhpTxRhd2L85p+qwxltnGFSQ
	SLY5C471Txd+pq+q4y2Tk4FhBbQWFVjZ9sRrHn3tH/pcSkCgOHusVmuvrRaME3HuW+SUQ/
	aavSJLiTGop4qe+B4jNcDyNs+2S6HXTJJ5z4UXT57HwMOEMT+qeuaIHcIFEqRLeX7HNnQt
	PjuiFeGHFAkwY8pb3CBQhvrBUiNiqihKH9zqDT9E0jdl5030RX/kGIGYerLOjDou7ZFstd
	OceuXnLhqJ/WsgeT4dbLsjadBCnwu1UtUDsZwE1tnnZIiZVj8aZ60CtR5+HeHw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="N6g/A4d4";
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782551796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tTLV8NGeGUyXhIO1u/kKgJ3EjxcxbtPXot/QVNHuLGE=;
	b=N6g/A4d4Sea3xGfwYGuH5POBWZ80arpNOXc8w+VL1PWaZWXtkudr+X7LFVnPw/Bo7/UBGW
	hivuowUo15CUVVtA36j37Mkb2I2aaAeBbtrZcn3cskWxlZ4J96KdYlZ6+7qFONnt+wmuBu
	KFPnvVTl/Hkp8yEOsQcNO8MG03/ftTTofNdVE69GRdhfsnem9bvCqnMBXN9qeQB7rkU75U
	LXWg0ygOP/anBLF0fGDJTXcEQbfv/KBf0RSpghoAHmSt5OTQMjDGP3ICuuVvx5o7gvh8u/
	hBxprRDaJxk8dHJUw13h9M3TXuNA2whOPvqZ3O7ZEtapYhULId3hasm+M1HATA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] docs: kernel-hacking: fix typo
Date: Sat, 27 Jun 2026 11:16:04 +0200
Message-ID: <20260627091603.29612-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 1b2d77ab414a6d88882
X-MBO-RS-META: 49xi7iymotpe5m1mh9jf1jd9kyxgrxsx
X-Rspamd-Queue-Id: 4gnRkF6G7Nz9tZg

GP_KERNEL -> GFP_KERNEL

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/kernel-hacking/locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index c969c76ef7cb..9c6c76d3a723 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1317,7 +1317,7 @@ from user context, and can sleep.
 
    -  put_user()
 
--  kmalloc(GP_KERNEL) <kmalloc>`
+-  kmalloc(GFP_KERNEL) <kmalloc>`
 
 -  mutex_lock_interruptible() and
    mutex_lock()
-- 
2.54.0

