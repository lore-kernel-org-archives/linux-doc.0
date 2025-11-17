Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738542FB602
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 19:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763408947; cv=none; b=db94X++MMJDm8JZaB6gKhjj0jYTOtgF2FFgCDEtPd0c4LtLQSM6WnFbzY81GGAhZiwERPS1QvcAO5/Nw9mlyaMZg3fNclj9F21+vBqHWz+GrMG9xb+3/76yDEQMCecYJEu1+TE1yaTFgXhoBcWPsziYzwV9uko8CSIPujG+DKcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763408947; c=relaxed/simple;
	bh=2/RfF4Sz1BY7tjIO2lVF1rGE5UnKVTjrSh7eV95bqFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBO8ZlOP8kb9pBjHxffz6D16SkBEGmeVMYaDkZ2+iTJo301/b24rF9Hdh9nrtpuqsLrYLxrfrAvm7N2oSqvQCtoFjmK/MWomLhkkkzgLBQWgVEAruLdEZobg71H6cH3zgLvMPSV1S5mVacoQgM9Nyeb4d6vItwSsvQ6IPNdsBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHkPicwU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHkPicwU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b7cdcdd8afso103604b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 11:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763408945; x=1764013745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwN9xd/+ICCzUFjJbywSX4hJRNbIwbnqiOuOojfw4bA=;
        b=JHkPicwUuHmwYmG8SyqZsToE9B2xZav/Y9oinSP6W/WBEYwWu6rrS6FVKi0yciHdBg
         twWT34IIrPCS11afwKvAAy8sRrGvGQjpyOMwEzYRKV2GwF7CXJWNOqlzh1G/UrGiOswy
         FUG7dHPdExpuH3Y9em3BBS2eHy5to0w717USiprX7inydLS9FyFfN+BRd29d6UgvQEQp
         pDF16ModxONXDcZRBPULR6hz4MMTTeEpAUZNwqzGbHX+7b7nNRluQ178pJTRriIAct+2
         P1zqQ2HlP39gJOswYLrrflQttibyOet4u4784QVgPPoHgHkeaF63cPsOaExtSnfQpslk
         GKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763408945; x=1764013745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwN9xd/+ICCzUFjJbywSX4hJRNbIwbnqiOuOojfw4bA=;
        b=tOM6QNRLFSGMhkoaL2jxfeaVuvKT1jwYhUYY41LwEI/XuHaTBA/s7/CbfpdNqG1qt1
         AEMbgF7xUbIz9CKYP1/cfIaW88adRVX8146vnJrueOwZqXZmCFoqRRypTLDer2rilS3C
         yamUiJ+sZWpVVtn9OV+5Dr9v7f9OcfgQxqSQD7l/rtmil0M95ZkIpg5o8AzStaj1eNBw
         HwMfWUeAJaUJF6joJeO+6Iy3hYjSJHUXvZfRxfx13kZE6C5mK6TN/M7gyz+7yzq1WWYM
         e8CQ3CVhstVQS67SyF50UzzwJ/oSecKlPcwHFwOhAVXbiFpvnUb469NPHtU1Cw2X0CCG
         lEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+V23N0Z72SIbV6cKy/pVYlRB6v/rrhHzXzEt/WrpgE/7lGZWNMYp3XAkJ32Pa+ww2xvmUFXfPk2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsx612wljdWsH6iuo8MmZwIToG/5YtSMkO3qcMCPIJhEidr9ev
	4uXZYD1GkVJTLh7lBf8JJpRFMXR4RSazIq3fg1zJjjC31Q1xgPmjFidtkDuhaK8umzn68/GXAC8
	YFVw0csDpbUQbtdclxfkcCtFScWsY2Dk=
X-Gm-Gg: ASbGncvH8YIbhS1iNnMeo6Ziel/7hQW3vGF0OhAlPaORqEgqEriUMJuComIVDBy8vlu
	J9GaLDKqC/+QIiReHxUUKMGPn/Qa8kn1XJNZy5vQBShH+GLiirhiqtCC1L7bd0EyGCYuyi49+5K
	vQRmp7nWj7OXNSgtCm5t4tfR3Z1P3vFJ5lDZpY0iNjEsibSJcIP5xvme1EOE4q9eJHADDbf7KEn
	dT8+7GtmnW8nlv9I9K5pH8JqjwFZMowPcdWCtlANss51WAg7URpcgRih/24U5c05Y7cUUbm6yS/
	hojI6Q==
