Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4692753ED
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 22:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739487376; cv=none; b=gtcbHCKlEoZm/h8+0TFATxOeUKBUKNdHYZTYclE15t/nZyOP5S/kyqRiSNgw54UZPw/SZ/bova7lM3xvAAK+a8C8CJKJFMeXrKPHmU2Hl2BdJgyQZiNmpZRJjCPuU3KMpRqa5L5jjDQxvOCC2rZsCVMDziwZWaGL0xbJpN6ZwX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739487376; c=relaxed/simple;
	bh=yJUf8ZvNH+Ifa3O6C6OWiDFTgIdTB6badybZkn+parw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGbRe/QjwXyTRsIwwtl+jJXUTP2OFNUIUMtSdrko2x8LdmfLDmqlhBCcXRphORjYnIBNFQqCBxL3xO0Nj+tLzb45pve2i/0ZrVpj+vRR+pd3Ytotlf07Ws8sILOunB/itD6TGMKkw4ran+8vTuChw4+RhqQ/gX8QGwITDRfl+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tHrhJFb3; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tHrhJFb3"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4718e224eb1so30041cf.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 14:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739487373; x=1740092173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RadunuMXhRgLPe1WVFuc+K0YnZ/6gncGnMDL+6atVrM=;
        b=tHrhJFb3GNoJZLeqBGZVq3FjTKdCDzrFNZViiHdjmv33u6ukB025hy7LvKVwde3jeh
         Sy/SCNii0DI5SoAjnotXrUOljwQmMDBiLPKUUqXVEpOb6CJ5NEinuK53Ojq3rG18ROFG
         0fSZN0DxBtEL2F27Nm1E9Ek7APQgDVEfv8ao3iGJKfAdP2woO5+ifLEnMWF/iSeplJUh
         XA6OtS1EypQ/ESsKeBwKAfoNovlOQCJ3F1AiFwR/3a8j1ySiFDGgzv0mu9fYqDwoblrs
         CKoIDwPBbHXq4sXiYZxFgU/F8ylCrgnwIClzptUzm6aAcChicE6Dqx4yEhUFpMEsNKt4
         +r7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739487373; x=1740092173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RadunuMXhRgLPe1WVFuc+K0YnZ/6gncGnMDL+6atVrM=;
        b=Jcq+zyqDBI7UF567XOJg2kByPQN2saZ+ABNTqayOXFXG+OTtCy6RZ9xcBQK2a91igk
         y20nv4uE5H0/LgQdwpfdFW/UBjFM7BNid1aERjMTCQFezlbldrfHeDVaq+NPAeE5dpAJ
         hK5TC2xYlF8Z/i6JAwJgssub5GbMvB5ftGwPrf1ZuXB7MqzOPkDduEqVsvBudNo1VTUb
         dUsRAlHpm8whi0QKc1j0baz05wMBEraSGGrJiwXvA9Cwa0yjj6ICBFTXR8mwwptvBrDE
         GlEmgx+XOwB4Wzn/R9cHBsIOUcT9py9ZBOgRCDuv1b5+w0qJE/rFDnJCQWQmIPS4oIGw
         Bt/w==
X-Forwarded-Encrypted: i=1; AJvYcCUGsfuwNxa4K+EtL4Js2iFebMoa0Hr2bzFhfA5sFVjwAQUfrg7hL/Uvb1kWdxw5VEzGSHq1nYW5B2A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk149d1ceqWsRDprkbV9QbI+5S7hBCud1KS0RyevOiGrnaNs59
	mpCPnY/rWfaGQ5B7UeQgoUBCfmVHAaHG86u2HjcdKCt1j73c32MiLqLobhhYVrPKNlFSdlbA5Db
	x41pZnxTw+vlkctGy2ZR9MM3fTd4I2G7Cf/Y5
X-Gm-Gg: ASbGncsvgJP+WVFwd11x8IazFLGqLNdZBJPzTzthcDv4JP4iajY/OZSz8hfrIXg06IX
	/JXj/jjIiEdG9f97s8O2jvRyX7ljaEZTHUy7XZGLFq8vcW6Il+G61sBwGe+S6W+TjWf6C04tNS9
	20BYxoXd0l4FyeEREP0ixA30vMN/Q=
