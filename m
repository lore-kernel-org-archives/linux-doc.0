Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170CC43E9C9
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 17:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979279; cv=pass; b=gvPE9Ef6dWQk8crfw+kkUCM/J+UAwp76I+sFpuZNw/BLZKcAbB+wrXY7zuDXB8gse0GjMS79xykfHUHuuIjKeCwRYGQn/lGGEv9dM9lzPuZGlatOyXgr8Z8S6l2obhzR9PyYShvj+P+x/jfYPqoksvjGnJ7EneDEetQ5oN2275k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979279; c=relaxed/simple;
	bh=0gsHE02IRJdRhrhJLMxNqQrK8YKfaYio1tL3SdU4Cww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZkZLR7QtdCbu/Z4iKTfnMQwTCBIchFPegF/6bUzv/EkoH8N/8gJQLXQ5C3f21ip5X/9Rtt8XF1iECzI568CPZQo3U6xUHlN8bsbz2g+eARypWpW1RUZRw4cJjjiB0CujE3Np3bvr4Ehg8y6e8UcbDCdkIZ9NzcIxvKJCtfhUPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btmB3XFt; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btmB3XFt"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12a77005d69so424754c88.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774979277; cv=none;
        d=google.com; s=arc-20240605;
        b=iEfvziMnNBb//JFEwkC0NQ1Vg+Oa2NEenZonNk/Cmji/n/gKcRGF+yPHX9GX7AiHKD
         J6LJK2dXZzMxYM/cnNhDlNPY6af6F2ckAiZMYCy6cbnMws7ORqgGi51eRu0rUt+M4CPv
         idm0/7ARsy+TNSaQ+Q69jGsS++biSqQwWNBgZVyRqQK4zWjjKgTSMbgTTNayq5gl5Ild
         vUzELAid2Rkq/jatRXMZBVxBaciAhxyS1p5MU4u4awF01yZMK+GLPkPpHIx8Vm8eHo1u
         iHkxbt6WjM/PgQWHmQkm0XvA924DJSTe/zSncZReiZcbdWrn+C9ykTQaxF7Dg9sc34rJ
         Yyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        fh=BT8RagJvkAK5WFx+K+r+KG3ms2AutJi3Ke7KEYLgjWI=;
        b=VH3FFJm83ep9t+2+re3FgWdpJXgB+hnUwh1e5b+gpyyPRLxQsxH2mApEuUNqV3m8x0
         ivHokwbZQLkm8LdTRGaEIj2mUU6xctA7/+AhdvivEn67aRgZl2ikk+r4QxZbl85mFPCo
         nnRGZaXo5o8bCFMMFbukA5bvRq4m+f3O7gfPPEBFN3alspz+j6JCCHs1xQ3n3Y0Sd6nM
         DJkfuZCEOazS4DygMkDdvZ36hmjbnoroHaOdX5LVvASLFEK0DEoi3+CpAmb7ZPzU8oIU
         FU8AsOYBZXRYGCGhr7bZBgy3JKmO19k2Lx0Ykj9VAgCEq/mK3Q9hAPw20/CsQ81toDXz
         xxXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774979277; x=1775584077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        b=btmB3XFtp4LixOK2c4UFCeR5b6tfKUvUYhR3vnU3nFxkJHl4SrrkPapy+cHtb30M/v
         k1eXNFxhdIPR86KCcF51ufDyUS//+/wo3RjBmQTQu6lejkedge4KdU3fsh+PzNJP/8OV
         PtxHW274Ra/LVp97xypVHozFahjLQ22/etehT5ibRL2HZIoent9W2lsWOK4IZNWWktfE
         rUAcPv824IJX8EgDkjViOgIdIyU6sIH84G3U6vMUyKalbRVvU2COz0dOzghIK4RSlk6T
         B4W83BsNLiVSK4Yu6Z3Ucb3EBOWLFwRQzLxOmUW+/WdwxBLZUufRDHbCQqSNIeb7xW/4
         39zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979277; x=1775584077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        b=FbDqEwpDkP8px1xsjubkB0Z1iqhhFdQbq7PGx6GRehol/aTDWfk+3EoqZ9llzg+gkm
         NSOtF7jhyZE5QXYMZc/Z+VvfyOAIy8YwfP8F2g5FHiIklUkxpulXmm52HBZhFQ81HQJI
         lbvA96phvF3tV6JyUZ4+tYQE80nMKljqr1Sp5s39KruBuist0yKFizCV89L5p+UjKQZw
         9dj2S3gy2S1oWA6RDgLqfBDm1wytofp9qIiTpGaXBsS1esnRWei50aZC48UgctiNG/Z2
         KLUasC5QHSg7O10RojzT6w7LQIwn/p5XDS2fu1EvXyVXx2fShmYpKYxUGfPaz7jiBp0p
         IdZA==
