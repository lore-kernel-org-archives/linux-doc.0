Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BDB257824;
	Wed, 10 Jun 2026 04:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781066170; cv=none; b=JSi0ndy7qxfmRltXHZpmus4igBQ/2jfQbNl9K+qo/6IOGBvbIvNw2tSQaZ/NDXS7ZJCwr8RUzA2ZhGKHTDzyvqGdiLakBQ1Qw6wYbQQqiKiMnNelgdenHonRZrOmacd1bqaJh2xzzjEUngbelMkrNamtYn3XxFGypYmI5rA3+f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781066170; c=relaxed/simple;
	bh=3GXiGY517xe/UadGb37rObRReqoIjBTBisS6jBAfnwI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D3qUiB+ELzCCbkUGiAs/SY5RjKecfc/yOaz6D1/WCwY0Temyn9ZsDQQyNdcWbkfbYFwwZJona/6p+2KBoPWqI0w80MAGQDtWQYK50B/w4GhDrWXRr7kAA77UqlufGFs3I1LZe6HNxWf4q5JQiChcWul3LlCrWPZRFlCu1wjOtXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Hve/LHH2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Hve/LHH2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C98025E3;
	Tue,  9 Jun 2026 21:35:57 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 649AB3FD88;
	Tue,  9 Jun 2026 21:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781066162; bh=3GXiGY517xe/UadGb37rObRReqoIjBTBisS6jBAfnwI=;
	h=From:To:Cc:Subject:Date:From;
	b=Hve/LHH2Etq+3KMCwxsq4ZEOskp1J2Nr8Z9uojcgE70CS6uPIvW1k9fRwrY2FGboV
	 aCO2Afv0S7Bp3/bYEB3PLcRyhZ7PiPFYJSRRhT7gZG3whe+uQKwJKE2SXxNBuKmIkM
	 ceqpLlWypcrtSf3RU+anYjwe5QHflJRBijB7520w=
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
	linux-doc@vger.kernel.org
Subject: [RFC V2 0/3] lib/vsprintf: Add support for pgtable entries
Date: Wed, 10 Jun 2026 05:35:42 +0100
Message-Id: <20260610043545.3725735-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Printing page table entries has been a common requirement both in generic
and platform memory management for various purposes. Hence let's create a
dedicated printk format for such entries which will also help standardize
pgtable printing across different platforms.

Also add a test for this new print format in lib/tests/printf_kunit.c via
existing CONFIG_PRINTF_KUNIT_TEST.

This series applies on v7.1-rc7

This series has been tested on arm64 but built tested on several others
including x86, powerpc, s390, riscv, and mips etc. Although it does not
build on arm32 platform due to existing pgdp_get() concerns.

Changes in V2:

Accommodated most suggestions from Petr Mladek and others

- Moved __print_bad_page_map_pgtable() changes into a separate patch
- Added helper pxd_pointer() for pgtable print format
- Added buffer check via check_pointer()
- Added special_hex_number() for base case printing
- Added static_assert() to ensure acceptable pxd_t size
- Avoided direct dereferences and used pxdp_get() helpers instead
- Improved printf KUNIT tests for all level page table entries

Changes in V1:

https://lore.kernel.org/all/20250618041235.1716143-1-anshuman.khandual@arm.com/

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (3):
  lib/vsprintf: Add support for pgtable entries
  kunit: printf: Add test for pgtable entries
  mm: Replace pgtable entry prints with new format

 Documentation/core-api/printk-formats.rst | 19 ++++++++
 lib/tests/printf_kunit.c                  | 57 ++++++++++++++++++++++
 lib/vsprintf.c                            | 58 +++++++++++++++++++++++
 mm/memory.c                               | 15 ++----
 scripts/checkpatch.pl                     |  2 +-
 5 files changed, 140 insertions(+), 11 deletions(-)

-- 
2.30.2

