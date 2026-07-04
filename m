Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BFA1F192E
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 00:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783125314; cv=pass; b=LDle6A0OAXdaBIB6Q0ZhMfIrQ7wZLnObTQ4TNemLHXxIO0wgqizRCBuE3hWTcRx/43Elvy+omXyHIEGUs9FiyZco+Wy1W9NHZfo6HdWPRm4hqtSODFXi96SE9AUA+D8Ny0SPv94ekv6U3mGuU02H5WImbwKwD0m2BfuKF7stLmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783125314; c=relaxed/simple;
	bh=clrDD96YBt5A3a2Rvc28rREplTx9fw9n1eB41uH1mEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lkz41KDr3HKfKi9AbSgbJpySSE92FkxolOrTg2h2LqlOXJum3MN9gicSyr+qCu9aaYrpkk6l6NN3tmeJhEoTsZUQOwHZYUKOG8ezERT+8SeDtMAQlNgr4ql5SHl+ZnhrraSPUrTvytuySOt9tzj75e2le7GA2JVSpz1DzusOA5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSnUN7Z1; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSnUN7Z1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ba701891so7655115e9.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 17:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783125311; cv=none;
        d=google.com; s=arc-20260327;
        b=k1/NxRmyV9ww0A6NczSzCuUo2xATJq7FWFEdHQj2aPxdJLfDwvaaRLVRZfnJ9lliNA
         bO6MFay1WbcrA9Bs1gRc8b499fXdeqEJFGNbnaDLU47ah597LdeaoWvQAKVSlBdP2d8W
         KUbOPo1IoqOnaFQUSBCBmAdp1jKSz2aTKbf8d9IVP5sal5Kd0B5iryUZWNuUeeIXCajg
         31cMcjjOmslf0zDMJy6EyoGiamZyvzESDKdb/FnH+rN1f6Oq39V5eTU/xqyvGghk7QX5
         4F/Ld3kKsvQjbDRvLHi1scXrTGTZ0h03WD7JJS+9P2UdkZbhChwSV94p7uxzEjHXk1NW
         ZvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wW7AlhxqGYiRva1oC552NzvH7YtXs9EvRN6VDKKQkfM=;
        fh=IejIGdh9xwdVUT+JhRyrNyprMvJCpbBDoD4SjKtGg2I=;
        b=laYU/9y/ukBzTgbdvwB9IHMOjggWh5sDrzq5l79lUhvcrDQsJoGpfa9vFCtCXB4clo
         UY8uKMoGQ2vaimZVLhqpraVO9S4X0ixGMr4AarXMvuML9So/rp+36NfaABVzG1L7qyXz
         xKpxpqfLp+hjh0Z2WvyEjMC5nY88qm8Tm4zOzz0a7bkWUM9/sqTfKnsDsLjG45/Tzlnj
         /EXjkZjeq9TPfVG91p0rSYpDBn8FyttAgdP9onKwHBEpv0dc2zgzkXCzXPjbd4Hdp046
         lFuB856Piay3YO0NPqCktgx0bkTKaVyQ8wNj5KDLcc7yiE2Eey5ioDevMl1cIF8kuibM
         23DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783125311; x=1783730111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wW7AlhxqGYiRva1oC552NzvH7YtXs9EvRN6VDKKQkfM=;
        b=pSnUN7Z1IPzl1PUejj1ZbBo/KW7cjP/Q3GRVbjj/54TkXCqh4uwm302JQIauMohZYJ
         mUvkfiO6qyBMktjaZ5S6UJJQplzNMgNEdHyJ+QXaBmfHm/b6UEl2ggeU/4s8ijZzbc7r
         asCQw4+mjoUHkjssFZLc5Iw3B00xouaqqStkeNJ71sRQeB+U+WKPB8jo7KX2siGB3yEh
         MzOIRkvZJmisEPi9wPPdoJ2vmw3Tty+hKT5+3bSXaeiivvZyJtvBQs04+8DiXDwgOXDL
         JxshMTB8jXxOe1uLdfz/a7cNGFV1DyfkM0D4mXN0NaarvA3V5YNE7/5XOuU2dql4egiC
         c3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783125311; x=1783730111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW7AlhxqGYiRva1oC552NzvH7YtXs9EvRN6VDKKQkfM=;
        b=PgqgrHjXtbxK+joebrAKmzCfvi1MUd/NN0IZO9te8EBZsSV16RNeG18xTB9awxk0RC
         QLpHl3lnQ3PBlK8AlLf+vUcePYWQpGHItcFj57dbwQn8/ErlyFCSkhQOw2Mqd8V9rll/
         0TIAGfYtYj5Ch9Hyp8C5kpYf3g4vC8H4rBWTtPyU02pzBdPZB2DtC7iKUs9vLzRVphph
         dlXH3aTVBsbK0x0iVqjK+qlHj2FwTt0zvm3WO7nOICTXP4se/9peJl4rUZMzypjC3tk5
         M6EFkPIuX+B3mukzdsRE+0Qe/qrygBLGtqgutrzfy5/KL+46lcqeWkFsKCbiWJLgVCRE
         07PQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZjV2VY042m33VWjD7NjTDmXbCeaMLV1RBtizvBy/F36TgCYPW2z4kstLLYZpcnnF+yjh0/b6/yLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPX8kpgzINC5i9kvMIJ//nSGonwR8x4kzRzE6uLLK9Pj3ZVgW1
	rCqkJF6kb2DPyen9LmOtOrnhgiWeDIZDxqIbzuMiACxtS/uh1O7WVKHbGUbtEy3grH9A1jhWbWg
	qLqOIfUIC49PmF9qninDIYMMnJEcmkis=
