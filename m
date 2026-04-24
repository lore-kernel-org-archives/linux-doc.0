Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4913DBD47;
	Fri, 24 Apr 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777039288; cv=none; b=lkFlMsc58cGi9PRdCbx5D2iVl07UY0L/sdoedcSZYhQs9fYIrltI7dZ0sLOrxvbu8CMuqRLqh+BU5y4VYk3bizLq3q+xXMhTd7xWUH4Sa+GekwS7GN1Gk1anW9dH2cJE5HxjxI7DXSRXQX63YbnmPCFyuXYq0AeADjI/xRwh2F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777039288; c=relaxed/simple;
	bh=ne0w3U/qb9Eq3ShDvj1y+mTm0Iqj6lSthxxEzyDc60g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8zVoWeyViUDS/QUNgVgSEdr4rgr7Ur1cNoXCZiALw1Y7zxXfnmQ/d0FFd1OOwx4bZHnumSDJ/oLhM6f0j0flqmNHTUYl94ANkwZhb9x0n6/gcg+xTpofvkNg/Souyxt3bQmlqa+Tbd+oKIaIfMLqC8XsRxWTh4aj1ZW3g6HDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I9H0hbfM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I9H0hbfM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93534C2BCB6;
	Fri, 24 Apr 2026 14:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777039288;
	bh=ne0w3U/qb9Eq3ShDvj1y+mTm0Iqj6lSthxxEzyDc60g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I9H0hbfMFtXWEg5HWINI/FHkJ9LkKBaBFKX3V7MsIYLgPac0I5xlVQGxhaQg3naj3
	 4G7bPpahxNPtNYrVS34oz8M6Mt1E/hqS5TOb8hhX7QJ0F40hOFGnWicy9BpiRNdGw9
	 9uHnRGZ0npVlu/iBL3NdQ0Vk+rR5LUa92Ms2AMVwhpuzjdcdv/diAhFHwWsUtBLC3+
	 WmpWHc0/+CeSQPFp/s2Piq1QaaAtajpXxEndvi/wEia9+Kk/cg1rYvon+mveRlHCGp
	 glaFm1BtTZ8LRj+tx5XUp10+9q48mgjIX3MbdLDlZVggK989NoBkAXb1/IkYh/n01R
	 TUcfBxG0cHyig==
From: Sasha Levin <sashal@kernel.org>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@nvidia.com>,
	Sanif Veeras <sveeras@nvidia.com>,
	"Claude:claude-opus-4-7" <noreply@anthropic.com>
Subject: [RFC 3/7] mm: add Kconfig options for page consistency checker
Date: Fri, 24 Apr 2026 10:00:52 -0400
Message-ID: <20260424140056.2094777-4-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424140056.2094777-1-sashal@kernel.org>
References: <20260424140056.2094777-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sasha Levin <sashal@nvidia.com>

Add two configuration options for the dual-bitmap page consistency
checker.

DEBUG_PAGE_CONSISTENCY enables the feature itself. It depends on
DEBUG_KERNEL since this is a debugging tool, and selects DEBUG_FS to
provide the statistics interface. Memory overhead is two bits per
physical page frame across two bitmaps, so about 1 MB for a 16 GB
system. The bitmaps are statically sized at boot from memblock, so
memory hotplug is not supported and the option depends on
!MEMORY_HOTPLUG.

DEBUG_PAGE_CONSISTENCY_PANIC controls the response to a detected
violation. When enabled (the default) the kernel panics on
double-alloc, double-free, or bitmap corruption; when disabled it
logs a warning and continues.

Based-on-patch-by: Sanif Veeras <sveeras@nvidia.com>
Assisted-by: Claude:claude-opus-4-7 <noreply@anthropic.com>
Signed-off-by: Sasha Levin <sashal@nvidia.com>
---
 mm/Kconfig.debug | 59 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 7638d75b27db..a005c904677c 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -144,6 +144,65 @@ config PAGE_TABLE_CHECK_ENFORCED
 
 	  If unsure say "n".
 
+config DEBUG_PAGE_CONSISTENCY
+	bool "Debug page allocator with dual-bitmap consistency checking"
+	depends on DEBUG_KERNEL
+	depends on !MEMORY_HOTPLUG
+	select DEBUG_FS
+	help
+	  Enable dual-bitmap tracking of page allocations for corruption
+	  detection. Uses two complementary bitmaps where the invariant
+	  (primary == ~secondary) must hold. Any bit flip in either bitmap
+	  will be detected.
+
+	  This is useful for safety-critical systems requiring Freedom From
+	  Interference (FFI) guarantees per ISO 26262 (ASIL-D) and IEC 61508
+	  (SIL-3).
+
+	  When disabled, the hooks compile away. When enabled, a static key
+	  gates tracking until initialization succeeds. The bitmaps are flat,
+	  covering the entire PFN range from memblock_start_of_DRAM() to
+	  memblock_end_of_DRAM() including any holes. This is deliberate:
+	  simple (pfn - min_pfn) indexing is trivially auditable and avoids
+	  auxiliary data structures that could themselves be subject to
+	  corruption. Memory overhead is two bits per PFN in the spanned
+	  range, e.g. ~4 MB total for a 64 GB system. Waste from holes is
+	  typically under 2%.
+
+	  Based on NVIDIA safety research.
+
+	  If unsure, say N.
+
+config DEBUG_PAGE_CONSISTENCY_PANIC
+	bool "Panic on page consistency failure"
+	depends on DEBUG_PAGE_CONSISTENCY
+	default y
+	help
+	  If enabled, the kernel will panic when a page consistency
+	  violation is detected, such as double-alloc or double-free.
+
+	  If disabled, a WARN with a stack trace is emitted and execution
+	  continues.
+
+	  For safety-critical systems, say Y.
+	  For debugging/development, say N.
+
+config DEBUG_PAGE_CONSISTENCY_KUNIT_TEST
+	tristate "KUnit tests for dual-bitmap consistency primitives" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for the dual-bitmap primitives defined in
+	  <linux/dual_bitmap.h>. These tests verify the core algorithm:
+	  setting and clearing bits in complementary bitmaps, detecting
+	  double-set and double-clear conditions, and detecting simulated
+	  corruption.
+
+	  The tests exercise only the header-only dual_bitmap library and
+	  do not require CONFIG_DEBUG_PAGE_CONSISTENCY.
+
+	  If unsure, say N.
+
 config PAGE_POISONING
 	bool "Poison pages after freeing"
 	help
-- 
2.53.0

