Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25678366835
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729722; cv=none; b=YM3UjNcN/64hdeFJl+2p/re3idfVsNbIZokh1/+W8Pg03/1UD5Og/rm/+JYMl80l5r56mh36FD2em7f/caPn5saqTWluGLQ7md7I04uRFi3gcUkEcLHKekg8SZtjKlNs5OkpzMOqyj254OXMP+6KjCh/cEHtgiCykkiLUySGvY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729722; c=relaxed/simple;
	bh=s0Oics6Xn5AHyPCT14/XnF0BJ1fix4G/sFQqfUg2/bs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XOv6c/7Nw0dRQlmhYI2H7pZPdYDipzyDlDX9GGrCptNR3A9FoepT2K5gS2GxvSrs5P3EJnQkvJ6spRXdmaAVoqcHIvLy+12UxsC/adcfJTHIgnwzFF1aoZlU87xGZ74xSncgYXrfiSXcCG3tCxVs+tp5wtvzDTpE0pHwKWKpPwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oj/xaoDw; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oj/xaoDw"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-439b8bc43aeso3357948f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729720; x=1773334520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h0/N2d7xj++tCyhYWP1OaGkKTLDjkAyApILw+NOXPFo=;
        b=oj/xaoDwMFc92EtAtvRLiO1olGBbQRBn58/40XXVzmHXFqbLYJG2X4NGZ78PLOspTW
         dFGKIwe8U2ofX73rkJYYaDHDYYx4bK8N5MSZsjqUPaFE2emA/YK80Rwu4YfUW6vO5MvH
         Y3dfoP7cGHJ0/FHTdgfRCSAV/EyizWHseSorWYT69Q4wJuLGuSRWP1w+h3raS9QZ/8MR
         ka3HQcplMdHcYGZDbUOciQyCXFH3gPghnXk0n61OCBDQP0YC/eUJEv1Q3hwqXIoTtQNL
         4JWxaZ5Lxq13ewFBJMJexA8LoasxdKFl1iwXHKYSsrjIDkIDyWRaNKN/nmCPnBvKpJQs
         9Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729720; x=1773334520;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0/N2d7xj++tCyhYWP1OaGkKTLDjkAyApILw+NOXPFo=;
        b=L9aiXbNqeVAMKdoqPkwBQKMH6zqwV8kCe1Cn8zukbrbIh9mFvVT2fFDw9Wclf2Ujpk
         kelDLzxGeTkS4nU5IxCgk3/eeSkz6QkLua6paQol0VXd1mWJq0oE1RdXJmev2CUq9+Fd
         En0HYtfanZyXBmsfn97HQeQz8b1spHqZmnXdTpdaRm0snmixcoV7oLmmi3PP+NyUItHv
         h9Fsnf3lCLjNNBbxW/hsAxkDDBNoaE0Oe44eLRsNBjGh/zd7bP6HDZPSeDu5cZf6OW2M
         UWvx2v1xcswkiB8iSkC7/ygntZ6gCVnQK1FCcVSPUxFe96tu1m8SZ64wvvd0JRTAY197
         cnqw==
X-Forwarded-Encrypted: i=1; AJvYcCWOrKKq73YS37z6N/ZxFbUZej//QpV8nBm+Dm27nZSfiga4mh1EtUoRwqmMNktSkOfMJvCVdOXfbxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIh4PZ/uCGgeJdR/uxJeZpG9HIk6m+PC2uKK9UAMI1iXKf3bSA
	7xrbUy2Lr8+/F+UBFyhvO+FCwawk3X5Ic9qDA0jsJFQmCzllu2OxD357+ip2PK7tx+Wy4O8unI4
	W//QCRFgrSewKZr7A0Q==
X-Received: from wrs4.prod.google.com ([2002:a05:6000:644:b0:439:c444:51bb])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4027:b0:439:b486:ba6b with SMTP id ffacd0b85a97d-439c800f31dmr10977433f8f.39.1772729719246;
 Thu, 05 Mar 2026 08:55:19 -0800 (PST)
Date: Thu, 05 Mar 2026 16:55:16 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHS1qWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3ey0nMT04pLEJF1Tw0QDi9S01BQjExMloPqCotS0zAqwWdGxtbU AeehqmVsAAAA=
X-Change-Id: 20260305-kflagstab-51a08efed244
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Subject: [PATCH v4 0/8] scalable symbol flags with __kflagstab
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

---
Siddharth Nayyar (8):
      define ksym_flags enumeration to represent kernel symbol flags
      linker: add kflagstab section to vmlinux and modules
      modpost: populate kflagstab
      module loader: use kflagstab instead of *_gpl sections
      modpost: remove fragmentation of ksymtab and kcrctab sections
      module loader: deprecate usage of *_gpl sections
      linker: remove *_gpl sections from vmlinux and modules
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
base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
change-id: 20260305-kflagstab-51a08efed244

Best regards,
-- 
Siddharth Nayyar <sidnayyar@google.com>

