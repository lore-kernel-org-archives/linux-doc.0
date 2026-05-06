Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1F3FFAA2
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082392; cv=none; b=YC+hZCEY7E9jgDTBg1tcB+jzxbIrURCwx1f333HO0GzUPBMRxMikJHaza2vOQiOOmi9zsFaTXe/rMrkvsa47UmAke4tEGgBIkycEuTq8QQvghC3keaP3gdHOitrDPfhNvf8FYr1BgZu5JcRubQvj7yNVpx4uygPaYojMtza68/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082392; c=relaxed/simple;
	bh=Ayxe0U7sEqVbzMNuLfhkgTWqSkvKWKIHUAFfGG7sBVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABt8XfM1/oetvmiPwl/l74dFe5xdmP+3fLdltvmxExDjNEPVbICdJaiY95tEPPd+Ev4CfDNppxUldCoQNwmc6N8p2oEAojQZ3CTZ/TkMaBrPFaw571vP2kY3eO5Fwx81gKCgZ29XdcVN3EuDJc1UXC27a0XnE74j10gs9dOu1k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a7cWpDw2; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a7cWpDw2"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b93698bb57aso179897966b.0
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778082387; x=1778687187; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ol9I+25i/wXqaqCu9UMZW182j7aLIrDgRKl0RhfiK4Y=;
        b=a7cWpDw2i3zhZW+UuoeJJKg0vrBfYB2l+N/UHQvavQWWTD+VkiktGtchqqmSvWEaIJ
         y1cPTzuF0bi9kx396mM0gcHjMIW8q7A/HLat9DcqJGEf8lTHGFoPSopbjtjUlKzK2FpT
         kKmpbjZV9iCulJJnh9xRERXC2Ge8XRuzgeYEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082387; x=1778687187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ol9I+25i/wXqaqCu9UMZW182j7aLIrDgRKl0RhfiK4Y=;
        b=F68/zJeDuXeNsBX53fd2zCcSCIddh7RKWC05Pr/kPbXi2hoq17XMnluntX54u/bpX1
         joCvnNlJd5FX95uqR+bpXys770qZZnbXlVIt2mfm6UcVU3LSN5lGBHXsizojM3LmDrb+
         2Ykuza1k8HNQQscafPcKr0GF8DRGExwQR6D5ict42ZQEE2OPLCDaXUGi3zi7tTCjRs6L
         6v2Qbcogqh+SILPiiV78uf0mIrcG/R9y+i8+3GNKn77tGn0iy46rNESpQslHz5pf/c94
         bmxZ94WdTqmXgsVvIW3jlr+lm4oJidstEeeHusNxj4d3g4YKGFVerEkLr1imTKGKYV34
         GEdA==
X-Forwarded-Encrypted: i=1; AFNElJ8djzYPxzzgiHRCZHwsLG2JvznoubGAjeRUTLTD4C4qwW/wK/CI55Yk31/9LMmvRmj/K4+hI/+MSCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+g+d/mY5BknPXzW9TCGZA7J2bQflBP0q8nV+ucN93AdlDKHe
	kuTgqyS5JlMYemnHgqEth47TuFCdYZ82pxPgZBgaOf81g9s2Jo53PqObMben+2Kp38ifNWjU0S1
	ifuxn0q0=
X-Gm-Gg: AeBDiestIThbhWTEB+IqDZJeALF6d/lKiUakBzW8KxR2nrNY2jVxNMud1MO1QkC0O6S
	QqTU/vV405FY+A/p5346IU8QeMAFO6GD+870ZbeI3tPytDMHKZ4TEu2BCUoxEp2lOP2R6HQNRgb
	QHZc4HoBul4nrnlH8mCoXcWYGc5mfJXuhVDa1Xoc0ixEiiffRyIcMzcvEky608micDmy8nrcDnh
	3rXO1sJw3idwCnh7dLYr+xjxMKScSNAEAbTSE9hD8MOWRpEod0OnlfVkhM8oH7lOmaIAX/IWww8
	uqOioZam47bm9zoy1c5rMqroCP+CzBXqE0U/x44mHM4dxKnJXKUlTdck80B2NF1dgs9zVJEq9Vm
	5+VDG01emj8FPKiMmmNGBCc3Wzu6S73fUGK66+oeIoh87VBThk3K2brsPbPfuU/ReQv1P7F5U4+
	4A8uoiG55w/WnY5tRwwRrV7jQLz8NqA0oyn/Xp1vf9vDwz6aaXOtApsZOwzj81x6OD3yyOiYMe7
	gMIY9EXGg==
X-Received: by 2002:a17:907:9810:b0:bc3:a0e9:e0c with SMTP id a640c23a62f3a-bc54b85173emr208143666b.13.1778082387139;
        Wed, 06 May 2026 08:46:27 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b17a5edsm97231966b.9.2026.05.06.08.46.24
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:46:24 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso1912863a12.0
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 08:46:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+wRxM/TmwvY4sfXm/jf12mJhDY/jjMpgL1bwVV6ETt0T2Oqo5awIWt6s2xyjfr4EoAckfiCfnW7xU=@vger.kernel.org
X-Received: by 2002:a17:907:9448:b0:bc3:99d5:a29f with SMTP id
 a640c23a62f3a-bc3cf833b05mr437230666b.5.1778082383735; Wed, 06 May 2026
 08:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503113506.5710-1-w@1wt.eu> <20260503113506.5710-3-w@1wt.eu>
In-Reply-To: <20260503113506.5710-3-w@1wt.eu>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 6 May 2026 08:46:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
X-Gm-Features: AVHnY4KE50QWidq7jluJrSAvjRbAdXhycVxJcJyr74qo1PmiGMyRuavPyHIA4oo
Message-ID: <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, leon@kernel.org, security@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

[ Coming back to this after a week of trying to clean up the disaster
that is my inbox after the merge window ]

On Sun, 3 May 2026 at 04:35, Willy Tarreau <w@1wt.eu> wrote:
>
> The use of automated tools to find bugs in random locations of the kernel
> induces a raise of security reports even if most of them should just be
> reported as regular bugs. This patch is an attempt at drawing a line
> between what qualifies as a security bug and what does not, hoping to
> improve the situation and ease decision on the reporter's side.

I actually think we may want to go further than this.

I think we should simply make it a rule that "a 'security' bug that is
found by AI is public".

Now, I may be influenced by that "my inbox is a disaster during the
merge window" thing, but I do think this is pretty fundamental: if
somebody finds a bug with more or less standard AI tools (ie we're not
talking magical special hardware and nation-state level efforts), then
that bug pretty much by definition IS NOT SECRET.

So why should be consider it special and have it be on the security list?

Yes, yes, I know - some people think that "security bugs are special".
And I've been on the record before calling that opinion special - in
the short bus sense.

Bugs are bugs. And not having them in public only makes them harder to
deal with.

Do we want to make bugs with potential security impact harder to deal
with? No. No, we really don't.

So I claim that the only reason for a security list is the non-public
nature of the bug and the whole "responsible disclosure" argument.

But that argument is complete and utter garbage in the face of some
mostly automated AI discovery (now, that argument is mostly a fiction
in the first place, but I am not going to argue with people who have
vested interest in making their special  patches "security bugs").

To recap - I think this "document the scope of security bugs" is good,
but I think we should go even further, and just document the fact that
anything found by regular AI tools should just always go to public
lists and is simply not special.

                Linus
