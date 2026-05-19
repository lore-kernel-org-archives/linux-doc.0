Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B242D3403E8
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197931; cv=pass; b=gnDOZDAFurrkczWuX2odW81+vol/8hHNZ3kztYA3/nTa51g1otCO/2AYVCXOs2nJ54reozhfAYBFbbh3umwDgdaOJ/lHt6YJOrLPRy9ttTw9YHu52nEW6IqPg7bqnXnNaFr5EfeMantRNd2KVOHle7eLsKiVyFdT2RIXlFofeUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197931; c=relaxed/simple;
	bh=KP7zUHOrkzgdt1cRpKbtyeNbsXf5dD6XKZ2LFxmQcjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4kff36mEeamC6/RK4+QU09Z3yTZdkjxXc39ILB7r0Fsi2Xl3ND6nfLgAQoHOPnIQq0qkhW61dE9XR3pgoMlcE+Ic9+sVM4AxrFH3CIDIkeZBZgipdznPIH7nWcnurLwP1Dx2jVv0ds69cSkZvGai1xzlj9yMYAl0X1RDa7l3v4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPbjvKpv; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPbjvKpv"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-134fe980658so4615548c88.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779197929; cv=none;
        d=google.com; s=arc-20240605;
        b=LmNaGHegBq3129Rnaeht+9NFJfJI+C0qWPTJcf7mawGhSCVZX53YRZYuHu+uhavab3
         70EnUaDLWB4SV5LUhiD7pBRJA1c1rzhrDbsTNfxE6iqiVJt6UzD9xkF/dPoFdq0PeXx5
         WcvMG6Qia8CrJw1gJJ+xT5fm+iPxwkQaMreIUKvjLhETJjTV+CZvQeKL5jpOdzwOSuYs
         dSrWpclZ0RP/1OKV6qjX7HIE1xp4/eme+6OBVLal1o/MDjpJORQX+oIHTajQaVsJ1RTO
         akk1Xbvk4/vjK9tTdTmnClvQOWGrNpXTUn9Un259RaDr0HTBMbAzQtUGUj+EAGXBi+Ai
         SMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4rLi9EF1nJ5zuh+5Rs48RasaCD3EpgpMag9kYOR3Lik=;
        fh=bJSIkU0uN5NyxxdOpOyv/VND8dMU1X1dx5a1657c7v8=;
        b=l05i7iQ+bn3hdm80jRbKZrg2zNfRP92n+q6OFL7iIBeic6IEpyMynWWS48hWoS4fzt
         4FIckuOXCN1KMiTOSHz+5sbp8KSw+Y10iWmfzqRG8BqC3/846xinYh8prlddILx3QXm1
         axWPTMGN2Wy3YteryDxq/CCojsKr9q5sQXuRdbzQM19rAmvh9sNU0nT/jXAFKtnUOyTA
         RZSV/rpstkIfHH/XFzVdfxYzd0S2dBGIjS1frY5iLuU3DU3DYDRK+rXBmKpWXMj6oc8P
         kP0z4SKCCnsFHSj4K8I4dz3EQp83TNKdQsI20PPBphAEMMp2WgPwF1FOCiogPkD5Exac
         DO2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779197929; x=1779802729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rLi9EF1nJ5zuh+5Rs48RasaCD3EpgpMag9kYOR3Lik=;
        b=OPbjvKpvK+OOsLnQTyTbj/EEwx/Tqt3Q1Bf7N2TZJ28bLrcnJtva4CFBMJtMzij0mD
         JnqsJqYu1ilCuw1SrjoDXnDPeRfxULJdIQMhUDjM4UlAQ88XlEoM5xRpCHNq4OMV3NSC
         E5FuXpSSOn1SsQXfUTKYryw/aLxox2YWCykG3akE5P9U5/Bp7gY73o9JsHbsh40lB6A4
         jioI+ZxrGzU8sfge6iPPMUedq9g7VFqrB/8XpoWeIiN0pB4+WVzThesgkqeYJsIRMUlc
         sxg++URubx45Tn6+TM3VhE/WCdKpwCIGj5Pk4OpgbRoURB98A0Dklu+Ui17iluY5rOMo
         x+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197929; x=1779802729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4rLi9EF1nJ5zuh+5Rs48RasaCD3EpgpMag9kYOR3Lik=;
        b=R++VWluKXDfoGXPLIBpvagnBM9vtx3e4ilNpYQMKvG2XNwK4dVvp/0D/Kd2jx57jAd
         DLI8W3A793DfyopyEn+YWPaEYZEmfM4K0uZaYa9R5ZLQ3XPqADpW8WaMgKA9UYPbzHrm
         Bs5AtJukG9kwrAYj3HSLO3MRaYitXnXeDXOQNzbG3bUX6GhZPFGgvAsmu6DUhe8czLbP
         MagbG816eqkG0jmbhWeVNALBxHrW6+nGJa7qtvMx8VU/GTxYp6YHffWWHAJ/XatEGjjL
         RhwksP/qS11IUHQdYRk7s/d+saTJ0oTlPvbU6QEkRCBmbofnYoEp4okQQxRdDbdrS0Aa
         C6cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lXyAxqi5BNYEjlLuVa1fTL0P2vKj2DcYXzoT088Fp3JZlzdt8Eqv4Xq/zjaDLTfKvElQ3q5TDm0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyztZb1s0uYWkeN0evTatAM0vrlp7EoChN7xvzyt0G/0+a56ugq
	0iVCpvof97ga2t3be0eEYw6I0SfwI386erFvpxs2GszYSLLuG0neCeGUPf5/BXDJ3lFudCZbdQl
	rRDdJ8DEZ7fqcs2SuOc3ImM/rYcpWzX0=
