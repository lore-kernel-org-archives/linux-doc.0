Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83353A0E97;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825080; cv=none; b=CLI6qUD7GXrkeQHcO6k2kajEphoEhRH03Wgu04RFlxUZIVQzQzQvqMmO9Gi3Reh4zc4EFiHL3rwCL8lpldZc/nNsMXYwmnEdRc1uNT30+7dDo1rB6ADuHOqMAQLUarLrAZL4OmWTy5mKcWCKOXLxIsVQnBUicGodbsthapRar+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825080; c=relaxed/simple;
	bh=AAPYRL9TsMZyc+GIhj1XbUNzHeUMbGSOeGZaFrRqYP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YcglbWadyhEnlrLDpt6ZM85k06kky6Uy6t0Sbu/nfVS3JuTcDlwV6dVMYANFAqSd+/2RT0RU+8gbwwWBURYBE7K52QeoM3TXnVDT2eTcLpdfE8+0AyS/k/Oc71HE+KHScBlg+uIQ9koL9Il2STapZHAFVWGoTCahcE29+3i0A0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL2UW/VL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL2UW/VL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FE5C2BC9E;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=AAPYRL9TsMZyc+GIhj1XbUNzHeUMbGSOeGZaFrRqYP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HL2UW/VLyWqk+knswcCgB2EgmCsl8ohPLqkxv08I+DVuNW8WoyMqAK/ubknH2fjXU
	 qpnWmM/xXkZoWk19XTLPbTlUD2QZ54Q4F4rv0H9hCSiYVMXr6R4oZyt/hAm1aJeFd+
	 atOv00AonrmFLSgGzZQA15pb53wr7e81bJeHOR9KLRwDdB+q7qUe75kSfGQRQ0jsp5
	 HWi/AIPBhw9C+s1Zg7y9f1h++fuYuV4xlghIXosIHEj0Ntpm2D8FURloial8nLBnPk
	 3E4L3Ht2z8M9t3dJpQAw+yjiAempVytRiuxoOF1hReeHBeBZnIP8JRlXpgMZFylEel
	 bIdCLJzhSfueQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpN-258r;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 02/14] docs: kdoc_re: better represent long regular expressions
Date: Wed, 18 Mar 2026 10:11:02 +0100
Message-ID: <60c264a9d277fed655b1a62df2195562c8596090.1773823995.git.mchehab+huawei@kernel.org>
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

The Sphinx output from autodoc doesn't automatically break long
lines, except on spaces.

Change KernRe __repr__() to break the pattern on multiple strings,
each one with a maximum limit of 60 characters.

With that, documentation output for KernRe should now be displayable,
even on long strings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 6f3ae28859ea..28292efe25a2 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -70,10 +70,15 @@ class KernRe:
 
         flags_name = " | ".join(flags)
 
+        max_len = 60
+        pattern = ""
+        for pos in range(0, len(self.regex.pattern), max_len):
+            pattern += '"' + self.regex.pattern[pos:max_len + pos] + '" '
+
         if flags_name:
-            return f'KernRe("{self.regex.pattern}", {flags_name})'
+            return f'KernRe({pattern}, {flags_name})'
         else:
-            return f'KernRe("{self.regex.pattern}")'
+            return f'KernRe({pattern})'
 
     def __add__(self, other):
         """
-- 
2.53.0

