Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFAB33C53F
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 21:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775598673; cv=pass; b=MoDxnlunCC+WWijpZFvBxbmDuV9f5BcOIW5XP8qmvWoaH7ZZ2Wu75NZ2Rx2qvFZbDuxrhCgIRC9rQon9SHHS0UkBrgdH4A8sNjwAm/DJynSFb/LyxBZ+BaCZ8ALZuJEW5TMOPuMga6RfQ8HNqEjWfmPe/lAe1vgE298MOlwOzUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775598673; c=relaxed/simple;
	bh=0jj/lwdErrCiTfj+2QvqNW2WVQwYN/lnIlZWQxS2RZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFkWurr//4+1DzJ+b9w7wkvUajzcIPEX3Q9bIysrAkXu4+n2VT1ZDLGczEI43dve8bVZiSo3askdJw0IwUZ8Mqx3Hara5vhrEvS+6Mx4tGk0d5ezsguixi83CocSAFTUzkOXczPQWIPp7NiWIJAepDK0vXLQjEF4gN7oKUbAk1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYZdt2s8; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYZdt2s8"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50d8c7a393fso97391cf.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 14:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775598671; cv=none;
        d=google.com; s=arc-20240605;
        b=PEB3BAmlWB/vJkTmrDUMi5TtixLyPRFpPvXLUxFFqapaeGYpOtbbnz00nW6IFpBt/w
         6oKmRAcr+eeVeEuK5ZGYhbeOQSAy45O1mknaJ+vICO+WbBi3zBwYdk4vYBHg2M/G9ZBI
         rGuuPk9jXDt5mwB9D/D/82G77CrMu7ACoiqHn96YFfhuTXSrFZMDqb/9ISEnguqIaGNS
         AQi+d6f1GxRbPfEq9k3Az/i91DSvPpC0Qr6hbQJLm7GoCz4/cZAGTt1cY6ulHQwt2lKN
         oHCEMVMQLNCKiT3l66qDfNXf592BE1J2zhqH92434RW8m+Ntb1tY6/4CCvK8f8Pl/qbL
         oa4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gaxd0JUvuI19hIXHFFbq0Nmmwdg7JnIiT63vLMwEkLk=;
        fh=YhF9X1GwqzQCYojWdMP09PcZ/bk/2bhRm5Ms1Fr9muQ=;
        b=bFvNh27RN8x65uahMAmT5abEtQx1EE6FOU5/1LZ+/XafFAAvdOS3NeRkvAuq0dpKDj
         MxpPZisIOn0GjvKAmyllIcVeSLY/WfqsgXmRpW9e/eQyS15lXoZ87G6UeFSNPhWVvMmp
         87pBEt8JcQ5TL09lnGveogL65YGFCQiASidL8sOGiO49h2nwTXvShRMtk84eMyPIwsjE
         xlsEod7EvTdb1cc/FbnUn/CU/ifX7/bcsJE1q12PrAbBaUZctGYTw7k6HFgA7DmQv1fc
         jW3XwIlwV1c4oy5oF3a+KDtqVXzizcOF8v5GTxHWXO6D/2E006ku+PqbWFLROl3531Tj
         d3Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775598671; x=1776203471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gaxd0JUvuI19hIXHFFbq0Nmmwdg7JnIiT63vLMwEkLk=;
        b=GYZdt2s89mWfsScrFlLBod5RkZHYiE1ZiaNR+q3fxhLZr/u6xO9Z1GyctsomOc2mKj
         zKkaCgYrv+hHEhSF63dwvqr0zYptOKzqQH1Cv45g5c50RXSYDOyKgRdc2mNrHshJEkkt
         lUDNSLMBTyj4F/pPFm7i0InhXz+kL4TPULfItNCz5Mu6d9MvE6m8jktST/Ctk0itK4k2
         vL9OLU1XPcaOb3O6MG4jtI7iNZMFPclvsOsko3TdZCDMUEjScwe9tHU6YKNOw62iD637
         10Q9TxMcb9j5RsHYWQMtlYFhf0lTZvrHnX8q3WpdoHdovvCZPq+guqqh1QVW3ghhHN/4
         xZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775598671; x=1776203471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gaxd0JUvuI19hIXHFFbq0Nmmwdg7JnIiT63vLMwEkLk=;
        b=ApectbQwLNmEQq3eZius4/0On9zDL9lMwtHwLoMHLcBSB2o/14Rv6V0U4QsqiwttWI
         mM/VYbGLiPqdmrfrw6rBt1hzQkONSQxNqg4FUc1sezheKJbOn33xDPrFFc8DPxCIv98z
         PUlUEo3SPSj62l0ENlIdZOqjHPd/8B7K0409vFC33ctXqfbtLz8TBmXi8TWqyzu5c53e
         /V4Rj3I0taqeTAjeidVyWzu+VtFbG/D3Grnayr0LHgXOiCk9bah6MM7XY0SNOxl3Jl2K
         FGjC9j/wXpKMmFfw45YP7Gg8pKS9bemAzlfiswIwmvEgtdt2JOIzQJMJHCPWKuz7VxHb
         5hiw==
