Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AC21C8631
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762205052; cv=none; b=p48VgkAeNQ2/4d0m78azG4uDJ6KBBUCReQhbZWgNKMP9CJo0XKGPPsCzpoJA+v0osnRASEM8GC9rzaGPzry0WsSt+yuMlB0pdu0q74pDZkBrxUQNfsttx73dN6OwswSC7R/CBKZuOqBiKhhMsbQlVKT7eqh5dQh+cW1Q3DUfSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762205052; c=relaxed/simple;
	bh=VbOJNq35wZZMKpn6zF3s2XM6+SMZiEab61NKw7H/8CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhTy7KxVaWbVR/3hBXGJT3jFa3TYWKKwrJkg65jh+XxYJQu9zSB4MUoIshx0+P7BBddhNhhxz8dp/XQ1PZIjDInuk732tO+x2heOtqFJQuAnx7agqgTlcsBJPy7sfXH0Ie53m4d8bzbAIvJ6+DIf60RGrM9+osXMVB4jBgfpNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qd5nzyaD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qd5nzyaD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a9fb70f7a9so387166b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 13:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762205050; x=1762809850; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Nht7Ga7UbT7S0pgUmdGlaMkNSqWf/hA/x/jfjEhJNY=;
        b=Qd5nzyaDiDJFIzUViuYfwAzjpoG2K85RD1efZRk8IK1YBUhqkdOzr8Nqgz5o3yjxu3
         zwo/NNtLqOw9fykUo44FCkJ78BA2jlpll12SfrlgQFbjgNbZ0oTcOwsntp8EMQarPOnX
         YRRCFlQLnJYy3iTjSDD8RuZ+q7zHSIyhtfeLDzQzjy5aJYHZX0znd2mz99BEOp9BKbHx
         Axt/xvN8yFjGtLvOHxXJ8nHw2dlMQnqnboYsvevE09Kuq3skxSlNdkp5mD9D4SSDhuom
         Xn1re5NttbsXHDc1kMgJX3xr0ofere15C6VxkqtAl3hQclhz0y7+BjicJ44buDPzHDuQ
         I4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762205050; x=1762809850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Nht7Ga7UbT7S0pgUmdGlaMkNSqWf/hA/x/jfjEhJNY=;
        b=OjB6qT8jy6FLuKnuEpfimFvDACzB9VSle6tvFR6k/X7gvXLAVaDCTRCjSFXZk3Jy/o
         us4qO52V5KKBvsfgVPoI+orV3Kq8K5oZs0CotZC+/vn5M5fuQlgV7NRr6Bu02ZUCD8Qn
         rm3yMZSIE6ibD4nIudPNzM/SbnNI6XuGNlmY217JcBNpxGc11W+An1dlf4IV1KArzXqo
         I2mTX53LVwxGvzUuV1cjf1WZtBGMOTUKrc8aWme6tOEVrXnqspOQ/KxERfPkIdUsqEhK
         bU958NL27IRbBcB1sIVcNbgxhdUP1pORWD/o7Y5PpbER57a3eQsrTlwOkk25EThKEr0t
         OCeg==
X-Forwarded-Encrypted: i=1; AJvYcCXSl7KmSAhwivvMxd7rV4gbW8ZtxxNvL3nkC9A1aFPuDmyn5+5wXnPeGtBQ5KMpyie3xwASPmYUQ6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKC6eLgsSAnUI6tGtwa7Wf7zS7K5+rswDDQYZ6avyC+6TtvALJ
	eGyjLLOOnFTH5jHZEoRaih1Y0aZndhFWDfzfvW4rA/kkAlQzjni1Hy+XtOwDlw0P4ACz99PN3OR
	+YqI8BBAvQ+kfZ7psEMuuX2gp+wJFaeGyOg==
X-Gm-Gg: ASbGncvFd/siUVkike7Vz+OuV38hqmtNTjdsbEPi7h9T79QNLU2RadquLBHAQUysMPB
	23CRtJnSAiBTSDUj0vGHg+tTAgUnjMjmvjYKbKPTJ6q1XDPtAiwJE2bjDNy9SENveeTIdwqps48
	raQzT5CY7L2SVe7X8IcIRM6ak0YZkPkIzZVm1yWh5qzH+O+r/RVYBHwWGzAzrgsmazlrKtzFqfl
	DLmLvQbiCcK3IoJTM+wpSiLkXqd2q6RfusC9MJ67dl/B3zR2HBiG5oAHFdY
