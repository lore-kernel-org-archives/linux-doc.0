Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B443E261B9B
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764619557; cv=none; b=qNBfFfxVWeLrmGrWGMqCznVwUqJHgjjA2sGt0QQBul4/fCFVqI9tMCPnVS6hKnp1hepitfULXvQyV7fx8eYtDZD5SqiuC47sC4VcBVJvRdNZWIKBGZXBtXZ1potS8LyCVvJpvy2ln8xfUC8JepKsbB/aA6YhPZQNF+VlgEcLS4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764619557; c=relaxed/simple;
	bh=eVM0nt3y9HhvH+fru9E7XQK30VjRm/aCnRFrWeALjZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0RT0KAKr0qZXljB+gu7zbraxU6SwSos7x8PNt6d6U4AVL3/QetdrLNmwogunnoIjqmROfabXltxHTlItFjE/Ia84XpUW0AZv6zyY1TmwVoONjQkl39/XL6iltf81zsM7J6npLJjtKM7h1eD6u90hD0/XUyUGc6YTCPke9aRDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLK/xlBn; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLK/xlBn"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b90db89b09so453349b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764619555; x=1765224355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFrWgmkG7JMlma11RCf17aNl2kDEHMj0EdooeYV2b8A=;
        b=fLK/xlBntA8M0s3dnlheW6N+kc9ShrwhN7uLliqtpdvJ44MRNbCCJpKcOjaZW86fqG
         fAWWUrQTvXKgH3f4/S9baaArwdKkcAkROZ+RcTGXRnHUSHO1fLg/df58E/l1GNhFTETK
         6pHuxVxjfS36Z3AOesu+7fuxdhKFkw5xs9n1VvIyuKRbGBqowidtnPmWh79DVsR3+CVW
         B1H1xDW/jeMvDEytWwrbFVU8TK3MUxjNvMvEjGoIRIFek/iMXkKL8Ol6fGz7h1Seww7C
         LOzIypZroZCXqopvALhjq96IfD6ObryOicHciALnOVbqHycKuy9aYZaUcB/WKG4hMgS9
         u+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764619555; x=1765224355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qFrWgmkG7JMlma11RCf17aNl2kDEHMj0EdooeYV2b8A=;
        b=qrxIz61KEUHtCjMnG2yLI5qGoq9CK0vh+rmpckMEbgju/0eSpKRPItqCHzWA+mMcgj
         POHzrgdu3zOquEn8jfN1BMm2aMoi9lIz+DQPtERnwZ+QO1n/CNCehUvzh23kUIwsbf51
         vKZyCqq5MPzZ+TzD/tjxBmwEbo+5ZIb2smZOAUWCY26kRXqEKECqzrNHk2ASw35KNnxo
         ZzOtuQMw0F7zlboB0N2hlxspkDHYp8sKzoHKYmDy5AIkCt1s3D5zv2/nfGks6qOnk2j8
         PJxro+Rky0uGsN0ufpXcA4rOXOfTOzfyPonCiknKi5aH+2rDa9vFGwJPy13llvy8E9mi
         oIyA==
X-Forwarded-Encrypted: i=1; AJvYcCW0ccGCoSfxrsW8V9JY+9JTkJGLz404BL7n1sbrBUG6OdKSqw9mG2ObQs3bFlVuw14XNhL8rNnO1k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYEZmjEdB40awq4k+naMPj3x/3v75HQFocHjwwPhQgAmkoKKJ
	ptsNEfs348lzRYsOKk9wpgMJ0iHjD1OqP2p7WfY4ZRNehRMAaOTuOTKtSI1EEddijvn0WvXQ63+
	rNDfhdtB6JAAfL9Rc/p799SBatJ69g5Y=
X-Gm-Gg: ASbGncvEomsmWWtsV+vojFNa70uhSqFY7oKsNgZg5Ynnt9vnf3AHY1Ulx9ymacTvDYN
	ChxE1RGyfpfcP21bRiLST2IRna+ndI06sY60XcDrxHt1qyIwmHlQyUQnIJLjZ6w/7G2+oCpPr2+
	Itlg70+xN8+vyGR7U6KF0ty76f0Ce/kZGcOPz8pfFDLI+p9MchjjYe4grwDrQlunQXTQul0dX4V
	UWK/r6G26pV7Zcqt/6AGAALcXpF7jRB8Y3cfq40DpaaAHwMLArGzNTOKgjhHRF+la4Kgfc=
