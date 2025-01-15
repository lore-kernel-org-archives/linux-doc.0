Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D0624A7E2
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736953252; cv=none; b=ba3kH48F8It9zxp2aW7WKJ7Lu0NMEu6f+CqvA0aegdz+eLYSnoN54MDh2rwoPhW5jO96EnXLcLaHWsH1nyqTZUSVAhuLBHwz5wgt1lDuRf6siwxkMGupiJKclVaw7DfMyOpZnAbJDnbCpG87YBIiVD9DioO0GJGHYDaNJ68TeFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736953252; c=relaxed/simple;
	bh=NvR1JRh9Kb9Lhx+YM2Fv358nbe163lDoUwCL5BIf3Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=siDpB6EvEcL/ixjh7okJ3r4uq2gatbRlc8a0UUFfWng+zQFVzHKsnNs76ZZKEZBvI4WN1c+LH3fsezm8xw6K1Yp+MsFR+AyxcivONQVKAgRGbGJ1KWzxfcHiEFa2XZI6d2tREYWppdIlp0Pz8V7xOG5So4ZnnGYmnWajeUu2KwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xs+70K/L; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xs+70K/L"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467896541e1so575501cf.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 07:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736953250; x=1737558050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66Q+ECsUQYkh2GFdOA9yukRjVo+GtbrrtQTFGHzSN64=;
        b=Xs+70K/LY861r4T9/kj7SuNcGO5g+c99F8B4lolnCymXizXXFaH+147TeM8xl/SRtT
         4477H/H/1vFTtsaJYyAl6HL2QdW/dKqMJr/KlzEq6r4nDz6l+i1mNBid3TiuY8wdUxyX
         ZqlI2orfK3e9kYUaZ71FDHPSCSa2NYaKKpX8PMo85pYxnmxYq2VmOydtql6odjZWEsk9
         f1NdoyTLf2G4tVEvntfli8LJhHeKTsm+cnMr2pQeXTDaWegp/Tp62BReb1rY28/Vt90Z
         LhiHd9++2CC1HuKoIr0AQBaeU4IC6IH417ysnuG3LdKgGd6d6rMScXP1m/lU3lofICac
         flOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736953250; x=1737558050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66Q+ECsUQYkh2GFdOA9yukRjVo+GtbrrtQTFGHzSN64=;
        b=CB4uJKwV29Wquvbguv7iBesF/QXbPB9c6W/LvfsWTBwi4nOdWPJzZgYrhOTkEuzE/P
         /kaQ+weD8bR7VFX7Hk7EfqtkPwyMzhuXBOJUKB2pPir864w6D3zD2Snm8DAz+IMHkB7a
         rMfuFJ1Sb6KAcaBa1FdTrXEKnEFHSNI52AGQ7kyzke0fU1AWDSiZcQzEqMrz9hLidwIH
         PZ9E4zSrNaW3XJGvIwkpTO4yYHN+7O5yblMT4OznTL2eaTHrnVfmc4+fA2HA6sH8pOmP
         0pmA2RA5j2ZmUTfVosYuEsnjNN7mpzNHW7ctyvS6mJSU8vYDoSPGtJTyJK7zDLLpQLQs
         TJng==
X-Forwarded-Encrypted: i=1; AJvYcCVxFu6sYCDpWg8pnIyqVQ3GBvlYZUHHrMhQDYWDOXq1ojKPH5fDZnOnZTE0yg+VrHeMQZReZgUH/vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfWXFXfsCHeMaVN+yzbH8GMOAIpDsnZ1OObZMTMPn1BarYBa45
	wObdbicTJ4B8a1H8Fw3Tan9WK1UwBeB3NWrlD5SDeeKKK+TJir6oY4h9Wx5IU5cBWuM105X6UVG
	eq2raJXviFFGumRzSpD9miET2ZFezYVD7o5jQ
X-Gm-Gg: ASbGncuXilzv+KgYfJDZuihLuY9R0mQmj5aOd9p/hgJiPu0IoP7cEOnA3EGEk98uH4C
	fzlourr4GhnSDzSpy3oh06+KYhFJO+48D2U6iUQ==
X-Google-Smtp-Source: AGHT+IFzWOkPh/9q2N8pXZbBs3DAk6R5oO0Q3s7YwrFBOYeGwM0QBDakcObadsTeUjM0ajHT04ZgHDXe0wVJQXXcB5c=
X-Received: by 2002:ac8:5708:0:b0:465:3d28:8c02 with SMTP id
 d75a77b69052e-46df57d575fmr4016431cf.26.1736953249300; Wed, 15 Jan 2025
 07:00:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net> <20250115111334.GE8385@noisy.programming.kicks-ass.net>
In-Reply-To: <20250115111334.GE8385@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Jan 2025 07:00:37 -0800
X-Gm-Features: AbW1kvYVi7p6iuGwUc-ExzE8xKeba6NCoxPWkiolrhe8rGm0Lr5ftmP35q6f_sU
Message-ID: <CAJuCfpEF14gXsGs9WMiHDqz8irrrzQrxFmbdzS-qT4xihdhWjQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 3:13=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Jan 15, 2025 at 11:48:41AM +0100, Peter Zijlstra wrote:
> > On Sat, Jan 11, 2025 at 12:14:47PM -0800, Suren Baghdasaryan wrote:
> >
> > > > Replacing down_read_trylock() with the new routine loses an acquire
> > > > fence. That alone is not a problem, but see below.
> > >
> > > Hmm. I think this acquire fence is actually necessary. We don't want
> > > the later vm_lock_seq check to be reordered and happen before we take
> > > the refcount. Otherwise this might happen:
> > >
> > > reader             writer
> > > if (vm_lock_seq =3D=3D mm_lock_seq) // check got reordered
> > >         return false;
> > >                        vm_refcnt +=3D VMA_LOCK_OFFSET
> > >                        vm_lock_seq =3D=3D mm_lock_seq
> > >                        vm_refcnt -=3D VMA_LOCK_OFFSET
> > > if (!__refcount_inc_not_zero_limited())
> > >         return false;
> > >
> > > Both reader's checks will pass and the reader would read-lock a vma
> > > that was write-locked.
> >
> > Hmm, you're right. That acquire does matter here.
>
> Notably, it means refcount_t is entirely unsuitable for anything
> SLAB_TYPESAFE_BY_RCU, since they all will need secondary validation
> conditions after the refcount succeeds.

Thanks for reviewing, Peter!
Yes, I'm changing the code to use atomic_t instead of refcount_t and
it comes out quite nicely I think. I had to add two small helper
functions:
vm_refcount_inc() - similar to refcount_add_not_zero() but with an
acquired fence.
vm_refcnt_sub() - similar to refcount_sub_and_test(). I could use
atomic_sub_and_test() but that would add unnecessary acquire fence in
the pagefault path, so I'm using refcount_sub_and_test() logic
instead.

For SLAB_TYPESAFE_BY_RCU I think we are ok with the
__vma_enter_locked()/__vma_exit_locked() transition in the
vma_mark_detached() before freeing the vma and would not need
secondary validation. In __vma_enter_locked(), vm_refcount gets
VMA_LOCK_OFFSET set, which prevents readers from taking the refcount.
In __vma_exit_locked() vm_refcnt transitions to 0, so again that
prevents readers from taking the refcount. IOW, the readers won't get
to the secondary validation and will fail early on
__refcount_inc_not_zero_limited(). I think this transition correctly
serves the purpose of waiting for current temporary readers to exit
and preventing new readers from read-locking and using the vma.

>
> And this is probably fine, but let me ponder this all a little more.

Thanks for taking the time!
