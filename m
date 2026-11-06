Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794004535;
	b=Bylc00LlJKnphS29zAfsqQE576S7cxrShUZS+j0UBFSdpfUQXTAUXvCmRNk470H1P0Ll
	 sL/uFvgH+BM4yUxhp5LM0AIOw1r8XH/fzxkL11G5UyMK5g4AxSpUvTub0Dl8FROGCrgPl
	 nervm92jAdegWKSbuj6VoEB4Dz8RHHL0Py+8hwdhCekYvtIYxu3WwEByeoO6gIFQ98Lpd
	 G4/BBe9OstOQ22gYmLNVckkgHMi3eWV33w9Gv2asjnVzTACvatikp9oZrL5la9zSZLnEa
	 fyMPTtJoSRlteO6PCilJiGPE+yWvarTHoYieKNCT82Kj6F2X+197gsbUNPiYhqAF6hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794004535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BwjRA8ftZApzwOyImkXY8LHZEAElz+0AJdwAhV3strc=;
	b=RjeezJMiFrJqdSQ+eer732ndj5TFOA5+rvKfYewtlRcy6TdYenDAWWXUx8MXWHuaj1ya
	 ZD1Rn1xZnj+pYZ+px+z5tK+70x7G54M7SXQBLlhwluFvyJUs2lAKaowldHoBCLdRwwEtf
	 0DzZh0Cbi2fRLcpFUGMKpZFcJRpsL3cUdVOlX3IUAGBD0aOpOQK9GfyP2uQSltTJNYnFo
	 i1+LuF//muMUyvATAgca+KAIY+3IBeOfmRoAXPUFURbSBea15kBLwloa5ei6i0fvMBtNE
	 Ev3kuyuhgzxA2/YF8YEQSaZ3D0tpAJylreyTWGWIFv//UF9Uy3oqShmJ98hX4RlMQuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NcAlRRKK;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFEF606A332
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 22:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EFEF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NcAlRRKK
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed3f563739so12175ad.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 14:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794004533; x=1794609333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BwjRA8ftZApzwOyImkXY8LHZEAElz+0AJdwAhV3strc=;
        b=NcAlRRKKPAjjj3R0MQ8Ie5G6V+chJBOIADQ7AtGo4vYYAU7+dXyxFCDK9w2/J+ZwmC
         6RltoK7XvSt70AoArkEGwuuNsTmkAgRiMRAppL0XaKswD0jPS9oTw17FnAvJswuvB8ye
         6PE5MkBZZYcLdTsdGBrM4IQCAd5QvEgr866oOdSyBFVpAY/DrMjmLVNUuylh8y3lpKzh
         2sDUKwJriyrG9RaErLw/St3p58hw8sRTZrpLIo49nReVZzVbdb8NQJo7qQwMWk4Y2hjL
         611IM0bnsdq0vhGRw8UhAmPiK5k80UA8hBDbwLtYvRs8EoAQ1VrK6XzBvz6afbizQmsr
         9yag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794004533; x=1794609333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwjRA8ftZApzwOyImkXY8LHZEAElz+0AJdwAhV3strc=;
        b=Wba0yw5K71QcLfk1dW0QDYMEMkrVc9Fb3hjuxsoLYapaXWy12ocdTqAIPTNIeLytVq
         q5tp0g32ypvfaVJziz5Br8a4TK/WTfQC/a8qF7/OKgyog/omWeIvawNKnmOPjbdEvcVc
         +EfxMOxVanrc0ae9v0Xi5twzWmj3Iv2VXEPNJbfPsjKPUBsCtrAgww+LFvv2rZZjM+TU
         pLQxyS+oA97rO9KjEuPPqgXkdz3RdLgCa7ICVHLHYl8eA2/9yw1UKQlCG0FSH8Dw8XuF
         zsoBNSdPMRZs7PtWGRPL3b9Gj5b05+h6LwUd8bgpotHET8q+phbImivuCroJIf2lY6Ia
         AkPw==
