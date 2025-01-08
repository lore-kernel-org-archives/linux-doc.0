Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD21FF61C
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 18:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736361894; cv=none; b=jh6tvM/DmJpEUUfIcq5eTRF+1QFMvWhb49AtqdwG1vhFCM2o5ziEs3uOOaGdDhbCTNA/vZ+N0hd6Ib/z2S1GyeRP05L6EdvDhnW/2wf7h6v4hzwu1QFSbNr8fxXABpk6KF+Cs5JCen43AbK6ID56ut/+XknW26CZ9vRctEKoTdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736361894; c=relaxed/simple;
	bh=wnNXpbhyNwqWJLpKxproE1/kJYxyfgxK3iF+68CQzjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zpa5VoalPePyf+cSkCjZEUna9s1fD9jLcj1aKrRjs7dZaXN2DinDUtN6cOe8eRWXuBucUM1pOyFpBvP0jk73Hg2T2L8XTN2xWZNL7RM9HLzxhc9HzbME2ri7WG6Of30R6BiwswA+ERj353LolOLhZj5gY+ruNW5Q+v0zG/sovzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DOuKj7v3; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DOuKj7v3"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4678c9310afso15491cf.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 10:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736361892; x=1736966692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnNXpbhyNwqWJLpKxproE1/kJYxyfgxK3iF+68CQzjE=;
        b=DOuKj7v38LVMKJR2zAHQjyGZ3V1EFFvSHCNvfHtr1QIAezsFBvUcIJD6tor/qVhwPk
         UBejuuqFEzsRcAKh+oVtjc+KDWwVdk2ixdJB0aImZtZgBjrXSSL+D0CLbXH5B7N9DQzc
         92DoGLeYdVoVYSajcC4/CqRLcRuYlCBGLNh9ppN7BlJVe1XjN6U3/W4TXgzoIhfi3lk/
         9FsVqqZSVhjlBu2X/YJCBg6JCU0eh0l4PvY4Sx9WiJXgHlD4gke/9t09mYkoiU5zuaI4
         cZ21p5We77jVt0ZwOBLxy9Rx41DLoHskM7DZg7JH7Qonk/v2BdfyVnq037KhL1OleCA6
         zO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736361892; x=1736966692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnNXpbhyNwqWJLpKxproE1/kJYxyfgxK3iF+68CQzjE=;
        b=EOeoMqTVWSlgSKWhicE5+993dkiQABynvAnPS1+6TEb69ptQ/uxV/HLUQn2EGgqGBx
         WoUm6WZ8WQJO3GJAloVbnAoGBvd7cg5YZtf75AXmzuDbggUtEFYAdjUPTUxY8z9/wG4w
         7m2sF6NWPikl1+Fi/GNgVIjAMy5kODYRZSynBnJU8/yJXW370Dfa8e5Y6QJOHowqmcEt
         5Ab2AS6Zo0fMB7QdsRRDQ6YqVPWRbZ90HQ7HV/MFMo14eUv3zmMJx6db7zER4tuCqWS0
         91jVrJBIsGH1jJesEu4WGcsK1IAfQDN1pHdrPTU7Lp0SZL+aR9IcIdZ3sStHajdOrwKb
         SJjw==
X-Forwarded-Encrypted: i=1; AJvYcCWSsyzFJNMLIWuClzKMKnxmPlMtkoGAsK3sEI8jmRUBf5c7ARzqb6Y25FXnui6V0b24porx84JT4UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YymDgpa14GGXEdWn1WLvu16JmG6DRxnzx4HHtQXYs/JQXEjjCVb
	a0N0FrSWwHnyX4aJgyoMWKsqIx7ac1Pp+JCcanmUpZgwB8SNPDISGu6jiVyN0XHVPgO2eT5jrop
	q/3RemKKcvq6P2v78ixnUgjTfT4OQVWQF/mEt
X-Gm-Gg: ASbGnctGSfzT1nllIMq/cMmDTTlE5o14VU9IxQ1D81xjq/sVvoKGii96qpCXKDwvwV9
	Js2uqqrwbuEMLI0iVB0YFO8IntB47fGZbWksBGygFjRkUob9c3TpHOkAndastQgdjf7vb
X-Google-Smtp-Source: AGHT+IEiT25r4zaPYjs7EApupiu3gAbk5yx9BHepynrH9N0vhldxsBjDR/6bMNk5v72iixf203/gTJw4z0A21rcSMWI=
X-Received: by 2002:ac8:7fd4:0:b0:465:3d28:8c02 with SMTP id
 d75a77b69052e-46c70cb7681mr4832691cf.26.1736361891470; Wed, 08 Jan 2025
 10:44:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226170710.1159679-1-surenb@google.com> <20241226170710.1159679-17-surenb@google.com>
 <5bbc5573-4a10-4c89-bc69-6cf6117be915@suse.cz>
In-Reply-To: <5bbc5573-4a10-4c89-bc69-6cf6117be915@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 8 Jan 2025 10:44:40 -0800
X-Gm-Features: AbW1kvYF8IwbD9gyfW8gY7iF95gJMwWhtwOqJogiE6ao-SlOl9enC8UdLjJ2kuU
Message-ID: <CAJuCfpGXShhwxDaGOtAcSZrdH6J=O6RGcuR8tN3Ax0OVMQUupg@mail.gmail.com>
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

On Wed, Jan 8, 2025 at 10:21=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 12/26/24 18:07, Suren Baghdasaryan wrote:
> > To enable SLAB_TYPESAFE_BY_RCU for vma cache we need to ensure that
> > object reuse before RCU grace period is over will be detected by
> > lock_vma_under_rcu(). Current checks are sufficient as long as vma
> > is detached before it is freed. Implement this guarantee by calling
> > vma_ensure_detached() before vma is freed and make vm_area_cachep
> > SLAB_TYPESAFE_BY_RCU. This will facilitate vm_area_struct reuse and
> > will minimize the number of call_rcu() calls.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> I've noticed vm_area_dup() went back to the approach of "we memcpy
> everything including vma_lock and detached (now the vm_refcnt) followed b=
y a
> vma_init_lock(..., true) that does refcount_set(&vma->vm_refcnt, 0);
> Is that now safe against a racing lock_vma_under_rcu()? I think it's not?

I think it's safe because vma created by vm_area_dup() is not in the
vma tree yet, so lock_vma_under_rcu() does not see it until it's added
into the tree. Note also that at the time when the new vma gets added
into the tree, the vma has to be write-locked
(vma_iter_store()->vma_mark_attached()->vma_assert_write_locked()).
So, lock_vma_under_rcu() won't use the new vma even after it's added
into the tree until we unlock the vma.

>