X-Google-Smtp-Source: AGHT+IHInVkShwuEixemWhDH8jh3S8eLtZGvG2UxpKSDDxfRPiRP/pJTrU0zbga+0Ky8fl7GGJViaLe8zH246gT/AvE=
X-Received: by 2002:a05:622a:1b89:b0:466:975f:b219 with SMTP id
 d75a77b69052e-471ce7c82a3mr1056021cf.8.1739487372551; Thu, 13 Feb 2025
 14:56:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master> <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
 <edeb55ab-bbef-4542-ac41-b07bfaaf9b96@suse.cz> <CAJuCfpFo0duPPH1Ezms7D7s6JLUiWpCGRRB68L_Ym9njY-po8A@mail.gmail.com>
In-Reply-To: <CAJuCfpFo0duPPH1Ezms7D7s6JLUiWpCGRRB68L_Ym9njY-po8A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 13 Feb 2025 14:56:01 -0800
X-Gm-Features: AWEUYZlo5iRxC39MvzAalKhbTbTcKASclV9SceEdQOsscai-p0KoPtBCDNLbGyQ
Message-ID: <CAJuCfpG+Zypy+_83UMLpFk9xJca2ptAb9ANV6tp7TG497vaGBQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Wei Yang <richard.weiyang@gmail.com>, willy@infradead.org, 
	akpm@linux-foundation.org, peterz@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 7:10=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Jan 14, 2025 at 11:58=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz>=
 wrote:
> >
> > On 1/15/25 04:15, Suren Baghdasaryan wrote:
> > > On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gma=
il.com> wrote:
> > >>
> > >> On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
> > >>
> > >> >diff --git a/kernel/fork.c b/kernel/fork.c
> > >> >index 9d9275783cf8..151b40627c14 100644
> > >> >--- a/kernel/fork.c
> > >> >+++ b/kernel/fork.c
> > >> >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm=
_struct *mm)
> > >> >       return vma;
> > >> > }
> > >> >
> > >> >+static void vm_area_init_from(const struct vm_area_struct *src,
> > >> >+                            struct vm_area_struct *dest)
> > >> >+{
> > >> >+      dest->vm_mm =3D src->vm_mm;
> > >> >+      dest->vm_ops =3D src->vm_ops;
> > >> >+      dest->vm_start =3D src->vm_start;
> > >> >+      dest->vm_end =3D src->vm_end;
> > >> >+      dest->anon_vma =3D src->anon_vma;
> > >> >+      dest->vm_pgoff =3D src->vm_pgoff;
> > >> >+      dest->vm_file =3D src->vm_file;
> > >> >+      dest->vm_private_data =3D src->vm_private_data;
> > >> >+      vm_flags_init(dest, src->vm_flags);
> > >> >+      memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> > >> >+             sizeof(dest->vm_page_prot));
> > >> >+      /*
> > >> >+       * src->shared.rb may be modified concurrently when called f=
rom
> > >> >+       * dup_mmap(), but the clone will reinitialize it.
> > >> >+       */
> > >> >+      data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->s=
hared)));
> > >> >+      memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> > >> >+             sizeof(dest->vm_userfaultfd_ctx));
> > >> >+#ifdef CONFIG_ANON_VMA_NAME
> > >> >+      dest->anon_name =3D src->anon_name;
> > >> >+#endif
> > >> >+#ifdef CONFIG_SWAP
> > >> >+      memcpy(&dest->swap_readahead_info, &src->swap_readahead_info=
,
> > >> >+             sizeof(dest->swap_readahead_info));
> > >> >+#endif
> > >> >+#ifndef CONFIG_MMU
> > >> >+      dest->vm_region =3D src->vm_region;
> > >> >+#endif
> > >> >+#ifdef CONFIG_NUMA
> > >> >+      dest->vm_policy =3D src->vm_policy;
> > >> >+#endif
> > >> >+}
> > >>
> > >> Would this be difficult to maintain? We should make sure not miss or=
 overwrite
