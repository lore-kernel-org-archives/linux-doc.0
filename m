Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264BF23D7D8
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537854; cv=none; b=hdsZ/zGTwBzmz7THeS/iV9TIg6vLjWpjOKgPCVtynHepF139gg7S+3E9664pNOzxxXfRiICjffyhgce9b0LulOxsdA7SfLUdWh/btWwri99kLlvG434R+UE3OlWf7Z8A4cp5Gf2qFz2T6V+C6YmKA+UVYIRxzCk6CDxr+Br8+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537854; c=relaxed/simple;
	bh=5cKqMqFoVXJgzuoUMbhn1bUDKikb6EWtrIsRBQEYw8s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=BFQAXphgUvgVUxIuixHW9Z3QZ+FCDle+LJVHnT926FlQGqN7kigxeluggGUNEFOawqKXlWeAtWwH4xe4IIO/7ovhLXuOC8heLb1bD+vMvqwcdw5V7JvG53m9MO2dc7q/aAGlGcDESC56hJT0NItFQb25slSFuO81t5+YYzzcDMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3WYbOLY; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3WYbOLY"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b5515eaefceso5731657a12.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760537851; x=1761142651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oj+ydMXRn5MLbgkqPocjemDIu7tpHUxcEZr4FaQqDcI=;
        b=G3WYbOLYLPSzDSIz1IGjkEEYQib1MFNBI7u9QI+4wS7HA6A3XApuwRGM4I8dY6i4TK
         m1ggfoW6ahqZm39GAyEOJF8nvr/6WBe7hX2AdNJJ5CGYGiQF0I+z3A97r5i1gJkaIyVv
         ThxSfRTPQE3NmAV/AIIynY8s/wvywZapsMgSZZCW8+FcHud2MnsJvhuWSMfx9Ts+o0nz
         4tYnIDQD1W+ZPj1qy2ozYklB8SsYkVHe/x197cd6QsYS2PCxf819B9XPJg+4lwffsArb
         C01DjLfxSG/sAL30Cc0rHxjCsyEHiV0LapCzM7bWcJWTTGRztOzQmOZ0rLbU2ABe+lhA
         oDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537851; x=1761142651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oj+ydMXRn5MLbgkqPocjemDIu7tpHUxcEZr4FaQqDcI=;
        b=WPpG0Apw+hV2CZS3iQ05HAxdH64El/uG4bPyWyJkR4CbH2712AR1ZMBhMsHVTb82a+
         nIz6tUQbBzp+tCN4vvFthLNQagSzseaO4C6kx5riBDPiIYO3vKDGg3bM3vvBSCMqIboL
         GWF2vOTHUCegOoZIHj4nUZFvSeA/JxixG+Iugh1LDbD51/18ZbEcrhtIeOwMBHW+TGT8
         lWZ2sl4RUum+tFTsgJTXZLfRqM4lh8hVO/sZfgordRyrXoSeZFvOR2EbSUtIZ6+IKPU0
         kk24GsBco6dPKz9ePweh4nvr77+pMPVZRlzy2b8q/tUivH3dUIT0TiTKrlFP2C1Pdlbo
         JALA==
X-Forwarded-Encrypted: i=1; AJvYcCWKfQaAadBoC/meXiwL9iswAbIxq1AC6hRsHLxERlumKP91iLWRMBiZKxtXdHCJVR1NB09KdwCV2zA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3DXqJ+3QGP0wa89DbZv24PTm8lhAdKe/t+uEtGqdUwD/ZIu/s
	TtIAHGf2sjHxP4oDtYNvPFK5PlHridVLyMTULkFURzGp2azxz9VoI/lB
