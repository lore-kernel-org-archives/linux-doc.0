Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DC371D10
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021266; cv=none; b=mJ9B7YIwLtshs3OFV92IZaZLbBErF2/ZeLFdcgNgJsErxcXEuG+WZlgPbUW1Yl52xcGBbUwPMt66JZuUmZDI+Ohai3B+fpUDi3TMJeb5GLcVYCxYkz8Lo+hpy+tpdvxpxwM8fHVLQXHV/0TaIpHyv/LfFVTtBclBpe+kE+SKtc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021266; c=relaxed/simple;
	bh=ihIHkKo2Tdh5twtS4qa5HuM6fZuolA0g4wy+dHdIt6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYN5oG/YsMtztf0PkVJQy/La59ikwMXuZLyvRYyVK8/mVwKkzaJMXzZR/pY6iLiALeoCWsFRvvJe9cbQ8O1zSm9REFqiIRQsj6fY3g/LgJeLsqCAzici4JwINJlR16xmMw00QjPSPRe6KazDfhpy9bGNV52TRPdX1LcyWZkr0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XzH5/9It; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XzH5/9It"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ccdf8d4ac5so61483866d6.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781021264; x=1781626064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKC62oLIKUcXquAwJ4zvmOEV+Z1zozxkoFmAy9OT9lE=;
        b=XzH5/9ItxwXXJ+qBO590Q7p9KXyj4UlGnO/+49QW2L7pPYDGdIx4Jeg9IRaYPEqmAS
         VQC/sLz34F+AuAr+ZFQuIBmaWeqlVe1+Z3oNRBemZPbj3Q+Im2BEA0HB2VbWlUBcuX5C
         nJqqOT8wJU2wr+grZKWdDdGPo2AsmjbcEsT20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021264; x=1781626064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKC62oLIKUcXquAwJ4zvmOEV+Z1zozxkoFmAy9OT9lE=;
        b=E76zVUl1xhdhPT1M3YVp7U7OIb6RAlS3KFUYmrFdCI9dRsmVjZuj5XjEpL80EC1gvW
         C5SzQtPkz0wYUJuPwPnVbKbPtb4OM6OzHYWpvLC61l1d9A9an8zgBCDRe2M051l5Eodr
         gpcVcyvP6/Dz7LHDprD8yeLYJL0yPTBCxbHbhr+5snGt6HkWWIraw3Q+oaXJGiAMXSGi
         49Bj1MvKX5k+cAytUOiJZ7Nsoi2dWbAWkunQsKE4/dCSBXsfKVCAnZ+OeLIOF2gCDJ/I
         O36kIHSPz4TfD+exG37ujgSLzYDD878I1CMiksxfvIA1YnYQCru2QWEA77Spst2T/v/r
         QKGA==
X-Forwarded-Encrypted: i=1; AFNElJ8v9k8LXrY7ffXnkNmlAhM+XOgVh8vDxgzejxcjobhr0dWuLgmipU7R9hLGCqtZfoo4E3NPPD+sSx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUQkjMFwJ3lttff9KDwPGjNnG+S488QJn9aDDH/YC/Aw+sgtB4
	zmux93kHnRXF8CITmZmSLzSxEP4AzLpp5xzkPitPXDtXyKjHadCk0YCvFQmUpxGEVRVs6WCJTWC
	InYl3lA==
X-Gm-Gg: Acq92OGn1jUnMbPhZbHl2tov9FSZACh0VyNiq87oidKRFZ4ZxqLOQ/bVIWNyJbEYTmh
	SvtMh5R7+ofJeKHHyurL7wISmgG7abaz7rsL7RCWfn5LlXgjAY4ErAC3JmKQlRDXlJ9ekxnHUWM
	3mdIChSOImmyZFUvol1YHcwulhcTrp2KZ7V3n1JzL1SqeCachRyDDoeuBP2FX+1JtA604wOmccE
	1PVUC3n3Rm+9sOy8gkcjCEQjAV1SmrqOnSyWbcnLiIVSZ9WID4vv5vUiodS+r+5CqFZqOPGHdO9
	F8kII292+cU4ot2x4S28nVTBkCGTjzcmGtNMWUaqWT5/MY7jOmC+XkpldPgHh0r2GLPDRjzE1oq
	KnNDxKNw+//1VHyGY+9j704KxfGmtjXDgHn3Dfu0JXxmNuoI7avpQIMGEGZMhsOTNi4s4T/imJj
	48fcF9ZO12QIl7aJwpywHBOfVInCRmPNX0idJauslS+2ln/K13VNLKOgKmRey2xaamJaG1cqge
