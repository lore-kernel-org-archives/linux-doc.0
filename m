Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E243101A7;
	Fri,  8 May 2026 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271525; cv=none; b=qLrf/OUSPUgT5y0kzBPVuH5EXU436EdjM6koO9bL5QEWG+tDFnoHM1REkK2PLL86LrH0/IyTuMRu1OVWji+YdZdKH0pskjOq7t2TRJ5woP59E7UbeSIJb/mIzoi9qBfD66yLxzDJ5G/Ypag4D8nb7oNXpmls/IMJ8XOBO5WMI7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271525; c=relaxed/simple;
	bh=rrCmMwa5mUtV3k6zNxNiKe/6fRYrOX8IGx3XtlDdbxI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=k8ApAfkINX4/IDL9T7EDwHeqI1F0pWE1RmzeXWCIIbbS2mF5MBBIP3xUA3Pq8evld11B5odNKhalSagtcwgSxZHl3w4uMAe38Sx3NfRf9AknsRQNML/EigtoJVMROwXs1G+FQPkfVPwcuaHipGvo7EjckgJZq2Ak53sHS0502Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uuEqunm7; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uuEqunm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778271514; bh=JK2ZtbLb2zyokwBdoLQqwGMNrWV203CYgnVwlRQcI7Q=;
	h=From:To:Cc:Subject:Date;
	b=uuEqunm7V+u2/vIVc2c47j9898sOzDAYjlzJI36x0IxPJFFXAqHKhfEFCTDgjUGGH
	 klC6hW4XULozplqWxfO7Q/WpMcOJxBsX4WfrifpKIxfIr/zwkSDUFrbv+4Aaxh6IGh
	 qpocuvCTXybW67D4EOTHnP39O0d09V5LIHbUk2qY=
Received: from node68.. ([166.111.236.25])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 49DA4C1C; Sat, 09 May 2026 04:18:29 +0800
X-QQ-mid: xmsmtpt1778271509tmpw3nucq
Message-ID: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
X-QQ-XMAILINFO: NMHonNIP0l2dK1VYHeaehc5RRJ40iTCfdKx4ii/4U2odT3HKiCXR0Bjn0NhoRB
	 rkoYU71WSyH4DbxXdmeEYa0QeaNUrxCxkphJireyB1pL8uscPMbh5Mv75S6sVwHSFbF4iANpUKoB
	 elwX9XfzWLNfQD9OB9B3YozxNWgBcQNj402D2ygBtxFwL2BQkmwvEXr5WywLtj2PgNWEPiHUkg8E
	 PMHPG1ejZAQ8Y2vvZHK0O1AjGUlxMBXXQap5CTnb4n6w69I9Qo2Hy09O2loPbSH8iuVD7JCGl8J+
	 Q+i+FHFwQtZ5/n6e80PiBD5HiGlfbc/5NprkIyAWEIxcFfnqQg6T7VvCTHLRyrCpKDqO4taUO2e9
	 lTC1Yy/8BtdRNUgVmNby+8YicapVMzQfEbQIlEXUy8QXQ02M+NK1qVHO2YIrdql9VgRZpvvYH0Xv
	 N1Y0fLXbJeXeo+VsvpzVhxagmbiWDcNkd8OJNRJkfwomuu907OYuBp4hgPxle3rdq9fQL+Nawi2K
	 d4EH5p40z8QcFG7Uscm4d+37TC6HEMYydBDdTBVnzYgmVquEjn+mA3CHN9qcsTVnaNW7/TxWzBOB
	 vKdzRJdYdHxjRALI1vqh8BZ5M9gNgryrZhCvb1JAd5HMuJQDcfq2GPRefFj9W/jGozZKKmhQ3fnK
	 d1RnOXHIPSjybY6oEDg5WZ+CI2cgPM3vnK22HCzTztz56BOpN8KlOHQzod8BU17yZL3CRYPushfO
	 bUWWiSN6f0qgTK6ed7h6Pf5uQUVjEgiKE5Ydc0D/0Nsi31YB9W35FDnCfDNhzk0uaAsAp5AjjMjT
	 E7dqXI6A99Z1pE+R1oIhkNYpM6yecJFFb2MqCjpOMWf8rxsQYtavBgBxIVS30ehCNdHHWUOaPzKR
	 rFcIsA4SuRE4TfO81scuNT1BQ1AfkV+AFAYpOJdhCGySY3IMJfX2N6PqIe9+hENEH7YQmJbCv+tX
	 emS6zmATNCa11BrUKnxAyrioK/t43o4vIrOul2laF81CEOgR14gkKf8Nx5O5NvASwUPNu2QS+wgq
	 tEDnKUQw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: fujunjie <fujunjie1@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Baoquan He <bhe@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: [RFC PATCH 0/5] mm: support zswap-backed anonymous large folio swapin
