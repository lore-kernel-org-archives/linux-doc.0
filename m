Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA336360EF6
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 06:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429825; cv=pass; b=SLz4C6p9yx4IiPEPoHJvolS5DkpSLxVQ9gdUdAoKBMdEqc7p7HZqrAMI+JaRdwnFg4EsEz15fyzpB5taOEzlqa1cKePCZY6J3OMI9G2goKFvFF9R/lV3VI7lY1IHUjwkMn7bL8W2NX1+wGhZoV5cvMRSydx86W4jfq4kx6aJIhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429825; c=relaxed/simple;
	bh=HhLz431XC/1SBtKZs6jOZJe1J0Hy0TUDih2j/njNowo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQwQKOr9lcOfvXDyB3RVflkFH6+6H51PEhOS3joQpFNqB2FiPQEZNhbzTr3xmIS9FEJvQ2SPaPFKPC1zkSjDJqLQmxRxpT4dgs2TJabArBJWgwCxcgWhVDVJGhqGQR0l/DlblACkEneehiBIF+G6fFR55glFI1rDuBKpHFX75AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m79J9SIe; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m79J9SIe"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso7045314eec.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 23:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779429823; cv=none;
        d=google.com; s=arc-20240605;
        b=dNrw4sMnCeuW0TjnRV/+OwQoJiqzTpuqFQydaHZqZuBKDahZoeXsXnLGaYMrZemU4V
         PEScYHmLNBqtf/dYwPkpGjmUG2p022IKsBEYe7Sa6oRUith/1vwv8DSB5eoLjV2Dpn/x
         behitoy1KwConS6NAQAnDwsRAuO1jiLoZdjKPl4G+pYJMc42tc2QHjC0Sr1SnW2IwmjU
         OuZjRs96t2lNOKMynsqPF4UpegNWpQOEpbalMgsngVR5W1ISb1nDiLGWcpORN4mnOt8U
         SC62CrqzOyeVQgoo4YSfDYTPz32WKqNBT/gU7LQ3IwDIVqNgmRkjZqMCmJ3jC5JQxTtK
         CEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dQ6hVnT8+IvfQww+UWuTp0nQS0/uDMuAD01ImXMAqTM=;
        fh=oWWyytKhcIPQKm624e9LgqdbQwyjtX6JHKuiWVYW5sY=;
        b=V4Ea28n7UvI1DT+SDuC67nGepRudAIsAwZomG21RppSVnmF4dNwEEc+Wj/u/w/Fy3I
         X7V1tqlUGXGtqwv/kVzeJUKoxfwPovzDEIxLP7bEIKei+8FuyM0n6aTTH2IyTNXuGFp9
         GI+RJ6kHfu81m8GqRsviL/rpZqpVqLNmvAAHiF8pG2ZDX6n8k/nnUYKA1W8K8zLpoMc5
         Ly9khTXD23DF9HU8zUrGvZps0/mmiITd68U1ebJHEK5pC1tQX40QPH/vsK79HF8c+uFh
         3bVhVgO9z+VzuKeSVz9D/hpnDZHKzqlXGmxeSNNZL0Sq2LPrG7LJiI+CqGPetuzvpJjy
         TVsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779429823; x=1780034623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ6hVnT8+IvfQww+UWuTp0nQS0/uDMuAD01ImXMAqTM=;
        b=m79J9SIeYJVw+fQtfY7IjR5CxEzgTT0XMaFULHPp4eWRK9UX4oCciHJkykyDXx8iTj
         uhlfjH/HOXznWzetoZbEqNoVhVyzBJ+vYkVcQvnGyeN9mJiufKkt9dv4qQ4V4rjJUgCV
         +IC1fWbZEiOqRmGSQD/YF2vxnDniLh0Attw2w2t3bjS9DevywxkRfZ9MU82XQCi+eqK4
         BeQr9ne7R6OZiThcEeAZDYkfdzBfaPLlcQZw0rPlkGA1T5cu9QWisc4YRlqgY5cgglGu
         O0vy98ybuRYcm/ZX4A131awzxC3/oCd4SWVvsW+3XoJad6a2mGzVr2IMre+NM+IteFGX
         Kwxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779429823; x=1780034623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dQ6hVnT8+IvfQww+UWuTp0nQS0/uDMuAD01ImXMAqTM=;
        b=S+Zi9So7MsUUORdVU1K3oFjzUhO66xPsrDiyQHkPm8/pO9hFAniNHVUMzualMifmev
         3v4I4T5B/iM4v14wQuvdcFo2FBOiD9kPPPUCQA8N3t2xMLBxOSizgql2F/humDR9y12Z
         7oQ+/w0nAjpJfg2iGed6OMbA7/gHGho/hd0LfFuHRdmsUEs8XRCw5IUBkMTVWR/r4hgL
         OWf+jQvvTBbRRKEvGbn/78YETrVoRWa20/syAExoB9zbQ9JXZ/OyxRAwyI1NXvxNn2Ne
         15gFb7zaufdVEchJOZB9WxkBuvXXaXmh23svPnI1eovnOqnk26SeywS1SMMXR3lfhNsY
         Iztw==
