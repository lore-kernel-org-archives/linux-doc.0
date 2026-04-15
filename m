Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BCF257843;
	Wed, 15 Apr 2026 12:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257751; cv=none; b=UmDrFxgfNsJCNnRUQeov/j/DM/rfSyKJDOeMhbpIqpVZvF6OyQssGTsoFrYk4qBDf2NN2DTeJTwj83L1/jyLJvtbgezg+ukBhCk3uCTeUgjN/cLsTAq4wu6Y0LQS3TKspBpLp1wCN90lxxQ45+maZ6FZoOwfslCeD07ZZfcpi+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257751; c=relaxed/simple;
	bh=ooqEvy5RJLVNe8O7dJAeTYBomhd/oOnKcXQmFHXWZ0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bf3ql0RMtLMFdqiLKtDPcG7PkDckmaTf9LVJ4x9P2w7ddmI3o3TbV72LudeNqv1MRSHthhupzDcCSdBMZ0Rnu8x6aD7ynNhiBAuUczuP3hzoq1fzHDCKSfOx95sG5cM41/UHELbR9WOxsKI6Z6JxkMKxmFggkz7PyaQckJ11OnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=KcgH6XGU; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="KcgH6XGU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PrbNme7HAridR/s19D36B9OKd4ZmL9kBz9U1v21Yc8M=; b=KcgH6XGUZei1cV4hRJDyT4JTTS
	65XSBZCZYCQlRfI+6uvI0zs8y+T7A86Mj5SrnFzzztVqiDb+uknhrHBe9IEs1UcUNcZ3B4N196TVh
	DQGzRtnp4ok1tgJUAPu8zJbRYGkYrs8t7fpx6NDZlH5skyYvbOIHEWYbp3HWSQQR6qC6UMeMQcaHg
	ROlETLhImiz7mEmaiWYBAjeFQaowPG7vVbhwL0wA7bYJ3aPJJPC5CUp7+RlOEDAuRXkb04G+5p0mn
	1grjByThMO6UCZSN9tydZF8YZIYxI3dN/g6HR/KXyqtxfneSOuUfcoZ4BfMbVy4A29CdcXdq9nz8b
	lexwavCw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCzmN-00Dqow-2G;
	Wed, 15 Apr 2026 12:55:40 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v4 0/3] mm/memory-failure: add panic option for
 unrecoverable pages
Date: Wed, 15 Apr 2026 05:54:59 -0700
Message-Id: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKOK32kC/22NQQrCMBBFrxJm7UgyiY125T1EJJlONS5aSbQo0
 rtLdaGiyw/vvX+HIjlJgVrdIcuQSuo7qJWbKeBD6PaCqYFaAWmqtCWLwrw7hS4xOnHexqXVS88
 wU3DK0qbrs7XZvna5xKPweQpMxCGVc59vz7PBTNy/7mBQo6dgVmQ8VbxYNxJT6OZ93sMUHuhDt
 eZTJdS4Eqcb3Vau9eFHtW/Vma9XixpNwzFSayiy+1LHcXwAhhbu5SsBAAA=
X-Change-ID: 20260323-ecc_panic-4e473b83087c
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4428; i=leitao@debian.org;
 h=from:subject:message-id; bh=ooqEvy5RJLVNe8O7dJAeTYBomhd/oOnKcXQmFHXWZ0c=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp34rHlDVyi74jWKjoFIyrfuD1lU9NC94kYqtNa
 rxjhMVfyxaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCad+KxwAKCRA1o5Of/Hh3
 bfaoEACfT0yRyfwkUbkyCtIBIcPgZhyc3UjA5YMPy7cZyHiTsjEK2UEy8QIj60IPwKcUpq0rWgP
 aNmyhJDfHFcXgs0ec9z/y+mPBjAHuUgg8IIYhPMAkGGcfkoZeA2/PivNoSsx1wE55yu4OP3/Av0
 un0pRYOKDqSlujYetUjTSyK0nZvY/AAbPynIUBXSZs0zi8X2DWlU+WO2yJX1sNvl2yrznGJb0xY
 WMX4g8iShGeaXbCkOMJ1NC9+mZkfskHda3+7VXY3MnBqo0IX5agrbm5hVfCswcMGHG8q6nhuTjh
 yMHhJLsi2lFVfclTZzm1yqOS1+TnWVjj07X8U4W4IWPR4/czteKwmMR/DE02aFyArQ5fksTn7J3
 60DHkszYGikQ48mpDWkWrcBm3Nn3yzgY8xKm4v3mFbVrlWi4RyEZ7jV9vdW6NdZ+kQKo2nzE+y4
 i2OGz+hkJsz3S/jLrt60gl7B5jZTaooQBfz/nwyZmnNeyDu81ndXkBPC6KvnKgH9mq4eVHMqCMf
 exPMVVlV3xzg53re5bhogd79RpXy9oUfu+C1AKS6D/7phD1vdowneW2WMjugWhPvQ6zgzJQEE7e
 Boj8mmhb0N8d1lwDTKMJdcEe538llr9KIrbtZIR6r/+xdXPQeZPDu2sxDA4VgtCBEUvTBHRlzVK
 kemWvKRJNUwOaeA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When the memory failure handler encounters an in-use kernel page that it
