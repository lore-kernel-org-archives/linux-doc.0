Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE60296BBA
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 21:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781474093; cv=pass; b=O/sKemVcArKo7j661B2R94R2hNlldxKrNS70/IqF7hi9XyqpsecvzQGtBakPR/qLBghVFJA49yOq5angQn0ItmnhVVwVNVMadzvszDCM6s4IAjf3hvY72Qy29VGnb44qqjLu+57UCKFCgQFYiDSnAbh1EkPASCjBaWcoilLucgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781474093; c=relaxed/simple;
	bh=Qf0yMsCZ9zfXwkpc4N/auG7ERVD56pI5iBAnYfGz674=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ud4DhwyURLfajupSWVnLAs15P1rbLXGdH4aay+bBnnYDS9yoR5GNOb2i6TLi+LQKUctbJ300XMN6WIIF5KQBu0oapCUP4u129FMsCoT+WGulzDvizwJhSDAWUMjrFYB6OlOjjwbAgaPI7LIdZcvroVuU+xXxrrdeP53ZlaPIXAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwVIGJL3; arc=pass smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwVIGJL3"
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-8ccdf8d4ac5so34076156d6.1
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 14:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781474091; cv=none;
        d=google.com; s=arc-20240605;
        b=IERdVGq69DI+PQSAbyC8tlORq7MM6Eka4K3uNqplo8kO1Lq2dUQqj8lpB7c5Qlhq2V
         PCGqITj3caMqNEE4eRSo6ncCTlvfUK1K+iAE7VYwnfAeSahyzMSIgbFK2HXeb+Etv8Aa
         8UJWXmQtpP9H10NiKLW+7NtIHkeCLAJW6QKSkes7lEwI0y7npdoP4iQT0naIa3m1/S1e
         FGGi3hbjR9PjkFADHiTSPeTqgK7G7EHgHdtA4bfmYkyhNLZUn3xs+maNG9IyrTD/Sf6l
         cs0eAktB+v2mwzcXqWCOuPhOOuONURJeF4Fit1swmoLBVdVbyPkX3cZfuEHnU87aaBGw
         hdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qf0yMsCZ9zfXwkpc4N/auG7ERVD56pI5iBAnYfGz674=;
        fh=Gn6F8ZoD1Rj51Vp7duPtbmoOF4c/a+KNfujdU1cUDvQ=;
        b=hFGSeqVITSY9RS0QdL2Y5rSKtxyPmcGpJXixx98U4s3CTKejtNdKt/NM/s8tg66Sgx
         nQATsBDFDZ1OUh07DhZ7WQ30qOn0Klk+m+NpXXov2CYX3c8zj+Ouw0lOpTp9Z+WW3thg
         qyRoa+sd9kb9H7CSf9iZWQzcbFwjXN8ScKkm3FZ9bkezbgeWX+6E/xRRuo6zPUPRAbPO
         D6hPdS3OiDIv9cMoLXxw+WNmqJ5RkvIVIv9kvk6ZZ52SFj51cPJb1TNSEEpmi/JKEGkU
         UfU1IJvm15Ib2JTvl309MGtE0Kt1xMKuXGKkY4EWSw3I7tevz2HxFtNz3xfYKYpFfDCJ
         cnDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781474091; x=1782078891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qf0yMsCZ9zfXwkpc4N/auG7ERVD56pI5iBAnYfGz674=;
        b=VwVIGJL3gfY+Tfk/xR+0QWVqbyQFqhejzInQMuy8/GCPpckqPFf4GghFfanE9Jrdt9
         76Oa2TUFfQcFQyoToYetxVdQV3sj9f9xp64dg9Sshk3OXleaIjSIxbQWvEUhlw8SL8pl
         8MWvYc0jn1jbkqNLZH4WTYE+E/GKH8+0y4wAAsKVcPTodcm0UoVw5mxKYwQhpPc5aTlh
         iGmHFo4SgOudmROyx3lb/v1Y6SEYwwQfk7MTmjr8ZrunwyUmUcOgElR1NIWfEQR6Rq0I
         a54u+R4tgQBCEkKtenHL/gqLQGy+uVSzKkU3IgcHTYPztY5ZTUHwojcIPVuixT05+B4e
         7m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781474091; x=1782078891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qf0yMsCZ9zfXwkpc4N/auG7ERVD56pI5iBAnYfGz674=;
        b=kaHl+Pscr5yS06PIt5lnIxeMIQEo/lk8/Gqy9K0PxW/29IyOC35Cr8+QJW6la/F3Nh
         fY5JBGkeHNqwQI3OTvkG9Y6ffyikao2Yra2bLh6EJnzlkr0DrZKNYZtcBQEgGDZYBuZL
         lvUEn+XNCjPMyCkHGQ2rscFkJOquYXzoWlnohoYqQSHAzHHscwlJ47NQzHq2Ctvrl68p
         3cq4DLlQBNtzwjO2MKhEqpZkiPIzRTSkShqXA2kJGKy/XyVPG+sXFb2EFiS+Ny2bYEDz
         f8pBxO7PzN5KEg0M2j+wZQOBjwIXVDgAJQdfrsV2WxAmec8yGnWax8G8LlqOrmIQSvPU
         JI0g==
