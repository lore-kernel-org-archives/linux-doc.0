Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFB91BEF6F
	for <linux-doc@vger.kernel.org>; Sun, 12 Jan 2025 17:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736703339; cv=none; b=e8Lskz5KBb0fjzsT1Mpju1fu+Z1o5K+5tpeiJiruL87vlA5YPb9jCSKpvQBoVeUl6zFF4JqH3H2QxmAP3+jv4so1e/kJQRqI/0x6/6M6DnYvvNKGU+CG5Eg25YYOn8FxDGUJQ4cSO56hN+eh2JO9BaI7oz0Z9OidgP1nhmIO/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736703339; c=relaxed/simple;
	bh=+ION3ihCMSrasQLEd19APpd5G2BGVh9rojd8Gq+kTIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuxySnSXa0TrRSMLfe53f+DMOtb2LtzWiCFNJw0+l6agdX6fDMO0sAVVJAfHR+vBO1MQcEKcQ8f4xmdcxabGunnywTmucNYXmYal4g/SXP51OSDl8o1m/U7bJ1owJ6/dRTy9lVGRCHkjRib87euPWg2/wQp8rcbHujgkUT67sHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ta74v7iQ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ta74v7iQ"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467abce2ef9so270601cf.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Jan 2025 09:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736703337; x=1737308137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ION3ihCMSrasQLEd19APpd5G2BGVh9rojd8Gq+kTIo=;
        b=Ta74v7iQUUeNOTzR63Ip1e9tx3NX2R9mlAZVBF+aPU9E/a6CfI+wc1VbABka46f0mj
         WXfgGNBlhZo+44OX1pSWebnw78yvswYLKnhUm1ay7TyhplkcmF9eMpJ+WKp8xPyr+Lgv
         oy7YyRfiUrW78zqlpJqWjEdR+VSYsyya8+K5RLWA1OrmHKW7xDXg8eDfMAfcoxWg3kuC
         7Stp0NhgNMYiZygyP9obTelj0zYZ3BYz3ORAKuAFCA7okf5G1+rDs0/MQ7D2rvUmA1qQ
         4nUz/zawAnu1KPov16+Ng591S5o5cZYE511wf72V96x6pk5ty0AjwbQNTyQ5GQ7AGNgR
         7tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736703337; x=1737308137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ION3ihCMSrasQLEd19APpd5G2BGVh9rojd8Gq+kTIo=;
        b=iBS7bchHcbQGBh3j3Wvnb4R++FGXw1HqNChoK+gXib1KhobIrtmFV6TnkjJash/GMe
         oBU9EyW8qsy/J7SGNghRoOPIkj2xwn1kDuLKxtl41yHMg+ohh6TDsxzcxIR8e0nD9R8o
         8WMMsgEPGlDRorIemHNyxe7mZU1De91R6R63VislE1EPyoMf0KeRUskxY0Ho0IFxwIVb
         hUmKbXNY5sRpfZ3xNDFSmeDrBgGhf9mbN3MnN9j2mIejdSskc3qiBjEVlPWIL/TdqlG0
         MnM/fcUueT6IIU7BY0AREohWjpH5J19gzPorK2raFCZBEFO7wNYh+5zboBsRQ3oqQ6dj
         6svg==
X-Forwarded-Encrypted: i=1; AJvYcCXayJDV5dQDTk/hY9sv5kEOH3w/jRRcGJid31YbaVAugSbtQC7m44VI3ciRaI3cCI8+azsUTZN19dU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTOarx3oeL860Pr9Uwqrx8bTqm1+Adtf4COlW8dOnix5lst5t
	dpOfGgJLlnrBHDhvK6UqlaN/6c2ByDoDr6JL3LnFXvQZxcsoVBzBRCJTVgL8zLQkfdSd3s5z2gH
	xCgsBVC1pQUSBZbOQLeFIRVBXkwxPQtTFdr+b