X-Forwarded-Encrypted: i=1; AL+hErGXgQAl0auUPGjISDmqgOcVnTOwt7X4aYZHei9ipYY9uuKzyilvBFSz3RXTv9Lu4WzjK3nWtkm2b8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+b9PRSUOC8j3WY6xIepKNnu/AEWd4uNLWjEvleAmN2yJyHXqz/
	FSJK4Xe9NyiaQwSCINICcbs9j6ihCyARGcy3aIE1tru8qKnKUayvEIls6CY54pPcQA==
X-Gm-Gg: AYBFou3Cpt/64Xx/apy5/4qXc9znxFispwqAG0fJfeKtLawSBwaghvNXV0lKEqAkv5V
	YiPcUtvCnqROjPWPnCMeI7lpvNmTBH1uGBWx1MwNo48mhfEr8IKOnzD2sKq9ZvP/CPxScNn8zv0
	F0Y9/+qbzMR5iAF6wb95vhGO5mwfJ4XLC2T2W4EKdgnr5VX9YZKY/xBlZn10w7nlHBYbHBCyQdJ
	ES+yJ4qDUozlin4JEpsuBdVNlJtRJz55CFlia6ij483FoCcz2WCXdezhPE0/gieDhK2kE6kfueh
	WRzW8FjR7FVwgIzXxhgTyBDsVs1rgkdLKGfMOG+RFC1ytDiThO749arDk2moUsp2UHgAk1GFbzP
	vy/TPsehtc0fnTVDlHI1sECexSqsqB9WgLJjBAFs85JPObqIylTYljfUMvtyOCturCxa03nu4Eu
	gU9Jb9XNzNDDoe9sueD7L94B4i34Ju49YoexAgkfTWIe8ZCk9AAOeY6BCuNEN2AgSRfJWM7g6nL
	n02oe1FXe3qgWL0HzE2r9rwEIl+zh2R9DHTBbjj/+zc77qEqywrKzwffKr8h+Ci0p+6MjK7Yvtx
	EPJ6gZ7Nu7XTdHXSLPfgOa9/uKGR88DJmBX94NPHX0zLUC3VkS4rngD4/bFdx8viAKR75a3A54Q
	lPJ7h3KuOgt6W1Zfss339
X-Received: by 2002:a17:902:e80e:b0:2ea:1079:e519 with SMTP id d9443c01a7336-2ed6a97c2c6mr202835ad.17.1794004532665;
        Fri, 06 Nov 2026 14:35:32 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b103435561sm482994a91.3.2026.11.06.14.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:35:31 -0800 (PST)
Date: Fri, 6 Nov 2026 22:35:27 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, 
	jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rdunlap@infradead.org, rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, schnelle@linux.ibm.com, skhan@linuxfoundation.org, 
	vivek.kasireddy@intel.com, witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 07/27] vfio/pci: Preserve vfio-pci device files across
 Live Update
Message-ID: <au5VMy7zhOb65xIE@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-8-vipinsh@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261102153656.1431701-8-vipinsh@google.com>

