Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD64F3D301F
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198227; cv=pass; b=fFSy765cJKG0aEZyRKUy2/prSjhfr+LlHvTk7o4BSkGLO7DEdxbfnWp3TVOMJKPkOIqoFor9SypeOT6pAAE9Bx07dCleYHcUWBoKc/i0bFaK9nsAfMkU+lSspk8aj1FpzxI1ByIqRnHU+9GdwpE1YY5FoM6zbAR5oAvEDfQGS8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198227; c=relaxed/simple;
	bh=C5HdZMd3V/zpNuhFOrkwdljn7AwYQiF19c8FeGsvyvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VuZb7OHKeZJcVNhYqzPWw4ZAzOqBxRk2j4GeClxf5EKak+4hmgbmiEDdmBmV/ImPX8AVUai96dtCQSKGVC+uzwP9sy1ItYfAR7aBLmi9NymOYEdUk6NxRvi4q9+257dTp6Vwobw0O9ZtDLNnIRVXtRW7xYhAi64jPjNlvpxI+k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lwg3Xy5l; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lwg3Xy5l"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-52faa58bff5so30251cf.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 14:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790198223; cv=none;
        d=google.com; s=arc-20260327;
        b=XOq9TwP28mDfdz4MQYFsE7rV4eQqkWPpKlz+YI26KS7sZCC6rjrYPoxw8nNP1b94Ys
         npWFG3FRYbcb722f9zdgTAu/O5gD6ttvh5I8bSzKUwkurmuOKeiLgOx7cN8g4k3aMy5i
         vSaF5CXD/VNYmWe/KA7VwgbvXmc163dwUZGPvgBd1Oag4teqFt6FSXMRBIEVkWCXuV4s
         kz+AqFLggngHuapA35txYITd9gf1hCKp4EyrPFdPjjj79fLVqCufJmuvu2sRQ/5DsrVa
         eOz5c3x2svB+HmL33AwFkPkU+Sr90/xh5M4fSyx/rIEH2caq3KCYwKxpTQl81/mLYjLA
         J4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C5HdZMd3V/zpNuhFOrkwdljn7AwYQiF19c8FeGsvyvw=;
        fh=7ibUq1O3XREsUR1g7UUVMxwGRrJKOhKIPv71s9J2OeA=;
        b=GdXPVJu7s9ywi/FKUDp9xTuEnzm1HbqA4WOjhH/Ru9exBYn02XyX0FcpKKIAx6BytC
         PE6hODslS9dLkvpMdgODSBeEAgmgI5Krdh1mWqJs1EpQCozqT63SqnBY5BHXDfFhDbjW
         mP3+5yklwe51hLyl0YkmQQjmyZDLS3CbWoC0FimcQDCsOE0XUPtf+tIaz+FMxyPyCP2J
         A6GSJQ+FaZVyLiCjw//X1Uc53LCDA5qEj1SJGBQ2Fmlfjp+KpdBD3CEDT0olkCZoEUNF
         jX2aH2E8CuECj6/6Zm61Dwz7WR6OxuAaWoF0zqDs3dg+NTCWeB0ph4Nkwy3lsToWAKpp
         thuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790198223; x=1790803023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5HdZMd3V/zpNuhFOrkwdljn7AwYQiF19c8FeGsvyvw=;
        b=Lwg3Xy5lYMDf90jqn3ho9Cam0aqsJDBQACJYsyoKflvSObThj1DoiY/uZgx9SNYj+4
         YIODlNKf9WQJFgL0PAjRd8AswuDTSD6xxP96FIJzfSN4Rtbx7b3uFYsF4mtwI2NC62eV
         LatlIWM3bxugwqGH2aUgkqvIcxHyVj8ylNeBb/EAZV5PzLOJLkPQAjO55OyRRpJYBg0C
         FlpEfNZaZQwfP4uzyUPqKQlFvsue5GRrjYPqneT73mooODy+NgbE1+Wf3UF/ult/Bvfs
         066QfO/a40z0pz5D4KFkmPrumHvyacTwi7YqKW1K1VYT2Dz0es47IBXazjVacuUAdbur
         IfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198223; x=1790803023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5HdZMd3V/zpNuhFOrkwdljn7AwYQiF19c8FeGsvyvw=;
        b=uozroIzMLiju8NLLJMPSxlGIsvQyZh5j87nw+XYFnfGkj/SFSZLRu0HkJPL5XM557P
         vwJSe7HNm8QdaXEeJJOQvRlGoe/O8x0gOSWpZaKtO658mcnLS8IGhoMS74b+tyeUMFFw
         nZP8SdDTfZBrbz+X8dgTp+9FCtdWcKmCMgcWYYbm2NVe1/VdJiWeQV9pShBUJ009Ealr
         OZR0senxdh59/fgD94xE+IvNJZ0GBpkrdxCynFjj52hsPc3l7yQoEr60HQU29Cu3bqKb
         sjKnKSiguGWoI9v76o/DDPDGFFAB9ta6cLqANp/vMXhlXQvDaCwH25Os95yXDoBEZ2DC
         29nA==
