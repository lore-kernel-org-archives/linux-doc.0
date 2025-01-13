Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F78F7D;
	Mon, 13 Jan 2025 02:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736735152; cv=none; b=RKtRYJFe7EOP49pwkBlY4WdK/QemkzEpV44AXr5DbA0sZOHkUHTEwTKarANsde3p8Oinv4gs8IryndZ368mUnAuIpn9hp5H5PKKjdCE0TEVJDLzgBjMv5OEkcX7eoy0eeYJl+ebwHQRXisCwvHFOcCb28oReg/RrvbfrrfChbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736735152; c=relaxed/simple;
	bh=8Lfy7/IukmS9y4xDTC281a7a6UAMLxyezbyN5vL8jJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUTqu0eJxDSGo4T9v/Rbf7Yg3bDeGXmRop+Qk1STZ7ysWZCsS52M/r2rR53VkeEaTF9qI6xzn3ho+mbb2R7C6D8MxQSMBUgNVU8tVCaden0v4C3yURWIAhq8B5/MEkKA1liZMX84xb3mfK9jlyeKUhvp/QhNrN9+0/l9H+ZUQE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhMxhKD8; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhMxhKD8"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so6354030a12.3;
        Sun, 12 Jan 2025 18:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736735149; x=1737339949; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4lb+QfSWHL8KKGybuGGmCsVvvpYo2IvXm0o1r4zikU=;
        b=FhMxhKD8Vi8P+c0KXMY21B4S9itTfJrZbIUv/dZVnoeX5XkSRrAHArDiVjRccrg/7x
         CXQ3FbDNXv9TyLv/nxsi8XxggNhUTvLvt+r7C44wTWFK/TEtWy3N/kiiLCedqCMZBkjH
         th6zjWCJkCTqfDy2G565kY1bm4tTOJE/nVwJy0N3f2eFirC7CO5QrLP5jRQvm2kQHbES
         IYXHggdQSb6xM4aHrTRRh0JiNiNxPJfi8TFV/USe8CNI3kgNRThjYH4lJ/lAje3e5w02
         GdjEaUMRCjGszSZWC4d6PEgwb/g8U6rnegfhbK22OfVuxV43q+JppGdHutHS0gvEZcXS
         RE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736735149; x=1737339949;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4lb+QfSWHL8KKGybuGGmCsVvvpYo2IvXm0o1r4zikU=;
        b=ZLaFUDP7ibE9azzWWnld+YbZYHjrzPC4eORUIiIPM4sAmZnVwIyYHadzcKizqfyB4e
         /2vMTWqOUPF9/dulBAQPFGp2RFL96rCLHT65LiKB4xFPzlLOOAk0oe/2SXvKveiy3pcZ
         wmO6gFnAPDRzOPIbWxj1ity3wCgBwKcMh5PuipJl4jR14wUb2K8GfF63Atm4Arfpu3Ey
         xBMX+PBeBr0fITnRLID0DBHvvF3yFh6xJHhW1vXBv4u5GDR5BtSezZaouroPF+QSq6Mw
         B2bPivcrSsLV4kJbTXWTI8LgtYl2DKEPZlo9mZSfKsVsskKU0JuBJXxSO+DpJZYjuN0I
         G5ag==
X-Forwarded-Encrypted: i=1; AJvYcCWNDD67JkOxIP2raQculDe7gv4l8sRItAXbejTuOlA+4aq3wJE3Gou0Pujt/6pI+FIMLhi6lpUMpKE=@vger.kernel.org, AJvYcCXiqsCleohOnARg6Dtm6wnNjwtyXf0odWj0JlB3nOU+zhVjW9MTWxcDD+Z7gsV75d3oLoWAzztL0m9hC8Lr@vger.kernel.org
X-Gm-Message-State: AOJu0YwOaIXwvgfuj9OjeXto7pd/p80A1lvRhFSHCBXbzHFc+1VQbHHG
	+M8dtZ8Pogu7GGzzEl0XbZXWPhZmVkBCztVOf8dCYFs5Jsq8VVWr
