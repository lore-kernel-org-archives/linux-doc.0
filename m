Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A8913A257
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 15:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736953856; cv=none; b=N2uzByXzDDXPLg0kwO5AFjlTD7fEjYXRrKH0oqoy6YinbdW7xfT422AcU1TJOoP4qWvRpdU3+hdKKu7R3zQQsrOBqPHoOjSYVCE7pDDcvSvxFWyB+XvHTvmxSuafpGUei9/Y/3owgtQbtudh/SJwEBhGBR9iaXOgeU7vC7gcn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736953856; c=relaxed/simple;
	bh=N8OcYkaFy0Wzgtwi23zsu7etnNkTJ5xKYEgNi3YfaI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lvXlvi/k8o8i788lJyDCsZ32/kx+QLKp8ILJQC56fcKsDJKSVox7yMUsID86Ya2JKFWeic4TnnDT58ZVvZt3Tk3VdCEwFeA2wEtljxvCRAGLPBbzf9fdyV+UaCVm0s+4BGnCiGy9XpRUDXVir15jZXkXt8n6amDQuFUZCaQN6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qvpNsteI; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qvpNsteI"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-467896541e1so578501cf.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 07:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736953852; x=1737558652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIjc0IS3W/w99ZsggQVQCmjGBjhPdrh8UkjWyUIXhvc=;
        b=qvpNsteIe11DK6o+2LJSIkg2GNhafvpsuW7U3ozAu32e61iC6ylE/BUTcWzTRB0EC4
         4YzHRb1PMd6qtL1EDGXRE4YgdzgmsoTQo/cx5/JrwG5CgxgIEjJ/NbUVC46CMJRAn+UH
         Pbr3QrOsf5TqzDnOT2T2RaDvSDRX46nU7q8BTQ40UUsCJLTO8vnJ8ooAGBiNl+ot1khR
         2dwF+RLdWYhMwy9NpCrZBHE52Jhsn/ZSh3lAy0g+XK1o1vI3O/7uW3lLSgSnew7v/Lxi
         hUuP2cSsk2shDH7reeiwqtRVWDs2T0bzvVoxxaQD3GGgEnAsBFieXxWmr+EGwENzy+4M
         5A5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736953852; x=1737558652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mIjc0IS3W/w99ZsggQVQCmjGBjhPdrh8UkjWyUIXhvc=;
        b=nWdS8ftaloX+QMLvZnTsoBuXl0YiWKit28YYurw1hzJRkH+C4V+w/6kQy4/NvPk28c
         my9FS8VAmAhTfx24ZO0FTnh5BvcIZpqiwNyDqpTnBrodNyNpqzMBNBTpSe8xFhGZo/Pa
         g2V4jIc4gPbxiHtNBk/sUCmvhvcKgNTDxQZ54QbKh2BMVaSXoG+h2pfjrBpDUhD7MzqQ
         7exmw9N/gRSibf+KHmahMSkb09bi2xTHLmtLk1YvN+tocu41nmp4iJFJJEzXnO8RrpRW
         JH4d6e4OY88bsourgt2Ox8PsVlAGkShQRVzN/B20XyyqXjOFERuDFMcQU33VgDTS+yaz
         SDtA==
X-Forwarded-Encrypted: i=1; AJvYcCVEZ/rJXs7Yxb+S5WKp+/mQqUKJ9oV0r0nM442fwhU2rnJVUQrabar/3nAvEjkKJ4qkByflHLSOOas=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQa9DHKTLVvjrsedR6UlxuK+52eFotynflwItTicFZFccyYhbe
	k7Y1CzheT8E445VtufDtPmxTe4OcUzhkIV7WbbKm5yc8dUgl7esh5nGvd19Vti7L+x1tcqV0Rut
	xCbV+SaX0XT3cyEqfxfsirrmURAY9303vNAVy
X-Gm-Gg: ASbGncvdivs1XBDDqfVg2XW8aKGAKc068HVmG/1c7qXrBJCODJ/hxqfOzf81vnGPR3L
	K4HnvNyorSwJ+yGo4I5IOLWFgjrvpF+zws7GWAA==
