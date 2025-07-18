Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D42E612B
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855098; cv=none; b=OST1jfe1k+GVJJnt9v1aCuqJDw4+1dpQ/9SAHC7z4YMBMXusMqrUyd62TbvJwzauGFhXKeEPyBy4AhkPji5ZqsDAamW9JVS8xix9yPgkTn5YfrrymwY63OaJkPmbEPIry5HkWUEnG0bd1fPUckzggbbdzNUs3DEM0A+i++r9X/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855098; c=relaxed/simple;
	bh=FyRfBnxU/OGyyizvx31WzrOI+l2j9rU6IuwyuQVHu2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYysnW+1CrFkDJczeUupMAxSoLsSNRCCiklB1YzUzepDGz3KIDwUhZV4Hwixe34twy/0GzWLcPmtO45Yad8JOVrhSzlFgnsOijYGQ39p/hr0iiUJJwbJBC5kSQ6NcDDKAryJD9hKKnXOqw5owMZYdLpJsS2lEgHLVDTxiJGs+I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QJccNh4p; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QJccNh4p"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso1850057a12.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752855094; x=1753459894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4sbOB8EUknRai1AuJ9cdNWA6bF4sUdUbr8Aph2l+CY=;
        b=QJccNh4pGGJkLWW/uqk6o1CFbPzG2Cpwd8Ju0x/H6KvvAMwVtDhubkwqHPkiIDTQpt
         GiUdEL2+4sDqSMYho0tQJQmonKSJLSlNY4S1IBhvMemziEAPmfrNkBgBV4FMYpfkfB5H
         ML1SdQESgAFVoj7SS8gFqbKJPNruz/9Bq5LiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855094; x=1753459894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4sbOB8EUknRai1AuJ9cdNWA6bF4sUdUbr8Aph2l+CY=;
        b=pvdJIRQ+ofMD4oI5pt4/HK2d2VLzca0yb9UkVDyrvelg6Js3hMrhwAUc84jTmm3Nkm
         zSpP69hpZYxEkCUkG1+ILpL7tJ+NmPqthRzbR62pP3eQsEtilEHt3RkkAL0g3XS7xezz
         QA+PAGNqosLyenKuSIJrHkEhpkZtWFBnPWXkIO/TUZ3ZKdVlTwe+vCtpq3mW207vOF98
         ONJqThfLVEbE4Pz/XBbEDStpl2i5m/+lNepF6ewpwtNUoGw39vK6/beKaCVzqLT215iB
         FEkwMf4BWK8Hsdry1tBiePxoNZUK/kig0828JU2+acbFD4kEK6WnDQYVGmKCLbqbirhb
         E+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUavnoD/A3IoXUtPuVQB1bOAoXef2UAzaXQi5K1Mtn/Fm4++Twy0s7wvIkOEmzb00W08b8z7dINNsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrRKxYtZ6mVXth4XimBdZJwhped951v0SngWqOBCR37i8RZos1
	YkrdNUxvFVoziPCo7ewAImKowfXaplyQZHFKBAHwqMlHc/aZ93eJHT57DRj7mpaCDZvjZp7oeUa
	bRUE=
X-Gm-Gg: ASbGncv9xadGHL1jND7oORhaVDsPGz3AxEBsuwbWpGqgYeMfxBHMzbrcjoRTLn5qQ5c
	TlT/tEEa6XsgGV4EBj6iOT8qtdUbWFFe3WRROvx3ct+chwO/vTvvVeXHZQz5NSPOh8u/Q3oAh+V
	H8B5+xyvB2nuwx8Rl3f5kMPwtJMLV439sl1C8Co6S68Nzh5LhadCAdEz4IKIpn3K2IdLx9/bwYh
	5ddrQEeEBovxtS63yXzvnYT3EU6GM1w8we3sahMRQDgWzZ4ewuP4/A0aQ39fvcCRgs9cpQhAmJu
	mLNeeKYchv4X7GVsIlPE8My8q2iDZgGJ0sL+x/eB6NxE+ZNt3WdXEhrMlnFLuxuuNYblV/F92xC
	CgcfNMnzyz5XhwNa5G1E+151qzVx0/EPZ/0jh3vKauu2+mJmat96x2VpsxTx4MeUz1A==
X-Google-Smtp-Source: AGHT+IH3GJvuapZwa+5m8zkfg83QdlRhvrnJgBdHx/l0mor864INtMqNuwvKlyLhVWqQh6l43SeBpA==
X-Received: by 2002:a17:90a:c887:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-31c9e6f6ed9mr17663423a91.8.1752855093820;
        Fri, 18 Jul 2025 09:11:33 -0700 (PDT)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com. [209.85.214.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cb6ad7257sm3035038a91.42.2025.07.18.09.11.32
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 09:11:32 -0700 (PDT)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235a3dd4f0dso14505095ad.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 09:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDK0QvM7TmPXSRryFDOsZAvu9Wx792Cb9LBiNr1HdfSgu2lFQqdcCLnn/FPLN0gFkcs11XJOhi0XA=@vger.kernel.org
X-Received: by 2002:a17:903:2d1:b0:234:d2fb:2d28 with SMTP id
 d9443c01a7336-23e24ec73b2mr186837285ad.2.1752855091825; Fri, 18 Jul 2025
 09:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717164053.284969-1-me@brighamcampbell.com> <20250717164053.284969-3-me@brighamcampbell.com>
In-Reply-To: <20250717164053.284969-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Jul 2025 09:11:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
X-Gm-Features: Ac12FXz3KKf6EYjEda0vjUCQyFQVXEd84VY4Ny25pnbUOfssxeUq4v1dFeHX4UU
Message-ID: <CAD=FV=Vrp9MM_5de10sV-TC_mp-D7en9gjU8DBoD6mBrRvF2eg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
To: Brigham Campbell <me@brighamcampbell.com>
Cc: tejasvipin76@gmail.com, diogo.ivo@tecnico.ulisboa.pt, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 17, 2025 at 9:41=E2=80=AFAM Brigham Campbell <me@brighamcampbel=
l.com> wrote:
>
>  static int jdi_panel_prepare(struct drm_panel *panel)
>  {
>         struct jdi_panel *jdi =3D to_panel_jdi(panel);
> +       struct mipi_dsi_multi_context dsi_ctx =3D { .accum_err =3D 0 };

nit: can just be this:

struct mipi_dsi_multi_context dsi_ctx =3D {};

This looks so nice and clean now! :-) I'd bet that the compiled size
of the code is also quite a bit smaller as well...

Reviewed-by: Douglas Anderson <dianders@chromium.org>
