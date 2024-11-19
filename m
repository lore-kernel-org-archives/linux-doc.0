Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E2624B34
	for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2024 01:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731979620; cv=none; b=OVxlZeN1MvvEov6JhOd5+wj+w1usInpc8nd68ozRjHdFlWWl9MvR3wSmvmAJfIFIQJmGtKHLkNsyy5CONWAQkgbPbgc+hA2atlDAY1VbvsulubR/MB/eh8pVWHo4KxgdsJoquxLntuclXDc6hAhSlBwkUahxt3JIec/0Yxi/Flc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731979620; c=relaxed/simple;
	bh=P+FMUkipyIhk9DsYbQ6EHACmcKLCrVp0ZaM4Ce+XRRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbxFSZ0471gtLmP60ncZ+8ECBuGgZRe0ZakpN8RJU176T9YmVhULcLwSnuvsiYZiy2N/RWFHdaGDfMglOrwz6PfvAoJdn4i1zdno5sdlowVSYjhmzKacGwG4/W1ZOi68CQb3JtRtXNXOLgq8xa29j5yLJMqdd+KZPfvQBHF+S8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4tOsp1xl; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4tOsp1xl"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5e5c43497so26864707b3.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 17:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731979618; x=1732584418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+FMUkipyIhk9DsYbQ6EHACmcKLCrVp0ZaM4Ce+XRRQ=;
        b=4tOsp1xlevN9/mBcy6CHUwq/MJYNvfUwl7fLpm1gTicRuEqINMsCYgn9AtF5nfViLl
         bSjIo0gpOaU1mH2Btb+3MyddfY4DCGwQmVLSN/2b74bux3i2nwD4YzLjmxe7x3G+C+oY
         vEznwRVTn/ZV6eKLNFV1tgW8F4yKkdLILlas4B1uVzobRkvTZWBAnslDXuz+Ky/BTmmm
         GYuYxK+a+jqh+eF5u3d8wQgYAL8MU57hN6AodXePRmc+vwCFPpCqBx6Th/QJrb95ykPr
         IexRuK2Jt0jg+CwHQbArKyrtrRswwp2/F7i7QgMEwblbfXFPBWE3cQAPG0YMJLOVhf8l
         oezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731979618; x=1732584418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+FMUkipyIhk9DsYbQ6EHACmcKLCrVp0ZaM4Ce+XRRQ=;
        b=J+5abeD2WOjcSsD1f02cFxwjKn4qOJQLobcvjBAslNW2lzOzNpgwvuoYPDXNQj/JGD
         0kQ2Ieh3yy9OHO2txcFRsOzH2ffEQEhaMUJXfa124Cu+aKGm05fLF9/AiVNrOO0U3mCx
         aPrNgEBRC6aSbZ8UHOM7VeWa1PXmrPpN4X7za5Jw9T9GoYzBWYZvTY5WWM+EbQYiMa+d
         sSG3thVSMX6SCR2t8VcQ3MjCsyPX0KPYmHkLB0D/4z8BelF7bdRpJBBDu2HtVHbcOUjp
         EAPxOnmuOmyynZZ5deW3LhRo0ZTjAUfMDet8DWhbqpTG9k/yBALhmQFIBaAO7aZjpKx1
         z0mw==
X-Forwarded-Encrypted: i=1; AJvYcCXZafHQ+RFrww4rntZlb3bAkGgmSzPyrQF8pboSO+5981cnWl+GLvKXDIum8SGLIjZjUhfYmdM8FqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0LYSDVFcwCSFMXtPuP49hW5gAEWjmkzYXjL0J1Dkq7iuq0bdm
	yg9H4nK68KU3XrkHOQakEFiuGZz8AhI6TSUEPnZEHo+W8MMNfOuZ/IwcQEyKqSWL28BvJJUMgVP
	aWivHEASorr0/0AEBaW5sIKpr9KRxcXaeZgKG
X-Google-Smtp-Source: AGHT+IF/DXqCq/8TFVAre/QWwJyXA1lKz3HNE+qjyozH+HAootmsxdQ4ih74Ob5WD9n3PLNP03pn/ZWTZ92ruGZDHes=
X-Received: by 2002:a05:6902:1202:b0:e29:1099:9047 with SMTP id
 3f1490d57ef6-e3825d3e2femr11253109276.11.1731979617534; Mon, 18 Nov 2024
 17:26:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118123948.4796-1-kalyazin@amazon.com>
In-Reply-To: <20241118123948.4796-1-kalyazin@amazon.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 18 Nov 2024 17:26:21 -0800
Message-ID: <CADrL8HXikDsda6CmG8E2KpNekp8xaQyd8wgZoskkR=p2LvkPQg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] KVM: x86: async PF user
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: pbonzini@redhat.com, seanjc@google.com, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, vkuznets@redhat.com, gshan@redhat.com, graf@amazon.de, 
	jgowans@amazon.com, roypat@amazon.co.uk, derekmn@amazon.com, nsaenz@amazon.es, 
	xmarcalx@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 4:40=E2=80=AFAM Nikita Kalyazin <kalyazin@amazon.co=
m> wrote:
>
> Async PF [1] allows to run other processes on a vCPU while the host
> handles a stage-2 fault caused by a process on that vCPU. When using
> VM-exit-based stage-2 fault handling [2], async PF functionality is lost
> because KVM does not run the vCPU while a fault is being handled so no
> other process can execute on the vCPU. This patch series extends
> VM-exit-based stage-2 fault handling with async PF support by letting
> userspace handle faults instead of the kernel, hence the "async PF user"
> name.
>
> I circulated the idea with Paolo, Sean, David H, and James H at the LPC,
> and the only concern I heard was about injecting the "page not present"
> event via #PF exception in the CoCo case, where it may not work. In my
> implementation, I reused the existing code for doing that, so the async
> PF user implementation is on par with the present async PF
> implementation in this regard, and support for the CoCo case can be
> added separately.
>
> Please note that this series is applied on top of the VM-exit-based
> stage-2 fault handling RFC [2].

Thanks, Nikita! I'll post a new version of [2] very soon. The new
version contains the simplifications we talked about at LPC but is
conceptually the same (so this async PF series is motivated the same
way), and it shouldn't have many/any conflicts with the main bits of
this series.

> [2] https://lore.kernel.org/kvm/CADrL8HUHRMwUPhr7jLLBgD9YLFAnVHc=3DN-C=3D=
8er-x6GUtV97pQ@mail.gmail.com/T/
