Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BAD4597B
	for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 20:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713387403; cv=none; b=uQKMXp5c4hkJwMYy4iKbAg1j6J4I8aQxb6Wr9odMwL7kqL0lgk52YEgOM7w3rtL036fiAKR98MLFzk7iSl0Mlyp6r7sWOBKNMWSW6AGf8dXu9l+R9+N4QUTh2VHEsYjs6YfzolifGJmGYzzkQ21q4Oxvp0LckUhzBAM6w/YO5eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713387403; c=relaxed/simple;
	bh=CT9my/HzssE0lehUkChpdYWFXTCeHXjsrz6seMzdin0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBB8qK+6IxFDImYgSxPHKL18PWDPFTirQgkXb9gO5cHz8ZoyK/0eVDVaSDgYQzK4JkROTSD4ydL5kLOV5/EkpnLHTjOdM/xOF1DxF//gDIlcULTVzfySRmHFucTlEYxGQGlzf3IyNCn5e9qzMkildhl4mmNbyhZ16/sHMiYxyQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mNLozQIM; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mNLozQIM"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36b3738f01cso8905ab.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 13:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713387400; x=1713992200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxKPyLxO6iDeNFnO987EiXxyZaGk4JOWQZWYPIVwBKQ=;
        b=mNLozQIMLoNhitOcSMkiQtizbJpjlPMUqJEPgSUlne8X4jZXYa6xLmTcEJY36fFpZu
         ynY5Mvs+l/NFIo0oLbjt7SATLHnS2TII9BtDWq0gRzhe7NTkVnTJwSTuvmE9izFKx5MN
         hX5wAyXY/LBCPqYt1GWPS8NekqfCjwo+t5sS5EVLAXFXlrCFVLJrmnL/oiSTwuGkiBVt
         6CvS6nekL+TcQEFN8NafyX8MeYWvSOdUUskYCo319bnVkLy6/YYJ72N2DgXeoxJyhmZk
         cqsntd7CTZHQ6VXNNqCUtaGd/01LwRIOjtZDD+q1j72uXluz7tv5PzCs0VPD6BbhCPcn
         gobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713387400; x=1713992200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxKPyLxO6iDeNFnO987EiXxyZaGk4JOWQZWYPIVwBKQ=;
        b=hzauSWirm+tavysWbUFhW/jTfuESHIEsqyJ0ruLtoT3FdYMXKmkugZm67yiOMT4diV
         1ZIhciBLU+dgoTRyOU2KKO6Gu0YacbwHsLkM6bmETtFGma4VwWOEDFprbAk1WLNZQZ8s
         83uBi82iE9zUIBgHLrJw6dJsoOH1ziL6/ySLRXAPV95BDtWufdRa2s1fqsS8HdDU54fe
         nYYGXxdTpRnq2+WicxwOWKQ7o81KG45lcR85rJ+JINEhD+Jr8YXmSDaoUE420jRsxVAA
         2uxzTu1v5fJGRxu1HjKCZMJ8jqkbsL2EZcuDmw1GvCuziTxITxHTzHIroOksJ9hzdRzO
         0tLA==
X-Forwarded-Encrypted: i=1; AJvYcCWh9tgtGAPtN1aMFaTJEUT8ZqptY9Vi0hR/hwJNCKkgNc6BkdahavyMoIGW/O4DSYa55gAMB/oKZCrM8dcu2RBRKTrDUJxDkjME
X-Gm-Message-State: AOJu0YxiWLewiR4132pwDX5eK8b7mSBrziDUuCRVNoMuIIADjkL895BM
	aRDKQrwuWpgFGpSw6E0Qx1ex1JjLkN1LejRdbGi0Av2K725bEDsuK5UwWXDvUGWJPidhHA62WoL
	C1gtMLmZ22Qnd+fxPip9Lo0h45C6GTfL1sWc4
X-Google-Smtp-Source: AGHT+IFYQhHTJx7En6LnumfpaPQCQNaZFz4u96vFF1dDOGT+OGz0D9SNbQOCMWXBD9ATyWu2sDS9n3JUb5lo4C3a7U4=
X-Received: by 2002:a92:506:0:b0:36b:3b26:3627 with SMTP id
 q6-20020a920506000000b0036b3b263627mr13791ile.13.1713387400028; Wed, 17 Apr
 2024 13:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1711674410.git.babu.moger@amd.com> <f7dac996d87b4144e4c786178a7fd3d218eaebe8.1711674410.git.babu.moger@amd.com>
 <CALPaoCihU+mat2A-wNtTm=qbpya8ZqhDURsfZfjuHitch0WrLA@mail.gmail.com> <9d59d38b-af1a-46d8-81c4-b426d47d4ed6@amd.com>
In-Reply-To: <9d59d38b-af1a-46d8-81c4-b426d47d4ed6@amd.com>
From: Peter Newman <peternewman@google.com>
Date: Wed, 17 Apr 2024 13:56:28 -0700
Message-ID: <CALPaoCgFEybS5MhsPx4EaJmsfBe8Es_6QwWBXpoctdaNf0NcMQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 17/17] x86/resctrl: Introduce interface to modify
 assignment states of the groups
To: babu.moger@amd.com
Cc: corbet@lwn.net, fenghua.yu@intel.com, reinette.chatre@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	paulmck@kernel.org, rdunlap@infradead.org, tj@kernel.org, 
	peterz@infradead.org, yanjiewtw@gmail.com, kim.phillips@amd.com, 
	lukas.bulwahn@gmail.com, seanjc@google.com, jmattson@google.com, 
	leitao@debian.org, jpoimboe@kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, jithu.joseph@intel.com, kai.huang@intel.com, 
	kan.liang@linux.intel.com, daniel.sneddon@linux.intel.com, 
	pbonzini@redhat.com, sandipan.das@amd.com, ilpo.jarvinen@linux.intel.com, 
	maciej.wieczor-retman@intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, eranian@google.com, james.morse@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Babu,

On Wed, Apr 17, 2024 at 12:39=E2=80=AFPM Moger, Babu <babu.moger@amd.com> w=
rote:
> On 4/17/24 12:45, Peter Newman wrote:
> > On Thu, Mar 28, 2024 at 6:10=E2=80=AFPM Babu Moger <babu.moger@amd.com>=
 wrote:
> >> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x=
86/resctrl.rst
> >> index 2d96565501ab..64ec70637c66 100644
> >> --- a/Documentation/arch/x86/resctrl.rst
> >> +++ b/Documentation/arch/x86/resctrl.rst
> >> @@ -328,6 +328,77 @@ with the following files:
> >>          None of events are assigned on this mon group. This is a chil=
d
> >>          monitor group of the non default control mon group.
> >>
> >> +       Assignment state can be updated by writing to this interface.
> >> +
> >> +       NOTE: Assignment on one domain applied on all the domains. Use=
r can
> >> +       pass one valid domain and assignment will be updated on all th=
e
> >> +       available domains.
> >
> > How would different assignments to different domains work? If the
> > allocations are global, then the allocated monitor ID is available to
> > all domains whether they use it or not.
>
> That is correct.
> [A] Hardware counters(max 2 per group) are allocated at the group level.
> So, those counters are available to all the domains on that group. I will
> maintain a bitmap at the domain level. The bitmap will be set on the
> domains where assignment is applied and IPIs are sent. IPIs will not be
> sent to other domains.

Unless the monitor allocation is scoped at the domain level, I don't
see much point in implementing the per-domain parsing today, as the
only benefit is avoiding IPIs to domains whose counters you don't plan
to read.

-Peter
