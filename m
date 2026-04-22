Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34962D0C94
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 12:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860129; cv=none; b=LtVnlc8tE+VKHRrQ+0HsF9trlEOq3HeCLQTUbpnLC2/p7/wrwl8jh4ncyGuXdFGfXalLnxowky//xxMp7ygrB+IN5+vkh+fFce4WwL5BPTbvBvIlEAcom0Asxpa1sM5QLOWKPIqf28naANmjgx9F0xCGnx3qvwSsHBYUYMCt430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860129; c=relaxed/simple;
	bh=gf3wVlzjq7SYKdOQz8SyX1AYCuck3FAIluy3DOqkhqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYj/UVqe6ge45iall4IyBOaTV/mQvtXrWtQaHQbhWV/C5qb3nwtKMhF/ShzJAUC5dP6quchU2cpE0SN6e5zB0hB57wnpeMIUPPVIb5YJsLjswEGJM/UNflLREjynZZ3K2JB0My3UThEbIHdVKIevtkpMZsQRBCr4FzWYGGvo/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso3122328241.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 05:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860127; x=1777464927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63x6wyxF1/dhHmzv0KfSTBD7Sy2mmqaSOPLd1fIjCCI=;
        b=hctX7p12taxpmIGPIAdSfm7qNe3MD6Nyr1Z+JvOFN5YaqXwtEURcSFjM+guJ5aazRC
         gOrnyVKuoI/fVDn8i6+Wa1zZ7YQA6qXmaUEGQQ4EGZ/U9smzpJsehy6gffBoq0mqfryj
         iEi/61Tw/6veyo9hbF/0iOX6jqxFxd9FkTI+aUW7NDDp2wfcxi6ZEI5g5n1Xbal107MZ
         YX1Ee3nNe8976onp4lmTtu83EhSL2T7rMrs4xYbm7qD/urOhkNpx+rJbRN1myGojUknX
         gjBiiA6hNdyo//fevU2JH9jL1BXF73oKFUxRb0bYHl+4IqVcRZBp+IKm4hYNINxKHGfR
         y6fw==
X-Forwarded-Encrypted: i=1; AFNElJ8A1Xxs1Qr6Uoh1oLXrGTMs0ZbmMgYz00aBDnqJeehuB3Vw2OsznNyyj868Cd9XiyZwelF13n+laa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPUFPQi0R8Na320uenXbnTm2j7G5oeZRCMc5KSiDtCpUr4hWhv
	9TDNldJX37PYpw7W4AqZrpUeJK4u5N2mpwdwtVlSz+sUUfWJriImsojrLy031jlQoN4=
X-Gm-Gg: AeBDiesP6haEAdv+vkDE665NQoS1Y7YFJ/lAzSkweCI/NoWR1JUGy/DVdLFnuWZbQeT
	bvuEf+XAt3HZ5oOPuRnhB8k5h5MEwMDJJzudtJq/kq36P1xmOPuMvQZxvpzsYVsdxqWDf9WAKxx
	/bQmhXVqXwDaKr//Gr00vfKKottkwvWs/swzWufBE32pQGMJk+NfX2nIq7d0ebyzjpzOys5b7AY
	kt0W9gPytfyY6xvt/67rWXLlUGxpL8EPNmiuwfBj+Bq2oDrqX5TSIty3unyMQPyT1vZpyYeN1e8
	6zWqu0ts/NzEXi413bC3RMcH+2zm74zzN8euNUaMBW634GN64dhmtz8M5xtRMKkbIQT0XEr2S8v
	p3WLqo2tB/Hy8WM1nAQTLGNLxHsHwv9Pzm7AVFtg9h+EMj7jkrVgEkb29mDuTF26ceEre7XB3gr
	xQb701ck139MtJmax+H21WKA0H0eml66AxITpS3e7i/cE1hlpLczV7rFS91eZgiAE3sSEJTzh69
	Qs=
X-Received: by 2002:a05:6122:225:b0:56d:8bdb:fa50 with SMTP id 71dfb90a1353d-56fa5a4281dmr11893910e0c.13.1776860126001;
        Wed, 22 Apr 2026 05:15:26 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa91ea606sm9559329e0c.5.2026.04.22.05.15.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:15:25 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso5302542e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 05:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8IktcB09AotYUS4hBNwQdJ13vItiVfVrLezzxF+hbfDYut5IHdRqWP4CldfJs1TYs1r0+jzGh+8/I=@vger.kernel.org
X-Received: by 2002:a05:6122:311a:b0:567:433b:e903 with SMTP id
 71dfb90a1353d-56fa589b89emr11243685e0c.6.1776860119533; Wed, 22 Apr 2026
 05:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421175516.224960-2-manuelebner@mailbox.org>
 <20260421180902.225560-2-manuelebner@mailbox.org> <CAMuHMdV70GhNsxPiuhY92seZRMkr6jk9eFCke7shc08GYerLpg@mail.gmail.com>
 <a5522bdaf37c7f1d2fdf03e1755061a4d803efb2.camel@mailbox.org>
In-Reply-To: <a5522bdaf37c7f1d2fdf03e1755061a4d803efb2.camel@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:15:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGWLBtsUfw+oQsbAicujWXM5SiPKic07cv6ifb0H_8CQ@mail.gmail.com>
X-Gm-Features: AQROBzATU1beQWh18ULDJqfZI0lRHd-wjfpfSEAbl2L0bxRcMxlfBKYtU6aTvEY
Message-ID: <CAMuHMdVGWLBtsUfw+oQsbAicujWXM5SiPKic07cv6ifb0H_8CQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

On Wed, 22 Apr 2026 at 14:10, Manuel Ebner <manuelebner@mailbox.org> wrote:
> On Wed, 2026-04-22 at 09:14 +0200, Geert Uytterhoeven wrote:
> > On Tue, 21 Apr 2026 at 20:09, Manuel Ebner <manuelebner@mailbox.org> wrote:
> > > put the optional argument (gfp) in square brackets
> > >
> > > eg. ptr = kmalloc_obj(*ptr, gfp);
> > >  -> ptr = kmalloc_obj(*ptr, [gfp]);
> >
> > Shouldn't that be "[, gfp]", e.g.
> >
> >     kmalloc_obj(*ptr [, gfp]);
>
> I think technically it should be
>
>     kmalloc_obj(*ptr[, gfp]);
>
> but that's difficult to grasp, so i went for my notation. Yours
> is a good tradeoff. I'll think about it and choose the right one.

A third option is

    kmalloc_obj(*ptr [, gfp] );

or even:

    kmalloc_obj(*ptr [ , gfp ] );

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