X-Forwarded-Encrypted: i=1; AFNElJ9+CjR7kCUrjnZuG8L7PX2/S9+pAPL0fjo0eGm+arYY7EqguiHeYsdNyygtLE15NG+OTRr/EibK9L8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzrbT/YWaSycAlBwQVYT0FCmhA4ALf5UDmqkm42TJZ5io0o/ZT
	I/aO0iWZ2gz5Sa1d1X5YNvgPgaDF0zMAJELO23DTaB6PpPUHv3XliKQVL+rgZLmJhG9zpiUGUVy
	J2QZt28Sdek60kgi48a4LxR8HC1IZwAk=
X-Gm-Gg: Acq92OHwRBN88cAragcqwALwgApyzN4lDxQjaBrVHIONwHGtTNKD4eqNYIS12TgJdaW
	SWOThfJjm4wWU0aRttgie2a/nxgly1hn9wP7jzAhvxMlN3KAJ6O8PaVKGbdJLLE33sBBad/x4sV
	JpwyAI4ufHflx8K5in14rgDueml1LhDwbDG22eMVqDgb6sU6MgfSyUqKGjrHXdO+b5/JjZCVRSE
	GTXYd+bWJsIfDIU9BiajXqX+zpIeo7iAf6IyvCm9aaxcijW5W0gNZJDgYTo8G3YuW/7hRjP9RRE
	BrSLNQ==
X-Received: by 2002:a05:7300:a509:b0:2da:2ec2:64e5 with SMTP id
 5a478bee46e88-304491840e6mr1102704eec.18.1779429822576; Thu, 21 May 2026
 23:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519060926.103727-1-jbroadus@gmail.com> <ag-ZuEt4uXnrO8AK@kernel.org>
In-Reply-To: <ag-ZuEt4uXnrO8AK@kernel.org>
From: Jim Broadus <jbroadus@gmail.com>
Date: Thu, 21 May 2026 23:03:29 -0700
X-Gm-Features: AVHnY4LA3QImdAO1-9EbSoxvRtYQWmfgsDIstzlg6YCBI-BFraaiDzGtwN3bdiw
Message-ID: <CAKgEEwswj4in29_hoy_dQQ18+GF=Uwf0LnwS=w7bwZCSW=mwjw@mail.gmail.com>
Subject: Re: [PATCH] tpm: tpm_tis: Add optional delay after relinquish
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, peterhuewe@gmx.de, jgg@ziepe.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Jarkko. I'll do that.

Jim