X-Gm-Gg: ASbGncuPzxZidxRLNqNDjx/bR1ZAXL/OeYmKEPgnK7oTkLhtCuD6teXmJRY2WSF5qIG
	ZCBsco8huNuP8QTdDtco0kF17bTy7wUma2ATT0zGvTH6wm4gRNsTq6PyPoOv8vQ1A4JPQhkdPbt
	RiMwHMsCS+WC1V09Y+dK8GJKQp4Y3gyHIH1UzOBCRGZfgOzeZFBDKic7XVtDzni/yzLVO435c9V
	GrBZtCAncJNPC5V5xrYKAkTsfCufcEJGbIPpxx21XD3Fyb3o/jmt/u5H76VLR2i6/opIaEoFVdO
	rBoddg0ZufqgZ7zjcPWfl1nw5slF3GzV2Z4nd/5FFy4A81CnEiXGG+Eftf9H5s6Ip/EEs/JzuwL
	cS4KZgjWWKwBEeBg4mSn8+yL3IydS9w/TzDwtFVJWPybvblgHgXwRo6eEy0xUUkqtk/1AGYxwvK
	k+o/6cThJIllgvUM6o
X-Google-Smtp-Source: AGHT+IGuJx98l40hIZg5dUMNPdMQulw8HXVOdNxJ7NPVkMrPiNcWb89bHsacFna+VcftnBNkDQpvBw==
X-Received: by 2002:a17:903:4b08:b0:27e:f005:7d0f with SMTP id d9443c01a7336-290273ffc50mr333828565ad.44.1760537850713;
        Wed, 15 Oct 2025 07:17:30 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1b80:80c6:cd21:3ff9:2bca:36d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f32d6fsm199561445ad.96.2025.10.15.07.17.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Oct 2025 07:17:29 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
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
Subject: [RFC PATCH v10 mm-new 0/9] mm, bpf: BPF-MM, BPF-THP 
Date: Wed, 15 Oct 2025 22:17:07 +0800
Message-Id: <20251015141716.887-1-laoar.shao@gmail.com>
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

        unsigned long
        bpf_hook_thp_get_orders(struct vm_area_struct *vma, enum tva_type type,
                                unsigned long orders);

        https://lore.kernel.org/linux-mm/20250930055826.9810-1-laoar.shao@gmail.com/

v9->RFC v10: Scope BPF-THP to individual processes


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

Any feedback is welcomed.

Future Work
===========

Introduce a global fallback mechanism to address shared resource management
limitations in process and cgroup-based methods:

  https://lore.kernel.org/linux-mm/YwNold0GMOappUxc@slm.duckdns.org/

Yafang Shao (9):
  mm: thp: remove vm_flags parameter from khugepaged_enter_vma()
  mm: thp: remove vm_flags parameter from thp_vma_allowable_order()
  mm: thp: add support for BPF based THP order selection
  mm: thp: decouple THP allocation between swap and page fault paths
  mm: thp: enable THP allocation exclusively through khugepaged
  bpf: mark mm->owner as __safe_rcu_or_null
  bpf: mark vma->vm_mm as __safe_trusted_or_null
  selftests/bpf: add a simple BPF based THP policy
  Documentation: add BPF-based THP policy management

 Documentation/admin-guide/mm/transhuge.rst    |  39 +++
 MAINTAINERS                                   |   3 +
 fs/exec.c                                     |   1 +
 fs/proc/task_mmu.c                            |   3 +-
 include/linux/huge_mm.h                       |  59 +++-
 include/linux/khugepaged.h                    |  10 +-
 include/linux/mm_types.h                      |  18 ++
 kernel/bpf/verifier.c                         |   8 +
 kernel/fork.c                                 |   1 +
 mm/Kconfig                                    |  22 ++
 mm/Makefile                                   |   1 +
 mm/huge_memory.c                              |   7 +-
 mm/huge_memory_bpf.c                          | 306 ++++++++++++++++++
 mm/khugepaged.c                               |  35 +-
 mm/madvise.c                                  |   7 +
 mm/memory.c                                   |  22 +-
 mm/mmap.c                                     |   1 +
 mm/shmem.c                                    |   2 +-
 mm/vma.c                                      |   6 +-
 tools/testing/selftests/bpf/config            |   3 +
 .../selftests/bpf/prog_tests/thp_adjust.c     | 245 ++++++++++++++
 tools/testing/selftests/bpf/progs/lsm.c       |   8 +-
 .../selftests/bpf/progs/test_thp_adjust.c     |  23 ++
 23 files changed, 777 insertions(+), 53 deletions(-)
 create mode 100644 mm/huge_memory_bpf.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/thp_adjust.c
 create mode 100644 tools/testing/selftests/bpf/progs/test_thp_adjust.c

-- 
2.47.3

