Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7C49CF36
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177909; cv=pass; b=PYHq2TFLgaHEiXzlMzOBp0U+XI6z2+N7ApWLfNyLGSwwIdqiZejH//YwKNOMju5fQDA421bLXgNZ79FgpWN14a3iES48fZLsT8KLGkV+5+w4jcLirIPHWBcoyCmM0JlBcdSev9mSQiditLtf1oANSWTARwK1dJlw5glGjS6lmWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177909; c=relaxed/simple;
	bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4tvjI+WgCxKOr42WGDQLAlYcnmJ8M6FOtun8BwJdfUMPh0hZlgMP/ZAikIdO6m/Pv/pB3XdiKQTfZurVE0fIdBcEK5bMrlI42A6KCEtXoKX0JzPUzbZk66L7XldL0WMmbXTU/Fz2zyMg79VpFVPclBYLHCvPGwvnXMtA+m5JQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1rfZCpV; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1rfZCpV"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4c556f35e70so167902b6e.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 08:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790177906; cv=none;
        d=google.com; s=arc-20260327;
        b=n7fF7wdkKdGQ2Ncm95bp4yXQJ0crEJN5xEubIw0CXLX3SBvy4EiUnzMYxOEbGMgduD
         JAVMyk5JjK7PGznZ7a/uLZZ4RkFVIA4i4ZtlzRLSoMCj0evLkeI16e+jci1M6r8WZ14i
         1Tj7SNDweUAtHBt02gG8x+UDAaOJQpfux5X6ydmp0BxGy4w5oeDudoue5l724F98tKd/
         xEBp7YkvNPSP0TuScNMOoCP/BnBXJSWUOadsWGJwqNcUcKsDoiLDgG4V6y87Ptrqc3X2
         IMxJMR4vZ2vfBOCrl1N0air2JTx/PfVF5PK5ShqkZWRlZcOhffALfS1/qlfaiRlLnyBs
         H6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        fh=QQs2uQ8MMZ9dK18IkH+cu4VfEgMfp/HJFxlVB+sktnA=;
        b=mj7EoHNU3kbZOiiZI6Y43B3BRFbklALTxYsg6ASvo136nQG6Y70sH5Kh+YdZbfY69X
         Tgb3AmpIlsx99qmNABqNtyHaGeakLPtqI6l6Ep7osuV6ntXOUfNZO44ZQU4JGbM7hvY4
         eUVBARQcwJQmuGFE+Yb1iQY530Q2XoBl6BOCTREBKyKIjkoDx8GhFSiWp4XH+0eP9D8r
         UYbSvN38kNk1XCkWza61uTijLVw/XP2oVKsWoWOiPsU3ww3KnuICdnAEEWI4dGxf+8Nr
         2CNNehuEUgbdOc+Kr3nk1tBEEO3AJLPb+DCDnT1umgnjEURkkl4vVhD218LihBSyjTA8
         Cv+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790177906; x=1790782706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        b=R1rfZCpVaoeS1I2e9V3K7gFOBN4qX9lpx2qWsDz6TSFzILf9pqdosDuJZkprYzJUqy
         mPSNCdaCsCRHbpk6WVGCjxaAALCpoiyA30X/TtQbkLIz1p4ceuY6XUPBKEdEBXv4EE9S
         2fnqvMF+M+RxE6Kgwj8mBgt12nP7s+GU9YdFI7tJbg+4wH3JmHZwJNGEVvwPJVaBrIo2
         VbHltlbqfqRtmHgK6nkQyVs7NwGN4y/3T/7N7X0qCtJvrBZ5D8pCB62U4Vz/hOvHUKi4
         seRU0faKnD9B/KzQxPXca3DwxLerTBl0nDK9kHyaN+DvX+i5ebUXe7rwbaDdIJmBDZuH
         CJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177906; x=1790782706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEeSEkSOfRu+0wU1/5d2sKj9+XsQVOzf6RYN8jzfDRo=;
        b=MjLI9vvGpAQLvrmyJAGPybgNXxWyvf9nTESHSK3Twy+6LDAHfx135uk9WH5a7EoSFj
         dKcxsAgpui/LgB2wBKZTU9DGbUoKmPHxNUh4ml7V40cgrlI7MgczEMBwxqAGymNWJJNx
         eBlLsobl16kNg3PCPMx6L2YP9DB/VqkKzS6H7mMPXZNog41BCVXq4EO0NhtrqQXsFpqe
         9S0GtleNtGaaJ3kK9tD3fmflN+6GmjNkjXd6DUIxlW5vY0y5T1jr2Ddop8OpX+cuqAng
         mnIciUSAgHjhQKJXIW6q/sgThGadFbgGeIe3mGuTbHNAeiEfUSbTaz4chpaZvPQysbMg
         mYlw==
