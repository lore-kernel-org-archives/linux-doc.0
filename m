Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E861E1AA795
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736363847; cv=none; b=SwXgUqBfX+uNBJVM37awgdmqXmg3WIHMWP+CrY0UX4MrqCpJkDjq+dyotuEFeldj75ZT75YTBmX9NcAk8P/92dwXDzD2vY0Mr99QgPm1bE4z7bUO8L6fobEJez5tEj1y36ZwFA05d7jToOhjUF9r8pvkR8M16/hDMxtuANKXTz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736363847; c=relaxed/simple;
	bh=b/Q7TOvf8WLVwTE4niLudX/QD/arpX2ry+yQCDwFIS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZhJ33YTex9fl0iJTDHkdxARPUNuv6wAnw37K6bd/xVrAqC6Zwpg7buhYehH5TAc/ieZyopdBOrO1EXeWoxdkJ2E0oW3Gg/h0GuVwsYqKsN2Zg89oyKSf7Vr1cjqKPd3Bi8FjI+TJjhkJXMXeQnOQ4Mj8SonvoUNpB1jDTa0HIQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M2NNm9Hd; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M2NNm9Hd"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467896541e1so32071cf.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 11:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736363845; x=1736968645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuDJhrl4BaQcccQ0ggv6/6Artahh68C0TXyt6JOc41Y=;
        b=M2NNm9Hd50RkRF+zCR4gxbB6x9pqOHgPZ36+LLbPySaJkyazfgcb7XpOYYYmW8+Zjy
         FgIzDHX5HLnI96c4e48NAqCSomPAgM4pqb+h0wBJ+yx7mWspz1qMPkZ+6fSCR4dp+LFE
         lujfH4X7E/M4uK/Iwj0/LvwTM0X8HdcqrbgFfSpEde6jgMK2A9C0hWD65Q5oh9UfkG6F
         iN6TNzbo4bWiUAoWiStPpZegwLTZejmQtN1DJjGKnH2pwZge6aneoSsoTruTx/U0iznh
         hiIH2IIyw0TJ/clruReYhJjd2CFa7nUGXFRzhRT+0pIOM2C3Vs5EbGzczh7tZnUYcrsz
         JLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736363845; x=1736968645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuDJhrl4BaQcccQ0ggv6/6Artahh68C0TXyt6JOc41Y=;
        b=IoH0yZJrRDfCaVO6XAonsia9cWUi0e59vy4YvuZS0vTJT+gNgRvqeWuF3lkTFwP4L5
         IgVvPT8erAco1H5dApExnrjwhy/Gr9y4L0CA0p6V3ZbU5kPkpU2AfGtwKZstBvZn+iHo
         enGPwUpnf6E1VkQ7cOroGZLvQVmfem9B6hgzdHO83ala+erUPJGviRD2xKTgky/QzKG6
         jEBvc/JvoRUWDpnhUdewbaBxFnHjaLkC65Yc2Ijs18OH8l84xWRh9MjzyuFMLLAtRKCP
         HfxdYX9719/YQ903lgU3H7wh2cr+gSi3WN69oWw5dVV0DvFrMhi3LcRBkJMgLrPB17O3
         191A==
X-Forwarded-Encrypted: i=1; AJvYcCVAf9o1U7W/2FLnLTXPixTIWpE1VfyacA3laf9V2SsRkuHyXboqdRaanaocoiQS+h8x5VugAJq5ws8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFs5QiHoj/VC/HfvQix48wxhyDno8iE20Y/+fzjXpXuVvDcagI
	jaLiKk0q3phqXtQ17cqlyDxJdRXpI+mPAUyXXl5fcFifvTnlU8vtw7UMLa9QRa9oJq2a9KmMkXN
	E6/ezxZbFhCq7VCZagwCbvL9xBWasFm5DjAIR
X-Gm-Gg: ASbGnct7teK71jrwYdQkREo628Ap6q4okAzpw8L+9xbVZ+7kt3qLN/Y7R179N+GtjTe
	1m4pywcdmjHl8OSVqtZBh2NcsL8iVuC3eQ6MrRhVtFIK7ZlHUqo0wxdRh2JDh7szlsrw=
