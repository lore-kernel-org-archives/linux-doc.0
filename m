Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E511B0F33
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 19:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740078230; cv=none; b=T36qJyGar0mKW27IOnj6kZoPi8qjOoCQoOuWysnrJue/+PCjkgeVIdLI7o3xV3MFahh6XEmxXvwFwOIEqlrsaTji4Xw9agjYBoxB9/JZa4BJmB4Bq5DEP8ljYST1vv5B/Yc3i6wRPAmoueaihwbizUTPCst1GocSxss/WdAkfDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740078230; c=relaxed/simple;
	bh=CMYJVuqdWZQhUoTuE+0FXAVoJqmbZLoa6YqwNgt6M+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSEOduhfki/kLIDYaokTdeWlbOtq05Td2+Dw8ZHQ5V0vhELuww3iD+ahQ5YX3A+3vsirObNBb5GHWtd0CV3q4IjAIlm93BLQTSGeNrs/6ARomv4S13DgDy7MibY0/2yz/9xN+KX9pwunyrIuiH8AS81AKQbsGssxwJ59qFmc3Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xwTFnN/N; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xwTFnN/N"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-471fbfe8b89so51991cf.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 11:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740078227; x=1740683027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxiQ6wtOwdm+dkAsya9a3cEEzdO1LAZKevXVrkE5I78=;
        b=xwTFnN/NQ9igU0lmBP9diC0CuX6yamRJ/+Ov+48btUHRN0FVRLgVBtcEqedBi1YV6g
         hNRURjsRIZgZufevHV/Pbch4MgD2NjEHyuYToOYhh7TyxJKhGNG1hJIz4yP3FfniSijX
         qrEVHTvnJUc1yQo9D4A5bLtmvZ2fg+RoPApQ6XRln13xULQMK4qAr22An19oiMtxvNAK
         bH4Ahxzky+VM85tFflb04JBQ88Pgm3nmjWd4Q59e3aoHvZtc6+OEu7IKc5tvTUeyi+MT
         qXn4+zRQjKwswuXvABA8uG7J5KUlQJvLLny+YiN4aKVU65uetnH8gGY8p8umxZY6yZOy
         IuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740078227; x=1740683027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxiQ6wtOwdm+dkAsya9a3cEEzdO1LAZKevXVrkE5I78=;
        b=jmrscTZ/X9oFqroZdFha+oQtE7gGLP0EIcE6Rv8HXQpwB+K9SbyfHnhS52l190MSYY
         nAaVf25FOHqwoyCuCcq28yO9vrzrwBIXHUEYobn1Upc0bgn61Rahap0UiJLVfXgMqPAu
         6QsWkI37eBP6Wk1MFZ5agh718yKq3klqK65haJzPGDmtU1KBxa5oDH+SsBQX1I9cUV60
         IjuRoKusrzGlMP39FztkhCOqhDQk9mAfTL8003QWmFboN3DozJddfHUKGgTzZ+RrsEw/
         HRymmamjl1DodjVK64paOwvOvUea63lehejBTVUmh3NacbTT/PQEZV9kN911WmOxObD/
         FyPA==
X-Forwarded-Encrypted: i=1; AJvYcCWD+vjyBiW6Y6VzCZmEYmRNLenVx0+ejsD/Fq0obkbW29+SZySzlk6cvANWFuU+CS8bC0f5/tZg4TE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeK6XqYnZeEdecIpqPydzAwiPfm3uusDPIXgnncrQg4HNJvFVw
	7+IsmzSnqKwrtMzV5lh3UIzmKAbUN+z6QNJp33G07zKtVV4qrx++GKMSCTDwZopvjfTYjHBs3+U
	B23B9Y4Adz0Eo2B7T7x0BbRNHcpwxMUsUtSzM
X-Gm-Gg: ASbGncsOk4eIk9xfbftrVyKQO1/GqQCPt+qiDpQp3WtU0gk2PK/FW6XAqaV8Wcr6iUp
	3Ua2qKaH5ofVtnm1Ypae62vJl6vrpBVTbsTr4DidF6nVUD/GyXHBJLJKOf7FMILswE7VVAOi6
X-Google-Smtp-Source: AGHT+IESP4lbni9JLo1iujP72rl0UncWhPZ3xqcQGvW9Vo/oQYynNgMZNvVxa6DNjIc9FvD6XgPJibfnmYh6QZ2GyiA=
X-Received: by 2002:ac8:5fd4:0:b0:46c:7cf2:d7b2 with SMTP id
 d75a77b69052e-472238fc66amr85181cf.18.1740078226855; Thu, 20 Feb 2025
 11:03:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213224655.1680278-1-surenb@google.com> <20250213224655.1680278-13-surenb@google.com>
 <20250220185304.8313A7d-hca@linux.ibm.com>
In-Reply-To: <20250220185304.8313A7d-hca@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 20 Feb 2025 11:03:35 -0800
X-Gm-Features: AWEUYZnhHZmA7CKIk6-rs2tkls49oh6ILCc24Xt36DF6I4s6NBc5M1Lba_eQz4M
Message-ID: <CAJuCfpFPaVY1EHus1p0SY1=hpiGogdPCkgtft7fNZ4gPPj2TGA@mail.gmail.com>
Subject: Re: [PATCH v10 12/18] mm: replace vm_lock and detached flag with a
 reference count
To: Heiko Carstens <hca@linux.ibm.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
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

On Thu, Feb 20, 2025 at 10:53=E2=80=AFAM Heiko Carstens <hca@linux.ibm.com>=
 wrote:
>
> On Thu, Feb 13, 2025 at 02:46:49PM -0800, Suren Baghdasaryan wrote:
> ...
> > While this vm_lock replacement does not yet result in a smaller
> > vm_area_struct (it stays at 256 bytes due to cacheline alignment), it
> > allows for further size optimization by structure member regrouping
> > to bring the size of vm_area_struct below 192 bytes.
> >
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> > Changes since v9 [1]:
> > - Use __refcount_inc_not_zero_limited_acquire() in vma_start_read(),
> > per Hillf Danton
> > - Refactor vma_assert_locked() to avoid vm_refcnt read when CONFIG_DEBU=
G_VM=3Dn,
> > per Mateusz Guzik
> > - Update changelog, per Wei Yang
> > - Change vma_start_read() to return EAGAIN if vma got isolated and chan=
ged
> > lock_vma_under_rcu() back to detect this condition, per Wei Yang
> > - Change VM_BUG_ON_VMA() to WARN_ON_ONCE() when checking vma detached s=
tate,
> > per Lorenzo Stoakes
> > - Remove Vlastimil's Reviewed-by since code is changed
>
> This causes crashes (NULL pointer deref) with linux-next when running
> the ltp test suite; mtest06 (mmap1) test case.
>
> The bug seems to be quite obvious:
>
> > @@ -6424,15 +6492,18 @@ struct vm_area_struct *lock_vma_under_rcu(struc=
t mm_struct *mm,
> >       if (!vma)
> >               goto inval;
> >
> > -     if (!vma_start_read(vma))
> > -             goto inval;
> > +     vma =3D vma_start_read(vma);
> > +     if (IS_ERR_OR_NULL(vma)) {
>             ^^^^^^^^^^^^^^^^^^^
> > +             /* Check if the VMA got isolated after we found it */
> > +             if (PTR_ERR(vma) =3D=3D -EAGAIN) {
> > +                     vma_end_read(vma);
>                         ^^^^^^^^^^^^^^^^

Doh! Thanks for reporting! I'll post a fix shortly.
