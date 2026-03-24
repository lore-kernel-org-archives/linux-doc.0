Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A183DE443
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345722; cv=none; b=dUsx9FcJ/hC9FaafX7uPhqO7YAiT095hsjhGXAa97c5BS58fxLp6YIUx80lTLDw5IXJjn1ytDovFQFo08km4BBKSWNd/MgFjEGBqWr+8N9EHgFr9K5+gbwUD3yhFU5HJHmzfcHA+27kl2vcv+BqwiKTV2XV+0BISnimkkPyaW1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345722; c=relaxed/simple;
	bh=sZF6W5pnPzP+wyKmMseusXomgd6GQmLbbV5WkUEMd8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXsxSpdNSYq8epthYDoTfK/MuYxKxn0RuRXWwB9s1H4lG2fgwltqdsLhgQ2MWokxz0gZ3kU7CwpBhjo5Eg8u720aEw1jhrNPn76zFTkeeHtk7SFggnqygJFaKVH/9p1ZeXq0mPuL45dEf4Za5deRlFHjhc0eRDpBmGEhCENUFcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fM2tPDmZ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fM2tPDmZ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66966a394ceso4580036a12.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 02:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774345716; x=1774950516; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/gtLyXDecs+X4tic85y8h+OwTvn7U+74QopiIkPx+as=;
        b=fM2tPDmZS1gA5XfwTQthhy9UmzMZimx4lvPmcC3mY8Vuv8AOyHv8eDyqES1gQC7uDl
         jwGjcEwuIL5Bv/EPQkoRDlK1XZF//9os8+MilXB4pDiwVNGbhNoeCl9wHaZ9uvCPSU4o
         ib6GdBEfxQVomXn8GPw1aCZKCs3yQMLdu9w774R+SPkDCl5EaRhg8LXsR89l1Q+cQJAG
         1nCpdk6UQz+2Li/anEuWzIksp/9l2LRttJkeeOVmz4o+fkbGRY+mwGPdgjI7+Pp9tTYi
         E0+J/cmUgiJnK+LP+u+2U4BAWzdYpc24Lb58XnRJj0q9SmMXWQqJxbtCBdhEfrp9ywxZ
         Xa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774345716; x=1774950516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/gtLyXDecs+X4tic85y8h+OwTvn7U+74QopiIkPx+as=;
        b=gwF/FGi0tL150WAh6eNWyn6CXIwaDu4x8UgEtzECUIGgjRyfyBVME4S3fSYvlP8BFs
         Vc0M17cuVpOehX1+PIFXnpxh4AkqyRIu+ULtbmF0W74/kYy2w7RICPUcxoOfYaN4aGQQ
         f05cNVW875PG3eHSafIkgmjN3QSn+BnyzWUWBBulZXobfdIw5FJcymutlJ4HIMxAuCgr
         +DQFArGsddUrAAvt3PLKd+iZVKssIXY/VqahZInKtsAM20EkDkDKjqcH1KU6GF2JtDp9
         HzKbykToywnvUsK8nGLYzCNmU5re4H6nCJUzAlxrjuXZtv7HKr/t19lYErfC/AfWd15D
         AY9A==
X-Forwarded-Encrypted: i=1; AJvYcCX8fzlhLIePAwg3s2UjlfHLVg+6xtGDHqJ1HnR0tQY/foXhg1H1LFwwgLYQAoZOYRqXMlLyMvAKCnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpwJ02oC5k25x7gpc3Gfa9MH81LXjsvR1QQezFv717NpA7QCsE
	CIQy86XG7x82ZG8gW/LFfNpZt+LqYeBVwRovTw2umA6GrcfmzU3VtK+2UIqkZ5O/7A==
X-Gm-Gg: ATEYQzwYDjK4XTcn1PBc6Pf9XP/xHuQag4Kwn6nNXFZ8HqcZYyVjx/jtO/cidqIYSk9
	6+Kz4j2tony/jNORQrpe4J0axRESwjZUz6Q6o3FeZ4IQvJK3tTCPQnn/JtR94XHjdi7yVZww2Z6
	DuWtsAPugt/Nqf75aDYxW7KW76pNWKgi0u5HgjKSZsLQsuqmwwKdDo5M0ggmNbCtrQ7ivx4kVpN
	F7ZaxebH++yLpaFCPpwq86F+xj1v2OgC/ZTp0X6rmaATg2RgjVWEzUJbDOhSqc7MKddSQx3XIvk
	pKsjqh3Ux1DcxFtAkFyBkAlBvQPPxKXEDipSBQrkuamG67GTf3VJ6/p1UaIJtw2nZPRsQdpPlha
	XW6uAf00+UFN+KFePAGWtI1B5GT+ucqPIlg1ssmacAMg6V9aS2c5bhiDpvwK/lXD1I7pUXYP2cj
	s120/tJCO2QB3NUh5MxkBkA2amauULIfQNGwmY6+f+Mp28iZxLgyHsJpTWqz9mh6bx
X-Received: by 2002:a05:6402:4396:b0:665:3cea:9864 with SMTP id 4fb4d7f45d1cf-66a340a3108mr1300744a12.12.1774345715225;
        Tue, 24 Mar 2026 02:48:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:b548:adac:2e4b:638c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d219abf6sm4568731a12.20.2026.03.24.02.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:48:34 -0700 (PDT)
