Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEC31D47A2
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 20:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382417; cv=none; b=pMYSlpkdAX8e8Nw4vwvdR3kYMBGtPhcKJVJzQlHrmeo0nPoCXNxihIHYnrOozpiJZRCXYjjq9eosFqo2ImgRq91QszKBtt4T1MqdHfJ7hOzsY2z7/IyR57MioaM3mPahHrKboNedkHfV4IMUDiiAA+xQpPOzjI9kzOxhivH+n9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382417; c=relaxed/simple;
	bh=6EfB6x7eCo3wA6NagtQZ68bboMnD4vJq5kYDbE41ElY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OI6h/yinug3ICd9YbcsdMs4KhZb096LN3b9ALNSS2gzfi3MKEBkiPEjjeahxCezGcPBr5XDcXCFR3+rxWFPvXLedO9gIpLc/tAnFL77mJ4MtbKHUIZdbUP+U/7tpuIbKEo9GKXzY5xIhZffMxq6DVicbb8usikaocfWLF40KFjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ITZ+ynrO; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ITZ+ynrO"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467abce2ef9so61971cf.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 12:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734382414; x=1734987214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C652rZDSvgkZ0k1BwpYHR8VjpUkn9It4q/dyT6wjU8g=;
        b=ITZ+ynrO6ZS0orHyhpHnUugyCvuuO1tmyHgiGpTvQHWf0y1++Nn68XU4uE3SSJlYDH
         8O3j6/KRdVE8RxdYh8/Thuto0+34MoS2j1Pn5jRaOZqR+wSUdz1X1ZO1I7Ugby7mguzp
         iBmu3mlB8v3SlL9jy9Vg8RiN38n6lJOOWR288JK9zwMfyeQLLKieh/WkBeDy+Dvevl9s
         GbVdZ7cZwJXMhg3akLhrfME4Og6Lv1j/iItuH/lxibXSHMo82FnuFdQM/71MPZllwNVl
         vtXg+Pog8NResws7Sdx8IDgK5fGMyi3Wtid+H2fe378TZhk1PkURgj25+8PU0a6RoZaM
         eAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734382414; x=1734987214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C652rZDSvgkZ0k1BwpYHR8VjpUkn9It4q/dyT6wjU8g=;
        b=mzhl+HVDTs/MHGWSBA430nW5fTPd88z+Hz6A/Z6Q94Gs+MdzPaF+ica+tbQ3/A4GCt
         xmGnW+3pXarJn+XywOm3I/Pz75lrnfXmewQ/pHMLSAgKNbpz4b5kXc5e2qugP33wE9Hl
         vg0WzMXNjwCpCmlOfxMJnAZFT077Wo9vmQ+csxq2bl6oGfekXVWpbTn+cHyooiSDIg9j
         bgpOFzsZfzS1RBdWcIKvoyDg09bzeK+6XOx8qEsugh9sDWyXiOyk/YDLwXBeK9BYS1VY
         vaexkfwrVedhCGcX5BeeBeFSr8qvwkzf+PzXoO++NxV5lzXgRI5kfJC8IyyC3uSyvIVk
         1qUg==
X-Forwarded-Encrypted: i=1; AJvYcCWjhbpwM1tpYcq8DNq6YLUs92aSe9S7ezivw4O4KuSupgAJltlCnGgf/7foLG0/zOS/0n1p3aV7Kmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Cxt8+fo9wqEwnPZvz+WcVMbhEdeNUa42loYrROgRl282SUq5
	PY72Fe4JKSkjtD3ayKPupoJ7Y8ZZJ/mY5qWidIxfkbjKbUBfbuwtRK7EnrFjC6NzsOHs/cDOHzk
	5arnZiTyVYq+snGBzplbfdV1r6uHY0Bb5itco
X-Gm-Gg: ASbGncsO8UzuQojlHGXY2aAzA8q2Cj04CFljVZBlR8Zar3+aoKrsKWOZ47mz2wXRqKi
	oWqw6pF0Lcz161satHkPDlzl8fVrcr0+qz2UFpQ==
X-Google-Smtp-Source: AGHT+IECtw4GIes14vwWEzxFvxaCuKJ/1TZUV17FkJlSyJ8bJOD4eX1mf6k4P4SIvfNKoqIwfABSkPrJxR4wiemjLNQ=
X-Received: by 2002:a05:622a:1a27:b0:463:6f7b:250d with SMTP id
 d75a77b69052e-468f979beb6mr545991cf.24.1734382414158; Mon, 16 Dec 2024
 12:53:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-11-surenb@google.com>
 <20241216204223.GA9803@noisy.programming.kicks-ass.net>
In-Reply-To: <20241216204223.GA9803@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Dec 2024 12:53:23 -0800
Message-ID: <CAJuCfpFeKd8T-HXx+iD3DDPe_k_vMZgDvxeVRiuHDGwwgUTfdA@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
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

On Mon, Dec 16, 2024 at 12:42=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Mon, Dec 16, 2024 at 11:24:13AM -0800, Suren Baghdasaryan wrote:
> > @@ -734,10 +761,12 @@ static inline bool vma_start_read(struct vm_area_=
struct *vma)
> >        * after it has been unlocked.
> >        * This pairs with RELEASE semantics in vma_end_write_all().
> >        */
> > +     if (oldcnt & VMA_STATE_LOCKED ||
> > +         unlikely(vma->vm_lock_seq =3D=3D raw_read_seqcount(&vma->vm_m=
m->mm_lock_seq))) {
>
> You likely want that unlikely to cover both conditions :-)

True. VMA_STATE_LOCKED is set only while the writer is updating the
vm_lock_seq and that's a narrow window. I'll make that change in the
next revision. Thanks!

>
> > +             vma_refcount_put(vma);
> >               return false;
> >       }
> > +
> >       return true;
> >  }
