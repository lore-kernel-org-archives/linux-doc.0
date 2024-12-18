Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D96E158D6A;
	Wed, 18 Dec 2024 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734541866; cv=none; b=LKDYTt44gwqNwWR60aN4TseEDzzAy6L9I0q/cmF8CqbPTcY4zoeHAV8HzEgG9nqEAONXZdTwDWgwdy2452E7Y1JdrJI3YDZMHwiRQP5JQgz2DpjV+Rf+xFjPCKqJJf2eYS/gmlYefv8oE1QjKODcmAyyq2aEPD/2w/WmMLcnh5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734541866; c=relaxed/simple;
	bh=crE+eF0tyjKxTBiLGc7xddKdxX+kh39aobItX+x3ac0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EkAVWgurz3C8FJcu9hTnL1Qxkeg8K2uvz6cEbdg0jrQgeKxqFxtEymbKNiotixgE2w4Tj5RYPRLPyyZiJjUVc78pLdB2+mDSxigD3BZ788OpnN+bX1/MHsRqKHEpYTuuKM3KhWLr73pn4adumHTJGfzrQ9Cj9rF2XpBDsfhBzAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=po5jpVme; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="po5jpVme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AABDC4CED0;
	Wed, 18 Dec 2024 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734541866;
	bh=crE+eF0tyjKxTBiLGc7xddKdxX+kh39aobItX+x3ac0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=po5jpVmeKIb4irmzabIDj0hcSnY29mnweVOFxu2omfWYTQ98u92lyzONnlKhEOo1i
	 d5K9JoZPZKA4iugzZDbaL0dT3z+Rc83D/a+/fWn4TcXQZ6vU+tuO33Irfqe061YGL2
	 3NmLiftKiLRS9Zz4QNr0SR3Zhv/qR3q1Riluur99QlBkXVYboF12ZtD7gQPsWhOFSe
	 hrULn3kdzyPYEVUlNxzBt11eMB9Ul885rk9eEbdH2LYvidVvBVjplgt3TuUoNLpY5o
	 nbGjfVPgTVjVmKFv0M8BgHinfHIJNCmJ5vrf99Ko7C9Rn6PLBUxOeU1WyE4v38KUMw
	 OIy7JuBGf7avQ==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e479e529ebcso3345926276.3;
        Wed, 18 Dec 2024 09:11:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2dBgKEKqVCjcoMl1p4r8OrdBaHpvHF/62zkO7YC9V6/gBouQaa8gvAUKgtXNfiCeL/ox5UWyg1TFv7Aud@vger.kernel.org, AJvYcCVQnDqaqE4FfcWZ0nQ1+JaM++RZxvnWGdCSfaDmUTPPBCJ6L7mI0ypm8dlfBGnow91DRLejkq+JJAPz@vger.kernel.org, AJvYcCXSRPpTvkekmuxTmCJKoo0OG46bJwbLrbTwWWjPCc8/POYm/KLZTx51VqRDbpoiJ9SR4h0DsGoYNX+x@vger.kernel.org
X-Gm-Message-State: AOJu0YwqHWTvjxNK55iKnWd7yAtzjXthQbn5wbyd59+0L14gbl7UtMlF
	2b4aG4IViUzAD0ZxckjHqxW4dNdi8g4mzDHgIsbwJUQEWgSqcAfBaKAcVaLi7PkXeQakom5iInc
	Xq5892jH9bHkuWP6dNxMn29RAJg==
X-Google-Smtp-Source: AGHT+IEcgOXhMZEwR4KcSksXbthL1TOO9Ig9DzmHACBwaxdBymWQu+0clFk/TYA4/QAI1CqHDp2TJ2+gCpeLMl0W79Y=
X-Received: by 2002:a05:6902:2581:b0:e4c:b42e:1508 with SMTP id
 3f1490d57ef6-e536222be52mr2971077276.36.1734541865307; Wed, 18 Dec 2024
 09:11:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217183711.2525863-1-robh@kernel.org> <Z2KzcORZocQAwAi9@pathway.suse.cz>
In-Reply-To: <Z2KzcORZocQAwAi9@pathway.suse.cz>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Dec 2024 11:10:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKRpeCgd=6PeHMHnZaJHqn2SAob2J6Yv07n7OdCY++GWA@mail.gmail.com>
Message-ID: <CAL_JsqKRpeCgd=6PeHMHnZaJHqn2SAob2J6Yv07n7OdCY++GWA@mail.gmail.com>
Subject: Re: ssize_t: was: Re: [PATCH] of: Add printf '%pOFm' for generating modalias
To: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Saravana Kannan <saravanak@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 5:35=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Tue 2024-12-17 12:37:09, Rob Herring (Arm) wrote:
> > The callers for of_modalias() generally need the module alias as part o=
f
> > some larger string. That results in some error prone manipulation of th=
e
> > buffer prepend/append the module alias string. In fact,
> > of_device_uevent_modalias() has several issues. First, it's off by one
> > too few characters in utilization of the full buffer. Second, the error
> > paths leave OF_MODALIAS with a truncated value when in the end nothing
> > should be added to the buffer. It is also fragile because it needs
> > internal details of struct kobj_uevent_env. add_uevent_var() really
> > wants to write the env variable and value in one shot which would need
> > either a temporary buffer for value or a format specifier.
> >
> > Fix these issues by adding a new printf format specifier, "%pOFm". With
> > the format specifier in place, simplify all the callers of
> > of_modalias(). of_modalias() can also be simplified with vsprintf()
> > being the only caller as it avoids the error conditions.
> >
> > --- a/drivers/of/module.c
> > +++ b/drivers/of/module.c
> > @@ -8,21 +8,14 @@
> >  #include <linux/slab.h>
> >  #include <linux/string.h>
> >
> > -ssize_t of_modalias(const struct device_node *np, char *str, ssize_t l=
en)
> > +/* Do not use directly, use %pOFm format specifier instead */
> > +size_t of_modalias(const struct device_node *np, char *str, size_t len=
)
>
> We should keep ssize_t.

My intent was to align of_modalias() with snprintf()...

> "end - buf" passed from device_node_string() in vprintf.c might be
> negative. The "buf" pointer is used to count the number of characters
> which might be written when the buffer is big enough.

Isn't Rasmus' suggestion sufficient?:

buf +=3D of_modalias(dn, buf, buf < end ? end - buf : 0)

Rob
