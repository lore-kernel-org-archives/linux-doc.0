Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A642F90C4
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770153593; cv=none; b=iUB41nf3ufc6NIkjthHPvzClVhv6TISezapXgSExtV0snWRH3BR5yETmTsTQ1tkKKQM4spYGleXbh5qVyi3+E8uIGchSrJ1+A0QxNep31c1jCM61EFvx6pwIvSInt8KtyGvUqfcVb7HBUKIiaBnz4aootngmPr/tBLTPv/fGlyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770153593; c=relaxed/simple;
	bh=utGPEkhMKGkSiwwyZGWFzoQYavLqaML2wkWQSCyQmUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYTB2lKyBHY+U9DXRwfEhGA2ActkAywQ++wFWZHkoJKTJa3qL8kGUNK3Nt5Nombp5/yYxKZHo75GTtp3oMqLmhBAPHg9obcKZN0KvcbeMWJVsNN2kLJBsWuuuN1bugheS+tk0NXrmXyaxkvNnJ3gIhkXASQQtY07Stzw9BYBaNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwKwJtZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwKwJtZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EADC2BC86
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770153593;
	bh=utGPEkhMKGkSiwwyZGWFzoQYavLqaML2wkWQSCyQmUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PwKwJtZz6Hm073k9ybVBlsX5trEGaU8AVDVp745EEB5WbZmlUusi9Puik/xkxdSeB
	 FQBkg/BznwGphf87z/GTNAE3iyWLku2O1+9B7tKjkyDdcvYYpRSyA35PnlduUZoKnX
	 VmE/TRvg+lWZlP3iFgZ+0yWZ0MDFQuC7DV175wPKOw8pTgP+j5H2tnxWQdrLkv8XyN
	 xc4DxS1+oWU14tcNcuJLytmEgjUhxnXGvdBO/klCYT5npaO4Oi/5yH6Gn9kHOqjaqE
	 xoKXxn8yZjbh8FwwvRjjCUu3jiN9+mAH5YOAXSFPMz/SzjDjPptWISa5QFqIvHjxCC
	 x83w6v02p4rXQ==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-669f0b0290fso326925eaf.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 13:19:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+6zR2O98cK+ZQhDMeHPffXexk7KhFdxxWBAT4jvG/nGzGS6uxDYhymTceugiK3NCN0Wi8sm7GTdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDyvDvUjGety23+yvw05Bq+9R/l6Uh8RXq/lfg1TH5yhgri+c
	4nRUgKEC0UhJYPAJC9AzQgfWSvHzuRmn0Al/34K91tQjj4bqDQet6EXe/UPty3FAciWjNSqD1Mu
	gCFw+GaeCRXrdqmGogulBCl0cn/ClEe8=
X-Received: by 2002:a05:6820:138e:b0:663:e8d:ceb with SMTP id
 006d021491bc7-66a22599fdbmr388937eaf.47.1770153592592; Tue, 03 Feb 2026
 13:19:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203093501.1138721-1-tianyaxiong@kylinos.cn>
In-Reply-To: <20260203093501.1138721-1-tianyaxiong@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 3 Feb 2026 22:19:41 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jup72gcP4gdJPjYQebwsMrcWC2u0soqekoTQCR0UDEwA@mail.gmail.com>
X-Gm-Features: AZwV_QjWjKjp4S9Wee-STdk_8ZkmHt_O_EEJULrWSbXHSDNtgIlgLU-CszB1b9E
Message-ID: <CAJZ5v0jup72gcP4gdJPjYQebwsMrcWC2u0soqekoTQCR0UDEwA@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: docs: Update description of rate_limit_us
 default value
To: Yaxiong Tian <tianyaxiong@kylinos.cn>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-pm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 10:35=E2=80=AFAM Yaxiong Tian <tianyaxiong@kylinos.c=
n> wrote:
>
> Due to commit 37c6dccd6837 ("cpufreq: Remove LATENCY_MULTIPLIER")
> updating the acquisition logic of cpufreq_policy_transition_delay_us(),
> the original description of 2ms has become inaccurate.
>
> Therefore, update the description of the default value for
> rate_limit_us from 2ms to 1ms.
>
> Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
> ---
>  Documentation/admin-guide/pm/cpufreq.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/pm/cpufreq.rst b/Documentation/adm=
in-guide/pm/cpufreq.rst
> index 738d7b4dc33a..dbe6d23a5d67 100644
> --- a/Documentation/admin-guide/pm/cpufreq.rst
> +++ b/Documentation/admin-guide/pm/cpufreq.rst
> @@ -439,7 +439,7 @@ This governor exposes only one tunable:
>  ``rate_limit_us``
>         Minimum time (in microseconds) that has to pass between two conse=
cutive
>         runs of governor computations (default: 1.5 times the scaling dri=
ver's
> -       transition latency or the maximum 2ms).
> +       transition latency or 1ms if the driver does not provide a latenc=
y value).
>
>         The purpose of this tunable is to reduce the scheduler context ov=
erhead
>         of the governor which might be excessive without it.
> --

Applied as 6.20/7.0 material, thanks!