X-Forwarded-Encrypted: i=1; AJvYcCUFSYDoQR+qdUu94P7GTTyVzVEkoYQ3GKlbdcXP/wpSubI84z6/6MvlIM1O1+cBIZDfE6aRunOM7rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOAAYWElq6qgnhxuU4ng/nokkJFni5o0b6APYps3MGxfORxgCg
	VBz8C6LIhN3yzmm4tD0s9u/b7N7a8uhhBcu9c+MbGhv5qBWn6pBoUbKa6E7PG+cme85HtP0XQwX
	Ud8HRQi+nZK0ZRBTEIVUbcuujXPLlZ6g=
X-Gm-Gg: ATEYQzw4F1TiEA7OJxUC4SeLrYZvYc2axTj8xPZ8DyCCGSt+DmsjZ1v/AIL8ilADy9V
	RxfkX5TUtgfN6L2u7WKUPImWiNcztRWDqwikmgIYeSfvOBH65w5y2sRb6GaMyzHrWhTYGbWzqJJ
	vAhJsC2Nn8sBwPNpuFJucakDwgxd0gXvdKjM088xrmdkZZeDXaX5KtXJ3sRWl0BNrwgqQaPsmRt
	4FucqLg/MtPDyMNYyiFZpyHwVNCFOoDcCwWGA/UlxZzkGLhdCkC+RnBCjxad9MwnaQnCZxggcFR
	fPOE/uj0EEd5KmmPHbe5Qp5eUqIWB7v7bErs77EsNRaNV7vwa211QIUDtktOW02nDseKsAGARfJ
	WTqELmtEHw2AZARoqfB3qYSM=
X-Received: by 2002:a05:693c:3013:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2c9333b1713mr40887eec.6.1774979276969; Tue, 31 Mar 2026
 10:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
In-Reply-To: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:47:44 +0200
X-Gm-Features: AQROBzCQ6Wo3TBLhc4gV7S4by1XCetN63ihcS6-yEhM3XyLxgnvaM_4biv0PCmo
Message-ID: <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 7:11=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> No stupid one-character things. If we go down this path it would need
> to be "wrapping_u32" or whatever.

That sounds close to similar types provided by Rust, i.e. if something
like these types are used, then it would be nice to match names if
possible (assuming they are similar enough, i.e. no surprises).

e.g. with generics they do `Wrapping<u32>` or, in other cases, without
generics they name them something like e.g. `NonZeroU32`.

Having said that...

> This needs to look _very_different_.

I think there is an actual risk of someone e.g. copying an expression
from one place to another, with the operators behaving differently,
yeah.

In the Rust side, even if those "explicit" types like the
`wrapping_u32` you suggest exist, we generally use the methods on the
normal integers instead, e.g.

    i.wrapping_add(1)

    micros.saturating_mul(NSEC_PER_USEC)

    self.index.checked_mul(page::PAGE_SIZE)?

etc.

The advantage is precisely that it is more explicit and avoids
confusing the operators when copy-pasting code and so on.

So that could perhaps be an option? Kees et al. have been thinking
about this for a long time as far as I recall.

[ And for the usual operators on integer primitives, we panic by
default (configurable via Kconfig), but at least that applies to all
Rust code, which is all new, and kernel developers get accustomed to
think about what they actually want for a particular operation and
whether they need one of the explicit behaviors above, so it has been
good so far, but it remains to be seen what happens when we have way
more code around etc. It does mean someone copying a simple math
expression from C to Rust could forget about it, though... ]

Cheers,
Miguel
