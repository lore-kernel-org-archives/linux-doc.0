Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232285;
	b=5TQe6O+nSKvM5xy4eB6ORipI1fDSEowpussLIsNcRqrcTjbOldPxbb2QHs1D7Motbd8a
	 /xadANVL1KjULbhphLEgo6qKMcvg1xpZ1fci6F+AtVuVzyfBx4J48JAc7rEqdzVQs2n9q
	 WqoIem4Ggh8RG/aBWmqjjpTQ+9Nto7SDZsNxKofGv9EAosuCTIU8I+us2XQ/wDjKNmlha
	 VHeGKqyzm/wfONT91eS64mLQ3pcO+qywrG0Q4z2c6kmwpXHOG8Z3ekgsL280Zhn+oW5e8
	 Br/eYuzAxUu206eD/82Vzhjp4S3DwtptUfNrxeUHDaGzt0P8nO1LgCgKVFL8UfLdF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
	b=djTS0wnmk7OnAXMH3PnKwQ6Z1df1WjRTEmCOH/YetaXj4t+ZuBvkL+u35YGPTGZtGCaF
	 ccIBqh0aK5RMPTlTmcVZ/psx/qDHUSJJnKXDSnAQ5SAygiSojc1CJPVl3DGaDGxh6dc6B
	 zjumZj6rB2vQ8GqmLg43hSlHhjFbfIEk6r1ZXbnCetbnUgmyBPT1MJegjk7JdO8Db4Pci
	 zne1O5dTE4+O0CpfRLju+9ctl5TdusZkhqGVW+Dc8CPJ7YggrON01qubyj+kPNZjPIJYK
	 CcFzpaV1Bl2u8iUwMkf3LOaTXJ5fB4soOvsH6C4Oqhjof/Evk+qUM0qz+idHZLAND8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BDLaQPpE;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9919A606A31F
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 00:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9919A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BDLaQPpE
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-988c7371716so531225241.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793232283; x=1793837083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
        b=BDLaQPpEQkC/NOGErHzNgMqNEFgiZW+qixJDZ5RtDffvwjsqxm93mYTldZW4Txe7YC
         KOlzFcRPqQr1N7PzdaxoW1U9MQgJBHjgARqwrgxXEZIU7JNfwIwgLxfO92G6pOC4G4rk
         4OSF6jFiqrA40z8orm3/UNdvF1RJjCFi7ClJV0vWr8MykRtBgdBxnizZAivW6aZRN3kx
         l5uvOty6CRBiTWGUrkgmOuKvd2MUI35gla4/qmesv+YfLyi3mwck9NijjEVz8zhSCgxi
         pcgFazOCNQkh0LbGTfZyXdh3RejNnsqgBCJkWvDATwo+Kuk2B2721o1lMZ/ETjyXrhG9
         LPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232283; x=1793837083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
        b=Jhg0O4UOgibZyFhHXznqBp85OBW8BDdHe2dxjvFWIWZpYRMzO6fyRboBHxHyE2JQ5I
         kLXtYMFmXTEmyo5MfPosAtu/XqIDWZFfjw+6FwHWsa9vZwJmg0lEmGMoWkI0KMAu7DFy
         g/hnIFrmiQZ6BPnWYeSOec3QqXpSDzMT/7Qb4q7cIQn5h/qXKbhFWPilXXWplD1yhwQh
         bs082s2SZSV0NMxa6tI8Qb3r+72lfxRe02tTrJJu6fNwdhRRZqVJA8sYYZ91GVMNTFOF
         +ie53qVrLkRcdeYUOfhIEhgGvz9UUexs+jJ64U58zyn8F4NQQewn+U119jgSVlJfs+4q
         6sVw==
X-Forwarded-Encrypted: i=1; AKwUvByzHhSVMpCe1b7sBWGCyDzfBEgLX2I9HEwl/Hr+rXpwzkB2LShtCdCGygMwOudhka8C+PI9gmxBIrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSGEy6FU/aEmLHAur9F8KWu8UK21ENN1tLd23keeNNDmjj0sYX
	X5nxv5zak5mvhLTw1ee8XrwnI1tCB7MyprxDvDe1F9wUyODCMxj5PEr3iPWpsMJ7sVQ=