> > >> anything.
> > >
> > > Yeah, it is less maintainable than a simple memcpy() but I did not
> > > find a better alternative.
> >
> > Willy knows one but refuses to share it :(
>
> Ah, that reminds me why I dropped this approach :) But to be honest,
> back then we also had vma_clear() and that added to the ugliness. Now
> I could simply to this without all those macros:
>
> static inline void vma_copy(struct vm_area_struct *new,
>                                             struct vm_area_struct *orig)
> {
>         /* Copy the vma while preserving vma->vm_lock */
>         data_race(memcpy(new, orig, offsetof(struct vm_area_struct, vm_lo=
ck)));
>         data_race(memcpy(new + offsetofend(struct vm_area_struct, vm_lock=
),
>                 orig + offsetofend(struct vm_area_struct, vm_lock),
>                 sizeof(struct vm_area_struct) -
>                 offsetofend(struct vm_area_struct, vm_lock));
> }
>
> Would that be better than the current approach?

I discussed proposed alternatives with Willy and he prefers the
current field-by-field copy approach. I also tried using
kmsan_check_memory() to check for uninitialized memory in the
vm_area_struct but unfortunately KMSAN stumbles on the holes in this
structure and there are 4 of them (I attached pahole output at the end
of this email). I tried unpoisoning holes but that gets very ugly very
fast. So, I posted v10
(https://lore.kernel.org/all/20250213224655.1680278-18-surenb@google.com/)
without changing this part.

struct vm_area_struct {
        union {
                struct {
                      unsigned long vm_start;          /*     0     8 */
                        unsigned long vm_end;            /*     8     8 */
                };                                       /*     0    16 */
                freeptr_t          vm_freeptr;           /*     0     8 */
        };                                               /*     0    16 */
        union {
                struct {
                        unsigned long      vm_start;             /*
 0     8 */
                        unsigned long      vm_end;               /*
 8     8 */
                };                                               /*
 0    16 */
                freeptr_t                  vm_freeptr;           /*
 0     8 */
        };

        struct mm_struct *         vm_mm;                /*    16     8 */
        pgprot_t                   vm_page_prot;         /*    24     8 */
        union {
                const vm_flags_t   vm_flags;             /*    32     8 */
                vm_flags_t         __vm_flags;           /*    32     8 */
        };                                               /*    32     8 */
        union {
                const vm_flags_t           vm_flags;             /*
 0     8 */
                vm_flags_t                 __vm_flags;           /*
 0     8 */
        };

        unsigned int               vm_lock_seq;          /*    40     4 */

        /* XXX 4 bytes hole, try to pack */

        struct list_head           anon_vma_chain;       /*    48    16 */
        /* --- cacheline 1 boundary (64 bytes) --- */
        struct anon_vma *          anon_vma;             /*    64     8 */
        const struct vm_operations_struct  * vm_ops;     /*    72     8 */
        unsigned long              vm_pgoff;             /*    80     8 */
        struct file *              vm_file;              /*    88     8 */
        void *                     vm_private_data;      /*    96     8 */
        atomic_long_t              swap_readahead_info;  /*   104     8 */
        struct mempolicy *         vm_policy;            /*   112     8 */

        /* XXX 8 bytes hole, try to pack */

        /* --- cacheline 2 boundary (128 bytes) --- */
        refcount_t                 vm_refcnt
__attribute__((__aligned__(64))); /*   128     4 */

        /* XXX 4 bytes hole, try to pack */

        struct {
                struct rb_node     rb __attribute__((__aligned__(8)));
/*   136    24 */
                unsigned long      rb_subtree_last;      /*   160     8 */
        } shared;                                        /*   136    32 */
        struct {
                struct rb_node             rb
__attribute__((__aligned__(8))); /*     0    24 */
                unsigned long              rb_subtree_last;      /*
24     8 */

        /* size: 32, cachelines: 1, members: 2 */
        /* forced alignments: 1 */
        /* last cacheline: 32 bytes */
        };

        struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   168     0 */

        /* size: 192, cachelines: 3, members: 16 */
        /* sum members: 152, holes: 3, sum holes: 16 */
        /* padding: 24 */
        /* forced alignments: 1, forced holes: 1, sum forced holes: 8 */
};

>
> >
> > > I added a warning above the struct
> > > vm_area_struct definition to update this function every time we chang=
e
> > > that structure. Not sure if there is anything else I can do to help
> > > with this.
> > >
> > >>
> > >> --
> > >> Wei Yang
> > >> Help you, Help me
> >
