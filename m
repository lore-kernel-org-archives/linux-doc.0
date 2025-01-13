Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857571FDA63;
	Mon, 13 Jan 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760977; cv=none; b=tqDBbxMpWiTArTFDYB6kT76HoohhJqsUKGa96cEHsgiizNI3SJaNoacH448gvqnjj4pjp2s5HxMicWKPM2kDPShkw5npvv5BoVQEaqFpuO7JlK2TsI1RSBZu7OkF1QSmv1krxqWDYx8jkwudq3Mu3P3KIptk6B1+k29Zzf7l8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760977; c=relaxed/simple;
	bh=RW0IbrWGGhZ+kGsKiV1PoqoKZ43xN3Rb/RvffF98to4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDvz81iRu5GsuMmyVSkvXbXU2cA/rqFoPEIiBHmvNFrxy28r7bIetqXYUU/SmTliz1jmbGD+xroFZhMkDSY3FRP7MutgVatGbgmbXqFWjjrHPtlbKIUvW0oOChl24KP7GuQ/spc9Xe2tw0dPeGaev0rnpm27GTUIRbrNG7VxbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAVeyN3E; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAVeyN3E"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so5758083a12.2;
        Mon, 13 Jan 2025 01:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736760973; x=1737365773; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKymjPp3wDUBMtRWsKLPyBQowq0RQ31ZQwkL7ESbekc=;
        b=nAVeyN3EiyinUGTXTMu/ND5q7EAkDWfUlMVh50UkGixuqugqTgGVabQtuG4MetH/Nh
         yzUAWjayl83p+2lMccNu/bYpdVrttkoDf3LLNW4ElpSxUSPirnu3C4FSVlVG1MNMCd39
         BD3FiwAtwC5sgawGaznCPKuymidFZ6ajYQn8FaA3b1Qqc78Y//9vDgXX3bEUzkZxsxrW
         wKb9AU0tZp460GSvaiTVaXnXI0g8ooaJIL3nBIkzH8yzo/ehSD2u6K9hVFWBb6AWWiK0
         T3YTrTz2hXZ+6hzlPXLBoXDsmkJGsuUPJ38aTd0jbzMvQS7JQMPSQceIDJngMMyXfl2l
         izbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760973; x=1737365773;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZKymjPp3wDUBMtRWsKLPyBQowq0RQ31ZQwkL7ESbekc=;
        b=Gvbcp4RINBJe3L1i1D3WRW0HyAf4ShJccH1AU0273CkhkSJ7wi1rfhZrwlxNHsbHjb
         GXhvEwaNOrdO0CKsGXflfExUm28a0cnhxLl7e4maaGq6GQbs1yQQCfLsAbZo5KI5uNz1
         rpfGFqy9nZrfw2jrlQ3ZVzv+7YiQOzc4eU8nLHVixH1CGbBaXvdDPl2Ak+K6QCpukdnI
         v8LawphTx95vAxd8TvOJ+oBVfxDkVvlt5svH6g0LLWApzcKzG7/UNEtpoNh8cMhM7scf
         uSSKRYPMaGml/N9ITk+a1R0i/niNZu55/Hp+alRwJAcjHOcQBtAMJtvxTqHGaSegk8AV
         N6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUhE9NekbKBpBIZa7yeYyJLgheroafkl3V93hbVyN4jijffokwTxHl1+6xgqw0+a+PS+HBbZK+7zVM=@vger.kernel.org, AJvYcCXg+FMICdPwL+Q42QCcZt6ZJfZZU1K0KEgpj/+/NF67Hq+ok2etHhaoFLH+ZlkeZ2AIcS+aDjgYMuzZhDfi@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8bILjOWLyvm6RCUQSVq68VapnX7QHIxSp1mmMbTgONF9Ar9c
	g3m0/kQZLTty55TyX+63Uef4Affmde9d/DuzRiCGniBsyvah/ttf
X-Gm-Gg: ASbGncvfXszM+3HLlTrV/TGJXXIgijVT9tbIlG5k0+QbaJyvyLevfK2uz10OYp31vAi
	BLLa5p20k52lubIPm6snbnmwyf4CRTuqTDT+hEsUiDnttPCs13QJR2pWTib7niQHN8Zwu47v5fu
	tctbJRoGKusRu/eYjj4zhtVjZ+A2XcSSaQaLuISKGJnEXgBUnmikZnJk4GF2SYk+LO3NvQIAbbk
	nXP51yVVItW/tgfGofdGBvOWgLXuwcZN1tBa6rkthvjvppsjNUrC0mS
X-Google-Smtp-Source: AGHT+IHN3qpmk53tayv+FrYb02RvjHAFDFMQxe7I9AMfQiMhg6tn9/PsELN1xEfTAZ3v5GNb1RTEaQ==
X-Received: by 2002:a05:6402:270d:b0:5d9:ad1:dafc with SMTP id 4fb4d7f45d1cf-5d972e639famr44878290a12.25.1736760972566;
        Mon, 13 Jan 2025 01:36:12 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95624ccsm473199266b.126.2025.01.13.01.36.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2025 01:36:11 -0800 (PST)
Date: Mon, 13 Jan 2025 09:36:11 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com,
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250113093611.hmjmizvt73mrq2y2@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-12-surenb@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
[...]
> 
>+static inline bool is_vma_writer_only(int refcnt)
>+{
>+	/*
>+	 * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
>+	 * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
>+	 * a detached vma happens only in vma_mark_detached() and is a rare
>+	 * case, therefore most of the time there will be no unnecessary wakeup.
>+	 */
>+	return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;

It looks equivalent to 

	return (refcnt == VMA_LOCK_OFFSET) || (refcnt == VMA_LOCK_OFFSET + 1);

And its generated code looks a little simpler.

>+}
>+
>+static inline void vma_refcount_put(struct vm_area_struct *vma)
>+{
>+	/* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
>+	struct mm_struct *mm = vma->vm_mm;
>+	int oldcnt;
>+
>+	rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
>+	if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
>+
>+		if (is_vma_writer_only(oldcnt - 1))
>+			rcuwait_wake_up(&mm->vma_writer_wait);
>+	}
>+}
>+

-- 
Wei Yang
Help you, Help me