X-Forwarded-Encrypted: i=1; AKwUvBzqpwEX4W7v9PiLNFAl8Y62RQpa4yb8w3nH5uf/36WpBgfTXfOdFPIqV/cUWJ/sXCapDWMmwPd+UTU=@vger.kernel.org
X-Gm-Message-State: AFuF++me70P1q212dPX4mckYVHFcClgvxitc/pmNq81JV6Wxi3NkrrU2
	6D4Kes0roo5ROsvEPLlnJi1hz4vjhNvJVRtePcpZeGF6G0VKEXbJ04cy4crdXvsRX1NqZCFi6Eh
	9jcHkiSbjtvTkDvTmX0m4ohYRiRxxOCQ=
X-Gm-Gg: AYBFou1OWELXZogr7AH4eXJHzvjYKXHcB+QYnBpvHRSVYCDqFkk3qroUogYgJDoheMV
	nSIs3Vl7/MyEsyCYbK9DXmXDMR/db7czjmXBmT6YGheyiSLnSw5ban2z4UthBN23FFNmfDUxBcT
	9YuNs/1bZCEGCEce7JenV5YEb5jS85pZ4CMI++kvfq9VJSBOc8wj8Inihepto69FKDtQmB7y9Kv
	VALaXoSFMZVWfiDlFQHsqRvGBbbcQOw2Lu9qCl+Lx9WS+JskAJZrbxkVNMVzkEf3weggPrRd59t
	TZRDXdNTVsKR3FO3hY6OI8N6ukvWNoJxMangexwySfPTQ6Lgo63aEka+LoQIaTj72qVX1gw=
X-Received: by 2002:a05:6808:ed0:b0:4b3:9985:1734 with SMTP id
 5614622812f47-4d5ba3c4acbmr3726514b6e.4.1790177906420; Wed, 23 Sep 2026
 08:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-netcons_ratelimit-v3-0-8e81b789ab37@debian.org> <20260914-netcons_ratelimit-v3-1-8e81b789ab37@debian.org>
In-Reply-To: <20260914-netcons_ratelimit-v3-1-8e81b789ab37@debian.org>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Wed, 23 Sep 2026 16:38:14 +0100
X-Gm-Features: AclHuK-2YGSrpzgft7by3_dFRSTPGzkf9KPty-TIWRA5mQOXoN0qwCVvVkFO1d8
Message-ID: <CAGSyskXex-Pu1n1wp+YfpVgbZnCRrd3CmGcLR9XWxenVNnk6NQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/5] netconsole: send the oops when oops_only
 is set
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, asantostc@gmail.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 1:10=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> A target running with oops_only=3D1 receives nothing when the kernel
> oopses, which is the one thing the option exists for. Only a panic
> still gets through.
>
> netconsole_write() bails out unless oops_in_progress is set, and that
> flag is already gone by the time netconsole runs. netconsole is
> CON_NBCON_ATOMIC_UNSAFE, so console_is_usable() keeps it out of the
> emergency flush an oops prints in, and the records only leave the box
> once the printer thread runs.
>
> die() wakes that thread from oops_exit(), by which point
> bust_spinlocks(0) has cleared oops_in_progress again. TAINT_DIE is set
> in between, so test that as well, behind a helper.
>
> With oops_only=3D1 on a netdevsim target, an lkdtm EXCEPTION produces 44
> lines of oops. The receiver gets none of them before this change and
> all of them after it, while ordinary messages stay suppressed.
>
> The taint never clears, so from the first oops on, an oops_only target
> sends everything instead of going quiet again. Sending the aftermath of
> a crash beats sending nothing.
>
> Fixes: 7eab73b18630 ("netconsole: convert to NBCON console infrastructure=
")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