X-Google-Smtp-Source: AGHT+IGAMfzcVJBER8h8F7+DE57/B21/7rt8m/dJiN9j9uul1qrYdcZd7OgVBKh7zc/T1K6DIhWcr4mpZB9H8SCYQuk=
X-Received: by 2002:ac8:7d4e:0:b0:462:b2f5:b24c with SMTP id
 d75a77b69052e-46df701cd20mr3212151cf.29.1736953851937; Wed, 15 Jan 2025
 07:10:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master> <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
 <edeb55ab-bbef-4542-ac41-b07bfaaf9b96@suse.cz>
In-Reply-To: <edeb55ab-bbef-4542-ac41-b07bfaaf9b96@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Jan 2025 07:10:40 -0800
X-Gm-Features: AbW1kvaTlgszSQ5c9z9BuNkSJ5mj1IrQ_k71wFg0EM4-bVjxYJloVfSOIolHNmA
Message-ID: <CAJuCfpFo0duPPH1Ezms7D7s6JLUiWpCGRRB68L_Ym9njY-po8A@mail.gmail.com>
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

On Tue, Jan 14, 2025 at 11:58=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 1/15/25 04:15, Suren Baghdasaryan wrote:
> > On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gmail=
.com> wrote:
> >>
> >> On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
> >>
> >> >diff --git a/kernel/fork.c b/kernel/fork.c
> >> >index 9d9275783cf8..151b40627c14 100644
> >> >--- a/kernel/fork.c
> >> >+++ b/kernel/fork.c
> >> >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_s=
truct *mm)
> >> >       return vma;
> >> > }
> >> >
> >> >+static void vm_area_init_from(const struct vm_area_struct *src,
> >> >+                            struct vm_area_struct *dest)
> >> >+{
> >> >+      dest->vm_mm =3D src->vm_mm;
> >> >+      dest->vm_ops =3D src->vm_ops;
> >> >+      dest->vm_start =3D src->vm_start;
> >> >+      dest->vm_end =3D src->vm_end;
> >> >+      dest->anon_vma =3D src->anon_vma;
> >> >+      dest->vm_pgoff =3D src->vm_pgoff;
> >> >+      dest->vm_file =3D src->vm_file;
> >> >+      dest->vm_private_data =3D src->vm_private_data;
> >> >+      vm_flags_init(dest, src->vm_flags);
> >> >+      memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> >> >+             sizeof(dest->vm_page_prot));
> >> >+      /*
> >> >+       * src->shared.rb may be modified concurrently when called fro=
m
> >> >+       * dup_mmap(), but the clone will reinitialize it.
> >> >+       */
> >> >+      data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->sha=
red)));
> >> >+      memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> >> >+             sizeof(dest->vm_userfaultfd_ctx));
> >> >+#ifdef CONFIG_ANON_VMA_NAME
> >> >+      dest->anon_name =3D src->anon_name;
> >> >+#endif
> >> >+#ifdef CONFIG_SWAP
> >> >+      memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> >> >+             sizeof(dest->swap_readahead_info));
> >> >+#endif
> >> >+#ifndef CONFIG_MMU
> >> >+      dest->vm_region =3D src->vm_region;
> >> >+#endif
> >> >+#ifdef CONFIG_NUMA
> >> >+      dest->vm_policy =3D src->vm_policy;
> >> >+#endif
> >> >+}
> >>
> >> Would this be difficult to maintain? We should make sure not miss or o=
verwrite
> >> anything.
> >
> > Yeah, it is less maintainable than a simple memcpy() but I did not
> > find a better alternative.
>
> Willy knows one but refuses to share it :(

Ah, that reminds me why I dropped this approach :) But to be honest,
back then we also had vma_clear() and that added to the ugliness. Now
I could simply to this without all those macros:

static inline void vma_copy(struct vm_area_struct *new,
                                            struct vm_area_struct *orig)
{
        /* Copy the vma while preserving vma->vm_lock */
        data_race(memcpy(new, orig, offsetof(struct vm_area_struct, vm_lock=
)));
        data_race(memcpy(new + offsetofend(struct vm_area_struct, vm_lock),
                orig + offsetofend(struct vm_area_struct, vm_lock),
                sizeof(struct vm_area_struct) -
                offsetofend(struct vm_area_struct, vm_lock));
}

Would that be better than the current approach?

>
> > I added a warning above the struct
> > vm_area_struct definition to update this function every time we change
> > that structure. Not sure if there is anything else I can do to help
> > with this.
> >
> >>
> >> --
> >> Wei Yang
> >> Help you, Help me
>
