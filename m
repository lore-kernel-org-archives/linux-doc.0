Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671483C76A1
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405081; cv=none; b=pvMjUUM6j5eYhN+1PT+5pcmrMRbr/LNz7KPPttciJ42uMUYLpDvUo2VVBWqkKUu8SHzL3vjPS227DtFpxHm4p7J5ys7viDbNzR6Q/GVqG1wrv3Q6drU2BAOB7lVWtAhXuN18eWY/tkmYQpxBupOczOkDA6/b9f2yjhEbzY8xGnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405081; c=relaxed/simple;
	bh=g3EsPEeclboffoN4RYwwMYX1oGuyBaS6O6dpSTTXey0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIIKHXfuxphmUVJJBWfDKgni3GTWuJDDWMQYtSjRhNmnQ5A7AXz/v3z5QiD3piKIG3W7M7yhlbbLKPPfAXDDnSbAakRrN5zFU6KASZEqyEEBp3nTgxR7WcET9cDfzAbHdypr1UeeUagGD7IaqyddzcG4Jg73sMmdaLmrDmosahE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FDQP7dW4; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FDQP7dW4"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so67307136d6.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780405079; x=1781009879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dnOAmoRyxNthicf1c6w62nXUJx2BXxcSG3avUHO1yI=;
        b=FDQP7dW478FyUpP3koXGhp+ZsyTKykWSywDABokGdeAQx+wL/iihFrK0ouaMKTaU+L
         zHSin3ZPD3UEx7DmcIWzitjxKEnZLteIuoCA+rS6I1J8+7nb6TYwijBBvZbLeuGeOhL4
         PpNFOjwdHllL+SW28qC8DCgAao6B8mvkW2NeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405079; x=1781009879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dnOAmoRyxNthicf1c6w62nXUJx2BXxcSG3avUHO1yI=;
        b=Y836YJfV5F6AR2NKJbpYDQc8VkqK8CWHYm195YIhv5+JwLni0JNF6JB9pPzN85H2+c
         tYD90Hf6TsGWLRnUFCL0IRUjylC3NF6Wzz/F09xL2Um9vB9jhNc9EXWQAZr8R+CvwvCd
         u5YHWIe1z7UnBLuUoBosSG+2K1sDHBtsoHzFHdlIxxIVoW8iTt9Jeb4fQNyHFHdEkrRn
         6FbpmQh/6MYCLu8kDHcPmL7M+yJm3260AGqurmZXDEPatZsfQYFa9H//7W8k4BrfoLOr
         4+wbJ1MuDgkaJ29+NQ5sS/g7Z0BUCwNA0wSsCOGl8QQjNwuph23KXx3K1op5ufT22zEt
         rv7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8p6u5LN9XIbQ29TMwFvZct7b5brSbau5WreABYI1YYS306zEOQm//C/tnJ6fUh4sajXaLysaiPuVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YykXs5OIs/imNN+2kTdmp6S6v6mdpMM9y+yHFWEVO6oonSmOi+6
	6hoTBN1+4i3BxNhLBYdvNHUe92OoAKzGgDjGt8cSIPZ93JAZogvUh4Mn7hWK5AbNnXy/+s7832g
	V7WYjQA==
X-Gm-Gg: Acq92OEJ+uIduxfK8kHCnV17FhSNCkObri0sx+ymy+AsJnZ6Vozuo4EWT2wCJTPjE4i
	t3V1xpZDCMdauQdYTdSlB8covZ759hxIZN+68PJlhuSvF47kNaTAY03lHp7cx7RSKqWbgLmS6VZ
	cBVMH1xZapc7mm4OG1/5sZztd05yEOxvGZUKmehl2giN6QCtT4V6cbAicaOzVmBRfUC9oNusbg4
	iegc5M7Mc2hqpVLZgMiU8uQfEIfIWO8EqkIflIZLgMqjBBjNKvVIQk7i9epn2KUHnVVEUc4JUwB
	Im7Dkp/3N/w8xb5oOHqLFJCMEYCMVvkvlKZLGFCRUikdya+FRgpXJHgYQHGt6/QbfOdFtvtKx6a
	03N07PPdYobkeQ8lvL6NSAzXQLQ+xtwyto2R8BDwA2cacG3u5S0mt0TwrmS09HNJeottG8M6kTz
	IQ55Dy5d01QtHbg5VOXViCk4xF7Js3Xv/uSWKhKDeoHD14JPicQs95FUg+BYalzIpMTdkRKsbC
