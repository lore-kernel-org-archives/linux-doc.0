Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015163A267
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708358747; cv=none; b=WVqBVJpdViEnDdEYULmK/DZIS3V2dbaO7TvLd5wGK5kP+9LfyOOTdozbqunB2TouVvc7VUDgbA4Syeitl15Z3Bvj8xNk0laqre9Y6C7oyLSv7wBfZAYpORTQG/b1QEcXfg+4vDp/hBt5POq4ZjR6DmC+BMzkrTacEFRiNZI5gpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708358747; c=relaxed/simple;
	bh=oiub+Frwe2xQQQjteSUs6NCVlmCri7tHEHSSf/abTLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GylbmHp40tuzlkMcXCoTTDclldFneP0GvmQbsyKqjke2n6XCA7OMK2WvQcKUESPCA9ZZnfGJZDio8sFzEe2mas76EqauI/1M0O2HMB+zVzmfuTar+hWU8Y9AdqQHvlIlWebm7dAbolzxEqJOL9EKcaEpe2/1zH3CIBA1yH+iAYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bRB72+ha; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bRB72+ha"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E800A47A99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708358740; bh=5CtOWSNnQycldQx8oeTZ2HZoC7UmP4ljPNKekcr8eiM=;
	h=From:To:Cc:Subject:Date:From;
	b=bRB72+haMH605ZXBsZQZhwtx8hgmm+tTne0bLrqcC8UsqMqZv86I8n/1LcvvtRPWp
	 p4TuZFwVAR5ZfgvdlhkjzkEMjuYs8e9/z0yr9DvY2vihaDYR145DNuqRYb3fXRp7C4
	 8EYPqW8+ktwmfQ2KS8D7SqXqWrkeXO3kazAXm+j3uxarcJGkmiyjz3ZDTbO+HiSMd9
	 YnNNmIkLqj5dk8UoRWmfrqZ6t/ZudfyzHWmXFQJO/NrTqn1mFFr5ieew1zn6fuZP3a
	 gSTt++7mapmOXZdeb/RRcZfbeZwUkFD8egKJcrTQFRBCwkMLjDQ12tawHdo7NRLlAE
	 M5etJtHN1+kRg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E800A47A99;
	Mon, 19 Feb 2024 16:05:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] docs: Instruct LaTeX to cope with deeper nesting
Date: Mon, 19 Feb 2024 09:05:38 -0700
Message-ID: <87jzn0qw19.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The addition of the XFS online fsck documentation starting with
commit a8f6c2e54ddc ("xfs: document the motivation for online fsck design")
added a deeper level of nesting than LaTeX is prepared to deal with.  That
caused a pdfdocs build failure with the helpful "Too deeply nested" error
message buried deeply in Documentation/output/filesystems.log.

Increase the "maxlistdepth" parameter to instruct LaTeX that it needs to
deal with the deeper nesting whether it wants to or not.

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Link: https://lore.kernel.org/linux-doc/67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com/
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/conf.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5830b01c5642..da64c9fb7e07 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -388,6 +388,12 @@ latex_elements = {
         verbatimhintsturnover=false,
     ''',
 
+    #
+    # Some of our authors are fond of deep nesting; tell latex to
+    # cope.
+    #
+    'maxlistdepth': '10',
+
     # For CJK One-half spacing, need to be in front of hyperref
     'extrapackages': r'\usepackage{setspace}',
 
-- 
2.43.0

