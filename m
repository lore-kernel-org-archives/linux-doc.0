Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3FC1DF99C
	for <linux-doc@vger.kernel.org>; Sun, 14 Sep 2025 02:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757818178; cv=none; b=S6q9/5qQWJ1ePoCgtMTMVZD1N8IRPx/zQTtx2qD0KuuRhPbhYYgvyf0+K1GLbT9EqLTazzBSZVCyPa1LZqHewTnNJMRf8USmH3HJKC1cSwAEl0wCOON0Nsec5Ck7UHxQb/VFaF+yXqbgrrjbZPGqUGIwkYSsLqAqX2XfKenWnMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757818178; c=relaxed/simple;
	bh=/ocrDdQqG9fW+geJ98ijPvowjxtpgo25jcfqXLbwHro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mb4m/q2v8Pw4xZHmWjzT5bG03Ahms5lpKw9j+C324mBMJW7Lm/Cl+cc4/72mk1jujVb+KhT9BmBnlPT7hoz6F+FQhYZxPymgBXmtIlJt2Ki3MQazrQeUVMViAt4NVTUcKRdM1Dkiq+MlV/RQYLClYAx1lN0wKZkWvY/7cRi/Ljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WROa+mqy; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WROa+mqy"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-76b8fd4ba2cso14937586d6.3
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 19:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757818175; x=1758422975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFavhNV1lWZBO2CYtF6B2ruxGVEn2hxFtUjzEBzIPFo=;
        b=WROa+mqyj9AICoHcU0G1X45WVZb25o7+WoFSVkGm16GuzUrMr1RUZefgR9HQ441p3E
         0ulg2ye/cRHbvNcLD8ZnPuVtSlL/8jPnHFwudIS2qJVT8IWsV/arqy4ztGAs3eK/dTN6
         1ZSbpLYkqLLY+pyvfcgM8DsYxGIU58hTGPrnX7lrRiOkoXQejX/eA5dRm0WOcGoIvk0x
         8bwRm3mKfp9KUxUjh6dQV4MR4rh+XRJMWzivF/g5tYmrqtTozMLGqNA8aQXannup/zxO
         nlM9E7R0j2SpAMaoyvdZIXsWWvbxEOWyUfzD6tUhcSrQhXcxda64rYGXyDy9Y04P8qt8
         rLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757818175; x=1758422975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFavhNV1lWZBO2CYtF6B2ruxGVEn2hxFtUjzEBzIPFo=;
        b=JMTqyeRbj+tbnMI1QA5DStfYBDq/GLYbUQO6YYq8RaAuGU2ap5jA4ubdF5aLgkPGrB
         GWR84WToEa1ZfPUPRtDIjIpUI6hXscdDkdaPb4d5AU5hWA4SKchyas/efW3vAQSAkGZc
         gUUbTX+TFgfV0JOFLWp5oURroCrqcE41gVMvtVDZ236D9R7Su7tba6Aa5s2v/ejkOAfG
         0szn7Uhzq9Q19zh73CDiBAxYjTO3/31u3tSpZtrWo9fMhBS6kBu/tLlDINcY/iA8Joc3
         1xyiqF0uX6zxCVnNVZnMlaIsJLA4u17TjnGZfTuILLCH2OVHGfw6QkyhblJK2l0+DnwT
         hsCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ewBO0a3AaZtL8MAAeIMucUDZZkTNmmxzlik8DDvO6qQEzWbLDKLSDAWtjT6l5jmcN1XvsrH1SFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBa5C0ZXZp4pxFFiOpfliUEW+eA6jdatoMqDWml9EsGO/En1SG
	FHbBe0TCROBrVPtenegagisJeB7CHcsRc0R6GmbSL0KpIYQDy+m3eDtXKzmyqKDOhjD1sSZesg6
	+clluGXPOaFqGiVUoCBx/AIfR6E1RWFo=
X-Gm-Gg: ASbGncusbeEhq44kLc8ZforBrvpJzVi43tnnvh0JlcOuvFbeZGjF0ELcWKYUSe6WXLe
	VnQfvf4ZkJWBk8h0qJUYlV/NG9wW/NMXNGScPnn8p6P75FZS9svbVfUa5Hh5KcjrdoczR6RCjnY
	0LErgjlQbMGYMhCNd1whtT0GHc8B3jDH8xRNofkcTLadZyG3qb9PG2Fkvi0XGNdqkpM5YJO4gWI
	Vz1NxP5dDLbcv7jYCqNuPNODP2ceetzqF7WoRmyCj014VnNeJc=
