Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1024D2EEB
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322316; cv=none; b=asjAfOoI7JqxTIvdypJV8ecpPml2bZRUoiBPQoilQAOBtqj4LblP/Da3ZZUR9TH0yfcGGDX+G0ZsCE66woBlKOHVhR0CQnteXCswIMbZuAOhDzkGTD1XE1o8xfMj4KluZtTv02JWaaS0B5PjOjFOnS21aBIU0YePigfOFsHrcgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322316; c=relaxed/simple;
	bh=Bs6w0sN5b4uGBc0KFLsYd6ZtLIJddUPMizmfX3vWO9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iF30+882oSetU3azVr0etUf0x20zztO4ficaL1N9Su9UN1WGoHurMj68yWo4bE5XPVpqG6kOuOe0NaffuDhB4ngAU/sXQ4L+UFk0uP6CN/Ao+43tIi/wo8bRKITZGNsIgvLA6gEdTi/Ocp+ihXRxsC+FW89qVoHw8d2UE1N5J+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=EPc0XU1R; arc=none smtp.client-ip=91.218.175.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="EPc0XU1R"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Bs6w0sN5b4uGBc0KFLsYd6ZtLIJddUPMizmfX3vWO9Q=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787322310; v=1; x=1787927110;
 b=EPc0XU1Rtt2x2AJonpvqupGogbjGUItKod2F3fGdG/wR6RLzBqeFSFS3bhEhlttlMezDhobB
 sCXGqulcmIU7nuVBN1FNg7x6NDc5y0QeP545aGtZrm8Oe/l41osphHeBAs5Qv4VujMkcuFQSZBs
 4KiOShZvGu1lvpABo2NSR91DNHpWM1KreD0c7MvW4u6s4c955REt9e1+ELJw0ZSt4AnX8xMFSuV
 OYhhBkNsAld+nvtHYDK4PMCV3dQs57IvgbV2/JxHqmxp69Kj1FxFF+YCKuM+G5GfO4u85Yu8NA/
 iymGwHduPYQMgKUcwlhTsleQ3ADsudGzuPx2hRA9F92wQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 2408ad9ddb8da986;
	Fri, 21 Aug 2026 14:25:09 +0000
X-Mizu-Trace-ID: 2408ad9ddb8da986
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 22:25:00 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Siwei Chen <businiaoanka@anka1.top>
Subject: Re: [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese
 translation
Message-ID: <aohfvHAXygvtKLFv@wyuan.org>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-3-anka@stu.cdut.edu.cn>
 <7724c093-cb99-490d-b632-1381e16962ff@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7724c093-cb99-490d-b632-1381e16962ff@hust.edu.cn>

On Fri, Aug 21, 2026 at 09:34:59PM +0800, Dongliang Mu wrote:
> > +强烈建议现代网卡专注于实现 ``switchdev`` 模型（参见 :ref:`switchdev`）
> 
> The compilation complains this switchdev reference. This documentation has
> no translation in the same directory:
> 
>   Documentation/translations/zh_CN/networking/sriov.rst:15:
>   WARNING: undefined label: 'switchdev' [ref.ref]

I'm here again because I'm on the blame line. ;-)

OK, I compiled it twice on my mac mini with this series applied based on
commit dcb68831eac7 (Merge tag 'block-7.2-20260815' of git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux)

