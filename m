Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6A54648
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 19:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242860; cv=none; b=mmhg7EJimZbhXHYVSeRJRxElNXlFXibnkG+sErS1KJd8JVr0dSpmw+OcGrJYIdO08nHGqtEF6HW/oeBgpOsrUqwryMNCQk/Bm8lT3Xv8BuTupn4+mEiPoJQaeV5BIEK+KjsNTtUp47O7F9NDtvGi1Phyrr5wLmg1oV9CGrkWkTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242860; c=relaxed/simple;
	bh=iP4ywNqXOCYtytn9oIkGEVpZOAa7mRk4lFufdmwyKCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOJbHPGKuJNUkYbGMe+cV4Ns43jtxnqxgkH94McU1NfAzda2W6OqqELuqHFzQBstjM+pgmIDzQtptNnwmQg8vuTgMZyYyt5G+agAbvorT+w3J4HApc0RcLY8jeYG8CrK1PFQ+OuEDTvGe4iXyiRw5dStXr8fNRVxPJiKrUnfOZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M6zO53Xz; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M6zO53Xz"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467abce2ef9so1721011cf.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 11:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735242857; x=1735847657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkiYOSK+SB4neVILkmorb+PxqtegAF2YSxLIiY3S8k8=;
        b=M6zO53XzpFkgWm6XhNOdDZNWG6JQd68KjN+/orPHNxkpCQHfD/OY2iqTP79OTjz2qq
         3ImEhBv3p0tnVAJS5WV7iTFNHif8AIkIAHSD409qWK+kLrK7USpVJL2awRyUHC/rfKdc
         Bqxe/+20sCAGo/fL475czt8oZS7+xcqvYodnmEgJ3cfKZaFmEjZk6Tl+jXvTQFxsoVsy
         QHZMz2NqquI0E1cbmq2UaROHQjKqt9MOEsmyyXCTYKHSlfBhKIN77bBAodQLd9K9NWtb
         P0Yo5J71LCH4xMg+duwIVszr8agwX7UvalpJ30aGcAAY9U7uTP9Moo/jhgHZT4WIaqnB
         do2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242857; x=1735847657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkiYOSK+SB4neVILkmorb+PxqtegAF2YSxLIiY3S8k8=;
        b=ohcw5poqauNy+klTYRqsooZ+994pyfm07IhQ7KNOomkXI2ksL8S+ER0mfXUpKluDAZ
         j2XaOWF1q7/gdGIAVPyDLWHDdk9vtxuuadrEfenBf8SfciTakHpNO1DMLip276W/4Ti0
         STnuFPars55btu75luc/Jrib8E+mRsrMGId4ycaoKlzY0NNM4c6G183DoovNABpMZRH5
         PiuwqN+ZWKQWSeOLDU32NES0OJRy+n9uqduA8zSf/TZc1qzq2/vNm+37lIZ5HmFohh1h
         /05teBOjNNm9X8KaktHd5iyXPd5xn9VyUM60pIcTnS49o+v/Y7wYCZkFyqwFAubMVKtm
         77Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWoEzsyEWZkWUSAA9Aal1sOFvWQfJAKTvpwg7sDfjDemi6sITTh9g0o0xwSUZI/AU0cd8Lvt6PjRXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywso8Gu38iKjXfJcWX5VkbKOfEaWBR5hmlhDZOMIgVJpCEJYWVD
	YqnB3aZApm5hAz0HEMAJJA7K9wPBb1Vu26nbZdEin7cCLETnm4L3eipmr2yWl4SG1cS1aWK3leQ
	zXsFAKp1Xd2JXsqMSEX0fECjYs6D2k9sxPWVl
X-Gm-Gg: ASbGnct34FI2NmH1bihJyU/T3yy8b1uqTEvsHSVwdhpsz4qVI9uYCWkIdKSlPvIKU3X
	ko0yiNYHCGrxMv2KniPH4BJf5teUy9V/c0HuDiA==
