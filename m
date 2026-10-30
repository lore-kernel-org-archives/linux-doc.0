Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357912;
	b=csX51C9E+J3e5hO/mRL1WgiLZkoQLIJ1r0Sk3P5x1uQqhB1CyRAg9wFr020P/cnjYhes
	 mIQ57FAbrwIPZaYV/J2ps/jqQfh4uIPDQRl98p/3Qlhb2mzE3MdQFOIJl3CYQgKMK+yV4
	 UepwwcZDCbYBxT9dGmePKYkiB6ZxdCWp9PPgebZX5VsXSJO246Zx7bdWODb59kLrrG2lt
	 dtGB3qJwtfsARA1lq+fRKo3a/1kNFwKGnK2pjCgGhcj3NOp/qOq30swjogGF4l0BPpSVO
	 DQliRfZozDzsCB68wxBhVra7UjsFiGPmJDvODhY4YH4PnlJ1UR7raZk9o3wpt37ddwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357912;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qANwLEKHR+Q8Yt9LD0kW884nruLVZmuaF5lEr9bqDbs=;
	b=Oehbq2lag8L8JeYwKcp/6dX+5CPb5hib60iEAxUxazEfbs00CjTir0r4fMkFC2zKKFF1
	 1rNFmIjsgj5SuAJkEp8EMdtV8Z7h4nyHW/Fk56y/DKLO4oXki0qqXTAxKaJh9gmBZAY7P
	 f5jGyESplyK9PBvHwhsSkUy6mZYYdn3YOFH9lDXveZg7u3MLSsSeA+CpfL8F2TqE9lqhH
	 Ab3kXMoVpl/uL+9Kf44TI1OhBp1SeRdXuiwNbLcGOseJAVGzxACwFjAUkgUkWkkxvEWLG
	 vFAst1QiroJb3Oztdt5Cus+5wnJHPud8rTRRKmELDD3RWpHmK74zYFoORWh5a0oSmkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6CA606D28D
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 10:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF6CA606D28D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ec6f271883so224695e0c.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 03:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357911; x=1793962711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qANwLEKHR+Q8Yt9LD0kW884nruLVZmuaF5lEr9bqDbs=;
        b=Njugrtx9Izj71WrT1Sf5BpzuamIudg7F2BN99qogwZFoxdre1rvDjvfik9u+6VBbca
         L8F+4ePFj7Kf6fVGjhj2B9DI2K/ZYXARpC6qf2ZbNYxVsft413Qtyvam5F5KQWCR4NH0
         2Q1Qi9iBwJ2rdKQ/+iygowgByZu+E8x8nGNnE7RZSn+bFt31imtvqj2kU0EZYKCgDJ4i
         4sgYsPs43uMia0UXj73Omk8HOwq4crlcHDZMnY/h9SK7X26rlaRVvN04t2mOsjpmy+/F
         2iKTGWm8bpdUlzOP0R2/3y3osNnvlZMjBRoYC1o7w8pcCzD0TTvKBg1YOPMf6vpm8S0j
         vEhQ==
X-Forwarded-Encrypted: i=1; AKwUvByIIOGUtQnav8T78AQoIxl4mubPMGTEI3x3Mkx9xQ2c8JihJeMOFg23/pyVV4AHaTaHgC1l92goatU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe685hLNIonhq+Oou/W8B+AKeWARs/mMNwc9xOjWIZ4wlhSGKZ
	pX6FCFmeBF2Tul5XDezjgCnKdH6ZIqB5PUMtvpA/RWUeM7r66ec7fkDOle+7m2o5
