Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B356273D6C
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 23:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765063587; cv=none; b=IrZRv6N5Ye2ifgY/VWQkHqAIfXvzA6BKrpm5a3J/jkXC1Olf/aMj4nP+PmBbWp6nJPdvlluo2u3ZlgQY+Hh3rfn8VEoC4G3FchZiUMGof2J/HgGPVqYzsoFafu68qKYjfQca1FWU9MCrCFdlxiCP7xGyI83XfExyA90oDAnazE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765063587; c=relaxed/simple;
	bh=zRtgdIswkrGrLp9a2oUvFcB/hCi5Lut0fza9rHJRLPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pp4wzWTIeIoJJZSSpZbzlrCU62TMfeNNelBL0LbXNixdQ8kvdinDS0hopVNwb+dDoGGwCviUy+tkOE11RGrvzUYD2zRGz8VK8ku2k5H6z0Hl63Gc5NVcS+Kw4V0mSMHx9iTHo6UjKB+JpAZGW0s7jQR1MR3if3nsuDVNecUiQJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Y4bT47Hu; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Y4bT47Hu"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-647a44f6dcaso4494270a12.3
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 15:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1765063584; x=1765668384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjSYqrO/ZU/kTCH00tl+TVl2aStia3phw0aj3vT5jpw=;
        b=Y4bT47Hu3Npld6Q82BUhnCY1wypwpR3QNgws3E4HG2Qya3oFL5O6YlOFjsIyFLtQCB
         j6IkxaP9grsnlj+BKpP1Bt3g++nouq2u5dRTVyAn0I5WBskSsl7gLhIwlsMrub6F92+a
         ivPr2+lXkrkrhXMaBw7D0K4GBq55fcgkCmhHGTQ3UwjaDOF/4S2cVEANxVIOSij+Im58
         k4KWgC5r726kpF2cWt8xZjyCkHIVR0+sbPKcCy/RohisyfDmGqZpTf9zsa9ZjohZNcPE
         9Hy2l6ZqjqXDlYiPfZKVAwxvRPT0v7zAUX6OHs7644BMQv/GVowO1yAuRaF2p9pfXKn4
         MRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765063584; x=1765668384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjSYqrO/ZU/kTCH00tl+TVl2aStia3phw0aj3vT5jpw=;
        b=ROCApxShwHofc6/JeRrly8uzwjwwvlNUyIZfr+ea9SiP7y5LpG0OJp2ONYmArS7Hii
         TigLoxFZDlHmyGN4f9XhqVAoYM5eLjwgTJLpXNvhR2XLpDtNEGSTfHlVTZWtXwQUKKvE
         REPZjlZWsndqqMoYYpWj5DgYbLfe8v50g5kioOFGO71rTzwaXivI01on4fF7GsiAiiVl
         DhrZrUBwkEgXQEyClrAJH+vuIQyL1rixaglNDA7Ufm0Y8w9hEqYLcHkJBHNun0OqF9sp
         2n6s6AI7BfUJMsDwtdB+TvSFTzA9iKvyVdIJaur0f2V6aJYx9BVOWfbcUQdwhlY145u3
         nz0w==
X-Forwarded-Encrypted: i=1; AJvYcCVlNz/DlTLKu7dnMuBUYGsJfgc58+P5EvxZODv5PpboNFWy7rVt1vtZnfAuGbTwAwOTFjgVjXTKBQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcdnsXYe16SkX3M25Q9Ae33j5x8ocSWaL759cyJFx9Hx4P7uiC
	mWMPulDLGK1fofd0Ly3fu2SXuzXoKrfFQ7dZftS9WDKMmrK1G8dhFhSFZ8FtUqzHAvD3GWeojHG
	B24jFlKSLqxJDz/f4U9C4lPv73APY0VgmgUSvAaY2gQ==
X-Gm-Gg: ASbGncsGxzYZNtlOBGvSK0rzwsGsJATh3XCTI6exBz2AxAfxBH21UW1kh6h/Dh1Plf6
	VNy/dZP04UsIipuqeq4Sz2MePEz9+69wCIJ7rJm1OKk3fyN4sV1Jq5VvxjT4cXZLykLho+5E9ai
	Ym80Ma+kXrvP1Vabs61nbbqnUiBsghKEp9Od67p54BNCQctlTnZMBX21u/l9stYFiGG6gkD05MJ
	ZrpqgPJElblx2H9Yk6uMaI8VXs+Nf+5jPfzQYisGgJYYEzsT4JKg5uBr2h1cH15s5lFyZolOgif
	yngNR3kFzj90Xyf9SMbN01My9E3KqKRn5ROk
X-Google-Smtp-Source: AGHT+IGX7koRklI2V5meXpHgwhZqNxjSHaJXuOqmfHGG91J84vlxtlPu4p3wPvKe5FNP9Cbzy969YuFP0E70PblctpQ=
X-Received: by 2002:a05:6402:90c:b0:641:54ce:1bf9 with SMTP id
 4fb4d7f45d1cf-6491a2d06d3mr2529931a12.14.1765063583383; Sat, 06 Dec 2025
 15:26:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com>
 <20251126111924.1533590ce355b92d5306a0ec@linux-foundation.org>
 <CA+CK2bCUBMgnepMzO21+SH6rY7bb2OgRqxkLkUr33UsrPoe_2A@mail.gmail.com>
 <CA+CK2bDyd9jkuD+aBEaSTqw_mAXyvV9b8pa-z6eDvEByQ4oTiw@mail.gmail.com> <20251206133934.bdbf1db342c52070ed1d5689@linux-foundation.org>
In-Reply-To: <20251206133934.bdbf1db342c52070ed1d5689@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 6 Dec 2025 16:25:48 -0700
X-Gm-Features: AQt7F2pN_ozktvqfqZxdvBSeOofJNtZrXiYLs1McTgEPlEN2pKxYNNndC4-KEeE
Message-ID: <CA+CK2bD=ZLGJ75=kx6PDSwmP_hdsVBOpxjJUz3HvHehfsb1+UA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] list: add primitives for private list manipulations
To: Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, nicolas.frattaroli@collabora.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	davidgow@google.com, pmladek@suse.com, tamird@gmail.com, raemoar63@gmail.com, 
	ebiggers@kernel.org, diego.daniel.professional@gmail.com, rppt@kernel.org, 
	pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 2:39=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Fri, 5 Dec 2025 16:52:32 -0800 Pasha Tatashin <pasha.tatashin@soleen.c=
om> wrote:
>
> > > > > Adoption: Updates the liveupdate subsystem to use the new generic=
 API,
> > > > > replacing its local luo_list_for_each_private implementation.
> > > >
> > > > Fair enough.  Let's push this into the next -rc cycle, OK?
> > >
> >
> > Hi Andrew,
> >
> > Could you please take this into nonmm-unstable branch, I want to send
> > a new version of LUO-FLB, and would like change it to use this API as
> > well.
>
> We're in the middle of the merge window and this is next-rc-cycle
> material.  mm-nonmm-unstable is included in linux-next and linux-next
> rules request that we not add new material to -next until the merge
> window has ended.
>
> So please resend this material after -rc1 is released, thanks.

I see, thank you for your clarification. I will resent after rc1.

Thanks,
Pasha
