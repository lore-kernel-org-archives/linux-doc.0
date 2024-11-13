Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2D1FEFA6
	for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731495592; cv=none; b=gc90udk8MKogE2u6omDax9UmTGOPe47Rcr+6o9ZvF91V2DHSr1vEaTGCaTuMj6WKXxL6McMwpR8Ny1CRUIpgusp6Hyofxb8WKxaR0Q6lftOswrgaYQNx2seHXrb7jcTI3uPUvPvDazektEXMuor4+kGJAhPHSOHGpWQAdROvEjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731495592; c=relaxed/simple;
	bh=htv/WykcEZl4Nm0J9U2UJFNqwjBqgHVD3UcNl3e+hxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITPbkTWUh/L+h8mdZuw3rRVH07XEdJAFhn0B/rmizwBFpsA7mcg0SNaGLbCM1sAhgjl5HDnYjriV2z/EfpkuJLsnOH4WCK7H1EcSjlQn4IQMLKVtIUEKgFj0LDpAJVrM11KmRAA1Ttw305qbUg8Y6Ag/aCDSM/0Wf9vpV8Mn+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=aicdqjPt; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="aicdqjPt"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3e612437c09so4137913b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 02:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1731495590; x=1732100390; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lDrAAEBEom/jMnraqO9mLa/5FypcxBexJ29AS82OuTY=;
        b=aicdqjPtnzE2Hh2LoMT3wk6tVymMScRHTKSoahqDfAoQlAK1QrNxcFGEkSrgKhskHz
         Dy8yrfVQjGILT18fjYgWTS+RLc2PzjUPAN36oaE/Ky/RNzmBrO+IykapYcNbHsaAc2bG
         uv2ab4wzu8m4SkDTHFRXDFRuoglzuIQaaEkrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731495590; x=1732100390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDrAAEBEom/jMnraqO9mLa/5FypcxBexJ29AS82OuTY=;
        b=pNf7NJU+cxKGWzXmRo52nJ8s4nwoCxmhGtP6oAmedFYWIMyxtJl7LTe+AX5JaE/c0q
         DG+BGMewoi12XFPj5DaCHAbid8Wn/x7Da3+XVqN0ETCXn1XG2RHWH4tjcUqoOhNMUCP4
         +UJNUS3n91ZeI59HxtiKBgTuofEMBHKPnM5HZdFLsHwpKPrv0SJECFNMSFnsNh8JPzPi
         UbENskN9wQmUBhTu4iR7FDFOi43RXmtk+bijQh3k6aYmMdqPei+XijjkZIhUVuSLcGDb
         XK9BCbcs/dYRlhqIOCwEcT/t8Bg96tcHNNl4ZA3oOZRjhu7f71R7njPwXcx5cJKau3Bj
         LE0w==
X-Forwarded-Encrypted: i=1; AJvYcCUyvy89Xq9OGVHwSZJ1YIXN8WdW88oAvKEhVxeLu15fnSHPwNwB1vvPArM3rR8spxoZmAj2eCZLvB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGCjhTBckM0QVc+/3Ets39Vu6NOrtPYYa6IVU7CEFgHkEwbEI
	f7R0NwJL26vuAhEZKWVKuXapFTXuTH3+dDhIVY+CEK+A8KfDI/enK79dYsRd5aL+Si1xAUlvFCx
	3wKnU+Eg6NAtkISSbUJ9bJSGJTfD9HOw1fzfqxw==
X-Google-Smtp-Source: AGHT+IF8A/mdN30tkH0Is9W2PU1gOMmO7Kh6k3ZmivQ5sM7i1y3M584sUL8BO7H9IjpBfLwiuDN8HpGYaac5NE6tptM=
X-Received: by 2002:a05:6808:2f19:b0:3e6:5a7f:e102 with SMTP id
 5614622812f47-3e7aada8c84mr6148840b6e.9.1731495590409; Wed, 13 Nov 2024
 02:59:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f5bc0639a20d6fac68062466d5e3dd0519588d08.1731486825.git.linux@leemhuis.info>
 <20241113102619.GC29944@pendragon.ideasonboard.com> <b160f728-b34f-433d-8cc4-677605990936@leemhuis.info>
