Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223B2FE56C
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349601; cv=none; b=f8sWpRjkJpiOt/c5yDs0NcBSaS4IEYgAhQ8N1M08x4xS4X7a4wlxEHWdCxIGi4/gmMz4Qf1BA5GSu8iVV66ptl4wgvNpfXZmZ/DUudYTbGqMvZIh4Bet483GPWt6Wsub1zmVOPXk2taJYdR5Bs0qFGDc14xZ7LEO3lr5ZIEOsOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349601; c=relaxed/simple;
	bh=+zOuCBbttI2pym4Pdpz046IX8ZPwrX2sj4yc80Raf0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnNWvvWOjsBO7WcdZZkbhIiPrRyC/2CIDMCMnA7sUIvCqiioxTeM+uY3ZHD+PEWkr8Y4XAUt89VS7OWFvotz/tr2WBEFB1qxVJolxvx3Wtqgz0aGnU3rTN1yvgIiMMGvQf5krllxVHgSE/roJ+RgrJGdqiPJVZalBBOmqio4pwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYGb4s7P; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYGb4s7P"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-633c1b740c5so3939393d50.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 02:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760349599; x=1760954399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZsaCMPk0e7xOahYxc9B2HTwzlp/3SZdj7OzfRUl7Tc=;
        b=lYGb4s7PFPtlQAqGLwjY6C3BoptYCrvsiQTPmRJWe0jrmue4kzt875LXGc+nwMus5e
         gg/dRRivympKqj/Xbh/kqv4jfo3sNkaRAWWH4kZP7QO+EYk91Xl5ZvumS/kg92GHtPjk
         j1DbxG/Dgk3vmqFQjqZbS6cxMNqHU4DeIsE2rSdChE2dhflRSZVNKpBaEr6XVXJ3d+35
         Uw6w91MZJuEBrgw2xCsk0gcBTZMcncRHXUPfRkRDe21ahILoyvU3E/QbhqdS6KHwrvfA
         79Um23YLTNO6t/m7Vr/uQlJA0nZ6SxJWNCgTAeqdZEx/sH8Vu9rR490wZ3vArZnHDyqH
         MjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349599; x=1760954399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZsaCMPk0e7xOahYxc9B2HTwzlp/3SZdj7OzfRUl7Tc=;
        b=Y1523N6l9nusoKY6q87RqN4Tlnca1hrqfwT6nnbUvHYxDW6J8SV9/S/QkyvMPhcf4/
         fh6sA8lA51cGNh5RaGuzdxfpb86yDAc2w2otz2iK8xaW5jKvKck6zV8Lxkbv2S24XKTb
         jDFMxsrPijBHV1pUI6W1N48WHd4xI78jJV0WFzCcczfNor5pVPVWQPFfN5UCG4TiuP8k
         gTyJffx4I2It0DvtnG4Glzt47M9peVF8bo+YKK5uCjvL8TkJglfOLb7M480120g4hdD9
         s88UBNkXH9j/WbOswAhItef9RG5SauELhq+PHHgnLcpWPxLYvpeC4PVBZ0yrZnWl/ZjU
         LZMw==
X-Forwarded-Encrypted: i=1; AJvYcCXKYgeH6lniLxvBQcExq6F6JvaCJTXfLKmG5+x/7UvoummI07olnr/mLfxWWSzUw6TQ3CNMgmp74Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOSpJY6uLyK7P1XzP4fYjpjqBrA8EFVPPV3I1vo7I+AoE+F8fh
	MtcmcM516hhJceMoOOQllRAvkHqDkxbeP3REDC5qsVa7MOT8qAGBzoerL96+1uPyq7ocn7JaNUn
	Q4QM794V9nvCOUJis9UBVujsN+kiV7sY=
X-Gm-Gg: ASbGncvv0GlvlCS/mJFSEDDOJ1weIInPedTmCWoUVWOh4SohFjwvjH6h6Gaxnibq4Bc
	4a8BBJxgm49I+253Jb4LwOTiYNE+TGQiAQrd7de76cN+qzOwPUhxNoEIMcsa0LXmBWV7iLQZk9i
	F9cutqHdDtlegXdXpi6s5YnBY6XY8NfMACCTbEO8yGoeCchcHfl4zT4uXr6RrzIQ1SV5F/e+gem
	1R6ranK3UFZQhzd6QSfthiqBJUfmSy2UeTW
X-Google-Smtp-Source: AGHT+IEjiQMnhpQ/Kb5hfGFGrybCEQQLnH8Bm2H6/rcdu7ghvXP+Te8kpl6LHQn/PIgvNHwUMvVrGJdsfOorS0mdutU=
X-Received: by 2002:a53:ee07:0:b0:63c:daf9:bf21 with SMTP id
 956f58d0204a3-63cdaf9fa65mr11783686d50.24.1760349598638; Mon, 13 Oct 2025
 02:59:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010094047.3111495-1-safinaskar@gmail.com>
 <20251010094047.3111495-3-safinaskar@gmail.com> <CAHp75VezkZ7A1VOP8cBH8h0DKVumP66jjUbepMCP87wGOrh+MQ@mail.gmail.com>
In-Reply-To: <CAHp75VezkZ7A1VOP8cBH8h0DKVumP66jjUbepMCP87wGOrh+MQ@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Mon, 13 Oct 2025 12:59:21 +0300
X-Gm-Features: AS18NWA-897xF_-UIFWa7pg6NN4-821ID7y01MXNqW6009NHHhcR0gsdnks-4OY
Message-ID: <CAPnZJGBAc-kqZ-MAKRGrk1big=N_GZupxKgM_+TodqgteffLvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] initrd: remove deprecated code path (linuxrc)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Aleksa Sarai <cyphar@cyphar.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	Michal Simek <monstr@monstr.eu>, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dave Young <dyoung@redhat.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Nicolas Schichan <nschichan@freebox.fr>, David Disseldorp <ddiss@suse.de>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 6:05=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > -       noinitrd        [RAM] Tells the kernel not to load any configur=
ed
> > +       noinitrd        [Deprecated,RAM] Tells the kernel not to load a=
ny configured
> >                         initial RAM disk.
>
> How one is supposed to run this when just having a kernel is enough?
> At least (ex)colleague of mine was a heavy user of this option for
> testing kernel builds on the real HW.

This option applies to initrd only, not to initramfs.
Except for EFI mode, when it applies to both.

I will remove this option when I remove initrd.

In EFI mode it is easy just not to pass initramfs, so all is okay.

Also I will clarify docs in v3.

Also, please, answer here:
https://lore.kernel.org/regressions/20250918183336.5633-1-safinaskar@gmail.=
com/

--=20
Askar Safin
