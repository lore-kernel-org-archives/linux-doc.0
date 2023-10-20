Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DCDD2E0
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EFF9F;
	Fri, 20 Oct 2023 00:11:00 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d9a58f5f33dso510106276.1;
        Fri, 20 Oct 2023 00:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697785859; x=1698390659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yQ1pnnABlqCWlk9yqltWeozn3MFhqYPzgGkh5zARTI=;
        b=l3uO0b7ecOEleK8ifrBAS9LkiNGp9CF3rKzrQWVTny5i6D7fxsaV3EDu5Ze10qeapP
         An22TwHBaSx3RLq8bGI4UggqLefZQIq8jWLpQOiPHn3GoYwTI14YQcqyAfFHowBRy1De
         h7qCZSslEtDD6pVg7fW2epMpLO5/RBtPEeUdjC7+KNBwjZG9LMKiLGpo1QiYdLXhG5mp
         ceXnyiLX0lwB3TgnqDRbWYuxRP0I977aDhlqLmJAQIMChdEQNaVkAyjHDM3AnOEi0Vam
         eTysLZ+0D8e7X0AFIwOvXUgc+Hg7ZHlceLVny0A4hqCGwPjHEwrSD51LqUfZXvXredFS
         5+xA==
X-Gm-Message-State: AOJu0YwfAKRxA1mj+Fbd/DL0FlUBGd7XmAROQ7ki+Xax3kVhCZDWPEZK
	EBdg4RLnLXvIt/Fdjhjp8hni1FHgk3mJOg==
X-Google-Smtp-Source: AGHT+IG+ykv5c9XPzKfvfgHoWwwCJO39huXHzah061NFN1mZEIeHVlEbqAauDGFM0joVFejcUpuYEQ==
X-Received: by 2002:a25:dc45:0:b0:d9a:52dc:15d4 with SMTP id y66-20020a25dc45000000b00d9a52dc15d4mr1030847ybe.52.1697785859384;
        Fri, 20 Oct 2023 00:10:59 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 9-20020a250d09000000b00d9c7bf8f32fsm375140ybn.42.2023.10.20.00.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 00:10:58 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7af52ee31so4916167b3.2;
        Fri, 20 Oct 2023 00:10:58 -0700 (PDT)
X-Received: by 2002:a05:690c:d96:b0:5a7:aa83:9fb with SMTP id
 da22-20020a05690c0d9600b005a7aa8309fbmr1374227ywb.0.1697785858265; Fri, 20
 Oct 2023 00:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1697708489.git.geert+renesas@glider.be> <c40972dfec3dcc6719808d5df388857360262878.1697708489.git.geert+renesas@glider.be>
 <d0c6044f-11e0-4f00-b7e6-eaf1e72f17a5@infradead.org> <f432f363a97bc3e179db2c33c4b2f74027f8016b.camel@physik.fu-berlin.de>
In-Reply-To: <f432f363a97bc3e179db2c33c4b2f74027f8016b.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Oct 2023 09:10:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnJ-BFxPZ-zVkP=euzMPAFnz1h6CRdNvPbuHwuspq1tQ@mail.gmail.com>
Message-ID: <CAMuHMdWnJ-BFxPZ-zVkP=euzMPAFnz1h6CRdNvPbuHwuspq1tQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] sh: bios: Revive earlyprintk support
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Paul Gortmaker <paul.gortmaker@windriver.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-doc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

On Thu, Oct 19, 2023 at 5:51=E2=80=AFPM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Thu, 2023-10-19 at 08:48 -0700, Randy Dunlap wrote:
> > > +config EARLY_PRINTK
> > > +   bool "Early printk"
> > > +   depends on SH_STANDARD_BIOS
> > > +   help
> > > +     Say Y here to redirect kernel printk messages to the serial por=
t
> > > +     used by the SH-IPL bootloader, starting very early in the boot
> > > +     process and ending when the kernel's serial console is initiali=
sed.
> > > +     This option is only useful while porting the kernel to a new ma=
chine,
> >
> > Can we expect to see new machine ports using arch/sh/ ?
>
> There is J-Core which is new open source hardware based on arch/sh.

Do J-Core systems use the LinuxSH standard BIOS?
Still, it can be useful while converting existing SH systems to DT.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
