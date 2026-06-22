Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9E36607D
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 23:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782172461; cv=pass; b=jgqrVqqR5e7Zd7FWvvRxbCfKi7RksojNtlNdkShiadht8kIIUSt+BU2YZebhwJfzv5S4s9YHOMr+rKQiMQ2rHTSsG4Nlx1wBc+t7tq7hH6iRPSddNgwONM8gY6pnr98Ns0kwgRiAiit2hhY67EmhqoFLarMvTIP8zq20ZKStvqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782172461; c=relaxed/simple;
	bh=I1YUlMWYpoFKoByVcCt8Rqs1cgeontbmcE6KLy6U/tc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7CkKAfQWPO1V05HmJDjllaSQrQswxEibGxiYciBUQaNXv7fhLpS4Shl/8UcwxvNWocqEJ7JI/5ba1eiCIBakmkYTlDUReOp8yD7YoTGKIhJhoXq+RBonbDzn9hZHYoBLNRYIfch9c96F1FzIpvICRsL2xeKBXGP2lTkEqA+r9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jPsTpHfr; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jPsTpHfr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c07ea058c0cso828418166b.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 16:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782172459; cv=none;
        d=google.com; s=arc-20240605;
        b=l2KnnbseAy7C5dxC3AV2Sxv8mkcgFQ2s7Sto4cQbEbyA/OGGJmw77seAFkxsozafA1
         dH/I0WbZkWdikis/jWUGC7RGr4bOpy8VmUHTqIRb+LaLnSX/GJwSj1KiS3Ek0SbFh+ey
         vWxyMZ3Tc0xtkZtYhYUnBHwQUNHCr3WgRiA63P/P8BQ5YZv+jHdYh63NdlDcKuISQa6+
         6qFFVfJ0JjmBMfj2Gb04x1meZXOOaPZIJflSr4w0DD7NgSo70aAy8GuJhexIk99efKHV
         NR82I6nRxEYLN1DhEvYr0vowaHFX8MKqxQTMXcvhuc7pjgaLXGCElApNW0oLHREauaXN
         OEUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mnhxRL5NSWx2qm5cF+jOJULziDkVFS523GcKtm3BW0s=;
        fh=kJ5Pwk/M8H/GC9vVUv6ScujraOw4CABairgkjy8Gs4c=;
        b=joIlMLleL27R1Xv7hYrovoGcEA/ZtT6SKx6lex+Rrl3SgeEJOrugI1cbl+kyE3sJ1I
         kdDYX0fcpUO9d4kvXNLXwz6Vse+G1ynSPq90utRXb7B6oaQDsqCr3MqN8LFJxNwq/IsR
         QVmuRpntBJIYD9AFItOGf3MzAyZTo3myYaSThtrdjsbgLXMAFdW8shPDACOFA/OFXtjC
         gXnsNG+2jdNl+paXgn/GKahQDAEAjQdN1yObVevi1RJHYJ+r0rtj+E268S4jT7zX43FH
         +4OdHspIJ9IBkReCwpkxb7LBwcYEV3gfORgbWlU+KIL2UnQvP7KlJaXsdCz4WXEA8Mae
         HfJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782172459; x=1782777259; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mnhxRL5NSWx2qm5cF+jOJULziDkVFS523GcKtm3BW0s=;
        b=jPsTpHfrfh5ppMR+gyIUraMIwJm/OYLJsOd3N6OB9vvTjThH38ksYWY8D2FkYROTyT
         ZgSscTWoUdDnsJQqcFcC/PUIqjc+4bmZymQRLfc0ygApUzPtlp0kouCgEcRg7wTXtuov
         ubH5HACVSgpKbL6ZBAosYe5cg3G+ndkWDi0S5sNXeff0DrhdbBd5SnvLvSCP1ix0N8Bp
         7v2sUOKQ7v9//5QbDiEfzd8xgU7FGkmplZdLsYMwI7oEvh2uz/O0tI6/btHYt+nyrl38
         9Vxnt0A9w3JRt6Yr2k/5pM4l8AqrMV4PPjvsAi7U01/bXYcy4/tk6rrgZfHbYlJV1cQ1
         v2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782172459; x=1782777259;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnhxRL5NSWx2qm5cF+jOJULziDkVFS523GcKtm3BW0s=;
        b=GXWYCNRdrGTd+dWmqPgFoLihkOpGyvR+5HbeMQQF0LDH3QF989YhZEPBL+8kEiJPxK
         KQ1U/kwsVgDQLHesW9M1HM0n8pmK3eyCbr8VDG6xBIotTQrysUc2AxI/S2PEtwZ1PMg2
         c+Gw/8tEvr8ysQWxrS/8zK7/bYni7hDSLmu0aOZkOEeQ+1ky1Gz/cehkCUPj+l+WpmFr
         IeAIcW32+Pw/4yfDWLDPVIV3JApfcKCMvIM0qhCy16KGH6OalCbbkiC/G4ySyoyvDIB1
         fM+eYGTEzVCUkFzzzROssYwjlze3zVBy6oLjXQck3i5mco3aWBH3+qYEqWA84IwW9h9z
         0WgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/z/Lkf5nRz/ffszJ0ZWZy15k5ScrfZKZh3ghnfaZ9FOsAdzRMjNbgHq1yAiS+nkpqRoA9Fe+sLskk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP1PZ2MElmFCoLb03DC2ehncNS1vD0IMBT+wDDa1HFbndIZWWP
	dFcPnXzSWZ98MMHpIA6sqL6UDcudD5++H7OHtRj+/zEXnztYmlck8GcHhr6Kj5O5LZUDotYS6Nc
	Wf3dPlrIpoTG1aLYp2ipU5cnBPXnZeIBb4I2HeSPU
