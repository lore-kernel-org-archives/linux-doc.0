Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464A395DA9;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396652; cv=none; b=fEA6gCd89p1tSSRr6wbh+ABKMzGciWUAmkLciaLjPovtc3uLEAzkRfSAAvGUpqeJFsRFDIbXuLi3V0b+9r8itgliHC7Nc9DNvP2RwA+Ed2t5dTP8ujqURZOxHUw8ee8qq85szm25xN2Gxjh1iJhUQ7j/cu+RoTN7giYqJZ6gA5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396652; c=relaxed/simple;
	bh=exjBpROHq5nt6ys/3V4S6O/quh/Jy14gJjvOKZLMHAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9HHFLfJ/UFfIyUN7loa9+Pdfd8WIXyo4Rr2XdsLUNx1WCb6eIAwLEOX8J3wuXVzdSdhXkRwB32FC+EYYmZVA+NyQ1grQgg4Y5EPMEkwKJNM/ynNFkgaB48gw+U10DKouckSTVlxbUMZpqIphNDga+FIc3k/awPqhpXmSPfOovU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lysnj4L8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lysnj4L8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4FEC19422;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=exjBpROHq5nt6ys/3V4S6O/quh/Jy14gJjvOKZLMHAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lysnj4L8lUZvSwqK60AHspBOkTZk+2/TeppDAaS1mLPdQhzT0iTKtJOKsLB3hEqYs
	 23LR77WTMpKMuuiR2ngmoDinnXD4gMwp2B5+/EQpG4rRGQ8ojc5Mv8UNkPQMkv75iK
	 CZgqq3xStmN7bJPeplMUxYHcxBRdKUyC/FaspSj/dP56MrXyKCRl2YKq7LIFo6RYw2
	 e77DtU2x3zvqCE+6POxIXvFuup2e6EEzEi8JumkH6jig+5FSKcG1ofQ/BaPRKrLBgg
	 MW4Ko7QzSmmvB9TBrvTcAZ0t9i37GE31njh5hS8z7oTGR2+7sfQwYzc1uD3JIHmFZ/
	 IOQjdlDPFSPhQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002mxY-2wEi;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 01/13] docs: custom.css: prevent li marker to override text
Date: Wed, 14 Jan 2026 14:17:14 +0100
Message-ID: <8a6e0e40f45a6e92e18c20f6c98f496ab5beaeef.1768396023.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768396023.git.mchehab+huawei@kernel.org>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There's currently an issue with li marker: it is set to use
-1em, which actually makes it override the text. This is visible
on indexes that are deep enough.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx-static/custom.css | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 06cedbae095c..b6a7a5f6b6d4 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -30,6 +30,9 @@ img.logo {
     margin-bottom: 20px;
 }
 
+/* The default is to use -1em, wich makes it override text */
+li { text-indent: 0em; }
+
 /*
  * Parameters for the display of function prototypes and such included
  * from C source files.
-- 
2.52.0

