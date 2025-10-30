Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E592FBDF3
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 04:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761799234; cv=none; b=bGmbc5Nm+WWbqFUlGJESxQ4cOc01eVRU3WUXI2cV7sSSiMdWRj6bBMfk4BPUolt8+EvK9WOwnApvNinuX7bae6OZ4VFzy+AXnIRNWkCpUCGaWzYcrGgVAhubAy3P9WfzcvqdxOOMe90B9VzGlz3jS1NRNY/2TrUWVNa/jhixxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761799234; c=relaxed/simple;
	bh=y/Np7fA5qgpmYmsQXNaY/VIJLvPs0XEv4eWAJTcrQ+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eApQcOdwyc376Lrru5c6Gefio0XWp0L3fDOzKf8TxUZCLT/TRIDVdlX+TE1NxycTYeZnZH+NlTg1wvoece/e7MeViKYm2Zu3PFPRpo5HzmfiGDH6pj5GkUNkA61wp2B7EKjkfmEmOa42yIzgbZMoAwparXcCNDX+PzxoNnjvRbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bikLm5pD; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bikLm5pD"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ea12242d2eso133951cf.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 21:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761799231; x=1762404031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQ/blAUtd3RJvFkaQNVmmQwc7XQHf3yHIB6Jvobdagw=;
        b=bikLm5pDK2Ro1WCJJRxxCd5s61D6L7+z0m8SzBwEntjMuDjjaOCL0vI4ljLlAxU5O2
         drpmE78HNpCYMi1J5cSgwaR2c6xLZNsT1wDr4NOnfEHq2ABnhNjESSwsIZbBXeuNBQy1
         NU41iO5JPD/mE1+bT3cZcCaiMuKNu86ywyDix6fAESEhODq142jRas4POI86D2qdOR/J
         q49on8Hugrkfpy98vDZbQVeMbKnioo7jtkYmL4kknsHLH/JLne7vJMSdE4lohSZtJWm4
         Ai7el0c2qIyJc/RgMMweJSYNItjqDtCZik51J1RqX1QkHw78NW6Y9j4/QCR7G2j9lwlf
         0nFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761799231; x=1762404031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQ/blAUtd3RJvFkaQNVmmQwc7XQHf3yHIB6Jvobdagw=;
        b=bWPcZ0f+UV7sNU0lOKWjqqP6ZLQKD0TbpPTjawCxIpIyHBwDXBkCjvMg4l4QRsYWFx
         o7RlqWp/YLhDfrDe7YZbEXg00IwIPpwQoX2KP6cABGV4y5k61IaSxI+nsJKNsFNK+rrf
         uK38x5niB8kOOw/DPbJUgjoM0m3PwjGaJ2H+u5qn4XP3OE0t5MkxvhXuG4of2KlIlCj4
         7FPyTnDTi0DsTGUFKEF17QfjjUc+0Kp0oQbgQ4Zjf3BiTWKB2uF3mSBtRJjmLUXdMIge
         HxtaxCXyTvf+yD3Zay5lB58M2h7jzcxa6UqyzE8oUxNwa5z+63UbByHAiWlJVrArJMZm
         dbfg==
X-Forwarded-Encrypted: i=1; AJvYcCV39yO01wk694KDDbipeg1EtF6qlBVn0RrZxeP4n4MXI92oL7FBMPE4W76J84XmhGEm2zeitaYUMQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6aHrcKtcmu7RDqqqxv651qsnG6hEdeucN9bUlunxT2Jt2V+8z
	nt9QgNh8GzKP54mg3sIxLlfl5N36b4S8zu5LvqM8CASKMkn3F2p07qh2ssNBAuITXwVmuNc1cz8
	zr61j3ShAAXuO9d/nRtbiM4ZcuYXzw5++ZZh6O8eI
X-Gm-Gg: ASbGnctthiJ65k6IRPCa7/hwTHO9lhJWu4xtYzb9NxTE/kFjmRCt6bbcu88JaqpadPP
	h1keSUUB0d0Ww/U791m1Tv3ZFUx9AX/+WDnKHNckz11Ag8iVnPa6C7jF+vgbRihYm5FGGaYAGzk
	n367icD6vZLIr/gWa5Gfw/9phy906YADnPLgQcLzpZRHzJiEy0J4GxcUe4EfIm5uPtGrUPt8Xez
	ksZxicDjlSd1BHuFHzQ+pJ3VQpYV/h7QZw6E89bFhPbIrgwZJeg6FTVfESAswNeO9uVYg==
