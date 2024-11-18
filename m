Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7EE79DC7
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731948440; cv=none; b=M7yhvIOzbCFsdghVDX9v/BgVbWhIR22F9e6UvV99Ew7wDP0fKp9yDuCr9W1UQABeq8+4PUOKUFjydNRTIwsNZdMfC25w6qLLgvNGljKuxIUrjNxBqkMk8LNMlgoNhHDb6L57Mlp7XFwWibVQlqOkuWsCILspr/qPv0M5X9xyO44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731948440; c=relaxed/simple;
	bh=Tj6as4lyfOj870ZEtZFErV7pZX1VT/55uSBp4Vx4tOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oFce2H0TB2HNq2TDAeO2NjPK13DyZMX+QQ4cJRlA1hDf2CxR96JGgMEZwDTYLf3XTtH2HGjDwYVOsfmwKZRAXP/zRMoEZlAds/uT3lZ64clcDIRm9KbaCPhAmrraA4+82IOgsyHVb/uzJQU0+TJPM/G9+kasZTjRQu54t0ZvcV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kK9QWWv6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kK9QWWv6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315a8cff85so104105e9.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731948436; x=1732553236; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yulWlyAryarglyJHhf1g4QlaVWiEt2glir3o6MKhddQ=;
        b=kK9QWWv6YEg1AMTtU8ndD/5ziLoWFEGEeoLxpvwRW4HzW8xfBnFVRrC+C0Mdc2BFEe
         s89d/qogO5H0162l/oDzFfoRN4Y2BZV0z47LmcQa34b5eRo+90cZZqtp8sETldu1XfPC
         4Ly8pQwwsKg/O0uPh11CWtP7M60E/D21TVas9weGpPkvhpRc7M5Qu6RnvqNPXymzr7Fb
         F98fhoC4oOV6kauZ2P+exb8ROICS3e4Bgd/M70F5hg5pbBnfkvbM160kx8f3i1VB05P2
         NIdQCut55ZpSgYnN8xFaZZIyWpanEOPdfsHFUQSBJsgGWRL/dXJklIU/yE+CG0IFMtMb
         gBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731948436; x=1732553236;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yulWlyAryarglyJHhf1g4QlaVWiEt2glir3o6MKhddQ=;
        b=k3I9TXdpiTyAAduBgWTOx7qjXz6mu6tuqvHZyLakWnexhZbft+Rz7A9WcZ1vJW2TUJ
         p6G/WzvCsEB7yRh5Q6Fgnu+gle+LYOOWaYbEp2e3JAGNEBWDmVfUqWXa6DBbiQUw2JVE
         Q2PNsOudEcFtYCCQUBlL/IfAuWmxhC6ahPkezkTz86haGlHaH6C+GhpNZerGcuzrrl5Y
         R9xiEcrj8CcwwyvnopCHAkrTziY8F+hdagLDckdYyWgHdHI9sa0csTKCilO7qIDyH0ud
         Q4MSm4mlfrFUnfuYU9Pr2Yrc1kYRFnWF7YjS55bL0DIDr4yqLT3ymT9WxyIPc5lVJ+Vr
         8ugg==
X-Forwarded-Encrypted: i=1; AJvYcCXrTT1aw+16dArPlamZOvTY8rxbIjV6CpTehXmB1qbe8Vy0XzW1ZIu+udvJdBAugdbK27GRyC84NFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyuUe2SCLK0a45/2bHV0Z5KtE0yENwKw5bZVrhu999/slJNe0M
	WYdL6V9wNJxCjAo6OyMtgs77Og8bIjQF3aMB2tYbEoe4fcFf3MSCpALKbXUl/Q==
X-Gm-Gg: ASbGncvd9zP26ao2atn0p4ou2eVD1ygmbcXSw7hSrVoylYDmZzykZ49vLUmJoq44zl1
	Au9wmscXOT1b/oAsR1kXFzaRrw+GGktHOtnBuN2BzF0tPj1HcxxHmgD2hQBZ2eFuvjkOV0dkqbM
	Ogaaud9XKR05ct4lCNmUnhomgX3rHNzx4aFsT09KeuAepFET2GooLeQkFYJs+baefYhN1RNg0Uh
	k6OBqicQoTapUm0BWfrSgoyYR25oPdvus+BPA==
X-Google-Smtp-Source: AGHT+IFNBQnXcXNYwBA4uY4EnNPQT7jvfiQd0dZbXjjA3odLp7P3c1YobAYW4+ktniSoixOes7Rx0g==
X-Received: by 2002:a05:600c:378e:b0:426:68ce:c97a with SMTP id 5b1f17b1804b1-432e6c68531mr2946445e9.7.1731948436066;
        Mon, 18 Nov 2024 08:47:16 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:67c6:82f7:cb35:6755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3824a42008esm2049157f8f.66.2024.11.18.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 08:47:15 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Mon, 18 Nov 2024 17:47:08 +0100
Subject: [PATCH v2] docs/mm: add more warnings around page table access
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-vma-docs-addition1-onv3-v2-1-c9d5395b72ee@google.com>
X-B4-Tracking: v=1; b=H4sIAItvO2cC/4WNQQrCMBBFryKzdqSTBktdeQ/pIiQzbcB2JClBK
 b27sRdw+T7/v79B5hQ5w+20QeISc9SlgjmfwE9uGRljqAymMZaILJbZYVCf0YUQ19om1KW02Jo
 glq9BxAvU9SuxxPdhfgyVp5hXTZ/jqNAv/e8shIQi1HWucabv7X1UHZ988TrDsO/7F2mdtF+/A
 AAA
