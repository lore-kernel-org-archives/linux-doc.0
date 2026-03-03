Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB64DBD9B
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 21:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572560; cv=none; b=XAKuqkEOx+0k/ZX9Vx5hVPgrDpv1AvNq6YDpftS61ZVXTmyINV8ZT5+wpbU65IWeiORs+r0SgrVnvYr+EDQOGvx90RLA7DBEcaP2SJ1p+7xvrW5+qHoMfUcQ5aHnk3JX2Twn8HOK8hBU2Ps+kQIQkbfqWzADU5ViHwX85Tam3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572560; c=relaxed/simple;
	bh=mDLVxGENeh4Md25iwZTF0VnSkZ32Tz3iO/wNjalXkm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ipMmxKuz2ACiw2mxt39zFOPxF8VCvUc58UMF50X4UIZckGfyj3cIhmdge8ON7c8t+opWM3a6kL6I1/1LQVwvp1z58tkz6huJENnSZ8bp31f209y/HkvX9GXs5ATklnCF6RoVD+VtIzCx38hBwhKuTREqLS5XavUxK3WNNs7JiVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g7FiJDyC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AwONCLrt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g7FiJDyC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AwONCLrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFUtofMKhN11SJynmnwd1bk8v/kag6AshDn9xvNUK9Q=;
	b=g7FiJDyCEV4nBjJ5GEeqwP4/sqGLNKQgLqzVff7r6/MxcGzpwHqT5edfIoHMEWSQ2QNWV9
	1YGG3klrAzaE/EJCvswkul8USCrlzgc93chvli/KgvzqV0uNhHhjbck7585KyQYnP+gsnU
	nUbvYREUuCzvGoNWIpr6Rv0kb+cLDnE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-jcut8Vm6PQeCL3Q4zTbSXQ-1; Tue, 03 Mar 2026 16:15:54 -0500
X-MC-Unique: jcut8Vm6PQeCL3Q4zTbSXQ-1
X-Mimecast-MFC-AGG-ID: jcut8Vm6PQeCL3Q4zTbSXQ_1772572554
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a9bf9b3aso57694671cf.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 13:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772572554; x=1773177354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFUtofMKhN11SJynmnwd1bk8v/kag6AshDn9xvNUK9Q=;
        b=AwONCLrtJn0WkNwapgSQ4P5WATF0xLHEX8W4KQfOCO55RWdguOeFXqQ7RlLtbGafrX
         gF2ILOTF5Bk0/+PxX2ZWp3LFpEev55kvxohKny3adLuF8x/0iqj0gySRg8h1PulOTkGr
         D4DWt9046l1Xdl3TTLLULJhluzITv3d5myxWmlQLY2rE/8e9hy99dhtkVlqTjUWVJp3O
         8WtVxScorLAUSLq1QZvgueNiP3rSp/AdHZLK2LuFhRv+tizuzltz7kZy690AuDKob0jK
         HfxUGBrNoLmbifDysXgLzo+QXhWtROtF87yDt0Wfk0yaGfcfFF6HmUZfnb9OEdxWJNsK
         QUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572554; x=1773177354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFUtofMKhN11SJynmnwd1bk8v/kag6AshDn9xvNUK9Q=;
        b=VE8nAwUCUrUZtk30HAi/BTl02Zh0IWPl9vDNKj6ZVBxXJn8v65TDEOw+P2JCkeuRhP
         LLkC4ZQ2iNGzIjszAlwC06yOzWDCKiIYDsJDh27BhpU/WXufdnLSnZ4UzUerHuW2VyOT
         HeB1X+/ZUPqeDPFB51HdeVJ7W5oTdtJbBtgoUaKlm63f6zP2ZKb3WyYCF+m4G2k1z1Sl
         r8mhL4AWLBKYRcRYCb7DqjJHrUzyNhUciaJQIE4IIvNZl3XWduVkWvvmNvFJPGi0UjKZ
         NFmMP/EJNguUXPmn+07XacOUtkGtN15Iu7a1aqMrxUbHZNzymv7pcx4MIIs/dHImQJTd
         O3+w==
X-Forwarded-Encrypted: i=1; AJvYcCWFFTmv1BQQzOR9Td2HIj3FfNe1orRnMwTumw+V+yTIhCYfVkaWKgDpmLllX24i6G4qa+ojnrZ/eiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMAlZTnOpcXQp3S/EXuARCfZjeAXCcPHm5+yR5C0pAWuFkpZN
	bSWQLceGhaAA+8Drc8LvvmXNC3i/af/c7GwrDiwWj33O467IVtOEcLiNGdY/kx2KhCMmP2Grrr0
	4YUx51P87zNAjibIZz/mVwPFBoJah4oQXZzrez9txhJcwwkAqV0pas9cfXHMoCA==
X-Gm-Gg: ATEYQzwrzQU1AfilpJ8KvL6yaLVrlrohIfiBIdSC8wu5XaF/NBuU5enpt3CaOYOHQCm
	aKFSkqUSaOFWPAEyhEDxeuFK4NPt6vz/xyPhYfGaxst955mH5R2LOUsm9+9q1zB7gcrX28X/mg3
	CUl3/jZbSx2QRAYk00NsGBFVXlgmA2uLuEwRhik3GbGfRQ+CmyKtbmNqdN/0PuDlBcpFgOYnOrY
	j4iwEo5XX11VvW5LaO/uytg019f/oKwEjmcgMOuCTtfX9LkQN5m26KH9JnUY+oq8IIim+sZrq2B
	0OtNeuhRCuzuZlXtWhCQCvOc6Ej0QHFr/3Hmrejq24Oujr6IFCvKve8hqrKjEVI6Qi3NLkOmNUQ
	n2rXD9wJeEblQTYIP4vgMlHgcZA==
