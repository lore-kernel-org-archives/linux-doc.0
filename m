Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14D27F736
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 19:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763408625; cv=none; b=mWmPTipv/GMGpV+as2I3QBXeAgTm5ttp+UdRArCfG4TMQ3wbg43UOajmAX5ErMw8SWLFhGO4Qgomm80PARn8MbkzSu2ch0FeFB1rUSyRzElqyAwSQZWbRN2YnKOAYEMbPeip3agnlQs+ESqdRu9JFsK6E6TGQXAl8/nQRVuo8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763408625; c=relaxed/simple;
	bh=E5EgLJxiFWrUrMU0P9eHzvAIhxVIjvec9Ov21Tuxix0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyhU8GKQeaAmBc55wgQdVbNNaRe6RfabOZB94yDw+cCnuJqipr3HFxqXTf0CrkH7q2zlycjbdv1iGAMvODp7wZzDa+6lcNcPzgw7bvZjT4NTAoEGBqTHXIzCE+ABuvJkbsKaXAgwX8+JeGzrAW1XaoE6GrlVrLASw7YSdfGCkdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWEWhdNV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWEWhdNV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29806bd4776so6188645ad.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 11:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763408623; x=1764013423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+5Hf3TIECg/WJ3vcEYDCdeJ1dVpbMxZKUO+m2nTD5o=;
        b=RWEWhdNVeuhI2jfnzNfU6YOSY7ISbvhAdUD+wMTtuuC1ARVZ/occfLV6vfb7hz2zt6
         +JZ3544CVW8GFbEupJlTyZGUVrFSivvo+kO/qSLukoUxaFTNizaoHNA4l94CRq/1TSIl
         kL3bGweV2w3z+3RNOI89HfW3aIZExMnm0sbitXRAPRbPSGfCI6qUFm8K7mexM4sspdg0
         FW1EreS+Y9+BysF5uMbIlLD7YMX0IaxAa8cYVadkNo2XQb302pNjGUsfoACEHegfidKy
         GjWeGTlQ/2HKcVAD27aPwPz4fus9PeOOnETWgeKIYXvOcprJmiKks+fHnMQCEjMquZQM
         B8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763408623; x=1764013423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/+5Hf3TIECg/WJ3vcEYDCdeJ1dVpbMxZKUO+m2nTD5o=;
        b=Ytq8JgBdhdS+Ad5VpXUA3JqlUtHVRn8YZGfhQJNBaXZThLKIQV0+/Zu4kNdsLBMBQw
         nnUVm7GW8RI0Kj0bFuWqzjeLlbWzl0/6OidB1jmfAYF/2lhfTEgMJkGjRyyZ7SyiiRbo
         +XA31v1qgsDuV+rPPHzp0fqo3EKBucOH+s66QVz3GF6s0w0rFPhSsmGzknHlVSgJk4rV
         PTADat5tyiqeWJmFoc5pbQ2q+gS9KJNZx8yzxB+S/+gChokEekDE8SqNte1Xq3nBdPuJ
         OidZ9JauyIFQYRtY5S+/bUT2O+BcU4tkGSrtTHfNaJ1X8DeVR36Zvx3QnCl1C2uq6IJt
         N/bg==
X-Forwarded-Encrypted: i=1; AJvYcCUMIPvAG/dvKRzHwucGypqQTSiOaSVwWdapjBlDNkBSgkLF7wvKjctsoL8TB1Fce5yKp6t4FtW1Uqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGjnqp2UJQfovpNGAMAeqGD7hfEdzuzQTmNmhk28UBR3yi73f
	hMmzqHyJh9mz7JStenTJ36YRLaREBmw+C+mUtiNT3ybLoXHcBkD64UHdYTjG7Pak3sQm/EKlVEB
	c4YF5yxf0R1N6h9UyhNlCNPKx4GmAOng=
X-Gm-Gg: ASbGnct8nxyIEB7Q8VaYEsSePYsF3HgUPiNUDt4xK9H+H1lj/ifkncRTjNhpMdJqcwX
	gZo6jqcOdqazIFdl3AZWt7DbKEnbBlVzX/ix5mKkWv0A6xVoVVxAgn7KP4OZqVf8jNyXMLIe9Gy
	Z/Jw583PtCb407Q0EqsVYHVIMpxx7D96uv/TxsmJwRIGFY1EmSvlC6g4095nTelxTpwwIpkRrNh
	Vh/vW+OgoiWvapEP0ccM+q1voN/EemDEVjiS3Yk8C9su+L2axQ2J+kOWGlF
X-Google-Smtp-Source: AGHT+IFJT7XNlWHFboAYjTqdvl7ansBxArPIS/GzhzEzb3yO8TC3LpcI1Q9gDnb4O5U1xZ57lT1Bq32f9CGrvBl2Zyo=
X-Received: by 2002:a05:7022:e0d:b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11b493dbc02mr4800591c88.3.1763408623379; Mon, 17 Nov 2025
 11:43:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
 <20251114-vram-carveout-tuning-for-upstream-v2-2-4f6bdd48030d@amd.com>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-2-4f6bdd48030d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Nov 2025 14:43:32 -0500
X-Gm-Features: AWmQ_bn-rx8YdtVYoFVyGRgVCjAn1BgDod9sCkmCCuCja0xAzzBGgF5NjOGu8mg
Message-ID: <CADnq5_POzLjMetvQAW6gi8Emp5OM-VyrVmKGJ5t5w2S=5POjxw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/amdgpu: add helper to read UMA carveout info
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

