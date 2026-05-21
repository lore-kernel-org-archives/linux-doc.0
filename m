Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF743F23D7
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373784; cv=pass; b=d0Jl/wLoxXyfxUqGjVF8s9oaqCQQ9AXcNh4nPQOksDjbZhxbr4WmEmsAdFIamyAcuYp8tGToJSgsr2K+3r7Z0RhaqGl8iYwRsp9RCC1a8GxON0s/KvU9xiXKd+4LgSfjLvTYIFloG6FyFg6i1WQ8+4f5ohKFdQJa+4Ez8ReZG3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373784; c=relaxed/simple;
	bh=yfN1Pt92cq1NUORJuQ82dwA8T7lKFnYQEXa3cFZE1Ms=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIpve9CSeZj0tz84HrJQ6tnULCfCCtAxYZSB9Rjl3xm/FB+Uq2NZnNImdKqCvnGwpj0k9E7kaPqiiU91plzfjofjBzOWN/JmxjgxhHsmbqzt1EuHjTj/41wfeQhxxTf1eH+L/Fk8NhH6o9hDlN/M4FiOY4aup+oLh+esw69zlxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=le21tZ+U; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="le21tZ+U"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95ce0cf2d4bso3741887241.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 07:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779373782; cv=none;
        d=google.com; s=arc-20240605;
        b=kF/ieUr40ebKoZ+1Ei1ZQQdBk5lR2/ucw8XxlW0WxhDVgzR8h9DmwugsecsZGEkqDN
         vxfh4garjXNaPOvNVblRBExfsC6FAYpRj20YMANKrTQQHxIa7FUWqpi/9bNHLt0gqPWD
         QomuLIpO/CmzqnBHJ3o8RpzsLHhtsgeNZXRXGAWWeuFSJNiXXZcwyb/gy9sbpZCyUzor
         eNEDbHJ9R0JKjATeBC1+gkteYHhMfqNoLOn8sZMBQEztiuUIFrggkuz3zOi7vgjyi7bz
         noOkk0fGn7I6WweyqsvK78Lnea6OpIN+1oj934SUKoo/sAbFfGavEQl3sLiGkgzyURg2
         GE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1Wo6mylBSliDlwCJngQfhikHW93XVCjTkYwG+w8Z6n8=;
        fh=fQzNVVSmQiW6Y/7ty8No0zs1yfirPHg5Y2OwkzojYvc=;
        b=bi5m0x/4cl1E6TnCQj9BbOgEhxOaQBWk4iduD2HGcRAQ5cZVQA3sX8okVEhlhsTcjh
         1m6t0An68pZ7voiiEb1IfjpoR8hmheTtKchVmq4CclC+pFxKvmrZEY+RLUySkOq8aLZ+
         X/giypNNRdxVdygCYPbp/FFN1vay5R8KdJB2sczHllZUwpnBjxDILmmq1GhC85cz0QO/
         ZVSDbdACNLI7SytAT1F7/jYi56i9r1YEM4WwxL9pxmkg6zu4XIUNQp0a3WHlONns/fDo
         QtfoajLRDxKFwy7/tmpxPcwi7MMdtEwL7SmfkcMNo8oRx8WyEAEgBDW6l2Q9O8R2VWtu
         NniA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779373782; x=1779978582; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Wo6mylBSliDlwCJngQfhikHW93XVCjTkYwG+w8Z6n8=;
        b=le21tZ+U3piSAAxzPQPJj86h5c4+rd0rTY7u/h3q6eLIH+cBQKhijkuxZC0A/I6VOV
         HPMxVj+qYtrL/Ss1JyE3UDKPEGT2Wr8zRfUmq5iPOYMMp+qxbi/39szQNhcuiYegHnfy
         EAEm0g8W4q+wusEdsiSRugSCtbTQMVwbE/8V/ZHGsTK7svQBiH7fJfJqWuxhOO9HCq7J
         BeRt92daaoVhNs7A3CD74hB6ksX2h9ee7iPozSFb/BGNrO1p14+IpwVBbJXOXrQO2YJc
         Vr6NPcHp5qofbGHOC1nZxLF9lbgv8eXgJLHRSM5cKXx/wfYxBG4f9PZO5dVwix0GCnz4
         ssQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779373782; x=1779978582;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Wo6mylBSliDlwCJngQfhikHW93XVCjTkYwG+w8Z6n8=;
        b=ZFgxHdMyFYP2oqN10mb1wmCOpeVtLf8210niRd4iU+Vuql9arAzCFLqNHan22l5tsc
         Ns16kQpU2PfTdWX+t+tnTxtcY8FPpOorwCOlVpbn3hbUoFkUVcUs/nMPLkyjiTdtS+Oa
         XJHKRlc2+pbaCf7VQtWlTOTa9wwaeTowMjH4RJNlRnmbticyTgASk0J0Vqfi5L7Yziw/
         ZQRGAmz3Qn5xfdQTDykIztAFS+SX0DUCmDiL4stOzCTGZ45H82HRSFMJSFNR+GjlJQa8
         LdNJnqbsWIhYzy2OC4me/bk1hVjnK0mE0hJ0tOhgCTB3XQtzUhtXQbvegz9KJzH+DZhI
         PW3A==
X-Forwarded-Encrypted: i=1; AFNElJ+2d+RV7WO+KtsmihCV1wFnhGph5cqF4aCYeuVDGIcANxUyTorMnVkNSr5yktXm2ztotu16p+MoqUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzry7sdbRP/pfWBmlJjlrZva+k7XrifGtA+R7LqKhTN9bPXUI3
	whdoa4PcHqgmVpyU3IQZUtGxtdt8ONSY1EyekAOyQ6nu3EE59VkgFAqB3CZr/Q37JFzxUTryAMX
	S3oXYO8xP064m/76LFanKC7Q+IkCFInA+0lATSuBz
