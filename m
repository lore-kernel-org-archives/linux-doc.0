Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C521257E
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773797743; cv=pass; b=MYdh4emnLikupsivNIzaggDkvNYB6lDIArbJMZSNMk2IbhMR1RpAx4oQS91V0cbRF+V/ChmtYF71ABy6/N/Rx52QuD3Tp7JV2Blsqtd5Sot7e9yDFHWXUOrcF+1vvh6wOHHdEbWeOSDvj30Z4P8avDBWQQ5lU08iSSJsAavJJYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773797743; c=relaxed/simple;
	bh=r9hsKb9PfTufYzjHiq0hMbGcpfgxzO52s1Vpsdo+xGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWoL2V9xQ+0LEPh3Ka/oVO9A0oly4Xrw5mdL7kV7o5QY+y+vrNpwcsspStIYD95P3oFfyjikCaeWHzsGArFNcZzUiJp+1cC5Fi4DLvNXAp8zZ7Fw26JU1B8VD9Xid8u7nQdXL5EfuwrQAytj/CbhOK1kyisjfOkajN0QLtUG7zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJb/EnfM; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJb/EnfM"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a1322af04fso318678e87.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 18:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773797740; cv=none;
        d=google.com; s=arc-20240605;
        b=cHMowxPPZE0EqGfgJ/riHhEw8Tatfofye+pYNy8NEbkyGpEEV+1txT/sNr7s1MacFw
         2Cbg+l2IJm9kfJgdrz09QGj3gGJcdhJ4r//08Fs+7rBsBfgWyvM5+zurRl0/6u5cfXbT
         uazgU4wfWUSy+hWHtjwScaQVbNSmMjhZC+SzPKxBrT2/J7NwjWVlRyXAtwH2IjfAZB8L
         pUvHPttivFvt3mK+UTGFlUASUpcPgItODlHdiNfn5KbsSIDcEDbfFFWi7ngFKcYZ3OSf
         iIQ1s6yzoInoTSFIjsk2PgysOi3/f2dXygjcCz0fB4PCjgNpV0QwV0DXpoVaBgg8+m2t
         6cKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bnHRGZux9J8/Uki/jwcTCNraQa2a1iivTN3+HD+7Wu4=;
        fh=Qojli0WDP4ysN7W1OeinzEBOc09ds1b6SdBFSfngvcg=;
        b=ZMOnjpxdm/Et7NSFO67MGbiB93C6p5nMfITI13oo2HZ4LL3RibeD4NGIsj2X+Vgp+m
         zg0h/UZVAWryGRBEjGO1wDMX9s8cdHZ9Lkl7MpMdB3Y61GDXV0yB2v4cXgM2y46VE6f9
         MvxlY0rrCBrHB/nfMK9lWAAxhLMi3XqYLOsfxE9uF7br/6AqI8N4HfCZF3cs6wJZIIxu
         yQbx7MEV7QTsg4FhnE5qCrJZ9oO/wwgThNRffZadcG7Nw+jqfAsM+1lI8mP8YufOCIr/
         nqiGqGhHC4hjY6VOtB+22xK4YLg0+fesjrLWue2emO9It/ISX0zwJxFCRBpnyqhc3QY0
         Vzng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773797740; x=1774402540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnHRGZux9J8/Uki/jwcTCNraQa2a1iivTN3+HD+7Wu4=;
        b=MJb/EnfMuI8mxqMYieH9cSSAYbkj1/9JrXHzCirnzWKMiNdOd+NHuD6KqvuFBjtNmY
         vqLqqIH6NS00QytxnujFiXf/tgxFtvPQvCHvLsIXJnJN569g0cM6ZnJPn4VdmJBDpZQE
         hLKiA2CLtIrPhWEK/u8MPCwIGW5Oh9Q5dUAMD5E1wjg4aDxUdQPukqf/jrJmVFXc+dwS
         hTqYsUkZLFWaJlZrSYmH4/vQ6n3S/rPodYMMR3dc3cPLb8ldk1Tnfq+K7BHjeaSpeVYY
         bYo8ebgNfQxjDrV1wN1PvvfNWnQ3DWfz+0reXYT82J8bDzZoZFxw1YrhNX+8USWsuxFE
         O5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773797740; x=1774402540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnHRGZux9J8/Uki/jwcTCNraQa2a1iivTN3+HD+7Wu4=;
        b=ROSoGvPv9Lkczu40uBmuuQ8ULOFzpRK14692m6aoAXQOfoD6s7bia6O3DG1YtDZHiM
         mcyM+pMZVZ6O6ltiWvw1UlPilXA9D/E6Eef5vPxVqmtkFAWA7yHM89CyPiBSV1QPqI0Z
         deAsnQ65dcArsFmq98k91MwYxVNSePbbC1X3cY3JyPXYxz12cOaec1jmsSxI1K1p05PT
         2EIeZD6B/C8wZEsXOQP1X0Z6EhHZDLKnRwFdrvMUJH8LyN41p8deIr9Nvd0FyU31Ir7K
         WOz63xe1TQkSuz28og3Luse+k/G3I5ULVYaZ39Lz2rnagINGwU3YPt0YYoPGfvyfrxiJ
         OTzA==
