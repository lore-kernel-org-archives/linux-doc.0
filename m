Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FB1DDC2B
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 03:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760929885; cv=none; b=LxOSn5cfv3y3kpmGf9XzskE9lBX0896d6AFj1Dzvh4iFbisLZen0eZK9RDzMhOJn5/X2on7vRps2fck2web1TrQIY9Ri5Vo7AgPCIOim/n+Ca3JnL6Vil9rkDbam3F6ob50Jyhg5dwqoqyHpJidZucBrju1aMShFkzFlGjDpHCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760929885; c=relaxed/simple;
	bh=KfcRejFb7m0E8fy4A4R9x78dVth0yg1arfbLJHPiFOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JXDzm8sn/A9Oiux/ijCN/3yQGrUAhxIhsZ0F3OOA0AamGzrZeY0gOshE+W6MupjEKX+LlemWiuEloOxZk3mwMb1jaYZfvYwYYLXAZCzX9zHSzHG9drYiJ+yOcXbXhf5f5qsx4gLtWtNxCQRWJe0gppjTdxqSC5PBhNDjQ95sPhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsaxlpeF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsaxlpeF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2698d47e776so28826615ad.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 20:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760929884; x=1761534684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xCr9rmj82Cu8SetbEs3MjC8j0VxQVzvBm9b5LJ96KeU=;
        b=PsaxlpeFnezJE+cuo5zlTgd7ZlNMwNRagZ+ykGBC4OeFHvvkal552kaBxtFdHdYmyq
         Aj73GTi+9voDG6TnqLAEk9kksMLIBy7iSF/XD2NOOgnEiCoCYunoh/YmHCsVfrkN1nFQ
         92kEgMyONTNrmDP/rdxopqtH+WSIOP6oecx3xSbZq5dSecfbwlHvuotZYuedk2ulqp9a
         yvygsNSYOqDODdBQkGHTa4jY/mmMYR4rmOXpVc3XDVbu+uf6xOqC+S3K3d4QoZMUlB5u
         aUBpQ/EA/fJTsDK/+BO4v23G9Nn8Yj15MZmJqts/R92qSCK8Tw3NLVKRHTtJXNIrcRnZ
         vU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760929884; x=1761534684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCr9rmj82Cu8SetbEs3MjC8j0VxQVzvBm9b5LJ96KeU=;
        b=h1E+B2UswvIwcELUxhjcp0VedERlz8ZK9Ttio7p8zvOf9i7ekOmuN8pp/K/VpT97ke
         Sj9uUBIJ3SKbTb2l50BFZFNPfiLKczPVeol5tNZHyqaWav+09CmI0i5qgVwaNqtTb9RW
         9N/tOUqb3RPKxV6UM95BSZHwaB+ouFu2jANbaDh5+Ci1BjwRPCh6vYqpujAN4A0znRCO
         v8c1gTYJWs+QMVihFjnmKW0vJ6hZsZKHeUzSFBtfpWfW+U5nwzbPz08zdBdsinQcLcl7
         +RXhgc9VJLj4y1Kf759zVxHxMuFAQl4TS89w269InA0rqTRG1FkrV9WB/rL4Sn21S/df
         ax1A==
X-Forwarded-Encrypted: i=1; AJvYcCU6XRGFf6qs3L7xd8JZRCqn2Ki5mnrLj651t2XrWYS3kHjw8ZeIWuBCpkRh5uWn64zTq5oTXsJaMYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK7r0Z1K0+c0kqf01YQdVrRWzcwO+S28D+uGqH91I+VVxSiz4q
	/lRCf+12uezaWs1y30Itk3YoCe0H3NAtNUzOhJ97MbPvRoRC3IYfBq8f
X-Gm-Gg: ASbGnctAUbhSZzWYISOqfVBJQYPCFjxHYoBijIXdfYh9dBF+Oq1E9HLqNNheglnYlBO
	I46X+arKMaWDGEvw6ra/C8iUKs6wDM/+0AfSVx4Yuq4TyIknsq0ysdF6kwjLau3Wi85z/pSvpzv
	VBPO17WefQucBE7zQfrLTXk+N3yJyTaspHzIwz14hUNnAy9SlQ1pOUnF2Fv6EsSTWoNEuliINe2
	opLaUYRjQyC9H3ZRM5Lb8N1X2iH9f3uxxM0odRKHMisGqJkUxjZEVq9eD8RufNVe3Y04hl7R659
	vlYrBXEo4EUAHWA906sGhGvQu9gz4M2SVskhOsTM4kNeKKxVFXx+uQJcKAtYa9+z1I+RAYuA8y9
	z+KKFbi3gOcQ/BpnkFV0IKHjZeu++c5+W2k3gMJcTf4DXHgezZ9AM1XEQfqmGpzfoJ/wXqsu8I3
	L6XMOqT0gA9GHUcgPKrBrAD4w7LpIjiM68RVAfzld4rWTQszGvtXM=
X-Google-Smtp-Source: AGHT+IHHl05n3TLFtJj32my6sFzllN0uFcX2pILWiDZXhCfi29R2Qu7xexBOSzpQjSrdAjNQLV1WvA==
X-Received: by 2002:a17:903:1250:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-290dd1f3fc8mr82869055ad.51.1760929883552;
        Sun, 19 Oct 2025 20:11:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1da1:a41d:2120:6ebb:ce22:6a12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5794sm66007245ad.53.2025.10.19.20.11.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 20:11:22 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	david@redhat.com,
	ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ameryhung@gmail.com,
	rientjes@google.com,
	corbet@lwn.net,
	21cnbao@gmail.com,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	lance.yang@linux.dev,
	rdunlap@infradead.org
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v11 mm-new 00/10] mm, bpf: BPF-MM, BPF-THP
Date: Mon, 20 Oct 2025 11:10:50 +0800
Message-Id: <20251020031100.49917-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

