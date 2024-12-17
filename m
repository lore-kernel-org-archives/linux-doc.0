Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93E41EF084
	for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 11:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435093; cv=none; b=r0HI64aDSrzjWCLBpXyZ89CYCu2h2adSn33gZ2FtuhsZHjlkKP1aiVQiZmKlwyzQhdhdCvYtszq22C1i3/aHgqrQfUUkQkQABHRsQhIVX/6mF/A/JyJNiAl+D2t5+teNIRTHFgnj4vqCehRoacZ116hZ41KCLRfgHS3eId/FFI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435093; c=relaxed/simple;
	bh=NrV7zWa2cOX+jQ+iJwEyDxFKODIfF/wIulqOnUlHeg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbMdfQDf98y4NjTIl7rX2MK39fvLwqxZ6INRJxSHPGjdLoNjF9fhTbCXWeFjZrAeMzWq8X4c10P5gRzawASe4yPVGZmYp9VGkxIBvUNhYLAa6HMAyUthceoLC4o+mk9x6L/zhI+RVBm66qt+4iX+Ix7Sci4cJo8MG8guda+piAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jc29Dblk; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jc29Dblk"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4678c9310afso193701cf.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Dec 2024 03:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734435091; x=1735039891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vD8eqn9xKjeqPVrsxuP1cvZSPzizQuDJa3iQ6IuBE7k=;
        b=jc29Dblkxb7KWgJnS8I88lZbX0uFVJVcPLZRsVI7ZMPUDSdV25ZHVEccsodtPdYBkF
         5IW5FKinXYr20pVAmuuYvxVXyhWbzUQQ9R0DVnxNDdOv/oHWaQ8mMjyyI8EacDJEJ1BW
         jahkXPBj1vTBYG8sfCc6yMyHMU/HTm+fDARj6X6U1x1oXS+kMiYUzp2gHUXIMUvTdqXF
         HasoRR2txsXKwbg7AX5U2w8dQkTw+fSP/O+2tfebPRe/ffMWs1dmu9C/02et8bV8k7RM
         i2+jzEjG7VXVok+CiNuuXomrd8mP3Uwz4bJzxq19VdEwbG7DdODPJ1DXHliF0s8SdWaq
         CsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734435091; x=1735039891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vD8eqn9xKjeqPVrsxuP1cvZSPzizQuDJa3iQ6IuBE7k=;
        b=Fi6uQNO19v8lC5cT+Na0Bh2JDfM6m850PerQnEt2hLcXNzopjRresFGMzATJ//49sM
         7oRogO+/rZvdXfZY48cBtfNTbRx9EV+UgigtvE+xITaGUYWe3x9pK2yJ4Xvbh5V8TkIX
         nijAnkzyKwgube7qp2UzVpAFFgsFSt7bCJMY4UlbHMeu0EozOnYjuGtkU9zLO6mACKOx
         yiPHA9jS2mbAHHLdEyvW25D9tMsCJFTTojGtkggghaq4TVXB1YUTWRu36aHnP0OfBZ9x
         BobBdJJ4v8QBwYl8dg91fe0awqJ50co9efT72oCR8vaLqjL6NY3dacU8XBM4F4pj1S4a
         Rcmw==
X-Forwarded-Encrypted: i=1; AJvYcCVA9nAVRZQSGPCflFQ1RIlf8LuAHVa68nr31SSgICatdulYckF14WdXLvoLRzwu3jjMeLWp0R+HAJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKzxo3zJtZTWsiMwL1RzZSDZhlXjct5BshQ6XBvTwpiEyuwEo
	ucsJiPSZTzpqSxKH4gnvFcacJLmPHuRamvG/fphLNppV+75lvpoLJP/yWG8JipTstUKa6Jw8Wbr
	dQgGk1mi3zKeKBsfEQqfIxu5rXiPTuX5jEn8M
X-Gm-Gg: ASbGncsWhAZDRyVZ9CFYtktZnnjXj1M0dDdKKyLNIoc6O2+ZTF0jSBO4pJJz2kC2nvg
	rNMfJgYQjyxtKABbsGA7YQOoGPlfTlfHZbLGNBK8=
X-Google-Smtp-Source: AGHT+IHKHu1IRkhxrihYEwIoqAnGLbuaLzSRpS59Zb04zfEsWUbH7MON2gLm1HCEqY0IL9x+918vOzmCLcWI+leDoFU=
X-Received: by 2002:ac8:5816:0:b0:466:8e4d:e981 with SMTP id
 d75a77b69052e-468fb0a6adfmr2640361cf.3.1734435090631; Tue, 17 Dec 2024
 03:31:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-7-surenb@google.com>
