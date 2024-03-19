Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AC374D1
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 22:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710887407; cv=none; b=L4uLuX4/4hi3KeUFB2p9bAtF7fflb2sryBRkyyDNfUjsqrlrvgEQwT1aKDXS18ib7GTEuSIh+lzjc0VZn0ifo6eBmQ/7br1X18Y5+25QpqRi5xeA3UFbno6Eo7AJ4qsr3QMTzfUeetHcbxN0RilLM2vrdReV7Uz5aGZB1ScWEXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710887407; c=relaxed/simple;
	bh=wtbRGprG246JSinZ1zeJ0g2NwwsbkPDYzZmmC7vbRTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3fjfDW0TCXNewgd3CA+WWnxH3YLRYCS7ygN9+PP5ypsnRdeVT3h4dRBCl+ZeE9JGz/AxBoJMFIz+HanBvWpbCE1m8hovE1pWQWQjQ2V8SVXOBeNGH5u2HsoLdKqdziRNK0lO1+uoXvg7vGm88pwuLKCR3UIfn0WZlJUDu9An9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ofVfAAXS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ofVfAAXS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-413f8c8192eso38905e9.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 15:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710887404; x=1711492204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8EtD8zegIhUQWzA/oDS70j+Z9o9c4kykZ4EUai9up0=;
        b=ofVfAAXSVDz8umrvv14pK2V/4/3P3kzsOjuxfKAom8Ki59bDmUAF1ZZeWjIBSUQbKQ
         OfXIJR+vPGDajLBH9qCmNiEbA/7RtRlba9C8M12whYQ7Q67DVEqA9GaoZs0lhuWOpVsn
         inK1zngi7gQ3VUaCl+YdO3Br3OP9NWCD/Hr3L3Y7i6AeaQYmq5ZHTl/gBOsxC5D8xsrA
         UjLIBbcUUEjz+IYZaereQMCv89gJ6b4wMcPFly4nwrKNvTVIH/+kesT7ruQbm4BCG0ON
         Ho93su6n6Xp9Bt+rc1w4GoRvH5It59jwEoy0Cxl4snlxWSL2R+YpWUfjti9Mx8VlOOe1
         WgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710887404; x=1711492204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8EtD8zegIhUQWzA/oDS70j+Z9o9c4kykZ4EUai9up0=;
        b=jKoGu2lxlfLtSIiG9Xsr9bz0CkM8rQGqKgEFLjkpMXp73zGO6uEJVF/2c27xmSQjpr
         s/KJE+4YYbSkgZ6ItqQjNfwnv/89y/MGyo639NpTgAUCjTDHG6riviXEn/RadYkGIXlv
         DvSTmj+me3ji29xR7R3Nw74ZTt/1WP6f8l6aHJYTIgeyzDqCAUIVWkphlOpkdr57VOar
         mYX+U/qumrl5xHfk0DtRRPmkqqVTRcoQZARhK0ou8ygX1MNliOrkLGXyfecjmFFq59GS
         nB82tl/mQyTeFQ4rvKqIIA1zSIfOXVQrrOO2DKDhrQF0wdiksEKCyIlAmNzjtx1uVd0Q
         0kmg==
X-Forwarded-Encrypted: i=1; AJvYcCVxeZu0Xa6lgOk2EJMWAeNEXtWmdrzaxJCg+H9O3pqPd/H9Le6PTVcs/3XSKRjWmfuPzimDyiCFMFGrtXmh5w6An48Yi8VotVIF
X-Gm-Message-State: AOJu0Yyj6v+N11bFaKu2zZD4R0Jr30WtdV1vk6BT9yiu8VZfK0Tn2Eby
	SOR/8ZSmHH0sExdzxMO/MziKE+jGa6u9jxd6HYzyyl5FGZDrXlNd0n035czeHUP2h/4C2Y+sMP7
	eY9fKE3NJPaTOdnwN8hWJlOnA2fBPVu+epVE=
