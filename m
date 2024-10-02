Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6831D0E28
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 20:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727899764; cv=none; b=aUuCfi7uNkM5Vc68cvK/Pmxg7KCeCcorbZSGyo70Xh5f22ENXxV4mmr9MmTYSDAFtTScSUrIQIqDX9aM9Y9Wq/QvxpFo4YLdvMjwktISSLIYP03ZYuyXPPrTdNn9zrFX0nwfECipa6Pvkvn3BTZZ7orgZyPTOGFTSBIJGKlNoEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727899764; c=relaxed/simple;
	bh=26ch3VLdZlgASzApmc+sdmN42sQrSbzi8ri/yXB2hcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NA+5nAlhJHiNGoH5s1St1xZKzgRyK0zHpCT9EyLxNwuec7eTQTtD/zCBOGcmBL4qcRjpTnSGAtfxWnlHXMU+cBkFH3kJr6A3zdOVVX/FZtAB2K6N1A/NABLltemgs2wNmzZ22fYNd+QMDB8/uAYxbsM3hRguhmPbkWv+221qY8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WKfdhQBP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WKfdhQBP"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso17393666b.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 13:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727899760; x=1728504560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=WKfdhQBPC2sM9vI4ubJQjviYU1JmRVu9mBoYNUWe6G7gX45JGAjAdo2MJUiuHiIr+T
         CsOEwDo5XxOu6OEwxGFuHWVKkqFVb2cTUH10HeL1FEdUxU62ovOEd2aerrW2WT9HeCRF
         /7wfZSY0JcplW1RiWsczkMhh3Tl+Q0fs4bo+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899760; x=1728504560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=nkkVC42eNmm+LJJxZzFKhTMtGrENyUyRV99hjg7oFD2vtCJVVZRDCFr7P8E7fnZoso
         KCMTNoGis+PiOR7LrAnFjiNkytstsM0mdGZFPnPITE5A+6x6Y/2dZK46jQYknnVcQ06K
         +miztLcZKF3JYt1ekpQfxAdd0DwbbPFqEybIhzdLWSK05u05x6HVrVbWvvRZ2GYqF+H+
         HDcOarJ//pjOWJcjhnY4n2mHeVhvf68qyZKLR0xOzkgmW+RwKbyfmXhfyIiIfSIWLeoG
         HrS1w8aCfnbwafCXAqH96tsq3fOMVD9sGnhDmL5ydOG5oUx36NNFAWL4UO6Rq9hjDGOs
         NTEg==
X-Forwarded-Encrypted: i=1; AJvYcCVWAhcHR4xxkHYd/P+Re2r433IvPn1BTYWtQ4tRT9V+drxsd/y8pgLn1edt4jLetGKTLcVa7PRNR+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YymB4LYB7cUPD2oQHfUkJ5wGN2ylUXvIDYN6K/SVcc0/YRblRVG
	E3QgT4A+koYFtpFCD0QVFvhDwlilKOXLP1+WDkMYhqjZsxm0Z5Ts3NwmFiTMBd8M6OB+nraQtJ7
	JjvvXgQ==
X-Google-Smtp-Source: AGHT+IFZWMC7sqkLDNG2rSkrzbtw1+wC6shHtpCJ2fFcO/oai5wa/pCoxirRT40Ldux8Lpv4E1eoPw==
X-Received: by 2002:a17:907:6d1b:b0:a86:7b01:7dcc with SMTP id a640c23a62f3a-a98f8238fecmr354591466b.18.1727899760555;
        Wed, 02 Oct 2024 13:09:20 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c593dsm909435066b.54.2024.10.02.13.09.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 13:09:20 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so19149366b.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 13:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWubsiLLxvU3r0i/9HRdYWeovqoDgpU/6GAmaD7+MM/wRuO+zOsDiZtJUKfYUnuNLts824LMEgzo5g=@vger.kernel.org
X-Received: by 2002:a05:6512:e9e:b0:535:6795:301a with SMTP id
 2adb3069b0e04-539a079eb59mr2506573e87.47.1727899328912; Wed, 02 Oct 2024
 13:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
In-Reply-To: <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Oct 2024 13:01:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Oct 2024 at 08:31, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I guess you are referring to the use of a GOT? That is a valid
> concern, but it does not apply here. With hidden visibility and
> compiler command line options like -mdirect-access-extern, all emitted
> symbol references are direct.

I absolutely hate GOT entries. We definitely shouldn't ever do
anything that causes them on x86-64.

I'd much rather just do boot-time relocation, and I don't think the
"we run code at a different location than we told the linker" is an
arghument against it.

Please, let's make sure we never have any of the global offset table horror.

Yes, yes, you can't avoid them on other architectures.

That said, doing changes like changing "mov $sym" to "lea sym(%rip)" I
feel are a complete no-brainer and should be done regardless of any
other code generation issues.

Let's not do relocation for no good reason.

             Linus
