Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDD9239E9B
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764619657; cv=none; b=EIkyxIDM+OqIiAQkEkXqxyetto+HdkYpKEdetOmVkgXdGPDwRsUD6oQm8vi+4pDoNg2K3YztfnaRWdF3ZkSnrVSLMv9Hv6U0VGEF0BQ3rMqJAxNcbhPejQhkYsIPHQ8HIJbh0peaCVnjPvswpC54BN9Xc9q0h9KcibX3awV4z10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764619657; c=relaxed/simple;
	bh=x6RFIT7cB8JS3fsGLH/whDORXRCGFjJFX9fPXazdsq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eJHsWHXxK78houXdadLuW5ORrl0fwhob/bTSs4ktvPIvBoVhTN+xiV/XeW+YXOb9wIKLV1ZxLQC1A4JvqoNWklCavL60INdlYMxIb5vjQ5BBBYekb5vBIUBlw/I1VLkl4YQe0Sz0G6DErXktiFXbNFW3H2fHkECKQTrwDjQyPTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gqto+xom; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gqto+xom"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a9fb70f7a9so328923b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 12:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764619655; x=1765224455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFlkh0x1NbS1t8t4BD8VPVaskiHRE+O0jVwyL6SlPB8=;
        b=Gqto+xom+6i6kO/AGpvr4r7ecqIz8spDmvkjDQKgqRgJM0uWgWy6oiBAhLB+4Aj7vw
         mVGOEfXmmorOxud1uiLSIyPKDP3rIl9t/cdbVWqNCdQA0XtZgLe50rLuqV0RxaC3PVLY
         C7ergrwLOC4jsE/oJWLhAtyFHh9gSOlrodoEuFy2Cj1DSSft+gxE3TrycFQygNSAxe+3
         jS9BwiYyRxQ8ZyhgOaqBXTrMH3OGTdIKwuDbCDMyn3aNos5NDXEGeyTeBtw9NQ6MM9Un
         uEg4VZ1p6gVZq2W7YL+e3pOSn2oaohuLywqX3qT+cJxPUVj0D6swW87zIbwgrIPYPNWE
         6iKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764619655; x=1765224455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BFlkh0x1NbS1t8t4BD8VPVaskiHRE+O0jVwyL6SlPB8=;
        b=c57Fh+DtoR9jlJ0UCeh2YsiNRcxQgtK+lC94cFwzKsOlMDi29QqclzKeSOsfELOIs3
         LrZ+pbrL5P3q3nlnlfCLy/iDIzT5kIPYpeG0riIo7sYOxiFDehayTaNJ4FxlwQdG3nNF
         c+eLv3escVNhBoJXacJYM1pY4kB+i7QUxTjIAUCV4yx3Kc1NEbwqzV7m9WwqTQ+6fQsl
         x8+J0RFAZzYIEQI5CFUPyFa++QdlXCklAn4Bhh3YFkkHODd3GnJD1h2k2qdynmkoVjtY
         GNibWI7V6uKpE5sxOxM9Epb+gDEeV8HlyLwvkyxogfHasPTL53qrce9DUWAsEE1gOTgQ
         GhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBijfc5qS6kxiwf8zS8VGV+Ax7MuzADg73U+lpEoK8UnlCIU2GRnWqlAVWbkOYEd5uo4JG5F6rMRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwevN1hwOCZA+UmQlH6WraPNCbGQviR6nH8mvOKiM75UsgEEMLU
	Eq3dWzU8D75nenG/M8CaUgrz2Idywtmq6xZKlMaX9jjpBbgx4xfxFKre6PWNLgsaDJ5HNwJtgAR
	Qp0EhwvhLm9T/7UwTbsv5UeuuX0R9/PA=
X-Gm-Gg: ASbGncscBVxTbxgG4w7yxIu5LST7U+MhkadRFz4UrQwuSDsri1lXBggxh8x0wDol2Yi
	AMYmke8cFG4i95zKP5L0KG5hWERJbV3J8qSdss/qirnB/NZwf28RDsNGm6JQlfKFz0G9SDk6l2z
	vfgodn5nMf0Ocnca2an2LAWB2loH9QeIqId2wrLD4SkSq/OoNJkpBZhpay7H9L+S4+sWXoyWfj8
	vJ4n+wPjpOpuGnaDVup3Uzspvgxrxb8qtsb8g9FIz0PARgyKgI2KAqa8o83B4yg/pY+Gb0=
