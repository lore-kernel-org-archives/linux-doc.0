Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814AC3DBD4B;
	Wed, 18 Mar 2026 14:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843980; cv=none; b=ia6G/zGVGdhyUlF+14htOuG2W+P6/EnR7L8dQUYU07mxlmZ6AbuomT3o5qKv5Nf4+LbFFT9IkbqfrV2MOhPzDuULZJmnC9M19z+VvYksGh5zuKkbRSkzfPz0IlWA4z72CSiAmUsbyr04XOz3WLDIqddE2beOrhAXzQE+LZFhBmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843980; c=relaxed/simple;
	bh=RQumy4FMSELMY54MZNf0xAut5yu/9aPb0LwMaYDA7pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fkAm77j+wskt5gNyijhfMraBjGrhM/ep3sScgAfaCRydVKMSpV3swLp9K5IAV0s52BW5LY8vRy4PuEO/gACu2HuXgqXVG8k7D1ENWvf937TkMsOs38Q6s5GMMCa/N4LeSRDCmIPkNfm9D5xyNX7vMGKaVI2Wn2dobY6sdqsbUUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRBhFuVx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRBhFuVx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513F6C19424;
	Wed, 18 Mar 2026 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843980;
	bh=RQumy4FMSELMY54MZNf0xAut5yu/9aPb0LwMaYDA7pE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YRBhFuVxn6YlbZ1BDoL9m72GLWnWUp0cIIlLqyB7hqYHI3nRX5jKeuGrQ9IbQ2PHM
	 mRj52/kZHWPxwLpZNRjUHVUIQ0O/9LXfkOeyvkPLGjM5/odmJFUSLuhNa0JVgRM51v
	 RKNLvL0ozK5csN2anc0YMKegVQbDJRARWC2GqHQNOrhm2+8MQwWZPwuXMBLVlwpcgm
	 am+I1UUOWcMBKau0+G2gfoK25WdDKKUdMcsA14+j3jJKZFIgy1J20mhC7JnNv3ffpq
	 5uiIWu0j9GhDS8vcdSU/IjMdu4MRJiKq0qU9Ef5Rqn4SsYjDNoqhWkXgnCMyoSGQVP
	 22rzpY4yTL1PQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2rqk-00000004HeZ-1oVf;
	Wed, 18 Mar 2026 15:26:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] docs: kdoc_output: fix handling of simple tables
Date: Wed, 18 Mar 2026 15:26:11 +0100
Message-ID: <d9538e3c158186ebef43923e5355b8b226d99700.1773841456.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773841456.git.mchehab+huawei@kernel.org>
References: <cover.1773841456.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Fix check for simple table delimiters.

ReST simple tables use "=" instead of "-". I ended testing it with
a table modified from a complex one, using "--- --- ---", instead
of searching for a real Kernel example.

Only noticed when adding an unit test and seek for an actual
example from kernel-doc markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 1b54117dbe19..2bfcd356654b 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -846,14 +846,14 @@ class ManFormat(OutputFormat):
         colspec_row = None
 
         pos = []
-        for m in KernRe(r'\-+').finditer(lines[i]):
+        for m in KernRe(r'\=+').finditer(lines[i]):
             pos.append((m.start(), m.end() - 1))
 
         i += 1
         while i < len(lines):
             line = lines[i]
 
-            if KernRe(r"^\s*[\-]+[ \t\-]+$").match(line):
+            if KernRe(r"^\s*[\=]+[ \t\=]+$").match(line):
                 i += 1
                 break
 
@@ -969,7 +969,7 @@ class ManFormat(OutputFormat):
                     self.data += text
                     continue
 
-                if KernRe(r"^\-+[ \t]\-[ \t\-]+$").match(line):
+                if KernRe(r"^\=+[ \t]\=[ \t\=]+$").match(line):
                     i, text = self.simple_table(lines, i)
                     self.data += text
                     continue
-- 
2.52.0

