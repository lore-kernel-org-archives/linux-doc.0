Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F66A402BAB
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364624; cv=pass; b=tUriUySp3thE4j6lZNgs6e884s1TXS2qN+MzB+dctK9k8CrWyq6iUND+PfjQQLzVFDc6PVwCjAeonvASkfNeAhd//kXtKhClvQ6TyGE2pAsG6eMlZN3vXpT3c/DX+mk+Jpvh5QDfDuIEY2XdPnJwfka6vltU80xmSp58osMvK2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364624; c=relaxed/simple;
	bh=pGbN+jWmTUnUhmVdSv4PjGYUGPR4AJuGRrmDZfe9TOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N81PoRE/pWtRx0qkUjyrH3QRZqnD8YnKfgJn6gikZnSlogF9f3X42U96lljJ3spGDJQfGtSemOE0UB+M6noQjc+BTar/NDESUQ1HUMbTTU4n4Z82rYoK1i6tknmNDqpwZdRqCFt2GS/fF5R+HuSkAFAFcz8nr5ssXT7OQIoSqPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=siUVWbSY; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="siUVWbSY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b41b545d9so1407394f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 08:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774364622; cv=none;
        d=google.com; s=arc-20240605;
        b=E6E6kOMzjeOBUwYUwCXMDTd1bqijha/RaT3DJ6o/nL0yyxak7UWFWcqObGtOHJlUs8
         Peg3yug/uZO91TkZhfH6zjKQsV+9CNYdmFzC1JUqL4L7FRlOBefG7RW+jRsQv2rIdsuh
         wmHiatcCk8egciEH5iO3PGwT3dDSXSSuopa3rfTSTE5LGwxGiC5faWS7XoXormHM5VqR
         /ltgrHihgRstRqNHYCrfC9IkENeYZ042FPOV5TJUNsBmTGYItYtu44AFpO0KgeTunk9M
         NpKZ/GUm3Xhni6r3M3arQXtZnpyzxWSrbmTPi7swUjHyjUneKZr5IunLO9nZuCepFPes
         K06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7pygaIxmYy8vrcTultPBr5yJtweQmbJOPxaBB0Dq1tM=;
        fh=lOkeqKJ0+iG/lEUIpPztIGlvaTfydY3+FnhSVkDOfPc=;
        b=fOd3EpoOCqbTJaycp85jUf8KIc+U0Fst/++92Bc9lC+PDc5zpcvxGtWtxNQGsPFiR5
         i5wySg+N3Nuuno61UIR1q3DukC5wU8oBoTX7nCKMW+4XwJYMTqj79eVeJPjlwcuDu+C2
         nFy+qR9HNCBSMaIdfnanMepBkI+7R2685wPRPVu/MuC+blEEpQyLSn22GKuNRpST96Eu
         ZmQiuODhiR0uLvRRJdtf72fVnrjzr9mYClh5pvqqrkOB9NVN7ZXMqWfE6UAeh7FdHTMT
         Us+g2GbcL1zs5rdZLmgelIP2rgXf2OziOOvD0+K+/1tiU3MD6CLRvvoeXvMmGNY4auph
         MOxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774364622; x=1774969422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pygaIxmYy8vrcTultPBr5yJtweQmbJOPxaBB0Dq1tM=;
        b=siUVWbSYsavvuxYNjP/noYbF2sxVqbJG6PaAsB9okjKvG4Aw9y6LDOLp5hiqMfM5ke
         tD7QxgOChmurznz/jclKWPLualaCjOt5+yIbyBsTzQrH8ogjBbxzmJa5C8IqbKDGzY+0
         N+rxbhTOA+aJX1jJnKSgnOpsxYDj//mNeWklMxXUWL2ohm/SMETvB9MkMIxLq+Ea+jwX
         zv6TnqozUCoU6aT8Fks/btbFo1BwM1nnYq8JI50vzsGEvC3hFeDGsq6VNFp/iYvbmVmf
         bS/6Yx1EwlafiRevKRIo34SPtKeyi5qBkiydVySWmV8KG+ynX0l7s0PnX6AY63fMduCQ
         mUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774364622; x=1774969422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7pygaIxmYy8vrcTultPBr5yJtweQmbJOPxaBB0Dq1tM=;
        b=D2nmcqTPsDWfPKyZUs0NI5SZLAPwe1fQqq7lc3jBHiM/1hOey8FAQ0j0fNCG2uTbSN
         nrpMxxesgzqMC+kGeE3t9YtAYsXwnQpAlYB/atTjpA+zh3qOJjsPaYbtOMsYQdi14rW2
         V3J9dJigMH1N0vwaMaVALjhbmSUNz7ec5vzvmFuXIjxdttRa86FqFofsEwgyYO7szF9u
         dyGxtjFtq9wW4q8DTZpXhhh2jXPG59fqXtzU7WzZRlDaF9GrvQFF8WLPt4EG8CajzPsT
         sabRhXWJyckHTp5Bbjz5rs9DzveWx4U3K+5aqwqYymbLEQ7m8pL1LZ9Hpi0ygu+snaML
         gpZg==
