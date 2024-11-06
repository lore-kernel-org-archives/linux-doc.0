Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A8166307
	for <linux-doc@vger.kernel.org>; Wed,  6 Nov 2024 18:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730916639; cv=none; b=LB5xQ/KYaWoYumHLx8UltxK4bouTukjquD/Jv/J5/v+bTsa8pUMYQCHvfb9+0Rbk3WCKL/S6Nv2I+oMWXKLTSL2nBcI8GfPZbXfK04ughqKXb9IiySIjBCVuQ7hX2cjAH2w+Ky13fcCFyBM/tQDTaz4a3td9qSzS1x2wm3qxwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730916639; c=relaxed/simple;
	bh=PkPc+B615k/kXFxDS+L9I6dgsDOmeLZNoXXNnkOMAUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7HJ7LIfhw5FNfCY65hcbLQLs3QnQ3AFu29QKBejlO5oF2VblROJg2F33xUwkGCnQIc28BKggj382ZPBHLt03RnP8xs0F1suhBE5iLMKAi4Y8kxtfLWeyEwk6jH1pScR6o/17WHA1SNgYChJzCjoEthlvhKLd5n/0H95D+UXwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cbhsWiiy; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cbhsWiiy"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so1308a12.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Nov 2024 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730916636; x=1731521436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpqiovl0ffII9JvtOiEcilqO6gAo6Ysuk7IQTNDHH1E=;
        b=cbhsWiiyfjGvIlEiDlfACsw7l1jb9cdeeh4nJPlS+ZA1vzch9YsysDOffzQdjlIIuF
         TqkFRQvkb0hQ4bBfAppn8QywrTXHmVnT1J8EtgR77ueAmevFizoQqMCxDi6WAAIB0Y55
         jIMTVADnu7lyk9Jo9ckpGpJuBGqDv2y70w+AvgKDQvOgFMeVGhTy1RslhGXgwh5DZnDE
         NorfLJiHt3zMfe4eArbNpC1GI8k/9Quhsqd20LD/K2jzNRYMxZwPcsP06zt6Z1XH92P1
         wb3+UACnnwxARyN4TKf6ULgno2NAs+ZqeZ9UL1+5q4ZVq8Xg59JrXPpCrNkX2O3k/Fr5
         +elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730916636; x=1731521436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpqiovl0ffII9JvtOiEcilqO6gAo6Ysuk7IQTNDHH1E=;
        b=kxw2XGOAE14pRFtcx9wyxuBiYLX94c9gGWxYcCFLPfFd4LGpm+3wPMpMr16scl10AZ
         PBY0Gk+KlyiMqu0jx0ZDOg5EjeTrfkI35/XTeBdjn/Q1K9n91me/4t+YZ9C2RipKocyT
         K3xrjt6UlGTHrve35PoqAGzdGlmIPxz3/W9hZyRb5dGhGjrE66NvZM7zb0tve+ro5HxD
         sNhv/FBaR0RfHtkl3cB0sGE3ZrQIO0Vp5uqmb9MVOlqC9ihITHMNPzAeYDMcIkmF4XQ+
         zKHX4HPsqg0b95SCLNhMjeJTUAvRCMVuTkA9+L12ggqzJItICEd6xYBbmJID6Vc25ZM1
         3DRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjzMfZZOfYyvpri8UVMaBGrPAvsMWtY6w/K2dPuMJJWNll4rwyLtN241gjG4AptzFpPdLdJzbMhUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD1BwjjdoKgwZREDhxmXzlqONXNUuNqBf4nsvxBzvP8PbI9x+J
	55QbNVWObYEwF36M8sDex4m/ff3uoqNExP3sbWN1KVprJdEjCFI944ND0M0xjMGBEkVU6ZbsuLF
	9NPZoY4ahcqNY7T172D+fjaoK6FtUQVO3PTR5
X-Gm-Gg: ASbGnct81DzcbL950dDTsONs6qAI6KRiRnxMIPBmzclR9l1/CHktNR0BY/lf5T4wg3m
	xN/vqQ3opYryy/TZz8LbzHjwXUNmTyhCUvJrSs/y81AQq2QSUYqt1dN3Klzw=