X-Gm-Gg: AfdE7cluyxHcu5zh7m+Jn6jpQcrNIcYDlflvIoHsYneADwuIHIsZIbIaiOTNRm0MnH8
	9nkk6nCZbqf4saiQ5sQ7LPWUogw25jG+mCu1IG+0foWm+WWVFlr6hUIY6BYwZ81HwgduoNCccFJ
	Gw8HwcNo6cXdA1Tvk3ELLU/H3rKDeIS3GSnC9EFUvZLh9j9mh4fIUeGDOw/q1ctpMzY/maWXv55
	W8d2oNmcbIFVpLnGOy5J+xD9SrbXEaEu00pPEKu56EzQ7PIbVQgLb3/oBs70tIKumzul+e5YB2H
	OrKNf5JerLcU67YK8EfvRtuLy7snI3m+67d7u0U3CkrVmHI3xT/mTqrsvWc=
X-Received: by 2002:a17:907:a394:b0:c10:1041:65a4 with SMTP id
 a640c23a62f3a-c1080b8e977mr13124066b.42.1782172458193; Mon, 22 Jun 2026
 16:54:18 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 16:54:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 16:54:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
References: <cover.1780676742.git.tarunsahu@google.com> <48777f4749fa43d5648085dbb2037aa99c144a88.1780676742.git.tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 16:54:15 -0700
X-Gm-Features: AVVi8Cc74PEpV2YXCZJIskraOwZy9-czhUt_HBd1DYeN4YnAJwWFzkRCg6GbGig
Message-ID: <CAEvNRgFEHciT3T9y+qEYRvXhDwfrggoU7Rm=f9hT3OrV+wgpNQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/10] kvm: guest_memfd: Add support for freezing
 and unfreezing mappings
To: Tarun Sahu <tarunsahu@google.com>, Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	fvdl@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, aneesh.kumar@kernel.org, 
	skhawaja@google.com, vipinsh@google.com, Pratyush Yadav <pratyush@kernel.org>, 
	david@redhat.com, dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, axelrasmussen@google.com
Cc: linux-kselftest@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> This patch introduces the freeze on gmem_inode which prevents

Can't find the reference now, but commit messages should take the
imperative mood and avoid "this patch" [*]

[*] https://lore.kernel.org/all/YKRWNaqzo4GVDxHP@google.com/

