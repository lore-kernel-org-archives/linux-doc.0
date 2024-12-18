Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6B01F8EEE
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 17:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734544706; cv=none; b=lpYPWXwOsoU/wL+kqMTbwM/3WRO2mm7QcXqlgwa8aLY5uZQ1d/QmUi0eGMB/JIoAtSuZ6XaUavHwak1AVN7JMZLDhwmf4ya8piXuiPheAognvGnhWa3kDL5bAqv7r+LD5JZaw3s9Dj69EFtWKo5gXEsQv3nFwCpbIWZWSJ3OK8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734544706; c=relaxed/simple;
	bh=ZPqy3wVVm9ibPma6cOSls6yIjtQ6H3WvNtJ5A3VmAsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/Qswx7kHKMenLJpi6Suq2MMU27x1XtKjYQw+qrCjVasX4XpT8NsYUtcRFbe6uQxxIKXIeUS9LQXySTITTY40MRcsJxHT9u45Rb5DicuyA2qgUuSp6GgEqjMfCpRvK6UL/AltEVZ5y/stojkFerMvihdhR2rQ6wmYK+0lAXS0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gVij0TiK; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gVij0TiK"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467896541e1so4401cf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 09:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734544704; x=1735149504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHJNHRO2k8QSCZzU9lDdX3fOBlskNizCNqWgtHFVHAI=;
        b=gVij0TiKvWC+byOKo3zRVDLA7i9+paturdbM7PSbrAC+L74BlO+z1QXIUqbp9ZLmK9
         +/YdFlNk5EwKox7LJPK5feWgD0LmOouwvTKuHvHMtJ6xVg89FCo7ZiO4/TtKVOCDhnU2
         78D/TNJ9ukEAO3tFzKrxEByNcnG4EGwq9nK9QkVOu6ZXNVuN4adeXBwC74J4UZJW/7wU
         759VzTevnUSQNIClXE2A81u1A40Lc9hWWUG1UaM0uuDpLf5a+Qt1dMA1+DTf7sRRfN/p
         SjP7IIhdub6M6mWUvsJaH2bzV9v7yMR6JXAOJKBMkJ099Jq/M7dHQ2XB/BdNmEByAnoO
         l/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734544704; x=1735149504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHJNHRO2k8QSCZzU9lDdX3fOBlskNizCNqWgtHFVHAI=;
        b=DkhnaWQDkjicvjFAbMRHbcKCiDd5oTZnMBkaaKJKDwIdoZhclUAlWSbdlbXKgQ0MA3
         vbcRQTkbyRKK6IlxkH/cLbif6P7nts5GR7Uys6wPE1PavfSgDwdk3zxVOOXKkgwgidsg
         kYBnghvmLRLIHS3cSccoIvVaGAzQP+bshdqR+c4BF4SKRXx8l8wkK/cmozdHkl4nPATQ
         QcyDnfDJP+iRs3cTIKQvo64OBVMswDql6SApIB1Nc1adw2BbyEfAMNcWHTFH1vEEpQI1
         n86jpJHcW0Jx9jyYA1MdbQoGHCst5eLum5njPn17/6URMzCZOSrTrdB0U60S1a35KKmY
         Wmjg==
X-Forwarded-Encrypted: i=1; AJvYcCWcB7wpYNyRD5JTmMbEgMoyFos7ZtWzwQTMHYa8TN8nuWpYXCVCpGypkGNNaFSPT/96lF6xeK6+fUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwRdN9upgaBFhVSMDTHNoZObGuPPQsXfeGHzdSU3LHcnPlwQR3
	QtbPlKyKzTByP4MNz82unwEusZ7G2Ck3EDDAvK2i4z5Jz9Jmmpy7BFSzjgqaC52cx7/WPZBfiIv
	2LC5zcNBSvNNnhUdSk9kmRRrBMVIts929K0LG
X-Gm-Gg: ASbGncuhSwngsBt6XLBsFKstAhDp6tuMK2KtwZG7pXLoKKg4WCaP54XSDy4cg8li3Z4
	J1Z9oorXnwSHZcPQJERQMF/cq1G7gUEtv1RvcEAPVv1tE5iF8P6CtsNM4SzYsG1WEtIIZ
X-Google-Smtp-Source: AGHT+IEssDY0SR+bYX95z/ZDlSkj8wQHIJjGSznYGJGFMR+0yJkHJYirEpSKl22PGI8XS5CJz8s3aT1ZECCIERJ75Go=
X-Received: by 2002:a05:622a:13c7:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-46935520985mr3369851cf.9.1734544703526; Wed, 18 Dec 2024
 09:58:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216213753.GD9803@noisy.programming.kicks-ass.net>
 <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net> <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net> <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net> <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
In-Reply-To: <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 09:58:12 -0800
Message-ID: <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org, willy@infradead.org, 
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

On Wed, Dec 18, 2024 at 9:44=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasaryan wrote:
>
> > > You will not. vms_complete_munmap_vmas() will call remove_vma() to
> > > remove PTEs IIRC, and if you do start_write() and detach() before
> > > dropping mmap_lock_write, you should be good.
> >
> > Ok, I think we will have to move mmap_write_downgrade() inside
> > vms_complete_munmap_vmas() to be called after remove_vma().
> > vms_clear_ptes() is using vmas, so we can't move remove_vma() before
> > mmap_write_downgrade().
>
> Why ?!
>
> vms_clear_ptes() and remove_vma() are fine where they are -- there is no
> concurrency left at this point.
>
> Note that by doing vma_start_write() inside vms_complete_munmap_vmas(),
> which is *after* the vmas have been unhooked from the mm, you wait for
> any concurrent user to go away.
>
> And since they're unhooked, there can't be any new users.
>
> So you're the one and only user left, and code is fine the way it is.

Ok, let me make sure I understand this part of your proposal. From
your earlier email:

@@ -1173,6 +1173,11 @@ static void vms_complete_munmap_vmas(struct
vma_munmap_struct *vms,
        struct vm_area_struct *vma;
        struct mm_struct *mm;

+       mas_for_each(mas_detach, vma, ULONG_MAX) {
+               vma_start_write(next);
+               vma_mark_detached(next, true);
+       }
+
        mm =3D current->mm;
        mm->map_count -=3D vms->vma_count;
        mm->locked_vm -=3D vms->locked_vm;

This would mean:

vms_complete_munmap_vmas
           vma_start_write
           vma_mark_detached
           mmap_write_downgrade
           vms_clear_ptes
           remove_vma

And remove_vma will be just freeing the vmas. Is that correct?
I'm a bit confused because the original thinking was that
vma_mark_detached() would drop the last refcnt and if it's 0 we would
free the vma right there. If that's still what we want to do then I
think the above sequence should look like this:

vms_complete_munmap_vmas
           vms_clear_ptes
           remove_vma
               vma_start_write
               vma_mark_detached
           mmap_write_downgrade

because vma_start_write+vma_mark_detached should be done under  mmap_write_=
lock.
Please let me know which way you want to move forward.


>
>
