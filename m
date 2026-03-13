Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9939F3AD521
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415686; cv=none; b=EkZZXZ9fOm81+c9V7vvIyVjthoM0zpD9vjLujwmzKdww3v6i+FpXBJ62dyZm10UTD9pKUV2b9QKZqk7H2d5usMxYlNdoNSwv7dbRtujEAJkghFmaseTBYvyjBkSES0jIpiHGTplkGwD03kGJXHz1iLOAXK71Qi/3vdnm6UPJSZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415686; c=relaxed/simple;
	bh=1COKu16Et9xGywUvxkcvaxVtf5aIYdSw7LupXs2dlvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/M/48vl3Nm4U1xrmWUSU3tvKIT+EFVSw56gaiunnQ5Py8gsjzmeUdiAxMq5B7/uYUFeMiy+/3P+uxY1Jl3uUoJ85RRXIsrGzOFkBp1crQ/ch2cS19tyxi7FxH1KBfWnBWGrP3GRZt6CuP5Zo33SN6krsIEs3hfrb3rwN6hT8UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oVOUm9iZ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oVOUm9iZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-662b5bf4b10so3956184a12.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773415680; x=1774020480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHIJ2SvwUL/ITU5TeIm+ep2SxGwkoB28/8F6zL7HpQE=;
        b=oVOUm9iZCoU8dOIw1YrKC1YX4QZ0GUhfDhWZU4nu6wLPh1NezikcfLZ93y7GGxLI3Y
         htvJxdEEYOwNMM7Dtaez39yAxyn3Fb7RqxRQuTDZMcRGsx9SR106cX+ynSWWItcVA13K
         em3HfuUOlcYhAy8Bsicg1Lbck2hTMTU8lqXHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415680; x=1774020480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHIJ2SvwUL/ITU5TeIm+ep2SxGwkoB28/8F6zL7HpQE=;
        b=pGI3jZmQ/HP2aXEvehctz0z8JZpBEe4KVrSlzbSDkkYdeSy4N1BIxZDzwMwTQCjyYl
         3LNZL/gItxlCW4+gw4LId6ra8N1qZ/oW3fW8J4QCRCFeWR8LsgoBYm42Mt2DYqaUyK5y
         p30v2S3FKfX8F7wpxxB8Dblj8drHjgpi0X8WiF5yLwGfgQxbCJtZeJKLC9PTGvfBeAIR
         wEKu5ybJabHyjEGycUWldm3C/k+Zg64+WT1+XHD1q4uxfio8BEwh5ULKsrMq1pA8pkt6
         tvozKKIFVeExM6UunXyCboXd8Hd1M5+9EbwGViu1tljn86waQNEnL8eVPloxXqa4q9mU
         7ung==
X-Forwarded-Encrypted: i=1; AJvYcCXxgp2DTFtNKJsGN1PPYg0iwlRfdORDQeJhweOIrOmpdkNU5s2ONqE1IG667Tgwuxeu9wojOKZnIuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdW8n0VSIZpPAKhs3fg5gIvkdjAMxq9PHu0fAQQ57Zc34fLAL2
	KPSBB71TIUQxrXXM2fT4E6GNOqlJT3CY+5oXarK9YXE88uuTsNW9qfl3fiWYWPcEBDG/IT+6ypy
	PXbI80TlA
X-Gm-Gg: ATEYQzxsFyHmR3UDrwCXmezt3GIyPYp4aLK2sbt2aU00sF8ofvoGcUt/wYhVK6+WcYJ
	XeVAqoEFI/y5q4sncgiaRwFg5wBxU+0eJcVHYJvI+T9td9UTZ4iL27ND8Qjh9eGfYVnHNYiF9Z5
	doKaply83XcQ33Bnkikc5fGC+GXXeoFE/kBsQwau9OAk0B55aaoO0rSZtMoBZw/XB7UtgZD8OSq
	gerBR9j6hma0xq7P7tmR1YVGz7IJlXzgEisU6RPYsBT7LrkaPy3WI9pWM1dSdnV6abd6MXyrc0Z
	JX7nf1a4EmCPc4ewTTjui2tXS+Mxg7SzR/4pUJUMfngEmv/lX5ENO2Cokz/HhQrmuKmyrnSCNMd
	28qriTOb1pZLpmgWWAwOnsMOUupxJHDjPEJ1RD2LXe/nVasVOPT6dsWvcnLly9WODdBEdWlRghi
	zVda2zIK1NFHbiHiJ/Z/eHeAQEfzzQPMEfGdnAOHB6u4SgCcTJH70gN4YicajrOA==
