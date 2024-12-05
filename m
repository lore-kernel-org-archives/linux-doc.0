Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0063D224B0F
	for <linux-doc@vger.kernel.org>; Thu,  5 Dec 2024 19:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733426380; cv=none; b=UoFStJTNeR19PBm7D9BkLOSm6ZJ4OXo5BS/pYgWU6Y7gMe/rUGROmYnUn3P1iwPFvnXy3ccATm0v7eO3D9Z0aM7xINPy2poQxPsMOhpjWWKOwimnux8iqvh1u/Q6KLIUIHvBaxF5upXxRhBJ9YhuUUfy51mKPztrRUY2BaV7E9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733426380; c=relaxed/simple;
	bh=N7Q2i/te3fJSR9GXmZAlQH1YXHaD/cG2+guiEYfirWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muH3t/f3zRUMTdrAUBA0Evr9ccBt7oNwjqrZbheP+86+v8/ozNccd7VaASwgDibByUOO7dIA9wmGgKKD39u+jqe+VNreuEQxdwpqbvD8TlcC+hcdGbzCzYOeH6h41paHYtqk4W+L+gBTOTmvFseCrSQq+F682qkAl/oPseTjcz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FdVq//hM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FdVq//hM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d0d4a2da4dso2069658a12.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 11:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1733426376; x=1734031176; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DuB4RBng6UYOUJZnydBy5hrATh6bqjUq7A/wd6mOafg=;
        b=FdVq//hM5UpBn7kbH7x9osHum3getUCzrgapLYCNwgl0u52inmhgsjRe/ZO9hTuL6S
         6bxykc0ArPlbugzu3Dj/My4ZrWJHfHodkHDoP9SUNRuc6q6jxykFQ3mBizwVDkPBvtR+
         dYk8y02YiaUx1y4BwMSthOR98UQAhY7QnCnC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733426376; x=1734031176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuB4RBng6UYOUJZnydBy5hrATh6bqjUq7A/wd6mOafg=;
        b=eJkywOx5WbgLzdLK6zFDj13PfvQliyZVWb6+CWrA2HH0AGBK7oaPz4/u1eiN1VRQ2u
         I6eMBlQNbWYrGqL3ZtQ+C8xVBqFGlGIJF+E2XzOrmuhdXSCKy5RkL9PLGHxVFbDih8qh
         bbtFXauAjKXeHs1Yw/gSpA2ixwJUgNaWlv0dp3aMMMZ7Yrjt0oC822YhunbFvBef28a1
         5RpkyWO7W0ToFT6xPxVdJu5xgBxnHiynH6WcTqobV0IbO11u3MbZcWahGq9K1890G2GZ
         +mjlO3CdMoaq7SqjuYDI8a6O4q3AJgYv8GWz+BXWBVp9GWTihpoiMgcDRHD6HQzyDGm+
         7RBA==
X-Forwarded-Encrypted: i=1; AJvYcCWHLIWeNEbp6+mfBHfSWSrUSFH8nA55JzmJXqOEZsMuXLy5k1eXtVMG6Krd1rkVWmjDPj4Enmj5IfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8GDwlIxHjTKxq0yxqxbiLKLjdUHTUGW85gz8hrxbrLlQKfMB
	t6v0hNhpnbJ9YZ8EQcXy3JAqkzvjcR1fgYv3+cLyYmzKRjDqSXHg2KAJ51ju+JLiOUlp0Gxl4eD
	r802M2A==
X-Gm-Gg: ASbGncuXDkytfn1Q7CiK/aFC1zrOt75UV+9MaSAmPArOBhJ1Fb5AuHchDK1mcESuFKf
	ZBpROTRqpNis1W/FQxg1tN5AxEfChj5Aww46xfQoHZ+KpzqGa91I5MqLQx8VqEwcsRqce9xhxPC
	UkHPGsqYUokbrQd36GvtRQ95UJGskNTDOnsroQXaUDU0EBkpycX7NVsaYOfKn2O1HmtAV7Gi+5V
	UOCZZoX35EfFTj5zFRzgmY6R9EzjFnglgtBRVZ4HTqJyDvQ/yel4J+9lV51Mt+i77ujNF5Kw+CS
	FNyKvKYFWkG8JbybHM79Do9e
X-Google-Smtp-Source: AGHT+IEIVU3tqeGb0eT9qDA4GGapTJ6Q63eLP/65exLrzTjkDy1Vi7o6/OomwScUmWUNmCoFGSMm7Q==
X-Received: by 2002:a17:907:1de1:b0:aa6:1871:2b98 with SMTP id a640c23a62f3a-aa63a270121mr807266b.60.1733426375923;
        Thu, 05 Dec 2024 11:19:35 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e1346sm129896266b.176.2024.12.05.11.19.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 11:19:35 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9e8522445dso235051466b.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 11:19:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2ZjJZRxR5jzCrkNoJld6WS3vUL8MAaDRYDazkzpgMGVOLcTut5L7cpz345JKzhz4/SECg3Re/Hh8=@vger.kernel.org
X-Received: by 2002:a17:906:18b2:b0:aa6:23ba:d8c5 with SMTP id
 a640c23a62f3a-aa639fbda5cmr3997966b.10.1733426374829; Thu, 05 Dec 2024
 11:19:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733421037.git.geert+renesas@glider.be> <46b320b91b8d86fade3c1b1c72ef94da85b45d0d.1733421037.git.geert+renesas@glider.be>
