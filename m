Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18503939DF
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368260; cv=pass; b=ABGT2sGK7Szu8URtj0rCiFlsazBl6+ppa6qfjQA1DKrLcV7j0EmPaeHR2eQHb8fXHbuP1YfPP1Lcr98EFoJFrzJ1flYt81UicUyLEp01WPdncKCp4/kW3tLgQIN4Duw29EsW+ko8uEF3aD3SRdQhWgtUnHRCU+L4pnEgMqfTVtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368260; c=relaxed/simple;
	bh=Bap2I2Iwx1j90rJe9QRr9BlObCdTslZ+pvyg11P5Bkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRbFlkTlUCp/1yO1H1/EBt1aE7Xp0lHqx83qtaatmFXztLsDSjVH8UZK2C+BvbXcMQfKXAuBZAMi0oMS4n0kqf4WzyHLQYymnzvu9lhxiFIVi1fWDQ71t9BXNd+DOMvZfSqn9d3fg9BL3urjdwYOOrkLLnacnyektw0oW26AC1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qh6tn7NE; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qh6tn7NE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9961e4f71bso71620066b.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774368256; cv=none;
        d=google.com; s=arc-20240605;
        b=NIw6FUyZ34GhmQs6WdKsk9gxtZvOkQ53hd7eg/VgP/MRkV0fRaFZpLbjUM4urMgvEk
         1nl+2rbT7d8jfrhZ87tYTopub81su86p3NwqP9hTYpp4M0pMlFVakyxyTsb010ThVp9S
         4yF2zBbrGWbkSTDdfzFhwFAc6m0A4v+5vkRmw5m0qeYhVO1VZAvxvDDScS69x5yD/2Sd
         uJfu4+Zv1p5YZJvK2HTTMTVPjj93p87HvE0YqyP1d2/aRVsxMCtoxffX3yYpziCHcYEx
         g+QAkhiRUvjsoziFs0jg5V31IiSQkk/PUvAamHYPRypZjL5HItJoWU1eHSga6KLlMd1j
         BkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9lAIj9nrwaKz6NfMKfdrELFElXaxUC4oA/DBJISnVu8=;
        fh=eWEm7KH28NgUswDmJa4RllDU3g5yspbHteE+Xdz3EiY=;
        b=gDeNJuvlkAl3uONiTOkF62iOLcJnz2ASOjhvKkPpSko7hya/K0Iho1+/dFrq4j4Iq8
         OhxN0ijH891+ZB381knXFKzATBGBXZgn/fg6zF+S9nC6xfaOxpi9HWGhHzbdE54imL5A
         u04bd9etcF2qF7go73XYeorSOZTArZDqpRcj8XXd8Xbvu3UcbEnBsg3woUYZ7ucw4yVn
         CdcQRShldbqPYMH7I5fBjlybUfaC9Jw8kYciqcyvp23+PDC9bTiEb0a/D9CQdn5XwzAl
         nw0KnTugYxeKqJ/qJ1IQHYtSuMnIutOe/h8VcJi6MKRl3azAIZwzWsy521DFIIriV9lV
         iiFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774368256; x=1774973056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lAIj9nrwaKz6NfMKfdrELFElXaxUC4oA/DBJISnVu8=;
        b=qh6tn7NEE62HHX3lMpBe7k2khmCW7U35AtqhMprApltPlBRt9IlTWtAF584ZGtnAf/
         Rdh/SWyughatgMoucsZtjvMqa3P0la0SKGbrWMU8Z0Bf2/FGFkPPP7oLX2k4OdesqcPa
         k9k2eid1bA6w6ZouXsQd8pHUDafnTZh1tsFgaKzsXg1ZrvZ/j7c20MG3gacpDE37rIJ4
         3SWsPTR7SvHbb8DoFVhh3pSq+IrFw4VrLGJS2tlJgubFQ5R3JQS9ozUfD6ep76AFTJLC
         CbGHW2Rogx5U00e38UbbQjFENm60+9lpMFL1qLJT/nDcVxNzfczk9zreYGRLKQnKThpX
         RBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368256; x=1774973056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9lAIj9nrwaKz6NfMKfdrELFElXaxUC4oA/DBJISnVu8=;
        b=GCx/qplXMOspOSFdj6PLsS8eHEhGPuMDzDsMTwj4C//kohG7HgvUdzmPagU0L8Gdmq
         aQll/6gkLPtPGS6dot0o+Ciqh+9p4Rs0nypkEQezb8Zq01B1CflCi0SgGh6PPIP+66Gn
         XQopkwlhZilZPmhCKn4aLfyo0CmHKfdIP1LGVxc3cxC1zAEfuIwhHamQ713K5+8bmc4R
         /sRTsvJD/8hwxq2GtMCUZbmHnqQHu3k4gmpzrm+4Xcm+ucJ3F6D1HiUGgeGNBgvmWtA7
         JHEbE8PPB128pfcIV6EfvH4OrLvYPk7DEGYN5mfsiLTOZP09Ok76EWeQZ0qNX5q9NYiv
         DfTg==
