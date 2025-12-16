Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643C33D50F;
	Tue, 16 Dec 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894089; cv=none; b=bMbUGMpjhdVEm+VWExEI6KBaP3YHJ8Mq/65q+KqxL1AI0ndUdFFIusjKI9+3NFnvj8vA1WK+GENuUT0zJKjjTuG2a1nIvWxiNEV9RMp6Gyr0fQkxFWf0I1LhAD0rbXSdxDdEEi0wV6v1k/+4UvJCJGOKMeY/Z9c09cIW6tH7oZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894089; c=relaxed/simple;
	bh=OALa6ci07NlkXH47K1k/t/JyFtPuL55pxoqRCtxE394=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSIOobwLO41rDBbs3u/ehDN/LQViJT20W9IGdtUfCEZycix/3tgTdDT1LV6B7Rl4cJ3+g34bfuodijGaMGPQLa9svrykNh9mBw0tfT9T6LmRBPZA13jzlgJu4EilvUkxgmec+NygFgZy84EkgErK/rIkfAC63625QoNB8LveurI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmvLpz8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmvLpz8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18384C16AAE;
	Tue, 16 Dec 2025 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765894089;
	bh=OALa6ci07NlkXH47K1k/t/JyFtPuL55pxoqRCtxE394=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TmvLpz8mTCdE/bd9tQgUhEPDI/lGiOnPsfZyRA6SzbND8ZxiK1TbyUy82DxzcrZJb
	 ysCSMb+DqnUSPcjVnhsXqUDTokiQTy0eeTmyKHv9zmREwQdSU8idIKQYlAjcumn/Ml
	 rlvsOK1nVpSbHol9VZnEe07Q0ouU0HNr7SzAOogTWxkkcYugBUK50cTYavckj7cLi2
	 WUsGcD1Qv53yYH/m9GUUakyd8ztllM4FWyY188E4c0VJiFm+40WSTRyM+NAV4UF4Fn
	 AoXwsvXv2i3WcHjPkScJfAFtllBMKPR7MKZeDk2xyUm28Id3h/NXWymTumsib1diGv
	 oYa3HqmHguqKA==
Message-ID: <ea30058d-f3e1-4a1f-bdcf-fafc92b221a0@kernel.org>
Date: Tue, 16 Dec 2025 08:08:07 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>
References: <20251212-vram-carveout-tuning-for-upstream-v6-0-50c02fd180c9@amd.com>
 <20251212-vram-carveout-tuning-for-upstream-v6-4-50c02fd180c9@amd.com>
 <1d54ce3b-fbdb-4d1a-bd07-576a6ed85ea5@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <1d54ce3b-fbdb-4d1a-bd07-576a6ed85ea5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/16/25 3:43 AM, Lazar, Lijo wrote:
