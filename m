Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBA94AB3A2
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579763; cv=pass; b=oEglqKISqgNp04CeXcJA4NHK/O1Jetjr8TiutMoOUJF9jEgJRWO2cwAKvPK4NVD0eTVaOvM4S6eX1ns0iv6xzvcR64Mk+Rqgb76zTtyil6Pg0nrYRKP5dFmU7KENyciZM1g9e5tkTBpKCsgzgQvWamXrS/LFwKFfV57qqRSaCec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579763; c=relaxed/simple;
	bh=SxMiluOD0uK5+ILAX1qVVq9oZ2A/QJmNeyQU2dGZ29c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+1//jdze/c56Dr4qW0fzhknN4v3tg+Ok2yNiEI6ARgUwYbKAdd3q/TC8bAJADK6nwVr8JgxDYpKs+d2gSPyAwrWSnoJwbIbTzSBQSB240LbQmDkrZYdr4PXM9/fP5SOuBiiUEUwhRCvgoMp1wzbGvyYFfAWkrrnl432Wsn2Wu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b5sU7hQ3; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b5sU7hQ3"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so180068966b.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 10:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789579760; cv=none;
        d=google.com; s=arc-20260327;
        b=tA5fD0SysqWTGsqfBVh0ENfnu40ULHBODKMWr4iPtU842toLu3nPI1PBXxSVSXLz/X
         ov4EiR37EQgeoDGs7AlGCmtM2Zse49sAe/G9rZPDMs3FQEv7F/dazTeIzmklZWJlBK2t
         tfwgNfV8dO2baT/Xb9TmNmmcRnztZRjNU/DbEhu9uKl9axNUjSey20dxYppZXk7ii3FE
         ysuvo8twzLuUAR6yhV9gUa8galvePk1OSYqEH6yoP1t3GigVVfVtAh5HBBSWrKqgmJCK
         xSfqQGUagAZMP+oZh0RrTl16kLMkZIVsH1P6ZLmFGJyto9hsPxbLl1b2yDQj1tft+JvO
         eo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsBp/K/8Mh4fs+CJj0dFevHba775OvfQ8W0kzE3hMzk=;
        fh=PcAxDe7Sw4JnSQqIH4ghBaL5NrNahrsGNOcsz/LePPc=;
        b=R9xVEyk160Fe9gd2faI5eXM9L9Ii6OUX5cfDUptm2H0Q9LbAl7yJ0XKQLfNDV43J4W
         ZIVQTofBSbsygNJ9Dmv+vT5+IPT4lcSWS1nEOFIfiHL85DHxQiH3rWCOEdGEv4aCidBN
         HG/7Z6hFC9hrNzEb+7cI+pQWnCxZ29zKdWzsu+MT8EWpgFoWxoQqEPacmj7TyHhGEWwk
         xidLivgleX6lMH01gQ2ZlMwbI16Jidx3t+bq8ivtx21cOIUitoKqPHNRvZGyBEx1rzNw
         gmh4wyA3c1W4dB4Ls0yZP0DuwUQtZRr3H/uADvnOL0MY67A8VOccEBC3oSR9rW3RY9nD
         H95w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789579760; x=1790184560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MsBp/K/8Mh4fs+CJj0dFevHba775OvfQ8W0kzE3hMzk=;
        b=b5sU7hQ3GCD+ocTbm7CUFqMmSychwuLnFWguz1+RZbFsQl/y5MDpcVHlzcgYO9LRmL
         RqIatYKNkjEwDKwPPXokqZsxaYStOVConRKHo0U8JUApcmsEhDzupfQl/7nTuWPIPbbP
         wPZxEMhOz2eHoW6H2C5sSSjnfSvlnvIPmK0AOuQtEmrTn6f9W3ZSPblh5vp3EL7gCa3I
         sfP1FoeMbJUw31985PL3cjYAj1/gnl9LKmKW2XInqYtfEjRg3wLkK3bcCsAEJyJ0kNeg
         AHVq0lXDrFj77SZWwkfkPqG8IeMB2aI3Dk9wtEbza3c63y9jpC8ZtWwpR5VP5kFXoOI/
         bhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789579760; x=1790184560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsBp/K/8Mh4fs+CJj0dFevHba775OvfQ8W0kzE3hMzk=;
        b=gNvQ7lUuD2woVDqQMaCMgkZlCJ8SuC0TK9YTqRWfXiBh28ulsyK0eEqcs3E7I4mZkp
         8ZEi3q77YXmyTt16auB/smdVdyVPd/hzDhAJwaCHdzfrT6F1huBhxSEh5D/BnM7fMmQ5
         B4uIM/40qy3vkINkniPyTozd2JnALouEqkUAcemSiIaPk7vQC1aA+lznTmEW7VIIJeOJ
         7p2FSCm9+nKKYuEQRBnUXF7cfG6eaZpxkP8pIcVWgYnNYOmdVDYWYQOsloVKAjkXZz1E
         Mzi3wd8WHqA3FcPjsO6zEqFpNVckuWvRPYo8EB+wUatCRQdYWaALi/X0EeFb+BkcoWrI
         GYxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSBfJYHOGfoKc50nWUjQClkIGqIFJ7VVuQRCHXgAMlDwdyKQKfzn18z0D4s64AUPg5hKqhpUAQYw4=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ8gNb+0NwfO8X3NGslJwlk4JBBIThGs5+Ra3/D5eE5aEbg2eY
	68lPKwJQeOSz8hM63fJJUFuOikTHhbE6DHwSKr/Rp0Mqsu6hy9S8pQHueL/QkmftfqOurlPNjQV
	LHM4zsgtSjokKKIowHY11vVitWc1lyr2F3MXkDVFn
