Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115A734B1A1
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560325; cv=none; b=BcDdI3n4iRw1oEq5/xW5qOQ9NYwABNrwcrCQxr/gwn5Hyvh8/J6YX0bkU0LeLNsUNn1ov11Hox5BYDD7I42UHM+kLq888XG/zZNqfcZKV4Ue9tZQwT3NsE2IUgei2qPGMKi7aYEayust8ebZUFVjYJ6+Dryn3kfn3XKbS8tp0Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560325; c=relaxed/simple;
	bh=bNpRj84rrM86rZbfxqGsulk194sj2YCQCbqiinFXn0k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=h9MVzG6phpoW1awMXZmNi0/JudCZkmF3N0npTwQMztoQqUy35lC8SjUU/7Y7CHXpbUu/7/usSrmnAijlMN+fNOIbyYoVTtvcqpHd775ZXJRNw9NCw6nOWRve/bI9lool7LkI6cyIIXSViMB7bqJgPVy5v7/kVmsiuQcwbJl0ewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i0CF0f/i; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i0CF0f/i"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485397788b3so11682025e9.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560322; x=1775165122; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1JDEAfTveFPPp/Cvp9vb5cLHHVQOeJ1kP6lbtNESx5U=;
        b=i0CF0f/izSUViQ//gwF9BcFidH7+mMP5c320Zg53GJczhIvh7CDhgswOw1i1DvlnvR
         YSI2Gx95bgbmaaRCWbg3dl2lUOZuX0c0enKO/2RtOpXG/QHh3zXLS95tsA6jEhYJDwv6
         nl+RJEfulgSTpP/cCCaKS3IVmfoUDwlD0YbFwhqtBg7Km37yyPMD2Rd3ZzMnxA4jPemX
         A4WE6F7m/qE9M2ia/RsJzE+YymXXjxzHQ5mN4xnbYEGf/lzIuitBH3c48oNs8HQFc6NR
         Yo/KZjcN+Weux45DyaoVffULKssdAhVs8hQMSYhEyEC6yCQQSXrsKAPDOuGkW4V1yvrQ
         2dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560322; x=1775165122;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JDEAfTveFPPp/Cvp9vb5cLHHVQOeJ1kP6lbtNESx5U=;
        b=WcbId4yLBsjC7IIxycrMOL+n3Dx6slVgb2LbbcGLnxt9leE5EtZFyXLB/MJdLpxFvT
         w8mY3CVnRJ4yVO2qpoIK0ZbKf2zG6TIZTp4qfm0doDxFYThTZRgz9EJJDSz/VeNpbvYo
         zrMBM6WovhGL47RpICwW2ZlfurqrxNQYrvDowjs75J0sMeJBtYupHaDE98Ty4y15kI93
         Btu0SeZOjiu1Rrt6SDFzy9/loAOKS2LpewKBPtbUDAwhMI/XVMZbDR+SSU3uj5ACCaJx
         uK36gdsst9a2ZOHTbMwFC6IAHzF+7SJfX0o7/FiOgOvy8pqEmnF7DIaBKyiGjL6YDPSO
         jWRw==
X-Forwarded-Encrypted: i=1; AJvYcCXRa8Yf9gixChaEKZiBdFVQuEmkU5O/OfHn+4oeQPlY0JTWPBlOCqpjz2hTY7OwrjXfbfzmOKmgxFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvcYgVC1cY4CsaMZOOAime9rx9Uw8nUpDAqe/NGPNFRIlw5UlW
	t4EdWJ4rV/5Pm/2gEj7WaCLT7DfiN+PkRAOEZdPBbDDlPqzw0fuo6XCej8JS9KFK088TntGTa3A
	MMHRp5U5OHAdEXeWxzw==
X-Received: from wmlz25.prod.google.com ([2002:a05:600c:2219:b0:485:3b8d:c995])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c113:b0:487:1114:d431 with SMTP id 5b1f17b1804b1-48727ec3c36mr2557315e9.18.1774560322529;
 Thu, 26 Mar 2026 14:25:22 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:01 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC2kxWkC/23MQQ7CIBRF0a00fywGKVDiyH2YDoB+KLEWAw3RN
 Oxd7NjhfXk5O2RMATNcux0SlpBDXFuIUwd21qtHEqbWwCiTtKeCPNyifd60IeKiqUKHE+Mc2v+ V0IX3Yd3H1nPIW0yfgy78t/5TCieUSD1I45RRvR1uPka/4NnGJ4y11i/v+hXqowAAAA==
X-Change-Id: 20260305-kflagstab-51a08efed244
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Subject: [PATCH v5 0/7] scalable symbol flags with __kflagstab
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="utf-8"

This patch series implements a mechanism for scalable exported symbol
flags using a separate section called __kflagstab. The series introduces
__kflagstab support, removes *_gpl sections in favor of a GPL flag,
simplifies symbol resolution during module loading.

The __kflagstab contains an 8-bit bitset which can represent up to 8
boolean flags per symbol exported in the __ksymtab. The patch series
also uses this bitset to store GPL-only flag values for kernel symbols,
thereby eliminating the need for *_gpl sections for representing GPL
only symbols.