cannot recover (slab, page tables, kernel stacks, vmalloc, etc.), it
currently logs the error as "Ignored" and continues operation.

This leaves corrupted data accessible to the kernel, which will inevitably
cause either silent data corruption or a delayed crash when the poisoned memory
is next accessed.

This is a common problem on large fleets. We frequently observe multi-bit ECC
errors hitting kernel slab pages, where memory_failure() fails to recover them
and the system crashes later at an unrelated code path, making root cause
analysis unnecessarily difficult.

Here is one specific example from production on an arm64 server: a multi-bit
ECC error hit a dentry cache slab page, memory_failure() failed to recover it
(slab pages are not supported by the hwpoison recovery mechanism), and 67
seconds later d_lookup() accessed the poisoned cache line causing
a synchronous external abort:

    [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
    [88690.498473] Memory failure: 0x40272d: unhandlable page.
    [88690.498619] Memory failure: 0x40272d: recovery action for
                   get hwpoison page: Ignored
    ...
    [88757.847126] Internal error: synchronous external abort:
                   0000000096000410 [#1] SMP
    [88758.061075] pc : d_lookup+0x5c/0x220

This series adds a new sysctl vm.panic_on_unrecoverable_memory_failure
(default 0) that, when enabled, panics immediately on unrecoverable
memory failures. This provides a clean crash dump at the time of the
error, which is far more useful for diagnosis than a random crash later
at an unrelated code path.

This also categorizes reserved pages as MF_MSG_KERNEL, and panics on
unknown page types (MF_MSG_UNKNOWN).

Note that dynamically allocated kernel memory (SLAB/SLUB, vmalloc,
kernel stacks, page tables) shares the MF_MSG_GET_HWPOISON return path
with transient refcount races, so it is intentionally excluded from the
panic conditions to avoid false positives.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v4:
- Drop CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC kernel configuration option.
- Split the reserved page classification (MF_MSG_KERNEL) into its own
  patch, separate from the panic mechanism.
- Document why the buddy allocator TOCTOU race (between
  get_hwpoison_page() and is_free_buddy_page()) cannot cause false
  positives: PG_hwpoison is set beforehand and check_new_page() in the
  page allocator rejects hwpoisoned pages.
- Document the narrow LRU isolation race window for MF_MSG_UNKNOWN and
  its mitigation via identify_page_state()'s two-pass design.
- Explicitly document why MF_MSG_GET_HWPOISON is excluded from the
  panic conditions (shared path with transient races and non-reserved
  kernel memory).
- Link to v3: https://patch.msgid.link/20260413-ecc_panic-v3-0-1dcbb2f12bc4@debian.org

Changes in v3:
- Rename is_unrecoverable_memory_failure() to panic_on_unrecoverable_mf()
  as suggested by maintainer.
- Add CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC kernel configuration option,
  similar to CONFIG_BOOTPARAM_HARDLOCKUP_PANIC.
- Add documentation for the sysctl and CONFIG option.
- Add code comments documenting the panic condition design rationale and
  how the retry mechanism mitigates false positives from buddy allocator
  races.
- Link to v2: https://patch.msgid.link/20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org

Changes in v2:
- Panic on MF_MSG_KERNEL, MF_MSG_KERNEL_HIGH_ORDER and MF_MSG_UNKNOWN
  instead of MF_MSG_GET_HWPOISON.
- Report MF_MSG_KERNEL for reserved pages when get_hwpoison_page() fails
  instead of MF_MSG_GET_HWPOISON.
- Link to v1: https://patch.msgid.link/20260323-ecc_panic-v1-0-72a1921726c5@debian.org

---
Breno Leitao (3):
      mm/memory-failure: report MF_MSG_KERNEL for reserved pages
      mm/memory-failure: add panic option for unrecoverable pages
      Documentation: document panic_on_unrecoverable_memory_failure sysctl

 Documentation/admin-guide/sysctl/vm.rst | 37 +++++++++++++
 mm/memory-failure.c                     | 92 ++++++++++++++++++++++++++++++++-
 2 files changed, 128 insertions(+), 1 deletion(-)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260323-ecc_panic-4e473b83087c

Best regards,
--  
Breno Leitao <leitao@debian.org>

