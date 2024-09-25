Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C5A3D982
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727282692; cv=none; b=WroGp37oz8tXjUDZjXkRBPoZz5+ufXM8Ro9pUvw2ZFC6bYAc9ZqPl95n8Aug3fMyN+5IxFpdoNIQMStvGRnXMENx5q6d2iAzjbU257lERKBfEqBHMp0DoIkVO204eu2/bWQa7NDB9ocVPvWRkKcPMZLdNaYMaRMYJV5s/hMSYCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727282692; c=relaxed/simple;
	bh=/t+YSp2gvbsBW9hsAIIEsn2fOHY2XQVupxHXFI22op4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATTgHBUTp9Vw3uv6p5PIeWcKnxi1N8OLpNDDcfzaahSCQ8QUKW6Kmlj8ix+MM4u5k5LHhRwgSawN+iVEKoHSCKC1e5MlxsaocGcjmsuZb3CC0JZwrT3hK0QKJWD9ffmUfblomuONkZaSgktpU9GIJMQijYgfrbuebsgXL7DIwjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YjeK00ld; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YjeK00ld"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c5bca59416so4984266a12.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 09:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727282688; x=1727887488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=YjeK00ldzORfadSau0RlbBIrP7X4exH8omps57J+D7SlvkdR3nwB7YvsdZpY6iOBMs
         AEg3yWwSR/VWtrwMCDKfJqRB8pOvVdyh4DMxGwB3IUiqJXKs03lrs3KLSTDVyVglyp+V
         lOwtS3jJ5iLv2ApBa7g/CQqZZX9WB2AKwsleo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727282688; x=1727887488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=pHiUA+ACCVyDd4Tv4TP96szZUOXG2A4kaHNI3j5phQ/PMnhsOec29QANZgEIZriyK0
         IZw2W3KOOVJ/0uevHVapVM15Vo8KGowuM6DRMdO8AgDtNryXU8D+G7E/YI88hzUfLhUb
         FeS0eG3AN9yVH/ZpoTL9Pg07jHyJ70PMsRUzj93tOGeIocWYB7HjEnTyfsvXhPHg9d15
         Zu1ug6J9TyED3tTuB/6/nZLKvkGskFCA26npn/2fboJ8um8wCtusXie9tGLmKVtfufaA
         syMBj55kUL+CnZQrgtLaBkZKQJDrXY9uIQGLSfGiQ0dGdunc5ZvHCLEmrcw03Vr++xls
         6bvw==
X-Forwarded-Encrypted: i=1; AJvYcCXlGBGpUBslRs7ORHOOgFVpVm6PYfdnSwcx3aMa1OwxieTd1ndV4y47BWEFv3UMGIo+VJmcW4usVxc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuqx7LXOM/9iaBtZ2Ts6zTTfoJ4JNj7d0VOdI9iGS4yQ26FweI
	h42wDrMOyIPB/R9FTVdrgOt3CtkT4YJzBNL0mOJSNNuLtKTr6ZKM9oC00TCDA0TYTk/cakjhfW2
	MtSjvfA==
X-Google-Smtp-Source: AGHT+IGKzoz00uXQIPNEbZNJS7dF+sZBTgN3mSaGDULTcrcyy7UxB7gJGLoI6PJ2HN1/vi+LLqRcAw==
X-Received: by 2002:a05:6402:440b:b0:5c8:76d9:604e with SMTP id 4fb4d7f45d1cf-5c876d96086mr627299a12.11.1727282688071;
        Wed, 25 Sep 2024 09:44:48 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c877a6c985sm43482a12.80.2024.09.25.09.44.46
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:44:47 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so7084366b.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 09:44:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzq0D/Ir3/JdXQOfk/vE+idt6n2hU/thLmL0FO7eoerlrxIaTbJsONuGO4kig3XkAEqmubWkUzFvU=@vger.kernel.org
X-Received: by 2002:a17:906:f5a9:b0:a86:9d39:a2a with SMTP id
 a640c23a62f3a-a93a0330c37mr309689066b.8.1727282382886; Wed, 25 Sep 2024
 09:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-44-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-44-ardb+git@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Sep 2024 09:39:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
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

On Wed, 25 Sept 2024 at 08:16, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> Instead of pushing an immediate absolute address, which is incompatible
> with PIE codegen or linking, use a LEA instruction to take the address
> into a register.

I don't think you can do this - it corrupts %rdi.

Yes, the code uses  %rdi later, but that's inside the SAVE_REGS_STRING
/ RESTORE_REGS_STRING area.

And we do have special calling conventions that aren't the regular
ones, so %rdi might actually be used elsewhere. For example,
__get_user_X and __put_user_X all have magical calling conventions:
they don't actually use %rdi, but part of the calling convention is
that the unused registers aren't modified.

Of course, I'm not actually sure you can probe those and trigger this
issue, but it all makes me think it's broken.

And it's entirely possible that I'm wrong for some reason, but this
just _looks_ very very wrong to me.

I think you can do this with a "pushq mem" instead, and put the
relocation into the memory location.

                 Linus