History
=======

RFC v1: fmod_ret based BPF-THP hook
        https://lore.kernel.org/linux-mm/20250429024139.34365-1-laoar.shao@gmail.com/

RFC v2: struct_ops based BPF-THP hook
        https://lore.kernel.org/linux-mm/20250520060504.20251-1-laoar.shao@gmail.com/

RFC v4: Get THP order with interface get_suggested_order()
        https://lore.kernel.org/linux-mm/20250729091807.84310-1-laoar.shao@gmail.com/

v4->v9: Simplify the interface to:

        int thp_get_order(struct vm_area_struct *vma, enum tva_type type,
                          unsigned long orders);

        https://lore.kernel.org/linux-mm/20250930055826.9810-1-laoar.shao@gmail.com/

v9->RFC v10: Scope BPF-THP to individual processes

RFC v10->v11: Remove the RFC tag

The Design
==========

Scoping BPF-THP to cgroup is rejected
-------------------------------------

As explained by Gutierrez:

1. It breaks the cgroup hierarchy when 2 siblings have different THP policies
2. Cgroup was designed for resource management not for grouping processes and
   tune those processes
3. We set a precedent for other people adding new flags to cgroup and
   potentially polluting cgroups. We may end up with cgroups having tens of
   different flags, making sysadmin's job more complex

The related links are:

  https://lore.kernel.org/linux-mm/1940d681-94a6-48fb-b889-cd8f0b91b330@huawei-partners.com/
  https://lore.kernel.org/linux-mm/20241030150851.GB706616@cmpxchg.org/

So we has to scope it to process.

Scoping BPF-THP to process
--------------------------

To eliminate potential conflicts among competing BPF-THP instances, we
enforce that each process is exclusively managed by a single BPF-THP. This
approach has received agreement from David. For context, see:

  https://lore.kernel.org/linux-mm/3577f7fd-429a-49c5-973b-38174a67be15@redhat.com/

When registering a BPF-THP, we specify the PID of a target task. The
BPF-THP is then installed in the task's `mm_struct`

  struct mm_struct {
      struct bpf_thp_ops __rcu *thp_thp;
  };

Inheritance Behavior:

- Existing child processes are unaffected
- Newly forked children inherit the BPF-THP from their parent
- The BPF-THP persists across execve() calls

A new linked list tracks all tasks managed by each BPF-THP instance:

- Newly managed tasks are added to the list
- Exiting tasks are automatically removed from the list
- During BPF-THP unregistration (e.g., when the BPF link is removed), all
  managed tasks have their bpf_thp pointer set to NULL
- BPF-THP instances can be dynamically updated, with all tracked tasks
  automatically migrating to the new version.

This design simplifies BPF-THP management in production environments by
providing clear lifecycle management and preventing conflicts between
multiple BPF-THP instances.

Global Mode
-----------

The per-process BPF-THP mode is unsuitable for managing shared resources
such as shmem THP and file-backed THP. This aligns with known cgroup
limitations for similar scenarios:

  https://lore.kernel.org/linux-mm/YwNold0GMOappUxc@slm.duckdns.org/ 

Introduce a global BPF-THP mode to address this gap. When registered:
- All existing per-process instances are disabled
- New per-process registrations are blocked
- Existing per-process instances remain registered (no forced unregistration)

The global mode takes precedence over per-process instances. Updates are
type-isolated: global instances can only be updated by new global
instances, and per-process instances by new per-process instances.

Yafang Shao (10):
  mm: thp: remove vm_flags parameter from khugepaged_enter_vma()
  mm: thp: remove vm_flags parameter from thp_vma_allowable_order()
  mm: thp: add support for BPF based THP order selection
  mm: thp: decouple THP allocation between swap and page fault paths
  mm: thp: enable THP allocation exclusively through khugepaged
  mm: bpf-thp: add support for global mode
  Documentation: add BPF THP
  selftests/bpf: add a simple BPF based THP policy
  selftests/bpf: add test case to update THP policy
  selftests/bpf: add test case for BPF-THP inheritance across fork

 Documentation/admin-guide/mm/transhuge.rst    | 113 +++++
 MAINTAINERS                                   |   3 +
 fs/exec.c                                     |   1 +
 fs/proc/task_mmu.c                            |   3 +-
 include/linux/huge_mm.h                       |  59 ++-
 include/linux/khugepaged.h                    |  10 +-
 include/linux/mm_types.h                      |  17 +
 kernel/fork.c                                 |   1 +
 mm/Kconfig                                    |  22 +
 mm/Makefile                                   |   1 +
 mm/huge_memory.c                              |   7 +-
 mm/huge_memory_bpf.c                          | 419 ++++++++++++++++++
 mm/khugepaged.c                               |  35 +-
 mm/madvise.c                                  |   7 +
 mm/memory.c                                   |  22 +-
 mm/mmap.c                                     |   1 +
 mm/shmem.c                                    |   2 +-
 mm/vma.c                                      |   6 +-
 tools/testing/selftests/bpf/config            |   3 +
 .../selftests/bpf/prog_tests/thp_adjust.c     | 357 +++++++++++++++
 .../selftests/bpf/progs/test_thp_adjust.c     |  53 +++
 21 files changed, 1092 insertions(+), 50 deletions(-)
 create mode 100644 mm/huge_memory_bpf.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/thp_adjust.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_thp_adjust.c

-- 
2.47.3

