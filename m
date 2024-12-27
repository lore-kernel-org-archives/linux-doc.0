Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A1AD2C
	for <linux-doc@vger.kernel.org>; Fri, 27 Dec 2024 01:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735264245; cv=none; b=M7nhgQqCg+TU+xRJhXv+NKeSvLJQ9YT9UoisvVJhNtrh0LS0uS5u50T6CUkNamm87PfdFMkWdZuhMsH9PqJLVBnxj11EZ/99h28+87/BbdxmNd4a0ujiBcjJIjXhHEjmeI70sYUGNC3KeFcgytC0P7qGCAeX0cCg+FqNKKrBuTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735264245; c=relaxed/simple;
	bh=J+sk83kBxA8PX3XMS6F3r7Q626WvQK5wAPcJ+Z847Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJUChF+FIqE6J8ip+vvLNO+90gd/QTdRAeuCMxagxFMHnlQ8G/o8rp2ogsCdZMSaU+KaFenj/rb+3Xlc3sGfoAPMpUjFc0z/5yRduD/JXa8R0qTSlsOTYRB8IaObDNr5f0otMkhdF2T6xCYBGnLXKK0in4CJwmobVr48Z/99WyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=N4dUZ8eP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="N4dUZ8eP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaec111762bso812133366b.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1735264242; x=1735869042; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kdOXV/r4Kvy1730Y09O+RKtKCgbqti+a4lbcvgD4Mz8=;
        b=N4dUZ8ePyweVRr+/ZYwQSbkESGXCuMRZLrCbTwYwS/6zs+tZO59IhDG+QRJLPrnwDn
         B1Rh9arArY9YnYhLvMZTy2WL5hURdWUkC0vfMHoK4vyDLmGUjzSE5x4+gNZ3vL9ZgDWi
         AbQ8OXeWdQfEZMfJQb/VwQ/56m1i/uHYUZSAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735264242; x=1735869042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdOXV/r4Kvy1730Y09O+RKtKCgbqti+a4lbcvgD4Mz8=;
        b=gu0h1NmYQlLoaw3MC7cGUc8dfxbTLNSg1TEdSd0cIPJGUV+lk4N/9d2bwMpHsGL7Hn
         Ci0nWkLosaswl55511mO9W3grPHr5y6z9S8sDcSAPi2c95Tt5v/2mMrDshyO6vcI2jdl
         k/IpiYfn1GdQ5/77Md1flzdK7er/PfDRx25xmmlECqxmeTxxjaOYcIqL9QTrrm9XLSKl
         hGsOBmqCDEYo9NKbqQUqimm0Q+HgqJaae2PG4mLMMMVoY1lXESG49eebdkKotO/88gnM
         U2u0MT4BLS4D9yCBZmG+XQnFWoi+bHq0TR6yMxb2vjLIzZioToUGvspUC8UYjX3V2+fF
         9POg==
X-Forwarded-Encrypted: i=1; AJvYcCVvh62PpJatPnpe73uiRXBROocLWP0FzGB6caF9UqqA6Lv+XhN6+C53ntOU9FEX4s5DblOoCqSNW7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzMVzqm33Ei+keA+Ful7a9G6xH/GiTduR0lNgnZfAkwJhGhqmV
	m1pq7HpT44l3bjrFDB8dB7F/aQn9uV6etZcD/5DRgUbIWYX9Eujc6uHTcpeVfeM//T+f5UjGIYq
	M3NVZQpXw
X-Gm-Gg: ASbGncsWfd5UfSigllbFSXX3NYbbSoyy5KBZNTNtovBxtzr0YP1SEbeV/N8/ROl8Fef
	zxmwTJhkMsYpJl1F+Fn9VNxyP8zsTwPbMHl0tm0uaM4YLg9+a4jFEWYN6pdXlrwcmlK6M168KfA
	ygj3LaIWTdYjkil0v+2NZIBkkor0PyLYCx/49NWCMW31KpV+d3PbbWGx7BefrZx484pyXbFuj/G
	SVZ2cChyNNaOlKzL3tpQyeGsYBgHFvkGTdB816ye8/EpEH/L9s26pQVLCkpbDTSjxbB7pPUebt+
	VRPuKa7prYX1Z9kFvc7Ruy/+o6Wmt0M=
X-Google-Smtp-Source: AGHT+IFfPH/dDrstqqvkAaeH9sDWcfR3ZSyu/dB2T9rL1hL04ahuHPN9XpAEmud9gRmXUyomTW76bg==
X-Received: by 2002:a17:907:72c4:b0:aa6:9599:a9af with SMTP id a640c23a62f3a-aac3368ad56mr2017256266b.53.1735264241615;
        Thu, 26 Dec 2024 17:50:41 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f58asm1044287166b.39.2024.12.26.17.50.39
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 17:50:39 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so219212566b.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3oA/hq1UNhMO7W9iweu2qgBbhUswjxPZw9KofbEMSa7/tJo9FdwvdNfQlE+T7+DoQ781eyP2t4aA=@vger.kernel.org
X-Received: by 2002:a17:907:980f:b0:aab:daf0:3198 with SMTP id
 a640c23a62f3a-aac3352c310mr2283149766b.40.1735264238634; Thu, 26 Dec 2024
 17:50:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226220555.3540872-1-sashal@kernel.org> <Z23ZmVwgS2ErX-dj@lappy>
 <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com> <Z237CwC_YKhoZubs@lappy>
