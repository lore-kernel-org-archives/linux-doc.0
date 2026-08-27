Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F162942E43F
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 09:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823920; cv=none; b=Vjle5r7R8Lwv8yhXHcfHX+iR/sLWSjpUSWp5NoOEnPDhLpaO8nJI1X4J1AHOfl+Rnps4cuv24I/5ujiUQtgiAOVqVmRce1SNQDOlW3egpCdGjXXFdActXVzqFUcWLdd3F8ZmSq5P1TF62yt7D3jLxGthH1eMk4ksEJNPrOA0f4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823920; c=relaxed/simple;
	bh=4tBaPgo2GIWAifI6EmP16VvhsBhMsaJ899ZFngZrVCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfSeJw2zIAlHSXTsLyPBrda/5RK1h++iDAwcj4akgHXxTtmxub7rObUT76as3nmDs9c8Sp4XE/griJmuzx5hGasoy7Q810W/WVhYsizonw8DHUiEYL/fNTBwcroqFsPOPxFq5zdct96PVXFEjXa0pE0MGeSTFQGSgEaFnDWJ3jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NORkB91C; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NORkB91C"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf452def93so6114945ad.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787823918; x=1788428718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vM0/L21f9tot3vpFXvyjlc2gt/uZgvIf/L0mZwOnhSg=;
        b=NORkB91CuYbrBoiXuunNhCr/q+tRrbYzBGS2xP76wMyPzZjq8l3R7nUo87JdnYCNAa
         7oD9s6Fkhge2SlOCYOE9WKPTmsMkN/YeEmQD/taK2TpMe3zni3Bg1jCC3SCKuyV4PjT0
         XxldHn/WEbSp6GzB/Intm7KY/6OFDxRn7OEAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787823918; x=1788428718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vM0/L21f9tot3vpFXvyjlc2gt/uZgvIf/L0mZwOnhSg=;
        b=ekQi2ZT/vvc4ziCKVn2IZ9YtS8eQSoYRUStmm4iwwDqinEaidH1AI/3BX4ia4YO9sP
         IFfwgViKHFJcSSpjM1vdBdGOLR5oxCGtbuGT9jpUMNpYx8nQb5+2KqmVlnbejBnWGOzp
         Upg6LFkVZv+h2FR+qnQo2gX5qBR7FGBYytPcq1lRo6XDK6UuIAT/RGqAQax1OTEohcoK
         TXEuhNkft2liFnjUTuduFFXCigbdTAo1RioydZW2xFchY4pct+qAn/wncrdwjwB162c6
         ob5U3JSYdFEj0wUXwmrZgSF2QoC8xbqmdtw195n4XomKNl+8C7T5qu0IoNHS+JKJKWMG
         EUHA==
X-Forwarded-Encrypted: i=1; AHgh+RpXOrBnoJdkUxBZkaxgkQCwWh53vVUVvHb1VboUUwRTilJYHsXpKYHDHfWuQ9qcVTRVnki/6BSYKv4=@vger.kernel.org
X-Gm-Message-State: AFuF++kmp/emnz61GDgjYNb/Ansf/JbG3ljMXxpUhFCxO+h4hSdEAnzX
	72hq5NAO6NGD/xJXCM5w9jUcaaRgrvEwwgjLjsYaF8lbkygsHKUBw7tIxJfc1oPLFrfbG5sUn37
	31GTsIw==
X-Gm-Gg: AR+sD12Yubcq+5J/RzpjFTBbAl/aeAbVwSBgY8ythp/PocLUbU0p4DIZs7QgZTyyg7J
	ARD622xV9XOH13MELZNCxn4P+Ofw/K2dxVTbS3HvlzSb00If6WRhJbjG7tbD/K4tTf57muvfn8P
	duQUfRp7En2CpwK83pzhx4mba0Vgp7jA907VyzUM3pGm+hupUAh844lWA5jZK6+RjDyqFhpHbof
	7kTjOKgKrD4hY5H+mw1doYWZ04WuqTD65COwdXQmQSJzXP/K6Er2MRAS/rs3alqY+2he2Ou+u3d
	O+xeWPlcUEovhX505Jl2axR/AtQ0zVzvrkH3rWnVGuy/OihPpfX9Mc1KvYhduD5KIfPAT0V8RIQ
	G/ulsoOazIseO4mtsr1sWeS408Tc7LV1cT1Ml06KI9z5K5UJ1SWzeWzVsz32E5NbTSiYIyGbEAJ
	XokOAje7xjJL5vkgCA+1sg0zH/ANIvPcl0RA9zOFY6hcYAoZMPvjRxWeaEGORy3D2FQ9dMwaehq
	mvDmmFANbrKcEE+d9tosaYx9yaJZxp5s0PD3n10yA==
