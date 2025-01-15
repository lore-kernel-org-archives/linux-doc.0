Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582F23594F
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 03:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736910919; cv=none; b=N7DOKz04Nrcpmfq0qXZMTjNHaAlGfpdS+DB7QKyXN8wKbKuN83NM53xNpu5CcAw427wggZHUH2G5m1pkqynt6cNyZhVaKZyHVPn07wyax7g/5f161vZLCrI4VKRRUF0l+HVln6IjAKCNXiNelJpTaMtrQd8DIYqk4Pldqy5w4EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736910919; c=relaxed/simple;
	bh=IL4GW7uu4ddLpyXJg27GtASvmejpGKrHIO684eubz08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqg9E4Ih+GWKtYWBqLT8p8UxqRFBm6U0JyMeZs6Hy/Lkf1QXsl9FUzpaRCis6jmugUr6ezHapp7PtOus+VbiBTU0cD3fjScyxVjOwUtthVl9NZKOhaGCbUUqUtk6Gw5fgZOQCddzgDcw1g11x8p2/gcYoTbjhN93hA3Wms9R2Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f63x4Y/K; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f63x4Y/K"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4679b5c66d0so395331cf.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 19:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736910916; x=1737515716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmAQV/kXBFPzrcuQeLJpFKBUoh3gZth+A/qAse1ch+g=;
        b=f63x4Y/KLpEBGHWddmMVDoS0oiZIP6Owmx0uk+bNtecOUf0UaYYA7NSoAckVuBsle8
         W+7KCDk50a76nJFSy7wmRjiD1GTGIjF47J5tCuB+21PeIWAM8nXEpUfpod1I7EPvq7QA
         FVy6Cg1QP/hehCzUD7hnxidWzkc7muzYSpAgtRMxIhMz1R8w/AEfJkDae0b+SB1nGoKw
         9uHm1Ty2sE3BeQt8Dcp7HvFcQAcjKRNU8NL9YXIfjbptJ80iqsXvDOXmvPTzQmBtV2vN
         PULCPc0bQI2z0pzQvtXt/+jyAJz1xSjWhsEbB/AIZTLjaBvEfxQMxzBlIsEzE2P+Kra6
         hLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736910916; x=1737515716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmAQV/kXBFPzrcuQeLJpFKBUoh3gZth+A/qAse1ch+g=;
        b=ifZTReaz/lN54zHk8DheZ7MTIZtgzX/avp3h4JKBagWWGHvKNoGO0lUMBE2tyQkvHt
         NbGWfs2cU0VTzNPyCTQjmN+mo/U0hN1tm6nu6bx5LBNyxbFGRrFobudHc0/PSeONWqJz
         NMNSnB4LerVW9YmtrNwO+HNWp+3K7u+jogcnZErw+tyTw8AvT9IpWSwjEms5ohT8HKW8
         y6cRmsEy1fm47c80VUzrz0w8QcWg9jaKNw/lrrdhtG5IAoA6sHsxZc+TSoJyT3I2g8J9
         +9uxkQv6ZuG4cLEOWaKB+A8QpUM8CKeRzDWsBvAnSR7r7KbHexaMT1oNf14wPz5/CQvS
         zMhw==
X-Forwarded-Encrypted: i=1; AJvYcCWSHw+lRLRzBp9nOFXaJN920UzKOoDAR+plqT504uwIra1WXvkMCDE4PWp+1g9XW9oQwLl1C9RUtSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOwf5QTdN41cTNwFYRIu1yomXO6nWe7CZGFrVuZnNhq0n5A1gA
	Gp+KWCHDK0IB+KvgGyfuEw75Z2G3OLD0had5ZbkyZu0uJA5dHUqlePzPtPuZYdCA1kgzw23wESt
	2KcTNATI0jnjj+emrtCIin5Ohqj5xvp0Cb2Mm
X-Gm-Gg: ASbGncsMduBAKe2k0HQFebixsCdcdg8U1JKa2wgiXDMGYruJoeWqsHF9lYp7sTmZqSd
	IyBemybr+YMslXW3VWSNGg4pZOVPIBODzvCxINQ==
X-Google-Smtp-Source: AGHT+IFUq7khit4IshjKxsTfppPDsBGejlIWyYntQVqEZyXIv7dkxNwfI0t7k2XD2Vg8ilZfX/a29yDt5iEFtdtqdq8=
X-Received: by 2002:ac8:5a0b:0:b0:466:8887:6751 with SMTP id
 d75a77b69052e-46df7007443mr952211cf.23.1736910915924; Tue, 14 Jan 2025
 19:15:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master>
In-Reply-To: <20250115022703.hqbqdqawvqgrfgxb@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 Jan 2025 19:15:05 -0800
X-Gm-Features: AbW1kvblMdf3P0PmLn0hIrav26JNs6MH0HDLjLfWEr_ZsqUy-mVZmHxwdhWblp0
Message-ID: <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
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

On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrote:
>
> >diff --git a/kernel/fork.c b/kernel/fork.c
> >index 9d9275783cf8..151b40627c14 100644
> >--- a/kernel/fork.c
> >+++ b/kernel/fork.c
> >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct mm_stru=
ct *mm)
> >       return vma;
> > }
> >
> >+static void vm_area_init_from(const struct vm_area_struct *src,
> >+                            struct vm_area_struct *dest)
> >+{
> >+      dest->vm_mm =3D src->vm_mm;
> >+      dest->vm_ops =3D src->vm_ops;
> >+      dest->vm_start =3D src->vm_start;
> >+      dest->vm_end =3D src->vm_end;
> >+      dest->anon_vma =3D src->anon_vma;
> >+      dest->vm_pgoff =3D src->vm_pgoff;
> >+      dest->vm_file =3D src->vm_file;
> >+      dest->vm_private_data =3D src->vm_private_data;
> >+      vm_flags_init(dest, src->vm_flags);
> >+      memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> >+             sizeof(dest->vm_page_prot));
> >+      /*
> >+       * src->shared.rb may be modified concurrently when called from
> >+       * dup_mmap(), but the clone will reinitialize it.
> >+       */
> >+      data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shared=
)));
> >+      memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> >+             sizeof(dest->vm_userfaultfd_ctx));
> >+#ifdef CONFIG_ANON_VMA_NAME
> >+      dest->anon_name =3D src->anon_name;
> >+#endif
> >+#ifdef CONFIG_SWAP
> >+      memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> >+             sizeof(dest->swap_readahead_info));
> >+#endif
> >+#ifndef CONFIG_MMU
> >+      dest->vm_region =3D src->vm_region;
> >+#endif
> >+#ifdef CONFIG_NUMA
> >+      dest->vm_policy =3D src->vm_policy;
> >+#endif
> >+}
>
> Would this be difficult to maintain? We should make sure not miss or over=
write
> anything.

Yeah, it is less maintainable than a simple memcpy() but I did not
find a better alternative. I added a warning above the struct
vm_area_struct definition to update this function every time we change
that structure. Not sure if there is anything else I can do to help
with this.

>
> --
> Wei Yang
> Help you, Help me
