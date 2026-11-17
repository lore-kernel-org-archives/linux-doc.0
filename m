Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920417;
	b=DAuys/0VtPQl7QFcRL0b43PCNXp8YUU8FGQHAKWsE7aU8ZBFAmzU1QsskCUSVV5xh29G
	 y5Pp8RbiCqH8xZsU6FSbO8Pm/mb3XouCbcJuG1/IgAWrvHv6QMq/ddLVvMkFF67Q3nha7
	 Insxnf+XXgjPhI0rbvcb/CGx7vQNod44NHf2oBdeE/K0qGyM7SMopoKfdcEvzkkvk9yg4
	 LNaIsJwESWBbHujyerLuTJcZY6dF0n+XjvtGXXL8hRv5GWNv08SLHvgGTQ16jTptVua/8
	 K5hilDk6jbLxKMKkpWpQcRohDBjgJJNugDjnLMxGuYPovvjb5l0W3TWUm4r3wTUUOIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
	b=jj2H6OuDqPp4Rqlf4wN6/sxxhuxDBRIVF6GNxT+2CnIoFVeKaya+iByxO+HplxLXdqGX
	 ySTjDvWpmV8waZpZIrVHFdJ5jXTnb5brWduiOCdmnN/W9OppzwCRUvE9ssr1SvQesBYIZ
	 pvE+hWJxVGmCgv7SGRyBcM6UnZqd0xFBvCpqWHBFmBb7YvoLolzc4UVeUcen0xAp7nOed
	 y8XJLo0XNMTfiLWHKbV7C1cTunuZG5oYaMOJYD17ar01XpCMjTfmw1cLYQto852yply4d
	 2YXN37m99SYPHFC3m/Wwi3eivjQnasnt4lozUigSY1vYfMZIxdvXTH4iWgaWvlOCfLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ux9dP6cx;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DB7606A8AC
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8DB7606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ux9dP6cx
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a358881793so543524f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920415; x=1795525215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
        b=ux9dP6cxGHchfy+unLDQ6NmKaVT3R8pW2Zfa/bLFviUfqW7T1JZLWOGkLeMvqz7iUB
         zLW7dje3QrA7HvFJ9Z2e/BsWN7PkFukCWLlCC2sfZfe4C42kw1BD7+xJ9+K8ykHcfJhN
         xuB6p0p675+Q+8Ab4VBm/lPttSQUOT9MfXiQdtBTxIq64JfVXTUc/LJnriMOJrmqWlqr
         pVJv7iS/suULfBRGTO/rXud1wwmWfwrXIjLdPTrqTKyk72/ZF/FYEeTqn8YrQOIG851+
         XstWyYcmlUsM5ZYhKgaD6JN4csYJsgqj8fKhGxAJTKSZDhJpxLk/Ya/RZa7YSEnQfkFN
         FNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920415; x=1795525215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckAIzUV5oWihOIEXseRYjbrEU/6METgnwVW7WGDvtlo=;
        b=v/AsfJZfKbN63wJokl9QLY9RAzcksYqAZbU78lgMVKwzc5lKN2Xvn3qNxtPK8nfAMH
         Nt8J/7AexAdse4/UL2OHpxwA1DWiHvm+BEuZPZ6iMHH6OyudMvfVN5yFJ0ZLfkuhmRBJ
         OU4Z9xCidGJy1+Zaya51RIDImnVpCFoEVDTgzi+SC49mBcpyu0Abr8FyYp5MVumWAkEo
         y/hxaRbfbhp+cNRuVbX3d5z/Bbb4v6Foa/jud2KHCKLdtUSwlK9XBtPq7NG216F5me4e
         pteQarc+3Sk9hx/sm7lRQNU2KRYWfLpupqz/Bee1chEa0ZGtLPs54bUgkvZ0CR2Afn+E
         unEA==
X-Forwarded-Encrypted: i=1; AL+hErGwDDFjed5riyjr9vIPd+ZUJxK43FA4bUN/cdaPGGKzakeo7QfMkSihDoUz8TtFEBqo38xvklVTj0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9odcuuSpKNhuY/mGI8sqNy7x/EVEZfkXi69EyZIIROQp3mSJSF
	fNh45OaAsax3qV7j69kwvBztE7HUKAulOyqaT7dWKXN8Ou7yQcKFqdJc
