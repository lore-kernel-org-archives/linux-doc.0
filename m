Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3F82D5A01
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781441765; cv=pass; b=Gi7HOKKCai9dOzYxAjsESPdt/ikNM1aHaoim13UGKhu8K8FPG+1ZEnVxA6AY2XRfoeNGuycoEJC4xr76B221qjMWxU4WOsawtX7Ddf/JXhopP7hNuppWH6SuAEzYY82Kvkd8e/H7l33EQxyNund+QXWo1vylVTWrV0H/wPwzY0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781441765; c=relaxed/simple;
	bh=weXwqxQBZCGF/DjDGP8L+VzYsjiEKQCKAFEJ897yvck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWUXTmVNibjJVg48Yu6F3gmbTdSwJWhijDylfv6Oh5XwGljbxMHBdh2Nu3pS5w+1ky2SOvEOY23fhovfg1GYNom98g4K0vGD5N4nmDCc3ejTnU6e76byjQLg79ZTJdswV7i6ZukN1mPHvAtsdMIED6htaDY6Q2Nd9rGeyasXGLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Jq3VySqC; arc=pass smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Jq3VySqC"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4864abba33fso1587421b6e.0
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 05:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781441764; cv=none;
        d=google.com; s=arc-20240605;
        b=BitXcAkkmRqNBUEwLbw6wlSWLsHVD4JpNV2ZJBBRprlsrN6LRViqwdK0CkLrjhfbYo
         miKy3d0Y5gSXAiVU4hA7dmBfd7ioTiWoTiaTeNkzcOoeLSD6kvndjbpKkUKvl/qxVYD3
         TK0B1noiTSC5B2ApKFXIbWTFuO14GXchYmZJyxvlhOrjc5EgMSdZ69jCM6vUu90TvqYT
         14dCK1pKXvD2l/+3BprClb61vFUAPymn5aXY/8g2ZSFqn86UKlZHCnOmnm7aQUJtuQWJ
         DLFYa8slVP2vyhNjj1wfI2jn75mvR7RCLrmZNLNfZh3Xng5FAeX8oMYPTXmCQ/U9UAKu
         Eyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=weXwqxQBZCGF/DjDGP8L+VzYsjiEKQCKAFEJ897yvck=;
        fh=6A+ZQKoNKSh0I3NKCC5nqDcuFM4FVZ7nhOgm+kBHzMw=;
        b=BCscSYRaiaLOAD3Xe1KrARjIHVSxSamrDoWbVPLdXYtP/9FRgj5ZXqMgR5xmehgNUP
         KFkodMFlaMykJ9lIMCS1EBJoDxN2DoaaQFdTlg1jxkmHydER3I4Jq2Ga87MsK60b395D
         IwxKLxdM85h2Ce6ZEme3txNU+HbYNqxk+ehjNlYVCKEwGfPNYI+zFKe1g8HpztnOm+NL
         c6EIMXK4OhqOZXIVUEgRrTSIp16pg5DlHamubp5/V/ZjLIHiTZe4CN3KZUyKlW1RIN3a
         V3OSthowbeV6yR8oov4NziEo+6ydOUhO8bTVYGccXUhv3zCGKjxvIFF+tBn3c84BoOMJ
         X2iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781441764; x=1782046564; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=weXwqxQBZCGF/DjDGP8L+VzYsjiEKQCKAFEJ897yvck=;
        b=Jq3VySqCQocu2QqhUGHfXYrQRqmsfdvBMA4utTR0KI3NjpvK4P8+urgrl9yxTCm8hg
         BQygwGwsx54Go0skCT4Aih3L7UOFSgAx+07FDZ604SyWDBWs629KlQ92gStjkf8XoHuL
         p1J3XzWUh7g5LR/UQQAPGehjta/Gtwo71f5vlJMFOrEEqEzs9DN3vZ2q9Y+ziPPnYqie
         gIRFNEeXa6Bo//0MTNUCweERl834Q/IZrHwsE2HztaN7+SQ79m8M3i0Tma9GNwg5J1Ju
         WniaW51E1kll4XpRLP57+wyiCaPV2WfbdlEv8jYMZnxQ9rDJcnL4QqznP9YJ/C3pzCo6
         JUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441764; x=1782046564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weXwqxQBZCGF/DjDGP8L+VzYsjiEKQCKAFEJ897yvck=;
        b=DFdf7WJzgt6tKF6qG/bhswbOOQyUbh8t+KudMegqomj4kYGt1VSmi93Sa0YpJnWsl1
         +/cH0F1u/baikzYqOWzolkeClcK8vap+AgIzdJvQYWFAwu5ndYPgI4gy8MyVIDF8kn+2
         sNF354eHs5UB7gb057PMPC1VP7Q8mIQDyl77D7i3f2L/EcuOL3x0WvvCtJzOEo/siTD7
         mqf9paU684H7YkpB5l0i1gJSZ4uLHHvacSAwniY4b305S+hLjtcGHdkwZPydaIce3FfI
         8PkWpo4tNAvQMdxD8jR7Krot+qQvxL+MN6UrP+GPd/wWNTurVcy3woXEMFjgPEBUPghH
         IILg==