X-Google-Smtp-Source: AGHT+IHu4nD3kgKhcw1xieNm3ZVi/4aJiGK44+ie7MDg9WJVIme29An0JlKCztQhHPTvo3RppfrMwRprZmHweH0qAnU=
X-Received: by 2002:ad4:5aad:0:b0:728:4af1:e4f9 with SMTP id
 6a1803df08f44-767c46cccf4mr121368526d6.47.1757818175268; Sat, 13 Sep 2025
 19:49:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910024447.64788-2-laoar.shao@gmail.com> <202509110109.PSgSHb31-lkp@intel.com>
 <49b70945-7483-4af1-95ba-e128eb9f6d7e@linux.dev> <DF4CA2C0-25AF-462B-A6D2-888DB20E0DFA@nvidia.com>
 <7d4548ce-e381-47fe-8bb3-5ea38a172527@lucifer.local>
In-Reply-To: <7d4548ce-e381-47fe-8bb3-5ea38a172527@lucifer.local>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 14 Sep 2025 10:48:59 +0800
X-Gm-Features: AS18NWCQoXZMjj8Obq1_xmQrE5op8oMXWfkf-LaS63VH7m9IskWXpSuwhtt-rJU
Message-ID: <CALOAHbAK54mrpWYbCzWjMPrrRFOb7-8kAM7Ud7s6tCMyU7fjsg@mail.gmail.com>
Subject: Re: [PATCH v7 mm-new 01/10] mm: thp: remove disabled task from khugepaged_mm_slot
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Zi Yan <ziy@nvidia.com>, Lance Yang <lance.yang@linux.dev>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org, 
	gutierrez.asier@huawei-partners.com, rientjes@google.com, andrii@kernel.org, 
	david@redhat.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ameryhung@gmail.com, ryan.roberts@arm.com, usamaarif642@gmail.com, 
	willy@infradead.org, corbet@lwn.net, npache@redhat.com, dev.jain@arm.com, 
	21cnbao@gmail.com, shakeel.butt@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, hannes@cmpxchg.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 9:47=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Wed, Sep 10, 2025 at 10:28:30PM -0400, Zi Yan wrote:
> > On 10 Sep 2025, at 22:12, Lance Yang wrote:
> >
> > > Hi Yafang,
> > >
> > > On 2025/9/11 01:27, kernel test robot wrote:
> > >> Hi Yafang,
> > >>
> > >> kernel test robot noticed the following build errors:
> > >>
> > >> [auto build test ERROR on akpm-mm/mm-everything]
> > >>
> > >> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/m=
m-thp-remove-disabled-task-from-khugepaged_mm_slot/20250910-144850
> > >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git =
mm-everything
> > >> patch link:    https://lore.kernel.org/r/20250910024447.64788-2-laoa=
r.shao%40gmail.com
> > >> patch subject: [PATCH v7 mm-new 01/10] mm: thp: remove disabled task=
 from khugepaged_mm_slot
> > >> config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/=
20250911/202509110109.PSgSHb31-lkp@intel.com/config)
> > >> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project=
 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > >> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/=
archive/20250911/202509110109.PSgSHb31-lkp@intel.com/reproduce)
> > >>
> > >> If you fix the issue in a separate patch/commit (i.e. not just a new=
 version of
> > >> the same patch/commit), kindly add following tags
> > >> | Reported-by: kernel test robot <lkp@intel.com>
> > >> | Closes: https://lore.kernel.org/oe-kbuild-all/202509110109.PSgSHb3=
1-lkp@intel.com/
> > >>
> > >> All errors (new ones prefixed by >>):
> > >>
> > >>>> kernel/sys.c:2500:6: error: call to undeclared function 'hugepage_=
pmd_enabled'; ISO C99 and later do not support implicit function declaratio=
ns [-Wimplicit-function-declaration]
> > >>      2500 |             hugepage_pmd_enabled())
> > >>           |             ^
> > >>>> kernel/sys.c:2501:3: error: call to undeclared function '__khugepa=
ged_enter'; ISO C99 and later do not support implicit function declarations=
 [-Wimplicit-function-declaration]
