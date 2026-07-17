Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F334F3C5523
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 10:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283591; cv=none; b=hmSn/e6NEqVAtOLJGe4tBWQeJuq3BOHREsDNTOk/BOP4O1YWg+SMm/Powxi3iO8udz5KuKqH6QjzHL52b3mzgKR7l2jrnsHqH3gYETh9/MNRST0BMU58+H8Ha3YQfm9eh3gVpaAcRt8CcjbtbhA+O9lraBv3Xjir3ptKes3h+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283591; c=relaxed/simple;
	bh=WTBwSCzfzNapDzay6Q5+0rXMJUYMPG+K6f0SRNU7t/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkzCAhQyP+Xw/p8XYnhnTAI9r6lJdlXZPtfTuIfSd966+ht+QarBjBRiXlEXEob2DLhXAqgK3We0a413lLFkbt6UkG8moeRq8310LPRZeU6709BWQSMTN9A/UvxmoZbceNgtqPaXdfcF3MB6dZEP5syIoBlzIi9ErxH0Mgs4ELM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gL2TFDv0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL2TFDv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D702A1F00AC4
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784283589;
	bh=+ZIdzU3OYn1ULV/wr6fGut2Wd0qY1oQ8EGtU5Nudldc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gL2TFDv0f58lGRGZhcw3kYkIw+ImddH0aGGSKaooWOWjpZSpl0XXCHeGhHCZBpxRW
	 ApTgV4/XIFwHkR/rJRk68nO7w4M6Xdg5MzYUJ7eh57Ltys+R2z2w1weMV6uUFHYVL9
	 ESPTQ6JW1mzM4QeJMU5GCbd1zA+QP2Y/Dkq8vcAoLDTcwEddYy6MkuJKE1ILiQVUrc
	 aQZ/BhzR8pzmC9E7bSM/CxdTZhr9N17YWTQiUgVMvSW2MUq3ZjFj5nTwM6SCz7FHz9
	 sJquD9GDXpaW7vDAiri8Pb0OAUwISV1Zdn8kE7fYkZ6o/Oa1e/e1YIl6OaiOOTNK5K
	 fREuDh8GAw2PQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0117dda13so3995107e87.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 03:19:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpeJCKSNToCuiKa4YgIOXz0B7CzJ5w3b1jKKAvewbJYYaL7/ghSCNiGUg6OZm2wiL9YE2+nHE2ShJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWTxTag5NKhEKJtF9ZQ1yEhLbVizNpSqp7gLma7nsB3gpbU5xw
	B6lwO3duKaYI8Q/QjuO3FeUu/l7lp9zMMmmJS/OHaOZYqqXbi60J6cqBtaE3rik4etGuBvb3jwV
	zuCpcUVuwjNhalDse70dFxTNEp9VwmCo=
X-Received: by 2002:ac2:5688:0:b0:5b0:6aea:cd87 with SMTP id
 2adb3069b0e04-5b28f85de5bmr447583e87.18.1784283588298; Fri, 17 Jul 2026
 03:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609145117.1355753-2-u.kleine-koenig@baylibre.com> <aloAhMQE2mWwwzpY@monoceros>
In-Reply-To: <aloAhMQE2mWwwzpY@monoceros>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 17 Jul 2026 12:19:34 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gGjdj1NiCsAPFvG_z9nseXe=Ome_NcWVJCMcFFiDxsrA@mail.gmail.com>
X-Gm-Features: AUfX_mxroqsS1TA510O_1prW4COGMZRu9Ejs9OF4ul4lDzWK0evJAPrhk6Iwb5I
Message-ID: <CAJZ5v0gGjdj1NiCsAPFvG_z9nseXe=Ome_NcWVJCMcFFiDxsrA@mail.gmail.com>
Subject: Re: [PATCH v1] pnp: Documentation improvements
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 12:16=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable=
 Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Tue, Jun 09, 2026 at 04:51:17PM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> >  - Consistently use named initializers and simplify sentinel
> >  - Skip assignment to .driver_data if all are 0
> >  - Use consistent spacing to match Linux coding style
> >  - Fix prototype of probe function
> >  - s/pnp_id/pnp_device_id/
> >  - Drop non-existing .card_id_table
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
>
> Who is supposed to pick up this patch? Is this still in someone's queue
> that I can expect to get some feedback for it? Silent application would
> also be fine to me.
>
> Having said that, the patch still applies fine to next-20260716.

I'll pick it up, but please send it to linux-acpi@vger.kernel.org for
easier processing.

Thanks!