X-Gm-Gg: Acq92OGBEZOpOoa8zyEIuaCoLMplQG5e0qLZuNowJNA/GWAe6iPT8FnTybFQU9ztmyZ
	toJUTd+woxC4PcufbrFsGmLe91VmpGI1qikIvUzGovsDk5VQ+rFoP98GeVpNAQN3BQFdtlwfqZO
	+Xl8s/y7KhsyVPa3Z9dsIomhcAhSVlPRKjEjUGbwKakwfNifVJEj2w6+BhAkwdeJo16p6hVWbX8
	CyGDwOSrwoqVM9zyo+jxDIwOTbRDKW9UvCk65amcHi5Y/2afrxHFHKiLb9rvi1AqDjLSWlDiS4j
	gKvI1lMoFyfpzUHZ7qq72HvMcTuSepNy/OHWFq/v5I0MCg3XzA==
X-Received: by 2002:a05:6122:3110:b0:575:9f5:ac57 with SMTP id
 71dfb90a1353d-5841d681791mr1479571e0c.4.1779373780196; Thu, 21 May 2026
 07:29:40 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:29:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 May 2026 07:29:39 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ag8JIlHjohAOC3-g@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com>
 <20260507-gmem-inplace-conversion-v6-5-91ab5a8b19a4@google.com>
 <CA+EHjTw-cUM=FrJevtSDtR7K6MwUfGfOx21LMFDn7DAy5bFzYw@mail.gmail.com>
 <CAEvNRgGQvMdDmVfbk42EY_PGN0ybTp-x21Zj+pg_X1mk9iCRtA@mail.gmail.com>
 <CA+EHjTzLCD-dU-euZKgzwyEr2ecPqFDNutcaHm2fCDGA+MHVXA@mail.gmail.com> <ag8JIlHjohAOC3-g@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 21 May 2026 07:29:39 -0700
X-Gm-Features: AVHnY4L1QQsQd0FYhhV2GOCZxkOSXAeihTuLPqsZRThJ8u9A5XK7N3qOGhZF0xk
Message-ID: <CAEvNRgEZ9vCKkoMC11tVrueAonGWH2x6OeaYYxXGEj2gwHUaKw@mail.gmail.com>
Subject: Re: [PATCH v6 05/43] KVM: guest_memfd: Wire up kvm_get_memory_attributes()
 to per-gmem attributes
To: Sean Christopherson <seanjc@google.com>, Fuad Tabba <tabba@google.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, May 21, 2026, Fuad Tabba wrote:
>> On Wed, 20 May 2026 at 22:44, Ackerley Tng <ackerleytng@google.com> wrote:
>> >
>> > Fuad Tabba <tabba@google.com> writes:
>> >
>> > >
>> > > [...snip...]
>> > >
>> > >> +unsigned long kvm_gmem_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
>> > >> +{
>> > >> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>> > >> +       struct inode *inode;
>> > >> +
>> > >> +       /*
>> > >> +        * If this gfn has no associated memslot, there's no chance of the gfn
>> > >> +        * being backed by private memory, since guest_memfd must be used for
>> > >> +        * private memory, and guest_memfd must be associated with some memslot.
>> > >> +        */
>> > >> +       if (!slot)
>> > >> +               return 0;
>> > >> +
>> > >> +       CLASS(gmem_get_file, file)(slot);
>> > >> +       if (!file)
>> > >> +               return 0;
>> > >> +
>> > >> +       inode = file_inode(file);
>> > >> +
>> > >> +       /*
>> > >> +        * Rely on the maple tree's internal RCU lock to ensure a
>> > >> +        * stable result. This result can become stale as soon as the
>> > >> +        * lock is dropped, so the caller _must_ still protect
>> > >> +        * consumption of private vs. shared by checking
>> > >> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
>> > >> +        * against ongoing attribute updates.
>> > >> +        */
>> > >> +       return kvm_gmem_get_attributes(inode, kvm_gmem_get_index(slot, gfn));
>> > >> +}
>> > >
>> > > Doesn't this imply that all consumers of kvm_mem_is_private() should
>> > > validate the result using mmu_lock and the invalidation sequence?
>> >
>> > Let me know how I can improve the comment.
>>
>> Given Sean's context, the comment is good I think. I would quibble
>> with the the "_must_ still protect" phrasing being a bit too strict.
>>
>> Maybe just soften it slightly to acknowledge the exception? Something like:
>>
>>   * lock is dropped, so callers that require a strict result _must_ protect
>>   * consumption of private vs. shared by checking mmu_invalidate_retry_gfn()
>>   * under mmu_lock to serialize against ongoing attribute updates. Callers
>>   * doing lockless reads must be able to tolerate a stale result.
>>
>> That aligns the comment with how KVM is actually using it today. That
>> said, this is nitpicking. Feel free to use or ignore.
>
> Hmm, I wonder if we can figure out a way to consolidate some documentation,
> because this is _exactly_ the same pattern that x86's host_pfn_mapping_level()
> deals with (see its big comment below).
>

This would be great, are you thinking an actual comment or something in
Documentation/?

Perhaps we could iterate on this a little with me providing the newbie
perspective. Do you want me to take a stab at writing something up?

> There's also the stale comment in kvm_invalidate_memslot(), which, stating the
> obvious, speaks to the memslot+SRCU side of things.
>
> Maybe it makes sense to to find a central location for one giant comment about
> how how MMU notifier events and memslot+SRCU protections work?  And then refer
> to that in paths where some asset needs to be tied into MMU notifiers and/or
> memslots+SRCU?
>
> [*] https://lore.kernel.org/all/agcbWe8s9lmPuJwG@google.com
>
> [...snip...]
>
