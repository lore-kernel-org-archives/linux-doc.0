Received: from mailout02.platinum-mail.de (mx02.platinum-mail.de [89.58.18.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4CB1A9B58
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.18.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771153930; cv=none; b=ICfwEHPbU+y7/iggGP+j8pJjM9MHoj2YrY7qX6wqdzMu9FdRTdvo2wM/n3CsCcvY97zZ20Un9qHhutVwtX6LzdE6unMRQ8nZ9lHmcb4+eYSm/pca+NENwfsSdqzdFLT1J82rMHB1AnrI1k0mj34ZE+8QBgGcCqoyPJM+ABb+DdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771153930; c=relaxed/simple;
	bh=Es3MQYgbEtRJhcUDiHcORVQlM9kT/E2sDVwds3dicnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qL8Fi31PpV2sVZ5RRj/WgLZkU88CZjNvXr5EntxlFffhrGjVk+70wtkPcCA1L3nebUEFx5XBm6pFde8tIdmhBj2AHGyPJjIvyGIqkvm2vptyZxwHEj7zWQPZyNYz32XuHoOMNBdhF4Qlv+XgEb+r2UKCYIC6lYIMMNTsEYuyEW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=achill.org; spf=pass smtp.mailfrom=achill.org; dkim=pass (2048-bit key) header.d=achill.org header.i=@achill.org header.b=YEc07F94; arc=none smtp.client-ip=89.58.18.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=achill.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=achill.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=achill.org header.i=@achill.org header.b="YEc07F94"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mailout02.platinum-mail.de (Mail Service) with ESMTPS id 82C889A29F8
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=achill.org; s=mail; c=relaxed/simple;
	t=1771153918; h=date:message-id:subject:from:to;
	bh=Es3MQYgbEtRJhcUDiHcORVQlM9kT/E2sDVwds3dicnQ=;
	b=YEc07F942K1/DZiWKeXDVghJRyWWk5HKUy883mnLXBkOTu88ZsVmX67dvMt/OLYKBzOvZKDHBNY
	dh+U4HyhhLMBmh90+oH60SzJuLp0KqZDQUK1LieT5DcsqLvNOxmB355+2N3ogt53PNVhCqVXMFyC8
	Hf3884Xd7eLz1Im7eAmBYL3Ju70KspPcxKU8BGped9mktbyYxiVLB2Yjs7r1d3KoWkroLvbAX0OGP
	R8aAxjreXQ/RyhFzasAvEml7eiHNNUZ3GFp7aUkFthyyb8NEWDyX1FASlBs9JdVBeiJMPWrssSAkx
	TLnV4F9uj1rD4mn7fZXtvyC3NXg4Leh6lkyQ==
From: Achill Gilgenast <achill@achill.org>
To: sashal@kernel.org,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Achill Gilgenast <achill@achill.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] README: remove unnecessary comma in "System Administrator" section
Date: Sun, 15 Feb 2026 12:11:52 +0100
Message-ID: <20260215111156.77301-1-achill@achill.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8

Commas before "and" are unnecessary if they are used in the same
context, as it is here.

Fixes: b9a565b3e4d8 ("README: restructure with role-based documentation and=
 guidelines")
Signed-off-by: Achill Gilgenast <achill@achill.org>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index e6549b2a7aac..947265bc64ac 100644
--- a/README
+++ b/README
@@ -98,7 +98,7 @@ Maintain and stabilize kernel versions:
 System Administrator
 --------------------
=20
-Configure, tune, and troubleshoot Linux systems:
+Configure, tune and troubleshoot Linux systems:
=20
 * Admin Guide: Documentation/admin-guide/index.rst
 * Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
--=20
2.53.0