X-Received: by 2002:a0c:e092:0:b0:8cc:f175:3ac4 with SMTP id 6a1803df08f44-8ccf1753c73mr228337926d6.43.1780405079410;
        Tue, 02 Jun 2026 05:57:59 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cce9e2da3esm117566116d6.0.2026.06.02.05.57.58
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:57:58 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51765531803so4971cf.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 05:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+CdvfU5wLEgBkPc4xYBiwmsidJ1Yyd5SuAe092suVaQm9doxoNDJ8ZEtcVLZ7gYucSVp6GKcbp3kY=@vger.kernel.org
X-Received: by 2002:a05:622a:568d:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5176aa0bfc0mr7185061cf.5.1780405077197; Tue, 02 Jun 2026
 05:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528103215.505795-1-tzungbi@kernel.org> <CAJZ5v0gc7AtOjWd+cg6tFgzPBovu=wmYmavjaRRjTdNNd8q-0g@mail.gmail.com>
 <ah47N8Ng9zfcASmk@google.com> <CAAFQd5Drvq0iPAb2Ly=K7WLOmbRAcLY4TzZxHmhzarK4cvx1xA@mail.gmail.com>
 <ah607VQjZeVKqOP0@google.com>
In-Reply-To: <ah607VQjZeVKqOP0@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 2 Jun 2026 21:57:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A-b0_de2RenHER-U8jHB+oX1HCjdwOe97KXrnAvZDaaQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jg3-atKcicTbx0VLmhOWxiVCwzSMZnJZPxPioqRbNAthQJ4WJBPWSyNbI
Message-ID: <CAAFQd5A-b0_de2RenHER-U8jHB+oX1HCjdwOe97KXrnAvZDaaQ@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Allow disabling DPM watchdog by default
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 7:48=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Tue, Jun 02, 2026 at 05:37:13PM +0900, Tomasz Figa wrote:
> > On Tue, Jun 2, 2026 at 11:09=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Mon, Jun 01, 2026 at 08:39:42PM +0200, Rafael J. Wysocki wrote:
> > > > On Thu, May 28, 2026 at 12:32=E2=80=AFPM Tzung-Bi Shih <tzungbi@ker=
nel.org> wrote:
> > > > > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.=
c
> > > > > index e1b550664bab..4f92905f3edf 100644
> > > > > --- a/drivers/base/power/main.c
> > > > > +++ b/drivers/base/power/main.c
> > > > > @@ -527,6 +527,20 @@ module_param(dpm_watchdog_all_cpu_backtrace,=
 bool, 0644);
> > > > >  MODULE_PARM_DESC(dpm_watchdog_all_cpu_backtrace,
> > > > >                  "Backtrace all CPUs on DPM watchdog timeout");
> > > > >
> > > > > +#ifdef CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED
> > > > > +static unsigned int __read_mostly dpm_watchdog_enabled =3D 1;
> > > > > +#else
> > > > > +static unsigned int __read_mostly dpm_watchdog_enabled;
> > > > > +#endif
> > > > > +
> > > > > +static int __init dpm_watchdog_setup(char *str)
> > > > > +{
> > > > > +       if (kstrtouint(str, 0, &dpm_watchdog_enabled) =3D=3D 0)
> > > > > +               return 1;
> > > > > +       return 0;
> > > > > +}
> > > > > +__setup("dpm_watchdog_enabled=3D", dpm_watchdog_setup);
> > > >
> > > > You might as well use a module parameter to allow this to be set or
> > > > clear at run time.  Is there a particular reason why you only want =
it
> > > > to be enabled or disabled via the kernel command line?
> > >
> > > Thanks for the suggestion.  Mainly because in our use cases, we only =
need
> > > to set it once at boot time.
> > >
> > > Also, I was wondering if we need to consider potential races if the f=
lag
> > > can be set at runtime.  E.g.:
> > > 1) The flag is set.
> > > 2) dpm_watchdog_set() is called and the timer is started.
> > > 3) The flag is then unset.
> > > 4) The subsequent dpm_watchdog_clear() isn't stop the timer.
> > >
> > > Given this, would you still suggest providing the module parameter fo=
r
> > > completeness?
> >
> > Would that lead to anything bad, though? If I'm remembering correctly,
> > would that mean that any already ongoing PM operations would still be
> > subject to the timer, but not any new ones.
>
> I was overthinking the race.  All userspace programs should be frozen whe=
n
> the DPM watchdog is active.  The race I was concerned about isn't possibl=
e.

Right. Somehow I was convinced that the DPM watchdog is also used for
runtime PM, but after checking the code it doesn't look like so.

>
> Would you still suggest providing the module parameter for completeness?

I'd also vote for a module parameter. Being able to toggle this at
runtime would be useful for troubleshooting problems without needing
to change the command line arguments (which isn't trivial on some
systems).

>
> >
> > My suggestion would also be to actually make the timeout and warning
> > timeout configurable at runtime.
>
> I'm working on that and I think that should be in a separate patch.

Great, thanks. I'll leave the splitting and other logistics to the maintain=
ers.

Best,
Tomasz