X-Forwarded-Encrypted: i=1; AKwUvBzbCKmnW5r1x6niSnXiNrj5egEdwynVQpBgUXssQ2Hfba5Th6cSnBBbys0sufr5KCJY9KDWpVZTwIg=@vger.kernel.org
X-Gm-Message-State: AFuF++kEr153SijuoAQQ1sCo/bo4+jZ3q3UQTL52vBaWN5aLr6i3wDEl
	JlH2kGgsggwcUZ2etQ4LzrxAwxZ8krbGniIcjc2o9JS35w6xgWzqlGpflMergo2Dqj6bl6R0px/
	CjNfZ01JIUzOXcf4yjKNSJEp4reU4DslDR8nz7lMDht3etkPZQHyscqkj
X-Gm-Gg: AYBFou1jqjTMy0PRgekG5oP9iOKd/DNBW/Y4kWmZG2DXV0DSHevkcVw9ibutAjMd2MT
	2Qtw1TyUSs/cWR5xA23TmDgdg4ZEa1GLzVmmUuN5eHAve+yifWeT2syBiyr3iMeCB/0mLgqp7jl
	3bLqEBnPAAWk6Rr6cOAMioOGU5mVV2FWOGYADiDglANTs1kzxiY5EoUU/MEKEPK1iIbjomTiosA
	/JJwlgRAyEXYZKEUs80NpkrII9s5BS4OGz5UpgqVevRPlRQYsR8iYjrUTxKaIElssuIcOw7ySZE
	pDwgrvtsoOtL90zaly+54lEOliKyChPdK7wOhrshzgPq9cbiFx3X6CTk4g+ZcY9CXfCTdoGS1AF
	3B3hzjCL5Cg==
X-Received: by 2002:a05:622a:2ca:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-532f900c602mr5083471cf.14.1790198222132; Wed, 23 Sep 2026
 14:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923090429.2026529-1-stian@itx.no> <CAP-5=fW4bzmy5_6a-8YucOy7JGKg+izRbq+7TaOGKV5aG0oYcw@mail.gmail.com>
 <4927bb40f34ec6d3d5591dabba755452bd6b4a39.camel@itx.no>
In-Reply-To: <4927bb40f34ec6d3d5591dabba755452bd6b4a39.camel@itx.no>
From: Ian Rogers <irogers@google.com>
Date: Wed, 23 Sep 2026 14:16:49 -0700
X-Gm-Features: AclHuK9pZsA8iY-d7bWNHMtUz0MouzhE42jjiSTkxy86JSYE5mHT9HB5K2xVHh8
Message-ID: <CAP-5=fWhk8Z22+PhFKbatO6fYgiNBgLGwVgg_NxS8fg=uEdDUw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] perf: sparc64 user regs and stack dump, with
 arch hooks
To: Stian Halseth <stian@itx.no>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>, "David S. Miller" <davem@davemloft.net>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:57=E2=80=AFPM Stian Halseth <stian@itx.no> wrote:
>
> Hi Ian,
>
> On Wed, 2026-09-23 at 13:38 -0700, Ian Rogers wrote:
> >
> >
> > For the series:
> >
> > Reviewed-by: Ian Rogers <irogers@google.com>
> >
>
> Since this series is still marked RFC, should I resend it as a regular
> PATCH v4 with your Reviewed-by, or wait for additional maintainer
> feedback?
>
> And thank you so much for the reviews!

I think we have everything we need but the kernel changes are really
up to Peter and Ingo, and the tool changes are up to Arnaldo and
Namhyung.

Thanks,
Ian

> Stian
