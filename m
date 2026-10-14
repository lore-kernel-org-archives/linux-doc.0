Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C154B827E
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985906; cv=none; b=ZiimT1RZfwRaWNhu8qyQR7+okQPIW+oAevvEaVuit4E+mkj8aAjPVc7eYaJA7/d+58r9KiXOoNrI9k03alFGcUVDlP9ozbaobcg3GdMQUxvilEALGT6xu4/nuEmiaF1M2fOrmiWwcXBEeqI73hFLAmk70sSmWTHpC+RvuzFyoOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985906; c=relaxed/simple;
	bh=tgmSYRODldtiyEy+JXapeeoUqKtXmFc3P6QA8yFixoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPMyZ1ueNC69GknY8GVT07pOVApzmitocahNX6Jl0kqYhg8t/Ik5yCSydefYUD6LEtFfOXIwVOdzDt3LkMiWW8+0BVJ4q/DOV1Xygj9IUlANSbxsvwhcElP25Ld0ej6JDpwgW7NMF94OlQfoRGbLNXFbZkvx0O0ErQEgZIc3QZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e62319cfaso108963766b.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 06:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985903; x=1792590703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IEXfd68nGcyHVRwrJJo9fpBrzQEvxp+Eo/L7XZpCrXA=;
        b=UAiN/bNyGvFfVlWazd7jwPZv8wIGtSHlfeyyho71/m3MkEVDjpoU/xcB2xRIRmqpvh
         qruGdF00CwK6UKwW+tnDygNGK/1Jq1zUTznuCRg5FH7FMWd5r6h31K2MdGmNOZrBgt0B
         tMs1TMgXquXAhZ1R2h21ykAfGQe/wM7OsQ96uJVc/hPk8CGz7M+0hTEaVJsbIeVA8E7h
         gz113cWZEXb86qJwi+CdjuOvw6kqpUQTWujD92TAl4M4Ah6VEOXqwBXLJz5iQyfbleN9
         TLmA0XUBRgTk4GOMidMpA6OLJuLsiFAt9OhTtA9bclSIaP7ZxGgRdn5nRZDN50dOtzcQ
         ybeg==
X-Forwarded-Encrypted: i=1; AKwUvBw8DGxYN+VK9gXDCjsqZ9MoJRgSXqDC6ed0yNVXHGSwrBU7nVhgoaHpqUqX6a3X3AjO1Pt3pvGQFGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDNLBf0sD42bNTG2cynnU+FPtSz4Tjy9T9eLSOPmxub2RiUn7S
	PzNbcCh40lxUKilI+ggRO7ier1VzFhOKvu3UE8972rrogDg3z72KprmOmiz7JUbnZyU=
X-Gm-Gg: AYBFou16MqJc1/gGzjSgqBnUeo+plnE1mk5dI8AvCV++ZJhAD6VYA/i4dzMthppbSV1
	yPNslefMwG7+sarKqo+GzXRof0xkxs57Fn60uJROZNeQdCPvwvE2/mKxdFp9EF6FXINOx2uJt/f
	UYOkp8oh3Ntc8c8V7E7cKbMoaJXqtLv4gy1NCkyA9VsaL2xps81zDhtDmn7YTXbejUZm0E8xoFZ
	yZAY1HO65Co6QNdD6yq4YeiH45TcE0nMQf+33qnHAfeFu2i2/FYBk6ovuxnVmSbBsxywXmg0EHF
	xRhWPc4nrJl8oidqVIioXoBjUAihKc1zWntCZ6UKpXI3H+rM78RoKDPAT3d+XJX+XjcZJ8UhFgE
	bORYbcSYEYFmS0eBi8COjWY3hr0yHcN4TnCM0r5prsWBTSZ5fPw0DIK2uYd/cI+4Rn2Bp6g4Gue
	OMR0DSP1VO71MQE842UmwC4LX8OfAjLguFM/LA/6XUZMzfk3SY/LxPuMptJKU4Z9J0mYhERRCIg
	eWiGnLBS9SZ6T5vjk1PIx83zFkv17a8Eq5sso+Sag5Np/E=
X-Received: by 2002:a17:907:9443:b0:c2e:4a61:d436 with SMTP id a640c23a62f3a-c31aa09632dmr1591730466b.36.1791985903038;
        Wed, 14 Oct 2026 06:51:43 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3b5be19155sm61933666b.56.2026.10.14.06.51.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:51:41 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso1861391a12.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 06:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxWWlF9mkWXIjn4vgCvF7OuUxr/NRIVX0SLMpmgsK1M1uCrYhSjBD2CbSps3oGffeaVfOXQzmAmiZE=@vger.kernel.org
X-Received: by 2002:a05:6402:3046:20b0:6b1:da03:d010 with SMTP id
 4fb4d7f45d1cf-6b1da03d6b8mr4816329a12.23.1791985900158; Wed, 14 Oct 2026
 06:51:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012213452.1863248-1-sashal@kernel.org> <87zewiy1sd.fsf@trenco.lwn.net>
 <202610122047.A9E381A@keescook>
In-Reply-To: <202610122047.A9E381A@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Oct 2026 15:51:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
X-Gm-Features: AclHuK_-G5twnGpuXtga5uzESM43gtwqSHGN6ArqXvmpzC19Pilix33WOTvsZNE
Message-ID: <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
To: Kees Cook <kees@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 05:49, Kees Cook <kees@kernel.org> wrote:
> On Mon, Oct 12, 2026 at 04:47:14PM -0600, Jonathan Corbet wrote:
> > Sasha Levin <sashal@kernel.org> writes:
> > > At the Maintainers Summit, Ted asked whether the stable trees have a way
> > > to deal with incorrect Fixes tags. Hannes estimated that 15-20% of them
> > > are wrong, often because the author ran git blame and took the first
> > > commit that touched the line [1]. We use LLM workflows to find the
> > > commit that actually introduced a bug, and others asked us to share
> > > them.
> > >
> > > This series adds them as agent skills under agents/skills/, together
> > > with a skill for writing commit messages:
> >
> > Time to argue for a more fuchsia shade of mauve without actually getting
> > into the substance of what you're doing...:)
> >
> > I wonder about the top-level agents/ directory.  If we regard this
> > material as documentation, perhaps the "skills" should go there too?  As
> > readable text, they might just help to improve human skills as well,
> > assuming we think we still need those.  Under Documentation, they could
> > be built into the rendered docs and made more widely available.
> >
> > Otherwise, if this is primarily a development tool, perhaps under tools/
> > makes sense?
> >
> > I lack strong opinions here, but figured I would ask the question.
>
> I was expecting this to appear under Documentation/. The agents are
> designed to read human text, so let's make it at least passingly
> sensible for humans to read too. :)

The expectation is that the agents are becoming better in understanding,
so more "instructions" can be shared?

If that is not the case, perhaps we need
Documentation/translations/simple/, cfr. https://simple.wikipedia? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
