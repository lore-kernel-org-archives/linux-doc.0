Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFA712C54A
	for <linux-doc@vger.kernel.org>; Mon,  1 Jul 2024 21:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719869361; cv=none; b=QT8KZwICn1n/c4Lb9ZYU/M9ERaMRTo0YgvflsuyJ8WESJY1krR80RNhpIF+39PL1tRVgWbmf2bWLVQ3CdiVy099IRNzFQ/8BtPxa4M9Ri3M6y5w0xbbRvqcWZQYbIFk0LnCyYYKd/+NZcH04ckAsNJk5HSlI51Ipt6/gcW+6IOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719869361; c=relaxed/simple;
	bh=QYRodptKrW/HhfD33cZFPnsonz/sn+arLYZ+QIwl0Os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=etM4edOEj5Pr30IAzTKpCEiZ63vRCfrmsAeAHAXsSQLx5dwbwn6cuWeK5GcGoeX57s2SAqOEKtDo3iKogEUX7teQtBoJ9cyW36l3AygeD1Ic7kdq5iC9CwphjkezjbS8pMYTDccnucE0YEBsF1LW0gm/SHZISNKGMCaxuPPE8D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tv65dCRf; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tv65dCRf"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b5617ba47so27937617b3.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jul 2024 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719869359; x=1720474159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSl2Z5I3t21oRckeUtUCQTf8DO87uHYoHEdnx8eg3oc=;
        b=Tv65dCRf6jaye+ibDMk340wcb+IxypZyh4pBo8l9kMqeGkHIcpgk4xAcxs7UVeNxQH
         /fRy0Vf3yZ8A2NuhCSboc3IyCcHJlI80J5fW/86Y78yDHUeJQzsfVipHYsrEXbi+jxbV
         2MzvfYmN1I7oebmAqEuWbJI397Wd+THexwspSHB2gg5B1pTo0HsN4DhaX3VuIE0SEGc8
         NB9UWJ/Gk5V9JWi6BJhHpClgM4m61kZzCTZ4lErGxO1u2pWmDN5RXK/76PBBm4steC6V
         C3IMef4X0j5TXRPmuq3ptBYhRD0PKF4upjq1uwgu3lTvaQkk1g/uoF6mmVSY0ERjVPkE
         vPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719869359; x=1720474159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSl2Z5I3t21oRckeUtUCQTf8DO87uHYoHEdnx8eg3oc=;
        b=YVKQlZJdKPb8QrYeUBnpynscMtT2Ga6NIIhcT1nlNjHfEhyp/dFlhe5N6BDzdTxxbh
         IX8KkKD2DDp6VmRQoeKuTgPxrFqtOYRq2qVik85Lrt4zBgdjmRn5PnqJkhTUScX7oQOS
         dM683W4ItS5Bl3YE31uudnT1g/FUWrxHYtxdS8mII/mZ6rxGViIeP5B59ts/lT9rt+RV
         V/oD/ZnM2pcMXmuw9jGoqESz9DsEaLzSsYCDAt1HZHVOxLt8PAoze6A535M37/vZoIMt
         bxWA+ZlZww2iVo+8B6P4sYBpl7wE0enBVoVn6bmYhiE0C5yyf6BglbyuOdWSlHQASNaU
         aXzg==
X-Forwarded-Encrypted: i=1; AJvYcCVBRcL+C4kCTRllJnqDoxGu8pNDtIobZ6acmBQpWyxBXUOtJ/Nj8Q18u0+Mt9wnviemUVtLoko6zwY6ADnLU1Ii34S/gbpHt+P6
X-Gm-Message-State: AOJu0Yy0YMgijZYHfJxM7KoST4vDQICZX183tX0jg/7v+SD82jC/4LcU
	9Wq89pwvEPWoDgQB+jcHsr0qZ7azbcfZVc7Vw6imIFI7c4VHoM4tCH0ua2fYT1pw9/wgEckgz/z
	PplmBey5ucWDkG8B9WilN+3rWi+RAHBIMqDJ1Yw0938Se0mo+cg==
X-Google-Smtp-Source: AGHT+IGrXD+4pTPNuwEshDbV7GX9n6Y4nx9gnSj9JNfjW9ApBZxXIXAXK/wbTCLOwmtQ93G/H286x9LA3nwcDlnDZsc=
X-Received: by 2002:a81:a748:0:b0:64a:6eda:fc60 with SMTP id
 00721157ae682-64c7114568cmr54543967b3.4.1719869358874; Mon, 01 Jul 2024
 14:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701190512.49379-1-sj@kernel.org> <20240701190512.49379-2-sj@kernel.org>
In-Reply-To: <20240701190512.49379-2-sj@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 1 Jul 2024 14:29:05 -0700
Message-ID: <CAJuCfpE40946AOT9-DQouy+=HdgfFxFH6+OYu=FLXXVv7h-E3A@mail.gmail.com>
Subject: Re: [PATCH 1/4] Docs/mm/allocation-profiling: mark 'Theory of
 operation' as chapter
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 12:05=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> 'Theory of operation' part of allocation-profiling document is
> apparently a chapter.  However, it is mistakenly marked as a document
> title.  As a result, rendered mm document index page shows two items for
> the document.  Fix it to be marked as a chapter.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  Documentation/mm/allocation-profiling.rst | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/mm=
/allocation-profiling.rst
> index d3b733b41ae6..ffd6655b7be2 100644
> --- a/Documentation/mm/allocation-profiling.rst
> +++ b/Documentation/mm/allocation-profiling.rst
> @@ -46,7 +46,6 @@ Example output::
>           55M     4887 mm/slub.c:2259 func:alloc_slab_page
>          122M    31168 mm/page_ext.c:270 func:alloc_page_ext
>
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Theory of operation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> 2.39.2
>