X-Google-Smtp-Source: AGHT+IE/8ggS6LUeyVsp5eEk+e9DOPtpK5cG7eKvt4t1ew0SgFR+tKonGHD5OH0s8yx7jrceY7HF7o2yVSkpv+xcRzs=
X-Received: by 2002:a05:7022:6297:b0:11a:c044:ec44 with SMTP id
 a92af1059eb24-11c78562aa4mr21812c88.0.1763408944651; Mon, 17 Nov 2025
 11:49:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114-vram-carveout-tuning-for-upstream-v2-0-4f6bdd48030d@amd.com>
 <20251114-vram-carveout-tuning-for-upstream-v2-4-4f6bdd48030d@amd.com>
In-Reply-To: <20251114-vram-carveout-tuning-for-upstream-v2-4-4f6bdd48030d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Nov 2025 14:48:52 -0500
X-Gm-Features: AWmQ_blyq-3bafSyeznjWZ3ESVeo9aWvK16_VaoKKclzjAv-7Z2Oe4CELV6neqw
Message-ID: <CADnq5_Mjo7M-ndi0mOUZzrvCnz2gUY0wm0a7uGtdLp=_kWLW0Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
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
> Add two sysfs files as interfaces to inspect or change UMA carveout
> size. These files are:
>
> - uma_carveout_options: a read-only file listing all the available
>   UMA allocation options and their index.
>
> - uma_carveout: a file that is both readable and writable. On read,
>   it shows the index of the current setting. Writing a valid index
>   into this file allows users to change the UMA carveout size to that
>   option on the next boot.

Would it be cleaner to combine these?  Reading the file would show the
indexed list of options with a * next to the currently selected one
and then writing the index to the file would cause the change to take
effect on the next reboot.

Alex

>
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 127 +++++++++++++++++++++++++=
++++++
>  1 file changed, 127 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_acpi.c
> index 444ab4102168..b9378f34eb79 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -30,6 +30,7 @@
>  #include <linux/power_supply.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/suspend.h>
> +#include <linux/device.h>
>  #include <acpi/video.h>
>  #include <acpi/actbl.h>
>
> @@ -1247,6 +1248,125 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device=
 *adev, int xcc_id,
>         return -ENOENT;
>  }
>
> +static ssize_t uma_carveout_options_show(struct device *dev,
> +                                        struct device_attribute *attr,
> +                                        char *buf)
> +{
> +       struct amdgpu_uma_carveout_info *uma_info =3D &amdgpu_acpi_priv.a=
tcs.uma_info;
> +       ssize_t size =3D 0;
> +
> +       if (!uma_info || !uma_info->num_entries)
> +               return -ENODEV;
> +
> +       for (int i =3D 0; i < uma_info->num_entries; i++) {
> +               size +=3D sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
> +                                     i,
> +                                     uma_info->entries[i].name,
> +                                     uma_info->entries[i].memory_carved)=
;
> +       }
> +
> +       return size;
> +}
> +static DEVICE_ATTR_RO(uma_carveout_options);
> +
> +static ssize_t uma_carveout_show(struct device *dev,
> +                                struct device_attribute *attr,
> +                                char *buf)
> +{
> +       return sysfs_emit(buf, "%u\n", amdgpu_acpi_priv.atcs.uma_info.uma=
_option_index);
> +}
> +
> +static ssize_t uma_carveout_store(struct device *dev,
> +                                 struct device_attribute *attr,
> +                                 const char *buf, size_t count)
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
> +       opt =3D &uma_info->entries[val];
> +
> +       if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
> +           !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
> +               drm_err_once(ddev, "Option %ul not supported due to lack =
of Custom/Auto flag", r);
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
> +static DEVICE_ATTR_RW(uma_carveout);
> +
> +static struct attribute *amdgpu_uma_attrs[] =3D {
> +       &dev_attr_uma_carveout.attr,
> +       &dev_attr_uma_carveout_options.attr,
> +       NULL
> +};
> +
> +const struct attribute_group amdgpu_uma_attr_group =3D {
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
> @@ -1291,6 +1411,12 @@ static int amdgpu_acpi_event(struct notifier_block=
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
> @@ -1343,6 +1469,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_d=
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