In-Reply-To: <46b320b91b8d86fade3c1b1c72ef94da85b45d0d.1733421037.git.geert+renesas@glider.be>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Dec 2024 11:19:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiwAz3UgPOWK3RdGXDnTRHcwVbxpuxCQt_0SoAJC-oGXQ@mail.gmail.com>
Message-ID: <CAHk-=wiwAz3UgPOWK3RdGXDnTRHcwVbxpuxCQt_0SoAJC-oGXQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Increase minimum git commit ID abbreviation to 16 characters
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thorsten Leemhuis <linux@leemhuis.info>, Andy Whitcroft <apw@canonical.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@corigine.com>, 
	Simon Horman <horms@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Junio C Hamano <gitster@pobox.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Dec 2024 at 10:16, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> Hence according to the Birthday Paradox, collisions of 12-chararacter
> git commit IDs are imminent, or already happening.

Note that ambiguous commit IDs are not even remotely as scary as this implies.

Yes, the current kernel tree has over ten million objects, and when
you look at stable trees etc, you can easily see more.

But commits are only a fraction (about 1/8th) of the total objects. My
tree is at about 1.3M commits, so we're basically an order of
magnitude off the point where collisions start being an issue wrt
commit IDs.

Can you find collisions by looking at all objects? Yes. Git will do
that for you, and tell you their types. But to take one recent
example, let's do the 6.12 commit:
adc218676eef25575469234709c2d87185ca223a. To get an ambiguous ID, you
have to go down to 6 characters, and even then git will tell you
there's only one object that is a commit, ie

   $ git show adc218

results in

  error: short object ID adc218 is ambiguous
  hint: The candidates are:
  hint:   adc218676eef commit 2024-11-17 - Linux 6.12
  hint:   adc2184009c5 blob

so right now you have a collision in six digits for that commit, but
even then it's actually still entirely unambiguous once you know
you're talking about a commit.

Are there worse cases? Yup. With just 7 characters, you get commits
like 95b861a that actually have three ambiguous commit IDs. And you
still get ambiguous results with 9 characters.

With 10 characters, there are no collisions. So the "we're an order of
magnitude off" seems about right - you get slightly more than one
order of magnitude for each two digits.

And remember: we're an order of magnitude off *AFTER 20 YEARS OF GIT HISTORY*.

Furthermore, the "in the future" argument is bogus. Yes, there will be
more commits in the future, but it's not going to suddenly make old
SHA ID's somehow more ambiguous, since you can also take history into
account - and when quoting the short format it should always be
accompanied by the first line of the commit message too.

Why do I care? Because long git commit IDs are actually detrimental to
legibility. I try to make commit messages legible, and that very much
is the *point* of the short format. It's for people, not machinery.

Yes, the basic git machinery doesn't do object type disambiguation
(and if you do "git show", you can give it blob IDs etc, so git itself
may not know about the proper type to use disambiguate at all). And
git also doesn't know about the whole "we also put the first line of
the commit message" thing.

But honestly, I'm claiming that something like

    Fixes: 48bcda684823 ("tracing: Remove definition of trace_*_rcuidle()")

(to pick a random recent commit) is completely unambiguous for the
intended audience, and will remain so forever within the context that
it is in.

And I think the "intended audience" here is important. 12 characters
is already line noise, and causes occasional odd line wrapping (you
don't see that in things like the "Fixes:" tags, but you do see it in
the better commit messages that refer to the commits they fix).

I think we should accept that it's not the full SHA1, and also accept
what that really means.

Final note: personally, I find that the SHA1 - shortened or not - is
often *less* descriptive than the shortlog, for the simple reason that
rebasing happens, and people refer to other commits with stale commit
IDs. That's an issue that I personally hit regularly, and it has a
fairly simple solution in the form of

    git log --grep="..one-liner goes here.."

and my point here is that if you rely too much on the SHA1, your
workflow is *ALREADY* broken, and it has nothing to do with the
shortening.

Put another way: if you have particular tooling that you worry about,
I think you should look at the tooling. You can find real examples of
much shorted commit IDs in the kernel, and real examples of the MUCH
MORE REAL issue of wrong commit ID's right now.

See for example:

   0a1336c8c935 ("IB/ipath: Fix IRQ for PCI Express HCAs")

which refers to commit 51f65ebc ("IB/ipath - program intconfig
register using new HT irq hook"), which is still perfectly unique, but
then look at

   2e61c646edfa ("mlx4_core: Use mmiowb() to avoid firmware commands
getting jumbled up")

which refers to commit 66547550 ("IB/mthca: Use mmiowb() to avoid
firmware commands getting jumbled up"). That commit doesn't exist at
all - it's not ambiguous due to being short, it's ambiguous due to
being *wrong* (presumably due to a rebase)(.

The real commit ID? 76d7cc0345a0. Easily found using the
human-readable shortlog,

So here's the meat of the argument: you are barking up the wrong tree.
We have real and present issues that have been going on since at least
2007, and they have *nothing* to do with the short SHA1s.

I don't want to make the short SHA1's worse, when the real and present
problems are elsewhere.

Make the tools deal with the cases we already have, and you'll find
that the shortening is a complete non-issue.

                Linus
