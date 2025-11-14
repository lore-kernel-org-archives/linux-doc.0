Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A28128D84F;
	Fri, 14 Nov 2025 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763151798; cv=none; b=R0Z+9qnIdpFg+XxNpotkUr2EZWsWTAHcm4Mz0dshbIY5U8hP0TZzI4cHLI5AHDkj0UGHTRDyfWv7vGuCPqkJOAnAJzYNOCJSlxx0TcvCSz2JYEXXHbL9eiF6ES0T/v0FyiOqvjkVxgwcOs4vOtJyeJpbDt3r1so+BoGm7ugUK0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763151798; c=relaxed/simple;
	bh=5mf39yFtbvvOVXTfDaZG0PlK5H+pugZOr86HScI5Ki8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBSJgSmwd6Cyvoof+j1Q7d1oJPG5CorXmazJB8VMaCE44z3U3GyEYZF10pzMg/KhWux5LcDXM+vRKbGRnDBxrh3OnjBRh04djBE99nwLezHcW5d4/VEyNSuQZdN1yZREkTnDXaG8CJo9Abo3+LlX/zNqRsRgcHA6oWeBUs54oNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbRx1/DG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbRx1/DG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF79EC19422;
	Fri, 14 Nov 2025 20:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763151797;
	bh=5mf39yFtbvvOVXTfDaZG0PlK5H+pugZOr86HScI5Ki8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hbRx1/DGS6pOrZDyfveZEUQjJ7pGot/u6xHiKojFUbKARf76arBNN66zbb8aV8r34
	 /kzcZHUOfUfpYVuAiBt7zR499/9FNqLnBp3G/W5F9yTSU5hL3rwRghDCBhFGpRIf+W
	 Xb/UGpy4LfJu8oh0dP/9Ho4bK9RxE/vEFcPyitU6EACP1hlpg6SZznwuUumnpmCXRj
	 d1lYYVGD1qbLqzwnJJPjRB4XQoQELUqXN9rCAcZfppCif1KdZojOdWFf0o2/WUAFaH
	 ugpYkPabDemMi/FyPT5a16AdT2Emtkj4Tu1vvueoWkhiiyRYGMlPfCr8VKSQe+o0UC
	 obCJZIsENNxbg==
Message-ID: <806a4c22-e89f-435e-bdaa-e78c58fb8243@kernel.org>
Date: Fri, 14 Nov 2025 14:23:14 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] Documentation/amdgpu: Add UMA carveout details
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
 <20251114-vram-carveout-tuning-for-upstream-v2-5-4f6bdd48030d@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-5-4f6bdd48030d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/2025 2:42 AM, Yo-Jung Leo Lin (AMD) wrote:
> Add documentation for the uma_carveout_options and uma_carveout
> attributes in sysfs
> 
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   Documentation/gpu/amdgpu/driver-misc.rst | 26 ++++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 29 +++++++++++++++++++++++++++++
>   2 files changed, 55 insertions(+)
> 
> diff --git a/Documentation/gpu/amdgpu/driver-misc.rst b/Documentation/gpu/amdgpu/driver-misc.rst
> index 25b0c857816e..afefab4fa0ac 100644
> --- a/Documentation/gpu/amdgpu/driver-misc.rst
> +++ b/Documentation/gpu/amdgpu/driver-misc.rst
> @@ -128,3 +128,29 @@ smartshift_bias
>   
>   .. kernel-doc:: drivers/gpu/drm/amd/pm/amdgpu_pm.c
>      :doc: smartshift_bias
> +
> +UMA Carveout
> +============
> +
> +Some versions of Atom ROM expose available options for the VRAM carveout sizes,
> +and allow changes to the carveout size via the ATCS function code 0xA on supported
> +BIOS implementations.
> +
> +For those platforms, users can use the following file to set the carveout size,
> +in a way similar to what Windows users can do in the "Tuning" tab in AMD
> +Adrenalin.
> +
> +Note that for BIOS implementations that don't support this, these files will not
> +be created at all.
> +
> +uma_carveout_options
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +   :doc: uma_carveout_options
> +
> +uma_carveout
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +   :doc: uma_carveout
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index b9378f34eb79..10cc6bf28a0f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1248,6 +1248,24 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
>   	return -ENOENT;
>   }
>   
> +/**
> + * DOC: uma_carveout_options
> + *
> + * This is a read-only file that lists all available UMA allocation
> + * options and their corresponding indices. Example output::
> + *
> + *     $ cat uma_carveout_options
> + *     0: Minimum (0 GB)
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
>   static ssize_t uma_carveout_options_show(struct device *dev,
>   					 struct device_attribute *attr,
>   					 char *buf)
> @@ -1269,6 +1287,17 @@ static ssize_t uma_carveout_options_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(uma_carveout_options);
>   
> +/**
> + * DOC: uma_carveout
> + *
> + * This file is both readable and writable. When read, it shows the
> + * index of the current setting. Writing a valid index to this file
> + * allows users to change the UMA carveout size to the selected option
> + * on the next boot.
> + *
> + * The available options and their corresponding indices can be read
> + * from the uma_carveout_options file.
> + */
>   static ssize_t uma_carveout_show(struct device *dev,
>   				 struct device_attribute *attr,
>   				 char *buf)
> 