X-Google-Smtp-Source: AGHT+IEVGxZvEymQ5Z+ZhxpVm8zthm+G7kUrixr4nf8AMH7ygnh0W1c1kRagjmD0HRQTA1/QkwPyNPX9JIfAfaaRiAY=
X-Received: by 2002:a05:7022:6299:b0:11b:1c6d:98ed with SMTP id
 a92af1059eb24-11c9f31a210mr23772934c88.2.1764619554839; Mon, 01 Dec 2025
 12:05:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201-vram-carveout-tuning-for-upstream-v4-0-9e151363b5ab@amd.com>
 <20251201-vram-carveout-tuning-for-upstream-v4-4-9e151363b5ab@amd.com>
In-Reply-To: <20251201-vram-carveout-tuning-for-upstream-v4-4-9e151363b5ab@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Dec 2025 15:05:42 -0500
X-Gm-Features: AWmQ_blfEQxmQc_uSIvHcJCYBb5U06PuZh5Q_2wd4BtKvvM2GdlVIsLAcf5gU0o
Message-ID: <CADnq5_MWujeT-t36TfzuqUvc_O+J15s_iYzx=WpPMzV9tcUDEg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
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

On Mon, Dec 1, 2025 at 6:09=E2=80=AFAM Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.c=
om> wrote:
>
> Add a uma/ directory containing two sysfs files as interfaces to
> inspect or change UMA carveout size. These files are:
>
> - uma/carveout_options: a read-only file listing all the available
>   UMA allocation options and their index.
>
> - uma/carveout: a file that is both readable and writable. On read,
>   it shows the index of the current setting. Writing a valid index
>   into this file allows users to change the UMA carveout size to that
>   option on the next boot.
>
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 139 +++++++++++++++++++++++++=
++++++
>  1 file changed, 139 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index bce9027fa241..2c0405cdc436 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -30,6 +30,8 @@
>  #include <linux/power_supply.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/suspend.h>
> +#include <linux/device.h>
> +#include <linux/nospec.h>
>  #include <acpi/video.h>
>  #include <acpi/actbl.h>
>
> @@ -1246,6 +1248,136 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device=
 *adev, int xcc_id,
