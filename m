Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7833B43C049
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 16:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310457; cv=pass; b=sk8GyTaYMGoBoBiUB8LbydkBAxZcpiSUDnandIlbNqgWr1ht/r9UL4fGhsU23sJO1ueUNoghUE/s3vF42IAki9YMOSou+2QNmhdsmn/v+XRD4tXswX4mg9t4XQtCni2T56YsUfrJxdmcuWzRPdV573HFoejfxUWXYBSdTjZ4cBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310457; c=relaxed/simple;
	bh=OpvS9XyVUoyw+oX1Lr7fUn152Rj180s+IMS/CRzzP4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZlFv7fxwKhcc03Sw8MbnEQ5ZhyYGzK0unLqn67njXcGCIDXL9TsyGuyBAgfPx18V79JJ9lWn2FiwIdti5RXUerdMWWcpHdC1+yTjhDSPFvv1b6SBdTk9lkzFMyAKT8TSmkjho5tkzMnzLhKI1zdMPt61C4mECBNYd8xM7tPaiMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e50E3c+f; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e50E3c+f"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8850aa5b56so204688566b.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 08:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770310455; cv=none;
        d=google.com; s=arc-20240605;
        b=S3j9802+Ni5kjKQcETqyb/Q18mhs0HDU2gb5EtH3LWSUmKEZnomOe0/zd/AoI11A/u
         8BkCsoUHuXyPmIkClZenYaOMiCcNQnU1fHeBhvrzwd48Zfu7lXgebA9bcr3J5YjmnH6i
         FV3Vf2YVNzT41vuX76hnlRVkNts+8glz6To27ObRa/GA9IWsKsch4nAhp1TDmK07De/p
         gyVPq5XibLemqOyDw/tzX9IQgIL5s+DGIoVjj23QTEirGKtbO0JS2+LG91YZn8uKPYwU
         hX2sowHgAUhMLCfUpC8Js/Jy9VsdxqncUIupXfqS5foSzz2qrplxK5+xaq3Zn9rPdEom
         T1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mok7tSoTC7RJ19nbmvu/1cT2bgwCt+f3Z/EsF+273Lw=;
        fh=GeNmMlzh3bix9APUxv87aIh6jw4bqHRMm7I//8+WNxo=;
        b=evzwJNjAZ6fEF+tFdtRjpBnkoICUiSElH/qLmXueZ3+AvaXnIfFlZNF0E0XiYLYjtS
         nsz2hWD/icSV7wdcRNKNi9g4kvh7+raQoo6uE3Qg3SLUT+dr//DJkydokVCCK0H8cozk
         rwEak76jIc/mox2fDl15Jy41WDMkUUD7Gzm5nXeDlsjSLpVjEpABHys0CbLHM7wPGQJu
         QdjSnZpEwcVWg5ueHqVaOJctozJSfwCKCFA9rECs1A6VPq1Np43EWArT9JRGR1t64t64
         YV5NxUsUDJv9hXDa2+2XarwQ0ETKYSdHXz4/9b/5ADTLqQeOMzYlQqkKLMu21FZIX3A/
         amoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770310455; x=1770915255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mok7tSoTC7RJ19nbmvu/1cT2bgwCt+f3Z/EsF+273Lw=;
        b=e50E3c+f4Da0k+Q/3Q8f6VXWkUv03psrrJVDfQ58zas5t/ua/TaDNPhnW45UvQXMC0
         lqBc9mXfZZ47u2gBxugXxViYfAInMRrfii3Kp7SC1f6o9Tq+tDdG8R2TpSpjJnc38YK4
         BczhPHgOAkME6NwS5vmiuaUDkvTY3rFu19+pLgvpn80o7lHvUBzKybJaMsv5WgJ3alxD
         tkd6idxlXtdq1blPngEQlk045RnApB6JkUxWLuU4W7bX2UGaRG5KnI3VGyvfRSz9g8lw
         u2BaJhgG8zUA6k/Pm4ggSR8MSyFwBpe2AMhcx6+TGWTxy1OpL2fhE6TrHE+3HDsyBmGf
         xHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310455; x=1770915255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mok7tSoTC7RJ19nbmvu/1cT2bgwCt+f3Z/EsF+273Lw=;
        b=FPLN2SNMXtbvG7ELDhTSYk4wVVQ7A/LWiLfzFRNiBtvS/V1WJxLlQQu4ykicS91pmy
         slSGMXeg1pzoXCIGpLUpz/bcVelGkPyV93D0wvLeqNWyJVoMvZ7GqUXmmi+v0ln/ck3D
         TbSVhpJSQKkybQT9BHfudR7ITsJHb8UFf+2vskOByVqKxzPLK/3GYcv3nSXp/wBlUe00
         fbBBhISe4l9OXw38hzpKHUpeF9PfDRxB6El89LzxHXZFsA2Y1PPMXG5w81NXFCFILEfz
         SEAOhMRJGy54rSdgTfbQEMulPDj8xsbxrzd/eNBMNnxREDDD2/d5U5N+x/k2eFmuskY3
         BilQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhrXHoB4F+zwQWQQTmobJNr5S0YRRUq82pdxIG28OAEAKKFC+9ykl0jViEp/9lkD5UPEEwHoEBP8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSwDbfiySwsc9KQIaK0yAQoOxiUZ8OHD5YvN2ZqmsCxF5+w927
	FVYvVlJLavWgR+kB5PcU/2jKtL+6uNPxMMMj83XhvXWCfuLjOYhyDF2LFB7vcmg4loctRO0pEKx
	bblTr73BWKdkuILCBo3oZuX2kCX9oA+I=
