Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751E81A9F85;
	Mon, 24 Aug 2026 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555067; cv=none; b=W5qDIrowl88V/4QqrMn701pualfMBZt3MnJBHft8u9i+dr0tCxolJPfsCKTOQL6ckjsvFuBy6AE/olCEsRcrSTDuKi4zSgI9n73tkoW8OsHmq30cQ0nW2tSzQj9Cttvq4tV0OfID+DDyAmiwEU2Kk8NdqPbuLi8546viN4xnqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555067; c=relaxed/simple;
	bh=q/MK3OL/7L5bAdi8Kr2WaFMj5bGhDSJSCVcljstFFLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bIge6jLDznX1ps1vRHvc1uPGEaFag5hLS+5Ktzj6iw3TO7eB3Y7JGbPlPlI/XcvjeHVrj05xHozHC7DJVFH3L1TcL8rGiyky0nNqRT0mhOh85GR0XPdo5tuGKduOllCwBAYgt2Ro/a4gXfCpF+84WlbzWeVUn8Q79Ua61mwp16A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lly2NkSj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TvPCCpJV; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lly2NkSj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TvPCCpJV"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hT22l4GC1z8sYl;
	Mon, 24 Aug 2026 09:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787555055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JcDa0IHrFVs2lonWyMOr3u1P3rP4Vv/HhBKVTpznk/o=;
	b=lly2NkSjZPymky/xmG04VkcqCp053/d5JmBFU0VS7u6jtsr8Bs3zo6wNfYQhFpWqS+ktyu
	vkZUgT9piR7GnF2rllN0ymXzJl6uOrh+3SmIp1wiHoMFHLyJA0zqavKUxg33W5czJQ/HRT
	9K2E3acNGvEu4OBZh5HN+LpXuPVwA43p97WNvjv85shbaN4e+Kf2SuILE1hqDID32KJGvL
	4nn9TxXPOABX/eDSWVyqQ35YfTFAa9HRx9zZ8NCMPSsfIhtZhWMGfAsXgW8z+9AB0mrNdi
	R2ZFxnzmkmaeZwtO9/aJU3GocV28L9zxhbDsXp/Ftu3bKYeKpbratmr3FLfpSQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787555053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JcDa0IHrFVs2lonWyMOr3u1P3rP4Vv/HhBKVTpznk/o=;
	b=TvPCCpJV/N3QJy2X772+t4shRMtrZK6f53P9pWB3diD2g8GtBanM67TBmDtRqKRb9E0iDP
	U2qQNyypGvtfPYLgTfuXf6fAISaWsyYBjsA7pc5OyIuldRTF3PIBR6m/XoGvVLKrxebrzI
	rfuz9kgeM67BFTD86SQg+ZTQcPe5TUHcBNb5dzjvfl9uq6Bcbc5IDP2dEaICUyyMkHap8x
	wlkNkrcA60gCefG84PDYZcq/WJfG812P108HXxnoS+Qb7wuYN64YYJNDa+75o2JrwbYQgm
	9dE4XdpMvC55hOf3y4e7nmpwWGK7Z04BnWzTSj46w912laENzDEMVMGGnLtAyA==
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: automarkup.py: add skipidentifiers
Date: Mon, 24 Aug 2026 09:03:09 +0200
Message-ID: <20260824070312.332802-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 67a63fb6ac519fdd17b
X-MBO-RS-META: u91mu7kzxb4uf8yjbf3emtrkkey9q5x9

Add skipidentifiers to reduce wrongfully high-lighted (bold) words.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
Pre-patch discussion:
 https://lore.kernel.org/all/bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org/
---
 Documentation/sphinx/automarkup.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index c2227ab0a..8a6174950 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -51,7 +51,10 @@ Skipnames = [ 'for', 'if', 'register', 'sizeof', 'struct', 'unsigned' ]
 # when following struct/union/enum/typedef keywords.
 # Example: "a simple struct that" in workqueue.rst should not be marked as code.
 #
-Skipidentifiers = [ 'that', 'which', 'where', 'whose' ]
+Skipidentifiers = [ 'and', 'are', 'as', 'containing', 'in', 'including',
+                    'is', 'name', 'needs', 'of', 'or',  'pages',
+                    'passed', 'randomization', 'request', 'that',
+                    'to', 'where', 'which', 'whose', 'will' ]
 
 #
 # Many places in the docs refer to common system calls.  It is
-- 
2.54.0