X-Gm-Gg: AZFdTZccBe62YPgGuHio0DmZkqXHswsTuF4VoPlEHvDbt1pvp0eOqvdrJaY0mMKCQg0
	b25nyhjsIXyzaLC+3BLKI8Y+eqr2m7kvLKSEncw14pGTeHioAEGuZqaqxjvzmJd1Hfw5jWEvgX1
	B4E9f96g1/auWDZcqjVuhix0dCO4HGhsH6cTCvKAPdZmxTAWTnF19mnZZZM3JmOMtOHKUg0aWJ9
	mZflCignqTq6u7aqwtU+AM9sND2N1h+k5GxgXCf6r5YbC61uOvW/1QGvyMoprUYRYI1oRq5hrUW
	CWhhYyKhPSDS1rbDTeEvicQuauElOOqNsQidhEQaDvkbp/t2+4PjhtWJ8h7jBdNdnnVZQpmhkWt
	7lfsenBT1HuAlP0mAx3QEh7g56D0OE/I6hHeYgIP9yiX1XGFTed4K1KXPpQJJzkDw2dHzRgxo5b
	jRpLJt5XQpWnpk1HIw+XBrcGs9adfeOFpuwojRZJ6lp32Srl7iD/Y6yv6E4AdV14S/dkHK05xoy
	oi/PuVW3WSRaRnzG0CJjOyLCRpQUPnyekwB1Qz1GfhqoSOFtP+y0TfhXBkL8nek/Oxq2adEPzFx
	Jf9IYd+GODeaEbE8X/iBfIevWsj+F4UaQEqgqh8867FB6uO3+9TTZ8QM29JdLwJWEU2SBLQIx54
	TyzBoXAScufc=
X-Received: by 2002:a05:6000:46d0:b0:498:2754:6a80 with SMTP id ffacd0b85a97d-49c725e538bmr20536616f8f.28.1794920414596;
        Tue, 17 Nov 2026 05:00:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm28207005f8f.28.2026.11.17.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:13 -0800 (PST)
Date: Tue, 17 Nov 2026 13:00:11 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 and KALLSYMS_QUERY_BY_ADDR ioctls
Message-ID: <20261117130011.05eee0a9@pumpkin>
In-Reply-To: <CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
	<20261115142431.1587690a@pumpkin>
	<CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Nov 2026 19:15:11 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Sun, Nov 15, 2026 at 6:24=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Fri, 13 Nov 2026 14:12:45 -0800
> > Samuel Wu <wusamuel@google.com> wrote:
> > =20
> > > /proc/kallsyms is the primary interface for userspace to query the ke=
rnel
> > > symbol table. However, resolving even a handful of symbols or address=
es
> > > requires reading and parsing the entire text file, which is often sev=
eral
> > > megabytes and takes thousands of read() syscalls. =20
> >
> > Separate from this, I've wondered about separating out the /proc/kallsy=
ms
> > code from the code that actually handles the symbol table itself.
> > The two parts are pretty much separate.
> > IIRC it uses a static function to get the symbol type (which does most
> > of the work of getting the name - which it also wants) so it isn't
> > completely trivial.
> >
> > I'm pretty sure all (well almost all) the changes will be lower down
> > the file than my changes and won't cause (hard) conflicts.
> >
> > I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
> > in userspace for testing both, but had to cut the bottom off kallsyms.c
> > to get it to compile with a sane number of definitions.
> >
> > David =20
>=20
> You mean separating the core symbol code (top of file) from the procfs
> interface (bottom of file) into two separate files, right? If so,
> seems reasonable to me, especially since the file is approaching 1000
> lines even before our changes.
>=20
> And agree, even with both our patches, most functions can remain
> static in their new homes.

I just tried it (on 7.4-rc1).
Only had to make kallsymbols_get_symbol_type(), kallsymbols_expand_symbol()
and get_symbol_offset() non-static (added to kallsyms_internal.h) and
split the file before the definition of kallysms_iter.
Then tidied up a few #includes.

I've found a much bigger problem though.
All the sprint_symbol() functions do unchecked writes into the caller
supplied buffer (no length is passed).
While the buffer is (usually) long enough for the name, there isn't
guaranteed to be enough space for the "+0xoffset [modulename buildid]"
that might easily be another 60 characters.

Some of the people who have modified that code recently really ought
to have fixed it.

David