X-Google-Smtp-Source: AGHT+IFY8+2qFA1oiKosDS/rAbxdW43gmN+fJej+sar+4puyVhhm5/G83MSiXSxR/0mkFd6qHx0UbRoOd1MS3ZSWVwo=
X-Received: by 2002:a17:902:d481:b0:295:558d:a464 with SMTP id
 d9443c01a7336-295558da62emr77743435ad.7.1762205050142; Mon, 03 Nov 2025
 13:24:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103-vram-carveout-tuning-for-upstream-v1-0-17e2a72639c5@amd.com>
 <20251103-vram-carveout-tuning-for-upstream-v1-1-17e2a72639c5@amd.com>
In-Reply-To: <20251103-vram-carveout-tuning-for-upstream-v1-1-17e2a72639c5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Nov 2025 16:23:58 -0500
X-Gm-Features: AWmQ_blvBwcjDFk_MBDYqriTXRTTpOTzumlZhYcWa0hA4X0Y7q8ncHOD5PHapVI
Message-ID: <CADnq5_P66LndOd5aJs=BN8btde1XNumCRZL2TZ1yfFfUwyGJOA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/amdgpu: parse UMA size-getting/setting bits in
 ATCS mask
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, anson.tsao@amd.com, superm1@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 3:01=E2=80=AFAM Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.c=
om> wrote:
>
> The capabilities of getting and setting VRAM carveout size are exposed
> in the ATCS mask. Parse and store these capabilities for future use.
>
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

This patch is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 4 ++++
>  drivers/gpu/drm/amd/include/amd_acpi.h   | 4 +++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 6c62e27b9800..0743fd8620e4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -116,7 +116,9 @@ struct amdgpu_atcs_functions {
>         bool pcie_perf_req;
>         bool pcie_dev_rdy;
>         bool pcie_bus_width;
> +       bool get_uma_size;
>         bool power_shift_control;
> +       bool set_uma_allocation_size;
>  };
>
>  struct amdgpu_atcs {
> @@ -588,7 +590,9 @@ static void amdgpu_atcs_parse_functions(struct amdgpu=
_atcs_functions *f, u32 mas
>         f->pcie_perf_req =3D mask & ATCS_PCIE_PERFORMANCE_REQUEST_SUPPORT=
ED;
>         f->pcie_dev_rdy =3D mask & ATCS_PCIE_DEVICE_READY_NOTIFICATION_SU=
PPORTED;
>         f->pcie_bus_width =3D mask & ATCS_SET_PCIE_BUS_WIDTH_SUPPORTED;
> +       f->get_uma_size =3D mask & ACPI_ATCS_GET_UMA_SIZE_SUPPORTED;
>         f->power_shift_control =3D mask & ATCS_SET_POWER_SHIFT_CONTROL_SU=
PPORTED;
> +       f->set_uma_allocation_size =3D mask & ACPI_ATCS_SET_UMA_ALLOCATIO=
N_SIZE_SUPPORTED;
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/include/amd_acpi.h b/drivers/gpu/drm/amd=
/include/amd_acpi.h
> index 06badbf0c5b9..e582339e8e8e 100644
> --- a/drivers/gpu/drm/amd/include/amd_acpi.h
> +++ b/drivers/gpu/drm/amd/include/amd_acpi.h
> @@ -427,7 +427,9 @@ struct atcs_pwr_shift_input {
>  #       define ATCS_PCIE_PERFORMANCE_REQUEST_SUPPORTED             (1 <<=
 1)
>  #       define ATCS_PCIE_DEVICE_READY_NOTIFICATION_SUPPORTED       (1 <<=
 2)
>  #       define ATCS_SET_PCIE_BUS_WIDTH_SUPPORTED                   (1 <<=
 3)
> -#       define ATCS_SET_POWER_SHIFT_CONTROL_SUPPORTED             (1 << =
7)
> +#       define ACPI_ATCS_GET_UMA_SIZE_SUPPORTED                    (1 <<=
 5)
> +#       define ATCS_SET_POWER_SHIFT_CONTROL_SUPPORTED              (1 <<=
 7)
> +#       define ACPI_ATCS_SET_UMA_ALLOCATION_SIZE_SUPPORTED         (1 <<=
 9)
>  #define ATCS_FUNCTION_GET_EXTERNAL_STATE                           0x1
>  /* ARG0: ATCS_FUNCTION_GET_EXTERNAL_STATE
>   * ARG1: none
>
> --
> 2.43.0
>
