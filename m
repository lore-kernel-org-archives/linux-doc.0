Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF7C2F60A7
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 23:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773875549; cv=pass; b=Syv/jpEaW/4rc5gzheCC/gPdj0Deue8qLub87FuskUdunjKjEDEYy2KUKYw9S/LfmT8K3+q6GztSIRk8mvQBBy0cmym8NbG4U4w1/a5s/+E28ap1eeiBh7tpCQM23iLSDUw5Jo9b0vN1dOceWh5VLy6w6zYvGCRhv1px2m0VjM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773875549; c=relaxed/simple;
	bh=uJGBe8XFPVCDFc8zym9ewMOeq6lHfcpqgZp834IlRt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5qwQuOxi+H6l2BgoX/xt3GQDzkxBUUHWW5Ss8FOlae27dmG2hhSBRFvLgHSN+kHhOmdLBexnyhFVNmjQiCLwOF8/b4xyXWArunkDVFcwIwaYcIGLdRjLQWVx8cZtiDdYEL+Qm1yPfGsms/5Dnm8TJAKATAZnVO+32WIPZn1is8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7+3YBp8; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7+3YBp8"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so198891fa.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 16:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773875545; cv=none;
        d=google.com; s=arc-20240605;
        b=ZR7V60v4kXOS+Hga3L39sVnD3huYxbVyXDpTC6W8QexRrvnMZng+6eJ9BJbOBvSceY
         jSbYxpl79uNe4fP/Kc3xGThx9ENzE/7Jw/hQFywhB9Mxp2TjNcnwrLMxpAvFsxIctvLD
         kRItK22nDEgYeI0OWVXcrjOHlbb35ji9pEQjSm0jQIao6rHJH4CqbWD8XTvJ+9W70Q9w
         PYycxDwU/qbVdxL6gSIZy0AAf5Xbe8dNtUGswWLBYMGpjQG4VRzpoXpoUIKTtX4V1gUA
         8drMNc0MRGsZa8bx+XMsm4UYDb6AeNK6w3kEZUap15QbY4s+e+foEU1xeYwmL8zgBj0n
         8byw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BX2iHwtPTib43JUHo2OtCHlhT2FiqspzClwmirSToVw=;
        fh=PPOFrGDD2gCDItbr7la0uPKeyRBfosIqK2ffjZCH7Do=;
        b=WE893OUkt6/1hWZ1SaB/S4QIKaxjIxm4SsXHYxFbVripix/1yRJGxGDWavjImrixE/
         slSaFniqehp1JC70LJ0kgu1PZkL0ildYY/tqIoM9outaVA7Sw/CzLiIfBgJOwHdoxlsj
         y1l/5zty9GkpdW2cjtP+YovHgf2UVpUDZTt2As4F22ud13ZiLRQXCwpIalrZZnNVdX7U
         mDH1t9B7Azvupr5y972+1/cl1pUmK9CPS+cViC+/MqgfwuVIElwZC15E/gNVHwNbVqmd
         kGm3cXgliGFO1W2VGjnwWm8b4elBPgbmkV6kHlrHfPC49dtK8jLOLg7s8intczpprjj/
         3kKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773875545; x=1774480345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BX2iHwtPTib43JUHo2OtCHlhT2FiqspzClwmirSToVw=;
        b=V7+3YBp8TX2aqyyNe/E1Hlo6TXeX/jWGsX0ru20MHaicEENXYZXR3JEKcCaIjkoW4L
         shvnYtnd02oOqgmrGXd31L2CQQiKkV2n/esnR8pVunk1KiO2g/oOQ9Oab1VmU891DbpF
         yS+JJsFa5lUZumcmtR6kuntwJtXeE3ZXatURJMThCcpV09Wodbk1FdqYTx+HamX9Ns8k
         1wrRW9G1sqzwNDGhcnF0wFuuiHqYgxu6ZuZN1dXmhI5YaSy4RQ2147FbsH5iuX66QGqp
         p60dtRkrIc48UmxJHUM+JVTa9V48Ac7rPTlAlwYZj7uxaj3/KnucXjCeiBvoeSYFytcp
         V7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773875545; x=1774480345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BX2iHwtPTib43JUHo2OtCHlhT2FiqspzClwmirSToVw=;
        b=BAQj2XoGQxuWMq41qljNM/1QlL+HQysPkTdURHjmNsq7V7B4YYt/YD9iebYhjo3Blz
         SDO0w7Y2Hm5JspR9+9wkf5eKXASHvyw83wy4VFFDOPf6EWk5lY4kcfU7HtBBJ5YUC0f9
         RslJVlvIcFgCk/ojXgWSr4qwMJ20CSgpHsetgk4KD3FqhWXl9Ms3SypOHa6DeAr/Kqze
         mo1gsf4MpmLEc7NWn5EQIwHTBNG2Ao6BCuV7jn6a7MWt8/Ao6bfJG1lxd1XRO7en6Fld
         uMKHipvvBJEb6Q+oIqO0g/8CX6jU+i3ugLHD8UJ2mEEGxioc4IsSKoc3lXic3zcmbwjp
         SKjA==
X-Forwarded-Encrypted: i=1; AJvYcCVc4gDcIxP7EKpFmbdgFk1yuDRPyAHbK7qEAH/sH9JPa5aJO873ne2HBea6PM1U4cWwwe9pwgJ+iWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHh1ecX7zji2bIkvidUIhyC4hC/0wcrDUXmcJUlZfXmcoN9Zh1
	fyQTz5l8XAwsY+XKMt7afNJ+aL8fJMg5LpCZ9QBqfIrPp1fzRyakS03IvtJ4UE8Z8JtIjM7YqCV
	SzITropD/60TK+fMTqxtJfXx891l9Ckk=