> the fallocate call and any new page fault allocation. This will avoid
> gmem file modification when it is being preserved
>
> Used srcu lock to synchronise the freeze call, where write blocks
> until all the reads are free. And reads are re-entrant.
>
> Incase fault fails, It return -EPERM and VM_EXIT to userspace. userspace
> must handle this properly as every new fault will fail.
>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>
> [...snip...]
>
> @@ -105,12 +108,20 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>  	if (!IS_ERR(folio))
>  		return folio;
>
> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
> +	if (kvm_gmem_is_frozen(inode)) {
> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
> +		return ERR_PTR(-EPERM);
> +	}
> +
>  	policy = mpol_shared_policy_lookup(&GMEM_I(inode)->policy, index);
>  	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
>  					 FGP_LOCK | FGP_CREAT,
>  					 mapping_gfp_mask(inode->i_mapping), policy);
>  	mpol_cond_put(policy);
>
> +	srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
> +
>  	/*
>  	 * External interfaces like kvm_gmem_get_pfn() support dealing
>  	 * with hugepages to a degree, but internally, guest_memfd currently
> @@ -273,16 +284,30 @@ static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
>  static long kvm_gmem_fallocate(struct file *file, int mode, loff_t offset,
>  			       loff_t len)
>  {
> +	struct inode *inode = file_inode(file);
>  	int ret;
> +	int idx;
>
> -	if (!(mode & FALLOC_FL_KEEP_SIZE))
> -		return -EOPNOTSUPP;
> +	idx = srcu_read_lock(&kvm_gmem_freeze_srcu);
> +	if (kvm_gmem_is_frozen(inode)) {
> +		srcu_read_unlock(&kvm_gmem_freeze_srcu, idx);
> +		return -EPERM;
> +	}

fallocate may eventually go to kvm_gmem_get_folio(), so that would check
kvm_gmem_is_frozen() twice. Is this meant to catch the punch hole case?

>
> -	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE))
> -		return -EOPNOTSUPP;
> +	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
>
> -	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> -		return -EINVAL;
> +	if (mode & ~(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE)) {
> +		ret = -EOPNOTSUPP;
> +		goto out;
> +	}
> +
> +	if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
> +		ret = -EINVAL;
> +		goto out;
> +	}

There's some reordering here. Why not let the validation happen like
before, then check kvm_gmem_is_frozen()?

>
>  	if (mode & FALLOC_FL_PUNCH_HOLE)
>  		ret = kvm_gmem_punch_hole(file_inode(file), offset, len);
>
> [...snip...]
>
> +
> +/**
> + * kvm_gmem_freeze - Freeze or unfreeze a guest_memfd inode mapping.
> + * @inode: The guest_memfd inode.
> + * @freeze: True to freeze, false to unfreeze.
> + *
> + * This API is used strictly during the live update / preservation transition
> + * window to prevent host userspace and guest-side faults from making any
> + * mapping modifications (such as fallocate or page fault allocation)
> + * to the guest_memfd page cache.
> + *
> + * Synchronization Strategy (Sleepable RCU):
> + * To avoid high-contention VFS locks (like inode_lock or
> + * filemap_invalidate_lock) on the vCPU page fault hot paths, this subsystem
> + * implements a lightweight, system-wide Sleepable RCU (SRCU) mechanism
> + * (`kvm_gmem_freeze_srcu`):
> + *
> + * Global vs. Per-Inode SRCU
> + * ======================
> + * A single system-wide global static `srcu_struct` is used instead of a
> + * per-inode SRCU structure to completely prevent unprivileged users from
> + * exhausting the host's per-CPU memory allocator. Because
> + * `init_srcu_struct()` allocates per-CPU memory via `alloc_percpu()`, which
> + * is not accounted by memory cgroups (memcg),
> + * a per-inode SRCU structure would allow a tenant to bypass cgroup limits and
> + * trigger a system-wide Out-of-Memory (OOM) crash simply by spawning a large
> + * number of guest_memfd file descriptors (bounded only by RLIMIT_NOFILE).
> + *
> + * Flag Modification Note:
> + * Since `GUEST_MEMFD_F_MAPPING_FROZEN` is the ONLY flag in
> + * `GMEM_I(inode)->flags` that is mutated dynamically at runtime (all other
> + * flags are creation-time flags which remain strictly read-only), there is
> + * no possibility of concurrent bit-modification races. Therefore, a standard
> + * `WRITE_ONCE` is fully safe and does not require complex `cmpxchg`
> + * synchronization loops.
> + */
> +void kvm_gmem_freeze(struct inode *inode, bool freeze)
> +{
> +	u64 flags = READ_ONCE(GMEM_I(inode)->flags);
> +
> +	if (freeze)
> +		flags |= GUEST_MEMFD_F_MAPPING_FROZEN;
> +	else
> +		flags &= ~GUEST_MEMFD_F_MAPPING_FROZEN;
> +
> +	WRITE_ONCE(GMEM_I(inode)->flags, flags);
> +
> +	if (freeze)
> +		synchronize_srcu(&kvm_gmem_freeze_srcu);

Why only synchronize on freeze but not unfreeze?

> +}
> +
>
> [...snip...]
>