X-Received: by 2002:a17:907:e98b:b0:b94:1a0b:d79c with SMTP id a640c23a62f3a-b97650e7171mr242015366b.21.1773415679851;
        Fri, 13 Mar 2026 08:27:59 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9781914f96sm6137366b.47.2026.03.13.08.27.57
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 08:27:57 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso18636215e9.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 08:27:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1psA13Py4RarRkRX9jcDa3gMTt1Zg04SPGNbFprEW6IXgsq0ih6EnA5TsYKkEm+rEC9As4mZZl38=@vger.kernel.org
X-Received: by 2002:a05:600c:46d2:b0:485:3c66:e230 with SMTP id
 5b1f17b1804b1-48556728c71mr64114985e9.29.1773415676835; Fri, 13 Mar 2026
 08:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com> <20260312-hardlockup-watchdog-fixes-v2-1-45bd8a0cc7ed@google.com>
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-1-45bd8a0cc7ed@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Mar 2026 08:27:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xq+A2sqNd2bF1zJXNaEZi1v9m+AZAetfy0ofM9G6xR6w@mail.gmail.com>
X-Gm-Features: AaiRm52Y_tc491MI0NbLXfmU6k5QC6OZ87zLKPzjKJsIQ6uNYmgYOZDr71aH41k
Message-ID: <CAD=FV=Xq+A2sqNd2bF1zJXNaEZi1v9m+AZAetfy0ofM9G6xR6w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] watchdog: Return early in watchdog_hardlockup_check()
To: mrungta@google.com
Cc: Petr Mladek <pmladek@suse.com>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Max Kellermann <max.kellermann@ionos.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Florian Delizy <fdelizy@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 12, 2026 at 4:22=E2=80=AFPM Mayank Rungta via B4 Relay
<devnull+mrungta.google.com@kernel.org> wrote:
>
> From: Mayank Rungta <mrungta@google.com>
>
> Invert the `is_hardlockup(cpu)` check in `watchdog_hardlockup_check()`
> to return early when a hardlockup is not detected. This flattens the
> main logic block, reducing the indentation level and making the code
> easier to read and maintain.
>
> This refactoring serves as a preparation patch for future hardlockup
> changes.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  kernel/watchdog.c | 117 +++++++++++++++++++++++++++---------------------=
------
>  1 file changed, 59 insertions(+), 58 deletions(-)
>
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 7d675781bc91..4c5b47495745 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -187,6 +187,8 @@ static void watchdog_hardlockup_kick(void)
>  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
>  {
>         int hardlockup_all_cpu_backtrace;
> +       unsigned int this_cpu;
> +       unsigned long flags;
>
>         if (per_cpu(watchdog_hardlockup_touched, cpu)) {
>                 per_cpu(watchdog_hardlockup_touched, cpu) =3D false;
> @@ -201,74 +203,73 @@ void watchdog_hardlockup_check(unsigned int cpu, st=
ruct pt_regs *regs)
>          * fired multiple times before we overflow'd. If it hasn't
>          * then this is a good indication the cpu is stuck
>          */
> -       if (is_hardlockup(cpu)) {
> -               unsigned int this_cpu =3D smp_processor_id();
> -               unsigned long flags;
> +       if (!is_hardlockup(cpu)) {
> +               per_cpu(watchdog_hardlockup_warned, cpu) =3D false;
> +               return;
> +       }

IMO not worth spinning for, but potentially the
"hardlockup_all_cpu_backtrace" assignment could be moved down below
the new "if" test, since it's not needed if we "early out".

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
