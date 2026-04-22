Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CFB3451B0
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842077; cv=none; b=KKT0GWmQR3b8w7tKhzjE/yw5Moc5v/15tmUS1++QfK1NpBD9I7mrz5jKAZn3/sVwt4kX/6sqeOpNU5JfnMBpsMhULg+EhgXURcbd8qZWyQeZPzh8H+659VrrlSKthtXlAQwkwJ/iO0LsQJBG1cqilQMte7wZppoxY/8iHFwR+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842077; c=relaxed/simple;
	bh=AbzpDKzpLYQIZR15eURcndnlfeJe1EZuRfwEYj2NPqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edF3KVUd5QP3fGXnju6lc4qPeAdsjNpEo+4jOaUzDgSk2ZwH69Cl9N6tVEoe2Cl33OKvIpFizjoJbL47lkCD+wUAlSCgMdglR7LMmErDYR8TeaDdzC/XnkKk6Z5fzNj1avnlhaFGDHS/UslJhw9cax8OicF/oNvqeLa2bUeleto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f8b51db2cso1555697e0c.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 00:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776842075; x=1777446875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmC7oEX4WOhO7INFTkL7vh68afbkhaCccrhJH6rlX5E=;
        b=Yj3hgmG4lpHPdDs5e7FgwFeZ5c1UfUb1sbCcfWiKJN/ZjxiOjUuY68E3YBjlOWELpC
         HTp+6VEQn5qpuzo+DIIil2FedX7lIHGf0hdWF+S7bz73SXRnyi3SO1+uVYL76H9G3sUF
         uuyc29bXlKQIW/gRFQNYA3mwwwLUC3kqi9YQ+/V18VOih7+HyifkUt0CdJagJMBf9s3c
         isQcFLZcAT+NhQpjwcize6Wu4OyOpHWm0OAe07LGOsSjT2+DN4+qw7Tjzb7dyOtGe46n
         NVNXJA15CBz4K+l4rDPlBRH8n9EcFcfQbOcWG7G4CUe06FV1vSmdJ21opoGTXw3dvmKN
         2lAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4i8OK9AyyTiMTX5s7mfgcCOB/DrGBpvyXW6ztJeNYRX2qmZ8b39kuLOvYT7FD1aa+Vj41L0tuLGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMxn2MJwLDlJ88gge32kyf4PG/vU2Mu8htuhEovobmTCXWTv+
	BzVQ/59t5bRNuBqXhtZ7Sbg9G9oSBq6y1fh9EOJwLFilcausfK1p1ZlEsx40hEJozzk=
X-Gm-Gg: AeBDiesDNWcUzgGmyOrSy3hG1gJRMM+VdKqWCcYkA3x9/Us93huPA/H5uGcQJGzihaT
	y/09LIaKzLUApcjRjc3MXmPVy3WchzUTK8w7Ny92uO3uGfka/Bu9zLOgo8pl0XSRn4qGcyT1/SO
	zl5CdpI14p2zoCjoqon/Ob74klxumTmWwHcM9s+j+nqZcfNgmskSU2k5GmXV02nvobHhpAfLk/a
	QOYKO3/EZ9Fte2STSi+J2TLS2rpyfOq35sa1FSNHYk90ghroJYjXWHfmqSVcwNnFVfTGT5x79po
	58PIWgAk0cDXd3eiOGEr9FPWtTGT6Bot8/Ije+eaVk1ICjuIaE14dff86UdC5cCe6PvMAV2JsYj
	TWI3pF7oqmhZq14vZ+aQEWKJjI2hTR+iePXOvyY7DTMhqdnzn/bIFrTeYr+kpT897pJGwnzc413
	p5TpBLkLN1fYl0Q3OSwI1AIxVYZj+DPAK9U+ozRFKSGHdORBMAzFNAS8tEVB0+7KTtZX6+UJFgo
	wrMfiLccQ==
X-Received: by 2002:a05:6102:2c82:b0:612:21f8:5af8 with SMTP id ada2fe7eead31-616f4546ff6mr10512900137.1.1776842075014;
        Wed, 22 Apr 2026 00:14:35 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-617482b3ac4sm7746484137.12.2026.04.22.00.14.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:14:34 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94de664b541so1377260241.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 00:14:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8YhTZt6J1ojUfmNZaOzsszlpB2Zt7EjY2WRTe3wSJmv1uGiLGQ+LIveQjjSGdwvcFrCJnXUSoPW5Y=@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:608:6b33:5bdc with SMTP id
 ada2fe7eead31-616f4b542a0mr8946296137.7.1776842074572; Wed, 22 Apr 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421175516.224960-2-manuelebner@mailbox.org> <20260421180902.225560-2-manuelebner@mailbox.org>
In-Reply-To: <20260421180902.225560-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV70GhNsxPiuhY92seZRMkr6jk9eFCke7shc08GYerLpg@mail.gmail.com>
X-Gm-Features: AQROBzAo_jIuXmlZfjuZHOt5CL-8nlD60dqKXL2GlBfrNb8xjB9gDFy88OEvZac
Message-ID: <CAMuHMdV70GhNsxPiuhY92seZRMkr6jk9eFCke7shc08GYerLpg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

Thanks for your patch!

On Tue, 21 Apr 2026 at 20:09, Manuel Ebner <manuelebner@mailbox.org> wrote:
> put the optional argument (gfp) in square brackets
>
> eg. ptr = kmalloc_obj(*ptr, gfp);
>  -> ptr = kmalloc_obj(*ptr, [gfp]);

Shouldn't that be "[, gfp]", e.g.

    kmalloc_obj(*ptr [, gfp]);

everywhere?

> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
