Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032F1374E78
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573473; cv=none; b=kXB6In4+5Dq7Dtk1v3NwfMYA1omTn6ZxZib5GKurg2VbSMrcOuIGleAQDkl2ll9L4hVCPu/ySvUlIzkwkWA0iqbOTPgiW5fII6aQkaNojfDfMRw4PzSgpfk5ZG0+u0fVbYUz57ii0YdG9pHYKPTF9FqD6cVTs6Y8mcgb7RSeMTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573473; c=relaxed/simple;
	bh=GKC/6aY/fX4AuHN5nvpVSyIlMI8YejQxjzNrIxlG8cI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqYiBhjzgLGuOLrCypDj9rYsoe4/RugBGvOGpnLQ1VsTCs1hlOWE5g2627nJu3hxkT9Bee7Qv78T3v6tLE3Aya7ADl7fu9ed/zkIEJsoZ4YyaFW6YqCRh5mKLQNTFPWD5CzDXemSFwbeW99wOwXgieyAs1tf7ZW3inU9GiZFa9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-45f126d47b8so4702716b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 13:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772573471; x=1773178271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmPwQkA8aJZjLJygLiKXdhC/x1FwVUYVZ/mvrrcqizQ=;
        b=Ky0vnrOSULmUyLbhyDPMyCdBdCdjzl71W8oGhJ68PsIzfiQxK9m8YGdjoHnsZUUGif
         01P1eTM5R2GE8vFocebLqQc5LZfFJBJv62Qr944EDLcL7C8qZRxCb8Eq7wJX+W/7r/vV
         HO9q6j2fvZYpJ2gQdkRgZyeSfvWePN8gsE9FS/OWDu/Rnh6REayNy1AV3QaYy+xdKJSR
         0tYFoyiM9s0KStN3flx4e+/qCptfxZe8PD4XBz306CoWnrFP9UuUidseJax2VJ2t6oTL
         G8FpSnUPVGOscFzbe4Dx2t0jVoLqqBRSVyhsZGVFV0Sr3MxXIH6gadAiuJgNENVcSo/u
         U51w==
X-Forwarded-Encrypted: i=1; AJvYcCVSR79cLxLmw0IgU+d0S/TB0/eMrPO6gg9s/8zI1Us+v+CrbiaMH5HDrZpnhkG50PVVMC6r9UPXa10=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZMnHpfa81JlxU8GSoo+I/jGpma1Pzjvi2dSi/06uKxCFc77A
	5/4XFX8GGBxjjiOLR9Vwx+b8LDEqKQk9yGk7gVZKd9W3MZ0N9kVO3eNw6H/7WvMd
X-Gm-Gg: ATEYQzx4ISAUZxHjOpGoCPaQ4pe33mQrL4O1CygnM//fwmsICqDCMbPAA9OiAh0fnPh
	KvCpbiHGYZB0CvOnSqqyin4WCwF13c+Sa2knJ+GEGVMFNsbOe4ElXfnUQHzwAAwnruKLv+xnPj9
	8kFUgInSUvEKGKGk0nsEDRbuXq5Bj99GgpmPC2FD4Wa5/H5xMWysY8PHVm/ZYme2ZgO54bA4aP/
	ZwngYfIlQ4dNDeB9ck+GWGIoOk3pXN4oyyqoLBLbiCxjxvN/bkpj7Or5HH4tdfloCFotwAj+qWQ
	MTLnpgxT8XULDV+UbELP91ecL6DhwDw0aYfTT17N+BYuyzw2/uR0NwRsa2rUmYtEj0Baw8fqHox
	VGHAupm/BGIgrz7nlO+ycYk7aNaBJi1bUOWQtB5dTcBct90nXU08yj816m6RjbSGoViInJWVXEH
	aKws707W4YeREN0NLd8uITt1VO+WeYWxo14FN4lHTH9hvETHU+m7HKc+u4sow/YKZ1
X-Received: by 2002:a05:6808:150d:b0:45e:a576:b2aa with SMTP id 5614622812f47-464bebfd65emr9941851b6e.51.1772573470844;
        Tue, 03 Mar 2026 13:31:10 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm10361296b6e.10.2026.03.03.13.31.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 13:31:10 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45f126d47b8so4702709b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 13:31:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7JyEA5s8/I2odlsoAf88SAynC6q0IEUTPkmLvktAfvm9C9hQivYiSSc0J1JvlUPk2oIZpvF/8QTU=@vger.kernel.org
