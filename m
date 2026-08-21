Received: from mta1.migadu.com (out-6.mta1.migadu.com [95.215.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8D499F0E
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323721; cv=none; b=U2A0QzE4DgFsvRu/SLbwN1avVERNlQmq78XePo3GedLzMXmMV1xs5trnvlVup1SKPGIn4Mz/G2O7r+SdryKxzGyUI3v7Sbi3DbF/kJ0RUL66I8Tt2p9O8TgzKky/VSXBkR8m4ykEjsUa/YgesbIpzNlCKXFQIyt2Z9257C/GB+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323721; c=relaxed/simple;
	bh=0+mU/jAXsIttSkXRIoTU3vi9dnscIOuMp62cw6N9a/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cp6IJpmrA0/CbVsBDcXqrOmdUnLqWBP+y4zYYHlTDtqvJtkuclkvBbhyLyvLqzkOONmICBhdJZr64c9Z9E5dqt4ddIx0yrM2U4Dkx8hY3aKNy5R1PHTTaB4AZ/DLPEqbV8r30JrOaTqzebuvIQrJuEYuxcHNq099r+tCR/3mBtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=YSTOfmjK; arc=none smtp.client-ip=95.215.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="YSTOfmjK"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0+mU/jAXsIttSkXRIoTU3vi9dnscIOuMp62cw6N9a/4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787323710; v=1; x=1787928510;
 b=YSTOfmjKd+bO/lq7XJZtZ6HXeFQ0XbtQtkoFTvkNtOSzurUq2K2Cx6/RWXdX4pzJJad+jggb
 fDuP9XAK2Vc1aQqBRhDxutSHRxyX03CSfD3CKMKb5Q+xRU6UCmXdvV1U0RA7WGRgSBxxQ+uUQFJ
 z5Go052sHTnvQz1YU1zOjoffRnB7U/xGnLeigU2FOXIGijvDq1kK/o/pJgBG9qZD6JKqSYy05zt
 xrbjj3Q5yE8RBs9e7bmMfK97tcPDji5vk67afAa/mCIxhUJ46INFycukTrwmI9SaoCa9f+Q+/Gn
 akvjpDmVtefVTk0gTF3pZP2guNes4Avizd9zGksE/2HMw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 0c06011ad9e70a67;
	Fri, 21 Aug 2026 14:48:20 +0000
X-Mizu-Trace-ID: 0c06011ad9e70a67
X-Migadu-Flow: FLOW_OUT
Date: Fri, 21 Aug 2026 22:48:11 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Siwei Chen <anka@stu.cdut.edu.cn>, alexs@kernel.org,
	si.yanteng@linux.dev, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Siwei Chen <businiaoanka@anka1.top>
Subject: Re: [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese
 translation
Message-ID: <aohlK3T3_sCK9E1_@wyuan.org>
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

[on the tip of alexs/docs-next]

user@debian:~/Projects/linux$ b4 shazam https://lore.kernel.org/linux-doc/20260817021340.17318-1-anka@stu.cdut.edu.cn/
Looking up https://lore.kernel.org/all/20260817021340.17318-1-anka@stu.cdut.edu.cn/
Grabbing thread from lore.kernel.org/all/20260817021340.17318-1-anka@stu.cdut.edu.cn/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 19 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 22 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✗ [PATCH v4 1/5] docs/zh_CN: Add networking team documentation Chinese translation
    + Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
    + Reviewed-by: Weijie Yuan <wy@wyuan.org> (✗ DKIM/wyuan.org)
  ✗ [PATCH v4 2/5] docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
    + Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
    + Reviewed-by: Weijie Yuan <wy@wyuan.org> (✗ DKIM/wyuan.org)
  ✗ [PATCH v4 3/5] docs/zh_CN: Add Softnet Driver Issues Chinese translation
    + Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
    + Reviewed-by: Weijie Yuan <wy@wyuan.org> (✗ DKIM/wyuan.org)
  ✗ [PATCH v4 4/5] docs/zh_CN: Add ipv6 Chinese translation
    + Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
    + Reviewed-by: Weijie Yuan <wy@wyuan.org> (✗ DKIM/wyuan.org)
  ✗ [PATCH v4 5/5] docs/zh_CN: Add LSM/SeLinux secid Chinese translation
    + Acked-by: Weijie Yuan <wy@wyuan.org> (✗ DKIM/wyuan.org)
  ---
  ✗ BADSIG: DKIM/stu.cdut.edu.cn
---
Total patches: 5
---
Applying: docs/zh_CN: Add networking team documentation Chinese translation
Applying: docs/zh_CN: Add NIC SR-IOV APIs Chinese translation
Applying: docs/zh_CN: Add Softnet Driver Issues Chinese translation
Applying: docs/zh_CN: Add ipv6 Chinese translation
Applying: docs/zh_CN: Add LSM/SeLinux secid Chinese translation
user@debian:~/Projects/linux$ . sphinx_latest/bin/activate
(sphinx_latest) user@debian:~/Projects/linux$ make cleandocs
(sphinx_latest) user@debian:~/Projects/linux$ make -j2 htmldocs
Using alabaster theme
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
Documentation/ABI/testing/sysfs-class-power-bd71828:1: ERROR: Malformed table.
No bottom table border found.

============  ===========================================
1             automatic adjustment of input current limit
0             no adjustment of input current limit. This
              helps for more unusual power sources like
              solar modules. [docutils]
WARNING: ./security/landlock/ruleset.h:48 Excess struct member 'quiet' description in 'landlock_layer'
WARNING: ./security/landlock/ruleset.h:48 Excess struct member 'quiet' description in 'landlock_layer'
WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'fast' description in 'page_pool_params'
WARNING: ./include/net/page_pool/types.h:105 Excess struct member 'slow' description in 'page_pool_params'
WARNING: ./include/linux/damon.h:909 struct member 'probes' not described in 'damon_ctx'
WARNING: ./include/linux/damon.h:909 struct member 'rnd_state' not described in 'damon_ctx'
WARNING: ./include/linux/damon.h:909 struct member 'probes' not described in 'damon_ctx'
WARNING: ./include/linux/damon.h:909 struct member 'rnd_state' not described in 'damon_ctx'
/home/user/Projects/linux/Documentation/hwmon/ltc4283.rst:261: ERROR: Malformed table.
Text in column margin in table line 3.

=======================         ==========================================
power1_failed_fault_log         Set to 1 by a power1 fault occurring.
power1_good_input_fault_log     Set to 1 by a power1 good input fault occurring at PGIO3.
in11_fet_short_fault_log        Set to 1 when a FET-short fault occurs.
in11_fet_bad_fault_log          Set to 1 when a FET-BAD fault occurs.
in0_lcrit_fault_log             Set to 1 by a VIN undervoltage fault occurring.
in0_crit_fault_log              Set to 1 by a VIN overvoltage fault occurring.
curr1_crit_fault_log            Set to 1 by an overcurrent fault occurring.
=======================         ========================================== [docutils]
WARNING: ./include/linux/netfs.h:764 function parameter 'ictx' not described in 'netfs_resize_file'
WARNING: ./include/linux/netfs.h:764 Excess function parameter 'ctx' description in 'netfs_resize_file'
WARNING: ./include/linux/netfs.h:764 function parameter 'ictx' not described in 'netfs_resize_file'
WARNING: ./include/linux/netfs.h:764 Excess function parameter 'ctx' description in 'netfs_resize_file'
/home/user/Projects/linux/Documentation/firmware-guide/acpi/dsd/motorcomm-yt8xxx-phy.rst:70: ERROR: Unexpected indentation. [docutils]
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
/home/user/Projects/linux/Documentation/gpu/driver-uapi:31: ./include/uapi/drm/xe_drm.h:2537: ERROR: A level 2 section cannot be used here.

Node Registration
=================

Established title styles: =/= = -

The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
(up to Docutils 0.21, these sections were silently dropped). [docutils]
/home/user/Projects/linux/Documentation/gpu/driver-uapi:31: ./include/uapi/drm/xe_drm.h:2544: ERROR: A level 2 section cannot be used here.

Error Classification
====================

Established title styles: =/= = -

The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
(up to Docutils 0.21, these sections were silently dropped). [docutils]
/home/user/Projects/linux/Documentation/gpu/driver-uapi:31: ./include/uapi/drm/xe_drm.h:2551: ERROR: A level 2 section cannot be used here.

User Interface
==============

Established title styles: =/= = -

The parent of level 2 sections cannot be reached. The parser is at section level 2 but the current node has only 0 parent section(s).
One reason may be a high level section used in a directive that parses its content into a base node not attached to the document
(up to Docutils 0.21, these sections were silently dropped). [docutils]
/home/user/Projects/linux/Documentation/gpu/drm-kms:302: ./drivers/gpu/drm/drm_atomic.c:1761: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:405.
Declaration is '.. c:function:: int drm_atomic_commit (struct drm_atomic_commit *state)'. [duplicate_declaration.c]
/home/user/Projects/linux/Documentation/gpu/drm-kms:365: ./drivers/gpu/drm/drm_fourcc.c:408: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35.
Declaration is '.. c:function:: const struct drm_format_info * drm_format_info (u32 format)'. [duplicate_declaration.c]
/home/user/Projects/linux/Documentation/gpu/drm-kms:496: ./drivers/gpu/drm/drm_modeset_lock.c:377: WARNING: Duplicate C declaration, also defined at gpu/drm-kms:48.
Declaration is '.. c:function:: int drm_modeset_lock (struct drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'. [duplicate_declaration.c]
WARNING: ./include/drm/display/drm_dp_helper.h:129 struct member 'coasting_vtotal' not described in 'drm_dp_as_sdp'
WARNING: ./include/drm/display/drm_dp_helper.h:129 struct member 'coasting_vtotal' not described in 'drm_dp_as_sdp'
WARNING: ./drivers/gpu/drm/drm_gem_shmem_helper.c:174 expecting prototype for __drm_gem_shmem_release_sgt_locked(). Prototype was for __drm_gem_shmem_free_sgt_locked() instead
WARNING: ./drivers/gpu/buddy.c:1484 Excess function parameter 'p' description in 'gpu_buddy_print'
WARNING: ./include/drm/drm_exec.h:157 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:157 Excess function parameter 'exec' description in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:157 function parameter '_exec' not described in 'drm_exec_retry'
WARNING: ./include/drm/drm_exec.h:157 Excess function parameter 'exec' description in 'drm_exec_retry'
/home/user/Projects/linux/Documentation/gpu/drm-uapi:613: ./drivers/gpu/drm/drm_ioctl.c:924: WARNING: Duplicate C declaration, also defined at gpu/drm-uapi:69.
Declaration is '.. c:function:: bool drm_ioctl_flags (unsigned int nr, unsigned int *flags)'. [duplicate_declaration.c]
WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'get' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'put' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'mmap' not described in 'host1x_bo_ops'
WARNING: ./include/linux/host1x.h:159 struct member 'munmap' not described in 'host1x_bo_ops'
/home/user/Projects/linux/Documentation/gpu/xe/xe_mm:22: ./drivers/gpu/drm/xe/xe_ggtt.c:125: ERROR: Unexpected indentation. [docutils]
WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
WARNING: ./drivers/usb/dwc3/core.h:803 Excess struct member 'regs' description in 'dwc3_ep'
WARNING: ./fs/inode.c:1303 Excess function parameter 'isnew' description in 'inode_insert5'
/home/user/Projects/linux/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.

Userspace I/O
------------- [docutils]
/home/user/Projects/linux/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: ERROR: Unexpected section title.

Ring Design
----------- [docutils]
WARNING: ./include/linux/device.h:117 struct member 'show_const' not described in 'device_attribute'
WARNING: ./include/linux/device.h:117 struct member 'store_const' not described in 'device_attribute'
WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
WARNING: ./include/linux/device.h:117 struct member 'show_const' not described in 'device_attribute'
WARNING: ./include/linux/device.h:117 struct member 'store_const' not described in 'device_attribute'
WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
WARNING: ./include/media/media-entity.h:1394 function parameter 'args' not described in 'media_entity_call'
/home/user/Projects/linux/Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
/home/user/Projects/linux/Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; /home/user/Projects/linux/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261

Weird, no such error found. Did I do something stupid? Thinking..
