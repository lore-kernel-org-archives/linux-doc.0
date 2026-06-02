Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F27637CD41
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389454; cv=none; b=Gm2Ii/V8zyV/pUaSh3PDwlmrZgdPHi8nPTggA0xypu/TYv3aFlbpz8prCBtRefm1uUq2SZRnJ+71Hxk/5yhw+qBCAJbyOsu7gPzPx4peMjy25lEPOFIJ5gKxeiLO2zyYZrgoNcecBqi9UZVAon/7BBlKw/hQPLz63/9P6kvtc5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389454; c=relaxed/simple;
	bh=poHSp7k/wRwcxK6tvRyRthUfYkyEmfrgLwiq0NjfV98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uurOigBKJffXp76Zzl4owQA2RzWh9j6w/8FSYF1iQEP9RgzpiGov1xJWnS1uu+oOq6Bh4958zH9kRRW5oTKDSuxXn5TNkKZ8J/Pp8EfBd1lFBDLUr+l/mypcYsoH5ZlM1R+vUgA0qOZpJirM53cnTomNkznFN9PiTW9qq4j4X6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jeUbxQvJ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jeUbxQvJ"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8cd45d4b7e2so32751146d6.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 01:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780389452; x=1780994252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2pO+fzMv1bHxu8FRKBOMPKrC8LbuYvxk/rUchVdGVI=;
        b=jeUbxQvJ/56dUDFUH8wUhNrTEc7CXYxx5HkNMydzo8HU1sUAZT0GxYFItawoH0jPps
         9N0jQHiTr++0/Ah1v8mXBDI1h6cjwKhcUnj2vkEMHwiojLnNA6GgJ0B/T4/AvZ2lKVH9
         4khr+j35ZhR9ckfqu8JlVCX63q5Ib+Jpkqguo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389452; x=1780994252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2pO+fzMv1bHxu8FRKBOMPKrC8LbuYvxk/rUchVdGVI=;
        b=lXBnuUkFDhKFdxglAKUarJMxjlNFLYe5COspOjQ0aazDqDGL3xpsIqo7ogRPVGgr+b
         /19xbPTdbkcdXYwlid6Q/DiWQ5/pJmgKkWVTPhBKOeHrhyT9CYquaTwe7UJ2LHHmSyPP
         eYOOaS6Rcw62X7DnQk+kHZQRYBYmt0S0mRYX2ijkWqAwU4/90grb4VXbtyUU2zRFfSIq
         b/sbI3jo/WHFhvjGiSt+3Z97zPZWP5cbbmEx08sM46LAz3GTifmdHn7yfRLuxIOhvCcc
         hIk1LIhj4RrqV7OugBPOSPS5478tnYR074rIVerqTCs9idvsb0Y7QBCZkNyIg4KwhTIl
         hwqg==
X-Forwarded-Encrypted: i=1; AFNElJ+PiiTLfwQfkreu/7BkAYZClZdY7mnvnXBirUyl8oaQELDlJF5LAl1P6jXIKaOjc9bAiO67mdHd8ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyalTbY64QozbfZup/X+UUPWQCBNuhv4DCpIaV9jBEngUNww0L8
	61SZJmg3hK+S7gIefVTpN+BqlFH8RbDjF6d1YyaZYhONmpsHPhJUL3E0F29LkS9jTxZ9jfYqHpJ
	6TR0XaA==
X-Gm-Gg: Acq92OHyRVO1kRyCA5Q9OLMwjNE/HLxcrGpXVMf7ygGs4UphONIaH5GTXtRN0lICPRC
	7YDRfqiRw0H3C7mvfnAWwYD5QRFoHHvCgiaPK924rk3BGhlJu7pYJuVFNnzllaosG7NSTSY3Jss
	OUFaXE9mQr98V2UMPqb/QzAkBpUNSknUNtvJ9oYXU+DU5OUno5+5UA2Hup0cBZAq8gMduW6mY2N
	MhQElXOv85fsf9+hVHX2fmZmx22Sv7AZw6UvrblBydwnIA3Ry7NZEOoJ/eRw3ofQLxityJLvARN
	R91FdYnhmAYTm9o1t+j2CS48n/Cc7eqMQk2NqORg4oHov4CvtyYffOEg9EPn8l7AXS4FlsETGtV
	8shwJ9M2sCvjCG1B6uqypyErPCPtBzm0clnvy0aVvGFqBINNJdLK9vey3CWkZAP3PyOT8xhkrxf
	ouOZ4uqKn/yJzszI5r33On3edYGfx3gB9IKlIQ5M5Wloy63Y1SKpItiZR0CkCL7g0wqZarT4glW
	Dzk7DwaLYI=
