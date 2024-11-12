Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D250217F27
	for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731441121; cv=none; b=bgzNJ8nFmbAZkx3KqkXg5YEyEf5R6BuPpsIY1CyXLOvDk/WszSU+vHohPDnhw4MaD1m/X4pMn0fzvTX6PPT28+OL9MjfcOWh2Pz3yDMuftR74runU8oNKdce5lEihmkLFtPR94GZvLq0lZeX1rrjzqlgQ9bqJ/rSLkaVKlXm8Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731441121; c=relaxed/simple;
	bh=cuSl46Z9K48sQguDicGT99gG9ngGrsn9DoXLZYO3cKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fcns7VnL5W8KlJOFjrw6E/gflTiNF1rbGEs5Lx/K5mVgY4maDtu4oGRLdPJd/i4WmlssU8+WeBLHxxCCi2Nw8k/jQPA2x5xcUke/mSZZgmxH9Mm0AG+qRTqZVRud55y7NIBNzQJbsNdhR42BinhTVLHL3D018kOb8YXA1n3ti7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K6akB4o2; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K6akB4o2"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-460a8d1a9b7so37921cf.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Nov 2024 11:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731441119; x=1732045919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDNBm/U0yVHZV8qUr/3jUbrM8ULh8NcvU59R50o8V1g=;
        b=K6akB4o2mvio+bQETnxGG4IGjWeSO0Rwt3FRnvQEv350ZUujQgCdCIWnEnzeHNeKKY
         d5Kqai/hd+0qw8yroJOW4kcNHWeAeNlgW3eYUT5U7FJ0HdbmVDSsCPjaZ3H8zdu5ylPH
         mUxNo9YU2Iv0vNdltj1C5yuBZxiTASQfzO95ZKytpiL7atFyDEKlKxv1m4CSkk0t4tyd
         +6tWGlajqrSvNRx6RDzSPQPKueLzSZshk4ljemP+jOfvKkULFw6lV8+Y4K3l55FDhE28
         D5+rhPkTrCjtxcHlWFU+7hUPKbUr/qJ4pzqSO/ZJlp22NlDrScZSBQGdpd2PNsoswkt0
         oDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731441119; x=1732045919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDNBm/U0yVHZV8qUr/3jUbrM8ULh8NcvU59R50o8V1g=;
        b=SBZaBeaI1zVL2+6cWOsHuCpm12TAhvxzMigunVWaQAGQOJt/OBOeH10Loz7Q1xszYT
         CjDLPK1c2NRGAQbBnnqt56VWmHYd+dydaCPbh/33Ma/PByID+v9swZYrOCho3Oust8fp
         KyLMGVGPr8PgcEQRMF4LVVNau6gYV426ONf03qsJrnEfxX7hDxm0+Nz/FM/Z3zuZJYoQ
         at7kAWnMRWZ+ya7WurEx+JxX2YeCC98Ha3iBSWQq8+HhrsMf0hF3Y6Mxirtji9hDp/lp
         pWTFrHMk4SpYAvGUAW18KaAgyYj4IxONfHRPOhj1Xb/UPsQfnxERm9gTThRG3iD+pWXk
         UUAw==
X-Forwarded-Encrypted: i=1; AJvYcCWRFIutTQw+r05xBqRAx7bGoFpXkPk+1OyJbV2kLtwjhN1NBtXC19nHYCN4Ia/ejwY0wU0iz+ijzGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUYAQaTpr1pl+qsZhl0PgOvHwezIc4i1SGIdMSfDf+MFwF9opz
	PEDczKalOzNV9CsXadlHoIywTiNW2FJJrKbdeEXr8YCDV8Tou/itAUCtXc6XWg7biCfF+QUWLEG
	Zk228wwj2kMEADgWc/sq/PKSSr2CEvkb7aFmW