X-Gm-Gg: ATEYQzzh8tRLKldqaEp8x613I4nyGwx44TJfZaTcGm3J9HT6JZ1k21WWSY5+lN2cZnH
	yofAaz4hB/J+sC0LXuf++Ie3Om65axpA3haXisq99aIl6PWPAioAuCapH/vXjLG+otlxIPP971S
	YB+tlem6VyMGp0AJnL1X0JJdDebUq66EJapVJFP4NrlLy23l+eyphQ5o+kGMmDrMXGIKgB434cP
	ZVa+itVYtXyCOr31wLa/Rqx+VR81kX5cEWqkcbSfN3Tbyvcjh/E1gxtiEkURuQjXc3msecpmoI1
	wKAiTVJZgE9llFf98kdw2ffRG4++qzaeTjet2UfdD0qlXxyo+UOgifBTOM2K9ipWjQ==
X-Received: by 2002:a2e:9bd8:0:b0:38a:4de2:85d7 with SMTP id
 38308e7fff4ca-38bd57813f6mr16258931fa.3.1773875544905; Wed, 18 Mar 2026
 16:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318222953.441758-1-nphamcs@gmail.com>
In-Reply-To: <20260318222953.441758-1-nphamcs@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 18 Mar 2026 16:12:13 -0700
X-Gm-Features: AaiRm52Vh6KL3hLud6f_VY3t_swyNqO1ijXNToeNb-CGlcr3QBKt9nfVJNa08qE
Message-ID: <CAKEwX=MV9axc+2V2y65hZ6s2tHc4_mU_aJ-94FQpmU3XZ9AnFA@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] Virtual Swap Space
To: kasong@tencent.com
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, lance.yang@linux.dev, 
	lenb@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	matthew.brost@intel.com, mhocko@suse.com, muchun.song@linux.dev, 
	npache@redhat.com, pavel@kernel.org, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, rafael@kernel.org, rakie.kim@sk.com, 
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com, 
	shakeel.butt@linux.dev, shikemeng@huaweicloud.com, surenb@google.com, 
	tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, kernel-team@meta.com, 
	riel@surriel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 3:29=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>

[...]

Argh I copied my draft cover letter over the diffstat. My apologies -
here's the rest of the cover letter. Base commit is
05f7e89ab9731565d8a62e3b5d1ec206485eeb0b for your convenience (it's at
the bottom too - this should be 6.19).

Nhat Pham (21):
  mm/swap: decouple swap cache from physical swap infrastructure
  swap: rearrange the swap header file
  mm: swap: add an abstract API for locking out swapoff
  zswap: add new helpers for zswap entry operations
  mm/swap: add a new function to check if a swap entry is in swap
    cached.
  mm: swap: add a separate type for physical swap slots
  mm: create scaffolds for the new virtual swap implementation
  zswap: prepare zswap for swap virtualization
  mm: swap: allocate a virtual swap slot for each swapped out page
  swap: move swap cache to virtual swap descriptor
  zswap: move zswap entry management to the virtual swap descriptor
  swap: implement the swap_cgroup API using virtual swap
  swap: manage swap entry lifecycle at the virtual swap layer
  mm: swap: decouple virtual swap slot from backing store
  zswap: do not start zswap shrinker if there is no physical swap slots
  swap: do not unnecesarily pin readahead swap entries
  swapfile: remove zeromap bitmap
  memcg: swap: only charge physical swap slots
  swap: simplify swapoff using virtual swap
  swapfile: replace the swap map with bitmaps
  vswap: batch contiguous vswap free calls

 Documentation/mm/swap-table.rst |   69 --
 MAINTAINERS                     |    3 +-
 include/linux/cpuhotplug.h      |    1 +
 include/linux/memcontrol.h      |    6 +
 include/linux/mm_types.h        |   16 +
 include/linux/shmem_fs.h        |    7 +-
 include/linux/swap.h            |  185 ++-
 include/linux/swap_cgroup.h     |   13 -
 include/linux/swapops.h         |   25 +
 include/linux/zswap.h           |   17 +-
 kernel/power/swap.c             |    6 +-
 mm/Makefile                     |    5 +-
 mm/filemap.c                    |   14 +-
 mm/huge_memory.c                |   11 +-
 mm/internal.h                   |   24 +-
 mm/madvise.c                    |    2 +-
 mm/memcontrol-v1.c              |    6 +
 mm/memcontrol.c                 |  144 ++-
 mm/memory.c                     |  109 +-
 mm/migrate.c                    |   13 +-
 mm/mincore.c                    |   15 +-
 mm/page_io.c                    |   83 +-
 mm/shmem.c                      |  227 +---
 mm/swap.h                       |  179 +--
 mm/swap_cgroup.c                |  172 ---
 mm/swap_state.c                 |  306 +----
 mm/swap_table.h                 |   78 +-
 mm/swapfile.c                   | 1517 ++++-------------------
 mm/userfaultfd.c                |   18 +-
 mm/vmscan.c                     |   28 +-
 mm/vswap.c                      | 2008 +++++++++++++++++++++++++++++++
 mm/zswap.c                      |  142 +--
 32 files changed, 2942 insertions(+), 2507 deletions(-)
 delete mode 100644 Documentation/mm/swap-table.rst
 delete mode 100644 mm/swap_cgroup.c
 create mode 100644 mm/vswap.c


base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b

--
2.52.0