On Thu, May 21, 2026 at 4:48=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
>
> On Mon, May 18, 2026 at 11:09:26PM -0700, Jim Broadus wrote:
> > Some TPMs fail to grant locality when requested immediately after being
> > relinquished. In this case, the TPM_ACCESS_REQUEST_USE bit of the
> > TPM_ACCESS register is cleared immediately without setting
> > TPM_ACCESS_ACTIVE_LOCALITY.
> >
> > This issue can be seen at boot since tpm_chip_start, called right
> > after locality is relinquished, fails. This causes the probe to fail:
> >
> > tpm_tis MSFT0101:00: probe with driver tpm_tis failed with error -1
> >
> > This occurs on some older Dell Latitudes and maybe others. To work
> > around this, add a "settle" boolean param to tpm_tis. When this is
> > enabled, a delay is added after locality is relinquished.
> >
> > Signed-off-by: Jim Broadus <jbroadus@gmail.com>
>
> It would be better idea first to replace priv->manufacturer_id with
> priv->did_vid, and make necessary changes to sites where it is used.
>
> Then in the if-statement compare DID/VID of the device to priv->did_vid
> and apply quirk only if it matches.
>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
> >  drivers/char/tpm/tpm_tis.c                      | 7 +++++++
> >  drivers/char/tpm/tpm_tis_core.c                 | 3 +++
> >  drivers/char/tpm/tpm_tis_core.h                 | 1 +
> >  4 files changed, 18 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Document=
ation/admin-guide/kernel-parameters.txt
> > index 4d0f545fb3ec..5b7111033fbb 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -7651,6 +7651,13 @@ Kernel parameters
> >                       defined by Trusted Computing Group (TCG) see
> >                       https://trustedcomputinggroup.org/resource/pc-cli=
ent-platform-tpm-profile-ptp-specification/
> >
> > +     tpm_tis.settle=3D [HW,TPM]
> > +                     Format: <bool>
> > +                     When enabled, this adds a delay after locality is
> > +                     relinquished. Some TPMs will fail to grant locali=
ty if
> > +                     requested immediately after being relinquished. T=
his
> > +                     causes the probe to fail.
> > +
> >       tp_printk       [FTRACE]
> >                       Have the tracepoints sent to printk as well as th=
e
> >                       tracing ring buffer. This is useful for early boo=
t up
> > diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
> > index 9aa230a63616..8ac0ea78570e 100644
> > --- a/drivers/char/tpm/tpm_tis.c
> > +++ b/drivers/char/tpm/tpm_tis.c
> > @@ -101,6 +101,10 @@ module_param(force, bool, 0444);
> >  MODULE_PARM_DESC(force, "Force device probe rather than using ACPI ent=
ry");
> >  #endif
> >
> > +static bool settle;
> > +module_param(settle, bool, 0444);
> > +MODULE_PARM_DESC(settle, "Add settle time after relinquish");
> > +
> >  #if defined(CONFIG_PNP) && defined(CONFIG_ACPI)
> >  static int has_hid(struct acpi_device *dev, const char *hid)
> >  {
> > @@ -242,6 +246,9 @@ static int tpm_tis_init(struct device *dev, struct =
tpm_info *tpm_info)
> >       if (itpm || is_itpm(ACPI_COMPANION(dev)))
> >               set_bit(TPM_TIS_ITPM_WORKAROUND, &phy->priv.flags);
> >
> > +     if (settle)
> > +             set_bit(TPM_TIS_SETTLE_AFTER_RELINQUISH, &phy->priv.flags=
);
> > +
> >       return tpm_tis_core_init(dev, &phy->priv, irq, &tpm_tcg,
> >                                ACPI_HANDLE(dev));
> >  }
> > diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis=
_core.c
> > index 21d79ad3b164..68be26fa5817 100644
> > --- a/drivers/char/tpm/tpm_tis_core.c
> > +++ b/drivers/char/tpm/tpm_tis_core.c
> > @@ -184,6 +184,9 @@ static int tpm_tis_relinquish_locality(struct tpm_c=
hip *chip, int l)
> >               __tpm_tis_relinquish_locality(priv, l);
> >       mutex_unlock(&priv->locality_count_mutex);
> >
> > +     if (test_bit(TPM_TIS_SETTLE_AFTER_RELINQUISH, &priv->flags))
> > +             tpm_msleep(TPM_TIMEOUT);
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis=
_core.h
> > index 6c3aa480396b..413cac5e0f31 100644
> > --- a/drivers/char/tpm/tpm_tis_core.h
> > +++ b/drivers/char/tpm/tpm_tis_core.h
> > @@ -90,6 +90,7 @@ enum tpm_tis_flags {
> >       TPM_TIS_DEFAULT_CANCELLATION    =3D 2,
> >       TPM_TIS_IRQ_TESTED              =3D 3,
> >       TPM_TIS_STATUS_VALID_RETRY      =3D 4,
> > +     TPM_TIS_SETTLE_AFTER_RELINQUISH =3D 5,
> >  };
> >
> >  struct tpm_tis_data {
> > --
> > 2.54.0
> >
>
> BR, Jarkko