X-Forwarded-Encrypted: i=1; AFNElJ/d/uPd2KboA8rU6hKSSErEWP1W2aUpA5OHG6z43l8vzMipusxc1IKM2SwXoVQT1mfPB+2mrErAfbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywGofDMY24HcwtHaQm4zayMx4GUG+IKgYcDzmRFgTMRyOCd2Cq
	mOsQTzyPrOCQGizfh0jPt3XHQjavKQiK4AxVUQycJChPUvgNi2/Oh9KTLk6JhhFu8CshQUFAa1Q
	JYONekW9WRV9g2/aTZx8qg/TJ3RG6yK/tcGtlXcs=
X-Gm-Gg: Acq92OGcOf6CZG9jHXtm097Uznc7bS39GSdMw0O2XoTFS4l6PELiuiAaYBmosC88sMG
	c6G4nQIf9CAo6zQcDtKhlKua8/VYsV5u5rC064o/Tgbiu91F3LTJXECvrnV15Lfigkx5nzEWP+k
	zkQonrp9NWyEfJO+eZUpCXXwSeHtTcBChbr/JZA7RrgkT7UFcEVapGfF2BvJVLwiu7aoOlpjJaP
	2o22aFLU2oZDyH9qURH//QvEz+mpFZYubRS+9oJzjBkM5T9AbHy/2c5Kdr1elixIoQDG3V7M3yr
	vVR3mK8Zvc+aCReTPa/c5uqow2W/CCGX8aBdT2/79eMKDqtXfTwb1rDnL23Jvw3yGkgT
X-Received: by 2002:ad4:5c67:0:b0:8ce:b2e9:a4b9 with SMTP id
 6a1803df08f44-8d32c010c50mr222142596d6.12.1781474090995; Sun, 14 Jun 2026
 14:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613232830.147116-1-enelsonmoore@gmail.com> <b677c9e4-edd7-42ab-ac0d-d721e7aaf2e3@gmail.com>
In-Reply-To: <b677c9e4-edd7-42ab-ac0d-d721e7aaf2e3@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 14 Jun 2026 14:54:40 -0700
X-Gm-Features: AVVi8CfSX4qmDdsQamkpbzjwvo5yJXKL2cP-eBfvDM14pSoM3YhHwOkZ2X1pY34
Message-ID: <CADkSEUiY5n0iTPmvUpbrVL7g5PpTUEi11R2Hqjdh-zU1B=7FhA@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: remove ISDN references in Makefile examples
To: Julian Braha <julianbraha@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Chen Pei <cp0613@linux.alibaba.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Andrew Jones <andrew.jones@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Julian,

On Sun, Jun 14, 2026 at 8:00=E2=80=AFAM Julian Braha <julianbraha@gmail.com=
> wrote:
> Hi Ethan, are you using the kconfig-sym-check[1] that was recently
> merged? This dead symbol check should not have the false positives on
> documentation.

No, I'm not - I had heard about the Kconfirm project, but not about
this similar tool. Thanks for letting me know,

> Though maybe your check also catches dead symbols in C, Rust, Makefiles?

Yes, it does; it has orthogonal functionality to kconfig-sym-check,
which only operates within Kconfig files.
My script checks for CONFIG_* symbols that are referenced in code or
documentation, but that are not defined in any Kconfig file. The
decision to include documentation is intentional and has revealed
several instances of outdated documentation.
It also filters out symbols that are defined in a Makefile or
hardcoded with #define, and also attempts to filter out structs and
enums (and typedefs thereof) named CONFIG_*, though I need to improve
this further.
I will post it publicly once I have done so.

Ethan