Date: Tue, 24 Mar 2026 10:48:29 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: "Panagiotis \"Ivory\" Vasilopoulos" <git@n0toose.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Dan Cojocaru <dan@dcdev.ro>
Subject: Re: [PATCH v4] landlock: Expand restrict flags example for ABI
 version 8
Message-ID: <acJa_56LtPeeH956@google.com>
References: <20260304-landlock-docs-add-tsync-example-v4-1-819a276f05c5@n0toose.net>
 <20260323.sheiHaR5uRoo@digikod.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323.sheiHaR5uRoo@digikod.net>

Hello!

On Mon, Mar 23, 2026 at 07:56:21PM +0100, Mickaël Salaün wrote:
> Thanks!  I pushed your patch in next with a minor fix.
> 
> Günther, does it look good to you?
> 
> On Wed, Mar 04, 2026 at 07:13:04PM +0100, Panagiotis "Ivory" Vasilopoulos wrote:
> > Add LANDLOCK_RESTRICT_SELF_TSYNC to the backwards compatibility example
> > for restrict flags. This introduces completeness, similar to that of
> > the ruleset attributes example. However, as the new example can impact
> > enforcement in certain cases, an appropriate warning is also included.
> > 
> > Additionally, I modified the two comments of the example to make them
> > more consistent with the ruleset attributes example's.
> > 
> > Signed-off-by: Panagiotis 'Ivory' Vasilopoulos <git@n0toose.net>
> > Co-developed-by: Dan Cojocaru <dan@dcdev.ro>
> > Signed-off-by: Dan Cojocaru <dan@dcdev.ro>
> > ---
> > Changes in v4:
> > - Make warning somewhat more terse, merge comments.
> >   - Remove some sensationalization. ("Don't copy-paste this just yet!")
> >   - Apply Günther's suggestion (v3 "recycled" some phrases, was long)
> >     - ... but also retain some of the wording on ABI differences
> > - Provide a brief overview that contextualizes the example further:
> >   - Clarify the difference behind ABI < 8 & ABI v8, to avoid
> >     misunderstandings on which option is the default.
> >   - Make "linear reading" easier.
> > - Based on Mickaël's feedback: Avoid cans of worms w.r.t. use cases
> > - Link to v3: https://lore.kernel.org/r/20260228-landlock-docs-add-tsync-example-v3-1-140ab50f0524@n0toose.net
> > 
> > Changes in v3:
> > - Add __attribute__((fallthrough)) like in earlier example.
> > - Improve comment for LANDLOCK_RESTRICT_SELF_TSYNC (ABI < 8) example.
> > - Add relevant warning for ABI < 8 example based on Günther's feedback.
> > - Link to v2: https://lore.kernel.org/r/20260221-landlock-docs-add-tsync-example-v2-1-60990986bba5@n0toose.net
> > 
> > Changes in v2:
> > - Fix formatting error.
> > - Link to v1: https://lore.kernel.org/r/20260221-landlock-docs-add-tsync-example-v1-1-f89383809eb4@n0toose.net
> > ---
> >  Documentation/userspace-api/landlock.rst | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> > index 13134bccdd39d78ddce3daf454f32dda162ce91b..64c7138a788d74f99da0a71428da392b3d873bf8 100644
> > --- a/Documentation/userspace-api/landlock.rst
> > +++ b/Documentation/userspace-api/landlock.rst
> > @@ -196,13 +196,27 @@ similar backwards compatibility check is needed for the restrict flags
> >  (see sys_landlock_restrict_self() documentation for available flags):
> >  
> >  .. code-block:: c
> > -
> > -    __u32 restrict_flags = LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON;
> > -    if (abi < 7) {
> > -        /* Clear logging flags unsupported before ABI 7. */
> > +    __u32 restrict_flags =
> > +        LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON |
> > +        LANDLOCK_RESTRICT_SELF_TSYNC;
> > +    switch (abi) {
> > +    case 1 ... 6:
> > +        /* Clear logging flags unsupported for ABI < 7 */
> >          restrict_flags &= ~(LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF |
> >                              LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON |
> >                              LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF);
> > +        __attribute__((fallthrough));
> > +    case 7:
> > +        /*
> > +         * Removes multithreaded enforcement flag unsupported for ABI < 8
> > +         *
> > +         * WARNING: Without this flag, calling landlock_restrict_self(2) is
> > +         * only equivalent if the calling process is single-threaded. Below
> > +         * ABI v8 (and as of ABI v8, when not using this flag), a Landlock
> > +         * policy would only be enforced for the calling thread and its
> > +         * children (and not for all threads, including parents and siblings).
> > +         */
> > +        restrict_flags &= ~LANDLOCK_RESTRICT_SELF_TSYNC;
> >      }
> >  
> >  The next step is to restrict the current thread from gaining more privileges
> > 
> > ---
> > base-commit: ceb977bfe9e8715e6cd3a4785c7aab8ea5cd2b77
> > change-id: 20260221-landlock-docs-add-tsync-example-e8fd5c64a366
> > 
> > Best regards,
> > -- 
> > Panagiotis "Ivory" Vasilopoulos <git@n0toose.net>
> > 
> > 

Apologies for the delay, this must have slipped through the cracks.
Thanks for bringing it up again.  Yes, this looks good.

Signed-off-by: Günther Noack <gnoack@google.com>

—Günther
