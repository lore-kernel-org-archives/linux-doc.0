Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB420897D
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 21:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736544771; cv=none; b=XvLAomIKYD83IOXoj8U1Me76vWDuqmpMbxvxuRF4kiUMD1rFPJt657wU3UxGd1F5/2TogqWqZb332H5Y+xGXGSACf/fmZspOzobMpoH+9sw1/ypQu+b+YXrfbeaVUt/hwWBVemtkeqMjwnKwgQGcQYftBbyB/OPZuE6Jsr1ySBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736544771; c=relaxed/simple;
	bh=oM7GaUs4knOrd6d0gnvi2KXmv/5c+uWvRccmnngbT80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JUwt4YX47Nn9jlht/K8eMadDw49aT1867e73sDKxzBXTPbAU0qJJW7zMcLWf3NItmmh7ouyk80Ku9ILdClcJVmSiQlCYLn4jiRAi15IBi8o03HyLMeGoEA3fR+17FakvdBhIy1QVztPOXAIjl0hAMasnPlEiAyYXDWvHGpnf3uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xKhz8JA6; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xKhz8JA6"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467896541e1so58751cf.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 13:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736544769; x=1737149569; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO9s+szakul4E/2WEnhG2G7HJAsnQJyy47iQBn9j1jA=;
        b=xKhz8JA6wcfg3oxLZnZvqidJq6nuwRcVbQtjFowL2M1cnGeIvnV3KaOgyheG5uumqW
         3ak9Prr4CvBTN32uEJcBi94TqBYtwqDPityftpZR7df7GvldnEw1V4M9cPsJ9Ge9RsYB
         F3N3it8beC/jDGRO8lmMZy1axFMNPNeLKmgpfm/X8UOIQQXMBlLGBhxqd9nRWDQME1Y6
         EI2DbSWdcfbHLP605FDg+D5CB6fLH/cF3bMpMeEGYE79ctw9tLpeP2EhNvfQNYn6X3Qz
         G0AMRVZWLRBvmUz8zrZfItWQf8GtyyC/PrDKIZgHV5tTEHQiMqzjX+zvjXmZSjWag6KO
         kVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736544769; x=1737149569;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iO9s+szakul4E/2WEnhG2G7HJAsnQJyy47iQBn9j1jA=;
        b=hEH/I9ZgjSXFSFForK2Dqlx/GddWYD0JH1MUQEP+pR0qo8qio/2Tg0HJW7ia5cBln0
         Pbr7iROs0P+1qqo3W/JZbrbwSN3UqtFrOs1WRWEuASKKhvBeph5OfWGIvzIQVgT6FdW/
         k+DYvCdjZO699ISzVax6PVS78CPzo/uE8BZEgo4F+bGHugFwAXUsl85ogRGT0grcjHav
         IpTpgyIW0sNvNZmvIAvZdL7+R1rrBJOkV6lTORsPYF0u2pyajxgGbWyHX63FblxSBCog
         QJHVMuJ6Y7Ihk0HxRoTQj/0rtbaypzLUFZEm88p9WKwVcwwBLh/eaGrxSpULMtX5x7BC
         Jo9A==
X-Forwarded-Encrypted: i=1; AJvYcCVzLPG/BZxLfSS2q75egI+wqTeWwrbhvbXiVoD8/hFeNp9CBMBI8IuHV9/uPiqGmw9tkGVz/WmNx5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOefU1rtsJKvVxaXdQJSknqMef8e3Rl3gx4XUU0hGMBihtcXi
	bD120pj/V8lB78pV4DeB7wb54wQrvpNjU5ZmnIEY1HNg7mLiqtauuPYACdnX0WETf7NjabJ+IS2
	hgCgaTzD3lL0JkcBzBFUsIilVh7g/Kv2X5zw9
X-Gm-Gg: ASbGnctvUugkYQM6qEW/WrFGtvzO3bBKCTPO/XK9HhnyRce8DiFZXpvxvHNaTbUMrm2
	nlpm2riug6ILH8/t4NRYzli+DOEox4Xt5oLpC+Q==
X-Google-Smtp-Source: AGHT+IHtGoQwIvfoO01ptUkX9xO/qyf82fQhrhbq0qizCwkIbrpabwwtDN5/iK0ebbxvD+uq7grPmjKaGj5DMuTsXS4=
X-Received: by 2002:ac8:5d07:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-46c89dab6e2mr4099961cf.9.1736544768681; Fri, 10 Jan 2025
 13:32:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-16-surenb@google.com>
 <wyaz55ugm2qcggi4gjovv4wyxehkcdvtjw77wnrere3eyhi6vf@whfigsczbni5>
 <CAJuCfpG4BeBqyQQ1sGMuQa3mdK0HjAFOWp8pT1iWXWFsiO-8OA@mail.gmail.com>
 <ckqzumj4an54dgnrnyzkhzgvfcr35gmcq7ykfdcvudrd7dd753@cjaowcc6vz6n>
 <CAJuCfpFcn2s_gr21neLgLU990rOVMEZCADRAsXf3xUJPD0BbZQ@mail.gmail.com> <5p3y2umz7yk3ymedybd3vaxz2f6rz52dzcjiihlyvx7aptxri7@yq2scgci3lyc>
In-Reply-To: <5p3y2umz7yk3ymedybd3vaxz2f6rz52dzcjiihlyvx7aptxri7@yq2scgci3lyc>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 13:32:37 -0800
X-Gm-Features: AbW1kvZBb0W1ELVnGRwLtSKVI6boy0MRWCdZWqBm-an7v7W8QZuZTwPYx7uLPpo
Message-ID: <CAJuCfpHPmnG3YJKck1BKT8ZD256O4PbW3+uVP=9Nj79ovK+GDA@mail.gmail.com>
Subject: Re: [PATCH v8 15/16] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 12:47=E2=80=AFPM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [250110 15:35]:
> > On Fri, Jan 10, 2025 at 11:46=E2=80=AFAM 'Liam R. Howlett' via kernel-t=
eam
> >
> > >
> > >     rwsem_acquire_read(old lock)
> > >     __refcount_inc_not_zero_limited() fails
> >
> > Are we looking at the same code
> > (https://lore.kernel.org/all/20250109023025.2242447-12-surenb@google.co=
m/)?
> > The sequence should be reversed here like this:
> >
> >      if (!__refcount_inc_not_zero_limited())
> >               return false;
> >      rwsem_acquire_read(old lock)
> >
> > and because __refcount_inc_not_zero_limited() fails,
> > rwsem_acquire_read(old lock) should never be called.
> >
>
> We are not, I had an older version of the patch from the 7th.
>
> Sorry for the confusion.

No worries. Thanks for taking a look!

>
> Thanks,
> Liam
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