Date: Fri,  8 May 2026 20:18:29 +0000
X-OQ-MSGID: <20260508201829.1833793-1-fujunjie1@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This RFC explores anonymous large folio swapin when a contiguous swap
range is backed consistently by zswap.

Large folio swapout to zswap is already supported by storing each base
page in the folio as a separate zswap entry. The anonymous synchronous
swapin path has remained order-0 once zswap has ever been enabled:
zswap_load() rejected large folios, and alloc_swap_folio() avoided large
folio allocation to protect against mixed backend ranges.

This RFC keeps the scope intentionally conservative. It does not try to
read one large folio from mixed zswap and disk backends, and it does not
change shmem swapin. Shmem still has its existing zswap fallback and is
left for later discussion. For anonymous swapin, the backend rule is made
explicit:

- a range fully absent from zswap can keep using the disk backend
- a range fully present in zswap can be decompressed into a large folio
- a mixed zswap/non-zswap range falls back to order-0 swapin

The series adds a zswap range query helper, teaches zswap_load() to
decompress all-zswap large folios one base page at a time, accounts mTHP
swpin for zswap-loaded large folios, retries synchronous large-folio
insertion races with order-0 swapin, and removes the anonymous
zswap-never-enabled restriction once mixed ranges are filtered.

I tested the series with a full bzImage build using CONFIG_ZSWAP=y,
CONFIG_ZRAM=y, CONFIG_MEMCG=y and CONFIG_THP_SWAP=y.

The QEMU/KVM runs covered both the fully-zswap path and the mixed-backend
fallback path. In the all-zswap run, a 512MiB anonymous mapping was faulted
as 8192 64KiB groups, reclaimed into zswap, and faulted back. Reclaim
reported mthp64_zswpout=8192 and zswpout=131072. Refault then reported
mthp64_swpin=8192 and zswpin=131072, and pagemap/kpageflags showed 8192
order-4 THP groups in the mapping.

In the mixed-backend run, the workload used a 64MiB anonymous mapping
split into 1024 64KiB groups. After shrinker debugfs wrote back exactly
one zswap base-page entry, refault left 1023 order-4 THP groups and one
order-0 mixed group. The kernel stats matched that shape:
mthp64_swpin=1023, zswpin=16383 and zswpwb=1.

CONFIG_SHRINKER_DEBUG is only a test aid for making that one zswap
writeback deterministic; it is not required by the implementation.

Nhat Pham's active Virtual Swap Space series is adjacent work. It moves
swap cache and zswap entry state into a virtual swap descriptor, and lists
mixed backing THP swapin as a future use case. This RFC is independent and
works with the current swap/zswap infrastructure, but may need rebasing if
VSS lands first.

Feedback would be especially helpful on:

1. whether it makes sense to support all-zswap large folio swapin first,
   while keeping mixed zswap/disk ranges on the order-0 fallback path
2. whether a follow-up for mixed zswap/disk large folio swapin would be
   useful after this RFC

Thanks.

---

fujunjie (5):
  mm: zswap: decompress into a folio subpage
  mm: zswap: add a zswap entry batch helper
  mm: zswap: load fully stored large folios
  mm: swap: fall back to order-0 after large swapin races
  mm: swap: allow zswap-backed large folio swapin

 Documentation/admin-guide/mm/transhuge.rst |   4 +-
 include/linux/zswap.h                      |   9 ++
 mm/memory.c                                |  67 ++++++++-----
 mm/swap_state.c                            |  23 +++--
 mm/zswap.c                                 | 111 ++++++++++++++++-----
 5 files changed, 154 insertions(+), 60 deletions(-)


base-commit: 917719c412c48687d4a176965d1fa35320ec457c
-- 
2.34.1