X-Forwarded-Encrypted: i=1; AFNElJ9ywHRKUk7lqWsX0sy0gpaF38FOGaganh4a7/68hR1QdUoyC0EGyXpqQV+MUubIs138pRGRxauTYPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDon9VXEFBwWCEgZLj9zy/OHJOyKGqzWohsptsOgmRRAEW/lVs
	QBlRgCEvZU7TF+oAUYY3EsBmOZ2sbKq5iBYRtqR2Y5MWwCyIIsVoC0eNtQDRkP4HrCc2R7MBEdN
	FIvl7aDoT5plB49Jcn3RnRnoExHRnQM8Chy2/p8aAVQ==
X-Gm-Gg: Acq92OFeeRUGoN3rx0nkXbLoZR2JcGufNkwEAM20zUfqBwditSk9ZhjjDYL/+RqkNfH
	/u3U3yDDMJWmYM4FslbDkSP4kvZWukp960cVh334tyGT7QmsEyoD8wimyEeu/3P02OZ31Vz89HK
	EWkFAEXPhAUnGKLDYCQJ2Z5wgitSQsuG5IZQjITUjG2Gk0vMZTA1AviD6zICH7j9Xyn1G1arwJf
	K/NnLUhBet122rdx54DPJv+O1i1c9hu8OEuCZp0FQxsD1rUDEcOHxiznEhve0Uqs18KCo8NhtJC
	6DLzaYwwWcKSFfDgW0w3VfFsgPj6tW7g54Z4GpXU6GtYY2xg8GJUebGCckD6XXo8p4Wbk2U+mqV
	SY4pPOH9RzcPmqgUzrJ3+hAxEx1SDXQ4rXnDkGG0=
X-Received: by 2002:a05:6808:3025:b0:486:4b79:12b6 with SMTP id
 5614622812f47-4872dde9912mr5576862b6e.9.1781441763846; Sun, 14 Jun 2026
 05:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-4-c34c187142a6@thegoodpenguin.co.uk> <aibfFQpK0Se-SiaT@pathway.suse.cz>
In-Reply-To: <aibfFQpK0Se-SiaT@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 13:55:51 +0100
X-Gm-Features: AVVi8CcZ8P3gD-g-OZJNOPUE3PVXT5e3I-du7zp9_GgQG2DxRwtKKm-rCROOcqc
Message-ID: <CALqELGz7F0eL9e70OfJLMFLNKDhCG237hr0gG5qo-8pDuEo9Dw@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] Documentation/kernel-parameters: add/update printk_delay/boot_delay
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 at 16:26, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-06-01 00:17:40, Andrew Murray wrote:
> > boot_delay has been deprecated in favour of an extended printk_delay,
> > let's update kernel-parameters to reflect the addition of printk_delay
> > and the deprecation of boot_delay.
> >
> > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
>
> LGTM:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Best Regards,
> Petr

Thanks for the reviews!

Andrew Murray
