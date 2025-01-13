Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410D53D994;
	Mon, 13 Jan 2025 01:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736732856; cv=none; b=c9SQS8YA5OF4LyS0N/9wGWCtS5QwUkpxke1xIMAqSGSnpHH6l4AKKCqYDpwb+6dLhcgL2bQKgL/lJoy9I7JQjhrjAn/fNrhhyF+ouqDTTrNfYoAZIHsm+2XPBw3Sh0hoKLfjtXXoP69ggacW9C+gaSoNeJENCN4RqP+dkeRhdrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736732856; c=relaxed/simple;
	bh=2sYAOzysH4reXsitAEPnCi9UpyzVpZx3llrJTcfD4dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laqvL2JZ8Cgqb2ifRd+fuRzDc7id0suqIwuwNtVkM0RU5stoN+ZbS/001TL8hlE4NWTunA85jSR3m8uK2wF9m0Vpw3GeaKIVAMRPRqvRzQN/iWdlXqUQVNGsLlTRBMFM6BNbfCfZybh5wBwpk5knIv8kg0ynQpy9dxhPPxYXO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1yPH3Ld; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1yPH3Ld"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab2c9b8aecaso512893966b.0;
        Sun, 12 Jan 2025 17:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736732852; x=1737337652; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2q3eg2wOXFrgqi2Nz726h6b3xnrqpDXRd+fF7QvymjY=;
        b=D1yPH3Ld2vv0y5BYlJ7fdH7ydqKRY/BV/3YUIc7TEHgncGeAv259BudzfP2jDcVtcu
         dDpUth8I0f+gCP7SEmNzAimRTcMCVCzIalaHK9KOWbcDwIz5YX2Yfpq+E/fJI0Zmzvaw
         rp4G5zSv6ZTi70XvCcWHlKol1o3ZnoguPwNySrGdOosOjXLrV4ppEFDJqxTQ7wtMv9LN
         D2fcRHMqMDzUkxnxs+k6pzclyCRCI8uKVmkKSKVDSuFvfPV7WWkJjkp+UAJg8X/UH8vc
         oGWgJP1I6oTW2Qk2WQYqERY1m7yPNCR0020nTcbEUA0XBMPnrp2b4RpWNJ3EKXUEb9Be
         eBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736732852; x=1737337652;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q3eg2wOXFrgqi2Nz726h6b3xnrqpDXRd+fF7QvymjY=;
        b=n2Xdz74L3/MyhbtBjzAusKayUHHsVMwideejm6+Q3huLYpXb1Rgvy2HtI0fGS2Od3U
         KP4VeVeHqWCw8pWOSAKJfr4vmfDUlyezgTIo9JnjhdbO9VpD0ovhDDUXwdiapPBXi7wQ
         hJe5BYeAsILkqSutQzVk7zqJYTJVMkj4QeX4b8WGnTQc7gYtFOwqE9g4LVWt0QFsP9ea
         OVRor5w9YUgo1AaY2kyAJ6fuJFgAgZBxD/Rj+Q5sosWwvaUsyqMbv/MzluFnczrnBrB7
         H1GxBOiwOjV2AvOwpgVswp86XifsuG9gSqAn7k6edyGXnr0RKREsoYtllgreBQdvLCBY
         Tg5w==
X-Forwarded-Encrypted: i=1; AJvYcCVi943Zd1b13v/8kZi9Z25HOnyLYueOT8RT+eeq2EwB/bvgXp9ik6rUslSCWnRnTHv8tYUnqCnqHWw=@vger.kernel.org, AJvYcCXlgUvCWdKwvGkx/78d7OupfN3GvmdMmc+tngZRcXQeaROSU/r0VlL1U9hUGxj8MTLrsFAi4ELS2e5WUizU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8OA2VFufjyzDghxrR/rJMg2gqO2fbD83WYZWDWXrOAJne0UD8
	ibQYleQ1OvyG7AnFZlh17duT4orkGcfbVDukTRZ8zI7n29cECsaw
X-Gm-Gg: ASbGncuxJczp2hR6r7Z/RIGgTJhUifn6ScK/2VS5DdLkRaCGYbhdVmZL7gpoNIArFTp
	SHLZji0RJJ8iQz2ObpbRQzBhtG4VgF8BblFAMwqpaYNtGBCtsQjss7asKeYrCKdwOBB0CUQ+tdt
	rXkRZCKsbTmDoKl2SB7S6dY7uFzSuAM86LPccX3yKUVo3818gOYKPVh8Aof4fOmlxrz9oM2ndSa
	D2WUNkc9QLt1mZVBCjxaw2rYgYDAyX5SKj2KuTIaSFqvlSMOjMD5MDR
X-Google-Smtp-Source: AGHT+IF1M62OwdYusr98DprkJhSZCaxMgffu8BXUtDKfpuWMW8yfJ3xMwXwv94WNxtXFU0DMhC8IVA==
X-Received: by 2002:a17:907:7ea2:b0:aa6:7737:1991 with SMTP id a640c23a62f3a-ab2ab16a902mr1742356066b.2.1736732852312;
        Sun, 12 Jan 2025 17:47:32 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c906004fsm435421266b.30.2025.01.12.17.47.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 17:47:30 -0800 (PST)
Date: Mon, 13 Jan 2025 01:47:29 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250113014729.ms5sdfnhynlamgrk@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Sat, Jan 11, 2025 at 12:14:47PM -0800, Suren Baghdasaryan wrote:
>On Sat, Jan 11, 2025 at 3:24 AM Mateusz Guzik <mjguzik@gmail.com> wrote:
>>
>> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
>>
>> So there were quite a few iterations of the patch and I have not been
>> reading majority of the feedback, so it may be I missed something,
>> apologies upfront. :)
>>