X-Google-Smtp-Source: AGHT+IHUTVIoMGgym7Rl26g/BilUAT4CgTBJK8bytma8Yytb4fFlVaJbZIP7eL03YRO77BOZ2/iZU2Eddn/9UG3dHtw=
X-Received: by 2002:a05:622a:1790:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-4ed240d674amr2436531cf.7.1761799230462; Wed, 29 Oct 2025
 21:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761756437.git.lorenzo.stoakes@oracle.com> <9e5ef2bedbff6498d7e5122421f0ea5ff02236b7.1761756437.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <9e5ef2bedbff6498d7e5122421f0ea5ff02236b7.1761756437.git.lorenzo.stoakes@oracle.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 29 Oct 2025 21:40:19 -0700
X-Gm-Features: AWmQ_bk_ynX9lneWpHBfJJexvgQjPhSl6AaFwMQbkIx85JwpdO8ydosQokMaIkg
Message-ID: <CAJuCfpGFAv9DizXOzCn1Qi5=NDyHh6XyxpmsQr0K45LS6x4igg@mail.gmail.com>
Subject: Re: [PATCH 3/3] selftests/mm/guard-regions: add smaps visibility test
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Hildenbrand <david@redhat.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Andrei Vagin <avagin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 9:51=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Assert that we observe guard regions appearing in /proc/$pid/smaps as
> expected, and when split/merge is performed too (with expected sticky
> behaviour).
>
> Also add handling for file systems which don't sanely handle mmap() VMA
> merging so we don't incorrectly encounter a test failure in this situatio=
n.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  tools/testing/selftests/mm/guard-regions.c | 120 +++++++++++++++++++++
>  tools/testing/selftests/mm/vm_util.c       |   5 +
>  tools/testing/selftests/mm/vm_util.h       |   1 +
>  3 files changed, 126 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/s=
elftests/mm/guard-regions.c
> index 8dd81c0a4a5a..a9be11e03a6a 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -94,6 +94,7 @@ static void *mmap_(FIXTURE_DATA(guard_regions) * self,
>         case ANON_BACKED:
>                 flags |=3D MAP_PRIVATE | MAP_ANON;
>                 fd =3D -1;
> +               offset =3D 0;
>                 break;
>         case SHMEM_BACKED:
>         case LOCAL_FILE_BACKED:
> @@ -260,6 +261,54 @@ static bool is_buf_eq(char *buf, size_t size, char c=
hr)
>         return true;
>  }
>
> +/*
> + * Some file systems have issues with merging due to changing merge-sens=
itive
> + * parameters in the .mmap callback, and prior to .mmap_prepare being
> + * implemented everywhere this will now result in an unexpected failure =
to
> + * merge (e.g. - overlayfs).
> + *
> + * Perform a simple test to see if the local file system suffers from th=
is, if
> + * it does then we can skip test logic that assumes local file system me=
rging is
> + * sane.
> + */
> +static bool local_fs_has_sane_mmap(FIXTURE_DATA(guard_regions) * self,
> +                                  const FIXTURE_VARIANT(guard_regions) *=
 variant)