> 
> 
> On 12-Dec-25 1:29 PM, Yo-Jung Leo Lin (AMD) wrote:
>> Add a uma/ directory containing two sysfs files as interfaces to
>> inspect or change UMA carveout size. These files are:
>>
>> - uma/carveout_options: a read-only file listing all the available
>>    UMA allocation options and their index.
>>
>> - uma/carveout: a file that is both readable and writable. On read,
>>    it shows the index of the current setting. Writing a valid index
>>    into this file allows users to change the UMA carveout size to that
>>    option on the next boot.
>>
>> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 143 +++++++++++++++++++ 
>> ++++++++++
>>   1 file changed, 143 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/ 
>> drm/amd/amdgpu/amdgpu_device.c
>> index 903c4706040d..e78e6982312c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -36,6 +36,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/pci-p2pdma.h>
>>   #include <linux/apple-gmux.h>
>> +#include <linux/nospec.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_client_event.h>
>> @@ -417,6 +418,146 @@ static const struct attribute_group 
>> amdgpu_board_attrs_group = {
>>       .is_visible = amdgpu_board_attrs_is_visible
>>   };
>> +static ssize_t carveout_options_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>> +    uint32_t memory_carved;
>> +    ssize_t size = 0;
>> +
>> +    if (!uma_info || !uma_info->num_entries)
>> +        return -ENODEV;
>> +
>> +    for (int i = 0; i < uma_info->num_entries; i++) {
>> +        memory_carved = uma_info->entries[i].memory_carved_mb;
>> +        if (memory_carved >= SZ_1G/SZ_1M) {
>> +            size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
>> +                          i,
>> +                          uma_info->entries[i].name,
>> +                          memory_carved >> 10);
>> +        } else {
>> +            size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
>> +                          i,
>> +                          uma_info->entries[i].name,
>> +                          memory_carved);
>> +        }
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RO(carveout_options);
>> +
>> +static ssize_t carveout_show(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>> +
>> +    return sysfs_emit(buf, "%u\n", adev->uma_info.uma_option_index);
> 
> It would be better to show the size along with the index.

This idea complicates userspace parsing because rather than a atoi() 
parser you now need to do sscanf().

IE - I like it the way it is in the series at the moment.

> 
> Regardless, series is -
> 
>      Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
> 
> Thanks,
> Lijo
> 
>> +}
>> +
>> +static ssize_t carveout_store(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  const char *buf, size_t count)
>> +{
>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>> +    struct amdgpu_uma_carveout_option *opt;
>> +    unsigned long val;
>> +    uint8_t flags;
>> +    int r;
>> +
>> +    r = kstrtoul(buf, 10, &val);
>> +    if (r)
>> +        return r;
>> +
>> +    if (val >= uma_info->num_entries)
>> +        return -EINVAL;
>> +
>> +    val = array_index_nospec(val, uma_info->num_entries);
>> +    opt = &uma_info->entries[val];
>> +
>> +    if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
>> +        !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
>> +        drm_err_once(ddev, "Option %lu not supported due to lack of 
>> Custom/Auto flag", val);
>> +        return -EINVAL;
>> +    }
>> +
>> +    flags = opt->flags;
>> +    flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
>> +
>> +    guard(mutex)(&uma_info->update_lock);
>> +
>> +    r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
>> +    if (r)
>> +        return r;
>> +
>> +    uma_info->uma_option_index = val;
>> +
>> +    return count;
>> +}
>> +static DEVICE_ATTR_RW(carveout);
>> +
>> +static struct attribute *amdgpu_uma_attrs[] = {
>> +    &dev_attr_carveout.attr,
>> +    &dev_attr_carveout_options.attr,
>> +    NULL
>> +};
>> +
>> +const struct attribute_group amdgpu_uma_attr_group = {
>> +    .name = "uma",
>> +    .attrs = amdgpu_uma_attrs
>> +};
>> +
>> +static void amdgpu_uma_sysfs_init(struct amdgpu_device *adev)
>> +{
>> +    int rc;
>> +
>> +    if (!(adev->flags & AMD_IS_APU))
>> +        return;
>> +
>> +    if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
>> +        return;
>> +
>> +    rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &adev- 
>> >uma_info);
>> +    if (rc) {
>> +        drm_dbg(adev_to_drm(adev),
>> +            "Failed to parse UMA carveout info from VBIOS: %d\n", rc);
>> +        goto out_info;
>> +    }
>> +
>> +    mutex_init(&adev->uma_info.update_lock);
>> +
>> +    rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
>> +    if (rc) {
>> +        drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs 
>> interfaces %d\n", rc);
>> +        goto out_attr;
>> +    }
>> +
>> +    return;
>> +
>> +out_attr:
>> +    mutex_destroy(&adev->uma_info.update_lock);
>> +out_info:
>> +    return;
>> +}
>> +
>> +static void amdgpu_uma_sysfs_fini(struct amdgpu_device *adev)
>> +{
>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>> +
>> +    if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
>> +        return;
>> +
>> +    mutex_destroy(&uma_info->update_lock);
>> +    uma_info->num_entries = 0;
>> +}
>> +
>>   static void amdgpu_device_get_pcie_info(struct amdgpu_device *adev);
>>   /**
>> @@ -4492,6 +4633,7 @@ static int 
>> amdgpu_device_sys_interface_init(struct amdgpu_device *adev)
>>       amdgpu_fru_sysfs_init(adev);
>>       amdgpu_reg_state_sysfs_init(adev);
>>       amdgpu_xcp_sysfs_init(adev);
>> +    amdgpu_uma_sysfs_init(adev);
>>       return r;
>>   }
>> @@ -4507,6 +4649,7 @@ static void 
>> amdgpu_device_sys_interface_fini(struct amdgpu_device *adev)
>>       amdgpu_reg_state_sysfs_fini(adev);
>>       amdgpu_xcp_sysfs_fini(adev);
>> +    amdgpu_uma_sysfs_fini(adev);
>>   }
>>   /**
>>
> 

