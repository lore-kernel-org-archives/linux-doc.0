Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4B61C2DB0
	for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 21:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732830772; cv=none; b=gudsJPJ++IYEU0EdnNPenlmhZQvQlDO4up7BBBveOr+gcrnzEo9TXf/GJcn+tCzqqDZ18ansMT4uBSeyyAYTHtP+yk9uNbSHKDVs6wU+ftUi0G4OtaimvA6gOrIp7ywDG2iCH3W7/3jK7swS4hMo/+mJpaRAot121Lq4rccqoTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732830772; c=relaxed/simple;
	bh=0SrSEo9d0wnb8pHGbALe1TvqfwEVyxWe0tBdheEAS7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxcW5QHHDELDuJSeaqxHKSoCen3ZlOckvEqzQaSxWDrFj55YX+soYrKjLIcNiFLPIsY0TjSNkLUuyjHo9GmlgRURLFPFBIz8WiIt4sZrYFK5FH2nQ03ys8ARHMZ9yvIl8Xog48Q4x61QIouu1Ug+DPi/3RqdHNhgxD09hV3gPIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=E+arZ+cw; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="E+arZ+cw"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71d5984e56fso507540a34.3
        for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 13:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1732830770; x=1733435570; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/iiA6F2rAMpTGgZ+DNvtV6LzXYGWB5BakkItztXwCLg=;
        b=E+arZ+cwtReFyhnAm3hnIcMscexcoy8WkaC6tdz8mpvJxiI5MgN7aoXbZOGrDDFVlY
         8krfqc2UVJWhwhCKCZs1SaXMkY2FQyxUfVBjkRqoDPuix/wyaq7zREztRA15Pvqt974c
         Ulhg5UxfOLNDehSKqpP1qU5YI3MOsRUWm56QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732830770; x=1733435570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iiA6F2rAMpTGgZ+DNvtV6LzXYGWB5BakkItztXwCLg=;
        b=QhjvbXXwPmWdqMolAcMpu9rj0gvuxiDpuhrHHj89DF7p75ghVTTR6Fgb6fwSjdxDL6
         mkRwwknIg4azRKCKld7GTxj2LOpZ3fcg8Z1LXLVTfsUCC5hhGpg9n1v/eIuxMxB6WS3Z
         uznc0zzPbFJgJMWWyM2ANBHlTiCxiMppGGnmroViR+S8bHHnmVhN0j2pvBJ9aTTs5Cjl
         WyLTAzFPwAHAQdyh3O22PCaP2zpfzonsJHP2QwcZw/q2lNq66N4VOwDlfNPHUx+0axSo
         RIliCBZIhc8f7A/wP4atY/PdXpFdg8QaYhjzoALku+iVp2/ViUkRZI8/uwFgtzJ8xItr
         4rTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4UJH53JmD1kPxEwrz0uzI+7F2cXXFaQxguO/TNer8liuTg7zjFpmc/0YXFz1yvAmuJSi9lAAK4qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyG+E3mLtYwCklJa+is3yu2qAu6Vn5eJMKSW15cERtJtsmTcdq
	DsySwtSwkRpjJPTgBAZQVY4AsiL5NTLkFKbCJ76HKVcvNjeXvKuUXw9jPXd1fkaVKjcEsRUyM/R
	IvNHkFHKEyb6mleMQk7b1y8c/xnoedp4HQZW+qQ==
X-Gm-Gg: ASbGnctMrgcahasON6miQhP7uj8vHYZbZN9eKHT+Z8umIxtfNROvkLeAqc2Em4t3Jtg
	lDBVri64xBxaGeSuk53+/qqO/vH82cDE5WvNV2mTHnamFq6yWPiDTKqszUCxo
X-Google-Smtp-Source: AGHT+IGZJUmC1Xr7U9J88RNu2CrHQR7CbUeqKrsBNr4B4BJONzSmBjMNZQDdEbEY9u/lbQwiPZoP132ajKhnUHh/BVA=
X-Received: by 2002:a05:6830:411b:b0:71d:5236:9295 with SMTP id
 46e09a7af769-71d65d00c98mr3319928a34.24.1732830769768; Thu, 28 Nov 2024
 13:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com> <20241127103948.501b5a05@foz.lan>
 <20241127111901.GG31095@pendragon.ideasonboard.com> <CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
 <87iks7wqi3.fsf@intel.com> <20241128194758.7d2e7656@foz.lan> <87v7w76od3.fsf@intel.com>
