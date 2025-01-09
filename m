Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B284921D58B
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437726; cv=none; b=dW2yB0+LOqyop7xH48Xs0GOW0jtUXbluZ12CZsf97i1tRJ9o2pbupwCQJPOWwlAWZHikaFWB/tNusicnk2ydKDmEf7IUFu5hHBnOk9NuESHBYt4NM9BXokZtAMBiZi7c6OvRJ9BgRK2B6GhF7e0n2IQ7cqvieT8h6jFv87qFnS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437726; c=relaxed/simple;
	bh=MGTXx+E61jSsjZDsJpmA7QyJPMxjnQEiuAL0Eyk3rXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeFGBUObC9mCj8mNJXaXEXxUcX4ykHEZSkDPLbofshYt8k1diFxPFhJgZ9Fp0BC1h6daWlG8y7nbLIxmA5XUYQ/z09+pX+cUtVnEiYcjgfozHeOQFqMDPR1Ou5tr8VYxgFI9aBDYCHV3vOZoSNIDSe8pThMv/tpnsm1yN3A8dHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EZBf1ggY; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EZBf1ggY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4679b5c66d0so241071cf.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736437724; x=1737042524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGTXx+E61jSsjZDsJpmA7QyJPMxjnQEiuAL0Eyk3rXQ=;
        b=EZBf1ggYqCnCx1AP8SqNZed9UDPXs4wMo9yzti3hOaNhyH3NsYwtew56ga26I8QnX0
         DWbSqZZTAIWewtDSBHpH0N0i+ZkQZvi3LdPNG2GptsPs/zC78ryAhKxOOQkkd1NM1O2g
         defaLj9UHpDEIOtsmEaqBbvOPh5suHRDRSmmSzxlYsK77bVW9nWnd49+lZRviuar4ZL7
         LT8v29rrn5aMf0eNYRekvLDAefQ8sKNbIo+oooWu+e2SMzWBpKEWhyJh9fGjQGX9nkDW
         /ij/WFo9RD3pfgqddc2Zvlgdey3RRqLukGFYMtyA+tIYOgwZPsEDh5rIB4EgMTHsPBf0
         ByFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437724; x=1737042524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGTXx+E61jSsjZDsJpmA7QyJPMxjnQEiuAL0Eyk3rXQ=;
        b=wNqF/5Nj9jwq7dlRxYVQxtrrFZsSbdBdXBpCuUFlwH+LMVANJIA6TY9GH+SxSE+kP0
         WCkkCsYhky7/TQVBAF/HkBDDf265SIXWE/QeN3I5ryNQSGJcxeeOSsYhFARAqU8FQJuV
         wb2f0dhPpncFaSU2JCR8bw/OEx2Ktzy0g4YXy27KWyynh4x3FvEgrotj5oughptzsUNz
         yvGcwN1TciBBfuyOYGKfeiE/sKCKzZy4O7L89z/NKUqatyPbqEfWHdshfVMpUwZMbiN/
         jB+qVDRdnalqpFQzN3EfD5lNEBYKZQKiuG3If/XvP3skrkFMavdQkrDz1Oy1F9dmZmrf
         MmDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZmtI6OcNcodOIFNjuVM+1JGhCRin30PpwszaPjbcFj+NG0wMRDoH0d7yLnFQteRzgf6MB9QfRv2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzyD7gl+3OGSMOF/p+sxSMTcKvUxn5kzGiBHhkJ7b3JqFp6v+o
	fK/wSoZny0qFjHf9xwqSU6CpgxE6uYrEuJ6Q4tXFfRET2757fyY55meOi5L+BrOw6PIkEgSAXPL
	wg4hxSowzN49CgkMQ/34hKQOqmu9JeLCfXE1P
X-Gm-Gg: ASbGncvZaEWh2hFVvf2Z9GDJKnpjCOWEzjXYY4MchHKGI/nMkvvO6S5/tDjLPbIcgzu
	O+DhuhfHRTSdgJVRVp1ojiVJEdFZ+dzVmP2UjTQ==
X-Google-Smtp-Source: AGHT+IFsHC1fetnJEKN9Ecd/jGB6IaY3DZjjnJMzyD//QxwNc3qFxL8c/M9043JLDFlThJ4jBpXpSSK/o1JwVIjT88Y=
X-Received: by 2002:a05:622a:20e:b0:466:9003:aae6 with SMTP id
 d75a77b69052e-46c7bca52efmr4556891cf.2.1736437723331; Thu, 09 Jan 2025
 07:48:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109115142.GC2981@noisy.programming.kicks-ass.net>
In-Reply-To: <20250109115142.GC2981@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 9 Jan 2025 07:48:32 -0800
X-Gm-Features: AbW1kvZ88mOnvt_PXBHgNOsv7nN4B9aiUi-v0OXXU6Xal0aEkfNK9s-fV9o-jAI
Message-ID: <CAJuCfpFS3M50UGi+zdxoe3Lziv_3vbsSwpjWK=WiCXGqxgE1UQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] move per-vma lock into vm_area_struct
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
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

On Thu, Jan 9, 2025 at 3:51=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, Jan 08, 2025 at 06:30:09PM -0800, Suren Baghdasaryan wrote:
> > Back when per-vma locks were introduces, vm_lock was moved out of
> > vm_area_struct in [1] because of the performance regression caused by
> > false cacheline sharing. Recent investigation [2] revealed that the
> > regressions is limited to a rather old Broadwell microarchitecture and
> > even there it can be mitigated by disabling adjacent cacheline
> > prefetching, see [3].
> > Splitting single logical structure into multiple ones leads to more
> > complicated management, extra pointer dereferences and overall less
> > maintainable code. When that split-away part is a lock, it complicates
> > things even further. With no performance benefits, there are no reasons
> > for this split. Merging the vm_lock back into vm_area_struct also allow=
s
> > vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> > This patchset:
> > 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> > boundary and changing the cache to be cacheline-aligned to minimize
> > cacheline sharing;
> > 2. changes vm_area_struct initialization to mark new vma as detached un=
til
> > it is inserted into vma tree;
> > 3. replaces vm_lock and vma->detached flag with a reference counter;
> > 4. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for th=
eir
> > reuse and to minimize call_rcu() calls.
>
> Does not clean up that reattach nonsense :-(

Oh, no. I think it does. That's why in [1] I introduce
vma_iter_store_attached() to be used on already attached vmas and to
avoid marking them attached again. Also I added assertions in
vma_mark_attached()/vma_mark_detached() to avoid re-attaching or
re-detaching. Unless I misunderstood your comment?

[1] https://lore.kernel.org/all/20250109023025.2242447-5-surenb@google.com/
