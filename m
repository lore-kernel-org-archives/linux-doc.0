Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573997;
	b=NJrfH7812lEoHK+XSSnstopaOieUo41N2HG3TxkqaZVKXQNeGePH0cOtS78AGL6uxLv+
	 Hpfv3OAhB0FdgXXEffzUYPss3aho3S2D9fqqv6zPOTzXwdA0KhDdldTDG0H8ONDXFnKRv
	 /KOlKxW1x4jLtxTNz16xKTjuMgXsr088uDRE0oren0Dph5K5XdQc29rxnK/ydAxnoN2G6
	 jIm3ZPLc+p3HWQzXiQzLjTcDPj62lCucl264Pzjcs6ZvQfeve89kol1EJI54UdarQ7f2d
	 012PBXGTw8icZPuD2NJMHd0yOwTs3jCl39cOopK06q1AvmW5WTu0EnMHrkO23IuX6mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573997;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=TdukyCPcl9fUvggoegFEcLQWHoHKZ12f0CCAVKT3rYg=;
	b=pATlXbYBuMNPmcjnR+pnqpcWNBrImt4zD8Lge2ydhCkqdH/jrpFv3VGq7t3yz2Rj32+M
	 yfFabh8DMT9oA0vbvqeuiSwW9TANXZH6kJU3aMDjYRZKCsCmQFBV5BI6/AMkbLtQ0aYKJ
	 xyqZNkzPZelJITfSIuKzajdMIbTlEWkBw57Irv9wybWC3CwvI9TGD0gF+f85wHmbZFAM2
	 38qioFEG10mk3XhSsajVRWFi99fOp65w21RVgFwVybLc/z1fwc9Q/1bR/A9Zm4+71lFJI
	 twvbfGZvBeZb0CF5T563cRgliKLVKUvBKRatxVba2SMg9qUiBE+prl2/KTXQGBCwEtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B2B606A334
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B2B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eac9db5905so155782e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 02:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573995; x=1793178795;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TdukyCPcl9fUvggoegFEcLQWHoHKZ12f0CCAVKT3rYg=;
        b=Ay6MlnhQCMnFBdhrC1GhjvtoM/3RvbeRhhDQ4Y7rMT4OkygNV3gOf1aLhtHgnfrqrF
         Xh0VNGRLqEXw0t0dHPDvgCX1I0nh4EXZtrhqz/Q00OZlGrXd8FFRUFU4GwHQdYpsI5GQ
         IthdajwI7obLMhJ+fO1SWl50KgN+5wnyWKq72W4UfFRGUmVeJWKSGRbteWvMZ1lXGv2S
         EYQXHOoaJTyni60jP+bCO0CFIUOT+4qrC3jLxVGe4gVBq5vPnNuUN5R3KnqledeKNLfi
         aY0Vaz/fR453Lbiu0/gO4OVMDtiG7x9AluQ+OCUsxYV0XS0FO05KfJp5uyzTiLNCf9ex
         MA7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwV2c2LyLS6m2hN4Tmr8IrqMg+BjDmqG5M9rFYHtDCOw58WQ8HB76buAkkzU6+Di1pMXSFMok9EWW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/NiN7j8KaYDF8BQ+wyXIWsNag63NlffX0bD6YliaAcrCQN6V/
	OB2P3gUvjjrZqPEQR5nxRmGe5vTeq1Lrm3PfmWwuq209T33wPkXe1IfMlOtzbgMvvwI=
X-Gm-Gg: AYBFou2+3tN90MkXe32nKqOFv9IrW46cD6tsx4omPfW0ujrl4xt8pFZli4gqsLbXH+W
	rob3zCXkPoKZdicKSmEt6UQZqemanqiqGjGfFDYRuUbspbZK19to1zGZ5LXyzpD1qkeQHR2VPt+
	clP9OEED19ioczKSV9lqyx1eEBhLBu5EPhIMIcH4z7AUfj+3SM3M6I/SFd/obRID09LeAoW2HjJ
	vPMdvY8HrBLpqouopRPPH/o+5VkrHm7edIfEojkrJpFXMZSX/n13HPkfF5gjdVcEU4l8jA6iW9G
	Cu55UqRiFtlROh/iwIfVuj3LxhIyRuDvwGi0RlCET+QIfKwY6zcl0/9VHjGuhRnk8E2Eoe4cifk
	m83gUj2/TF+yxfT8c3K+RWOkje/FifvPx/0cmZc42CRZMppjwNZ2mToUn+1XeHsrM268W6vU0ZH
	f/8wv8eeH9yCIVGwm38WQrlEAcbeanrv2ReiLrG5g6b7f/B0KFbR3zyiKLBA6/LvIO+tOfBWktk
	G1BWA2alOvBMZ+umCCicLExjQERMiYFFerqc3eDMPuTAmyTHn6dgKjeilFLT5CzFx1+2uSP2aVr
	USc9duu1l8vK18wKar4EzQ==
X-Received: by 2002:a05:6122:21ac:b0:5ea:c330:7802 with SMTP id 71dfb90a1353d-5eaebc16547mr535578e0c.2.1792573995629;
        Wed, 21 Oct 2026 02:13:15 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae9787ca5sm2543810e0c.6.2026.10.21.02.13.13
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:13:13 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so268567e0c.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 02:13:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHr+2uOZ3M1g36CFJ4n/O5r1AB0q9VWQWf3G8CNijv7gdNw0az4z6RfsqfkK8TwHoWGVitJgNIT6E=@vger.kernel.org
X-Received: by 2002:a05:6102:c4b:b0:7cc:306:d3ab with SMTP id
 ada2fe7eead31-7cc92473061mr657933137.5.1792573993049; Wed, 21 Oct 2026
 02:13:13 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <0605a3c99b55124d1be71c9939f636e2@perches.com> <ate3lqnWlk9zLZC5@mit.edu>
In-Reply-To: <ate3lqnWlk9zLZC5@mit.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Oct 2026 11:13:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmmRWFJpE=A18w+Jg+9T46Aeomc9NeCCtZR-MzaJW+Dg@mail.gmail.com>
X-Gm-Features: AclHuK-q1FSczAVmbAF3hXa82KzgGcPPTlNy2rnoWV3tKHuYqGppXvTDvgYY5ZM
Message-ID: <CAMuHMdVmmRWFJpE=A18w+Jg+9T46Aeomc9NeCCtZR-MzaJW+Dg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: Theodore Tso <tytso@mit.edu>
Cc: Joe Perches <joe@perches.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 20:52, Theodore Tso <tytso@mit.edu> wrote:
> On Tue, Oct 20, 2026 at 08:53:04AM -0500, Joe Perches wrote:
> > > This issue came up during the 2026 Maintainer Summit and the consensus
> > > was that "always include linux-kernel for every patch" was never the
> > > intent.
> >
> > That's not actually true.
> >
> > Lkml was the default mailing list and other lists were specific to their
> > interests.
>
> Historical practice for decades before the change was made that plenty
> of patches only went to the subsystem list (e.g., linux-ext4,
> linux-scsi) and it was *never* intentional that LKML was supposed to
> be cc'ed for all patches.  That didn't match historical behavior, and
> as far as I know no one was asking for that change.  If someone
> managed to slip that into submitting-patches, that was either a
> mistake by the submitters or the people reviewing the change.

Historically, not all subsystem mailing lists were as well-archived
as lkml.  Nowadays, as long as a patch ends up on lore, it's fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
