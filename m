Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC40F2BE62B
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764577853; cv=none; b=T+2Is0dItimD8yyViSFb3MukdS0r3Kk/JnuyfIDyMB+YBgZ8PzhchwbYWoSFBLs8rfkr6w1u75LIyF58EXZt1vzCTSYbCVNyl1kldTOFyDpSMNErTVP6ehPFF1R1Q5+8uFEcCZvA9+Vta10f8Ux1HKG+Bzea9umLujnJcyxMUGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764577853; c=relaxed/simple;
	bh=3qFGcAZFlbXHruLRUis/BEcbNsJd37YGk8F8PmqW/9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0GcxnpO5jhVCnlNA3xbxaXFYPckVhtRxRoJoCjck/Q9pmP3Jbqr/nTueGoHLskYF9jUVJDbVVKsuedpqKyBJ5SSncMXGBNY32qyLKSe4IEQ3BJbshV6xvNKtmIRpnyxxqa48pdRxHk/HdoVB+K8q2Y/cxxkauEESKRPtfHs51g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKvHOQuN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKvHOQuN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297e982506fso51184055ad.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 00:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764577851; x=1765182651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YRqx+zq6MV9VeTwc28uE5sAPkmHEV1/sluHR5vInZzw=;
        b=LKvHOQuNdf4uZrodpzmS4rUZoAusbZ9r2ObEj47wQ0//UW7Dq0BC90Ikl8ZCVUG3Y1
         +fhJjVX+zmye6AHGTqFgKJjTsk5xlH5L1Wp4Ck904na3EnGYFU0lZbucLZHGqn7t6zJd
         FGrudq/TiaMKQxfOZXIpRwxonVogQPUei9uBWqQm4EBD8QG7c2ZqlG3MR8RXh/1eZYy8
         Ikp9dRyAQf3zQdVxZWcewE8u9FCtjAEnRq8c55P2Kl8PUYsCPq9GULG5g4c3HwDTAznC
         um7fG4mnLYgxVVftiL0ElQqwS2iVMXfPQ0ldithSV/p34HrFtKU7ZHynoL6lxCqfdsK8
         19vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764577851; x=1765182651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YRqx+zq6MV9VeTwc28uE5sAPkmHEV1/sluHR5vInZzw=;
        b=TsDOtvmBvN1bCoYFocIbgnDbK5X387x3P9SW3Z4mG6rLB52uVv35jFCg+yKxI7dMzI
         UgToqG4lHhWNBBTiFW77AiDoiHeV/MlRqwQgnVY1qtw8pgphRkZPzHvfbaX78iy+kNtg
         YOaYD574ixN2ql5d4P+enMaeX0U4q/Kd3j2NeChKBwxn4ahx1aba37mHQNmHfHW1IZC8
         EzwM+Gz4JWtJdbzxodzgpLKRCQWWKMF3lezcRQce41GOITfyVCeOE85jwSXSAOENtKLP
         6fDaTeoPj5WC1KiNKMfP8yEmp6o3SCyDp6oVAxOkn80fk+xz0urspKZQvkWjuknDR8SP
         2W4A==
X-Forwarded-Encrypted: i=1; AJvYcCWyjPgCOhwM8JsR2eGrBdWl6hPnVgPo0cDlapH3N3J2vSaU9wcpLAJsWpM6Hi0K8u931+K8RaBUiKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaFLX1v9h9l6m14ID+VmNdR9rMEpUBIOat227kFynEiDETmNfs
	Qj+JYDw6j12othMG5tA48NsNH6Wa4q/cX1hfCr75CbvWo2BRsBw/n5F4
