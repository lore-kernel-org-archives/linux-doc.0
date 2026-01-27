Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912FA33CE87;
	Tue, 27 Jan 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508822; cv=none; b=mvfL8HBce+nBPdp+y/sL7uRLyKVeozEw63vr2ivd6uGbDVGGteHg2ol8ZDhCL15P2UpwLmCyKMXHuC5gdd3NL+TB9jajBt/56hg7UVB4DAd+XDSYoO/gZIlLVrfRVMXoEFYZnFyhxxyBnB/3IDmXBgq6wLGfGK/Fiq8qVkJTmGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508822; c=relaxed/simple;
	bh=5PF5pCPRF220uosYxLa1L/x3iiDLCcrrvPFVvrrqnag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lexoVUiNm63To9AbpzLAyasD3/fNMfK2jcF70AGJgg8qyRyyyVScF7svL7+9rc84ksF7eJkeHt5E+SwtG3ayWIhXUphOVsD3eL8LRsTXVdTw9I8VlTpYoLbxFShW6fr5bLdVBr+fsgSIzb7oiWoGmEt324lHFUtLJIUJdEArdc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEXMZO/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEXMZO/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEB6C2BC87;
	Tue, 27 Jan 2026 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508822;
	bh=5PF5pCPRF220uosYxLa1L/x3iiDLCcrrvPFVvrrqnag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vEXMZO/CymBBWC9Qdc/z3TkWki+6MlGejnT6eJr51J/afvxhhth4HRXMwqC65vY4B
	 igUFRt4rz05ZJ4oJvtxHrwwGUVawE3cACErXR5Ql7bzCIj32SKT6NT+pzz+k8p+YHd
	 LR/LvMVrcla3iIljd7oHxmdHfFQRYLOfvY8ckksPhziZIg3VClkEXH/sq6OTLiKBZI
	 lnPam8GuPnaNKIgG8aLAGV8hTXUsyE67ya2bo99cCoWT64VP/lsf31NGxyHyBieDmg
	 zW9uY62/u5MzmxB6VAXk5EfxHU9+u7nx9mifmbE/ZlHpF4TRKv8m79OoCUTf1jdT69
	 +M6cOugRKcIYQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4q-0000000BVOU-2PVT;
	Tue, 27 Jan 2026 11:13:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 07/14] docs: kdoc_parser: fix variable regexes to work with size_t
Date: Tue, 27 Jan 2026 11:13:26 +0100
Message-ID: <ce7ef207851265ea1a476f72f7b982f92cd88551.1769508371.git.mchehab+huawei@kernel.org>
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

The regular expressions meant to pick variable types are too
naive: they forgot that the type word may contain underlines.

Co-developed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 0310aff7b2fe..94721d6a8204 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1010,14 +1010,14 @@ class KernelDoc:
 
         default_val = None
 
-        r= KernRe(OPTIONAL_VAR_ATTR + r"\w.*\s+(?:\*+)?([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
+        r= KernRe(OPTIONAL_VAR_ATTR + r"[\w_]*\s+(?:\*+)?([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
         if r.match(proto):
             if not declaration_name:
                 declaration_name = r.group(1)
 
             default_val = r.group(2)
         else:
-            r= KernRe(OPTIONAL_VAR_ATTR + r"(?:\w.*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
+            r= KernRe(OPTIONAL_VAR_ATTR + r"(?:[\w_]*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
         if r.match(proto):
             default_val = r.group(1)
 
-- 
2.52.0

