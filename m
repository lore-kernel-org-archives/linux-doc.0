Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94041286A7;
	Thu, 27 Nov 2025 06:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225088; cv=none; b=EWzx+FQhPfyzd7D4PUelMR4Rqja9KPQfYEo0hrtIvlFEqCJn1lCX82vqtvCF8xu/7jtfGSSy5jMudycAkEe2GW11N/apHXgYSkPfGlyOeYi6jdzQE9sIi6SEoSjk9VKRFI9Y2wgGDz4hFjyc/PvLeJSjb4Vyjn44yi5Xw8Wv5tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225088; c=relaxed/simple;
	bh=zrsosgCeTWyTTNIueIr3zPi+0qC3XneM4MCq2Et2Q0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIayLr0gz0FPUDdpDfXOJtuADqWMEyqfr8oNOgS4c2mcsg1R6/OTEQgO7Dv2lJtk1Yv7T8OGriluJMC8tFdrbb0WuIMmqJMJ0E5G7qAnbIOJ/oStjrEHRNKlvpAlJqwPOjJWTp3c7qWY5bqlNR9VuWe8w2MOG70o4lMm4hFOP+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XwM4cOpq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XwM4cOpq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=VV18nwhhriXrxiIXo6rgBuiqRnDlu45RBiLAbp4Wkm4=; b=XwM4cOpqsoT8Rv70ziqjC25rLN
	S7l2Wd/VF5WsVsCjZ1SjorSJPs2h3pwqbbc6FBJiUmqCaKoMeNFHWhm0B+zQK2mMhvrEwgvWd//Vu
	RYOlZeljTwAs4fwbXqte9lXGpYT11YsLBGgR7qEacBpDxMJ4cOpOMVtpMJl+OnsSANyfxfqxa47tb
	FDNBLYn+kt/TpRSXaEL7EgQf6wC3u2UP0OjDHlgK6rWOWeKxbe8SUr3LbiLhYkRpu86SbsXW3V3l5
	WU5GHOkN4qzW+lZZHEHgJ+m8KpIEvvxftVKcaN4rus5+octmuvn+rA4Wl2g6frmgBX/rwntIAm46c
	vhw+53nQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOVXC-0000000G3Kg-30q1;
	Thu, 27 Nov 2025 06:31:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: kdoc_parser: add data/function attributes to ignore
Date: Wed, 26 Nov 2025 22:31:17 -0800
Message-ID: <20251127063117.150384-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recognize and ignore __rcu (in struct members), __private (in struct
members), and __always_unused (in function parameters) to prevent
kernel-doc warnings:

  Warning: include/linux/rethook.h:38 struct member 'void (__rcu *handler' not described in 'rethook'
  Warning: include/linux/hrtimer_types.h:47 Invalid param: enum hrtimer_restart (*__private function)(struct hrtimer *)
  Warning: security/ipe/hooks.c:81 function parameter '__always_unused' not described in 'ipe_mmap_file'
  Warning: security/ipe/hooks.c:109 function parameter '__always_unused' not described in 'ipe_file_mprotect'

There are more of these (in compiler_types.h, compiler_attributes.h)
that can be added as needed.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org
---
 tools/lib/python/kdoc/kdoc_parser.py |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20251127.orig/tools/lib/python/kdoc/kdoc_parser.py
+++ linux-next-20251127/tools/lib/python/kdoc/kdoc_parser.py
@@ -86,6 +86,8 @@ struct_xforms = [
     (KernRe(r'\s*__counted_by_(le|be)\s*\([^;]*\)', re.S), ' '),
     (KernRe(r'\s*__packed\s*', re.S), ' '),
     (KernRe(r'\s*CRYPTO_MINALIGN_ATTR', re.S), ' '),
+    (KernRe(r'\s*__private', re.S), ' '),
+    (KernRe(r'\s*__rcu', re.S), ' '),
     (KernRe(r'\s*____cacheline_aligned_in_smp', re.S), ' '),
     (KernRe(r'\s*____cacheline_aligned', re.S), ' '),
     (KernRe(r'\s*__cacheline_group_(begin|end)\([^\)]+\);'), ''),
@@ -183,6 +185,7 @@ function_xforms  = [
     (KernRe(r"__weak +"), ""),
     (KernRe(r"__sched +"), ""),
     (KernRe(r"_noprof"), ""),
+    (KernRe(r"__always_unused *"), ""),
     (KernRe(r"__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +"), ""),
     (KernRe(r"__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\) +"), ""),
     (KernRe(r"__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +"), ""),