X-Forwarded-Encrypted: i=1; AJvYcCU3+juYd5ymTs22qA3I2nQBDDkNVRFKE54kMSIePE8t/ERmSGTMj7a5w7TVzvirhjiTTjvYIcw/WTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LzqLLeZESKEFKMmeIyyRWL/Wuox0i8jzZHmu+uB2XzNVq0R5
	P43mdBhOMOkkYP/+XsaRAvWSGetqNmndp78ecrh7cOdrUvMxcT5hqhDQfust6LXzPeOugyi6+d1
	QI8b9WMTGLwwBUUKgLbJXvxQ+rZD6qAWkHQhlKi1Z
X-Gm-Gg: AeBDietsq3fhbNaYWgm3iJX6zzeZmV/oRKIaZFZgooTkjBP4VHME8qaYnsHzpuuYIc+
	qWoAXVe+2zKvfjoo4swLvH85BJkjdYsTcJmI/FBGhYQmxQALBcnKCWALZkK+8XGyYeqjMXLgGNH
	Ij8oPrU2maAe5ozs0KPq0o+smNoAPUAGn66nkiUdrA0uYl0oo44GGoCdsRYaaamfCPPYTxTyQpy
	88oORT9n4FOk22B/4J8AOJoGTDL1Hn5JxZv2Z7RNCBzfSaW2G0/GTXTks053VsYlQtRY/Vj4Zek
	b2AL/zsFkgkFN7PWxH1ZXbtEkL3FEZ/kh6uIwA==
X-Received: by 2002:a05:622a:cb:b0:509:1d4b:f86f with SMTP id
 d75a77b69052e-50db3e1cb76mr314121cf.14.1775598670174; Tue, 07 Apr 2026
 14:51:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3>
 <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com>
 <CAEvNRgGm9icDK8sK5ZfqHEOEqSbvjwtihE4p9d3vpBq-NfVjmw@mail.gmail.com>
 <CAEvNRgEtigp7+PVDkyu_DH947CUqDt312d+P+hWjjd2fHONiag@mail.gmail.com> <yvfwexsub7nrogh67hzcsupbrkzer6a7kbeao5tlq4elrzc2iz@xrwdjd7p32pp>
In-Reply-To: <yvfwexsub7nrogh67hzcsupbrkzer6a7kbeao5tlq4elrzc2iz@xrwdjd7p32pp>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 7 Apr 2026 14:50:58 -0700
X-Gm-Features: AQROBzC6YaFafHUDv2MGa2x0Vz0Tn9NeKXIPzVzTFxz7s_zDJ7AzU9trGlNgYrA
Message-ID: <CAGtprH-kgRByFvvCYeWMXtsvpb6qpaWAo8k-3PEnioyPg-LEvA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Michael Roth <michael.roth@amd.com>
Cc: Ackerley Tng <ackerleytng@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, ira.weiny@intel.com, jmattson@google.com, 
	jthoughton@google.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 2:09=E2=80=AFPM Michael Roth <michael.roth@amd.com> =
wrote:
>
> > TLDR:
> >
> > + Think of populate ioctls not as KVM touching memory, but platform
> >   handling population.
> > + KVM code (kvm_gmem_populate) still doesn't touch memory contents
> > + post_populate is platform-specific code that handles loading into
> >   private destination memory just to support legacy non-in-place
> >   conversion.
> > + Don't complicate populate ioctls by doing conversion just to support
> >   legacy use-cases where platform-specific code has to do copying on
> >   the host.
>
> That's a good point: these are only considerations in the context of
> actually copying from src->dst, but with in-place conversion the
> primary/more-performant approach will be for userspace to initial
> directly. I.e. if we enforced that, then gmem could right ascertain that
> it isn't even writing to private pages via these hooks and any
> manipulation of that memory is purely on the part of the trusted entity
> handling initial encryption/etc.
>
> I understand that we decided to keep the option of allowing separate
> src/dst even with in-place conversion, but it doesn't seem worthwhile if
> that necessarily means we need to glue population+conversion together in
> 1 clumsy interface that needs to handle partial return/error responses to
> userspace (or potentially get stuck forever in the conversion path).

I think ARM needs userspace to specify separate source and destination
memory ranges for initial population as ARM doesn't support in-place
memory encryption. [1]

[1] https://lore.kernel.org/kvm/20260318155413.793430-25-steven.price@arm.c=
om/

>
> So I agree with Ackerley's proposal (which I guess is the same as what's
> in this series).
>
> However, 1 other alternative would be to do what was suggested on the
> call, but require userspace to subsequently handle the shared->private
> conversion. I think that would be workable too.

IIUC, Converting memory ranges to private after it essentially is
treated as private by the KVM CC backend will expose the
implementation to the same risk of userspace being able to access
private memory and compromise host safety which guest_memfd was
invented to address.

>
> One other benefit to Ackerley's/current approach however is that it allow=
s
> us to potentially keep hugepages intact in the populate path, since
> prep'ing/encrypting everything while it's in a shared state means gmem wi=
ll
> split the hugepage and all the firmware/RMP/etc. data structures will onl=
y
> be able to handle individual 4K pages. I still suspect doing things like
> encoding the initial 2MB OVMF image as a single hugepage might yield
> enough benefit to explore this (at some point). So there's some niceness
> in knowing that Ackerley's approach would allow for that eventually and
> not require a complete rethink on these same topics.
>
> Thanks,
>
> Mike
>
> >
> > >>>
> > >>> [...snip...]
> > >>>