In-Reply-To: <b160f728-b34f-433d-8cc4-677605990936@leemhuis.info>
From: Simona Vetter <simona.vetter@ffwll.ch>
Date: Wed, 13 Nov 2024 11:59:39 +0100
Message-ID: <CAKMK7uGwK0OYu+cVJnUVd5nMZRG8jJBXJUuo0xFXdyrubJFW4g@mail.gmail.com>
Subject: Re: [PATCH v1] docs: reminder to not expose potentially private email addresses
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jonathan Corbet <corbet@lwn.net>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Nov 2024 at 11:55, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> On 13.11.24 11:26, Laurent Pinchart wrote:
> > On Wed, Nov 13, 2024 at 09:35:03AM +0100, Thorsten Leemhuis wrote:
> >> Remind developers to not expose private email addresses, as some people
> >> become upset if their addresses end up in the lore archives or the Linux
> >> git tree.
> >>
> >> While at it, explicitly mention the dangers of our bugzilla instance
> >> here, as it makes it easy to forget that email addresses visible there
> >> are only shown to logged-in users.
> >>
> >> These are not a theoretical issues, as one maintainer mentioned that
> >> his employer received a EU GDPR (general data protection regulation)
> >> complaint after exposuring a email address used in bugzilla through a
> >> tag in a patch description.
> >>
> >> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> >> ---
> >> Note: this triggers a few checkpatch.pl complaints that are irrelevant
> >> when when ti comes to changes like this.
> >>
> >> v1:
> >> - initial version
> >> ---
> >>  Documentation/process/5.Posting.rst          | 17 +++++++++---
> >>  Documentation/process/submitting-patches.rst | 27 +++++++++++++++++---
> >>  2 files changed, 36 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
> >> index b3eff03ea2491c..1f6942948db349 100644
> >> --- a/Documentation/process/5.Posting.rst
> >> +++ b/Documentation/process/5.Posting.rst
> >> @@ -264,10 +264,19 @@ The tags in common use are:
> >>   - Cc: the named person received a copy of the patch and had the
> >>     opportunity to comment on it.
> >>
> >> -Be careful in the addition of tags to your patches, as only Cc: is appropriate
> >> -for addition without the explicit permission of the person named; using
> >> -Reported-by: is fine most of the time as well, but ask for permission if
> >> -the bug was reported in private.
> >> +Note, remember to respect other people's privacy when adding these tags:
> >> +
> >> + - Only specify email addresses, if owners explicitly permitted their use or
> >> +   are fine with exposing them to the public based on previous actions found in
> >> +   the lore archives. In practice you therefore often will be unable to hastily
> >> +   specify addresses for users of bug trackers, as those usually do expose the
> >> +   email addresses at all or only to logged in users. The latter is the case
> >> +   for bugzilla.kernel.org, whose privacy policy explicitly states that 'your
> >> +   email address will never be displayed to logged out users'.
> >> +
> >> + - Only Cc: is appropriate for addition without the explicit permission of the
> >
> > Isn't Cc: as problematic as any other tag, is it ends up in both the git
> > history and the lore archive ?
>
> Hmmm. Good point, thx for bringing this up. And of course it is. But
> it's the second point in a list and thus should not overrule the first
> one. But I can see that it could be read like that. :-/ Up to some point
> I even was aware of it, as the added "given the above constraints" later
> in that point shows. But I guess I wanted to stay close to the previous
> text and that is not sufficient.
>
> Hmmm. So how about writing the second point like this:
>
> """
> Even if the email address is free to use in tags, it is only appropriate
> to use in Cc: without explicit permission of the person named; using it
> in Reported-by: likewise is often appropriate as well, but ask for
> permission for bugs reported in private.
> """
>
> Hope that "likewise" is sufficient here...

I think these two points are fairly unrelated. The first is about
using the email address, for privacy concerns. The second point is
about adding the tag at all, which you're not allowed to do except for
Cc: tags. Because forging reviewed/acked/tested-by tags is really not
good. Putting the "no tag forgeries" rule under the privacy section is
I think what's confusing here.
-Sima

>
> >> +   person named; using Reported-by: is fine most of the time as well given the
> >> +   above constraints, but ask for permission for bugs reported in private.
> > [...]
>
> Ciao., Thorsten
>


-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