X-Gm-Gg: Acq92OGt2dgxGLMk7lQR/+9xLV/B7WdRXWEg3BUPt4KO5IKDyeTezLF9AHWnD04fgfK
	2nXYJ1EnaQxR3rVg+sNnFgN1aUtHqaDMbOeU+GZuUWIxV4s+c9g6qqlpiDtYreee6k7+8pvGA8C
	7G4a6hHy2WJxq3duQitVtxKhbHLHaklE/fMuabUtvfhGKwi9gRoTRXYh/F1qNMPO1buKNGoG0lh
	brt5KTIruniFlQzDFgXn2ewgvolInmpYYWlc4FschJr8re8XxTMj4BPfFACB+tgEL2+Vbh/ULaQ
	FivIKbbGEMONBghV
X-Received: by 2002:a05:7300:a146:b0:2ea:ed7c:8064 with SMTP id
 5a478bee46e88-3039816dc0fmr7981877eec.3.1779197928558; Tue, 19 May 2026
 06:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519060926.103727-1-jbroadus@gmail.com>
In-Reply-To: <20260519060926.103727-1-jbroadus@gmail.com>
From: Jim Broadus <jbroadus@gmail.com>
Date: Tue, 19 May 2026 06:38:37 -0700
X-Gm-Features: AVHnY4LT_jG2no69Sj6hc2qtUbtjHtBegcw9-dznFgFDKMTe2apHJoCmGtMe5Bo
Message-ID: <CAKgEEwsXD4_Bks1J=irU8c2UbFY4fX9g3H6On3hBiV+DckGQxA@mail.gmail.com>
Subject: Re: [PATCH] tpm: tpm_tis: Add optional delay after relinquish
To: linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I realize the delay should be moved to __tpm_tis_relinquish_locality.
I'll change that in a v2 patch.


