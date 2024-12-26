Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D31946CC
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 23:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735256039; cv=none; b=UDsy57zszEC0tYxwX3YnlLDWC6tFtO70qb0Pvwo2VJ417vHEhfQU7UchzZU/rH1SLbz1ombznbuPx+6RnwGRQgcH1PKd7vsie4I83g6zH3C3wJC0A4QpxfQWgt6y/mhBW14ZDC+41J70jkR36ZjHnTd+pJL/IbDzeziZqnbryeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735256039; c=relaxed/simple;
	bh=d+CZ3SZlBj7TBEObKis3PhKAlEPXdisrDlCGOf9uZsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZCOfc2ihZccQaJ0q2xb88D3NAXhPh/7bEoqrRUE9F9/CwON6f7Fqu5hswUYuE886l4GMnOotou/NpibBqG8NmYoTQCVcDPM9+jcPQZmzFemRF1axJc+G21oWKn10vEYjpr2oFlg3hC9Oh7Hqk6+OCk8LUCZ1Hphnp0H8MVSXcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cnxnL+W0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cnxnL+W0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso1420799866b.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 15:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735256036; x=1735860836; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u3OhTSnk9OWvmDG1Z/aUUbSC3WhUfhNvnWmedEshCi0=;
        b=cnxnL+W0Ta4/bAytqmFoOdSC3KvXHNvvvFijmLScaLNBAwwf27tbBXewQZh688EnIt
         DiMRiNKeYAnSoS218KmlSd0jytAFkscnLcEr4IdAjHI0FwaNmTdAgV3CSfQwMdHnK02+
         VL5tBnvwV044e9uDwvWcxVDWGFnukqfmK/NiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735256036; x=1735860836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3OhTSnk9OWvmDG1Z/aUUbSC3WhUfhNvnWmedEshCi0=;
        b=P/mRbsdfTXRbzeLz7cz82Ij7fEKoIZQLirEfQSUgr+tYEwmGpW14UPEw+cz+QQYiMc
         9eHIRfoeEoMHg8IKGVMjaCr4oizR0B9HGlgZqEiP0tpwaR23TcFZJ4E+a5TTJ816b0n3
         U8jXtXC67nKbZuOsey92pKxZ11M757voQTMM+d86kiZvVb3KLh0Bdj7CBRJ6mg03euHD
         e/sraiTiU9EwsQ++MZnOPWILaQaAncFFksJQ6rOiPpzReoOjHZWIHfIjha7wADgxRhJ+
         PjINBqVPPOXRldMw2brjyHt10QbdDUqNazMM2B+ysmn+O3gVofl9acbpr5VCiWBWwg1y
         TpdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/QIAug1IC17nr3Yt4Y2zxhYG2mxiksXoRPQI7qqwxkX6PXjoThjyzFAFo2n8LspoVJuhLtQ3SaXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4FqtyPLt6+Ast4TtpQKPT22c15i6phSoB3nq6M3jMK4pb6YL
	8CLEMPsKbsDQ/i7Ev7NpqBxmvnBwdUySkvTt+uoYIS8DFTdEd9W3UqPfMPYzcSQGcZMXG15uNtY
	eP3ijlg==
X-Gm-Gg: ASbGncs2/2yg9+NSlaIm/25Si0OSNYnpj6grxVkVXTyoCH5hat8juRGq05cCZPpzwgP
	VBAdNc2N4miQjEJvhv1vuMZl8hw7gY41usjTJPT4sqJ4VO7rBQmsCXw2/QJzVKUM7LocSs3K6+Z
	sweD+/XS30nRUZ33U1K+ZOEXiizlSiOeNKDpXH8jZRTKoWTd5FKkkeHoVWTm8LgnRXWAdrgEae1
	wz/syC6OaUERC+lnIk2kEGvP9fk3CSU4pq38XngOGswDDGG5MHVc8wdze3gVNG4s/NJVsH7no6+
	ug2H1LJchbvuM8FFFpxIhbO0iSDBkGI=
