Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DBD3CCFCC;
	Mon, 13 Apr 2026 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776086820; cv=none; b=gxms48K9W5pqrcI98OpqcE6xOMHmJI457eic3WQauiswacGbu2KMGMEi56TixWrtqbVljP9vjodPG9A7hFOmYtv1OVC8iK6Cl2se0nqK/A/TeVqGUAOA03jQHRlxdgHiIiPTv3v+CbFze1i4RRPyzMEOyYC3LRmD2Ofqw8QHq3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776086820; c=relaxed/simple;
	bh=6FMMIHFEEVygVWHKafUVcd/YxF9s04Zrb7o6EqrA+v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B7NKsaFQjJeXsBEKVrNO4ZdaBTcmNbvHsY/u+w4mOM0YJTilQMzgDA4wc2JyVD4PhaYGOhYtjML/xyNVjNvghVu2U78QD4sXRHUvkjE8n6ZIvpfskHAYTH79xCykg6eAmFywCRRUDJHib82luKVD3Wc90ujv7KJ4x1rfWD5LcEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=hIA2wNhd; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="hIA2wNhd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=F+mjPhtdtTxQus0gs48zKH9AMTVSWSCrzylz5KeYQkk=; b=hIA2wNhd/+4wulxxeljIA7XYwG
	+2uscT5CxkxKURVdzDvHl2mUF0t8cQU8CpleXfHwJX+J9YysgHXgIHtBvbX4/89YKuFAMBt/w1dmw
	SA9xGl7W4Z4Ye+iP/DXFTrpBDr2usBZKhDfPyj7UXT4DF+tGV4MjKLAFiIo345N8rd2zXExbPX56K
	L39axnG7g43ZTBZk6fJfFXQ5A8hwtLgrWfDc8Q3+qbm7gOVlXbm1knObNPI1VTGFxNAGMaCvAq+oQ
	evjbCuw0r58INU+nVkiOdirG9U7F+VslqpTiI/zsvaI06fwL3JE8pGgTQJdR5U1X8DMoVjMqSOk2i
	GkJBojdA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wCHJL-00CKDm-0P;
	Mon, 13 Apr 2026 13:26:44 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v3 0/3] mm/memory-failure: add panic option for
 unrecoverable pages
Date: Mon, 13 Apr 2026 06:26:32 -0700
Message-Id: <20260413-ecc_panic-v3-0-1dcbb2f12bc4@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnv3GkC/22NywqDMBQFfyXctSl51air/kcpJcarposoiQ0t4
 r+X2I2FLg/MzFkhYnAYoSErBEwuuslDQ2RBwI7GD0hdBw0BwUTJpJAUrb3PxjtLFSot20qySls
 oCMwBe/faW9fbd8dn+0C75EAmRheXKbz3s8Qz96+bOGVUC8NrwbUo7fnSYeuMP01hgBxO4qBKf
 lQFZbRGxTrWl6rX5kfdtu0DdB254fAAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3765; i=leitao@debian.org;
 h=from:subject:message-id; bh=6FMMIHFEEVygVWHKafUVcd/YxF9s04Zrb7o6EqrA+v0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp3O8Ob6dg1xqMSIH3qXJLaklmJDoaeBTtzRt2X
 SQWpO9pwg2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCadzvDgAKCRA1o5Of/Hh3
 bSwTD/40PWCYKr3Daelwzpdbb8aF4Ipyr6hkcRy+2mCZwHKIcvV4KtYgwMmJA/AbJOKMDlv0iCZ
 durRLr++0jUx7UsEnsr3nmGzUYVBS+rT013fje/Q1Lq/CTHo8W4P5pLFesnyP220yqVjurCJN9b
 LAlgz5zlQip2ZpaVHUlJrG2Fj1XChT5H0d6CICtO3lMQgb8D7kTmIwa6I/gsy78UiDbUGopKfie
 Nwhksid9GwVXdk7PqQ349Nt8b7qLOMj3/aOA8WTzqlxAC+90iQKJT+0q3LrmJ9Os8CtyOn8ijSs
 wEBneOW3jtkm2IdaYfs3mkHShhbcmuRi+ND7sq8AG2wpwlmytus6reXRNTLE/JbNjUZMIqSx+ox
 HXS60Ni3lcQJr3JRfTr49sMXhLymTEjegz/vgxy0/JC02NOFWCkQb3hnZ+uxQhSSE4OTzADWOmP
 mDPuR1hv0C2pfOGTDwXUVFAKi6fjfcO7q83Lznb3t0+Q0+FFnYWVj97hef2dOOwxcr2ncU2OsG4
 vrmS+i6I+aslbpj2dqXIn9G8G3WjUJBV3uyFVSdHpur4hk7+swtwTOpFh97Y4TM0qHlD9SVv1nU
 MGEkkt4YJ9OuAuBxoVDkmoj5dPpIjJ+Z/dh3qJxvzMklVxOt4hAq1v71AMSteRA2yVc6n7adQHM
 pdBe/56+JcztoeQ==
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
seconds later d_lookup() accessed the poisoned cache line causing a synchronous
external abort:

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
unknown page types (MF_MSG_UNKNOWN), so all unrecoverable failure cases
are covered.

A CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC kernel configuration option is
also provided, similar to CONFIG_BOOTPARAM_HARDLOCKUP_PANIC, allowing
the sysctl to be enabled at build time for systems that always want to
panic on unrecoverable memory failures without requiring runtime
configuration.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
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
      mm/memory-failure: add CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC option
      Documentation: document panic_on_unrecoverable_memory_failure sysctl

 Documentation/admin-guide/sysctl/vm.rst | 46 ++++++++++++++++++++++++++++++
 mm/Kconfig                              |  9 ++++++
 mm/memory-failure.c                     | 50 ++++++++++++++++++++++++++++++++-
 3 files changed, 104 insertions(+), 1 deletion(-)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260323-ecc_panic-4e473b83087c

Best regards,
--  
Breno Leitao <leitao@debian.org>