X-Received: by 2002:a05:6214:3012:b0:8ae:5fcc:8069 with SMTP id 6a1803df08f44-8ccefd8d53amr253818116d6.22.1780389452064;
        Tue, 02 Jun 2026 01:37:32 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea042bb5sm114908786d6.8.2026.06.02.01.37.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 01:37:31 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e61648f10so2471cf.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 01:37:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ahQecOUe7ZV6NXNGbNPr/rUW6mytPuhOWDGQZqLvz07y51QT9KIeSVs6MMMxlkMMOU/NB7mYyqDI=@vger.kernel.org
X-Received: by 2002:ac8:7209:0:b0:516:4f62:85e7 with SMTP id
 d75a77b69052e-517670f60e6mr7875761cf.18.1780389450588; Tue, 02 Jun 2026
 01:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528103215.505795-1-tzungbi@kernel.org> <CAJZ5v0gc7AtOjWd+cg6tFgzPBovu=wmYmavjaRRjTdNNd8q-0g@mail.gmail.com>
 <ah47N8Ng9zfcASmk@google.com>
In-Reply-To: <ah47N8Ng9zfcASmk@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 2 Jun 2026 17:37:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Drvq0iPAb2Ly=K7WLOmbRAcLY4TzZxHmhzarK4cvx1xA@mail.gmail.com>
X-Gm-Features: AVHnY4IK1BCekzEUvFQ7W25XhRgP5hRYDeCrICdpzLPF12YauXFtWy2YZIHikXM
Message-ID: <CAAFQd5Drvq0iPAb2Ly=K7WLOmbRAcLY4TzZxHmhzarK4cvx1xA@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Allow disabling DPM watchdog by default
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 11:09=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jun 01, 2026 at 08:39:42PM +0200, Rafael J. Wysocki wrote:
> > On Thu, May 28, 2026 at 12:32=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.=
org> wrote:
> > > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > > index e1b550664bab..4f92905f3edf 100644
> > > --- a/drivers/base/power/main.c
> > > +++ b/drivers/base/power/main.c
> > > @@ -527,6 +527,20 @@ module_param(dpm_watchdog_all_cpu_backtrace, boo=
l, 0644);
> > >  MODULE_PARM_DESC(dpm_watchdog_all_cpu_backtrace,
> > >                  "Backtrace all CPUs on DPM watchdog timeout");
> > >
> > > +#ifdef CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED
> > > +static unsigned int __read_mostly dpm_watchdog_enabled =3D 1;
> > > +#else
> > > +static unsigned int __read_mostly dpm_watchdog_enabled;
> > > +#endif
> > > +
> > > +static int __init dpm_watchdog_setup(char *str)
> > > +{
> > > +       if (kstrtouint(str, 0, &dpm_watchdog_enabled) =3D=3D 0)
> > > +               return 1;
> > > +       return 0;
> > > +}
> > > +__setup("dpm_watchdog_enabled=3D", dpm_watchdog_setup);
> >
> > You might as well use a module parameter to allow this to be set or
> > clear at run time.  Is there a particular reason why you only want it
> > to be enabled or disabled via the kernel command line?
>
> Thanks for the suggestion.  Mainly because in our use cases, we only need
> to set it once at boot time.
>
> Also, I was wondering if we need to consider potential races if the flag
> can be set at runtime.  E.g.:
> 1) The flag is set.
> 2) dpm_watchdog_set() is called and the timer is started.
> 3) The flag is then unset.
> 4) The subsequent dpm_watchdog_clear() isn't stop the timer.
>
> Given this, would you still suggest providing the module parameter for
> completeness?

Would that lead to anything bad, though? If I'm remembering correctly,
would that mean that any already ongoing PM operations would still be
subject to the timer, but not any new ones.

My suggestion would also be to actually make the timeout and warning
timeout configurable at runtime.

Best,
Tomasz

>
> >
> > > +
> > >  /**
> > >   * dpm_watchdog_handler - Driver suspend / resume watchdog handler.
> > >   * @t: The timer that PM watchdog depends on.
> > > @@ -570,6 +584,9 @@ static void dpm_watchdog_set(struct dpm_watchdog =
*wd, struct device *dev)
> > >  {
> > >         struct timer_list *timer =3D &wd->timer;
> > >
> > > +       if (!dpm_watchdog_enabled)
> > > +               return;
> > > +
> > >         wd->dev =3D dev;
> > >         wd->tsk =3D current;
> > >         wd->fatal =3D CONFIG_DPM_WATCHDOG_TIMEOUT =3D=3D CONFIG_DPM_W=
ATCHDOG_WARNING_TIMEOUT;
> > > @@ -588,6 +605,9 @@ static void dpm_watchdog_clear(struct dpm_watchdo=
g *wd)
> > >  {
> > >         struct timer_list *timer =3D &wd->timer;
> > >
> > > +       if (!dpm_watchdog_enabled)
> > > +               return;
> > > +
> > >         timer_delete_sync(timer);
> > >         timer_destroy_on_stack(timer);
> > >  }