X-Change-ID: 20241114-vma-docs-addition1-onv3-32df4e6dffcf
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Hillf Danton <hdanton@sina.com>, 
 Qi Zheng <zhengqi.arch@bytedance.com>, SeongJae Park <sj@kernel.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, linux-mm@kvack.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matteo Rizzo <matteorizzo@google.com>, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731948432; l=5458;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Tj6as4lyfOj870ZEtZFErV7pZX1VT/55uSBp4Vx4tOs=;
 b=cPYqKG4VICkcO8YOIeEi7vfjkAdMtNeAdAIBaayMANfxSgQ9qij3Dy8QQNfYInj9DI9yqK5Ct
 g3qS4QMIhm5AOsf5uKCuLY2siStASz+GNULQiXe6C13sdXsaq19sF0U
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Make it clearer that holding the mmap lock in read mode is not enough
to traverse page tables, and that just having a stable VMA is not enough
to read PTEs.

Suggested-by: Matteo Rizzo <matteorizzo@google.com>
Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v2:
- improved based on feedback from Lorenzo
- Link to v1: https://lore.kernel.org/r/20241114-vma-docs-addition1-onv3-v1-1-ff177a0a2994@google.com
---
 Documentation/mm/process_addrs.rst | 46 +++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 1bf7ad010fc063d003bb857bb3b695a3eafa0b55..1d416658d7f59ec595bd51018f42eec606f7e272 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -339,6 +339,11 @@ When **installing** page table entries, the mmap or VMA lock must be held to
 keep the VMA stable. We explore why this is in the page table locking details
 section below.
 
+.. warning:: Page tables are normally only traversed in regions covered by VMAs.
+             If you want to traverse page tables in areas that might not be
+             covered by VMAs, heavier locking is required.
+             See :c:func:`!walk_page_range_novma` for details.
+
 **Freeing** page tables is an entirely internal memory management operation and
 has special requirements (see the page freeing section below for more details).
 
@@ -450,6 +455,9 @@ the time of writing of this document.
 Locking Implementation Details
 ------------------------------
 
+.. warning:: Locking rules for PTE-level page tables are very different from
+             locking rules for page tables at other levels.
+
 Page table locking details
 --------------------------
 
@@ -470,8 +478,12 @@ additional locks dedicated to page tables:
 These locks represent the minimum required to interact with each page table
 level, but there are further requirements.
 
-Importantly, note that on a **traversal** of page tables, no such locks are
-taken. Whether care is taken on reading the page table entries depends on the
+Importantly, note that on a **traversal** of page tables, sometimes no such
+locks are taken. However, at the PTE level, at least concurrent page table
+deletion must be prevented (using RCU) and the page table must be mapped into
+high memory, see below.
+
+Whether care is taken on reading the page table entries depends on the
 architecture, see the section on atomicity below.
 
 Locking rules
@@ -489,12 +501,6 @@ We establish basic locking rules when interacting with page tables:
   the warning below).
 * As mentioned previously, zapping can be performed while simply keeping the VMA
   stable, that is holding any one of the mmap, VMA or rmap locks.
-* Special care is required for PTEs, as on 32-bit architectures these must be
-  mapped into high memory and additionally, careful consideration must be
-  applied to racing with THP, migration or other concurrent kernel operations
-  that might steal the entire PTE table from under us. All this is handled by
-  :c:func:`!pte_offset_map_lock` (see the section on page table installation
-  below for more details).
 
 .. warning:: Populating previously empty entries is dangerous as, when unmapping
              VMAs, :c:func:`!vms_clear_ptes` has a window of time between
@@ -509,8 +515,28 @@ We establish basic locking rules when interacting with page tables:
 There are additional rules applicable when moving page tables, which we discuss
 in the section on this topic below.
 
-.. note:: Interestingly, :c:func:`!pte_offset_map_lock` holds an RCU read lock
-          while the PTE page table lock is held.
+PTE-level page tables are different from page tables at other levels, and there
+are extra requirements for accessing them:
+
+* On 32-bit architectures, they may be in high memory (meaning they need to be
+  mapped into kernel memory to be accessible).
+* When empty, they can be unlinked and RCU-freed while holding an mmap lock or
+  rmap lock for reading in combination with the PTE and PMD page table locks.
+  In particular, this happens in :c:func:`!retract_page_tables` when handling
+  :c:macro:`!MADV_COLLAPSE`.
+  So accessing PTE-level page tables requires at least holding an RCU read lock;
+  but that only suffices for readers that can tolerate racing with concurrent
+  page table updates such that an empty PTE is observed (in a page table that
+  has actually already been detached and marked for RCU freeing) while another
+  new page table has been installed in the same location and filled with
+  entries. Writers normally need to take the PTE lock and revalidate that the
+  PMD entry still refers to the same PTE-level page table.
+
+To access PTE-level page tables, a helper like :c:func:`!pte_offset_map_lock` or
+:c:func:`!pte_offset_map` can be used depending on stability requirements.
+These map the page table into kernel memory if required, take the RCU lock, and
+depending on variant, may also look up or acquire the PTE lock.
+See the comment on :c:func:`!__pte_offset_map_lock`.
 
 Atomicity
 ^^^^^^^^^

---
base-commit: 1e96a63d3022403e06cdda0213c7849b05973cd5
change-id: 20241114-vma-docs-addition1-onv3-32df4e6dffcf

-- 
Jann Horn <jannh@google.com>