X-Gm-Gg: AZuq6aI7M51YGOqtUnd6pafEmE72SEMoy2fQNk4rnP2a2TLTmZDOTIhX99krA2YhD74
	SNsy2C2tkJjdg73p5cYID83f3cTS3Wz47tGeBmxs/TurDtskn3b2QBe5gzcVpPFMgWdxpD5LRVl
	Qef/URng2+c6NxpKA/3GacbsJDlLJZkLTFUAjn7E3JIxm/d7mEgt+xHjG1qXvvP2CYq75gOy+wI
	NdvhLvxtDvXEx/A2qewzaQLKwcdSHMvi4cGJm0+69Eq5HhrMHuwrJEQaYcI02DrOrCA3UgM0fNo
	VXSHqZ5nynSzYMp3SGuFD3ogqCuOCwRn0pOA3d/T3iJJmQOfw2LNtQuI03mKpd8DWXubqw4=
X-Received: by 2002:a17:907:94d4:b0:b87:2fcd:1955 with SMTP id
 a640c23a62f3a-b8e9f40de76mr467741166b.50.1770310455075; Thu, 05 Feb 2026
 08:54:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770309522.git.marcelo.schmitt@analog.com> <a5721b31e7cbf8327c74d761757d9051c289297c.1770309522.git.marcelo.schmitt@analog.com>
In-Reply-To: <a5721b31e7cbf8327c74d761757d9051c289297c.1770309522.git.marcelo.schmitt@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Feb 2026 18:53:38 +0200
X-Gm-Features: AZwV_QhA2nGFwsXuz10t8Kj4Zl8EbQywBy3FuQIW-ZrEVDmxdKmmWiomaychFD4
Message-ID: <CAHp75VdFvVMBr6U40wQ-9Eo3e-svsdfOKhkEt0cfUbFoDbdA3g@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] iio: adc: ad4030: Add support for ADAQ4216 and ADAQ4224
To: Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org, 
	michael.hennerich@analog.com, nuno.sa@analog.com, eblanc@baylibre.com, 
	dlechner@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, marcelo.schmitt1@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:49=E2=80=AFPM Marcelo Schmitt
<marcelo.schmitt@analog.com> wrote:
>
> ADAQ4216 and ADAQ4224 are similar to AD4030, but feature a PGA circuitry
> that scales the analog input signal prior to it reaching the ADC. The PGA
> is controlled through a pair of pins (A0 and A1) whose state define the
> gain that is applied to the input signal.
>
> Add support for ADAQ4216 and ADAQ4224. Provide a list of PGA options
> through the IIO device channel scale available interface and enable contr=
ol
> of the PGA through the channel scale interface.

...

> +static const int adaq4216_hw_gains_vpv[] =3D {
> +       MILLI / 3,              /* 333 */

I would go with

  1 * MILLI / 3, ...

for the sake of consistency.

> +       5 * MILLI / 9,          /* 555 */
> +       20 * MILLI / 9,         /* 2222 */
> +       20 * MILLI / 3,         /* 6666 */
> +};

...

> +       gain_nano =3D gain_int * NANO + gain_fract;

> +

Unneeded blank line.

> +       if (!in_range(gain_nano, 1, ADAQ4616_PGA_GAIN_MAX_NANO))
> +               return -EINVAL;

...

No need to resend, if Jonathan and others are okay with the series, he
might be able to tweak this whilst applying.

--=20
With Best Regards,
Andy Shevchenko