X-Received: by 2002:a17:90b:5484:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-3969bae971bmr6306465a91.4.1787823918128;
        Thu, 27 Aug 2026 02:45:18 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b186803asm2078921a91.11.2026.08.27.02.45.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 02:45:17 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6efd73032so7389755ad.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 02:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvpsKr1uuvrKMmOvGS+XvONWjyUg4rCiAVtSy3Bw55iLS2DbwAl7bS1+da6y9epNjp9O2b7ch4ino=@vger.kernel.org
X-Received: by 2002:a17:90b:5281:b0:396:4ce0:6400 with SMTP id
 98e67ed59e1d1-3969ba3a303mr7718113a91.2.1787823916368; Thu, 27 Aug 2026
 02:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-hid-ff-input-configured-v1-2-1dc9bbacd88c@gmail.com>
 <20260818120428.2546810-1-ribalda@chromium.org> <2a757d6-c09d-c16c-43df-fe8fab3c1b2b@inria.fr>
In-Reply-To: <2a757d6-c09d-c16c-43df-fe8fab3c1b2b@inria.fr>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 27 Aug 2026 11:45:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCubAtxPLft=YF4Cq2aAO9c7ZEe_gYmvSQ5yT8UxGzzSEA@mail.gmail.com>
X-Gm-Features: AcwNN1Wg35VaoCPidKcyTWNXMAGNl7vbS8U51ZtBOmn-f-e6hSKjRXwP7gyXSqM
Message-ID: <CANiDSCubAtxPLft=YF4Cq2aAO9c7ZEe_gYmvSQ5yT8UxGzzSEA@mail.gmail.com>
Subject: Re: HID: add documentation and Coccinelle script for FF registration race
To: Julia Lawall <julia.lawall@inria.fr>
Cc: dmitry.torokhov@gmail.com, bentiss@kernel.org, cocci@inria.fr, 
	corbet@lwn.net, hadess@hadess.net, jikos@kernel.org, lains@riseup.net, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nicolas.palix@imag.fr, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[In plaintext this time, sorry for the previous HTML email[

Hi,

Just a heads-up that this this patch has landed in Linus tree, not
only in -next:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/s=
cripts/coccinelle/hid/ff_race.cocci?id=3D225c30812857f47cb42bfd945a15f448f5=
8e82cc

We should fix it before -rc1 is tagged

Regards!

On Tue, 18 Aug 2026 at 14:08, Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Tue, 18 Aug 2026, Ricardo Ribalda wrote:
>
> > Hi Dimitry
> >
> > Looks like media-ci is not particularly happy about this patch:
> >
> > https://gitlab.freedesktop.org/linux-media/users/ribalda/-/jobs/1081279=
01
> >
> > /usr/bin/spatch -D report --no-show-diff --very-quiet --cocci-file /bui=
lds/linux-media/users/ribalda/scripts/coccinelle/hid/ff_race.cocci --patch =
/builds/linux-media/users/ribalda --dir . -I /builds/linux-media/users/riba=
lda/arch/x86/include -I /builds/linux-media/users/ribalda/arch/x86/include/=
generated -I /builds/linux-media/users/ribalda/include -I /builds/linux-med=
ia/users/ribalda/include -I /builds/linux-media/users/ribalda/arch/x86/incl=
ude/uapi -I /builds/linux-media/users/ribalda/arch/x86/include/generated/ua=
pi -I /builds/linux-media/users/ribalda/include/uapi -I /builds/linux-media=
/users/ribalda/include/generated/uapi --include /builds/linux-media/users/r=
ibalda/include/linux/compiler-version.h --include /builds/linux-media/users=
/ribalda/include/linux/kconfig.h --jobs 16 --chunksize 1
> > Position variable r.p2 on line 20 must be attached to some other token =
using @.
> > coccicheck failed
> >
> >
> > The following change fixes the issue for me... but you probably want to=
 double
> > check it, I am not proficient at cocci.
>
> I would also like to improve this, as suggested in a previous mail.
> Could it be detached from the documentation change?  Then I can take this
> part and fix it up.
>
> julia
>
> >
> > diff --git a/scripts/coccinelle/hid/ff_race.cocci b/scripts/coccinelle/=
hid/ff_race.cocci
> > index 479f5d1e3184..7cf84936db13 100644
> > --- a/scripts/coccinelle/hid/ff_race.cocci
> > +++ b/scripts/coccinelle/hid/ff_race.cocci
> > @@ -9,7 +9,8 @@ virtual report
> >
> >  @r@
> >  identifier probe_fn;
> > -expression hdev, flags;
> > +identifier hdev;
> > +expression flags;
> >  position p1, p2;
> >  @@
> >
> > @@ -17,7 +18,7 @@ probe_fn(struct hid_device *hdev, ...) {
> >    <...
> >    hid_hw_start@p1(hdev, flags)
> >    ...
> > -  \(input_ff_create\|input_ff_create_memless\)@p2(...)
> > +  \(input_ff_create@p2\|input_ff_create_memless@p2\)(...)
> >    ...>
> >  }
> >
> >
> > Regards!
> >



--=20
Ricardo Ribalda