Hi, I am new to memory barriers. Hope not bothering.

>> >  /*
>> >   * Try to read-lock a vma. The function is allowed to occasionally yield false
>> >   * locked result to avoid performance overhead, in which case we fall back to
>> > @@ -710,6 +742,8 @@ static inline void vma_lock_init(struct vm_area_struct *vma)
>> >   */
>> >  static inline bool vma_start_read(struct vm_area_struct *vma)
>> >  {
>> > +     int oldcnt;
>> > +
>> >       /*
>> >        * Check before locking. A race might cause false locked result.
>> >        * We can use READ_ONCE() for the mm_lock_seq here, and don't need
>> > @@ -720,13 +754,19 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>> >       if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(vma->vm_mm->mm_lock_seq.sequence))
>> >               return false;
>> >
>> > -     if (unlikely(down_read_trylock(&vma->vm_lock.lock) == 0))
>> > +     /*
>> > +      * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited() will fail
>> > +      * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
>> > +      */
>> > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt, &oldcnt,
>> > +                                                   VMA_REF_LIMIT)))
>> >               return false;
>> >
>>
>> Replacing down_read_trylock() with the new routine loses an acquire
>> fence. That alone is not a problem, but see below.
>
>Hmm. I think this acquire fence is actually necessary. We don't want
>the later vm_lock_seq check to be reordered and happen before we take
>the refcount. Otherwise this might happen:
>
>reader             writer
>if (vm_lock_seq == mm_lock_seq) // check got reordered
>        return false;
>                       vm_refcnt += VMA_LOCK_OFFSET
>                       vm_lock_seq == mm_lock_seq
>                       vm_refcnt -= VMA_LOCK_OFFSET
>if (!__refcount_inc_not_zero_limited())
>        return false;
>
>Both reader's checks will pass and the reader would read-lock a vma
>that was write-locked.
>

Here what we plan to do is define __refcount_inc_not_zero_limited() with
acquire fence, e.g. with atomic_try_cmpxchg_acquire(), right?

>>
>> > +     rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
>> >       /*
>> > -      * Overflow might produce false locked result.
>> > +      * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
>> >        * False unlocked result is impossible because we modify and check
>> > -      * vma->vm_lock_seq under vma->vm_lock protection and mm->mm_lock_seq
>> > +      * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
>> >        * modification invalidates all existing locks.
>> >        *
>> >        * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
>> > @@ -735,9 +775,10 @@ static inline bool vma_start_read(struct vm_area_struct *vma)
>> >        * This pairs with RELEASE semantics in vma_end_write_all().
>> >        */
>> >       if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&vma->vm_mm->mm_lock_seq))) {

One question here is would compiler optimize the read of vm_lock_seq here,
since we have read it at the beginning?

Or with the acquire fence added above, compiler won't optimize it.
Or we should use REACE_ONCE(vma->vm_lock_seq) here?

>>
>> The previous modification of this spot to raw_read_seqcount loses the
>> acquire fence, making the above comment not line up with the code.
>
>Is it? From reading the seqcount code
>(https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/seqlock.h#L211):
>
>raw_read_seqcount()
>    seqprop_sequence()
>        __seqprop(s, sequence)
>            __seqprop_sequence()
>                smp_load_acquire()
>
>smp_load_acquire() still provides the acquire fence. Am I missing something?
>
>>
>> I don't know if the stock code (with down_read_trylock()) is correct as
>> is -- looks fine for cursory reading fwiw. However, if it indeed works,
>> the acquire fence stemming from the lock routine is a mandatory part of
>> it afaics.
>>
>> I think the best way forward is to add a new refcount routine which
>> ships with an acquire fence.
>
>I plan on replacing refcount_t usage here with an atomic since, as
>Hillf noted, refcount is not designed to be used for locking. And will
>make sure the down_read_trylock() replacement will provide an acquire
>fence.
>

Hmm.. refcount_t is defined with atomic_t. I am lost why replacing refcount_t
with atomic_t would help.

>>
>> Otherwise I would suggest:
>> 1. a comment above __refcount_inc_not_zero_limited saying there is an
>>    acq fence issued later
>> 2. smp_rmb() slapped between that and seq accesses
>>
>> If the now removed fence is somehow not needed, I think a comment
>> explaining it is necessary.
>>
>> > @@ -813,36 +856,33 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>> >
>> >  static inline void vma_assert_locked(struct vm_area_struct *vma)
>> >  {
>> > -     if (!rwsem_is_locked(&vma->vm_lock.lock))
>> > +     if (refcount_read(&vma->vm_refcnt) <= 1)
>> >               vma_assert_write_locked(vma);
>> >  }
>> >
>>
>> This now forces the compiler to emit a load from vm_refcnt even if
>> vma_assert_write_locked expands to nothing. iow this wants to hide
>> behind the same stuff as vma_assert_write_locked.
>
>True. I guess I'll have to avoid using vma_assert_write_locked() like this:
>
>static inline void vma_assert_locked(struct vm_area_struct *vma)
>{
>        unsigned int mm_lock_seq;
>
>        VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
>                                          !__is_vma_write_locked(vma,
>&mm_lock_seq), vma);
>}
>
>Will make the change.
>
>Thanks for the feedback!

-- 
Wei Yang
Help you, Help me
