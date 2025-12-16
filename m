Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F12D8382;
	Tue, 16 Dec 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894781; cv=none; b=hMLjFAebDmOoSDt4BYow8OviNvYoYYEqNe+/W9BY4tPCHGfkoSgZjXF70TPArbN7zI6WtBFamxoqZcOOJPnDffk9j3+Eb+d7dJgrmFZ+VjySrw0jklMQcpHNqah6TXAO1C4EZdoFTXNNdC2I30CunZNwIoBkz4aCci2cLmaIx2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894781; c=relaxed/simple;
	bh=D9Elma9t5b0gMah/+NSYAD1snetTLQ4VuKhuEdvqBe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uYd7u+yl7VDxV/dzAvQkLy0HMs1sPuXCChK3UQYjslsTf+7Eea1TTna2/QYKC3M3iZ51QWW822uXuwZFlC8p/tOax4nLC+OlJ/8jwdu/ibwBnOD57O1dV+CuLunHCk8LO+wOjgGy1GIrPfemt0fppmzv67oh9ksOz6R50avIMlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukM6JyW5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukM6JyW5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86556C4CEF1;
	Tue, 16 Dec 2025 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765894780;
	bh=D9Elma9t5b0gMah/+NSYAD1snetTLQ4VuKhuEdvqBe8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ukM6JyW5XNbfA16rDDHlJhALN3YAH1TKAY0oKuwQe7jkRvZnK8TEKOEyUXzfRHyqJ
	 rjX6QlegNn77r6ncWAtM9o9t1XspBbczykh1uPfHZytZeNt5BkomtyBmVdFZR+7pxS
	 FFeGBsLEzjjsgLIqzm8DvVhQHz2kr8vHlbW2v3IzCFKUm1QPfs6CiAZKt4KsP4QzTU
	 KK2nNp1o3ysnOYYB2PXLFed3uNYaPentbZgcdkO1Cwh0MWcAEaqmG3iCt2HSwL8Syn
	 gf8Pn0oTlFjFy3xD2tzqCv3JQXP2Gwg9I0dJP3Gz1kHRKxJebYIh0r0iXSDj7pvAE+
	 BF1dYvFHHj3JQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVVtq-00000000sWN-2jod;
	Tue, 16 Dec 2025 15:19:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] docs: kernel-doc.rst: Parse DEFINE_ macros without prefixes
Date: Tue, 16 Dec 2025 15:19:28 +0100
Message-ID: <90cefe3986a62061f1b962f05a97797db11ab027.1765894670.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765894670.git.mchehab+huawei@kernel.org>
References: <cover.1765894670.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Currently, the logic for vars require a
	type DEFINE_foo();

where type is usually "static".

Make the logic more generic.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-doc/e1dad7e4-a0ca-4be6-a33c-97b75175c12f@infradead.org/
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index aaa352855717..e137bd9a7dac 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -977,17 +977,23 @@ class KernelDoc:
         # Variable name is at the end of the declaration
         #
 
+        default_val = None
+
         r= KernRe(OPTIONAL_VAR_ATTR + r"\w.*\s+(?:\*+)?([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
-        if not r.match(proto):
+        if r.match(proto):
+            if not declaration_name:
+                declaration_name = r.group(1)
+
+            default_val = r.group(2)
+        else:
+            r= KernRe(OPTIONAL_VAR_ATTR + r"(?:\w.*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
+        if r.match(proto):
+            default_val = r.group(1)
+
+        if not declaration_name:
            self.emit_msg(ln,f"{proto}: can't parse variable")
            return
 
-        var_type = r.group(0)
-
-        if not declaration_name:
-            declaration_name = r.group(1)
-
-        default_val = r.group(2)
         if default_val:
             default_val = default_val.lstrip("=").strip()
 
-- 
2.52.0

