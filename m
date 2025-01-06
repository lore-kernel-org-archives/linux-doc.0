Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5D433DB;
	Mon,  6 Jan 2025 00:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736123909; cv=none; b=FZswfZyJcj372FxTy5kcWes+l/muj2ixGFOkzSRjC66RNubVoqX0zZbl65jAhFamxzx4EquT94TkAMKGARU1wSurk6/zeIEf2CsRRTpUeNotWEkj3INAv44WpKmb/lJJ1+zjKGiCiS11ajJoP21Y0lrgOr1o/zk4P+rSpos0Bzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736123909; c=relaxed/simple;
	bh=buxvvvEb/wkhUWPVZDTzp8suH1opvpSXvHcbkdZSm4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpiVo/q/ruPRwC2vuERr7dlNNcHGy2O433gxK1libLzf8LmWWJJ3KhJuRAj9nUd0pLKpzHFbTggn313H5xSyHH5TpXqVItf4XtPjLUPzFD98eOVQjtEnYais7aMehRKCyGE+X5+UvKBLFa0j5sYviYDGGcpeyt4yJlD0d+VW2q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNqe2c5M; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNqe2c5M"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaedd529ba1so1491905666b.1;
        Sun, 05 Jan 2025 16:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736123906; x=1736728706; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScyDvmN2hvlNSyorVRI/pPT6VvzNA2QQfFXIwD14bAc=;
        b=dNqe2c5MiPw+VfWZ4ZK1YQuKRLlgKnxnBnACAvNf6DZCWo68cxVDYFciE3EDiYFqN0
         nnE9o86ZuEHZ3UdrZZ4MGU3HYkMfJuAIsD2UAoD2xjc7DlLTuUkqMJ7TspcW0j+oFxO/
         FiUeCE3Vlgqj0fEkotiu9QjTJos2GsoDpSKWGiZPYc6ZyYNfSIC0zqrT8od2KVOqZYN1
         484YDTxm15RUjRWr6YDj2ebjHvH0OLN+upDUyExFGpZPINfT43iOq2Jo/VfmTSbdQ4oA
         /yIl87E3HP7DHAH/LwkQvVg1+z8JUJVKInqZotgXne/ExFVsarZgQYqVGIfm4z7jJgIR
         QEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736123906; x=1736728706;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScyDvmN2hvlNSyorVRI/pPT6VvzNA2QQfFXIwD14bAc=;
        b=qXgD40VIzQkY7EuK1KWhb952szJ+HqWm65PwBtt9heM1UK7WrKSVPrasoT8heHPSLu
         bSi1ggaWs7X+MXi6y+GD2NqMW1Nc8/DrXsXFkoeJFWhEX/f2LwjqG6boo6KBVAUJ2/24
         mq2EUk44dzv4aB4uMj01olaXaTnumpM5HeeUx4bz8jXgEQ4ActcBMt9CK0V+9nt4RM9o
         2sHdAidFYLLY9Fyfp40kJK2AfTK48IGSN07d8pmFx7/Gr22vapHE4mhJ6yDVd5yBfH40
         Fvjay7E/ytx4SQ/oHCRpzNlNEcNfMWG5oPjMlXdM2/EEu/JluB01I79jcfjkHM/rwEff
         1LEg==
X-Forwarded-Encrypted: i=1; AJvYcCVF03+dOeidE2LQaCmZ6POFhiLxAbloQFNaBOmePW9cfgq37KhICexC7K20lolXWAqT/LjBxAI1UW65NZ9W@vger.kernel.org, AJvYcCW9Fxli7NDyxExi+AiVwSp//NAKLW+qY/16iGMm+X0APbZjk2SNjKfizlP9NrxDeWOu3KQg/IPT+k4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Mnr+BGhOyjIxsgaFqs8bIQyuzyAgsn+f2T5dNjh5fpjO5WHm
	6CSfrXihJYsgbF8bjZoqCSdTE416cEvXSCO5JiG0U9mZRArI7Qww
X-Gm-Gg: ASbGncssolYRz48Uddq9V+/I26N1sgDSwEg60SJyNxb0JJ0Wo0ww3SVP4jmJTegcWr0
	/nFkauRwfSmcXNmERPL2o7lAUAyT7o6/26v3BMS8/A95RQ09Lr2Vuiw7yl+/K36w7ppBtGqXakS
	mf6qPFEfKNpjTfFV1bAM6KgRVfMYEYOerpvVOSxeyFV3gr8EeWqbubPxCe4D3DWSIEXbNh4kxUq
	GYx3tZpoBksD+dzFqaY7t2Nb0KNLEepg8mK6H6p7ybRWjlOjSiai6rq
X-Google-Smtp-Source: AGHT+IFuMFshYB4c1/i6O6qbKQRnohJMCYNPJsurHUTjRi208uWhTMf1HrBa011c4vtpyq7O1FLJjw==
X-Received: by 2002:a05:6402:430c:b0:5d3:f55f:8349 with SMTP id 4fb4d7f45d1cf-5d81de1cf36mr120588497a12.33.1736123905414;
        Sun, 05 Jan 2025 16:38:25 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066112sm2171123966b.179.2025.01.05.16.38.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jan 2025 16:38:23 -0800 (PST)
Date: Mon, 6 Jan 2025 00:38:21 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v7 12/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250106003821.3gtfxq33fqj4wm5b@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-13-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226170710.1159679-13-surenb@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Dec 26, 2024 at 09:07:04AM -0800, Suren Baghdasaryan wrote:
[...]
> /*
>  * Try to read-lock a vma. The function is allowed to occasionally yield false
>  * locked result to avoid performance overhead, in which case we fall back to
>@@ -710,6 +733,8 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
>  */
> static inline bool vma_start_read(struct vm_area_struct *vma)
> {
>+	int oldcnt;
>+
> 	/*
> 	 * Check before locking. A race might cause false locked result.
> 	 * We can use READ_ONCE() for the mm_lock_seq here, and don't need
>@@ -720,13 +745,20 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
> 	if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
> 		return false;
> 
>-	if (unlikely(down_read_trylock(&vma->vm_lock.lock) == 0))
>+
>+	rwsem_acquire_read(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
>+	/* Limit at VMA_REF_LIMIT to leave one count for a writer */
>+	if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
>+						      VMA_REF_LIMIT))) {
>+		rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> 		return false;
>+	}
>+	lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> 
> 	/*
>-	 * Overflow might produce false locked result.
>+	 * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
> 	 * False unlocked result is impossible because we modify and check
>-	 * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
>+	 * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
> 	 * modification invalidates all existing locks.
> 	 *
> 	 * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
>@@ -734,10 +766,12 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
> 	 * after it has been unlocked.
> 	 * This pairs with RELEASE semantics in vma_end_write_all().
> 	 */
>-	if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {
>-		up_read(&vma->vm_lock.lock);
>+	if (unlikely(oldcnt & VMA_LOCK_OFFSET ||
>+		     vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {

I am not sure it worth mention. In case it is too trivial, just ignore.

If (oldcnt & VMA_LOCK_OFFSET), oldcnt + 1 > VMA_REF_LIMIT. This means
__refcount_inc_not_zero_limited() above would return false.

If my understanding is correct, we don't need to check it here.

>+		vma_refcount_put(vma);
> 		return false;
> 	}
>+
> 	return true;
> }
> 
[...]

-- 
Wei Yang
Help you, Help me
