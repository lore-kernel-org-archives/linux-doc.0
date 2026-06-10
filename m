Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F20F371072;
	Wed, 10 Jun 2026 04:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781066172; cv=none; b=mgpDAmJ0AVf1NFvV4VFXRaGubfx3cnq8retAlCTGtzYq2vPvyckII5WD+F3yHdlgYnfN/Bu7k8KDYlmA23L6nmTFz+ndRH4U9xrYlsjR1eQyWAyvMSkZqnomlk/abT2wx59K4fEorGI1E3kkxph6zenhoVAOB+ILU3Wu7e7p+3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781066172; c=relaxed/simple;
	bh=OEb8s8uIWUkzmmIYC/yFpsUxXtXVEWIhB0oWagSx5ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hXw6zisWdwM59Hn2YH+Khq5pHXrUEPO62ox14niclYtdyQGFJSGqA3WRmMmKhuCuwwTfJ696iwFxWyqsrg84OIKM4vxJgONijZRpumWgXvnHX5gNyXOZIyG+2rvMJ/p8d+u8S/EohUbZLS9h0jXoGWKD8n0+Fefar1AFew1ir2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=B0+i+p9L; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B0+i+p9L"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75E904593;
	Tue,  9 Jun 2026 21:36:00 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8D8A3FD88;
	Tue,  9 Jun 2026 21:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781066165; bh=OEb8s8uIWUkzmmIYC/yFpsUxXtXVEWIhB0oWagSx5ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0+i+p9L4YG+tmGIPZTd2fOVybIZ3ZnBqOTW3ea6KWDuo4bNuKKqSNmXb4uuhPRbB
	 r+iGoR7xm1QpMKiHj6KctxPoBIjGeevTyE2dBEPuMzV0+O91dXWyyXDLrAImwS7A+Q
	 1ayt01l8Hjo8DW600V2mzqvdcMDDVTAc1ltsPKU4=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andy Whitcroft <apw@canonical.com>
Subject: [RFC V2 1/3] lib/vsprintf: Add support for pgtable entries
Date: Wed, 10 Jun 2026 05:35:43 +0100
Message-Id: <20260610043545.3725735-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260610043545.3725735-1-anshuman.khandual@arm.com>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some print formats for pgtable entries at any pgtable level. These new
formats are %pp[g|4|u|m|t][d|e] i.e %ppgd, %pp4d, %ppud, %ppmd, and %ppte.
These currently support both 32 bit and 64 bit pgtable entries that can be
extended up to 128 bit when required.

Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

 Documentation/core-api/printk-formats.rst | 19 ++++++++
 lib/vsprintf.c                            | 58 +++++++++++++++++++++++
 scripts/checkpatch.pl                     |  2 +-
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index c0b1b6089307..e69f91a9dd9d 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -696,6 +696,25 @@ Rust
 Only intended to be used from Rust code to format ``core::fmt::Arguments``.
 Do *not* use it from C.
 
+Page Table Entry
+----------------
+
+::
+
+        %p[pgd|p4dp|pud|pmd|pte]
+
+Print page table entry at any level.
+
+Passed by reference.
+
+Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
+
+        %ppte   0x0000000000c0ffee
+        %ppmd   0x0000000000c0ffee
+        %ppud   0x0000000000c0ffee
+        %pp4d   0x0000000000c0ffee
+        %ppgd   0x0000000000c0ffee
+
 Thanks
 ======
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 9f359b31c8d1..d4ad3048a4db 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -856,6 +856,59 @@ static char *default_pointer(char *buf, char *end, const void *ptr,
 	return ptr_to_id(buf, end, ptr, spec);
 }
 
+static char *pxd_pointer(char *buf, char *end, const void *ptr,
+			 struct printf_spec spec, const char *fmt)
+{
+	if (check_pointer(&buf, end, ptr, spec))
+		return buf;
+
+	if (fmt[1] == 't' && fmt[2] == 'e') {
+		pte_t *pte = (pte_t *)ptr;
+
+		static_assert(sizeof(pte_t) == 4 ||
+			      sizeof(pte_t) == 8,
+			      "pte_t size must be 4 or 8 bytes");
+		return special_hex_number(buf, end, pte_val(ptep_get(pte)), sizeof(pte_t));
+	}
+
+	if (fmt[1] == 'm' && fmt[2] == 'd') {
+		pmd_t *pmd = (pmd_t *)ptr;
+
+		static_assert(sizeof(pmd_t) == 4 ||
+			      sizeof(pmd_t) == 8,
+			      "pmd_t size must be 4 or 8 bytes");
+		return special_hex_number(buf, end, pmd_val(pmdp_get(pmd)), sizeof(pmd_t));
+	}
+
+	if (fmt[1] == 'u' && fmt[2] == 'd') {
+		pud_t *pud = (pud_t *)ptr;
+
+		static_assert(sizeof(pud_t) == 4 ||
+			      sizeof(pud_t) == 8,
+			      "pud_t size must be 4 or 8 bytes");
+		return special_hex_number(buf, end, pud_val(pudp_get(pud)), sizeof(pud_t));
+	}
+
+	if (fmt[1] == '4' && fmt[2] == 'd') {
+		p4d_t *p4d = (p4d_t *)ptr;
+
+		static_assert(sizeof(p4d_t) == 4 ||
+			      sizeof(p4d_t) == 8,
+			      "p4d_t size must be 4 or 8 bytes");
+		return special_hex_number(buf, end, p4d_val(p4dp_get(p4d)), sizeof(p4d_t));
+	}
+
+	if (fmt[1] == 'g' && fmt[2] == 'd') {
+		pgd_t *pgd = (pgd_t *)ptr;
+
+		static_assert(sizeof(pgd_t) == 4 ||
+			      sizeof(pgd_t) == 8,
+			      "pgd_t size must be 4 or 8 bytes");
+		return special_hex_number(buf, end, pgd_val(pgdp_get(pgd)), sizeof(pgd_t));
+	}
+	return default_pointer(buf, end, ptr, spec);
+}
+
 int kptr_restrict __read_mostly;
 
 static noinline_for_stack
@@ -2506,6 +2559,9 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
  *		Without an option prints the full name of the node
  *		f full name
  *		P node name, including a possible unit address
+ * - 'p[g|4|u|m|t|][d|e]' For a page table entry, this prints its
+ *			  contents in a hexadecimal format
+ *
  * - 'x' For printing the address unmodified. Equivalent to "%lx".
  *       Please read the documentation (path below) before using!
  * - '[ku]s' For a BPF/tracing related format specifier, e.g. used out of
@@ -2615,6 +2671,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		default:
 			return error_string(buf, end, "(einval)", spec);
 		}
+	case 'p':
+		return pxd_pointer(buf, end, ptr, spec, fmt);
 	default:
 		return default_pointer(buf, end, ptr, spec);
 	}
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 0492d6afc9a1..f68955858e29 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6975,7 +6975,7 @@ sub process {
 				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
 				$fmt =~ s/%%//g;
 
-				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*))/g) {
+				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*)(pte|pmd|pud|p4d|pgd))/g) {
 					$specifier = $1;
 					$extension = $2;
 					$qualifier = $3;
-- 
2.30.2

