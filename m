Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF7E3A168C;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=GT2/QbNL2d5eZvV45y8XErEBf4L9rbuJJyfNHB7vRN1uWFKB0yslk560eFKdE2Acfur4CVZfh99bbVo2OepnB6bHldt+SJp60A4Q/HmUnWe4RBrzoPXNvGWB6liQ3PVWcfHqvQ2NEgvJsdR5uk/btDMdji5aGoaGh7W8rjRxDbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=f8IphVqFpVsPRkjyIYB/O/ozmgBwHmrUjC3r24G1VaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HIdQqYFZCU2GO6cAjE+6bhziQcrbtYm2+OB/5K1NQ0/M5Z9md3syk6vDJm957pTmM1rZ+CA8D10SL4XnorYeYp4HfssII8alZGLacZFXS6KqKCtltepl13vcDJVruxTMMaZDakGAkG8QigyYHl9VTTpGiNhlcL/0ljr7laRsvjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZCzcgH5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZCzcgH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680C1C2BCB3;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=f8IphVqFpVsPRkjyIYB/O/ozmgBwHmrUjC3r24G1VaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZCzcgH5VQVI7R/u0gnFuzFDIYCgG9BFjjdswx9VusjUhVEo7i1ilS6+o7qEidOxc
	 73t7qIhM8liCFk+sJZ/5ARSleAd59uGmbBarZgVwRSHqf/tbRBD/jYcn8nF1cWSywF
	 D0WIU2RyWka/PTjhMrdBuJvZnOnzciHyiG0b6w6GhF2kdzVfVM9OOTDlXp7Y8i62iz
	 vQbbqSMocfTgYbHFNruWEiq3Xd1ZaRimVsEJnJWTOtSc8yYvV8NfgcasIarZxcEZC7
	 IqW+adbJZb6Jxjf89BAabzI5CMT2MYvyaCv+Btr4o0pfjMoEuxAtj6+s9hga+5XGuY
	 hKWIKe5SgQhCg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpR-2BzO;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 03/14] docs: kdoc: add c_lex to generated documentation
Date: Wed, 18 Mar 2026 10:11:03 +0100
Message-ID: <799178cf30dd4022fdb1d029ba998a458e037b52.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Do some fixes at groups() description for it to be parsed by
Sphinx and add it to the documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/tools/kdoc_ancillary.rst | 9 +++++++++
 tools/lib/python/kdoc/c_lex.py         | 9 +++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/tools/kdoc_ancillary.rst b/Documentation/tools/kdoc_ancillary.rst
index 3950d0a3f104..85f3806a431a 100644
--- a/Documentation/tools/kdoc_ancillary.rst
+++ b/Documentation/tools/kdoc_ancillary.rst
@@ -21,6 +21,15 @@ Regular expression class handler
    :undoc-members:
 
 
+C tokenizer
+===========
+
+.. automodule:: lib.python.kdoc.c_lex
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+
 Chinese, Japanese and Korean variable fonts handler
 ===================================================
 
diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index b6d58bd470a9..e01b154f458e 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -336,13 +336,14 @@ class CTokenArgs:
         self.sub_tokeninzer = CTokenizer(sub_str)
 
     def groups(self, new_tokenizer):
-        """
+        r"""
         Create replacement arguments for backrefs like:
 
-        ``\0``, ``\1``, ``\2``, ...``\n``
+        ``\0``, ``\1``, ``\2``, ... ``\{number}``
 
-        It also accepts a ``+`` character to the highest backref. When used,
-        it means in practice to ignore delimins after it, being greedy.
+        It also accepts a ``+`` character to the highest backref, like
+        ``\4+``. When used, the backref will be greedy, picking all other
+        arguments afterwards.
 
         The logic is smart enough to only go up to the maximum required
         argument, even if there are more.
-- 
2.53.0