> > >>      2501 |                 __khugepaged_enter(mm);
> > >>           |                 ^
> > >>     2 errors generated.
> > >
> > > Oops, seems like hugepage_pmd_enabled() and __khugepaged_enter() are =
only
> > > available when CONFIG_TRANSPARENT_HUGEPAGE is enabled ;)
> > >
> > >>
> > >>
> > >> vim +/hugepage_pmd_enabled +2500 kernel/sys.c
> > >>
> > >>    2471
> > >>    2472    static int prctl_set_thp_disable(bool thp_disable, unsign=
ed long flags,
> > >>    2473                                     unsigned long arg4, unsi=
gned long arg5)
> > >>    2474    {
> > >>    2475            struct mm_struct *mm =3D current->mm;
> > >>    2476
> > >>    2477            if (arg4 || arg5)
> > >>    2478                    return -EINVAL;
> > >>    2479
> > >>    2480            /* Flags are only allowed when disabling. */
> > >>    2481            if ((!thp_disable && flags) || (flags & ~PR_THP_D=
ISABLE_EXCEPT_ADVISED))
> > >>    2482                    return -EINVAL;
> > >>    2483            if (mmap_write_lock_killable(current->mm))
> > >>    2484                    return -EINTR;
> > >>    2485            if (thp_disable) {
> > >>    2486                    if (flags & PR_THP_DISABLE_EXCEPT_ADVISED=
) {
> > >>    2487                            mm_flags_clear(MMF_DISABLE_THP_CO=
MPLETELY, mm);
> > >>    2488                            mm_flags_set(MMF_DISABLE_THP_EXCE=
PT_ADVISED, mm);
> > >>    2489                    } else {
> > >>    2490                            mm_flags_set(MMF_DISABLE_THP_COMP=
LETELY, mm);
> > >>    2491                            mm_flags_clear(MMF_DISABLE_THP_EX=
CEPT_ADVISED, mm);
> > >>    2492                    }
> > >>    2493            } else {
> > >>    2494                    mm_flags_clear(MMF_DISABLE_THP_COMPLETELY=
, mm);
> > >>    2495                    mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADV=
ISED, mm);
> > >>    2496            }
> > >>    2497
> > >>    2498            if (!mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm=
) &&
> > >>    2499                !mm_flags_test(MMF_VM_HUGEPAGE, mm) &&
> > >>> 2500                  hugepage_pmd_enabled())
> > >>> 2501                      __khugepaged_enter(mm);
> > >>    2502            mmap_write_unlock(current->mm);
> > >>    2503            return 0;
> > >>    2504    }
> > >>    2505
> > >
> > > So, let's wrap the new logic in an #ifdef CONFIG_TRANSPARENT_HUGEPAGE=
 block.
> > >
> > > diff --git a/kernel/sys.c b/kernel/sys.c
> > > index a1c1e8007f2d..c8600e017933 100644
> > > --- a/kernel/sys.c
> > > +++ b/kernel/sys.c
> > > @@ -2495,10 +2495,13 @@ static int prctl_set_thp_disable(bool thp_dis=
able, unsigned long flags,
> > >                 mm_flags_clear(MMF_DISABLE_THP_EXCEPT_ADVISED, mm);
> > >         }
> > >
> > > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > >         if (!mm_flags_test(MMF_DISABLE_THP_COMPLETELY, mm) &&
> > >             !mm_flags_test(MMF_VM_HUGEPAGE, mm) &&
> > >             hugepage_pmd_enabled())
> > >                 __khugepaged_enter(mm);
> > > +#endif
> > > +
> > >         mmap_write_unlock(current->mm);
> > >         return 0;
> > >  }
> >
> > Or in the header file,
> >
> > #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > ...
> > #else
> > bool hugepage_pmd_enabled()
> > {
> >       return false;
> > }
> >
> > int __khugepaged_enter(struct mm_struct *mm)
> > {
> >       return 0;
> > }
>
> It seems we have a convention of just not implementing things here if the=
y're
> necessarily used in core code paths (and _with my suggested change_) it's=
 _just_
> khugepaged that's invoking them).
>
> Anyway with my suggestion we can fix this entirely with:
>
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>
> void khugepaged_enter_mm(struct mm_struct *mm);
>
> #else
>
> void khugepaged_enter_mm(struct mm_struct *mm)
> {
> }
>
> #endif

ack

Thanks for all the suggestions.

--=20
Regards
Yafang