X-Gm-Gg: AYBFou2qTdECY/RCqeOrS6+Qr9KxBt1CXYuzd0lvN38wRzA4u90SfSgW2ZsgtP2cqPx
	WjeLbxNFW3nKR1KGTdLjqaGFRIDtbIRwHHX5d9NFLIH0E0SdTn9+zlDp1EZMPgy4FS1dhMAAwgK
	B8zjuXnGYTiLAh3S1HS8qzKPHb1qUtxdVdfXZIjD5oc0MFZsbkaC4SpXb/2g6W3njUqH4Ul9SP5
	rvQMzFM2NFjecX4Ub9KLRRdn+ca37h/bJa33fOsev2yBA+MOn+S1Z47PAbB6qnHGbNLfWyuCVEq
	Yl4jAOA5iUdEzyYzv8zJm0JrUXRdieKUxjzui6FeBCzpw7VUSj1NxYSC0yhDTBR1wNkjE/w4URJ
	q3qgsDY1piEn4Fsoj03O/vRRutvoiBC07mJrLLCH7REH8ELpiXBzGNgGze64A4tqrcYuLPiQITY
	rf0A9iBFFKpY1X7t6t+UoLGJw0yGlLhpN+hvxVGmC4ohvaSoalM14eVddgd7sWZo02WAuv9Rxxx
	Gyllfhx81UYeO3wTLCLrrkS7I0+0wxDyLJYIHHwzjkUyxbTGobK/Zqb4gszQ1d+egSYlD/71f5s
	yEBIee+TeGl7R+Izj6BchgnAIatzD7X3dE76Njwg+zP24oBLMziCx6YKY4pQyRGFDq3btQT7agQ
	YQBUIaeNllo8y8VFaJ88lVvqC258g4flK
X-Received: by 2002:a05:6102:3e92:b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7d03a29c54fmr1908368137.5.1793232283543;
        Wed, 28 Oct 2026 17:04:43 -0700 (PDT)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99125931983sm7622737241.2.2026.10.28.17.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:04:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 20:04:42 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auKND0n3LyivCrir@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-8-dmatlack@google.com>
 <179322496574.1894369.544573858973645958.b4-review@b4>
 <auKAlcPN0Lt6Y3Wm@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auKAlcPN0Lt6Y3Wm@google.com>

On 10-28 23:09, David Matlack wrote:
> On 2026-10-28 06:02 PM, Pasha Tatashin wrote:
> 
> > > +/*
> > > + * Whether @inode is on the internal shmem mount, which is used by
> > > + * shmem_file_setup() and thus by memfd_create().
> > > + */
> > > +bool shmem_inode_on_internal_mount(const struct inode *inode)
> > > +{
> > > +	return inode->i_sb == shm_mnt->mnt_sb;
> > > +}
> > 
> > Please fix the warning reported by kernel test robot.
> 
> Will do.
> 
> The prototype for shmem_inode_on_internal_mount() is in mm/internal.h,
> which mm/shmem.c only includes if CONFIG_SHMEM=y, but the robot was
> building without CONFIG_SHMEM. I've moved the definition of this
> function into CONFIG_SHMEM in v3 to fix this.
> 
> > Looking at this together with Pratyush's mapping-freeze series ([PATCH
> > 0/3] mm: allow freezing mappings), I think we should extend the mapping
> > freeze lifecycle from preserve() -> retrieve() to preserve() ->
> > finish().
> >
> > When retrieve() returns an fd, its mapping should still come out frozen
> > and only become fully user-owned/mutable once a successful session
> > finish() happens. That keeps the index -> folio mapping invariant across
> > the entire live update until every fd in the session (e.g. vmfd,
> > iommufd, vfiofd that depend on the memfd) has been retrieved, passed
> > can_finish(), and been finalized together in finish().
> >
> > (Doesn't have to block this series, we can do it on top or as part of
> > Pratyush's AS_FROZEN series.), but I think we must fix it either here or
> > there.)
> 
> Ok that sounds reasonable. Should we do that as part of Pratyush's
> series then?
> 
> Pratyuh's series replaces shmem_freeze() with mapping_set_frozen(), so
> retrieve() would freeze the new file and finish() would unfreeze it.
> That should work the same for memfds and tmpfs files..
> 
> BTW, this tmpfs series does a lot of renames and code motion so it
> conflicts with Pratyush's series. How should we order these?

Initially, I thought Pratyush's patch series would land after yours. 
However, since he plans to separate the LU changes from the rest, I 
expect both series to land in this cycle. The order does not matter; 
whoever lands in liveupdate/next first, the other will need to resolve 
the merge conflicts.

-- 
Pasha