X-Gm-Gg: AYBFou2MQcms0wI7PoPLe+r9ukjfrndINT3g3X+GAKKQX6HtLbsQ3lZ6qWT7cLyR00w
	v4WSTweZxB4z6jew6R7rjhUnnoPGAo3h3xLBvhPI+LsvKyNMBARrJbc84zoPiasgcaPIt3np2Me
	Fly6iQI/eEQsdUriWlPomv6rB0xakGpy5V5bGsnGz/lw1gNgZ9sIOxrBreuMt8YRxzVuv/b5kEx
	Raq8vN5qQ7J3SbBi+MO0OAMzQj4hSV3IB1U4fD24zXyVjFhMsh1Fy92eVSwqfCdNSFG7p8qUqks
	kyI4fJnLQPxhUxk0s3Ob2fg8dk7y+pZw9QPZ1EsntLJVnkNRK0NWIDIsZv9aUvk27iegVCFBVPU
	TXZ19l/iNt66zIJv3tq6k
X-Received: by 2002:a17:906:c114:b0:c29:52dd:317c with SMTP id
 a640c23a62f3a-c29e52ff5aamr253749566b.30.1789579759601; Wed, 16 Sep 2026
 10:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com> <20260728221007.2098560-4-dmatlack@google.com>
 <e099cbaf-3185-4c39-ae36-7f0e074ebff7@linux.dev>
In-Reply-To: <e099cbaf-3185-4c39-ae36-7f0e074ebff7@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Wed, 16 Sep 2026 10:28:52 -0700
X-Gm-Features: AcwNN1X8OtlPLlB_fEFGTTxlBHL1RWBLk55_RIeZg7bMhopD1i4pmTuVWaDvZaI
Message-ID: <CALzav=eX0gVrbWCnYGwfqPHUkoVxqdr2nw3Tx6Aqze0XOcuwzA@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 8:31=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.dev> w=
rote:
> =E5=9C=A8 2026/7/28 15:09, David Matlack =E5=86=99=E9=81=93:

> > CONFIG_64BIT is now required to enable CONFIG_PCI_LIVEUPDATE so that th=
e
> > domain and bdf can be guaranteed to fit in an unsigned long and be used
> > as the xarray key.

> > diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> > index 3781e2b5f095..8af20f558086 100644
> > --- a/drivers/pci/Kconfig
> > +++ b/drivers/pci/Kconfig
> > @@ -273,7 +273,7 @@ config VGA_ARB_MAX_GPUS
> >
> >   config PCI_LIVEUPDATE
> >       bool "PCI Live Update Support"
> > -     depends on PCI && LIVEUPDATE
> > +     depends on PCI && LIVEUPDATE && 64BIT
>
> One question about adding 64BIT to the dependency:
>
> As I understand it, enabling CONFIG_64BIT essentially means that we are
> building a 64-bit kernel, and a 32-bit architecture cannot normally
> enable CONFIG_64BIT.
>
> If that is the case, would depends on 64BIT be necessary here? Or is PCI
> Live Update already inherently restricted to 64-bit architectures by the
> existing LIVEUPDATE/architecture configuration, so that this dependency
> would be redundant?
>
> If this problem has already discussed, I am very sorry about this.

The necessity is that the PCI core needs to store more than 32-bits in
the unsigned long xarray key (see the snippet above). The dependency
on CONFIG_64BIT ensures that unsigned long is big enough. We could
probably remove the dependency but I would rather wait until someone
with a 32-bit build has a real use-case for using PCI_LIVEUPDATE
before putting any effort into it.