X-Google-Smtp-Source: AGHT+IEWKfjb2sJGpu5As1nzg8K1rKZqtSGnRBmo21D1OvbVa57GrwHS6ccA8uzqF1PCvrQDPTvyug79TWwkzzBUD6c=
X-Received: by 2002:ac8:7fc2:0:b0:460:4620:232b with SMTP id
 d75a77b69052e-46c7bef3f7amr141631cf.28.1736363844616; Wed, 08 Jan 2025
 11:17:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-17-surenb@google.com>
 <5bbc5573-4a10-4c89-bc69-6cf6117be915@suse.cz> <CAJuCfpGXShhwxDaGOtAcSZrdH6J=O6RGcuR8tN3Ax0OVMQUupg@mail.gmail.com>
 <22c002b5-9aca-460b-90fb-772adb9e5f61@suse.cz>
In-Reply-To: <22c002b5-9aca-460b-90fb-772adb9e5f61@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 8 Jan 2025 11:17:13 -0800
X-Gm-Features: AbW1kvYUlotPCa6SD_1FT8EQdIWNRV6GJbNS5R6FvwKXbg9KHLyiDGnzc2umO20
Message-ID: <CAJuCfpE=W4RUwj7yosa3wWzi=EbLdts=1VHV1f-Wy04ZAc9UDw@mail.gmail.com>
Subject: Re: [PATCH v7 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
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

On Wed, Jan 8, 2025 at 11:00=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 1/8/25 19:44, Suren Baghdasaryan wrote:
> > On Wed, Jan 8, 2025 at 10:21=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> >>
> >> On 12/26/24 18:07, Suren Baghdasaryan wrote:
> >> > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> >> > object reuse before RCU grace period is over will be detected by
> >> > lock_vma_under_rcu(). Current checks are sufficient as long as vma
> >> > is detached before it is freed. Implement this guarantee by calling
> >> > vma_ensure_detached() before vma is freed and make vm_area_cachep
> >> > SLAB_TYPESAFE_BY_RCU. This will facilitate vm_area_struct reuse and
> >> > will minimize the number of call_rcu() calls.
> >> >
> >> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >>
> >> I've noticed vm_area_dup() went back to the approach of "we memcpy
> >> everything including vma_lock and detached (now the vm_refcnt) followe=
d by a
> >> vma_init_lock(..., true) that does refcount_set(&vma->vm_refcnt, 0);
> >> Is that now safe against a racing lock_vma_under_rcu()? I think it's n=
ot?
> >
> > I think it's safe because vma created by vm_area_dup() is not in the
> > vma tree yet, so lock_vma_under_rcu() does not see it until it's added
> > into the tree. Note also that at the time when the new vma gets added
> > into the tree, the vma has to be write-locked
> > (vma_iter_store()->vma_mark_attached()->vma_assert_write_locked()).
> > So, lock_vma_under_rcu() won't use the new vma even after it's added
> > into the tree until we unlock the vma.
>
>
> What about something like this, where vma starts out as attached as thus
> reachable:

Huh, very clever sequence.

>
> A:                      B:      C:
> lock_vma_under_rcu()
>   vma =3D mas_walk()
>   vma_start_read()
>     vm_lock_seq =3D=3D mm->mm_lock_seq.sequence
>
                           vma_start_write
>                         vma detached and freed
>
>                                 vm_area_dup()
>                                 - vma reallocated
>                                 - memcpy() copies non-zero refcnt from or=
ig
>
>     __refcount_inc_not_zero_limited() succeeds
>
>                                 vma_init_lock();
>                                 refcount_set(&vma->vm_refcnt, 0);
>
>     - vm_lock_seq validation fails (could it even succeed?)

It can succeed if task C drops the vma write-lock before A validates
vm_lock_seq.

>     vma_refcount_put(vma);
>       __refcount_dec_and_test makes refcount -1

Yeah, I guess I will have to keep vm_refcnt at 0 across reuse, so
memcpy() in vm_area_dup() should be replaced. I'll make the changes.
Thanks for analyzing this, Vlastimil!

>
>
>