On Fri, Nov 14, 2025 at 3:52=E2=80=AFAM Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.=
com> wrote:
>
> Currently, the available UMA allocation configs in the integrated system
> information table have not been parsed. Add a helper function to retrieve
> and store these configs.
>
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 32 +++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 73 ++++++++++++++++++=
++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
>  4 files changed, 109 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index a5574e84694b..2c1123291577 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1675,6 +1675,38 @@ struct amdgpu_numa_info {
>         int nid;
>  };
>
> +#define MAX_UMA_OPTION_NAME    28
> +#define MAX_UMA_OPTION_ENTRIES 19
> +
> +#define AMDGPU_UMA_FLAG_AUTO   BIT(1)
> +#define AMDGPU_UMA_FLAG_CUSTOM BIT(0)
> +
> +/**
> + * struct amdgpu_uma_carveut_option - single UMA carveout option
> + * @name: Name of the carveout option
> + * @memory_carved: Amount of memory carved
> + * @flags: ATCS flags supported by this option
> + */
> +struct amdgpu_uma_carveout_option {
> +       char name[MAX_UMA_OPTION_NAME];
> +       uint8_t memory_carved;
> +       uint8_t flags;
> +};
> +
> +/**
> + * struct amdgpu_uma_carveut_info - table of available UMA carveout opti=
ons
> + * @num_entries: Number of available options
> + * @uma_option_index: The index of the option currently applied
> + * @update_lock: Lock to serialize changes to the option
> + * @entries: The array of carveout options
> + */
> +struct amdgpu_uma_carveout_info {
> +       uint8_t num_entries;
> +       uint8_t uma_option_index;
> +       struct mutex update_lock;
> +       struct amdgpu_uma_carveout_option entries[MAX_UMA_OPTION_ENTRIES]=
;
> +};
> +
>  /* ATCS Device/Driver State */
>  #define AMDGPU_ATCS_PSC_DEV_STATE_D0           0
>  #define AMDGPU_ATCS_PSC_DEV_STATE_D3_HOT       3
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 0743fd8620e4..d442dc442d34 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -38,6 +38,7 @@
>  #include "amdgpu_display.h"
>  #include "amd_acpi.h"
>  #include "atom.h"
> +#include "amdgpu_atomfirmware.h"
>
>  /* Declare GUID for AMD _DSM method for XCCs */
>  static const guid_t amd_xcc_dsm_guid =3D GUID_INIT(0x8267f5d5, 0xa556, 0=
x44f2,
> @@ -125,6 +126,7 @@ struct amdgpu_atcs {
>         acpi_handle handle;
>
>         struct amdgpu_atcs_functions functions;
> +       struct amdgpu_uma_carveout_info uma_info;
>  };
>
>  static struct amdgpu_acpi_priv {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> index 636385c80f64..b1463bb594aa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> @@ -296,6 +296,79 @@ static int convert_atom_mem_type_to_vram_type(struct=
 amdgpu_device *adev,
>         return vram_type;
>  }
>
> +static int amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_=
device *adev,
> +                                                         union igp_info =
*igp_info,
> +                                                         struct amdgpu_u=
ma_carveout_info *uma_info)
> +{
> +       struct uma_carveout_option *opts;
> +       uint8_t nr_uma_options;
> +       int i;
> +
> +       nr_uma_options =3D igp_info->v23.UMACarveoutIndexMax;
> +
> +       if (!nr_uma_options)
> +               return -ENODEV;
> +
> +       if (nr_uma_options > MAX_UMA_OPTION_ENTRIES) {
> +               drm_dbg(adev_to_drm(adev),
> +                       "Number of UMA options exceeds max table size. Op=
tions will not be parsed");
> +               return -EINVAL;
> +       }
> +
> +       uma_info->num_entries =3D nr_uma_options;
> +       uma_info->uma_option_index =3D igp_info->v23.UMACarveoutIndex;
> +
> +       opts =3D igp_info->v23.UMASizeControlOption;
> +
> +       for (i =3D 0; i < nr_uma_options; i++) {
> +               uma_info->entries[i].memory_carved =3D opts[i].memoryCarv=
edGb;
> +               uma_info->entries[i].flags =3D opts[i].uma_carveout_optio=
n_flags.all8;
> +               strscpy(uma_info->entries[i].name, opts[i].optionName, MA=
X_UMA_OPTION_NAME);
> +       }
> +
> +       return 0;
> +}
> +
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev=
,
> +                                             struct amdgpu_uma_carveout_=
info *uma_info)
> +{
> +       struct amdgpu_mode_info *mode_info =3D &adev->mode_info;
> +       union igp_info *igp_info;
> +       u16 data_offset, size;
> +       u8 frev, crev;
> +       int index;
> +
> +       if (!(adev->flags & AMD_IS_APU))
> +               return -ENODEV;
> +
> +       index =3D get_index_into_master_table(atom_master_list_of_data_ta=
bles_v2_1,
> +                                           integratedsysteminfo);
> +
> +       if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
> +                                         index, &size,
> +                                         &frev, &crev, &data_offset)) {
> +               return -EINVAL;
> +       }
> +
> +       igp_info =3D (union igp_info *)
> +                       (mode_info->atom_context->bios + data_offset);
> +
> +       switch (frev) {
> +       case 2:
> +               switch (crev) {
> +               case 3:
> +                       return amdgpu_atomfirmware_get_uma_carveout_info_=
v2_3(adev, igp_info, uma_info);
> +               break;
> +               default:
> +                       break;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +       return -ENODEV;
> +}
> +
>  int
>  amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>                                   int *vram_width, int *vram_type,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> index 649b5530d8ae..67c8d105729b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> @@ -32,6 +32,8 @@ void amdgpu_atomfirmware_scratch_regs_init(struct amdgp=
u_device *adev);
>  int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>         int *vram_width, int *vram_type, int *vram_vendor);
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev=
,
> +                                             struct amdgpu_uma_carveout_=
info *uma_info);
>  int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
>  bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);
>
> --
> 2.43.0
>