>         return -ENOENT;
>  }
>
> +static ssize_t carveout_options_show(struct device *dev,
> +                                    struct device_attribute *attr,
> +                                    char *buf)
> +{
> +       struct amdgpu_uma_carveout_info *uma_info =3D &amdgpu_acpi_priv.a=
tcs.uma_info;
> +       uint32_t memory_carved;
> +       ssize_t size =3D 0;
> +
> +       if (!uma_info || !uma_info->num_entries)
> +               return -ENODEV;
> +
> +       for (int i =3D 0; i < uma_info->num_entries; i++) {
> +               memory_carved =3D uma_info->entries[i].memory_carved_mb;
> +               if (memory_carved >=3D SZ_1G/SZ_1M) {
> +                       size +=3D sysfs_emit_at(buf, size, "%d: %s (%u GB=
)\n",
> +                                             i,
> +                                             uma_info->entries[i].name,
> +                                             memory_carved >> 10);
> +               } else {
> +                       size +=3D sysfs_emit_at(buf, size, "%d: %s (%u MB=
)\n",
> +                                             i,
> +                                             uma_info->entries[i].name,
> +                                             memory_carved);
> +               }
> +       }
> +
> +       return size;
> +}
> +static DEVICE_ATTR_RO(carveout_options);
> +
> +static ssize_t carveout_show(struct device *dev,
> +                            struct device_attribute *attr,
> +                            char *buf)
> +{
> +       return sysfs_emit(buf, "%u\n", amdgpu_acpi_priv.atcs.uma_info.uma=
_option_index);
> +}
> +
> +static ssize_t carveout_store(struct device *dev,
> +                             struct device_attribute *attr,
> +                             const char *buf, size_t count)
> +{
> +       struct amdgpu_uma_carveout_info *uma_info =3D &amdgpu_acpi_priv.a=
tcs.uma_info;
> +       struct drm_device *ddev =3D dev_get_drvdata(dev);
> +       struct amdgpu_device *adev =3D drm_to_adev(ddev);
> +       struct amdgpu_uma_carveout_option *opt;
> +       unsigned long val;
> +       uint8_t flags;
> +       int r;
> +
> +       r =3D kstrtoul(buf, 10, &val);
> +       if (r)
> +               return r;
> +
> +       if (val >=3D uma_info->num_entries)
> +               return -EINVAL;
> +
> +       val =3D array_index_nospec(val, uma_info->num_entries);
> +       opt =3D &uma_info->entries[val];
> +
> +       if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
> +           !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
> +               drm_err_once(ddev, "Option %lu not supported due to lack =
of Custom/Auto flag", val);
> +               return -EINVAL;
> +       }
> +
> +       flags =3D opt->flags;
> +       flags &=3D ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
> +
> +       guard(mutex)(&uma_info->update_lock);
> +
> +       r =3D amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
> +       if (r)
> +               return r;
> +
> +       uma_info->uma_option_index =3D val;
> +
> +       return count;
> +}
> +static DEVICE_ATTR_RW(carveout);
> +
> +static struct attribute *amdgpu_uma_attrs[] =3D {
> +       &dev_attr_carveout.attr,
> +       &dev_attr_carveout_options.attr,
> +       NULL
> +};
> +
> +const struct attribute_group amdgpu_uma_attr_group =3D {
> +       .name =3D "uma",
> +       .attrs =3D amdgpu_uma_attrs
> +};
> +
> +static int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
> +{
> +       struct amdgpu_atcs *atcs =3D &amdgpu_acpi_priv.atcs;
> +       int rc;
> +
> +       if (!atcs->functions.set_uma_allocation_size)
> +               return -ENODEV;
> +
> +       rc =3D amdgpu_atomfirmware_get_uma_carveout_info(adev, &atcs->uma=
_info);
> +       if (rc) {
> +               drm_dbg(adev_to_drm(adev),
> +                       "Failed to parse UMA carveout info from VBIOS: %d=
\n", rc);
> +               goto out_info;
> +       }
> +
> +       mutex_init(&atcs->uma_info.update_lock);
> +
> +       rc =3D devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
> +       if (rc) {
> +               drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sy=
sfs interfaces %d\n", rc);
> +               goto out_attr;
> +       }
> +
> +       return 0;
> +
> +out_attr:
> +       mutex_destroy(&atcs->uma_info.update_lock);
> +out_info:
> +       return rc;
> +}
> +
> +static void amdgpu_acpi_uma_option_fini(void)
> +{
> +       struct amdgpu_uma_carveout_info *uma_info =3D &amdgpu_acpi_priv.a=
tcs.uma_info;
> +
> +       mutex_destroy(&uma_info->update_lock);
> +       uma_info->num_entries =3D 0;
> +}
> +
>  /**
>   * amdgpu_acpi_event - handle notify events
>   *
> @@ -1290,6 +1422,12 @@ static int amdgpu_acpi_event(struct notifier_block=
 *nb,
>  int amdgpu_acpi_init(struct amdgpu_device *adev)
>  {
>         struct amdgpu_atif *atif =3D &amdgpu_acpi_priv.atif;
> +       int rc;
> +
> +       rc =3D amdgpu_acpi_uma_option_init(adev);
> +
> +       if (rc)
> +               drm_dbg(adev_to_drm(adev), "Not creating uma carveout int=
erfaces: %d", rc);
>
>         if (atif->notifications.brightness_change) {
>                 if (adev->dc_enabled) {
> @@ -1342,6 +1480,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_d=
m_backlight_caps *caps)
>  void amdgpu_acpi_fini(struct amdgpu_device *adev)
>  {
>         unregister_acpi_notifier(&adev->acpi_nb);
> +       amdgpu_acpi_uma_option_fini();
>  }
>
>  /**
>
> --
> 2.43.0
>