X-Google-Smtp-Source: AGHT+IFjpTqQA/iVKOmnPlXFftG449Zgj2MyZF1V2Usatcen0jqoEPFaxyLMnJPN79+d1UKCZT1eRBJWm/HIcRCi2Ok=
X-Received: by 2002:a05:7022:ea48:10b0:11b:aff2:4cd5 with SMTP id
 a92af1059eb24-11c9d717ef2mr17763072c88.2.1764619654777; Mon, 01 Dec 2025
 12:07:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
 <20251201-vram-carveout-tuning-for-upstream-v4-5-9e151363b5ab@amd.com>
In-Reply-To: <20251201-vram-carveout-tuning-for-upstream-v4-5-9e151363b5ab@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Dec 2025 15:07:23 -0500
X-Gm-Features: AWmQ_bmEAiYSVqdTHhyDGqmv5Ses8SmGqN4749Kj9liHcOpiVpdUt9DVbmJ1CX8
Message-ID: <CADnq5_M6MVRi8SBjtQvnsR1hZU9qRYEPXQ2vc92x3nQPY-QHcA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] Documentation/amdgpu: Add UMA carveout details
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>, 
	"Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 6:19=E2=80=AFAM Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.c=
om> wrote:
>
> Add documentation for the uma/carveout_options and uma/carveout
> attributes in sysfs
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/amdgpu/driver-misc.rst | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 29 ++++++++++++++++++++++++++=
+++
>  2 files changed, 55 insertions(+)
>
> diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu=
/amdgpu/driver-misc.rst
> index 25b0c857816e..cd6f044bea85 100644
> --- a/Documentation/gpu/amdgpu/driver-misc.rst
> +++ b/Documentation/gpu/amdgpu/driver-misc.rst
> @@ -128,3 +128,29 @@ smartshift_bias
>
>  .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>     :doc: smartshift_bias
> +
> +UMA Carveout
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Some versions of Atom ROM expose available options for the VRAM carveout=
 sizes,
> +and allow changes to the carveout size via the ATCS function code 0xA on=
 supported
> +BIOS implementations.
> +
> +For those platforms, users can use the following files under uma/ to set=
 the
> +carveout size, in a way similar to what Windows users can do in the "Tun=
ing"
> +tab in AMD Adrenalin.
> +
> +Note that for BIOS implementations that don't support this, these files =
will not
> +be created at all.
> +
> +uma/carveout_options
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +   :doc: uma/carveout_options
> +
> +uma/carveout
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +   :doc: uma/carveout
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 2c0405cdc436..58f6000f4e54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1248,6 +1248,24 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device =
*adev, int xcc_id,
>         return -ENOENT;
>  }
>
> +/**
> + * DOC: uma/carveout_options
> + *
> + * This is a read-only file that lists all available UMA allocation
> + * options and their corresponding indices. Example output::
> + *
> + *     $ cat uma/carveout_options
> + *     0: Minimum (512 MB)
> + *     1:  (1 GB)
> + *     2:  (2 GB)
> + *     3:  (4 GB)
> + *     4:  (6 GB)
> + *     5:  (8 GB)
> + *     6:  (12 GB)
> + *     7: Medium (16 GB)
> + *     8:  (24 GB)
> + *     9: High (32 GB)
> + */
>  static ssize_t carveout_options_show(struct device *dev,
>                                      struct device_attribute *attr,
>                                      char *buf)
> @@ -1278,6 +1296,17 @@ static ssize_t carveout_options_show(struct device=
 *dev,
>  }
>  static DEVICE_ATTR_RO(carveout_options);
>
> +/**
> + * DOC: uma/carveout
> + *
> + * This file is both readable and writable. When read, it shows the
> + * index of the current setting. Writing a valid index to this file
> + * allows users to change the UMA carveout size to the selected option
> + * on the next boot.
> + *
> + * The available options and their corresponding indices can be read
> + * from the uma/carveout_options file.
> + */
>  static ssize_t carveout_show(struct device *dev,
>                              struct device_attribute *attr,
>                              char *buf)
>
> --
> 2.43.0
>