On Mon, May 18, 2026 at 11:09=E2=80=AFPM Jim Broadus <jbroadus@gmail.com> w=
rote:
>
> Some TPMs fail to grant locality when requested immediately after being
> relinquished. In this case, the TPM_ACCESS_REQUEST_USE bit of the
> TPM_ACCESS register is cleared immediately without setting
> TPM_ACCESS_ACTIVE_LOCALITY.
>
> This issue can be seen at boot since tpm_chip_start, called right
> after locality is relinquished, fails. This causes the probe to fail:
>
> tpm_tis MSFT0101:00: probe with driver tpm_tis failed with error -1
>
> This occurs on some older Dell Latitudes and maybe others. To work
> around this, add a "settle" boolean param to tpm_tis. When this is
> enabled, a delay is added after locality is relinquished.
>
> Signed-off-by: Jim Broadus <jbroadus@gmail.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
>  drivers/char/tpm/tpm_tis.c                      | 7 +++++++
>  drivers/char/tpm/tpm_tis_core.c                 | 3 +++
>  drivers/char/tpm/tpm_tis_core.h                 | 1 +
>  4 files changed, 18 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 4d0f545fb3ec..5b7111033fbb 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7651,6 +7651,13 @@ Kernel parameters
>                         defined by Trusted Computing Group (TCG) see
>                         https://trustedcomputinggroup.org/resource/pc-cli=
ent-platform-tpm-profile-ptp-specification/
>
> +       tpm_tis.settle=3D [HW,TPM]
> +                       Format: <bool>
> +                       When enabled, this adds a delay after locality is
> +                       relinquished. Some TPMs will fail to grant locali=
ty if
> +                       requested immediately after being relinquished. T=
his
> +                       causes the probe to fail.
> +
>         tp_printk       [FTRACE]
>                         Have the tracepoints sent to printk as well as th=
e
>                         tracing ring buffer. This is useful for early boo=
t up
> diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
> index 9aa230a63616..8ac0ea78570e 100644
> --- a/drivers/char/tpm/tpm_tis.c
> +++ b/drivers/char/tpm/tpm_tis.c
> @@ -101,6 +101,10 @@ module_param(force, bool, 0444);
>  MODULE_PARM_DESC(force, "Force device probe rather than using ACPI entry=
");
>  #endif
>
> +static bool settle;
> +module_param(settle, bool, 0444);
> +MODULE_PARM_DESC(settle, "Add settle time after relinquish");
> +
>  #if defined(CONFIG_PNP) && defined(CONFIG_ACPI)
>  static int has_hid(struct acpi_device *dev, const char *hid)
>  {
> @@ -242,6 +246,9 @@ static int tpm_tis_init(struct device *dev, struct tp=
m_info *tpm_info)
>         if (itpm || is_itpm(ACPI_COMPANION(dev)))
>                 set_bit(TPM_TIS_ITPM_WORKAROUND, &phy->priv.flags);
>
> +       if (settle)
> +               set_bit(TPM_TIS_SETTLE_AFTER_RELINQUISH, &phy->priv.flags=
);
> +
>         return tpm_tis_core_init(dev, &phy->priv, irq, &tpm_tcg,
>                                  ACPI_HANDLE(dev));
>  }
> diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_c=
ore.c
> index 21d79ad3b164..68be26fa5817 100644
> --- a/drivers/char/tpm/tpm_tis_core.c
> +++ b/drivers/char/tpm/tpm_tis_core.c
> @@ -184,6 +184,9 @@ static int tpm_tis_relinquish_locality(struct tpm_chi=
p *chip, int l)
>                 __tpm_tis_relinquish_locality(priv, l);
>         mutex_unlock(&priv->locality_count_mutex);
>
> +       if (test_bit(TPM_TIS_SETTLE_AFTER_RELINQUISH, &priv->flags))
> +               tpm_msleep(TPM_TIMEOUT);
> +
>         return 0;
>  }
>
> diff --git a/drivers/char/tpm/tpm_tis_core.h b/drivers/char/tpm/tpm_tis_c=
ore.h
> index 6c3aa480396b..413cac5e0f31 100644
> --- a/drivers/char/tpm/tpm_tis_core.h
> +++ b/drivers/char/tpm/tpm_tis_core.h
> @@ -90,6 +90,7 @@ enum tpm_tis_flags {
>         TPM_TIS_DEFAULT_CANCELLATION    =3D 2,
>         TPM_TIS_IRQ_TESTED              =3D 3,
>         TPM_TIS_STATUS_VALID_RETRY      =3D 4,
> +       TPM_TIS_SETTLE_AFTER_RELINQUISH =3D 5,
>  };
>
>  struct tpm_tis_data {
> --
> 2.54.0
>