X-Gm-Gg: ASbGncty6PzUaSrkPEmHWkzb8FLuhaKJh85yZymryScoQHQFRBkoChusFSEZ1S8f4UV
	EJeip9J9iBZv/bU7osEATLIiKwh4dRTIKZioCprgay+A26wQGTHQTRRyUs3k1D0mBqOMbht9BcL
	V5SRS7LLFzjv1oCRRlsxbp2zpUxMQ+0JRh+KtTBllONbM+vcodNh9pi0EVYSJzCF5ShyUEqc+iS
	98BU81y1ENC+J9y0+9DvDvyWAp0+EIG5H1+GRzivb+7/NZ5xBrahRrJ
X-Google-Smtp-Source: AGHT+IHjDyrVCKsVILO4yM+wN3gRcPke8VBqF/Yeobph5JHnYAuc5aqseR5hJi+yqKszkElAUDgGoQ==
X-Received: by 2002:a05:6402:4305:b0:5d0:8889:de02 with SMTP id 4fb4d7f45d1cf-5d972e4c4f8mr17442788a12.22.1736735149171;
        Sun, 12 Jan 2025 18:25:49 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c2fffsm4454849a12.43.2025.01.12.18.25.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 18:25:47 -0800 (PST)
Date: Mon, 13 Jan 2025 02:25:45 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250113022545.56e2qaggdgqzlukz@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250113014729.ms5sdfnhynlamgrk@master>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113014729.ms5sdfnhynlamgrk@master>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Jan 13, 2025 at 01:47:29AM +0000, Wei Yang wrote:
>On Sat, Jan 11, 2025 at 12:14:47PM -0800, Suren Baghdasaryan wrote:
>>On Sat, Jan 11, 2025 at 3:24 AM Mateusz Guzik <mjguzik@gmail.com> wrote:
>>>
>>> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
>>>
>>> So there were quite a few iterations of the patch and I have not been
>>> reading majority of the feedback, so it may be I missed something,
>>> apologies upfront. :)
>>>
>
>Hi, I am new to memory barriers. Hope not bothering.
>
>>> >  /*
>>> >   * Try to read-lock a vma. The function is allowed to occasionally yield false
>>> >   * locked result to avoid performance overhead, in which case we fall back to
>>> > @@ -710,6 +742,8 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
>>> >   */
>>> >  static inline bool vma_start_read(struct vm_area_struct *vma)
>>> >  {
>>> > +     int oldcnt;
>>> > +
>>> >       /*
>>> >        * Check before locking. A race might cause false locked result.
>>> >        * We can use READ_ONCE() for the mm_lock_seq here, and don't need
>>> > @@ -720,13 +754,19 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>>> >       if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
>>> >               return false;
>>> >
>>> > -     if (unlikely(down_read_trylock(&vma->vm_lock.lock) == 0))
>>> > +     /*
>>> > +      * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() will fail
>>> > +      * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
>>> > +      */
>>> > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
>>> > +                                                   VMA_REF_LIMIT)))
>>> >               return false;
>>> >
>>>
>>> Replacing down_read_trylock() with the new routine loses an acquire
>>> fence. That alone is not a problem, but see below.
>>
>>Hmm. I think this acquire fence is actually necessary. We don't want
>>the later vm_lock_seq check to be reordered and happen before we take
>>the refcount. Otherwise this might happen:
>>
>>reader             writer
>>if (vm_lock_seq == mm_lock_seq) // check got reordered
>>        return false;
>>                       vm_refcnt += VMA_LOCK_OFFSET
>>                       vm_lock_seq == mm_lock_seq
>>                       vm_refcnt -= VMA_LOCK_OFFSET
>>if (!__refcount_inc_not_zero_limited())
>>        return false;
>>
>>Both reader's checks will pass and the reader would read-lock a vma
>>that was write-locked.
>>
>
>Here what we plan to do is define __refcount_inc_not_zero_limited() with
>acquire fence, e.g. with atomic_try_cmpxchg_acquire(), right?
>

BTW, usually we pair acquire with release.

The __vma_start_write() provide release fence when locked, so for this part
we are ok, right?  


-- 
Wei Yang
Help you, Help me