X-Forwarded-Encrypted: i=1; AJvYcCXBp51Vncexi5ixoKv38MA0UFn9/ry96rR6JbVYl3YPY+GcWd2+Mbfg7e4PoPSmepJjyDAgr9yQXck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVaRAgPVJzvbTF1MlBtlRlqaK60i0TkOgcHxMuD7eOExf4kVYY
	FP7RmhGgX7Q6IxRDoCSP/2CvwS3ncLTGalLheLpWpusyBj5jObh6hamYTQKTA8KarOXBOIo9tf2
	6dc8zOg2GYbdxDm7e0acn2uj5mJVBcw0=
X-Gm-Gg: ATEYQzyIGw8ya+KCwQBp9340A2nREPctupQZy9QHaqUil6c2+dGPkkLa4eTqrQy5BoG
	W4LaGO0qqU/wneptvGK34OYFCk/ib4FSES8BWkdgtcbCE3QQBTtCEC3nowW05fb32i5J7j5CnXN
	eyXxHsIM/CfL8kyvf4XycN31G126eSE+I92oC9oP4SuW3yf0oI3agQ9DxkmKKDbyR/4MN8Q72WH
	2UVXm2OVqlRVPzE8imDlr0qR9b9jwpceCxkLN5jFMymW4VxcPtck/HKywWj0vFs4aTOhHPAXuSG
	zxIh9CFAxZTVdEMtl3Zg/vBYrVXWLLK1iluTNp1TXOqgC73vtEEd5V7WDEJiNbD1a17JaKgEfGO
	oS+M1v6NPIkEEkIKNkPv9/jD/Uw==
X-Received: by 2002:a17:907:a807:b0:b90:8016:cfe4 with SMTP id
 a640c23a62f3a-b982f0bd41bmr1118661566b.10.1774368255441; Tue, 24 Mar 2026
 09:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323164858.1939248-1-sashal@kernel.org> <20260323164858.1939248-2-sashal@kernel.org>
 <CAADnVQJjJwRtUQNZAhLoXF7DYprhU97xJReZg9izV7n3f7=uJQ@mail.gmail.com> <acK1M_CvbYCtq7im@laps>
In-Reply-To: <acK1M_CvbYCtq7im@laps>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 09:04:03 -0700
X-Gm-Features: AaiRm50g5sRljE-pOlu1qkME3uHtiXscwZS9bY6E1gCFONCc9DBnMt7wYDgAtI4
Message-ID: <CAADnVQLr5Sx+vG6D4Jxm8r2vPxu7ygFz60LGwmqfkc=VB0-Miw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kallsyms: show function parameter info in oops/WARN dumps
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Alexei Starovoitov <ast@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	David Gow <davidgow@google.com>, Kees Cook <kees@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Helge Deller <deller@gmx.de>, 
	Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Juergen Gross <jgross@suse.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Alexey Dobriyan <adobriyan@gmail.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-modules@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 9:00=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Mar 24, 2026 at 08:03:30AM -0700, Alexei Starovoitov wrote:
> >On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Sasha Levin <sashal@kernel.org> =
wrote:
> >>
> >> Embed DWARF-derived function parameter name and type information in th=
e
> >> kernel image so that oops and WARN dumps display the crashing function=
's
> >> register-passed arguments with their names, types, and values.
> >>
> >> A new build-time tool (scripts/gen_paraminfo.c) parses DW_TAG_subprogr=
am
> >> and DW_TAG_formal_parameter entries from DWARF .debug_info, extracting
> >> parameter names and human-readable type strings. The resulting tables =
are
> >> stored in .rodata using the same two-phase link approach as lineinfo.
> >>
> >> At runtime, kallsyms_show_paraminfo() performs a binary search on the
> >> paraminfo tables, maps parameters to x86-64 calling convention registe=
rs
> >> (RDI, RSI, RDX, RCX, R8, R9), and prints each parameter's name, type,
> >> and value from pt_regs. If a parameter value matches the page fault
> >> address (CR2), it is highlighted with "<-- fault address".
> >>
> >> Integration at show_regs() means this works for both oops and WARN()
> >> automatically, since both paths provide full pt_regs at the exception
> >> point.
> >>
> >> Example output:
> >>
> >>   Function parameters (ext4_readdir):
> >>     file     (struct file *)         =3D 0xffff888123456000
> >>     ctx      (struct dir_context *)  =3D 0x0000000000001234  <-- fault=
 address
> >>
> >> Gated behind CONFIG_KALLSYMS_PARAMINFO (depends on CONFIG_KALLSYMS_LIN=
EINFO).
> >> Adds approximately 1-2 MB to the kernel image for ~58K functions.
> >>
> >> Assisted-by: Claude:claude-opus-4-6
> >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> >
> >Nack.
> >
> >You asked claude to reinvent pahole and BTF and it did it
> >completely missing years of fine tuning that pahole does.
>
> Let's keep this on the technical side please.
>
> >dwarf cannot be trusted as-is. pahole converts it carefully
> >by analyzing optimized out arguments and dropping signatures
>
> Fair point about pahole and optimized-out args. The problem is that BTF d=
epends
> on BPF_SYSCALL, and the environments I care about can't enable either.

This is trivially fixable without reinventing pahole.