X-Google-Smtp-Source: AGHT+IEZkgl4U71LpsEMUa4lG0/5iS0BEDiL2RhK5WSGmwE4ZFHKSHN4wshKgSPLBmW6L1WAv/hjuA==
X-Received: by 2002:a17:907:d93:b0:aab:eefd:bfd8 with SMTP id a640c23a62f3a-aac33790c31mr2120941566b.49.1735256035664;
        Thu, 26 Dec 2024 15:33:55 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015ae1sm1030913466b.147.2024.12.26.15.33.52
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 15:33:54 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso1420794766b.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 15:33:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkSLKD6QjeWMCcU8qiLOfLrlEAjEG5vH4SSyjVBmIpMjcSQG7uYiSvzprdWXBn8vuh57LLyyQPmW0=@vger.kernel.org
X-Received: by 2002:a17:907:97d0:b0:aa6:2c18:aaa2 with SMTP id
 a640c23a62f3a-aac2d447071mr2323414466b.27.1735256032370; Thu, 26 Dec 2024
 15:33:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226220555.3540872-1-sashal@kernel.org> <Z23ZmVwgS2ErX-dj@lappy>
In-Reply-To: <Z23ZmVwgS2ErX-dj@lappy>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Dec 2024 15:33:36 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>
Message-ID: <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
To: Sasha Levin <sashal@kernel.org>
Cc: apw@canonical.com, conor@kernel.org, corbet@lwn.net, 
	dwaipayanray1@gmail.com, geert+renesas@glider.be, gitster@pobox.com, 
	horms@kernel.org, joe@perches.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@leemhuis.info, lukas.bulwahn@gmail.com, 
	miguel.ojeda.sandonis@gmail.com, niklas.soderlund@corigine.com, 
	willy@infradead.org, workflows@vger.kernel.org, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Dec 2024 at 14:33, Sasha Levin <sashal@kernel.org> wrote:
>
> Which means that folks should be able to use a fairly short abbreviated
> commit IDs in messages, specially for commits with a long subject line.

So I don't think we should take this as a way to make *shorter* IDs,
just as a way to accept historical short IDs.

Also, I absolutely detest how you made this be all about "short IDs".

As mentioned in my very original email on this matter, the actual REAL
AND PRESENT issue isn't ambiguous IDs. We don't really have them.

What we *do* have is "wrong IDs". We have a ton of those.

Look here, you can get a list of suspiciously wrong SHA1s with
something like this:

    git log |
        egrep '[0-9a-f]{9,40} \(".*"\)' |
        sed 's/.*[^0-9a-f]\([0-9a-f]\{9,40\}\)[^0-9a-f].*/\1/' |
        sort -u > hexes

which generates a list of things that look like commit IDs (ok,
there's probably smarter ways) in our git logs.

Now, *some* of those won't actually be commit IDs at all, they'll just
be random hex numbers the above finds.

But most of them will indeed be references to other commits.

Then you try to find the bogus ones by doing something like

    cat hexes |
        while read i; do git show $i >& /dev/null || echo "No $i SHA"; done

and you will get a lot ot hits.

A *LOT*.

Look, I didn't check very many of them. Mainly because it gets *so*
many hits, and I get bored very easily.

But I did check a handful, just to get a feel for things.

And yes, some of them were random hex numbers unrelated to actual git
IDs, but most were really supposed to be git IDs. Except they weren't
- or at least not from the mainline tree.

For example, look at commit daa07cbc9ae3 ("KVM: x86: fix L1TF's MMIO
GFN calculation") which references one of those nonexistent commit
IDs:

    Fixes: d9b47449c1a1 ("kvm: x86: Set highest physical address bits
in non-present/reserved SPTEs")

and I have no idea where that bogus commit ID comes from. Maybe it's a
rebase. Maybe it's from a stable tree. But it sure doesn't exist in
mainline.

What *does* exist is commit 28a1f3ac1d0c ("kvm: x86: Set highest
physical address bits in non-present/reserved SPTEs"), which I found
by just doing that

    git log --grep='kvm: x86: Set highest physical address bits in
non-present/reserved SPTEs'

and my point is that this is really not about "disambiguating short
SHA1 IDs". Because those "ambiguous" SHA1's to a very close
approximation simply DO NOT EXIST.

But the completely wrong ones? They are plentiful.

For a completely different example, we have

    ec680c1990e7 ("ide: remove BUG_ON(in_interrupt() ||
irqs_disabled()) from ide_unregister()")

which has this in the log message:

    Both BUG_ON()s in ide-probe.c were introduced in commit
       4015c949fb465 ("[PATCH] update ide core")

and it turns out that that commit ID doesn't exist in the kernel tree.

It is actually a real commit ID, and it *does* actually exist in the
historical BK import by Thomas:

     https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=4015c949fb465

so that's an example of a cross-tree ID, and yeah, it might be really
cool to "disambiguate" *those* too.

But again, the problem wasn't actually that the SHA1 was _short_.

            Linus