On Mon, Nov 02, 2026 at 07:36:36AM -0800, Vipin Sharma wrote:
>Implement the Live Update file handler callbacks to preserve a vfio-pci
>device in noiommu mode across a Live Update while keeping it running
>across kexec. Subsequent commits will enable userspace to retrieve and
>take over this file after the Live Update.
>
>State about each device is serialized into struct vfio_pci_core_device_ser
>using Kexec-Handover (KHO) to preserve the pages holding the struct and
>the Live Update Orchestrator (LUO) to preserve the physical address of
>the struct.
>
>Key design notes and constraints:
>
> * Noiommu-only policy and bound cdev requirement: can_preserve() verifies
>   that the preserved file is a bound vfio-pci cdev file descriptor via
>   vfio_file_is_bound_cdev(), and preserve() requires the device to be in
>   noiommu mode via vfio_device_is_noiommu() (returning -EOPNOTSUPP
>   otherwise). CONFIG_VFIO_PCI_LIVEUPDATE now depends on
>   CONFIG_VFIO_DEVICE_CDEV and CONFIG_VFIO_NOIOMMU.
>
> * Serialized state: During preserve(), serialize the PCI domain, BDF,
>   config space size, reset_works flag, and the initial pci_saved_state
>   captured when the device was first opened. During freeze(), snapshot
>   the virtualized PCI config space (vconfig) and capability map
>   (pci_config_map).
>
> * Keep-running freeze and unfreeze: Do not reset the device, clear
>   PCI_COMMAND_MASTER, zap BAR mappings, or revoke dma-bufs during
>   freeze(). Validate that VFIO interrupts are disabled, that the device
>   is in PCI_D0 (and not in VFIO runtime PM low-power mode), and that
>   SR-IOV is not enabled, as VFs are not preserved and the next kernel
>   disables SR-IOV on the running device. Then mask physical INTx
>   (recording the prior state) and mark the device frozen. If the
>   Live Update is aborted after freeze(), unfreeze() restores the physical
>   INTx state and clears liveupdate_frozen so the existing FD remains
>   usable.
>
> * TOCTOU synchronization: vfio_pci_dev_is_frozen() is checked locklessly
>   on entry to the ioctl, read/write and mmap paths, and re-checked under
>   a lock that freeze() holds before any operation that could change the
>   device or vconfig: under vdev->igate in vfio_pci_ioctl_set_irqs() and
>   around every config-space write in vfio_pci_config_rw_single(), under
>   vdev->memory_lock in vfio_pci_runtime_pm_entry(),
>   vfio_pci_ioctl_reset() and the SR-IOV enable path of
>   vfio_pci_core_sriov_configure(), and under dev_set->lock in
>   vfio_pci_dev_set_hot_reset(). A racing operation thus either completes
>   before freeze() takes its snapshot or fails, while existing BAR mmaps,
>   ioeventfds and dma-bufs keep working. Serializing config writes on
>   igate covers the PCI_COMMAND, INTx disable emulation, power state and
>   FLR paths at one point (the INTx disable emulation now uses the
>   igate-held __vfio_pci_intx_mask() and __vfio_pci_intx_unmask()
>   helpers), and also serializes the irq_type and virq_disabled accesses
>   of config writes with VFIO_DEVICE_SET_IRQS.
>
>Co-developed-by: David Matlack <dmatlack@google.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>Signed-off-by: Vipin Sharma <vipinsh@google.com>
>---
> drivers/vfio/pci/Kconfig               |   2 +-
> drivers/vfio/pci/vfio_pci_config.c     |  19 +-
> drivers/vfio/pci/vfio_pci_core.c       |  49 +++-
> drivers/vfio/pci/vfio_pci_intrs.c      |   4 +-
> drivers/vfio/pci/vfio_pci_liveupdate.c | 303 ++++++++++++++++++++++++-
> drivers/vfio/pci/vfio_pci_priv.h       |  13 ++
> include/linux/kho/abi/vfio_pci.h       |  52 ++++-
> include/linux/vfio_pci_core.h          |   4 +
> 8 files changed, 434 insertions(+), 12 deletions(-)
>

[snip]

