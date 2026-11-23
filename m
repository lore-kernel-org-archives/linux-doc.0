Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450227;
	b=4VeR88Ey+WFDRxmxGmszbadJ/Hoa0lpi2I3M8tt35YfTNhHcbNmp+9erEusdcHYMAVwm
	 /Ue2fGoC1BPzdbUP6eRgcI1SzRtcsmR8ZNsAgaLfGAnuaKsoOw3LsIEUP0pc5E5OdCjZy
	 5rPVXxzNMWXRz8UpSKDNtyVMcVRbwrhvE4mvaQyjhXeIV06tWjRbyqUlEh0e6JPavG2fE
	 G7dXbEmpLfsI3eTQdSCdfglreGosGdqoBZvY+ZQW6ETz6mCUuW71x1j1JR8UmXEen4UQx
	 IddRc5xUi713lnu756IUhnyYPbgoL9QheBY1nyeC5rG0eiAcLnXO9E27XOUZLUr5xJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450227;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lfsfc1WMfSC0QgUpwbLULjOQXGicAPKLtwLK5uI441Q=;
	b=Jg7K5DMjUPM/BGoaVoMplSRVHfHaNq9Q4WLV74/ZWPYaYG/i8dp9n+bOuy7qKQYY90fL
	 Rsjt5LlVQwkPftiyKzXclOUUHjTP/gHRFz7WB9NzZrieX+Qs7vOHq1DUWlUvIC2ohmcjO
	 ixoYYo0tgH2f8ReVZWdtVGeDe+0PsgWJF9qOONcBnPe7bPspGJZnnpwzcWrINuuZXZt8X
	 rY5PPK9YK00ObnVCIjloaDRVtjyAefT++8FPiuYopQUKeGl0NsqyjYYGuSCcXZCiFmKC9
	 IlchtFiDMV+zhTYvZxC90f70qTuBPlPs9glHmLhbr9NI0daJPqSee2x0ombJvpnojMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NhD/xOlx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17A8606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 16:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhD/xOlx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8501F000D0;
	Mon, 23 Nov 2026 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795450227;
	bh=lfsfc1WMfSC0QgUpwbLULjOQXGicAPKLtwLK5uI441Q=;
	h=From:Date:Subject:To:Cc;
	b=NhD/xOlxcASeAudQuKlMZ5sD5z16j33iIQmWBQdrZ1Ow2Nf7X+7PfO2DUkpTg21R7
	 nI/DOR4DG37WrAXucBV+4HOr35ErWqSjeoGz+MaPylglqsCDsP/ce+LF590mrE0XKK
	 tp5beo3JoCjT52hiBgqbCBkgqM/BCEO78gNWk8axoKED1j3Pv47haxy6oux2MagLnm
	 3uDj7LBiga/vtH4LX2Y+OiNVc2Oa38GclNbw60zKndLhA+WJS328ZNEu3Q2gYtzDwU
	 WG7oULkRLPJYfERHt+jeRINzYumS0C3FBBPBjBNP+0rzGWUj+gX3C014V6U24hTUL3
	 uQv6yk7AcazJg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 23 Nov 2026 16:10:15 +0000
Subject: [PATCH v2] mm/rmap: correct VMA write lock position in lock
 ordering
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-fix-rmap-lock-ordering-vma-locks-v2-1-11b04646abe4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5XNQQ6DIBBA0auQWTuNYDHBVe/RuEBAnWjBDA2xM
 d69qTfo9i3+PyAHppChEwdwKJQpReiEqgS42cYpIHnoBKhatVIqiSPtyC+74Zrcgol9YIoTlpe
 9JGOrtGnurRlGbaASsHEYab8Wz74SMFN+J/5cxyJ/+ke8SJRotHK193pwjX0sgWNYb4kn6M/z/
 AIMNe4M0QAAAA==
X-Change-ID: 20261121-fix-rmap-lock-ordering-vma-locks-62593469bf59
To: David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, 
 Lance Yang <lance.yang@linux.dev>, Suren Baghdasaryan <surenb@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, ljs@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3465; i=ljs@kernel.org;
 h=from:subject:message-id; bh=JFN3XXJROK9z0GHrDq6eqZSloqOW75UtPvr8ButN3P0=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJZUrN9Epjj/UR614id1zhvIph3tpNPeIV2Gr+kot9s6
 /idX552lLIwiHExyIopsjz/Ir4/SCRsXucFfzeYOaxMIEMYuDgFYCIbJzH8U36SlhZUujN8o9fs
 zoeXjywVMLlj6e1468eaP/tO3k4+as/IMF/5pnXQ9yzbJ5t/rBbZcezXETn9+//Dyjd4rZ5lmWC
 WyQwA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

The list at the top of mm/rmap.c is taken to be the canonical order in
which locks must be taken in mm to avoid lock inversion.

However, VMA write locks appear to be misplaced. These were added there by
commit 55fd6fccad31 ("mm/khugepaged: write-lock VMA while collapsing a huge
page"), which was focused on expressing the dependency of locks after VMA
locks in the ordering on them, disregarding those prior to it.

Of course, a VMA write lock requires an mmap write lock to be held, so this
leaves three locks to consider:

mapping->invalidate_lock (in filemap_fault)
folio_lock
hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)

Each of these locks is either downstream of a VMA, or is not able to
acquire a VMA lock at all (e.g. in an rmap operation).

This is because accessing a VMA's file (thus mapping), traversing page
tables to a folio, or interacting with hugetlbfs requires the VMA to be
stabilised in the first instance.

Nothing in the kernel takes any of these 3 locks before a VMA lock, and
indeed in each case that a VMA lock is taken it is taken before - so the
kernel is already violating the ordering as-written.

So fix it. Also add [_killable] to reflect the existence of
vma_start_write_killable().

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
v2:
* Updated docs to reflect change as per Suren.

v1:
https://lore.kernel.org/r/20261121-fix-rmap-lock-ordering-vma-locks-v1-1-952c0dd5bc3a@kernel.org
---
 Documentation/mm/process_addrs.rst | 8 ++++----
 mm/rmap.c                          | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 04b649818cc1..40be3a46a521 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -418,10 +418,10 @@ ordering of locks within memory management code:
 
   inode->i_rwsem        (while writing or truncating, not reading or faulting)
     mm->mmap_lock
-      mapping->invalidate_lock (in filemap_fault)
-        folio_lock
-          hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
-            vma_start_write
+      vma_start_write[_killable]
+        mapping->invalidate_lock (in filemap_fault)
+          folio_lock
+            hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
               mapping->i_mmap_rwsem
                 anon_vma->rwsem
                   mm->page_table_lock or pte_lock
diff --git a/mm/rmap.c b/mm/rmap.c
index 65646ed6fc45..55367e7d3eec 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -22,10 +22,10 @@
  *
  * inode->i_rwsem	(while writing or truncating, not reading or faulting)
  *   mm->mmap_lock
- *     mapping->invalidate_lock (in filemap_fault)
- *       folio_lock
- *         hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
- *           vma_start_write
+ *     vma_start_write[_killable]
+ *       mapping->invalidate_lock (in filemap_fault)
+ *         folio_lock
+ *           hugetlbfs_i_mmap_rwsem_key (in huge_pmd_share, see hugetlbfs below)
  *             mapping->i_mmap_rwsem
  *               anon_vma->rwsem
  *                 mm->page_table_lock or pte_lock

---
base-commit: d12eccbcb79a4fa35c3aa588eb79056af62eb859
change-id: 20261121-fix-rmap-lock-ordering-vma-locks-62593469bf59

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