X-Gm-Gg: ASbGncs4ChVVFHkmpqUj42l9SWePxYDHoPdQTy995nwtDzp7JbuB61tKSF3R0HYPFzB
	08K0IFCLqRDjwOge3EOn6431+cOcNEmG2zGZCFgNdwmtZ6uPwZztliu5KMOX+xQ==
X-Google-Smtp-Source: AGHT+IG02KzRz0I4R7IHawM0fVL6bMMsHycSuvnA+0xsEOeEU7+UlfzUSrWR2D5DsFWXSW6GCTA5mbmd8oPsAM4avhk=
X-Received: by 2002:a05:622a:2a94:b0:461:3e03:7388 with SMTP id
 d75a77b69052e-4634be3aa39mr101821cf.25.1731441118826; Tue, 12 Nov 2024
 11:51:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112194635.444146-1-surenb@google.com> <20241112194635.444146-6-surenb@google.com>
In-Reply-To: <20241112194635.444146-6-surenb@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 12 Nov 2024 11:51:47 -0800
Message-ID: <CAJuCfpHuPfkq4Js02gvAPy=g4mB+55hR9VhXsiTa6bv8uXXNCw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] docs/mm: document latest changes to vm_lock
To: akpm@linux-foundation.org
Cc: willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, 
	oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com, 
	peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, 
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	minchan@google.com, jannh@google.com, shakeel.butt@linux.dev, 
	souravpanda@google.com, pasha.tatashin@soleen.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2024 at 11:47=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> Change the documentation to reflect that vm_lock is integrated into vma.
> Document newly introduced vma_start_read_locked{_nested} functions.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Sorry, forgot to CC Mr. Corbet and linux-doc@vger. Added now.

> ---
>  Documentation/mm/process_addrs.rst | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/proces=
s_addrs.rst
> index ed74685ffbf2..c8935509173e 100644
> --- a/Documentation/mm/process_addrs.rst
> +++ b/Documentation/mm/process_addrs.rst
> @@ -675,7 +675,11 @@ RCU critical section, then attempts to VMA lock it v=
ia
>  :c:func:`!vma_start_read`, before releasing the RCU lock via
>  :c:func:`!rcu_read_unlock`.
>
> -VMA read locks hold the read lock on the :c:member:`!vma->vm_lock` semap=
hore for
> +In cases when the user already holds mmap read lock, :c:func:`!vma_start=
_read_locked`
> +and :c:func:`!vma_start_read_locked_nested` can be used. These functions=
 always
> +succeed in acquiring VMA read lock.
> +
> +VMA read locks hold the read lock on the :c:member:`!vma.vm_lock` semaph=
ore for
>  their duration and the caller of :c:func:`!lock_vma_under_rcu` must rele=
ase it
>  via :c:func:`!vma_end_read`.
>
> @@ -739,7 +743,7 @@ keep VMAs locked across entirely separate write opera=
tions. It also maintains
>  correct lock ordering.
>
>  Each time a VMA read lock is acquired, we acquire a read lock on the
> -:c:member:`!vma->vm_lock` read/write semaphore and hold it, while checki=
ng that
> +:c:member:`!vma.vm_lock` read/write semaphore and hold it, while checkin=
g that
>  the sequence count of the VMA does not match that of the mm.
>
>  If it does, the read lock fails. If it does not, we hold the lock, exclu=
ding
> @@ -749,7 +753,7 @@ Importantly, maple tree operations performed in :c:fu=
nc:`!lock_vma_under_rcu`
>  are also RCU safe, so the whole read lock operation is guaranteed to fun=
ction
>  correctly.
>
> -On the write side, we acquire a write lock on the :c:member:`!vma->vm_lo=
ck`
> +On the write side, we acquire a write lock on the :c:member:`!vma.vm_loc=
k`
>  read/write semaphore, before setting the VMA's sequence number under thi=
s lock,
>  also simultaneously holding the mmap write lock.
>
> --
> 2.47.0.277.g8800431eea-goog
>