>diff --git a/include/linux/kho/abi/vfio_pci.h b/include/linux/kho/abi/vfio_pci.h
>index 67e8199eec59..725043a44b55 100644
>--- a/include/linux/kho/abi/vfio_pci.h
>+++ b/include/linux/kho/abi/vfio_pci.h
>@@ -9,14 +9,19 @@
> #ifndef _LINUX_LIVEUPDATE_ABI_VFIO_PCI_H
> #define _LINUX_LIVEUPDATE_ABI_VFIO_PCI_H
>
>+#include <linux/bits.h>
>+#include <linux/compiler.h>
>+#include <linux/types.h>
>+
> /**
>  * DOC: VFIO PCI Live Update ABI
>  *
>  * VFIO uses the ABI defined below for preserving device files across a kexec
>  * reboot using LUO.
>  *
>- * Device metadata is serialized into memory which is then handed to the next
>- * kernel via KHO.
>+ * Device metadata, virtualized PCI configuration space, VFIO's capability map,
>+ * and the initial PCI saved state captured when the device was first opened are
>+ * serialized into memory which is then handed to the next kernel via KHO.
>  *
>  * This interface is a contract. Any modification to any of the serialization
>  * structs defined here constitutes a breaking change. Such changes require
>@@ -25,4 +30,47 @@
>
> #define VFIO_PCI_LUO_FH_COMPATIBLE "vfio-pci-v1"
>
>+/**
>+ * define VFIO_PCI_SER_RESET_WORKS - Device supports function reset.
>+ *
>+ * Set in &vfio_pci_core_device_ser.flags when the preserved device had
>+ * ``vdev->reset_works == true`` prior to kexec.
>+ */
>+#define VFIO_PCI_SER_RESET_WORKS	BIT(0)
>+
>+#define VFIO_PCI_SER_KNOWN_FLAGS	VFIO_PCI_SER_RESET_WORKS
>+
>+/**
>+ * struct vfio_pci_core_device_ser - Serialized state of a single VFIO PCI
>+ * device.
>+ *
>+ * @domain: The device's PCI domain number (segment).
>+ * @bdf: The device's PCI bus, device, and function number.
>+ * @cfg_size: Size in bytes of the device's PCI configuration space
>+ *            (``PCI_CFG_SPACE_SIZE`` or ``PCI_CFG_SPACE_EXP_SIZE``).
>+ * @size: Total size in bytes of this serialized buffer, equal to
>+ *        ``sizeof(struct vfio_pci_core_device_ser) + 2 * @cfg_size + @saved_state_size``.
>+ * @flags: Bitmask of ``VFIO_PCI_SER_*`` flags; unknown bits are rejected.
>+ * @saved_state_size: Size in bytes of the serialized &struct pci_saved_state_ser
>+ *                    blob stored in @data after ``config_map``, or 0 if none.
>+ * @reserved: Reserved for future use; must be 0.
>+ * @data: Variable-length payload containing, in order:
>+ *        1. ``u8 vconfig[@cfg_size]`` - VFIO virtualized config space snapshot
>+ *           captured during ``freeze()``.
>+ *        2. ``u8 config_map[@cfg_size]`` - VFIO capability map snapshot
>+ *           captured during ``freeze()``.
>+ *        3. ``u8 saved_state[@saved_state_size]`` - serialized
>+ *           &struct pci_saved_state_ser captured during ``preserve()``.
>+ */
>+struct vfio_pci_core_device_ser {
>+	u32 domain;
>+	u16 bdf;
>+	u16 cfg_size;
>+	u32 size;
>+	u32 flags;
>+	u32 saved_state_size;

We will need space for iommufd_token when we preserve that, we should
probably add it now as otherwise the compatibility would be broken when
we add it? Is the reserved here for that?
>+	u32 reserved;
>+	u8 data[];
>+} __packed;
>+
> #endif /* _LINUX_LIVEUPDATE_ABI_VFIO_PCI_H */
>diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
>index 9a1674c152aa..6bae7581f4f4 100644
>--- a/include/linux/vfio_pci_core.h
>+++ b/include/linux/vfio_pci_core.h
>@@ -149,6 +149,10 @@ struct vfio_pci_core_device {
> 	struct notifier_block	nb;
> 	struct rw_semaphore	memory_lock;
> 	struct list_head	dmabufs;
>+#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
>+	bool			liveupdate_frozen;
>+	bool			liveupdate_intx_disabled;
>+#endif
> };
>
> enum vfio_pci_io_width {
>-- 
>2.56.0.317.g454f8302e1-goog
>

Thanks,
Sami