In-Reply-To: <87v7w76od3.fsf@intel.com>
From: Simona Vetter <simona.vetter@ffwll.ch>
Date: Thu, 28 Nov 2024 22:52:38 +0100
Message-ID: <CAKMK7uEJyTwSULjJ4Qv9vDtm5BkHwiFUSY=iihpHQMvE+a=6og@mail.gmail.com>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and process
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 22:27, Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 28 Nov 2024, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > We used to have a low bar for entry on our past multi-committers
> > model (back in 2005-2007). It was a disaster, as one of the
> > committer did very evil things. He was blocked, but that didn't
> > prevent some of us to be threatened with physical violence - and
> > some people even reported death threats.
>
> While I understand the hesitation, I don't think it's fair towards
> potential future collaborators to distrust them based on a bad actor
> from nearly 20 years ago.

Yeah this sounds a lot more like a CoC issue (which of course could
result in a very swift removal of commit rights and suspend from all
access to gitlab and mailing lists). Aside from reference the CoC
we've left these things out of scope of the commit rights processes
and merge criteria.

My key takeaway over the last decade more of maintainering is that
assuming that people want to do the right thing and building a process
optimized for that works really well. And then handle the toxic people
entirely separately through solid conduct enforcement.

> >> Frankly, I'm not fond of the invite-only model. You need to be careful
> >> to not lose transparency.
> >
> > The intent is to be as transparent as possible without violating regulations
> > like GPDR.
>
> I have no idea how GDPR would be relevant here. We don't collect data,
> other than what's in git.

Yeah I don't see the GDPR connection either.

> >> I think it's also important to define merge criteria. A set of rules by
> >> which a committer can commit. And it's not really about technical
> >> checkboxes. For example, in drm it really boils down to two things: at
> >> least two people have been involved, and there are no open issues.
> >
> > That's the same criteria we're aiming for. We'll start without
> > two people reviewing, as there won't be enough committers at the
>
> It's not two reviewers for us either; it's typically author+reviewer and
> either author or reviewer commits. Two sets of eyeballs in total.
>
> > beginning for that, but maintainers may revert/rebase the tree in
> > case they don't agree with changes.
>
> Not sure if you really mean it, but saying it like that doesn't really
> breed trust, IMO. Sure, there have been patches merged to i915 that I
> didn't "agree" with. But bad enough to warrant a revert? Very few and
> far between, and always for clear and concrete reasons rather than
> anything subjective.
>
> Side note, we don't do rebases in the development branches.

Yeah, if I don't forget anything I remember a grand total of three
rebases by maintainers, and this over 8 years or so of doing this:

- Someone pushed their entire development tree by accident. We
obviously had to back that out and improved the tooling to catch these
better.
- Someone who pushed an entire pile of work (I think 30 patches or so)
that missed the merge window into -fixes for a late -rc1.
- Someone who lost trust with upstream maintainers because they
refused to listen for way too long to engineering direction and
consensus. The last big push of development work was backed out again.

There might have been some other things, but I think those were more
maintainers screwing things up than committers pushing stuff, and on
trees that are handled with the more classic group maintainer model.

It's really an extremely rare event that we rebase out patches.

Reverts are usually handled like any other patches with the usual test
and review flow, just hopefully a bit accelerated.

Cheers, Sima

> > Currently, for most of the drivers, the number of committers per driver
> > is equal to the number of maintainers for the same driver.
>
> FWIW, I think that pretty much matches how it was for most drivers in
> drm before the committer model.
>
> > So, on this stage, we're aiming on get maintainers commit rights,
> > starting with the ones that are long time contributors and regularly
> > participate at the media summits.
> >
> > Once the "slow start" phase finishes, we can review the process and
> > start thinking on getting more developers and committers.
>
> Just saying, it's easier to convince people to become committers with no
> strings attached than (co-)maintainers with a bunch of responsibilities,
> such as review or travel obligations.



-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
