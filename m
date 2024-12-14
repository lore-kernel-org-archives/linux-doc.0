Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B3B38DE0
	for <linux-doc@vger.kernel.org>; Sat, 14 Dec 2024 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734193906; cv=none; b=dHSkbx0Oj5Tfr1uQOa4MrXXUWstemzEgbQ7plmcWNtIYvmQGMHsg44fu+FdTqZ+42PhZEOUQQKQlMeTkPfd+4gIKqYe65Aobo2EjlB8XPv2BpWfZdkpLITDK+MpWO4hOCIsf4hrPNEyLihNWsXxkKCmO2luv+7/SYQmZhYkuI+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734193906; c=relaxed/simple;
	bh=aNfapG6I/CUOP9Y8AfR2pHR5FECAZ7Mbd4YYU7awi0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euk0L+NZRJDI36UMId1qzH/C+Ih1Bhh0MoesGgKQ7RDWnx/FAjTj4eVdM0qmo8lQfCuDi2s7SFXMoQDvrI0g+0Zjp7CyZN6jh0rzTuSkd/j8pFD+CKJ/Lio8SX7t2zlIrK+NzDeuMjSDdU6/MUY02oQfcSbsNqf2njGPMdn0Lds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WveFCrZo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WveFCrZo"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aab9e281bc0so85644966b.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Dec 2024 08:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1734193903; x=1734798703; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSMPYzUxCS1+M94lq1DhBfG9d5bon4YtVfF19FFr/ZQ=;
        b=WveFCrZoF9Gp2U+TTwShRyPEcCMrb5hoq1ovdTJLuE3ktPK76XTpBdb6EILAfwPE6o
         PHXOLPeHgU41P+UKj1YkUrQSzdKOf5bzuvknlnrEcRfxOGeD6Q+/LiQulBM0uvGKF3tg
         prVNN5ImfP04zbgnpXz384K8HmvSp5UDjCHFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734193903; x=1734798703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSMPYzUxCS1+M94lq1DhBfG9d5bon4YtVfF19FFr/ZQ=;
        b=uJ2taVSbgx8KEtw4WLUL7dKyEZu+qnJ7RGudmwKgzRUH7Ju5uQSzpt7NkOn2Ir7tgc
         mAPmCuinGlSEfItK+QraGxSi9ZZ1uprXKShhqPON91TU+fW89yVA8diJqIU/XcXTdWim
         dGav5XvkQuA60C1g7plvJwJLl/y15L70zgkX2soZTeYeK30qMHPbOa9WsTq6TH3XJ41p
         eCuli29Vi81sQKUbJTA2Odwp1zr1vg7lf3rO+2HVtWaYd5/hhJKmEHFTMkiiBXBRnCV7
         Iw+NRAmDS7k87e+QaTwidqHxD5NmU+ve34uMQGUumynVGyngvR1E1pnN6MustDpVivxv
         UrHA==
X-Forwarded-Encrypted: i=1; AJvYcCV6wnon48EK89cQHbYSn8hxUcCthKty7M9MzM8TSiiblUx6sdw7ft2EWQuTMAFxuVTsxViMiDD8h1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYUosem+auGJmkQP0pkbNrpttwV1nDrARGLWucp/dIEZ1RQD5R
	kXsZFcNbPFOdIrlVCew94MONeXOyUkxdfAgWHksaR/nPCrFfeQX9aX8BXk/SBPHFkJvzOOPkhfy
	wDz8=
X-Gm-Gg: ASbGncv9khJgnDPeamAzTELIWCE9pSY+usx45Y1tOZgtPMojVa5ST+ok2GL3tGomtmt
	q+ly8HrOXuG8QtaxAmaUiGjM92Lz0715O79vWRjt9+JMScYmXJsB0CPtm8YX3aBkMab6VWYiIsn
	6T8zAYGhD8ZfusbaNv4mZ68xs/oSXyTaMo0BZqZuXZ9sBScjpjGtSui8Ir8iLPtByPXJBuMwHIE
	qwYyDB4PmuHSV1gPCZIRX7SbwtnpTOsE6SIJPaXxNSC6AX5B75GKzNKQ7SDqBeIA52WU+QLmxMI
	5UEYSXndoXYJKjwaRo92xk6pFlQv0+8=
X-Google-Smtp-Source: AGHT+IGp3BdpXk1G4xbMkrrcL/jzF50FQd6543NwBo8kHyafPj2XlEqyayrjVlEwngD6f47UpowbRQ==
X-Received: by 2002:a17:907:1c25:b0:aa6:6ca2:b772 with SMTP id a640c23a62f3a-aab778d9deamr704103866b.10.1734193902723;
        Sat, 14 Dec 2024 08:31:42 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96394804sm109544466b.173.2024.12.14.08.31.41
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 08:31:41 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so4203801a12.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Dec 2024 08:31:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqtT9UGdu8qiTTqOfQ+g+9xTjcNpx5wPUVJp8JKMY9hownm1QEtHSebTmS831rx/imTlIT8cb09Uw=@vger.kernel.org
X-Received: by 2002:a17:907:2d26:b0:aa6:691f:20a9 with SMTP id
 a640c23a62f3a-aab778d9db3mr565846766b.4.1734193900694; Sat, 14 Dec 2024
 08:31:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733421037.git.geert+renesas@glider.be> <46b320b91b8d86fade3c1b1c72ef94da85b45d0d.1733421037.git.geert+renesas@glider.be>
 <CAHk-=wiwAz3UgPOWK3RdGXDnTRHcwVbxpuxCQt_0SoAJC-oGXQ@mail.gmail.com> <Z12sScjRHpB1d0nO@casper.infradead.org>
In-Reply-To: <Z12sScjRHpB1d0nO@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Dec 2024 08:31:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgrc4zvZg+Sz_aLmMbaJ6ZHYaJBQ7nzByj2pMZBbh6www@mail.gmail.com>
Message-ID: <CAHk-=wgrc4zvZg+Sz_aLmMbaJ6ZHYaJBQ7nzByj2pMZBbh6www@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Increase minimum git commit ID abbreviation to 16 characters
To: Matthew Wilcox <willy@infradead.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thorsten Leemhuis <linux@leemhuis.info>, Andy Whitcroft <apw@canonical.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@corigine.com>, 
	Simon Horman <horms@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Junio C Hamano <gitster@pobox.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Dec 2024 at 08:03, Matthew Wilcox <willy@infradead.org> wrote:
>
> I have wondered about using a different encoding for the sha1.
> Classic Ascii85 encoding is no good; it uses characters like '"\<
> which interact poorly with every shell.  RFC1924 is somewhat better,
> but still uses characters that interact poorly with shell.

I suspect that the pain would much outweigh the gain. You'd need to
teach all tools about the new format, and you'd also need to add some
additional format specifying character just to make it unambiguous
*which* format you use, since if you just extend the character set
you'll have lots of hashes that could be either.

And you could disambiguate by testing both and seeing which one works
better, but at that point, you're much better off disambiguating the
current regular hex format by being a bit smarter about the objects.

Using base36 doesn't add enough bits to then make up for such a
disambiguation character in practice (ie 11 characters vs 12 - not
really noticeable).

base62 would be better, but christ does *that* really result in an
unreadable jumble. At that point I'd rather see 16-character hex than
the complete line noise that is base62.

Also, I bet people would start looking for shorthand formats that
spell rude words.  You are kind of limited with hex, and sometimes
that's an advantage.

                 Linus