X-Gm-Gg: ASbGncv2WAjUVeBPSMAms43Po3ZRzDcC/QJxvmNXlMTeRmFOrkK75YV7AUjxojjT4Yv
	C9vrrpuv179wovYKiUGwRGNoxbl/yaKQAjmZeqQ==
X-Google-Smtp-Source: AGHT+IHoxSINx+2fiNlkKp2HO13xmVVraw7w+qFlcY7fPDOqtIzMqgIxOIE7Rx/nv5vzXl7EDXd8ukieRQJ6ZV6BWXg=
X-Received: by 2002:ac8:5841:0:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-46c87f3c822mr8122881cf.26.1736703336467; Sun, 12 Jan 2025
 09:35:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <20250112025935.7mxi3klm5ijkb73m@master>
In-Reply-To: <20250112025935.7mxi3klm5ijkb73m@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 12 Jan 2025 09:35:25 -0800
X-Gm-Features: AbW1kva2mBDHBSmf1-5Mq6xF2AHsTLH26HaRuuzCHTrw8AQ2JneMn0NgAFJp7KE
Message-ID: <CAJuCfpHNdH1oYGoRidTnrWO07-tjR2ebEzzb64=jySw+hkXRKQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
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

On Sat, Jan 11, 2025 at 6:59=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> >rw_semaphore is a sizable structure of 40 bytes and consumes
> >considerable space for each vm_area_struct. However vma_lock has
> >two important specifics which can be used to replace rw_semaphore
> >with a simpler structure:
> >1. Readers never wait. They try to take the vma_lock and fall back to
> >mmap_lock if that fails.
> >2. Only one writer at a time will ever try to write-lock a vma_lock
> >because writers first take mmap_lock in write mode.
> >Because of these requirements, full rw_semaphore functionality is not
> >needed and we can replace rw_semaphore and the vma->detached flag with
> >a refcount (vm_refcnt).
>
> This paragraph is merged into the above one in the commit log, which may =
not
> what you expect.
>
> Just a format issue, not sure why they are not separated.

I'll double-check the formatting. Thanks!

>
> >When vma is in detached state, vm_refcnt is 0 and only a call to
> >vma_mark_attached() can take it out of this state. Note that unlike
> >before, now we enforce both vma_mark_attached() and vma_mark_detached()
> >to be done only after vma has been write-locked. vma_mark_attached()
> >changes vm_refcnt to 1 to indicate that it has been attached to the vma
> >tree. When a reader takes read lock, it increments vm_refcnt, unless the
> >top usable bit of vm_refcnt (0x40000000) is set, indicating presence of
> >a writer. When writer takes write lock, it sets the top usable bit to
> >indicate its presence. If there are readers, writer will wait using newl=
y
> >introduced mm->vma_writer_wait. Since all writers take mmap_lock in writ=
e
> >mode first, there can be only one writer at a time. The last reader to
> >release the lock will signal the writer to wake up.
> >refcount might overflow if there are many competing readers, in which ca=
se
> >read-locking will fail. Readers are expected to handle such failures.
> >In summary:
> >1. all readers increment the vm_refcnt;
> >2. writer sets top usable (writer) bit of vm_refcnt;
> >3. readers cannot increment the vm_refcnt if the writer bit is set;
> >4. in the presence of readers, writer must wait for the vm_refcnt to dro=
p
> >to 1 (ignoring the writer bit), indicating an attached vma with no reade=
rs;
>
> It waits until to (VMA_LOCK_OFFSET + 1) as indicates in __vma_start_write=
(),
> if I am right.

Yeah, that's why I mentioned "(ignoring the writer bit)" but maybe
that's too confusing. How about "drop to 1 (plus the VMA_LOCK_OFFSET
writer bit)?

>
> >5. vm_refcnt overflow is handled by the readers.
> >
> >While this vm_lock replacement does not yet result in a smaller
> >vm_area_struct (it stays at 256 bytes due to cacheline alignment), it
> >allows for further size optimization by structure member regrouping
> >to bring the size of vm_area_struct below 192 bytes.
> >
> --
> Wei Yang
> Help you, Help me
