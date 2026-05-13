Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7F4DA55E
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685382; cv=pass; b=eFrD9/xVdJfT2SpoHxYGvwxx/jutUioXBuySvT3I0fuuYevXbnQW037qTDF3XrZ+/N4gMfzDxCGjcQ8qS4b/WEVV9DiY7Nws7iz2pWN95r9i8h2qxWFxvI/XzS8IcTHJ0ejCQaNepRJXu+TTO9D0MtdlbnAob6zenJ/RjSr7Rg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685382; c=relaxed/simple;
	bh=ZTWd08QYLDoCVU3wPjbZfH0wB1JeDMyEm30KX5aLTcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjX0rREoVF2jmEnMjL25lZNnngN8+5P/wCkCPIYvZtwTkzFbTYKfMEItWukTOdkJ3EJJXqQl2Ic/+ExFG7CNkKnDWC+7CdokDpz76U3Ea/eQgF/I5vbwoGZrV3qjTyRo8boCg00HnUde4FOkSuAu3AhIegnPpmLx8vun52n1K/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYf9ReZR; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYf9ReZR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d734223e4so4294576f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 08:16:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778685380; cv=none;
        d=google.com; s=arc-20240605;
        b=e0ujIuOruaQmrAIg8UxYss2qyj5iO7s9i8+EEfOWci73IDpnhBNXZFW6U88ZYgrSa/
         xRUd6g9TP69VhP1KGRXLEqJX/6UVWmTfeJZXhXBnetdeVW8Z7WuGKUIWNXZw8u+/nuvi
         JA3URKT7mv0am25/GHlUKrwoLXPo+0+4Zvf6zqzFPcyCVYMV/RQZcFl7vuYkCfizWH0z
         vhQF491vr0VF7VLnEHcy8pAaSTxjdVz4NYFWgxgChj5YsES07SY5KsdQ6c9FPrxZ8xWJ
         3IOeGniKa8eiMZ08/NNjUM1iJ6FOthy5C35WAPrHsJjkdfwyIehnuxdtjltzbAnO71JR
         4+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZTWd08QYLDoCVU3wPjbZfH0wB1JeDMyEm30KX5aLTcg=;
        fh=t6uRuFNB/O0aSMc5riG7WsE3eN+sUBWMNuqRW3RDGsU=;
        b=AT0B6bIgTUOQpuNNOP3gJdVlIHv1uITtKoOx8n9MO7CbYqVULLcHkFA0jRKuZANuiQ
         09vR9dBheAs+g3zQcMuEK4YWb9gPCHbsKrH4n6aboQz4knBnWkUvvO0i8Uou4VokXjLO
         z5bgRRq+KCinfS+5erbXjBJ3G++OaA2N65LuO4OMQsKDkJkVYQm9MFWai3RvML9z6/Bp
         SX3K3jjVHz7/rm1X9mh/m6RuJ6lzMaoD3L9BpDEk43ZrmI3At9+WxLBA0Dg9jtPJ70am
         PCA4y/71jkD1xcF9oLinrJ1ezv16BcBGZSpx0DrkSvpqDqZz2qTOOsLIG+Ux8nMNzTaN
         ISGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778685380; x=1779290180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTWd08QYLDoCVU3wPjbZfH0wB1JeDMyEm30KX5aLTcg=;
        b=RYf9ReZRO1TZr91D6SdFQhXfIE1FZMq7OYS4DO+Qz4bUwBiNTOANNBMCuNOHAqvfqp
         ystNKvsLnaFyhDhfeiBLnEVYQSuFLO/lBZ+kolsZI9bbyGdKA2HjzhgSkSIALcDTq95p
         TdE/Tjksk53u+JSxNgCdqU5S6QW3fkmraOv/5Slb3f5r4uzjhR9pZBxI1Ixfm+nxcHDQ
         DHWNoTxDhJCT1CC7C5KyLAWUAlIk1zTkQYgX00KToUj9QX47aVUq7F16gg+pBkbkn1Rn
         3TPrdMm3jsVs8RGtpMg5vPwnXP2GOPMpVdtM72onjYZUvCAFPs4FRuVqEWmjtjcFSgVF
         0Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778685380; x=1779290180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZTWd08QYLDoCVU3wPjbZfH0wB1JeDMyEm30KX5aLTcg=;
        b=hd0HFqT2ZgLC5U4j/j8lbUV18YGT44zr5rOxA7om003rXloRWQmFYO7PnG16/i6RDe
         T26fCevYypIfB8rIoqQfB4QIEu23UljOA6A3C9L4GOXCDtKdb/y55R1QakhQONf1M89q
         dlUNDd31Gs82G3w2pUAP41A6HchGa7XaMwOPL8w4TGr0ZW3e8gYb510eVuwXTRGYfi5i
         FjniTn0meQCLkLh/PoxWjzSFMs7tTLkeiEcmqyLizstMbgitqZGTpNP+dbkSHsdJ/x0F
         s2ZEm6uwN/Q1pxdHBcU4YMo1+NlqL7V6v5K3URprsuW7FXvT+UAXqQYOEiB1X4dCqwoh
         xxBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NZCfMmdQb3VHb3OoP/RVAt+dVSz4hvBV8WFQTutyKv7JmyuABbAc0lURJlCsovp8hIV72IxaQMk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0i/6w789IiEqOKKpehG31yV+Lkw47up9tkl1CuLANE8hOn/f
	5VD46caKnz8fRirNCCooMaIOTVFVU4owlAD4s7b2r/lvtdKjKC6GsRYNP+sFmXsORcfpgZTV2Se
	jD3TAR4MNjQQk/PXBdcPP1ufMiAz2BQA=