> +{
> +       const unsigned long page_size =3D self->page_size;
> +       char *ptr, *ptr2;
> +       struct procmap_fd procmap;
> +
> +       if (variant->backing !=3D LOCAL_FILE_BACKED)
> +               return true;
> +
> +       /* Map 10 pages. */
> +       ptr =3D mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PR=
OT_WRITE, 0, 0);
> +       if (ptr =3D=3D MAP_FAILED)
> +               return false;
> +       /* Unmap the middle. */
> +       munmap(&ptr[5 * page_size], page_size);
> +
> +       /* Map again. */
> +       ptr2 =3D mmap_(self, variant, &ptr[5 * page_size], page_size, PRO=
T_READ | PROT_WRITE,
> +                    MAP_FIXED, 5 * page_size);
> +
> +       if (ptr2 =3D=3D MAP_FAILED)
> +               return false;
> +
> +       /* Now make sure they all merged. */
> +       if (open_self_procmap(&procmap) !=3D 0)
> +               return false;
> +       if (!find_vma_procmap(&procmap, ptr))
> +               return false;
> +       if (procmap.query.vma_start !=3D (unsigned long)ptr)
> +               return false;
> +       if (procmap.query.vma_end !=3D (unsigned long)ptr + 10 * page_siz=
e)
> +               return false;
> +       close_procmap(&procmap);
> +
> +       return true;
> +}
> +
>  FIXTURE_SETUP(guard_regions)
>  {
>         self->page_size =3D (unsigned long)sysconf(_SC_PAGESIZE);
> @@ -2138,4 +2187,75 @@ TEST_F(guard_regions, pagemap_scan)
>         ASSERT_EQ(munmap(ptr, 10 * page_size), 0);
>  }
>
> +TEST_F(guard_regions, smaps)
> +{
> +       const unsigned long page_size =3D self->page_size;
> +       struct procmap_fd procmap;
> +       char *ptr, *ptr2;
> +       int i;
> +
> +       /* Map a region. */
> +       ptr =3D mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PR=
OT_WRITE, 0, 0);
> +       ASSERT_NE(ptr, MAP_FAILED);
> +
> +       /* We shouldn't yet see a guard flag. */
> +       ASSERT_FALSE(check_vmflag_guard(ptr));
> +
> +       /* Install a single guard region. */
> +       ASSERT_EQ(madvise(ptr, page_size, MADV_GUARD_INSTALL), 0);
> +
> +       /* Now we should see a guard flag. */
> +       ASSERT_TRUE(check_vmflag_guard(ptr));
> +
> +       /*
> +        * Removing the guard region should not change things because we =
simply
> +        * cannot accurately track whether a given VMA has had all of its=
 guard
> +        * regions removed.
> +        */
> +       ASSERT_EQ(madvise(ptr, page_size, MADV_GUARD_REMOVE), 0);
> +       ASSERT_TRUE(check_vmflag_guard(ptr));
> +
> +       /* Install guard regions throughout. */
> +       for (i =3D 0; i < 10; i++) {
> +               ASSERT_EQ(madvise(&ptr[i * page_size], page_size, MADV_GU=
ARD_INSTALL), 0);
> +               /* We should always see the guard region flag. */
> +               ASSERT_TRUE(check_vmflag_guard(ptr));
> +       }
> +
> +       /* Split into two VMAs. */
> +       ASSERT_EQ(munmap(&ptr[4 * page_size], page_size), 0);
> +
> +       /* Both VMAs should have the guard flag set. */
> +       ASSERT_TRUE(check_vmflag_guard(ptr));
> +       ASSERT_TRUE(check_vmflag_guard(&ptr[5 * page_size]));
> +
> +       /*
> +        * If the local file system is unable to merge VMAs due to having
> +        * unusual characteristics, there is no point in asserting merge
> +        * behaviour.
> +        */
> +       if (!local_fs_has_sane_mmap(self, variant)) {
> +               TH_LOG("local filesystem does not support sane merging sk=
ipping merge test");
> +               return;
> +       }
> +
> +       /* Map a fresh VMA between the two split VMAs. */
> +       ptr2 =3D mmap_(self, variant, &ptr[4 * page_size], page_size,
> +                    PROT_READ | PROT_WRITE, MAP_FIXED, 4 * page_size);
> +       ASSERT_NE(ptr2, MAP_FAILED);
> +
> +       /*
> +        * Check the procmap to ensure that this VMA merged with the adja=
cent
> +        * two. The guard region flag is 'sticky' so should not preclude
> +        * merging.
> +        */
> +       ASSERT_EQ(open_self_procmap(&procmap), 0);
> +       ASSERT_TRUE(find_vma_procmap(&procmap, ptr));
> +       ASSERT_EQ(procmap.query.vma_start, (unsigned long)ptr);
> +       ASSERT_EQ(procmap.query.vma_end, (unsigned long)ptr + 10 * page_s=
ize);
> +       ASSERT_EQ(close_procmap(&procmap), 0);
> +       /* And, of course, this VMA should have the guard flag set. */
> +       ASSERT_TRUE(check_vmflag_guard(ptr));
> +}
> +
>  TEST_HARNESS_MAIN
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftes=
ts/mm/vm_util.c
> index e33cda301dad..605cb58ea5c3 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -449,6 +449,11 @@ bool check_vmflag_pfnmap(void *addr)
>         return check_vmflag(addr, "pf");
>  }
>
> +bool check_vmflag_guard(void *addr)
> +{
> +       return check_vmflag(addr, "gu");
> +}
> +
>  bool softdirty_supported(void)
>  {
>         char *addr;
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftes=
ts/mm/vm_util.h
> index 26c30fdc0241..a8abdf414d46 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -98,6 +98,7 @@ int uffd_register_with_ioctls(int uffd, void *addr, uin=
t64_t len,
>  unsigned long get_free_hugepages(void);
>  bool check_vmflag_io(void *addr);
>  bool check_vmflag_pfnmap(void *addr);
> +bool check_vmflag_guard(void *addr);
>  int open_procmap(pid_t pid, struct procmap_fd *procmap_out);
>  int query_procmap(struct procmap_fd *procmap);
>  bool find_vma_procmap(struct procmap_fd *procmap, void *address);
> --
> 2.51.0
>
