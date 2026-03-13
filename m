Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE9521883E;
	Fri, 13 Mar 2026 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390889; cv=none; b=V4PXBXgjD+LBswINUygCNt7oqL9LMrmo7F2R4+87WQrXgrJ35aUVQ3J1wLRo2Wb+l2Xdjj8XXermc4jSQ70y1sgPoZ2WWsA8URRZui+0H4hd4ctWgHWWBZgZjfzYAswI0jEdK6p3VWtFxXlT1qpygqSSWrpzKqhZM29Wd+FxEGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390889; c=relaxed/simple;
	bh=Mknj2SlhK4QI7Wger8hiQmM1jptnSZt2mp+nk9cythI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uE7y5RNd/gFspOwX+4jExJWRXq5y702+fFdN8snbl6lTn9Ls44UHtb9eM7APqBf9vcQo21UliYEJBG9D5O7lgTgiVHlfjpcsCvGVPzSPG9qs3sYnheNZ0180uAfBiNjez1Fi56qLoOHOZJnajqIn75HBsu1MEUyxNnN3HKWVgaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHas93GL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHas93GL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5417BC19421;
	Fri, 13 Mar 2026 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390889;
	bh=Mknj2SlhK4QI7Wger8hiQmM1jptnSZt2mp+nk9cythI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VHas93GLMsCrXJpEBQRmCzlWv4owv5ALMt3TK5mV94fsQxSUrv2U0KW/pfvIIq5dp
	 Aw/FGRNkmFiWUDpxwpBz5XiRWR/xchMXP8fHAtlme7qfteHAD81rhC4iQvsOZqRwPY
	 cacMsMtR9+CQVcq1D/1Sz7hVPwiD4fZbrfh3zIl4hjosmZ9RU3WA14W/u6e98Ll1je
	 gSk7Nlp2vgDdKVkogz5v49LeaI/SH5wwmmjpwCVs4Z98gbnNA84X/drerjIC/aEBhk
	 Zz98dEEeu3tQLo9K9AlJRoidCOGFTtPVyJfc9uEB1THhULCAeuSQRFo/0xxh26bhOv
	 XFCbQGACINJ0g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w0xyo-0000000DI0u-2L3p;
	Fri, 13 Mar 2026 09:34:46 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 29/28] docs: kdoc: ensure that comments are dropped before calling split_struct_proto()
Date: Fri, 13 Mar 2026 09:34:23 +0100
Message-ID: <d112804ace83e0ad8496f687977596bb7f091560.1773390831.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773326442.git.mchehab+huawei@kernel.org>
References: <cover.1773326442.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Changeset 2b957decdb6c ("docs: kdoc: don't add broken comments inside prototypes")
revealed a hidden bug at split_struct_proto(): some comments there may break
its capability of properly identifying a struct.

Fixing it is as simple as stripping comments before calling it.

Fixes: 2b957decdb6c ("docs: kdoc: don't add broken comments inside prototypes")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 3ff17b07c1c9..ed378edb1e05 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -724,6 +724,7 @@ class KernelDoc:
         #
         # Do the basic parse to get the pieces of the declaration.
         #
+        proto = trim_private_members(proto)
         struct_parts = self.split_struct_proto(proto)
         if not struct_parts:
             self.emit_msg(ln, f"{proto} error: Cannot parse struct or union!")
@@ -764,6 +765,7 @@ class KernelDoc:
         # Strip preprocessor directives.  Note that this depends on the
         # trailing semicolon we added in process_proto_type().
         #
+        proto = trim_private_members(proto)
         proto = KernRe(r'#\s*((define|ifdef|if)\s+|endif)[^;]*;', flags=re.S).sub('', proto)
         #
         # Parse out the name and members of the enum.  Typedef form first.
@@ -771,7 +773,7 @@ class KernelDoc:
         r = KernRe(r'typedef\s+enum\s*\{(.*)\}\s*(\w*)\s*;')
         if r.search(proto):
             declaration_name = r.group(2)
-            members = trim_private_members(r.group(1))
+            members = r.group(1)
         #
         # Failing that, look for a straight enum
         #
@@ -779,7 +781,7 @@ class KernelDoc:
             r = KernRe(r'enum\s+(\w*)\s*\{(.*)\}')
             if r.match(proto):
                 declaration_name = r.group(1)
-                members = trim_private_members(r.group(2))
+                members = r.group(2)
         #
         # OK, this isn't going to work.
         #
-- 
2.53.0