X-Gm-Gg: Acq92OGQPLc6c1Jaht+BpWbJ4t1dnqznrOfdPWXCd7SqfXATgrPLowEXCxRZLhAPLWm
	2IZfqIsaHMtE59GGxs2iCLm9dqMiCM+CfXW/wS0ke+Tqta43YhpkmFKfFGW+72YCPeYh+4nmNXN
	FwaJq0LR4vJ1cgu3bN9NYg8/AbCBMzMI2D0larbP6J2jwwIdMiVniZA+RG2diE71n/cPjFMmlBi
	1puPSmRVO7qPTOO75YHHeIbnD7O2tDT5Zsc5BUtJXR83wqm8HDNoMd95sext22eoKldbJIXaSr8
	CjNXPn1PZ0fiIF0V24b+qZFenngvXSGwUC4KY3MHceI9WTT47RU8mNkiudBgzpRmP0nHoZJUFfw
	7vdd0PRgJeLOAnc+906nKDShBKkUq620ImcWV
X-Received: by 2002:a05:6000:230c:b0:45d:7fdc:2e99 with SMTP id
 ffacd0b85a97d-45d7fdc3157mr418669f8f.12.1778685379310; Wed, 13 May 2026
 08:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503164700.548164-1-atomlin@atomlin.com> <CAADnVQJ5fatNF4auH+a8E39zWMfja3rm4BM_xGcTnLX8uuCQ9Q@mail.gmail.com>
 <20260513111331.7bede512@gandalf.local.home>
In-Reply-To: <20260513111331.7bede512@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 13 May 2026 08:16:07 -0700
X-Gm-Features: AVHnY4LJfmK-dE4pIdLQKgR6OWhmqcSutGy2bdmOOCvWq48N6k373-5ZSYGW1q0
Message-ID: <CAADnVQL_sWznA+JJLdzP_ZdUgQeO7p-AGnOtx9=fXjH+PnRJBA@mail.gmail.com>
Subject: Re: [RFC PATCH v3] bpf: introduce TAINT_UNSAFE_BPF for mutating helpers
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, Song Liu <song@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Matt Bobrowski <mattbobrowski@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jiri Olsa <jolsa@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Randy Dunlap <rdunlap@infradead.org>, neelx@suse.com, 
	sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com, 
	nick.lange@gmail.com, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 8:13=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Sun, 3 May 2026 21:51:49 +0200
> Alexei Starovoitov <alexei.starovoitov@gmail.com> wrote:
>
> > Nack.
> >
> > Please stop this spam.
> > We're not doing it. These helpers have been around for a long time.
> > There was no need to taint then. There is no need to taint now.
>
> Hi Alexei,
>
> I'm wondering if there's a way to see what modifications BPF programs are
> doing to the kernel? I try to make it easy to see what modifications ftra=
ce
> has done (like the enabled_functions file), because I like to know how my
> kernel is modified since boot up.

It's impossible to track all modifications.
See what sched-ext is doing.
What does it modify? Everything.