In-Reply-To: <Z237CwC_YKhoZubs@lappy>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 Dec 2024 17:50:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiH=HH9CfFFuBwAwDdfZAjCzN=yAhzWehCAR8bg_-2CAA@mail.gmail.com>
Message-ID: <CAHk-=wiH=HH9CfFFuBwAwDdfZAjCzN=yAhzWehCAR8bg_-2CAA@mail.gmail.com>
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
To: Sasha Levin <sashal@kernel.org>
Cc: apw@canonical.com, conor@kernel.org, corbet@lwn.net, 
	dwaipayanray1@gmail.com, geert+renesas@glider.be, gitster@pobox.com, 
	horms@kernel.org, joe@perches.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@leemhuis.info, lukas.bulwahn@gmail.com, 
	miguel.ojeda.sandonis@gmail.com, niklas.soderlund@corigine.com, 
	willy@infradead.org, workflows@vger.kernel.org, kees@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Dec 2024 at 16:55, Sasha Levin <sashal@kernel.org> wrote:
>
> What got me worried originally is the example Kees provided which
> creates a collision of a 12-character abbreviated commit ID:

Note that you can always create short ambiguous cases.

And in fact, since the way you create them is to just put noise in the
right place and brute-force things, you can also always make sure that
the one-liner short commit name will match the target commit too.

In other words: just accept the fact that a short hash is simply not a
secure hash. That's very very fundamental. It's just inherent in the
whole "we have shortened things to be legible".

And once you just accept that it's fundamental to any short hash, you
can relax and just live with it as just a fact of life.

> So sure, we don't have a collision right now, but going from 0 to 1 is
> going to be painful.

I disagree. You need to just own up to how it is, and more importantly
that you WILL NEVER EVER BE ABLE TO FIX IT.

There is no way to disambiguate the active malicious case, because the
active malicious case will just be able to handle any disambiguation
you throw at it too.

So the fix is to not *rely* on disambiguation, and to just accept it.
Don't fight reality. You'll just lose.

> Are we going to be actively watching for someone trying to sneak in a
> commit like that, or should we just handle that case properly?

See above. There is no "properly". There is only reality.

Git internally uses the full hashes. And any reasonably usefully
shortened hashes *cannot* be disambiguated in the face of an active
malicious person.

If you have some tool that you rely on absolutely to give you the "One
Correct Answer", then you are already broken. If thats' the goal, then
all you can do is give up and pray to some random $deity.

Or, as my argument is, DON'T DO THAT THEN.

Don't rely on some absolute thing. Accept the fact that a short hash
will always possibly refer to multiple things, and that you will
*always* need to have a human that actually *THINKS* about it, not
mindless automation.

The best the tools can do is say "there are multiple options here"
(or, more commonly, "I found no options at all, but maybe it meant
XYZ").

Literally.

To summarize: If you are aiming for anything else, you are bound to be
disappointed.

So aim for that simple "let me know about multiple choices", with the
knowledge that they are going to be EXCEEDINGLY rare.

And then if we have somebody who actively acts badly and works to make
that "it's going to be EXCEEDINGLY rare" be much more common than it
is supposed to be, we deal with that *person* by just not working with
them any more.

See? The solution is not some kind of "this cannot happen". The
solution is "stop accepting shit from evil people".

Which, btw, is not a new thing. This is how open source works. It's
actually way more work to create collisions in short hashes, when you
can much more easily just send a bad patch that wastes peoples time
without any hash collision at all - just by virtue of writing bad
code.

So thinking that the short hash is some kind of special problem is wrong.

It's in fact a particularly *easy* problem to deal with, because at
least the whole "somebody did something malicious" is something git
will balk at, simply because the basic git tools will refuse to touch
the ambiguous hash.

So *your* tooling should concentrate on one thing, and one thing only:
making it easier for a *THINKING*HUMAN* to decide what a bad hash
means.

But you need to do it with the up-front understanding that it requires
that thinking human, and is not mindless automation.

And as mentioned, the most common case of bad hashes BY FAR is the
"oh, that doesn't match anything I know about at all", as opposed to
"oh, that matches two or more different commits".

> >and my point is that this is really not about "disambiguating short
> >SHA1 IDs". Because those "ambiguous" SHA1's to a very close
> >approximation simply DO NOT EXIST.
> >
> >But the completely wrong ones? They are plentiful.
>
> Is the concern mostly around the term "disambiguate"? Would
> git-sanitize.sh work better?

No, my main worry is that you talk about short hashes (and talked
about shortening our existing ones even more).

When I really think that the size isn't the main problem at all.

"disambiguate" is a fine word, but only if you use it in the context
of "I have a bad hash". Not just a short one. Because the hash being
too short is simply not the main case worth worrying about.

And hey, just to really hit this same argument home: I can absolutely
guarantee that you have a much more insidious problem of "wrong hash",
namely the "oh, it's actually a valid commit hash, but the Fixes: line
simply got the wrong commit:".

Because that's a mistake I see regularly: somebody simply blames the
wrong commit. I've most definitely done that very thing myself.
Sometimes it's people reading the history wrong, and not realizing
that the bug actually happened before the blamed change too. Or the
bug ends up being a combination of factors, and people didn't realize
that the commit they blamed was just one part of it.

So my complaint really ends up being that anybody who trusts those
hashes mindlessly is going to have mistakes, and the actual hash
collision case MUST NOT be the primary worry.

Because as long as that hash size is all you care about, you're
barking up the wrong tree.

               Linus