X-Received: by 2002:ac8:57d0:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50752840191mr212431761cf.8.1772572553680;
        Tue, 03 Mar 2026 13:15:53 -0800 (PST)
X-Received: by 2002:ac8:57d0:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50752840191mr212431321cf.8.1772572553025;
        Tue, 03 Mar 2026 13:15:53 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:52 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:30 -0500
Subject: [PATCH v3 10/10] samples: rust: add SR-IOV driver sample
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260303-rust-pci-sriov-v3-10-4443c35f0c88@redhat.com>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev, 
 Peter Colberg <pcolberg@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-Mailer: b4 0.14.2

Add a new SR-IOV driver sample that demonstrates how to enable and
disable the Single Root I/O Virtualization capability for a PCI device.

The sample may be exercised using QEMU's 82576 (igb) emulation.

Link: https://www.qemu.org/docs/master/system/devices/igb.html
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v3:
- Drop redundant `.as_ref()` for `dev_*` prints.

Changes in v2:
- Use "kernel vertical" style on imports.
- Demonstrate how to reach driver data of PF device from VF device.
---
 MAINTAINERS                       |   1 +
 samples/rust/Kconfig              |  11 ++++
 samples/rust/Makefile             |   1 +
 samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61bf550fd37c274843e516e00068bb2ab1e152ac..8551a9474fc26309d0714aafa104a5e1ed29156b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20454,6 +20454,7 @@ F:	rust/helpers/pci.c
 F:	rust/kernel/pci.rs
 F:	rust/kernel/pci/
 F:	samples/rust/rust_driver_pci.rs
+F:	samples/rust/rust_driver_sriov.rs
 
 PCIE BANDWIDTH CONTROLLER
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c49ab910634596aea4a1a73dac87585e084f420a..f244df89c4fc9d741915f581de76107e8eb0121b 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -128,6 +128,17 @@ config SAMPLE_RUST_DRIVER_PLATFORM
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_SRIOV
+	tristate "SR-IOV Driver"
+	depends on PCI_IOV
+	help
+	  This option builds the Rust SR-IOV driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_sriov.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_USB
 	tristate "USB Driver"
 	depends on USB = y
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58ccccfd12ef019f68ca784f6d977bc668..19d700f8210151e298cc049dacc249a121d0f2c4 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_SRIOV)		+= rust_driver_sriov.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a4f7b99d9490f8fed2ab1fedb238c53304af89ee
--- /dev/null
+++ b/samples/rust/rust_driver_sriov.rs
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
+//!
+//! To make this driver probe, QEMU must be run with `-device igb`.
+//!
+//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
+//!
+//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
+//!
+//! and append `intel_iommu=on` to the guest kernel arguments.
+//!
+//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
+//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
+
+use kernel::{
+    device::Core,
+    pci,
+    prelude::*,
+    sync::aref::ARef, //
+};
+
+use core::any::TypeId;
+
+#[pin_data(PinnedDrop)]
+struct SampleDriver {
+    pdev: ARef<pci::Device>,
+    private: TypeId,
+}
+
+kernel::pci_device_table!(
+    PCI_TABLE,
+    MODULE_PCI_TABLE,
+    <SampleDriver as pci::Driver>::IdInfo,
+    [
+        // E1000_DEV_ID_82576
+        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
+        // E1000_DEV_ID_82576_VF
+        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
+    ]
+);
+
+#[vtable]
+impl pci::Driver for SampleDriver {
+    type IdInfo = ();
+
+    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
+
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            dev_info!(
+                pdev,
+                "Probe Rust SR-IOV driver sample (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+
+            if pdev.is_virtfn() {
+                let physfn = pdev.physfn()?;
+                let drvdata = physfn.as_ref().drvdata::<Self>()?;
+
+                assert!(physfn.is_physfn());
+
+                dev_info!(
+                    pdev,
+                    "Parent device is PF (PCI ID: {}, 0x{:x}).\n",
+                    physfn.vendor_id(),
+                    physfn.device_id()
+                );
+
+                dev_info!(
+                    pdev,
+                    "We have access to the private data of {:?}.\n",
+                    drvdata.private
+                );
+            }
+
+            pdev.enable_device_mem()?;
+            pdev.set_master();
+
+            Ok(try_pin_init!(Self {
+                pdev: pdev.into(),
+                private: TypeId::of::<Self>()
+            }))
+        })
+    }
+
+    fn sriov_configure(pdev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+        assert!(pdev.is_physfn());
+
+        if nr_virtfn == 0 {
+            dev_info!(
+                pdev,
+                "Disable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.disable_sriov();
+        } else {
+            dev_info!(
+                pdev,
+                "Enable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.enable_sriov(nr_virtfn)?;
+        }
+
+        assert_eq!(pdev.num_vf(), nr_virtfn);
+        Ok(nr_virtfn)
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for SampleDriver {
+    fn drop(self: Pin<&mut Self>) {
+        dev_info!(self.pdev, "Remove Rust SR-IOV driver sample.\n");
+    }
+}
+
+kernel::module_pci_driver! {
+    type: SampleDriver,
+    name: "rust_driver_sriov",
+    authors: ["Peter Colberg"],
+    description: "Rust SR-IOV driver",
+    license: "GPL v2",
+}

-- 
2.53.0

