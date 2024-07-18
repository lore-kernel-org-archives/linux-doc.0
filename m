Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C7F144306
	for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721322552; cv=none; b=s8+xmzs8DVzqW//26njIQ+V6emUcAMCiVlFawcb4IOgeH5Eg/P91BwpZOD4EqJ8i+ChO5Oems7wGzwA2rorMFrUqo3g5g1MimUYFaQx/GtdL/EOsiGzF5vPNO4WDhwkQ1lOsoIhjY+aehHRsBH/40nR4AaMjyNz4coyGYEdNjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721322552; c=relaxed/simple;
	bh=hfptMg5b01LvLxc2SG4Uz4PY1885pejHBHnSI3jHNo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlHx3yMtyyW0HnHud2DHTxrseBCheJQz1RYBxPXWlEKwLpADkm+UMe532ugTewTIrX5gQ+Ys3jNJCoVDpXBxVX4+YMAQddwETpcRjriTLY3fQDHoWyUaYSTE9ipHDJ0OkBvpTBAQA0ZbK9NMK5zoGrK/IKHIT4II1wmECUDwyXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LmOsclIT; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LmOsclIT"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fb67f59805so6465ad.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721322551; x=1721927351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfptMg5b01LvLxc2SG4Uz4PY1885pejHBHnSI3jHNo4=;
        b=LmOsclITNClWJfccpQJt2d2iHpl/UCf69BGG/qXacLLcSjuk07wmb42ijg/DHol4Wu
         zzaRt3nYlqxI32p6P3fknA9c1Jnu/XObYxmdhrhY+cnHyFFJz8qWMKvrgTMYmwvSPLuE
         7MDiShHq/qqCzvOHCZY+Tb7HyCB0yk+1whAA60XKsDW47S0cCQ3Q3T/7DXV6FBI/DQRf
         +PF+YmJLrKj0iFvY6MQNv8MLcwJEViYdCZ4QPYVB9536ExbIn4vAiqZy4ntmZD6RFhfi
         DAWXSSyCB4AJwuH/TkY1UKengFCJrD3kW9BupQa17aMPlprq0yK/DC7p8FFd91bO3KPe
         yyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721322551; x=1721927351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfptMg5b01LvLxc2SG4Uz4PY1885pejHBHnSI3jHNo4=;
        b=a4AAR5fWhtq3xAqZ05gF3G+MRgCoJo1XGBqGcH+LSWYZtYfx/Ya+sA+eG09Q6rvzWT
         oS4HJTaRR2ye+fj/lHKgXwf1taoIekz7LWByX8wcx11vPwmsB0gkH2SJQiOMGzAAtCWy
         L3kiHLc/iGe0onCG/mls0ZjQF/m89H/ZqeoAfGWUEcEy0k7jjjbinjoOULX7YrOw0Tzx
         635I8WoiXsofoJxHwK35zNieefelM7ZyHC6BNLTOuVrsrKt1ZgQY8qDh5bMJdOjlN/bo
         NXRnRi2/XKoeeCPxl4yobdV4gnRvXq21YsgSFU4TBDbxxZ3WSUbXkEbVZmNuM/WIJdEA
         j9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoBNYe7qsMswY8HtQg0v/2DRn4xB/vCs2OcxeCBjFIMzoMhZfZmPgdzDjPCEhKGNBUt9ZI3Tt7LQ0MIF+eaC5MK/p+KdgNshFs
X-Gm-Message-State: AOJu0Yxop1+kCRsJWm7o8c6M+MU/OGfAkziYx77ECuS9ZmcR6XM3iyLK
	xBkZndB39g1sxNLn0QEOBJ3K+1Cs4z+VLTG1kvqkD/lBfG89v+7OWG6VO1BZVwXO4lKv70U6qBe
	OEjuEPFSQu/vsY+KyOMetceA+o+0qxAv+h4Ky
X-Google-Smtp-Source: AGHT+IFyQOwgVWytrps02GnyGzCKWAzKQb9jdGG6O5HjYS2fonQnaQCgjBSaqq+ZRXTyamSyDlrVjFSIa0H9hip10Ho=
X-Received: by 2002:a17:903:183:b0:1f7:1c96:d2e8 with SMTP id
 d9443c01a7336-1fc5f58803emr2989145ad.10.1721322550399; Thu, 18 Jul 2024
 10:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
 <20240710234222.2333120-9-jthoughton@google.com> <DS0PR11MB6373C1BE8CF5E1BCC9F2365BDCA32@DS0PR11MB6373.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB6373C1BE8CF5E1BCC9F2365BDCA32@DS0PR11MB6373.namprd11.prod.outlook.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 18 Jul 2024 10:08:33 -0700
Message-ID: <CADrL8HVDUG7OSN2ERmmiXeg8eT8D6edoSiqYKsnjAnVbhGAX9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 08/18] KVM: x86: Add KVM Userfault support
To: "Wang, Wei W" <wei.w.wang@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, David Matlack <dmatlack@google.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 8:34=E2=80=AFAM Wang, Wei W <wei.w.wang@intel.com> =
wrote:
>
> On Thursday, July 11, 2024 7:42 AM, James Houghton wrote:
> > The first prong for enabling KVM Userfault support for x86 is to be abl=
e to
> > inform userspace of userfaults. We know when userfaults occurs when
> > fault->pfn comes back as KVM_PFN_ERR_FAULT, so in
> > kvm_mmu_prepare_memory_fault_exit(), simply check if fault->pfn is inde=
ed
> > KVM_PFN_ERR_FAULT. This means always setting fault->pfn to a known valu=
e (I
> > have chosen KVM_PFN_ERR_FAULT) before calling
> > kvm_mmu_prepare_memory_fault_exit().
> >
> > The next prong is to unmap pages that are newly userfault-enabled. Do t=
his in
> > kvm_arch_pre_set_memory_attributes().
>
> Why is there a need to unmap it?
> I think a userfault is triggered on a page during postcopy when its data =
has not yet
> been fetched from the source, that is, the page is never accessed by gues=
t on the
> destination and the page table leaf entry is empty.
>

You're right that it's not strictly necessary for implementing
post-copy. This just comes down to the UAPI we want: does
ATTRIBUTE_USERFAULT mean "KVM will be unable to access this memory;
any attempt to access it will generate a userfault" or does it mean
"accesses to never-accessed, non-prefaulted memory will generate a
userfault."

I think the former (i.e., the one implemented in this RFC) is slightly
clearer and slightly more useful.

Userfaultfd does the latter:
1. MAP_PRIVATE|MAP_ANONYMOUS + UFFDIO_REGISTER_MODE_MISSING: if
nothing is mapped (i.e., major page fault)
2. non-anonymous VMA + UFFDIO_REGISTER_MODE_MISSING: if the page cache
does not contain a page
3. MAP_SHARED + UFFDIO_REGISTER_MODE_MINOR: if the page cache
*contains* a page, but we got a fault anyway

But in all of these cases, we have a way to start getting userfaults
for already-accessed memory: for (1) and (3), MADV_DONTNEED, and for
(2), fallocate(FALLOC_FL_PUNCH_HOLE).

Even if we didn't have MADV_DONTNEED (as used to be the case with
HugeTLB), we can use PROT_NONE to prevent anyone from mapping anything
in between an mmap() and a UFFDIO_REGISTER. This has been useful for
me.

With KVM, we have neither of these tools (unless we include them here), AFA=
IA.
