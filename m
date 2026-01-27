Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024982ED860;
	Tue, 27 Jan 2026 10:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508821; cv=none; b=GiFFLFaXT2UDqNIQuH5s9QnnOF85NxXCURv+41khyAIl5KjnxMfFgVvYlm3t/aVC7dJARBJQiwyGCn/9vBOIwwlkWALRdBhGdoeRcP7nODbRM6PrHMpZfK2iErmyUTt1iXes+VBT0b7a/Lb2t55BlNKo2rsbiNorMVxMZb65oUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508821; c=relaxed/simple;
	bh=59u4RokGX7YOtU3w6aLy3cf17JHxxjI+Ds3wbqpERMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tXZAubdzJ/3DD1TAIgylxEhB9RCqp0ZycSUJDWg+BpiX1sRWRjttovRBeiGyAi33534Do7bF0ODXMxZSEJOy5o3XiAw0FXHJfWdk/GjhBwdPRgzArxRyYdP+HdktMuKC5nP1sDFAmNAgM8VD6Kt3IFhiHAdUbXnJFLp/5voBS1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7aUvMIE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7aUvMIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDB3C116C6;
	Tue, 27 Jan 2026 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508820;
	bh=59u4RokGX7YOtU3w6aLy3cf17JHxxjI+Ds3wbqpERMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K7aUvMIEApSlgN0dmYgcKZeVBzspEVZkOOjTiaxrSbCy1HzTTOoGF+LRUriwTpH0s
	 36Vqye2QiS1fQY0zHqZnYl9soi4NMCfkXNAXxakc775CT+gKOtzmE5YADmoZR7izLQ
	 ZLqufa391rxQfEv3Q0cFm6/PPCBoO1VQ94BHyOSr+IpAG5Xp4cgDKUdMYtrZGRk67N
	 bjyrLgNuy2y9zRXicdn7nNwfuWQtZrucDJi2dcSs8tYCe+NWamDkNBkwyi85agkKox
	 EPN/IjmP3dKWtXir3LUj8enlTA2UbguF6h0Y4hNT3kKufMhENyHcnkuovBvcxGNco4
	 L9vAg7cVhDpIw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4o-0000000BVHP-2acg;
	Tue, 27 Jan 2026 11:13:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 01/14] docs: kdoc_re: add support for groups()
Date: Tue, 27 Jan 2026 11:13:20 +0100
Message-ID: <9402e3ae306d9a0c00dbdcfa2e5fc670b5b2d199.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add an equivalent to re groups() method.
This is useful on debug messages.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 2dfa1bf83d64..78322bbf29e4 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -103,6 +103,13 @@ class KernRe:
 
         return self.last_match.group(num)
 
+    def groups(self):
+        """
+        Returns the group results of the last match
+        """
+
+        return self.last_match.groups()
+
 
 class NestedMatch:
     """
-- 
2.52.0