Petr Pavlu ran a small test to get a better understanding of the
different section sizes resulting from this patch series.  He used
v6.17-rc6 together with the openSUSE x86_64 config [1], which is fairly
large. The resulting vmlinux.bin (no debuginfo) had an on-disk size of
58 MiB, and included 5937 + 6589 (GPL-only) exported symbols.

The following table summarizes his measurements and calculations
regarding the sizes of all sections related to exported symbols:

                      |  HAVE_ARCH_PREL32_RELOCATIONS  | !HAVE_ARCH_PREL32_RELOCATIONS
 Section              | Base [B] | Ext. [B] | Sep. [B] | Base [B] | Ext. [B] | Sep. [B]
----------------------------------------------------------------------------------------
 __ksymtab            |    71244 |   200416 |   150312 |   142488 |   400832 |   300624
 __ksymtab_gpl        |    79068 |       NA |       NA |   158136 |       NA |       NA
 __kcrctab            |    23748 |    50104 |    50104 |    23748 |    50104 |    50104
 __kcrctab_gpl        |    26356 |       NA |       NA |    26356 |       NA |       NA
 __ksymtab_strings    |   253628 |   253628 |   253628 |   253628 |   253628 |   253628
 __kflagstab          |       NA |       NA |    12526 |       NA |       NA |    12526
----------------------------------------------------------------------------------------
 Total                |   454044 |   504148 |   466570 |   604356 |   704564 |   616882
 Increase to base [%] |       NA |     11.0 |      2.8 |       NA |     16.6 |      2.1

The column "HAVE_ARCH_PREL32_RELOCATIONS -> Base" contains themeasured
numbers. The rest of the values are calculated. The "Ext." column
represents an alternative approach of extending __ksymtab to include a
bitset of symbol flags, and the "Sep." column represents the approach of
having a separate __kflagstab. With HAVE_ARCH_PREL32_RELOCATIONS, each
kernel_symbol is 12 B in size and is extended to 16 B. With
!HAVE_ARCH_PREL32_RELOCATIONS, it is 24 B, extended to 32 B. Note that
this does not include the metadata needed to relocate __ksymtab*, which
is freed after the initial processing.

The base export data in this case totals 0.43 MiB. About 50% is used for
storing the names of exported symbols.

Adding __kflagstab as a separate section has a negligible impact, as
expected. When extending __ksymtab (kernel_symbol) instead, the worst
case with !HAVE_ARCH_PREL32_RELOCATIONS increases the export data size
by 16.6%. Note that the larger increase in size for the latter approach
is due to 4-byte alignment of kernel_symbol data structure, instead of
1-byte alignment for the flags bitset in __kflagstab in the former
approach.

Based on the above, it was concluded that introducing __kflagstab makes
senses, as the added complexity is minimal over extending kernel_symbol,
and there is overall simplification of symbol finding logic in the
module loader.

Thank you Petr Pavlu for doing a section size analysis as well as Sami
Tolvanen, Petr Pavlu and Jonathan Corbet for their valuable feedback.

---
Changes from v4:
- squashed patches #4 and #5 to fix a bisecting issue

v4:
https://lore.kernel.org/r/20260305-kflagstab-v4-0-6a76bf8b83c7@google.com

Changes from v3:
- made commit messages more descriptive

v3:
https://lore.kernel.org/20251103161954.1351784-1-sidnayyar@google.com/

Changes from v2:
- dropped symbol import protection to spin off into its own series

v2:
https://lore.kernel.org/20251013153918.2206045-1-sidnayyar@google.com/

Changes from v1:
- added a check to ensure __kflagstab is present
- added warnings for the obsolete *_gpl sections
- moved protected symbol check before ref_module() call
- moved protected symbol check failure warning to issue detection point

v1:
https://lore.kernel.org/20250829105418.3053274-1-sidnayyar@google.com/

[1] https://github.com/openSUSE/kernel-source/blob/307f149d9100a0e229eb94cbb997ae61187995c3/config/x86_64/default

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

---
Siddharth Nayyar (7):
      module: define ksym_flags enumeration to represent kernel symbol flags
      module: add kflagstab section to vmlinux and modules
      module: populate kflagstab in modpost
      module: use kflagstab instead of *_gpl sections
      module: deprecate usage of *_gpl sections in module loader
      module: remove *_gpl sections from vmlinux and modules
      documentation: remove references to *_gpl sections

 Documentation/kbuild/modules.rst  |  11 +++--
 include/asm-generic/vmlinux.lds.h |  21 +++-----
 include/linux/export-internal.h   |  28 +++++++----
 include/linux/module.h            |   4 +-
 include/linux/module_symbol.h     |   5 ++
 kernel/module/internal.h          |   4 +-
 kernel/module/main.c              | 101 ++++++++++++++++++--------------------
 scripts/mod/modpost.c             |  16 ++++--
 scripts/module.lds.S              |   3 +-
 9 files changed, 98 insertions(+), 95 deletions(-)
---
base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
change-id: 20260305-kflagstab-51a08efed244

Best regards,
-- 
Siddharth Nayyar <sidnayyar@google.com>