X-Gm-Gg: ASbGncsn9y5NiCqmfr2JoOpe1BbV34cK/IqcCuQOqzRvNzPzQ9HJduMvS81OKi0CiXX
	zzZNacTB0gl69YAAp098flgyZ/P7QyQDTXqmYFjdUqruIIwIWYtv9UCp79zzDAtZIKGEtmRL+4G
	3hqH0fc/NIXliNOp94FKTeKnHwpU+gLBaH3qq5zaSg6CfY5iMkvzv7kYPtYsDdcxur1X6I9SBJY
	Qk0WmEuztb5hiCLPHZvhiuCVdpw38IO1gJyndjO8zGS3ZVBUR67aiNLRiijvnqf9QrJxznNHgPW
	MZusEDoREwFJjwUmzU13JVC8nL53+o05LUx0o2cIAo1QKmvmOJ2p+LuJNHklCWIPHDUQHN9DOV5
	y/Kde00rvht6lq+S3I/zzW21ja1lxTNoKp7fZr/XqSFIyONLSC/WPaOPPhgIhkoLGdUlPsxy8hC
	UAeva0mNBnkFSuLHocpWap
X-Google-Smtp-Source: AGHT+IFW9UJkWdGVik+RSQYeEpxrY0mwOpthUJGwwDnRRi307Q5DK2ltXPn3UBb6Ty9M1AXX5CNwmg==
X-Received: by 2002:a17:902:d588:b0:29b:6845:6214 with SMTP id d9443c01a7336-29b6be8c872mr440193065ad.3.1764577850566;
        Mon, 01 Dec 2025 00:30:50 -0800 (PST)
