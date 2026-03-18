Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8523A5E84;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=jHNfIq/JM95yuZ0B2NR6NGpd38fPbqcBB5uTlk38SO1kzR/k/SRLKDWW3WnBQ/i0ON6Ax3EYeGMR9Y+cq43B5oHqtCdouMODoyHKMlat49Rv6IKIaxmaveNPC2zaFIvTg2G7kJ2Pk6+ImhjJWQF8ImT26ee8Qsvzfa8IdPZQdc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=Kho/SfdXlAhptQOMVPd0Peuv9YWwg6RMPsq15weyqbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QgJTPB1H51aQs8cXW4Oxyu6yJPgWbRfFQ/2mSLcQeuQrglZ8muEv+Slq5ehzJ5pqzpn5+1j559Ubr+2aQdYk3v7KLNoKUXtzR+Fx3EgssWkPhDKteCXl58HnYRpXsyE7Pv/KQPC8vkZ+8c0A19nBJp/u90rBmIVqIUTxwirnx8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qr3SdTAI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qr3SdTAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F16FC2BCB4;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=Kho/SfdXlAhptQOMVPd0Peuv9YWwg6RMPsq15weyqbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qr3SdTAIi4qOwu+yIHvjhmw59zZSAjdewzbb0m9ZfGJ9/udz07CPtcL21Mp4o2+Qu
	 v58U1SN21lBLaXoMbxzhbd4pyZlbULjICPXuz9Bm5rAveNFrREXN2YeD/qPbRZ8tGK
	 6aHFm4E/xvXPq+X/LXwaN79u+q6+GdCbkVWV/mC2Y/HZUYA2qeCyYYvnugibH9gilR
	 Acgj+tMdZ+TnSGdQaugejfWnvh8nFblBiDfejra2EjwyjPx8jRZo6YG+CAR8dp+/HA
	 pjXeRN/jNKPm7IOEyufCaPk9ZgMaAVby9nxbt85oqi80ExI6MXUbqKQ1DVUrglM9ON
	 YPSiUwGnQRIXg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpm-2lDF;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 08/14] docs: kdoc_item: fix a typo on sections_start_lines
Date: Wed, 18 Mar 2026 10:11:08 +0100
Message-ID: <d1e0f1d3f80df41c11a1bbde6a12fd9468bc3813.1773823995.git.mchehab+huawei@kernel.org>
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

Currently, there are 15 occurrences of section?_start_lines,
with 10 using the plural way.

This is an issue, as, while kdoc_output works with KdocItem,
the term doesn't match its init value.

The variable sections_start_lines stores multiple sections,
so placing it in plural is its correct way.

So, ensure that, on all parts of kdoc, this will be referred
as sections_start_lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_item.py   | 2 +-
 tools/lib/python/kdoc/kdoc_output.py | 2 +-
 tools/lib/python/kdoc/kdoc_parser.py | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index 5f41790efacb..fe08cac861c2 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -82,7 +82,7 @@ class KdocItem:
         Set sections and start lines.
         """
         self.sections = sections
-        self.section_start_lines = start_lines
+        self.sections_start_lines = start_lines
 
     def set_params(self, names, descs, types, starts):
         """
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 73d71cbeabb5..1b54117dbe19 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -389,7 +389,7 @@ class RestFormat(OutputFormat):
             else:
                 self.data += f'{self.lineprefix}**{section}**\n\n'
 
-            self.print_lineno(args.section_start_lines.get(section, 0))
+            self.print_lineno(args.sections_start_lines.get(section, 0))
             self.output_highlight(text)
             self.data += "\n"
         self.data += "\n"
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index f6c4ee3b18c9..35658a7e72d5 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -140,7 +140,7 @@ class KernelEntry:
         self.parametertypes = {}
         self.parameterdesc_start_lines = {}
 
-        self.section_start_lines = {}
+        self.sections_start_lines = {}
         self.sections = {}
 
         self.anon_struct_union = False
@@ -220,7 +220,7 @@ class KernelEntry:
                 self.sections[name] += '\n' + contents
             else:
                 self.sections[name] = contents
-                self.section_start_lines[name] = self.new_start_line
+                self.sections_start_lines[name] = self.new_start_line
                 self.new_start_line = 0
 
 #        self.config.log.debug("Section: %s : %s", name, pformat(vars(self)))
@@ -316,7 +316,7 @@ class KernelDoc:
         for section in ["Description", "Return"]:
             if section in sections and not sections[section].rstrip():
                 del sections[section]
-        item.set_sections(sections, self.entry.section_start_lines)
+        item.set_sections(sections, self.entry.sections_start_lines)
         item.set_params(self.entry.parameterlist, self.entry.parameterdescs,
                         self.entry.parametertypes,
                         self.entry.parameterdesc_start_lines)
-- 
2.53.0

