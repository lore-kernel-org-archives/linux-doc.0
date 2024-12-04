Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C725202C4F
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 23:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733353666; cv=none; b=Tvi/BbGe5xOG3K7J2K0cW6ZzSfKPhccq/BcpFoD9VxrlP8VHONHAR/L7GEoZUbwCZOezc9cqAr4cv9+CKkUigPt2ET7cljigDTU/RxfCiuOD6kKaEIAGQ4tX0PU/0Mi9loRPM0W1Oq1IO9Q2yhQBg/92TLnAsrk5QDdhFh1ghCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733353666; c=relaxed/simple;
	bh=dp6g/Bz2+KGQRtp1f56uI+qAkNeYW1oxVHGPNZWp3Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/PQ6hKaI14SPyIXlYrcRqurqqEWpK7YX3Z5dFBURaY4qoRZX48a6wcTwAp2cKUzhfOPUu5uBdiXcQXZq/enTxosGGRf5YGcwCK0Pub8sQm6PaxJh4Wa87Ik4tT76CbgOAd6rPcqpd/rCcAwKmIKThVff4HVTN/ohxSqXhisQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BkA4YIg3; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BkA4YIg3"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e203d77a9so316076e87.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 15:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733353661; x=1733958461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=;
        b=BkA4YIg3k16PdfIpiJdFMKg0jhpxajxcV8CdDwVIE35bknfmYcIlPUZstY6k0c5tmp
         BXvoP9pYen1WcHaUhvXZABcMP/su6GRLfblHbi6LA8nBlWpmmy1JsZNIFswFF/3eBFEz
         2GvpztQiU7TlfVY5NVPeVx4PwrIjPFxVBSSKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733353661; x=1733958461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=;
        b=q+ZeBTPTEZZ6ae7jeBQ0OIsZ3ywo1axBIbX30SieiK662eeyZcWtDflNbWE5EojfDN
         491lPAlMs2OyvVOSO5xtm2yToafIkc8V5ZKfy/QW3TAZ50HXtNTcH8LT2gqcMqQcX83I
         blsrqTkzI3Hn2xrCAFLjbuykasZU4p7t8Ays7O/dqWSWqUuPOwGq5+Sm2i4pUQj/43Wx
         quZW7OwMj/laJEvo17uBRQp+/N+TJnlSo9BPjP27F802shrhxZ1zo8PZO1FE83fB+nqZ
         WheOGUrHGWg5wfLXEUbiRQrJONwFInaaqZYCaT/rJ1oYUMCVuHOc/XXlUvw75FEFiWsD
         U+Vw==
X-Gm-Message-State: AOJu0YzuDj5BTDXyMkZnENuxdMeVkR+5vwMxfg1Yc4E1IrdVHVwyd50Z
	0nR/7TqzoxPkNdHtP8gyvsDkPI7ObCkMXmLIokBWTGOFDmccl+cxMSbuLhIl4b18rzGDYGMWM7Z
	t5yon
X-Gm-Gg: ASbGnctRhCOFIelonG9S1Cxl8YDj6mUtWhR5xYLBZLgljoLZ3tj6QYWGKRPoLMs+O04
	MmqPxtsD7gtAzYa6iOVjwzzoSfpa8LBqz9Z3WrIRgGzCiOvtbHfTH3+p7NnkmOcQkCnft4NwD5Z
	U/LqZqT7lkCZOJ7BkBK0AxnzTk6HET1QQb44dgoAV37FsqelhbR060Mw7uNFLJe3FFEhwcQ0DAZ
	/rVZ80e0cUaSogh6ahfqAWax/J65hDOVFio5l30NR+Al9Pi3iozN7+8xx55S/jzBgJKd0HAzwOR
	4Fe8sMmaCYzD8g==
X-Google-Smtp-Source: AGHT+IFmx7NpDfaiX2dPyXgDgHSOhl0UtmGUIzfZtJPoIYvs5gE+vz8RkDk6Eyry7eyzbm3xW8CjCw==
X-Received: by 2002:a05:6512:b9c:b0:53d:f716:1e4d with SMTP id 2adb3069b0e04-53e216fb0damr342900e87.7.1733353661012;
        Wed, 04 Dec 2024 15:07:41 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22947b40sm31257e87.50.2024.12.04.15.07.39
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 15:07:39 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e203d77a9so316046e87.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 15:07:39 -0800 (PST)
X-Received: by 2002:a05:6512:2392:b0:53d:f73c:d630 with SMTP id
 2adb3069b0e04-53e21702ca6mr365280e87.14.1733353659083; Wed, 04 Dec 2024
 15:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204221720.66146-1-rdunlap@infradead.org>
In-Reply-To: <20241204221720.66146-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 15:07:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Message-ID: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to process/debugging/
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Jonathan Corbet <corbet@lwn.net>, 
	workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <danielt@kernel.org>, linux-debuggers@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 2:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: workflows@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-debuggers@vger.kernel.org
> Cc: kgdb-bugreport@lists.sourceforge.net
> ---
>  Documentation/dev-tools/index.rst                                       =
| 2 --
>  Documentation/{dev-tools =3D> process/debugging}/gdb-kernel-debugging.rs=
t | 0

After applying your patch and doing `git grep
gdb-kernel-debugging.rst`, I still see several references to the old
location. Those should be updated as part of this patch, right?



>  Documentation/process/debugging/index.rst                               =
| 2 ++
>  Documentation/{dev-tools =3D> process/debugging}/kgdb.rst               =
  | 0

Similarly `git grep kgdb.rst` still has several references to the old locat=
ion.

>  MAINTAINERS                                                             =
| 2 +-
>  5 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/=
index.rst
> index 3c0ac08b2709..c1e73e75f551 100644
> --- a/Documentation/dev-tools/index.rst
> +++ b/Documentation/dev-tools/index.rst
> @@ -27,8 +27,6 @@ Documentation/dev-tools/testing-overview.rst
>     kmemleak
>     kcsan
>     kfence
> -   gdb-kernel-debugging
> -   kgdb
>     kselftest
>     kunit/index
>     ktap
> diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documenta=
tion/process/debugging/gdb-kernel-debugging.rst
> similarity index 100%
> rename from Documentation/dev-tools/gdb-kernel-debugging.rst
> rename to Documentation/process/debugging/gdb-kernel-debugging.rst
> diff --git a/Documentation/process/debugging/index.rst b/Documentation/pr=
ocess/debugging/index.rst
> index f6e4a00dfee3..bc4a816e3d32 100644
> --- a/Documentation/process/debugging/index.rst
> +++ b/Documentation/process/debugging/index.rst
> @@ -12,6 +12,8 @@ general guides
>
>     driver_development_debugging_guide
>     userspace_debugging_guide
> +   gdb-kernel-debugging
> +   kgdb

Should the list above be kept alphabetical. The list you removed these
entries from was _almost_ alphabetical...