Received: from google.com ([2401:fa00:95:201:2a71:e28f:ae3c:b20c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce441e59sm116914635ad.33.2025.12.01.00.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:30:49 -0800 (PST)
Date: Mon, 1 Dec 2025 16:30:43 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>,
	"Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Subject: Re: [PATCH v3 2/5] drm/amdgpu: add helper to read UMA carveout info
Message-ID: <aS1SM0sENT510Feo@google.com>
References: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
 <20251126-vram-carveout-tuning-for-upstream-v3-2-cf1729c4cb3c@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-vram-carveout-tuning-for-upstream-v3-2-cf1729c4cb3c@amd.com>

Hi Leo and Mario,

On Wed, Nov 26, 2025 at 05:05:13PM +0800, Yo-Jung Leo Lin (AMD) wrote:
> Currently, the available UMA allocation configs in the integrated system
> information table have not been parsed. Add a helper function to retrieve
> and store these configs.
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h              | 32 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c         |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c | 77 ++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h |  2 +
>  4 files changed, 113 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9f9774f58ce1..6873c020b923 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1675,6 +1675,38 @@ struct amdgpu_numa_info {
>  	int nid;
>  };
>  
> +#define MAX_UMA_OPTION_NAME	28
> +#define MAX_UMA_OPTION_ENTRIES	19
> +
> +#define AMDGPU_UMA_FLAG_AUTO	BIT(1)
> +#define AMDGPU_UMA_FLAG_CUSTOM	BIT(0)
> +
> +/**
> + * struct amdgpu_uma_carveut_option - single UMA carveout option

Nit: struct amdgpu_uma_carve*o*ut_option

> + * @name: Name of the carveout option
> + * @memory_carved_mb: Amount of memory carved in MB
> + * @flags: ATCS flags supported by this option
> + */
> +struct amdgpu_uma_carveout_option {
> +	char name[MAX_UMA_OPTION_NAME];
> +	uint32_t memory_carved_mb;
> +	uint8_t flags;
> +};
> +
> +/**
> + * struct amdgpu_uma_carveut_info - table of available UMA carveout options

Ditto: struct amdgpu_uma_carve*o*ut_info

Regards,
Kuan-Wei

> + * @num_entries: Number of available options
> + * @uma_option_index: The index of the option currently applied
> + * @update_lock: Lock to serialize changes to the option
> + * @entries: The array of carveout options
> + */
> +struct amdgpu_uma_carveout_info {
> +	uint8_t num_entries;
> +	uint8_t uma_option_index;
> +	struct mutex update_lock;
> +	struct amdgpu_uma_carveout_option entries[MAX_UMA_OPTION_ENTRIES];
> +};
> +
>  /* ATCS Device/Driver State */
>  #define AMDGPU_ATCS_PSC_DEV_STATE_D0		0
>  #define AMDGPU_ATCS_PSC_DEV_STATE_D3_HOT	3
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 610449d73a6c..92070738bd42 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -38,6 +38,7 @@
>  #include "amdgpu_display.h"
>  #include "amd_acpi.h"
>  #include "atom.h"
> +#include "amdgpu_atomfirmware.h"
>  
>  /* Declare GUID for AMD _DSM method for XCCs */
>  static const guid_t amd_xcc_dsm_guid = GUID_INIT(0x8267f5d5, 0xa556, 0x44f2,
> @@ -125,6 +126,7 @@ struct amdgpu_atcs {
>  	acpi_handle handle;
>  
>  	struct amdgpu_atcs_functions functions;
> +	struct amdgpu_uma_carveout_info uma_info;
>  };
>  
>  static struct amdgpu_acpi_priv {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> index 636385c80f64..7f4751e5caaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> @@ -296,6 +296,83 @@ static int convert_atom_mem_type_to_vram_type(struct amdgpu_device *adev,
>  	return vram_type;
>  }
>  
> +static int amdgpu_atomfirmware_get_uma_carveout_info_v2_3(struct amdgpu_device *adev,
> +							  union igp_info *igp_info,
> +							  struct amdgpu_uma_carveout_info *uma_info)
> +{
> +	struct uma_carveout_option *opts;
> +	uint8_t nr_uma_options;
> +	int i;
> +
> +	nr_uma_options = igp_info->v23.UMACarveoutIndexMax;
> +
> +	if (!nr_uma_options)
> +		return -ENODEV;
> +
> +	if (nr_uma_options > MAX_UMA_OPTION_ENTRIES) {
> +		drm_dbg(adev_to_drm(adev),
> +			"Number of UMA options exceeds max table size. Options will not be parsed");
> +		return -EINVAL;
> +	}
> +
> +	uma_info->num_entries = nr_uma_options;
> +	uma_info->uma_option_index = igp_info->v23.UMACarveoutIndex;
> +
> +	opts = igp_info->v23.UMASizeControlOption;
> +
> +	for (i = 0; i < nr_uma_options; i++) {
> +		if (!opts[i].memoryCarvedGb)
> +			uma_info->entries[i].memory_carved_mb = 512;
> +		else
> +			uma_info->entries[i].memory_carved_mb = (uint32_t)opts[i].memoryCarvedGb << 10;
> +
> +		uma_info->entries[i].flags = opts[i].uma_carveout_option_flags.all8;
> +		strscpy(uma_info->entries[i].name, opts[i].optionName, MAX_UMA_OPTION_NAME);
> +	}
> +
> +	return 0;
> +}
> +
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
> +					      struct amdgpu_uma_carveout_info *uma_info)
> +{
> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> +	union igp_info *igp_info;
> +	u16 data_offset, size;
> +	u8 frev, crev;
> +	int index;
> +
> +	if (!(adev->flags & AMD_IS_APU))
> +		return -ENODEV;
> +
> +	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
> +					    integratedsysteminfo);
> +
> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
> +					  index, &size,
> +					  &frev, &crev, &data_offset)) {
> +		return -EINVAL;
> +	}
> +
> +	igp_info = (union igp_info *)
> +			(mode_info->atom_context->bios + data_offset);
> +
> +	switch (frev) {
> +	case 2:
> +		switch (crev) {
> +		case 3:
> +			return amdgpu_atomfirmware_get_uma_carveout_info_v2_3(adev, igp_info, uma_info);
> +		break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +	return -ENODEV;
> +}
> +
>  int
>  amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>  				  int *vram_width, int *vram_type,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> index 649b5530d8ae..67c8d105729b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.h
> @@ -32,6 +32,8 @@ void amdgpu_atomfirmware_scratch_regs_init(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_get_vram_info(struct amdgpu_device *adev,
>  	int *vram_width, int *vram_type, int *vram_vendor);
> +int amdgpu_atomfirmware_get_uma_carveout_info(struct amdgpu_device *adev,
> +					      struct amdgpu_uma_carveout_info *uma_info);
>  int amdgpu_atomfirmware_get_clock_info(struct amdgpu_device *adev);
>  int amdgpu_atomfirmware_get_gfx_info(struct amdgpu_device *adev);
>  bool amdgpu_atomfirmware_mem_ecc_supported(struct amdgpu_device *adev);
> 
> -- 
> 2.43.0
> 
> 