X-Forwarded-Encrypted: i=1; AJvYcCVc9wb0steZB9KBgrDON5at9HFg6POBgXVgiIUbd/ouTfMiMGDnPpik4HF2it9uBW85uy9KDqUKQPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww1tDKGNZVGqkDjRB3ZztvTtWCAi2cNDFnQAXwpah07bJFHe7d
	6kVrd6WFN3qDR1fdSD+ZZkZnCg7umzoD+WgCkKiYO0pWhU3Epik00blcr9kmryzrYQ2GqOAipke
	UbcVT2OHi+X7p9lbIsTcB0Z7K8JHlF5E=
X-Gm-Gg: ATEYQzxd2FulzzzMDivJ37mZM/MlebxYa/kwzqT8UFHF/x14sR/LGYhnzx4dlZuWLw7
	j9Xb8P2XxLPNMFYtPJaBWNxjGDQrJJDzwEPTUqjuBJDvfpVk4jHj5MeHw7tMfbruQJSsMElXGEg
	4915wAI42TL2yt9ZHjlMYa/SJVWfk1z2LTGjq7tSaq2XMcCE9zQ1JI2cvXV/X9dL9yFmExQjcxS
	cWSCXwptsnfpHZsVO6vrY/gIGZVXUVycgqUmTc6ejdXRfMB81bQIujQd7oZO4wgK6mJ+ow4C+c1
	8yz2iCk=
X-Received: by 2002:a05:6512:3258:b0:5a1:1914:2bac with SMTP id
 2adb3069b0e04-5a2796b0670mr475858e87.25.1773797740151; Tue, 17 Mar 2026
 18:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311143144.482145-1-vishnuocv@gmail.com> <177376698425.15640.5695107795590543274.b4-ty@linux.intel.com>
In-Reply-To: <177376698425.15640.5695107795590543274.b4-ty@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 18 Mar 2026 10:35:03 +0900
X-Gm-Features: AaiRm53Lg5Zo2AJUp6xaTGJ_mBVnBHtnars3jJTNT9JwA8Rtk6OghHrOaVZ_8Bo
Message-ID: <CABxCQKtNSjdj0pj_-Bt7Jrs9pEp-SbOyjGUno8xc8FpfojGpkQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] TrackPoint doubletap enablement and user control
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: mpearson-lenovo@squebb.ca, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	hansg@kernel.org, corbet@lwn.net, derekjohn.clark@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thank you for accepting this.

On Wed, Mar 18, 2026 at 2:03=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 11 Mar 2026 23:31:41 +0900, Vishnu Sankar wrote:
>
> > This patch series adds support for TrackPoint doubletap with a clear an=
d
> > simple separation of responsibilities between drivers:
> >
> > 1. Firmware enablement (trackpoint.c):
> >    Automatically enables doubletap on capable hardware during device
> >    detection.
> >
> > [...]
>
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
Acked.
>
> The list of commits applied:
> [1/3] input: trackpoint - Enable doubletap by default on capable devices
>       commit: 9a98ebe630cf13c1a6063afa676d1cecc44fb2c9
> [2/3] platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint doubl=
e-tap
>       commit: 6227cc32fa01ffbf5bef8dcc6759743a28a2ad57
> [3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
>       commit: fa5062e99b984448b7c8ca9aea47e7fc033b6e2f
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
