Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745C0253F09
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290486; cv=none; b=q+tf2CMkHmVcS4eaq1AvzKNGICwBYg/1zyQm6p0FInxkm9EyZwrHUv5q7E8p5DK9kArmnUfpAyo9FCP89N88OoGAzOjjTiA1yelCBE8/UqUvCfa+hBl66fQs3CxEgCtl2yfon7DSoAHK4uR8G/X9mQVQYt/Z3qCohK/0VMSVzt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290486; c=relaxed/simple;
	bh=0ZjWyRdQG+9H46Kso5hG0mLJW41kpxg0H0tqPAoUZ34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI+3iidPoPe4E1+iS+fnz89WgwsQd8n4RejLB5rXiKqL8H34tV5Vm8ChSzfnh9dPIp2rwthOCk+FTXvmUk5FsQNk4BBHXJLFXRgXfR0uZx8vB334zJpYRABgN4uP/zVdbWm0AoGY/wWdi0fn3s8qKAgg0hGjQ1qIEp/jWCQzwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=qT4H+Yp7; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="qT4H+Yp7"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4718d989c1cso39571101cf.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 08:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1739290483; x=1739895283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f00g8h93qQX8OTMUbXqv3cBNa5BjAh6ZTXb5qUHVm6k=;
        b=qT4H+Yp7f/Eo2FIggH3X8Ta/uV5EuyiPrixzrsHS3YwAr3zWE6dQfdYn5rLUeHJ9U3
         kJXtTw8/vMEFJViZZOgWGjBm01ZuVnE2iClUzZYTV9RWv+r7B5nBW8tvOEDWPkULPMcI
         QztiGhjyv8mDft6hHgikXc6jrLs18HnxN49H0rqR6hJ2QAb8uBJdDOwDzhGTNZnA+Rvu
         gliEML/kE31LeX73TLGoTLljg7mAy8BYj8oJqUbCy0Ym2Ts0PcI4rioC7a6nlJYPCgpH
         /PGsAeacB2SEFxHKE0N5l7p2h+41Ok6WcBpd7Ggp+vGfK3Fi2GdeRUjE9khYwiYsIkzX
         ouJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290483; x=1739895283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f00g8h93qQX8OTMUbXqv3cBNa5BjAh6ZTXb5qUHVm6k=;
        b=gBeMvel8nOaqV4zMSbDpxJ+AJW9U0QSnLK7/ioHFL7OYZPS8NJxnBcslAgwmlMCeMI
         YJmQnlHacwDPFx3DNRtViZTWHs/x3o5hqAMtyHoAMd79uVYFdHOIcm0FVLgTH5wPa6S0
         M422UlVgcerpQUr+n0Z/5vyrTVKmKFSLEMfQYp8NeNeOE709qaPaT40LoGi/ejTPcbOS
         4JM1eY8hCW0CRbMM9QV8KvOkKFTcDADSoa9DngNbojHQW7TXyizrBbvASkrvtqB4iWee
         +G1WDs/48sP4KyL6ZqZPIbXp4vnEdCrQKeeq3V+LFbox3yM4I/pjpQzeYM6M/7mnV2nh
         BBSA==
X-Forwarded-Encrypted: i=1; AJvYcCUg74KYip9QFUN7rxC6zCU+A90eW7OH1JEgApZlNGJsagkueM78o22dwOdqYEEtxn1eovz+jK8faWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIoTV/T4nEN6vGXKqVAVmrNWc1t/WrzQ1ugYcnwuGQAF9t+p75
	k+8qNwNN5+GFG74eid+Yalgo1SI9McOGpzFGDRkGcqj7T1sqS11T6svWhU919MPo24orBHPrcfe
	Lg2lj9T04MihjtKGHNXiDbm6wEbagTOMhZADnPA==
X-Gm-Gg: ASbGncsE3vr8G2SKZcQRDuTkMHJdA+OlRq/dwkyO+UTsXGrgR71cWnw+pSm8MX/B5Kj
	O327Kp+Ptbh9D9ch8JwgXD0rwg47DwiPpe4e/eslRcABG4PB1SJZJ3+qhRBWKOOt/wpgLhw==
X-Google-Smtp-Source: AGHT+IFV/2SwK8xAi9MTHEKrLCagsybkvEOxgGEB7IziCVbPaPZ5quI5gxUrWQ8mdomSEUM9RDcaJ8/FU9MUgrz9PW4=
X-Received: by 2002:ac8:7d86:0:b0:462:c14f:d13f with SMTP id
 d75a77b69052e-47167ae2791mr311026341cf.41.1739290483262; Tue, 11 Feb 2025
 08:14:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <20250206132754.2596694-6-rppt@kernel.org>
 <20250210202220.GC3765641@nvidia.com> <CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com>
 <20250211124943.GC3754072@nvidia.com>
In-Reply-To: <20250211124943.GC3754072@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 11 Feb 2025 11:14:06 -0500
X-Gm-Features: AWEUYZnZrdGQlINhll4ZCmxy4_MiFjWVL9mBm_3F0LCmRscyspW8dY4HAyEeygc
Message-ID: <CA+CK2bAEnaPUJmd3LxFwCRa9xWrSJ478c4xisvD4pwvNMiTCgA@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] kexec: Add Kexec HandOver (KHO) generation helpers
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Eric Biederman <ebiederm@xmission.com>, 
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 7:49=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Mon, Feb 10, 2025 at 03:58:00PM -0500, Pasha Tatashin wrote:
> > >
> > > > +What:                /sys/kernel/kho/dt_max
> > > > +Date:                December 2023
> > > > +Contact:     Alexander Graf <graf@amazon.com>
> > > > +Description:
> > > > +             KHO needs to allocate a buffer for the DT that gets
> > > > +             generated before it knows the final size. By default,=
 it
> > > > +             will allocate 10 MiB for it. You can write to this fi=
le
> > > > +             to modify the size of that allocation.
> > >
> > > Seems gross, why can't it use a non-contiguous page list to generate
> > > the FDT? :\
> >
> > We will consider some of these ideas in the future version. I like the
> > idea of using preserved memory to carry sparse KHO tree: i.e FDT over
> > sparse memory, maybe use the anchor page to describe how it should be
> > vmapped into a virtually contiguous tree in the next kernel?
>
> Yeah, but this is now permanent uAPI that has to be kept forever. I

Agree, what I meant in the future patch version is before it gets
merged. I should have been more clear.

> think you should not add this when there are enough ideas on how to
> completely avoid it.

Thinking about it some more, I'm actually leaning towards keeping
things as they are, instead of going with a sparse FDT. With a sparse
KHO-tree, we'd be kinda trying to fix something that should be handled
higher up. All userspace preservable memory (like emulated pmem with
devdax/fsdax and also pstore for logging) can already survive cold
reboots with modified firmware Google and Microsoft do this.
Similarly, the firmware could give the kernel the KHO-tree (generated
by firmware or from the previous kernel) to keep stuff like telemetry,
oops messages, time stamps etc. KHO should not be considered
explicitly as a mechanism to carry device serialization data, the KHO
should be a standard and simple way to pass kernel data between
reboots. The more complex state can be built on top of it, for example
guestmemfs, could preserve terabytes of data and have only one node in
the KHO tree.

>
> Jason
