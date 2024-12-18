Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03161175D34
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734543417; cv=none; b=MrQwVDZdJA+sBt7BtwG+5VszcS3AHrz2yTRL4x8BNw4CsLLLEb4YnE7xM00s32xw2LSbSq2fCrPZKtAtjidHdZ6paUTetTVAof3pZMLb95qrK6iNSiMEJPmsKqnomdYkr02GMWTIjH0WRm8xkgUwS3GnKfjxbwtExZmlz5iMMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734543417; c=relaxed/simple;
	bh=dY87XxgGfpQhHXuPXxmzefwbhUu7kOySDxBkV2RmVUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfCwwNfWxyZ8ByG8tzrL97WT1SwTevaN7EDPc6xGs5+pnLYibufsLzcg7ecrNJjjppuNYjHAq87o54vQ+cBt0VtTrgQ6w8Ou8dGwdNit9Q9sCKPQX6ut2gz1AYScQYzBvldsXh6s9OcS3Gcbi9yBBK8V0RqJ/TOiTaXtA1cwue0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e3SVmz2w; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e3SVmz2w"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-467896541e1so329601cf.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 09:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734543415; x=1735148215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0vfn6bhlwxecxuXb6dYP6hPbz693aH5SVOsaZLPny0=;
        b=e3SVmz2wKalsDHkN5N6uH4aYYRFwmrgIPa5ApHRyTVO4cwG6pcQMF8LIKEYXsCs1HI
         ZUPog2ta4ugIwTN0TjRf6gKi4L+phQ5Gc+6+yjB1gAmFSGe8EbbtDRE1/7o0Qd4xrYhF
         UNHXkWfAmr4F7zypkSpx8rCaJB2MrNPmiemGZCbIn2Q3XsY35pEgIIUP7+N6cxhHZ8wT
         AB4UW5Nvslc064KNqTFbmhv1UoXzzLuLgZwVjgH2hulQ1VOjXUGSMwcrRDFunj+MrnGg
         cNvkZUtC69M62SJnIaJb1oxN+xn/yemgaHD34Y4tHiqZaPgItSz/A5bsH+BC6pUgZE4G
         7o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734543415; x=1735148215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0vfn6bhlwxecxuXb6dYP6hPbz693aH5SVOsaZLPny0=;
        b=JfuFV35e81/7rcmdTC//IE88HM+N0APKJ/MNrnWabtXNc1+/zroWs47zs5HScaAAnQ
         LKyeyRRlvNHpWQVlEq8vIpHguAGCtYY2KBc5eDN+m0xmLpAfLYNRls1pmmj5WpQI0z01
         2N/JAQZSMOpFAsA8rR4KTvJt3REGmxmYhFGiHgjJnXHZSQwu5dDONBn4G2Gzlsoh4Q07
         dgOeQLfrKkFppTSaH5wiuvFWN7tA60GKjHkiKlHMUWZoI5ItHmCsYDHjxAQl7CmLCKH8
         xPczPNBX/CYiiCdTZbmkA/DKHcDV+ttCYSakwBPcWxxXQ5/rtAiWiNkon8A61wP2r4e9
         RDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyzrZ9ljL8ufjymTLD/kCgrSr/TexLWVHOjpRn1wTJUvkh4QKGqv63rchPhCgDagVFdXxuXf4HBr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/gO3O+kZVl0GjAP9sEs4fvnVNuSJ134d9lJJsZMhncntPgGs1
	ji99Zq5HHMyDkqnBm7n4c1EhRdkxlyopje2o3lZL4ZADOhoEGgoOrHslvTLqFm6Lh3B+cuF2Ape
	lTgS4wsaiBAsgNHwZzEjqdQVbxlJt2BiW/i6r
X-Gm-Gg: ASbGncv9P79UlUfHFlq9CQzaGc5UKSM7IyEwTkGdgKqaQgtXknWct7O9HXO6mqFoR/+
	cD8OwMT5NmQ6AiXyD7Dcdtk9Ru2C1c2Vqi8GJrfZIYROfn++3KGvhgrLPjV49vfaqqxgU
X-Google-Smtp-Source: AGHT+IGMu+Fj74Kmd9s7J7Dznm0MZkBkIafyhPdHZUPGuFhyoczRa/3F4QXVJ+UN1W0v/f6cjbq7NN7ZQU6azKiRO70=
X-Received: by 2002:a05:622a:15d5:b0:466:8618:90df with SMTP id
 d75a77b69052e-469090c3bfbmr4631431cf.2.1734543414563; Wed, 18 Dec 2024
 09:36:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net> <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net> <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net> <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com> <20241218161850.GG2354@noisy.programming.kicks-ass.net>
In-Reply-To: <20241218161850.GG2354@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 09:36:42 -0800
Message-ID: <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
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

On Wed, Dec 18, 2024 at 8:18=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Dec 18, 2024 at 07:50:34AM -0800, Suren Baghdasaryan wrote:
>
> > I think vma_start_write() should be done inside
> > vms_gather_munmap_vmas() for __mmap_prepare() to work correctly:
> >
> > __mmap_prepare
> >     vms_gather_munmap_vmas
> >     vms_clean_up_area // clears PTEs
> > ...
> > __mmap_complete
> >     vms_complete_munmap_vmas
>
> I'm unsure what exactly you mean; __split_vma() will start_write on the
> one that is broken up and the rest won't actually change until
> vms_complete_munmap_vmas().

Ah, sorry, I missed the write-locking in the __split_vma(). Looks like
indeed vma_start_write() is not needed in vms_gather_munmap_vmas().

>
> > If we do not write-lock the vmas inside vms_gather_munmap_vmas(), we
> > will be clearing PTEs from under a discoverable vma.
>
> You will not. vms_complete_munmap_vmas() will call remove_vma() to
> remove PTEs IIRC, and if you do start_write() and detach() before
> dropping mmap_lock_write, you should be good.

Ok, I think we will have to move mmap_write_downgrade() inside
vms_complete_munmap_vmas() to be called after remove_vma().
vms_clear_ptes() is using vmas, so we can't move remove_vma() before
mmap_write_downgrade().

>
> > There might be other places like this too but I think we can move
> > vma_mark_detach() like you suggested without moving vma_start_write()
> > and that should be enough.
>
> I really don't see why you can't move vma_start_write() -- note that by
> moving that after you've unhooked the vmas from the mm (which you have
> by that point) you get the sync point you wanted.
>
>