X-Received: by 2002:a05:6102:943:b0:5ed:f13:e58a with SMTP id
 ada2fe7eead31-5ff325ad1bbmr6476605137.37.1772573130116; Tue, 03 Mar 2026
 13:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303182103.3523438-1-sashal@kernel.org> <20260303182103.3523438-4-sashal@kernel.org>
In-Reply-To: <20260303182103.3523438-4-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 22:25:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUv61E0wnQOaZ+M+pXrzZNYzsQLQV_05uTpz7YXyu25VQ@mail.gmail.com>
X-Gm-Features: AaiRm50MU22nmE-L93SR-97Qa2M72gOliUTByfCL_hDHorQGfLK5J9LZ0BvCKqM
Message-ID: <CAMuHMdUv61E0wnQOaZ+M+pXrzZNYzsQLQV_05uTpz7YXyu25VQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kallsyms: delta-compress lineinfo tables for ~2.7x
 size reduction
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Tue, 3 Mar 2026 at 19:22, Sasha Levin <sashal@kernel.org> wrote:
> Replace the flat uncompressed parallel arrays (lineinfo_addrs[],
> lineinfo_file_ids[], lineinfo_lines[]) with a block-indexed,
> delta-encoded, ULEB128 varint compressed format.
>
> The sorted address array has small deltas between consecutive entries
> (typically 1-50 bytes), file IDs have high locality (delta often 0,
> same file), and line numbers change slowly.  Delta-encoding followed
> by ULEB128 varint compression shrinks most values from 4 bytes to 1.
>
> Entries are grouped into blocks of 64.  A small uncompressed block
> index (first addr + byte offset per block) enables O(log(N/64)) binary
> search, followed by sequential decode of at most 64 varints within the
> matching block.  All decode state lives on the stack -- zero
> allocations, still safe for NMI/panic context.
>
> Measured on a defconfig+debug x86_64 build (3,017,154 entries, 4,822
> source files, 47,144 blocks):
>
>   Before (flat arrays):
>     lineinfo_addrs[]    12,068,616 bytes (u32 x 3.0M)
>     lineinfo_file_ids[]  6,034,308 bytes (u16 x 3.0M)
>     lineinfo_lines[]    12,068,616 bytes (u32 x 3.0M)
>     Total:              30,171,540 bytes (28.8 MiB, 10.0 bytes/entry)
>
>   After (block-indexed delta + ULEB128):
>     lineinfo_block_addrs[]    188,576 bytes (184 KiB)
>     lineinfo_block_offsets[]  188,576 bytes (184 KiB)
>     lineinfo_data[]        10,926,128 bytes (10.4 MiB)
>     Total:                 11,303,280 bytes (10.8 MiB, 3.7 bytes/entry)
>
>   Savings: 18.0 MiB (2.7x reduction)
>
> Booted in QEMU and verified with SysRq-l that annotations still work:
>
>   default_idle+0x9/0x10 (arch/x86/kernel/process.c:767)
>   default_idle_call+0x6c/0xb0 (kernel/sched/idle.c:122)
>   do_idle+0x335/0x490 (kernel/sched/idle.c:191)
>   cpu_startup_entry+0x4e/0x60 (kernel/sched/idle.c:429)
>   rest_init+0x1aa/0x1b0 (init/main.c:760)
>
> Suggested-by: Juergen Gross <jgross@suse.com>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks for your patch!

> --- a/include/linux/mod_lineinfo.h
> +++ b/include/linux/mod_lineinfo.h

> +/*
> + * Read a ULEB128 varint from a byte stream.
> + * Returns the decoded value and advances *pos past the encoded bytes.
> + * If *pos would exceed 'end', returns 0 and sets *pos = end (safe for
> + * NMI/panic context -- no crash, just a missed annotation).
> + */
> +static inline u32 lineinfo_read_uleb128(const u8 *data, u32 *pos, u32 end)
> +{
> +       u32 result = 0;
> +       unsigned int shift = 0;
> +
> +       while (*pos < end) {
> +               u8 byte = data[*pos];
> +               (*pos)++;
> +               result |= (u32)(byte & 0x7f) << shift;
> +               if (!(byte & 0x80))
> +                       return result;
> +               shift += 7;
> +               if (shift >= 32) {
> +                       /* Malformed -- skip remaining continuation bytes */
> +                       while (*pos < end && (data[*pos] & 0x80))
> +                               (*pos)++;
> +                       if (*pos < end)
> +                               (*pos)++;
> +                       return result;
> +               }
> +       }
> +       return result;
> +}

FTR, arch/arc/kernel/unwind.c, arch/sh/kernel/dwarf.c, and
tools/perf/util/genelf_debug.calready have (different) LEB128 accessors,
so there is an opportunity for consolidation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
