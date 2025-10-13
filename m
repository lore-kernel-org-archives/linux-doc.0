Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C355E2FF172
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351386; cv=none; b=e1lcU2GnO2oou9piVfr8AKRXho8Db1dX8uha4bVStUsB6Nl8PlWyV470Vh+slYizl0ntmJ3hd3huc1M0B11TyWGt/GdPproWkCNXnWFA4RrhdB27ysloOB0PgnWh5hB5QjHWNVW3o7B90J+8CODVMXf5gtT8Lz8hAjAd+/xPlkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351386; c=relaxed/simple;
	bh=SVPUlK6sYHZahK5O3+GOTdw6Bx0G0qiDlm5PKLNZXQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMPEr+Ybd5Sb6a3aZjQyD04bXhejibpwnY1WtChMDasoNtKaLJUSvo255r0ehdACMz16x5r04hoZYnYwLH5nh0IEbv/7/T2y8M5IME1FPxrrSOLpen0a2GRa7YGv7SHB/ySKympkBz6zcrN1rnYguF/+A/KraN+ArHn0zHBUNKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIQhb/oU; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIQhb/oU"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-635355713d9so3872475d50.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760351384; x=1760956184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVPUlK6sYHZahK5O3+GOTdw6Bx0G0qiDlm5PKLNZXQA=;
        b=ZIQhb/oUlO3F9MEPUxurf/mgWI7Y1g8uHfT6SNbxuv/4xY5+m/YraZW/5KqmjRIwzX
         rdTRUXUR5ZYcRqHAcjEXbyqp9QPzrQjcU/+tE2lLY7zsYf9eKvPgMh7Yb+eG+DeMYl1A
         NNkv7u+ELQLfd91UVqU5n/EDVbx6VQywzqTdWGNVo8cwyfdUj0VZFPUXp9En5uePFJsJ
         B8tJ7rKH5YlpW+Pq8nGhj+PB2fjPaXocpEbEosY0ETAXl+QzWKYisCRZclqHs3mpy0wb
         S17h9fT1i/DEuznIcB2PXT67kVi/TGa5zjTd/jM4v9YckG+ajQAB0eFRwEULsu95liHd
         eM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760351384; x=1760956184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVPUlK6sYHZahK5O3+GOTdw6Bx0G0qiDlm5PKLNZXQA=;
        b=kA8WBqNzNnWMZsFI1wpi5nd3kKoJYv8nT/rEaago8IKhO3BgGLLvJT00NAnyrADCT0
         s8xGLkQAXdyycrKMvA8XvDYIg3vhqogomtShf0SDdegAvWU8OEcsoT+9QjvxGFGzq/46
         E5D1UXD2ADxAKGza84pql3uAsCJh2pMo/KVPfTOD1U4IYUMsve7rpJ/rBUsuHo6YFnnL
         GMtXKBkpaTfZXBtpv1kQOKNVeCkXwWY06zIOcfm/qg6cJC4WsMwvJ57sO4O/fysA3qF+
         Kr+z+XTxCwNmjLTPbN5UFYwhdcKlGZ99qL1KQx/AlCdJ14H2/WwDLy35ekYy/jhJkNV5
         iPWw==
X-Forwarded-Encrypted: i=1; AJvYcCUqs44bP0hQJ/MYPW/QqDcLeFjJIkZnDG/DKAH7Do4qc54Zng4nK6XAt1hG2JdW7qDxluGCtt8Nlr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyku8ykdRu6kVqSjgO7TueR30q4/OaLQCVZhLe4WNPb+ObmKLVU
	B6dmcZb77CR0ZgLZdEFGTw1d7yJeAYnZ3F6xQr/BhV6nOf5iyOsPpDXf6xrkqp078cZseWew7Fj
	DsCBZ9Dh35OuJum5M5/fe40vTvqIZGUM=
X-Gm-Gg: ASbGnctU1mqL5Jn7daZZqaMHyodt54mtVqvqm/4j3lYk0hVY57mMnk46v9s2wlv+lGc
	zYtgqNUdRBzUG34ZSeO8xHk5h66KC8koNW8M5IZRN1UCxkN3G1EziRJ+n8mtICI4tY4cX93rXzt
	RRA4EF7snv0KnPtnERf9dmnqRP4HL7Y6+iB5euORVyCcn5ZIdWGDfJkAjiCLMYGYiuLsj/MW21C
	Ehn85X98TkZHc+CTgphQW34ErfD6EQ3s3tD
X-Google-Smtp-Source: AGHT+IF7gB/uIYJ4y7t+OLiZ00mCO9lllMt+QoIyqpZ385m2NgZqSy+lqlMIQpqL29tGtjodZ9h+RUr8WRjGSui6l/0=
X-Received: by 2002:a05:690e:4186:b0:63c:f5a6:f2f0 with SMTP id
 956f58d0204a3-63cf5a7080fmr6997775d50.66.1760351383745; Mon, 13 Oct 2025
 03:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010094047.3111495-1-safinaskar@gmail.com>
 <20251010094047.3111495-3-safinaskar@gmail.com> <07ae142e-4266-44a3-9aa1-4b2acbd72c1b@infradead.org>
In-Reply-To: <07ae142e-4266-44a3-9aa1-4b2acbd72c1b@infradead.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Mon, 13 Oct 2025 13:29:07 +0300
X-Gm-Features: AS18NWAYGkNu7BjeCT0jHGno_eA5ARoSWF2j7yYdLIuVOnrJP74yF3CsWnjM_B4
Message-ID: <CAPnZJGDe+sDCsCngHyF6+=3=A9pYwQ1+N87jpq-ZdsSvVbQuNw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] initrd: remove deprecated code path (linuxrc)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
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

On Fri, Oct 10, 2025 at 10:31=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
> There are more places in Documentation/ that refer to "linuxrc".
> Should those also be removed or fixed?
>
> accounting/delay-accounting.rst
> admin-guide/initrd.rst
> driver-api/early-userspace/early_userspace_support.rst
> power/swsusp-dmcrypt.rst
> translations/zh_CN/accounting/delay-accounting.rst

Yes, they should be removed.
I made this patchset minimal to be sure it is easy to revert.
I will remove these linuxrc mentions in cleanup patchset.

--=20
Askar Safin