---
linux on b4/review/20260817-docs-zh_cn-add-chinese-translations-for-five-networking-docu-6824c9b859bd via py v3.9.6 (sphinx_latest) 
> gmake cleandocs && gmake -j6 htmldocs
Using alabaster theme
/Volumes/Linux/linux/sphinx_latest/lib/python3.9/site-packages/urllib3/__init__.py:35: NotOpenSSLWarning: urllib3 v2 only supports OpenSSL 1.1.1+, currently the 'ssl' module is compiled with 'LibreSSL 2.8.3'. See: https://github.com/urllib3/urllib3/issues/3020
  warnings.warn(
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'fast' description in 'page_pool_params'
WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'slow' description in 'page_pool_params'
WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'
/Volumes/Linux/linux/Documentation/gpu/xe/xe_mm:22: ./drivers/gpu/drm/xe/xe_ggtt.c:125: ERROR: Unexpected indentation.
/Volumes/Linux/linux/Documentation/firmware-guide/acpi/dsd/motorcomm-yt8xxx-phy.rst:70: ERROR: Unexpected indentation.
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'power_module' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 Excess struct member 'dm_boot_time_crc_info' description in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'power_module' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 Excess struct member 'dm_boot_time_crc_info' description in 'amdgpu_display_manager'
WARNING: ./fs/inode.c:1303 Excess function parameter 'isnew' description in 'inode_insert5'
WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
/Volumes/Linux/linux/Documentation/gpu/drm-kms:302: ./drivers/gpu/drm/drm_atomic.c:1761: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:405.
Declaration is '.. c:function:: int drm_atomic_commit (struct drm_atomic_commit *state)'.
/Volumes/Linux/linux/Documentation/gpu/drm-kms:365: ./drivers/gpu/drm/drm_fourcc.c:408: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'.
/Volumes/Linux/linux/Documentation/gpu/drm-kms:496: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.
WARNING: ./drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting prototype for __drm_gem_shmem_release_sgt_locked(). Prototype was for __drm_gem_shmem_free_sgt_locked() instead
WARNING: ./drivers/gpu/buddy.c:1509 Excess function parameter 'p' description in 'gpu_buddy_print'
WARNING: ./include/drm/drm_exec.h:159 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:159 Excess function parameter 'exec' description in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:159 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:159 Excess function parameter 'exec' description in 'drm_exec_retry'
/Volumes/Linux/linux/Documentation/gpu/drm-uapi:613: ./drivers/gpu/drm/drm_ioctl.c:936: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
Declaration is '.. c:function:: bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'.
WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
/Volumes/Linux/linux/Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'.
/Volumes/Linux/linux/Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'.
WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
linux on b4/review/20260817-docs-zh_cn-add-chinese-translations-for-five-networking-docu-6824c9b859bd via py v3.9.6 (sphinx_latest) took 4m51s 
> gmake cleandocs                      
linux on b4/review/20260817-docs-zh_cn-add-chinese-translations-for-five-networking-docu-6824c9b859bd via py v3.9.6 (sphinx_latest) 
> gmake -j8 htmldocs
Using alabaster theme
/Volumes/Linux/linux/sphinx_latest/lib/python3.9/site-packages/urllib3/__init__.py:35: NotOpenSSLWarning: urllib3 v2 only supports OpenSSL 1.1.1+, currently the 'ssl' module is compiled with 'LibreSSL 2.8.3'. See: https://github.com/urllib3/urllib3/issues/3020
  warnings.warn(
WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'fast' description in 'page_pool_params'
WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'slow' description in 'page_pool_params'
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'
/Volumes/Linux/linux/Documentation/gpu/xe/xe_mm:22: ./drivers/gpu/drm/xe/xe_ggtt.c:125: ERROR: Unexpected indentation.
/Volumes/Linux/linux/Documentation/firmware-guide/acpi/dsd/motorcomm-yt8xxx-phy.rst:70: ERROR: Unexpected indentation.
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'power_module' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 Excess struct member 'dm_boot_time_crc_info' description in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'power_module' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_wq' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'hdmi_frl_status_polling_delay_ms' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 struct member 'boot_time_crc_info' not described in 'amdgpu_display_manager'
WARNING: ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:721 Excess struct member 'dm_boot_time_crc_info' description in 'amdgpu_display_manager'
WARNING: ./fs/inode.c:1303 Excess function parameter 'isnew' description in 'inode_insert5'
WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
/Volumes/Linux/linux/Documentation/gpu/drm-kms:302: ./drivers/gpu/drm/drm_atomic.c:1761: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:405.
Declaration is '.. c:function:: int drm_atomic_commit (struct drm_atomic_commit *state)'.
/Volumes/Linux/linux/Documentation/gpu/drm-kms:365: ./drivers/gpu/drm/drm_fourcc.c:408: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'.
/Volumes/Linux/linux/Documentation/gpu/drm-kms:496: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.
WARNING: ./drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting prototype for __drm_gem_shmem_release_sgt_locked(). Prototype was for __drm_gem_shmem_free_sgt_locked() instead
WARNING: ./drivers/gpu/buddy.c:1509 Excess function parameter 'p' description in 'gpu_buddy_print'
WARNING: ./include/drm/drm_exec.h:159 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:159 Excess function parameter 'exec' description in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:159 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:159 Excess function parameter 'exec' description in 'drm_exec_retry'
/Volumes/Linux/linux/Documentation/gpu/drm-uapi:613: ./drivers/gpu/drm/drm_ioctl.c:936: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
Declaration is '.. c:function:: bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'.
WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
/Volumes/Linux/linux/Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'.
/Volumes/Linux/linux/Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'.
WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; /Volumes/Linux/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261

And I greped 'zh_CN', but nothing found.

Please give me some time to figure it out.

Thanks.