X-Gm-Gg: AfdE7clkXQz2xCdX91krGlgRfbFaYsZT5+HHhHtopuPrwpv9Iqq+mtmLwIHSs3nXBAZ
	XgSZQH0zSdf5wMrZ46wuwKbYuguLrBq9K2vRnS6hLztBDwWUCpGOpjweFnxunN7d3N95bO20Y/L
	63SU9Zu/1RbnKa3t40MBdFnRkHjcDGe1asNWWV2AcKSlTVFKvfcgOOTwp/jW3hstaFX8sQXF9MG
	Yf+q/JTXZ6XW8UuLAyj8IzeZHCqH/NO7BpsOuWcZ+CcT1jYJakGKS0iFwYe9KnOBgy3/wAzOEqo
	dqtu/bGqj6cjakkyGL30icfH/A2dFTboKAbb3BFVtskRqqlexMlv
X-Received: by 2002:a05:600c:5250:b0:493:bb0:3b43 with SMTP id
 5b1f17b1804b1-493d11cefc8mr15023595e9.2.1783125311110; Fri, 03 Jul 2026
 17:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701000949.1666714-1-joannelkoong@gmail.com>
 <20260701000949.1666714-19-joannelkoong@gmail.com> <20260702192658.GN9392@frogsfrogsfrogs>
 <CAJnrk1YZQOQ0D6p6qYx1BPvKQaDgZsrKzLbGZzaH8tUkj_OoOQ@mail.gmail.com>
 <20260703020020.GS9392@frogsfrogsfrogs> <20260703124331.GA26440@lst.de> <20260703161147.GB9407@frogsfrogsfrogs>
In-Reply-To: <20260703161147.GB9407@frogsfrogsfrogs>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 3 Jul 2026 17:34:59 -0700
X-Gm-Features: AVVi8Cc9z61uFW2rqHr93JegF3VWx93elWcFHjnHavv8xxM4AtcZoZcVqoAB6DI
Message-ID: <CAJnrk1Zv8FEAD+T=1+ZLi6q8ztHVY1zray019QNdeLpYjTNQAQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] Documentation: iomap: update docs to reflect
 iomap_next model
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, brauner@kernel.org, willy@infradead.org, 
	hsiangkao@linux.alibaba.com, linux-fsdevel@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:11=E2=80=AFAM Darrick J. Wong <djwong@kernel.org> =
wrote:
>
> On Fri, Jul 03, 2026 at 02:43:31PM +0200, Christoph Hellwig wrote:
> > On Thu, Jul 02, 2026 at 07:00:20PM -0700, Darrick J. Wong wrote:
> > > The ->begin method can still set iomap::private and the ->end method =
can
> > > dispose of it, right?  Oh, wait, no, that doesn't work because you're
> > > talking about ->begin/->end passing something to the next ->begin.
> >
> > Should we move ->private from struct iomap to struct iomap_iter?
> > That'll deal with the constness and the fact that private data
> > really is a per-operation thing.

I'm not sure I understand. Doesn't struct iomap_iter already have a
private field that holds caller-supplied per-operation context?
afaics, the users of iomap->private (gfs2, ntfs3, fuse-dax) do use it
for per-mapping data and release it in the same iteration.

>
> I dunno -- towards the end of the fuse-iomap development work I actually
> had started using iomap.private to store per-mapping private data.  But
> that work is dead now, so that's not a strong argument.
>
> > That also reminds me that now that we actually still keep the low-level
> > begin/end ops we need to switch them to a calling convention that
> > passes the iter instead of the ugly container_of.  This is something
> > I wanted deferred until we get the iter conversion, but it turns out
> > that now leaves them untouched..

That's a good point. Do you think it'd be better to include those
changes as part of this series or do that as a separate follow-up
series that targets the same merge window timeline as this one?

>
> Oh, you mean changing the signature to:
>
> typedef int (iomap_begin_fn)(struct iomap_iter *iter...);
>
> instead of passing parts of the iter as separate arguments?
> Yeah, that would be nice.

Agreed.

Thanks,
Joanne