In-Reply-To: <20241216192419.2970941-7-surenb@google.com>
From: Lokesh Gidra <lokeshgidra@google.com>
Date: Tue, 17 Dec 2024 03:31:17 -0800
X-Gm-Features: AbW1kvY337jQ0-Qj_UJ_IHTN8osVIPvR_DR3TuoCbJLAyvPh6j1Kj7s-4brW2z4
Message-ID: <CA+EESO5BiPvHSxLtsc-3k4Sv2B09J1MsWzGvCwG-eBh-7rdCyw@mail.gmail.com>
Subject: Re: [PATCH v6 06/16] mm: allow vma_start_read_locked/vma_start_read_locked_nested
 to fail
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 11:24=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> With upcoming replacement of vm_lock with vm_refcnt, we need to handle a
> possibility of vma_start_read_locked/vma_start_read_locked_nested failing
> due to refcount overflow. Prepare for such possibility by changing these
> APIs and adjusting their users.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> ---
>  include/linux/mm.h |  6 ++++--
>  mm/userfaultfd.c   | 17 ++++++++++++-----
>  2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 689f5a1e2181..0ecd321c50b7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -747,10 +747,11 @@ static inline bool vma_start_read(struct vm_area_st=
ruct *vma)
>   * not be used in such cases because it might fail due to mm_lock_seq ov=
erflow.
>   * This functionality is used to obtain vma read lock and drop the mmap =
read lock.
>   */
> -static inline void vma_start_read_locked_nested(struct vm_area_struct *v=
ma, int subclass)
> +static inline bool vma_start_read_locked_nested(struct vm_area_struct *v=
ma, int subclass)
>  {
>         mmap_assert_locked(vma->vm_mm);
>         down_read_nested(&vma->vm_lock.lock, subclass);
> +       return true;
>  }
>
>  /*
> @@ -759,10 +760,11 @@ static inline void vma_start_read_locked_nested(str=
uct vm_area_struct *vma, int
>   * not be used in such cases because it might fail due to mm_lock_seq ov=
erflow.
>   * This functionality is used to obtain vma read lock and drop the mmap =
read lock.
>   */
> -static inline void vma_start_read_locked(struct vm_area_struct *vma)
> +static inline bool vma_start_read_locked(struct vm_area_struct *vma)
>  {
>         mmap_assert_locked(vma->vm_mm);
>         down_read(&vma->vm_lock.lock);
> +       return true;
>  }
>
>  static inline void vma_end_read(struct vm_area_struct *vma)
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index bc9a66ec6a6e..79e8ae676f75 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -85,7 +85,8 @@ static struct vm_area_struct *uffd_lock_vma(struct mm_s=
truct *mm,
>         mmap_read_lock(mm);
>         vma =3D find_vma_and_prepare_anon(mm, address);
>         if (!IS_ERR(vma))
> -               vma_start_read_locked(vma);
> +               if (!vma_start_read_locked(vma))
> +                       vma =3D ERR_PTR(-EAGAIN);
>
>         mmap_read_unlock(mm);
>         return vma;
> @@ -1483,10 +1484,16 @@ static int uffd_move_lock(struct mm_struct *mm,
>         mmap_read_lock(mm);
>         err =3D find_vmas_mm_locked(mm, dst_start, src_start, dst_vmap, s=
rc_vmap);
>         if (!err) {
> -               vma_start_read_locked(*dst_vmap);
> -               if (*dst_vmap !=3D *src_vmap)
> -                       vma_start_read_locked_nested(*src_vmap,
> -                                               SINGLE_DEPTH_NESTING);
> +               if (!vma_start_read_locked(*dst_vmap)) {

I think you mistakenly reversed the condition. This block should be
executed if we manage to lock dst_vma successfully.
> +                       if (*dst_vmap !=3D *src_vmap) {
> +                               if (!vma_start_read_locked_nested(*src_vm=
ap,
> +                                                       SINGLE_DEPTH_NEST=
ING)) {
> +                                       vma_end_read(*dst_vmap);
> +                                       err =3D -EAGAIN;
> +                               }
> +                       }
> +               } else
> +                       err =3D -EAGAIN;
>         }
>         mmap_read_unlock(mm);
>         return err;
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