X-Forwarded-Encrypted: i=1; AJvYcCUcW7b5PQTFQpfTE7G2V5KyxrUyQYHTBDikHrvW+Sv6ucil/19aS+2/xFnTrbsC3MOsSDozxj70/XY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy/abmk1AsOPuDhN0kNaN6huX71VNE2uLiXVuhwlZR3rsgZykY
	LK4+dL+DW9Uxs8eaBA36lUxC6QfmhKfSOIWspeSNAmJtCAqfeANesynFfhXExP9Y+a2oWnRvtb0
	IPVw0wkerKRtBRmXMyFENn9TKzsLkTAY=
X-Gm-Gg: ATEYQzw7L+k3q8RhU7CbfOD/t4SXrUlMW94L9MAcJqHPdzFgowauXRFftgqVI0V++ly
	G7iTd+bMpn1hyfMgOQ6bWwWufkz8i2Fngilozzy3p9xdzRQRKOnrz4sZ5UG3QE2cEThzmZWQVdW
	XQEk0ceuKn1T7qotDZ1p/Vlyqi0TshmwqWM2AMvwr8+cD9VCHlb4PMJALJeDMuPMlUE8WFlKSxC
	CQbIkpcBdDOSLamVyVOYw09YDOEAckyEC4bbNlJznnAgBSYmpGh2FNPjAZIYsktFIDI634n3veG
	PBYpYF0Nt9XTZf/hFxvhfWTzATM2nWPLfeyf4oUjo0ECjaKzkCK/MZkxi3Ni2okA59VW07iPwsV
	atGGdYyM6wGoXc+UEpTs5wEfR9g==
X-Received: by 2002:a05:6000:420e:b0:43b:5231:e94a with SMTP id
 ffacd0b85a97d-43b6426580dmr25272373f8f.30.1774364621590; Tue, 24 Mar 2026
 08:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323164858.1939248-1-sashal@kernel.org> <20260323164858.1939248-2-sashal@kernel.org>
In-Reply-To: <20260323164858.1939248-2-sashal@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 08:03:30 -0700
X-Gm-Features: AQROBzBtYHLNynVUYaVr0FFPgK1a9gR9szjQmqF2fXdYPXYOTswB5hwZbCigrcE
Message-ID: <CAADnVQJjJwRtUQNZAhLoXF7DYprhU97xJReZg9izV7n3f7=uJQ@mail.gmail.com>
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

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Embed DWARF-derived function parameter name and type information in the
> kernel image so that oops and WARN dumps display the crashing function's
> register-passed arguments with their names, types, and values.
>
> A new build-time tool (scripts/gen_paraminfo.c) parses DW_TAG_subprogram
> and DW_TAG_formal_parameter entries from DWARF .debug_info, extracting
> parameter names and human-readable type strings. The resulting tables are
> stored in .rodata using the same two-phase link approach as lineinfo.
>
> At runtime, kallsyms_show_paraminfo() performs a binary search on the
> paraminfo tables, maps parameters to x86-64 calling convention registers
> (RDI, RSI, RDX, RCX, R8, R9), and prints each parameter's name, type,
> and value from pt_regs. If a parameter value matches the page fault
> address (CR2), it is highlighted with "<-- fault address".
>
> Integration at show_regs() means this works for both oops and WARN()
> automatically, since both paths provide full pt_regs at the exception
> point.
>
> Example output:
>
>   Function parameters (ext4_readdir):
>     file     (struct file *)         =3D 0xffff888123456000
>     ctx      (struct dir_context *)  =3D 0x0000000000001234  <-- fault ad=
dress
>
> Gated behind CONFIG_KALLSYMS_PARAMINFO (depends on CONFIG_KALLSYMS_LINEIN=
FO).
> Adds approximately 1-2 MB to the kernel image for ~58K functions.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Nack.

You asked claude to reinvent pahole and BTF and it did it
completely missing years of fine tuning that pahole does.
dwarf cannot be trusted as-is. pahole converts it carefully
by analyzing optimized out arguments and dropping signatures
from BTF that are not accurate. This work is still ongoing.
For example see this set:
https://lore.kernel.org/bpf/20260320190917.1970524-1-yonghong.song@linux.de=
v/
pahole isn't perfect, but what you attempted to do here
is just broken.