X-Google-Smtp-Source: AGHT+IFfu8DjAm0U1ISPoTiJAxlj7uKrBs27eWrWlAcwhN7fibd3fMEyowQvMJcxtq9Vya2Xc31xMnfP1tRWRloFaGo=
X-Received: by 2002:a05:6402:6c1:b0:5c9:85dc:5ae2 with SMTP id
 4fb4d7f45d1cf-5cefbcd6d8bmr119927a12.7.1730916635289; Wed, 06 Nov 2024
 10:10:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101185033.131880-1-lorenzo.stoakes@oracle.com>
 <CAG48ez0qsAM-dkOUDetmNBSK4typ5t_FvMvtGiB7wQsP-G1jVg@mail.gmail.com>
 <2bf6329e-eb3b-4c5e-bd3a-b519eefffd63@lucifer.local> <CAG48ez1eeQatc0GC_hfOM_mvwjwQ=89JDmp_U5_diLy7ycjEdQ@mail.gmail.com>
 <c0f64fa7-81fd-4691-86b5-2ad39ba9d8a7@bytedance.com>
In-Reply-To: <c0f64fa7-81fd-4691-86b5-2ad39ba9d8a7@bytedance.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 6 Nov 2024 19:09:58 +0100
Message-ID: <CAG48ez3hyaymBo_Y9V2Hpx8TRHbE2WyZoeLhi1n0VW9Np7iw2Q@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/mm: add VMA locks documentation
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 4:09=E2=80=AFAM Qi Zheng <zhengqi.arch@bytedance.com=
> wrote:
> On 2024/11/5 05:29, Jann Horn wrote:
> > On Mon, Nov 4, 2024 at 5:42=E2=80=AFPM Lorenzo Stoakes
>
> [...]
>
> >
> > I think it's important to know about the existence of hardware writes
> > because it means you need atomic operations when making changes to
> > page tables. Like, for example, in many cases when changing a present
> > PTE, you can't even use READ_ONCE()/WRITE_ONCE() for PTEs and need
> > atomic RMW operations instead - see for example ptep_get_and_clear(),
> > which is basically implemented in arch code as an atomic xchg so that
> > it can't miss concurrent A/D bit updates.
> >
>
> Totally agree! But I noticed before that ptep_clear() doesn't seem
> to need atomic operations because it doesn't need to care about the
> A/D bit.
>
> I once looked at the history of how the ptep_clear() was introduced.
> If you are interested, you can take a look at my local draft below.
> Maybe I missed something.
>
> ```
> mm: pgtable: make ptep_clear() non-atomic
>
>      In the generic ptep_get_and_clear() implementation, it is just a sim=
ple
>      combination of ptep_get() and pte_clear(). But for some architecture=
s
>      (such as x86 and arm64, etc), the hardware will modify the A/D bits
> of the
>      page table entry, so the ptep_get_and_clear() needs to be overwritte=
n
>      and implemented as an atomic operation to avoid contention, which ha=
s a
>      performance cost.
>
>      The commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
>      check") adds the ptep_clear() on the x86, and makes it call
>      ptep_get_and_clear() when CONFIG_PAGE_TABLE_CHECK is enabled. The pa=
ge
>      table check feature does not actually care about the A/D bits, so on=
ly
>      ptep_get() + pte_clear() should be called. But considering that the
> page
>      table check is a debug option, this should not have much of an impac=
t.
>
>      But then the commit de8c8e52836d ("mm: page_table_check: add hooks t=
o
>      public helpers") changed ptep_clear() to unconditionally call
>      ptep_get_and_clear(), so that the  CONFIG_PAGE_TABLE_CHECK check can=
 be
>      put into the page table check stubs (in
> include/linux/page_table_check.h).
>      This also cause performance loss to the kernel without
>      CONFIG_PAGE_TABLE_CHECK enabled, which doesn't make sense.
>
>      To fix it, just calling ptep_get() and pte_clear() in the ptep_clear=
().
>
>      Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 117b807e3f894..2ace92293f5f5 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -506,7 +506,10 @@ static inline void clear_young_dirty_ptes(struct
> vm_area_struct *vma,
>   static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
>                                pte_t *ptep)
>   {
> -       ptep_get_and_clear(mm, addr, ptep);
> +       pte_t pte =3D ptep_get(ptep);
> +
> +       pte_clear(mm, addr, ptep);
> +       page_table_check_pte_clear(mm, pte);
>   }
>
> ```

ptep_clear() is currently only used in debug code and in khugepaged
collapse paths, which are fairly expensive, so I don't think the cost
of an extra atomic RMW op should matter here; but yeah, the change
looks correct to me.