X-Received: by 2002:a05:6214:1949:b0:8ce:c26e:b75c with SMTP id 6a1803df08f44-8cee5f99368mr291066586d6.10.1781021264090;
        Tue, 09 Jun 2026 09:07:44 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com. [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda2601sm205198006d6.6.2026.06.09.09.07.41
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:07:42 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51765331535so2536401cf.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 09:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/dbfg9mtY8V4C3w7ZjxamIEDHHJyB93BWv0A8OitAuwLGk2HCp+Dvf59Dq5mxSQOSjB37sj2SnBso=@vger.kernel.org
X-Received: by 2002:a05:622a:a70d:b0:516:4f62:85ee with SMTP id
 d75a77b69052e-51798cb56eemr34163921cf.19.1781021260072; Tue, 09 Jun 2026
 09:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608021526.1023248-1-tzungbi@kernel.org> <20260608021526.1023248-2-tzungbi@kernel.org>
 <CAJZ5v0jy75R24NztKJ0w4NMyRB7G+DcsC+gaQ0xZOQMfTfA5Ww@mail.gmail.com>
 <aifWwEyHuFejW4ac@google.com> <CAJZ5v0ja1ocM+W4hbVsHoZ=fFdmQ-=z4xzviNwo0eEyWT8ssBA@mail.gmail.com>
 <CAAFQd5Bmm4VeJ2ygOJeQYmdTq1DLBsQdvDkhstA-tUPZr0rB1A@mail.gmail.com>
 <aigPNvkxRIz36dWm@google.com> <CAJZ5v0gQTx_k9j2pGha7NKxAjdPS1J_ySZNYiL1=_+_M9znQ_g@mail.gmail.com>
In-Reply-To: <CAJZ5v0gQTx_k9j2pGha7NKxAjdPS1J_ySZNYiL1=_+_M9znQ_g@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 10 Jun 2026 01:07:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AiL0PH5nrrdniR2SH9f-S-NF=8e3azwZuKM=ibRFVjJw@mail.gmail.com>
X-Gm-Features: AVVi8Ccb4yfQPTmrJfrr3ZlXROt83QZzcRrNRN_0Bxm62ELu8P-kx7fwOSMEXPM
Message-ID: <CAAFQd5AiL0PH5nrrdniR2SH9f-S-NF=8e3azwZuKM=ibRFVjJw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PM: core: Rename module parameters prefix to "power"
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	senozhatsky@chromium.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 10:40=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Tue, Jun 9, 2026 at 3:03=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
> >
> > On Tue, Jun 09, 2026 at 08:17:03PM +0900, Tomasz Figa wrote:
> > > On Tue, Jun 9, 2026 at 8:10=E2=80=AFPM Rafael J. Wysocki <rafael@kern=
el.org> wrote:
> > > >
> > > > On Tue, Jun 9, 2026 at 11:03=E2=80=AFAM Tzung-Bi Shih <tzungbi@kern=
el.org> wrote:
> > > > >
> > > > > On Mon, Jun 08, 2026 at 04:11:30PM +0200, Rafael J. Wysocki wrote=
:
> > > > > > On Mon, Jun 8, 2026 at 4:16=E2=80=AFAM Tzung-Bi Shih <tzungbi@k=
ernel.org> wrote:
> > > > > > >
> > > > > > > Currently, the module parameters defined in drivers/base/powe=
r/main.c
> > > > > > > use the default prefix "main" (derived from the filename).  T=
he prefix
> > > > > > > "main" is too generic and non-descriptive for power managemen=
t
> > > > > > > parameters.
> > > > > > >
> > > > > > > Redefine MODULE_PARAM_PREFIX to "power." at the beginning of =
the file
> > > > > > > to group the module parameters under the "power" namespace in=
stead.
> > > > > > > This makes the parameters more descriptive.
> > > > > > >
> > > > > > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > > > > > ---
> > > > > > > v3:
> > > > > > > - No changes.
> > > > > > >
> > > > > > > v2: https://lore.kernel.org/all/20260604090756.2884671-2-tzun=
gbi@kernel.org
> > > > > > > - New to the series.
> > > > > > >
> > > > > > > v1: Doesn't exist.
> > > > > > >
> > > > > > >  drivers/base/power/main.c | 3 +++
> > > > > > >  1 file changed, 3 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/base/power/main.c b/drivers/base/power/m=
ain.c
> > > > > > > index ed48c292f575..cd864f3a2799 100644
> > > > > > > --- a/drivers/base/power/main.c
> > > > > > > +++ b/drivers/base/power/main.c
> > > > > > > @@ -40,6 +40,9 @@
> > > > > > >  #include "../base.h"
> > > > > > >  #include "power.h"
> > > > > > >
> > > > > > > +#undef MODULE_PARAM_PREFIX
> > > > > > > +#define MODULE_PARAM_PREFIX "power."
> > > > > >
> > > > > > "power" may be confused with the power supply support, so I'd r=
ather
> > > > > > use "pm" or even "pm_sleep" (in which case the "dpm_" prefix co=
uld be
> > > > > > dropped from the new module param name in the next patch).
> > > > >
> > > > > Ack, will use "pm_sleep" in the next version.
> > > > >
> > > > > Regarding dropping the "dpm_" prefix, should this also apply to t=
he existing
> > > > > dpm_watchdog_all_cpu_backtrace parameter?  Or should we leave it =
as-is to
> > > > > avoid breaking existing configurations?
> > > >
> > > > Breaking things for someone would be unfortunate.
> > > >
> > > > For consistency, let's retain the "dpm_watchdog" part in this name =
and
> > > > use it in the new one.
> > >
> > > Hmm, doesn't the prefix change already break things?
> >
> > Theoretically yes, though it's worth noting that this parameter is
> > relatively new.  It was introduced in v6.19 (Oct 2025) via commit
> > a67818f74512 ("PM: dpm_watchdog: add module param to backtrace all CPUs=
").
> >
> > To my knowledge, the flag was originally introduced for ChromeOS [1], w=
hich
> > doesn't actually rely on this module parameter in its production
> > configuration yet [2].
> >
> > That said, I can't know the status of all other Linux distributions.  I=
f we
> > want to be 100% safe against breaking existing setups, retaining the "m=
ain"
> > prefix is definitely the safest.
> >
> > Given its recent introduction and limited known usage, this might be th=
e
> > best window to rename the prefix before it gains wider adoption.
> >
> > What are your thoughts?
>
> If somebody complains about it, we can reconsider, but using "main" as
> a prefix for power management module parameters is definitely
> confusing.

Agreed.

Best,
Tomasz

>
> > [1] https://chromium-review.git.corp.google.com/c/chromiumos/third_part=
y/kernel/+/7414781
> > [2] https://chromium-review.git.corp.google.com/c/chromiumos/third_part=
y/kernel/+/7414721
