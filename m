Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757536D50D
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164914; cv=none; b=UVVA7V4iwMrwhMc0H7uddMWpv1OsNenINNyabG9e9MqpIUKa1xeGqYoohmCt/GSF4d34NZk02O0DH3ZNS4DJyZGoH3DEdcoAJgXBT1alSnXKv884XkhQnizo/mEYNODtMTH58XNBmyJpZpUfCL6aZ6eEMyitjcPl+RHylYCrmec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164914; c=relaxed/simple;
	bh=jSMxOhDU8zVnFnk8me8GJwE6z7sdluDZVTn7lZPrqGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cp+lY3tdrZQ8AxRqkjhdX4TpV0pNKCLWtgtmlIMLYPv5hxiU7DrwqrcMOYR8i81hIe618cixJ023SR0+twacgnUo9+Rpz5nU+dk504xu2OUxv3nehuWleWVdpraFKyifHVEtXDF7ptbu907bJs+FAKzlNv9UxNggQr8B7fY8mOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6cb414a5d50so5921731137.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 01:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164912; x=1781769712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60RbendQYft/sNgfb1Bs6AggE3FT/n1bmhTOtIuhojs=;
        b=K6bzdkOByO3i0q6yVAMb4Fp/Q7c5LppDOCWOOn1NUbFkPlaAanUIBdMLXDekXsFfIr
         v6tiRAcvjCjT/bz3VoWuOBH6l0aU4RStMTZ9kp2FsH10ebLT5pLLHviYWsjnpSltJfuz
         GH492dRSKQAjUfNpvpFHinTkzJ9O12u8jYW2im0Wv0YPpUq+6DK+iHV8UN3dG70JCRIU
         8bhew5tNNdzi2p3ngqfhU1CFgFmGr56ByDt2pzN1AipLt1K5rAZ0AzcXYNZ6yVjvW4oo
         KHmxLXll+Jd0vcmpDi5GhCXB/Ws8UXL7q8BD8zZnce8KIfL0uvFmLxQXkyQExJfuZk6q
         igaw==
X-Forwarded-Encrypted: i=1; AFNElJ+sLBqMI7WXdGCKjmbvdQV42MBRBpKKgAjExcU3GP9TiIg4afywujGOZ+czvSRlswckLlYTcGS1rRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsUK5pktTr6VUIbG67kbSVFjKI5U6PvEXgm1e86/KXWpdakwIE
	7St6SpVHRYAFUVUpEbEHk1ZvaLSpw2wddo3RvpYdGKxomQwLlX6ACGxVOss9gmc0QkY=
X-Gm-Gg: Acq92OEjAg+ahgf9r453cnc8lkji1irwo54ZxVSk5cCgEn8GI9XROXBHu8IVyt4sWSP
	pwdOD7nWTo/Rbe5oWqUNTuHqa11II6XoGQ0aFLFtrlDXsC4AJYokzJR/HUwpYyRRiVYKZ5Lp5dZ
	icYeb42OeRQOex4OsNhlZ3raGnhVxOfYo3leTJu0e/7kT8hnhhNYAE8riiH+ST5vT99K6GfurCz
	ktczlKpah3TtJa69Se1FAAli0ZM8kX6e7GopzDlxcNtoMg1yi9LlNFY1e9sY1oNOvDqyJvXuvAr
	Xb9GHOGt80uI8iIGF0YtxoTQy70QlcMYTa6dTEKHLV22G2MGMVplNNy3voCthAOiDQUCi69E9G1
	3VCzx49aJ+VSyW872U1Q2VmRJOvv3lKBoDoe6tAjr7nZG8lS4blRmAVtt+GaeQi/xblJwVu8wOb
	2GfUFPeFutWkQpq6G1MHIX+w2dYMWmrRu7F8uQOAIaiikK1mIM5QnrEM5D0yc6B1SxrkQPfsSmb
	Bk=
X-Received: by 2002:a05:6102:162c:b0:633:78f9:10a2 with SMTP id ada2fe7eead31-71d5b8325c6mr485246137.20.1781164911932;
        Thu, 11 Jun 2026 01:01:51 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-71d926849ddsm467250137.7.2026.06.11.01.01.51
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:01:51 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59c9b666822so5244276e0c.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 01:01:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8AGKMJwqQ/XZ2XNcY08n3A/BWfJwPMycdft1d9BhreA3QOTDnPMKwMCfuS1hFr76IMDsiZOElRF4g=@vger.kernel.org
X-Received: by 2002:a05:6122:3122:b0:55b:d85:5073 with SMTP id
 71dfb90a1353d-5bb001ba5e4mr521214e0c.4.1781164911136; Thu, 11 Jun 2026
 01:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611064311.117023-2-manuelebner@mailbox.org>
In-Reply-To: <20260611064311.117023-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 10:01:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4VDS-ZWBANpZy0S58tRTbeGNUrqTLuTmM5y1mz=JQDg@mail.gmail.com>
X-Gm-Features: AVVi8Cd8S_bg0KDtLSPgvAoO5y-R6PyIxq-9ujefOKwFWzNe4lJGKujrXnVSGpE
Message-ID: <CAMuHMdX4VDS-ZWBANpZy0S58tRTbeGNUrqTLuTmM5y1mz=JQDg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: process: fix brackets
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Kees Cook <kees@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

CC kees, krzk

On Thu, 11 Jun 2026 at 08:43, Manuel Ebner <manuelebner@mailbox.org> wrote:
>
> Fix missing ')' and needless ')'
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> This is the first patch of a 'series', but I won't send them together
> because I'm still producing the patches and it will take me a couple weeks.
>  Documentation/process/deprecated.rst     | 2 +-
>  Documentation/process/maintainer-soc.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index ac75b7ecac47..03de71f654c7 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -388,7 +388,7 @@ allocations. For example, these open coded assignments::
>         ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>         ptr = kcalloc(count, sizeof(*ptr), gfp);
>         ptr = kmalloc(struct_size(ptr, flex_member, count), gfp);
> -       ptr = kmalloc(sizeof(struct foo, gfp);
> +       ptr = kmalloc(sizeof(struct foo), gfp);
>
>  become, respectively::
>
> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
> index a3a90a7d4c68..fa91dfc53783 100644
> --- a/Documentation/process/maintainer-soc.rst
> +++ b/Documentation/process/maintainer-soc.rst
> @@ -60,7 +60,7 @@ All typical platform related patches should be sent via SoC submaintainers
>  shared defconfigs. Note that scripts/get_maintainer.pl might not provide
>  correct addresses for the shared defconfig, so ignore its output and manually
>  create CC-list based on MAINTAINERS file or use something like
> -``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``.
>
>  Submitting Patches to the Main SoC Maintainers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
