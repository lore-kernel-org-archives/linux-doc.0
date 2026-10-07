Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B594B0481
	for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2026 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370707; cv=none; b=dh64m9veOAR5U0o4uayINPmxt2oztXj0mBsMvvgpbbMb1Qw6pqcKp/4aYoF8w0+ZOagSwFINQbMp0r7dkaz+YvxGlT4y+nV5BtMbqDniRtwQ28a4hfQoiYAPH+mZFtD6hdSTY99zFrev9wllmo4Yr6m7GnxTUrsTxdI0ikf/uz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370707; c=relaxed/simple;
	bh=LWqH4rnKhkaeqZsMRrWYyA8Vi+baDRXZJhcaHBpXDjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMXaN0ovcmUvldwE66ZpCtYC9kv3ccoQat3FLT4vZI5I+aAog/fQEscSUD+4OnWX9VQ2W/fU4e92fjUNX0LzmwH5krjv8OlA/mfPND0O+u2EQLWO8Irmcr3Ful8SzZVB+QsHgslsW53RzEd+CXMJrbEk0cmh04xEQAwHfDuvLWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=FDH/1SM5; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="FDH/1SM5"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id F375CBC657
	for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2026 13:57:48 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 6EA8CBC638
	for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2026 13:57:48 +0300 (EEST)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 78A1D1FF391
	for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2026 13:57:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1791370668;
	bh=ddvlJM2l+2DMR1hq6/JuDx9Ck+W72pk1Eaag+1Bwh1A=;
	h=Received:From:Subject:To;
	b=FDH/1SM5g2MGVP6swVakK8V1rZysjcuod/8du6lqjMhrRco7ABqy3cDliaFbM/ZDy
	 IOkSXRlwwVZwnI+z1i67MPn77jCsoDmuPUXPAicJXuje/qLfhUp7C/JFjwvc95G/M2
	 en2082llMqDUdiIi1Cl3wJpm+tviu3hUcmy5XOnNcR+3onxa83P0CbY4bNnWEbM9Yt
	 Ap2XwYj1Q2T49O5RbLu8AdLnF3T6JvKn2C99C+8QKvwX0QpGX+9euut9cwwlaMCCnv
	 dO4Jl+BJB3zRNuIxj1tYnqm3vuig7hUGvlhKoolnYMd3RzdkhV+l4eN6iu4ajDLbc7
	 aJ0tTeBX1DHZA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2e618db81c0so2439845ad.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 03:57:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxJ40Txvn84iKE/j2jAoCCEsmUUXG3ZnuTtK95l8VtBR83UwaSY+J0t+8NKTxYXma/ibXpC1dj9ZTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMa75C4BYOENWCaftorc/ecr6SoFWSWEYGodXJi7GA1EHE2vZC
	HwZ5DXdiqKCb8CrUIdjwKWOCeXu5ZxcoBV5CSDNVJLOL43/DKmyd9S6Y4UPWyJFxDoVztdS8rbR
	ghvEpvs9W0pTq4vDnxNmqavSjYesawN8=
X-Received: by 2002:a17:903:3c2b:b0:2e2:d26c:df9f with SMTP id
 d9443c01a7336-2e6003c5d79mr19039435ad.51.1791370666132; Wed, 07 Oct 2026
 03:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: 
 <CAGwozwG0F88Ah8AEYf2u2BM-4bP+QnZe5p1qTFb4_H5acvaFkA@mail.gmail.com>
 <arfpV7IXRAHREMzO@laps>
 <CAGwozwHY7FsYQZaNf22S-nWGPkc4qekk3H=Hno5a0d0iWVtSJw@mail.gmail.com>
 <arhtsrVb82vr6U-p@laps>
 <CAGwozwE5pJaW14ePjeUQ_w=i1W-Kg=QQOzLY_33qV0W-Urmgjw@mail.gmail.com>
 <arkiyMt2NIydrPhE@laps>
 <CAGwozwGc62HAJnLeYL+jq_PnJq1LsV3Ex9LtQTE1pX3144MdtA@mail.gmail.com>
 <arvFBqreU0qahkXx@laps>
 <CAGwozwEfN7cUZm8usUsSR2bu23ux57QCPxyXJRfwv0tU34gEkQ@mail.gmail.com>
 <CAGwozwHOttyNkC=sdVFCZYKZzhSE=cmUMgNd7cukpEE-WXm9Vw@mail.gmail.com>
 <asYINZIUxBL8I4n9@laps>
In-Reply-To: <asYINZIUxBL8I4n9@laps>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 7 Oct 2026 12:57:34 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFfS8qzy9K_WZRWJ_3UD_8YR6MVn6QZ1HaKPSNVsyHVLQ@mail.gmail.com>
X-Gm-Features: AclHuK_BeZbeRs6xrVuF5xmld8_euALCHxim7-h_g1D573GzFHOgEnKcEC6QxnA
Message-ID: 
 <CAGwozwFfS8qzy9K_WZRWJ_3UD_8YR6MVn6QZ1HaKPSNVsyHVLQ@mail.gmail.com>
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org, "kees@kernel.org" <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179137066772.274946.16383311000385329700@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 7 Oct 2026 at 10:52, Sasha Levin <sashal@kernel.org> wrote:
>
> On Tue, Sep 29, 2026 at 06:10:42PM +0200, Antheas Kapenekakis wrote:
> >The kernel forces you to have a local version file, otherwise it adds
> >a .test wart. At least on Fedora. So there is precedent for requiring
> >the user to create a file to disable some default behavior.
> >
> >Similarly, you swap this series into a two parter.
> >
> >The first patch gitignores agents.md.
> >
> >The second patch adds a phony rule to the makefile that symlinks
> >agents.md to the coding assistants rst or similar if it does not
> >exist. People that do not want that, like me, touch that file. Not to
> >the current readme, please. Be reasonable. Yes the coding assistants
> >rst file is not ideal either but that can be fixed later.
>
> But then you would need to run make to "generate" the symlink, which would not
> normally happen.

We would make the dependency part of a basic rule, so it runs whenever
someone e.g., compiles a kernel. Yes a naked checkout would not have
it, but after an initial make it would appear.

Something like:

AGENTS.md:
  ln -s Documentation/process/coding-assistants.rst AGENTS.md

basic-dependency: ... AGENTS.md

This would cause the file to be created only if it does not exist.
since : is empty afterwards, the rule only runs when AGENTS.md does
not exist and does not replace any existing ones.

Best,
Antheas

> --
> Thanks,
> Sasha
>

