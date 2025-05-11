Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B710528E7
	for <linux-doc@vger.kernel.org>; Sun, 11 May 2025 00:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746923760; cv=none; b=qtQxa6tarZ9RngTUO2qCJ0O75cZU4iQDh9cUrNwc02uGsA9DJkrgTAwMU4pwFhMregtwOd9UTfur2SrytGL246gLMwwOePFxKnJlGwzG9AOxO19RqoshWDlvk9Y0pBWNLi5kP1sr2niaGgAxeRkwdtTKmtJWXCJD5C0/92UU0k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746923760; c=relaxed/simple;
	bh=r03nLJvgUgmrXUBp6pwwH1baawwiopAwlukRYtT8E8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZXRdtnxkpWpLOpLJcwRUsXLJbi+Zi+XSHVs9aaHYuWJMwj9+WegvEzOiVhdjsaAsOn6DtOs4/ECYnco+9VVP71/D+oPLUjRjaunjz2HU9+Hk1WTOq1+OALKNv6BeEWK/uKt5qlnLlc2HGjZtmbiLOMeLVTElAwQ5tR5hTCxAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YBKcljK1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YBKcljK1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22fb6eda1cbso2082055ad.0
        for <linux-doc@vger.kernel.org>; Sat, 10 May 2025 17:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746923758; x=1747528558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtRaVsiUBI+SZ9IP8U8WDTO4rTZdygKMrFtkoyTuE/s=;
        b=YBKcljK1hLQ/txMdxQ1bK1cdOGHYDVulrCIfYr6zlA6qpQcrIlDwsulYknuGx7HFl2
         UuV5kF2t7r0BEerB+2rwnefXHqPkA3F7WgBlxBHLnq6wSQxgm/Dwg1BdNyT4rTSehxyS
         JQeruB4lNcl6A+tr9j5SA+n5t1wB7vEeZT+y0I0TMHACuOubs61o5yPSincVRFORTyIp
         yTaHyaB1w5FesWJVlcoPGFH7e1GhqLZPFJnG6rP7uuecSBp7com0PP+Y40d1c+bp4IXc
         9OtM9Xn9POU2FM+Z2uw0R062OZawBGEfDETnYlkvZYwwgSI4vBgcksn3D17NPBV52/fg
         s3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746923758; x=1747528558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtRaVsiUBI+SZ9IP8U8WDTO4rTZdygKMrFtkoyTuE/s=;
        b=EJgfAwhQd/iNqm8hgeESSD4yrkgjCwxrNHGP+XVDTUQGKlffmzWwHMf5zF/DQGdqk2
         QobSHMD44KnBfJhWFdaRt8Upyq/PdYDI4o3xy3/r15hOZx/fGAJTqQ73e02GXOZ8n0sf
         Cb/u464IQFaGpCj0F2H45HbZ6rwM1TMYaDEllDMzFVA1TDZFPHMf6jDZyfijSQc1KXfy
         ooYxprfSuJQaOmQbAvB1Am0yb50QLBvorJmgxFCaawF9JdF5UimeMN3l6Ku6yPfU4Zla
         DAPKSo1rLy9Y34gp24dleGfoKtz4CyUpdAkhGh+8DPfo3QXWVuEkw4N+qZwtyXjdD+4Z
         VUew==
X-Forwarded-Encrypted: i=1; AJvYcCWmTv1VD5cRgOkW5bd3TgkOF5c6V0Tayrb1YnCShkzXDHOHQLjB7LJHkv8Bwc4AB2gqkTRGyR0xfr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEtCUSXuzQ9Gjfn2unNycUPojvigXrGeuxfPSahj0s5AQiIKtJ
	KOIWjxDCoMTaqlMgOYMKkGc11gALEl+fAffFzUCulI7Ow/a+hSf9HtZLShYs87pM/N1tg6geCsY
	HxB+mVpS9WWzlKFuMCJ6bw71vbFXf5yx7rLORzw==
X-Gm-Gg: ASbGnctr3YYeRgJjt1hi1kdyoSjdU0+mZ/ItBoTboVMGQvZcYG+aNtN24XEOlofmdQ9
	FwCX74aPn139VpQ5pCiSG/zGlbyXyZSXs4+5bUzNzF3O7ZWNSq4bRKhzYa99KnAE9JwiYnpLDXn
	+3L/Bkd+g2RV3kdbqU/4q7jSzvnzJ+rdg=
X-Google-Smtp-Source: AGHT+IEQchr0wi7aB6E+8gcZ5oqBZRv0bHhEJAH4Nl3ce9Fg2GOxYYgtWBIB9g4f0p6+kGvZGmGTGjU/TmWpKmQUugs=
X-Received: by 2002:a17:902:ced0:b0:224:216e:38bd with SMTP id
 d9443c01a7336-22fc8b3b40fmr53521885ad.5.1746923757953; Sat, 10 May 2025
 17:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com> <20250507-ublk_task_per_io-v6-2-a2a298783c01@purestorage.com>
In-Reply-To: <20250507-ublk_task_per_io-v6-2-a2a298783c01@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Sat, 10 May 2025 17:35:46 -0700
X-Gm-Features: AX0GCFvq5YiYiXLcLb8hsdNH-xK5jnR1e6XUTmKox4Zk6Icabgf3xuys_D3kZR8
Message-ID: <CADUfDZrhsQfx6nyCZQq=8HDZLysa48uBWuENY6oKnFuayt-wCw@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] sbitmap: fix off-by-one when wrapping hint
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 2:49=E2=80=AFPM Uday Shankar <ushankar@purestorage.c=
om> wrote:
>
> In update_alloc_hint_after_get, we wrap the new hint back to 0 one bit
> too early. This breaks round robin tag allocation (BLK_MQ_F_TAG_RR) -
> some tags get skipped, so we don't get round robin tags even in the
> simple case of single-threaded load on a single hctx. Fix the off-by-one
> in the wrapping condition so that round robin tag allocation works
> properly.
>
> The same pattern occurs in __sbitmap_get_word, so fix it there too.

Should this have a Fixes tag? Looks like the off-by-one wrapping has
existed since 4bb659b15699 ("blk-mq: implement new and more efficient
tagging scheme"), but it's only a correctness issue with round-robin
tag allocation, which was added in 24391c0dc57c ("blk-mq: add tag
allocation policy").

I don't have much background on blk-mq's round-robin tag allocation, but FW=
IW,

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
>  lib/sbitmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbitmap.c b/lib/sbitmap.c
> index d3412984170c03dc6600bbe53f130404b765ac5a..aa1cec78b9649f1f3e8ef2d61=
7dd7ee724391a8c 100644
> --- a/lib/sbitmap.c
> +++ b/lib/sbitmap.c
> @@ -51,7 +51,7 @@ static inline void update_alloc_hint_after_get(struct s=
bitmap *sb,
>         } else if (nr =3D=3D hint || unlikely(sb->round_robin)) {
>                 /* Only update the hint if we used it. */
>                 hint =3D nr + 1;
> -               if (hint >=3D depth - 1)
> +               if (hint >=3D depth)
>                         hint =3D 0;
>                 this_cpu_write(*sb->alloc_hint, hint);
>         }
> @@ -182,7 +182,7 @@ static int __sbitmap_get_word(unsigned long *word, un=
signed long depth,
>                         break;
>
>                 hint =3D nr + 1;
> -               if (hint >=3D depth - 1)
> +               if (hint >=3D depth)
>                         hint =3D 0;
>         }
>
>
> --
> 2.34.1
>