X-Google-Smtp-Source: AGHT+IHD3Gh6L++7Zw6AHuHUEo93uirW+9v6XYfd5UD2jeNW/Sl70a+7AD5WUVLBgPY3+4R+NbyTETj/mpTbJIZaKjU=
X-Received: by 2002:a05:622a:120f:b0:465:18f3:79c8 with SMTP id
 d75a77b69052e-46a4c00f1e8mr18589851cf.13.1735242856805; Thu, 26 Dec 2024
 11:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-14-surenb@google.com> <202412270328.HiJX1mRt-lkp@intel.com>
 <CAJuCfpHb23mRT6bS8LNd79Zm0XU9eq9hB671G21UnkU992j82Q@mail.gmail.com>
In-Reply-To: <CAJuCfpHb23mRT6bS8LNd79Zm0XU9eq9hB671G21UnkU992j82Q@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Dec 2024 11:54:05 -0800
Message-ID: <CAJuCfpFc8+q96axtTLEP0=-nwF-9Wunim9O6A6HXN9t-ztJQuw@mail.gmail.com>
Subject: Re: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping the vma
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 11:51=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Thu, Dec 26, 2024 at 11:41=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> >
> > Hi Suren,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 431614f1580a03c1a653340c55ea76bd12a9403f]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasary=
an/mm-introduce-vma_start_read_locked-_nested-helpers/20241227-010925
> > base:   431614f1580a03c1a653340c55ea76bd12a9403f
> > patch link:    https://lore.kernel.org/r/20241226170710.1159679-14-sure=
nb%40google.com
> > patch subject: [PATCH v7 13/17] mm/debug: print vm_refcnt state when du=
mping the vma
> > config: hexagon-randconfig-002-20241227 (https://download.01.org/0day-c=
i/archive/20241227/202412270328.HiJX1mRt-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 60=
09708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241227/202412270328.HiJX1mRt-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> mm/debug.c:189:54: error: no member named 'vm_refcnt' in 'struct vm_=
area_struct'
>
> Ugh, ok. On architectures with ARCH_SUPPORTS_PER_VMA_LOCK=3Dn this will
> happen. Preparing a fix.

This error actually also requires CONFIG_DEBUG_VM=3Dy.

>
> >      189 |                 vma->vm_flags, &vma->vm_flags, refcount_read=
(&vma->vm_refcnt));
> >          |                                                             =
  ~~~  ^
> >    include/linux/printk.h:514:35: note: expanded from macro 'pr_emerg'
> >      514 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
> >          |                                          ^~~~~~~~~~~
> >    include/linux/printk.h:501:60: note: expanded from macro 'printk'
> >      501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##_=
_VA_ARGS__)
> >          |                                                            ^=
~~~~~~~~~~
> >    include/linux/printk.h:473:19: note: expanded from macro 'printk_ind=
ex_wrap'
> >      473 |                 _p_func(_fmt, ##__VA_ARGS__);               =
            \
> >          |                                 ^~~~~~~~~~~
> >    1 error generated.
> >
> >
> > vim +189 mm/debug.c
> >
> >    178
> >    179  void dump_vma(const struct vm_area_struct *vma)
> >    180  {
> >    181          pr_emerg("vma %px start %px end %px mm %px\n"
> >    182                  "prot %lx anon_vma %px vm_ops %px\n"
> >    183                  "pgoff %lx file %px private_data %px\n"
> >    184                  "flags: %#lx(%pGv) refcnt %x\n",
> >    185                  vma, (void *)vma->vm_start, (void *)vma->vm_end=
, vma->vm_mm,
> >    186                  (unsigned long)pgprot_val(vma->vm_page_prot),
> >    187                  vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> >    188                  vma->vm_file, vma->vm_private_data,
> >  > 189                  vma->vm_flags, &vma->vm_flags, refcount_read(&v=
ma->vm_refcnt));
> >    190  }
> >    191  EXPORT_SYMBOL(dump_vma);
> >    192
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
