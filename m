Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC1C286415
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773161; cv=none; b=BjOz9PXucjZvprSclnL6k5IjRThUhHB8zsQH2ogd3uGtvJ42hcCpi8x5FTpdWCyF30xnbptejf+JOrLp/196aByMNT58HbemiYsxZohdkZz89wm0Kjxg3nD1uNGHE8wgqz92DXva5UFW8ZwN3WDkpZxmoUCJWwswt/x5/jQBGv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773161; c=relaxed/simple;
	bh=D2pg4QST6SQsj9Y0AlZ3xwmYOqacTuU/qi+aAUKUt00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyKlzsHsIM46nBMACFYxa6vfBpKb+oo6TZwAQ4xGNz8SKvTAUSNsqDqLHdcANNYqgOKdIOw4IhOrBn+H0TJVmlUgzYQ1guGxEJYNObdDlmLo82gbXzvNDSoYtc0QbGfShvFdRVvOEPILSmDbOQFTJXx15H9m+HqAfDWiXRGyJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-42f24cae679so272114fac.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 05:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773159; x=1777377959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ji5jUeRQ9s6IdrcvkqpKzzaDEFKSxwSRUCTUPQc2w4=;
        b=rQKSHnMedByhtEb+5NNHv0rDnWXUqj+0L+F466lgWHaOrVHtGz9/VTBlnDP55t2pSq
         Q7YF7QZHMyQtLG+wCGyiO38hklrcDoB7JWH6ym2yVZU85GOO//gJGKOQ5brQNjpJrZ93
         j0GWkEbectQQidrUm3Axl4lmQBFn0LqV0gPkj4d9taIRRQpTrzqNCynQABtbJwZw8PXj
         VowuhkpuKFStybczvGExwq/grVjHB8WqzIoIkUu2seieipIDWC9piVRh9QIZ52e5RezJ
         7KdE+OaBGWHs5MTU4EsJ9gfs040//V8xQ23ZdIXlnLASt859WedpAhZgJH95YEhrcjhr
         Ougg==
X-Forwarded-Encrypted: i=1; AFNElJ8FcrdGSaQ7f1bUXM517YbKzetlAK0qaFl7c8hWVV2t1xi1TtBMmbrW/HoDI79uvgQ0vFVdOlEchlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ioLhkvIZgErTTczsG2Piw/GeN7Q67m3Al15TXdcyyTEqsl8B
	tt8h7YI40XDvAMyUOvIJYuPi0u8yfUs7/RFFMwWCvS2imxdZmgfYXcAfZP4twBwwpKA=
X-Gm-Gg: AeBDievMhHFn1answ+p1/EbDqejoxU8bF2bqLBn+CMwDS40gwj0kSf4AOkhaN01C30P
	DClzaJ9lLqnmvSexHyrxzJmJy8oiLBGrPpWU3alC98d6JCU0ko9cU8aGqYUu7roVG77f05j2Gl8
	Cv/vVix+zfFlFnkMafvlQbtbWIGibUwBGpdMXkeNlpW6S/1U3N18o7ETf3C3kJIiUJa7/eynBPR
	4LfA6j0UbtukeLekXe+6T1v/xsUYeZzuPAG2rs6ohU6x4o77K3DcYV9Z0qfRx5D9sZzEaj6YI8O
	S0njmnH5gkGSRAs9rxvLYAUPUi7dEgEQyKUvdFg5J+x755ZDPEf5Yg6eYwj5KlkNp2b4xkCBLPM
	biaqmCgPs0R122lryFMPBRHXVHthvTv/7c+QvSAuls4Q007HiKNYJyxIGatez6mInU9N512w4iq
	Xn0chaJtQuAOsq5c02CBVR128SeBh8lk2HW9HJ9gU1jkINqovQufeaseKN5573ve3dWxh1pYjmm
	QxV/dlQnzouHg==
X-Received: by 2002:a05:6870:be98:b0:3e7:e420:6229 with SMTP id 586e51a60fabf-42abf26a3c8mr11013958fac.6.1776773159462;
        Tue, 21 Apr 2026 05:05:59 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42bebc9cb33sm7192039fac.11.2026.04.21.05.05.59
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 05:05:59 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-479ef2b78f3so399742b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 05:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ec2b3uWTH3I16PywaWhJYojbZ9qFiWu7ORztiQczY/wao4I2e2ZYRNYJEZvc6/2HRRes8O4QUuQ0=@vger.kernel.org
X-Received: by 2002:a05:6102:f8b:b0:601:f386:9ed2 with SMTP id
 ada2fe7eead31-616f4d67f72mr7641295137.7.1776772665998; Tue, 21 Apr 2026
 04:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421021943.1295109-1-kuba@kernel.org> <c7506c225ce22a71c03abc2673823cf84bbb5b0d.camel@infradead.org>
 <aedkZ5bizasuBPI8@gondor.apana.org.au>
In-Reply-To: <aedkZ5bizasuBPI8@gondor.apana.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Apr 2026 13:57:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU96F_42faeqNzDwaXks7mFrLrkPSJB_QTwxEn9HmVWpQ@mail.gmail.com>
X-Gm-Features: AQROBzAVi0Fh-UpifM1LaPGNEDH0ax6I6xOmcEB0yUP_KKo8UOyxGmDNb2nIMYw
Message-ID: <CAMuHMdU96F_42faeqNzDwaXks7mFrLrkPSJB_QTwxEn9HmVWpQ@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove unused ATM protocols and legacy
 ATM device drivers
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, 3chas3@gmail.com, razor@blackwall.org, idosch@nvidia.com, 
	jani.nikula@intel.com, mchehab+huawei@kernel.org, tytso@mit.edu, 
	ebiggers@kernel.org, johannes.berg@intel.com, jonathan.cameron@huawei.com, 
	kees@kernel.org, kuniyu@google.com, fourier.thomas@gmail.com, 
	andriy.shevchenko@intel.com, rdunlap@infradead.org, akpm@linux-foundation.org, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, bridge@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Herbert,

On Tue, 21 Apr 2026 at 13:51, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Tue, Apr 21, 2026 at 10:26:18AM +0100, David Woodhouse wrote:
> > I suspect they don't have a huge amount of interest in the Solos any
> > more, or the Geode-based SBC they sold with two of them on-board. But
> > OpenWrt does still support them, and I even have one here (although no
> > ADSL line to test it with). They were briefly popular as fully Linux-
> > supported ADSL routers.
>
> ADSL is history, it only ever made sense in rich countries where
> physical copper cables were pre-installed in homes.  While rich
> countries have moved to fibre, the rest of the world won't use
> ADSL either because there is no copper cable to begin with.  So
> it's actually cheaper to just lay a fibre cable for a new install.

I am afraid the move to fibre hasn't been completed yet.
ADSL (VDSL2?) is still being used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
