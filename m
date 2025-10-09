Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9AC2D23A8
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999420; cv=none; b=tM8xLxFgW1O9Ndf5P8D4FrbvrKJR5ztm3kMOaV03Rzmt8pUYRrUYvdAK6LXh9JcYkS+8fzHFLHb4qfVo5JxU4d6i6H3xNE6wlQKoHM7MK53sACsd1WwLfNPOWMr/OW3yv3+kRgMUiiqHCvNI91nia4FTUaEZ+ABAN44LrDmin1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999420; c=relaxed/simple;
	bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLTaoTkW4snS3CaUcizGXNuq5eLstR+bMUlvQgi39ue4uckhM1Nj6XuH1HUo/QMcbjWQmiQKVgXnI/nsnTpoaaERCsDLyaHoGE1JUlcm23x++v3edYzEyxg9tolwaVVSopebQkp2tQTM8IkFqbH89XMrX7JkUxOctaFKx9LhWoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sd1CQWr6; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sd1CQWr6"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-77fac63ba26so7195597b3.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 01:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999416; x=1760604216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
        b=Sd1CQWr65JLYzY9EVKrEmyokZCi5vMbs6EjxpG+7QH6YGT3tDWbcej0s4cZgoeqQuS
         JarC6ZTWUL+kjcHPGBPAUN8Ppb1QBAPtlSxQfjpNRglhJxMMypRIPnB6rYYKLQvZjKiN
         y72xO5wzZc7AAEZk+IBKqraBb7+6wC4+Imv7nbjEtku9PO6PAKcYEb1vRHgafdvgR9U2
         dCS1DB4VwniCeBOnc8XLvNltoejI4ecSgvo1PpGG1tSl6PrUxnfallIONRoeLTNOEzbX
         FvDKAaN4VsNHkaBPKCCqR4S+rBMFmJJlJYY4H+OBfaZXGyq7o1ppfnH/vgJ3jgRm0T4d
         tz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999416; x=1760604216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
        b=wOsKrIuElWosYigchiVqoe2Z4kkMbG7wRQkEN0ELLp8vlmyApVMkn/4THVPzFwyPK6
         f0MpJ4Z7sb9SqqeIrTD65rW4+QqBNAXTNF7+4jHCl6N0qbZncuekU6XuJG4zi4hkOZ7e
         pXpbEKU1MLHDiy7rW/9MYj1EIn2wI4Wi3h2gI0q8L6bz0Fq1nz4JHXgwOY5EnZDqNwP/
         43JnZDl9kn5SlavK5ptJx6ZVHE8gXR6QwL+Crt1d7Fi7M141jQOpo9lsnQBVqhs5ctV5
         1vgfEwFzIlK6lCKprBniF+0pXzjcJvY3i0MDXm61TgnJoSlBpde12PiDeXUN3xxuNbBH
         FTRA==
X-Forwarded-Encrypted: i=1; AJvYcCV9RGA8kkbbJL9WZvdFQjJ3B/cw4jiA5/erS63P+U3srPjpJo1/F/hFR/YZ0U3Gt8TJtylEkjRsVgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGCgh6AcXDCvkDX37ZPdU7frBwzlVeXZL8jHceughs7q452R6
	wLz8DM9q5LrmsS8aAeVv0HzZkJWyCL3icUkyHMw06SpqOqA+WrWttNWK0F5q1E030rLt8LMWvF+
	vBz3TIEUQ90m5CnAjcuOj1K85jXBL04g=
X-Gm-Gg: ASbGncvnz9kF0ohU7hB2P8hsvfGgl1Riu06Sk1PcNXFkgUqPIcahDyCzxu3LZE/PBld
	nH1U3CRf/9JWwQnAEuwe2QdxhUcSGnrM40Yo4PxQyfiCQOu1fcQONp7lAYpkC7up/w/5QwqxoAW
	C3ygjzTHsUg3Mwx3iMYkCl+vJZWnlor/H/QQlhREtTIia73hgUqn07VYRbJOCpgqoZwT5i3wuYi
	dITsJ5W/9klCuCfidinZMwSyLaSA+9Gn2lL0/4Vag==
X-Google-Smtp-Source: AGHT+IHqqt7JHMFlL5DEMxX8/4fuWke6o7x715NV65SuEycRYAp5q8y3uA9SPr+Cccah/gPAgRpT2LfWBS7AmxUm0/4=
X-Received: by 2002:a05:690e:146:b0:635:4ece:20a9 with SMTP id
 956f58d0204a3-63ccb91d5e0mr4410660d50.46.1759999415603; Thu, 09 Oct 2025
 01:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
 <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com> <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
In-Reply-To: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 11:42:59 +0300
X-Gm-Features: AS18NWA7xuLtf9pobQHoPGHI9uL9SjsnEaZg-EuuD52zBO81KbUszIYBPPZ5wRY
Message-ID: <CAPnZJGAp-wG+9wDmmisfpxvFbRtXkG-RipAuZe=fi1BWy-3G-Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 5:29=E2=80=AFPM Nicolas Schichan <nschichan@freebox=
.fr> wrote:
> > Then in September 2026 I will fully remove initrd.
>
> Is there a way to find some kind of middle ground here ?

I still plan to fully remove initrd in September 2026.
Maintainers will decide whether they will merge my patchset.
You may try to convince them.

> I can send a patch for that but first I need to sort out my SMTP
> issues from the other day.

If you still have mail issues, consider applying for @linux.dev email,
they are free for Linux devs ( https://linux.dev/ ).

Also, I just tried to test whether your use case is still supported in
mainline (i. e. uncompressed initrd with root=3D/dev/ram0).
It turned out that on modern kernels you need to enable
recently introduced CONFIG_BLK_DEV_WRITE_MOUNTED to
make this work.
So, make sure to enable this when upgrading kernel.

--=20
Askar Safin