X-Google-Smtp-Source: AGHT+IFnGQzm4jMjcrzDlbzN56akGGgkj3uAyRKTIsnW0UhcIBF+MbiMv0KxT6M+rBMt9Ny+pOt1FU4BU9vpN+72B78=
X-Received: by 2002:a05:600c:3051:b0:414:1ee:f399 with SMTP id
 n17-20020a05600c305100b0041401eef399mr89401wmh.2.1710887404353; Tue, 19 Mar
 2024 15:30:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319130547.4195-1-lakshmi.sowjanya.d@intel.com> <20240319130547.4195-3-lakshmi.sowjanya.d@intel.com>
In-Reply-To: <20240319130547.4195-3-lakshmi.sowjanya.d@intel.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 19 Mar 2024 15:29:51 -0700
Message-ID: <CANDhNCpP6Nd_iYtdgW+RyH1g7c-eyHR+j-LV4gv8rKWu9QkzhQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/11] timekeeping: Add function to convert realtime to
 base clock
To: lakshmi.sowjanya.d@intel.com
Cc: tglx@linutronix.de, giometti@enneenne.com, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, x86@kernel.org, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	andriy.shevchenko@linux.intel.com, eddie.dong@intel.com, 
	christopher.s.hall@intel.com, jesse.brandeburg@intel.com, davem@davemloft.net, 
	alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
	perex@perex.cz, linux-sound@vger.kernel.org, anthony.l.nguyen@intel.com, 
	peter.hilber@opensynergy.com, pandith.n@intel.com, 
	mallikarjunappa.sangannavar@intel.com, subramanian.mohan@intel.com, 
	basavaraj.goudar@intel.com, thejesh.reddy.t.r@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 6:06=E2=80=AFAM <lakshmi.sowjanya.d@intel.com> wrot=
e:
>
> From: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
>
> PPS(Pulse Per Second) generates signals in realtime, but Timed IO
> hardware understands time in base clock reference. Add an interface,
> ktime_real_to_base_clock() to convert realtime to base clock.
>
> Convert the base clock to the system clock using convert_base_to_cs() in
> get_device_system_crosststamp().
>
> Add the helper function timekeeping_clocksource_has_base(), to check
> whether the current clocksource has the same base clock. This will be
> used by Timed IO device to check if the base clock is X86_ART(Always
> Running Timer).
>
> Co-developed-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Co-developed-by: Christopher S. Hall <christopher.s.hall@intel.com>
> Signed-off-by: Christopher S. Hall <christopher.s.hall@intel.com>
> Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
> ---
>  include/linux/timekeeping.h |   6 +++
>  kernel/time/timekeeping.c   | 105 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 109 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
> index 7e50cbd97f86..1b2a4a37bf93 100644
> --- a/include/linux/timekeeping.h
> +++ b/include/linux/timekeeping.h
> @@ -275,12 +275,18 @@ struct system_device_crosststamp {
>   *             timekeeping code to verify comparability of two cycle val=
ues.
>   *             The default ID, CSID_GENERIC, does not identify a specifi=
c
>   *             clocksource.
> + * @nsecs:     @cycles is in nanoseconds.
>   */
>  struct system_counterval_t {
>         u64                     cycles;
>         enum clocksource_ids    cs_id;
> +       bool                    nsecs;

Apologies, this is a bit of an annoying bikeshed request, but maybe
use_nsecs here?
There are plenty of places where nsecs fields hold actual nanoseconds,
so what you have might be easy to misread in the future.

Also, at least in this series, I'm not sure I see where this nsecs
value gets set? Maybe something to split out and add in a separate
patch, where its use is more clear?

> +bool timekeeping_clocksource_has_base(enum clocksource_ids id)
> +{
> +       unsigned int seq;
> +       bool ret;
> +
> +       do {
> +               seq =3D read_seqcount_begin(&tk_core.seq);
> +               ret =3D tk_core.timekeeper.tkr_mono.clock->base ?
> +               tk_core.timekeeper.tkr_mono.clock->base->id =3D=3D id : f=
alse;

Again, bikeshed nit: I know folks like ternaries for conciseness, but
once you've crossed a single line, I'd often prefer to read an if
statement.

thanks
-john