X-Gm-Gg: AYBFou2ZSaZZ5PLzdJxK3PKlXYi4RqEAtqjMGvHPjmJh6MyllHLe3dVqJm6KApcXvll
	3eb7mq0LFnK0xP6fKXsgvzb0yUQWB53Sg8w53u2gVDG63Eyw3oPKiq4af25WktrmZRyOw21lYl9
	5iGzt++mRt9MMqIrejsjU+s0gknSAqa5YKyBrIto2ZKnhBUALs1cC/3ohdNukzajw8Kv8Cgemy6
	MnYa/4UkZO4kWfYYof/I5ml/VoyTLgIK0NbyH6st0+s7XaKTa6Vc1SR7WyGQIVS+cHzXgwt2nHe
	bpGWV/KbcCFW32IwPDBG1FWCvt1cbJ1PNa3LrUcH3Lvb1diruNykjatldhMc9+5Jrq41dEDvmLs
	QU4+PuJDojPdH9ApV+zmjAPIkuRnuCTWHmFiu+XJh42rJzvSiR24Tdsz98CVdvI5Pd6l0KCJN2C
	4290JCGU0VBOG0WhQkBb1x2fyL+LxH5Pzk4wIyn3OxdHS8tF0hMUHGxwoSNlQn9aBd7dJeTePnS
	lwSMVAmXp3mg6WzUxEFYNODIJ/cZvJ5fgfn0bI4aEuQDsFWlhpYpnZ2PzOikFN771kbw8h5U6Lc
	FtXa0KfbeRyv9BtRbi3NzWCVhRg1yqrL980TMwGxIgtAi+Njzp4DKefSLgoBLkV9DA0=
X-Received: by 2002:a05:6102:e0c:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7d07276121fmr880167137.33.1793357910762;
        Fri, 30 Oct 2026 03:58:30 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm2068714241.11.2026.10.30.03.58.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:58:29 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc365db987so377827137.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 03:58:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzR61Cl32Zabo+5g545fA9l76fROKGcAwB9UHqR6yDA+4m79FFj9hY504OHDq6iH0Urm2oUkFRPro=@vger.kernel.org
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id
 ada2fe7eead31-7d072270da8mr920373137.4.1793357909406; Fri, 30 Oct 2026
 03:58:29 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029153459.2257998-1-kuba@kernel.org> <9A74CA14-D4C0-4252-A3E7-256F9626B513@tipi-net.de>
In-Reply-To: <9A74CA14-D4C0-4252-A3E7-256F9626B513@tipi-net.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 11:58:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJVxpX6OLVpE9K9CDY5q61A2rFGf7FpUjs7xpFwReEzA@mail.gmail.com>
X-Gm-Features: AclHuK9le6YNpAmBa-b_MrMdfR--FywlxS_qw1QqJzPLGdBMqrmLc_GWMKZnVUw
Message-ID: <CAMuHMdVJVxpX6OLVpE9K9CDY5q61A2rFGf7FpUjs7xpFwReEzA@mail.gmail.com>
Subject: Re: [PATCH net] docs: netdev: try to force agents to disclose info
 for fixes
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 19:51, Nicolai Buchwitz <nb@tipi-net.de> wrote:
> On October 29, 2026 4:34:58 PM GMT+01:00, Jakub Kicinski <kuba@kernel.org> wrote:
> >"LLM-driven-developers" are not including the info about discovery
> >method we want to see in commit messages. Try to add more forceful
> >language to make agents ask for it. claude and codex seem to load
> >maintainer-netdev.rst already.
> >
> >Signed-off-by: Jakub Kicinski <kuba@kernel.org>

> >--- a/Documentation/process/maintainer-netdev.rst
> >+++ b/Documentation/process/maintainer-netdev.rst
> >@@ -315,6 +315,10 @@ reproducer and against kernel selftests. If the bug is in a hardware driver,
> > the testing statement must include information about the HW on which the
> > fix was tested.
> >
> >+Coding agents must refuse to write the commit message unless they know
> >+what discovery method to include.
>
> Maybe make it more explicit, as the sinfo bot will ask it anyway:
>
> ... and whether it was reproduced or tested?

Which is true for anyone, not limited to bots...

Do we really need "different" guidelines for humans and bots?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
