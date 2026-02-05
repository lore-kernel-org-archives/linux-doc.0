Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A08335540
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325245; cv=none; b=G2CwqnnFcPDWQE/8J0b0NjGwbmVOlmOYxa9WblprWOpSLjGGO4ayYn5cPohnfuN7ob7KDXc8oOCxawMOWjuZ9GKVxtetam51/n1zK0uPi+TtLbu0pnar/LjQWeloLA4u/SHnYPtxkzKnPrBWPkIo62fV2ztjDdRk64T57hiSCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325245; c=relaxed/simple;
	bh=DsoH5kljF8z69G5m/2pqjtsvxAd0CBzUg2OXfZWFlWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2egQonEYtBVy6dxK/OR3IOvvQjJFsEDpx3N3Dvwfvogs42bhEk0lvG7Cao/LY4LBkQsI/Y787UgSyUUze1m55XCMkGhDK/6qYhyzJ/Spf0+fB6SPnmQdI6q11r7seIixnq5NxtoL+MEiMgxkC9RdSw8jH2RfbwOCXM9tqSVFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S0IbEztV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CjE4iDbo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S0IbEztV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CjE4iDbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMqbQ59ZEPX4CdhRYiH6E8cBHnvUegI817wkrdE94SY=;
	b=S0IbEztVcVhNN8/1dEt+sy8KjssmQc7358uF9fWhA/tdEGayTK+MzWk1W9pm1zc1VBwq9X
	XfW9U1cnbBIwGUQAdhR6S4Jh9pTotCo8hoydjOJBytZc4g8WScPtEJvUutMuD3X6m/zKfX
	JSCVPRny5YTVv2ghzsh2hA0jEh7esy0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-mjNbIiaqOMCp_Txm3w430g-1; Thu, 05 Feb 2026 16:00:42 -0500
X-MC-Unique: mjNbIiaqOMCp_Txm3w430g-1
X-Mimecast-MFC-AGG-ID: mjNbIiaqOMCp_Txm3w430g_1770325242
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c881d0c617so382396785a.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 13:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770325242; x=1770930042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMqbQ59ZEPX4CdhRYiH6E8cBHnvUegI817wkrdE94SY=;
        b=CjE4iDbooIbm7LD2lFBUtHrDtjNdg6ej4gJapSytdW3ZHcfY81WAGs76gRo+IhcRom
         oZtGSpz9mdDjhSfkPyBDBxryBh6nCIq2Q6u+ClWtnxQDwdTgtJZuDN1rW0WdW1yqwDm/
         7S7m9ug1WNAwnZ8oq6LX/fHq+DzaG4nE3MRsJOuG9Zv+6l/uoGpwX1KxOXRjthEV39ZV
         iMUf5Xyxc+v7g0Q/J1jeFOiV4J0+GH9kS7Q+Z2clN1X/MnkI6OAwAcJhuXB/WgdV1BVu
         fddIDwvUc1TEgoaF4nuwf31zjYcmpU5Tk1OThAo1gr7ATQqWW5pxXGbfEzgB+e0Wm07u
         vBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325242; x=1770930042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BMqbQ59ZEPX4CdhRYiH6E8cBHnvUegI817wkrdE94SY=;
        b=s0lhZC0bXE9shHe8rAPq9WUarPPDSCQfWsRHOg4Cj7biivMhYaQIAmZZDta4Btz7S8
         YwIZzZUTzrA49gklyZlt8JFjGfNUZ8J1tz/Wy1hNH32tMwM2e/7uLN/XTTpgy+838CGD
         83aoP3GxR0Koh0V0qso/PMkwVm6+Ww/aTmu9udoWkDjjiMr9nFOQ7yYU3ou6X5lvhsEm
         TqD3y0FwPZwIldhw1Wm1ZbedrLBxbsz6xRv0bbQ1pcaJydrGXQRUCtPGxaoyaTa1X0xv
         OebAxD6CTHwATSk/B8Q1MaM3NtO7idjB/Wm/fLumeSD24ddiVTQj7eYyZMSR4g7Ityxf
         NwNA==
X-Forwarded-Encrypted: i=1; AJvYcCWnTNBI4tc4Sqo0NMwwAXEbWby0rXNqUIVsPOrp3tA0pjC0FAm0rVXlw5rxqX8+yh0AKhyjulmp/5A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv20afFabr/SCTLFxXy8Aaukj2VGmKEhCLxDBqwNo5TR1Oj2El
	ku54fuSiChefioFjiKOwkIBHeXj9PIIQ0U3kgaZfAyhZy97vKz5yEHqjii+KbT0fKGASr+xG4ej
	Z0uB/gCH1ONDew24Qz+uEvEVh1ClpqSjx4ak8GfLUi+/GeGcJytNzZMNzbmecvw==
X-Gm-Gg: AZuq6aI53JW/c/6/Wyfjxl2AEjDFWENGNYRAyXziQEsznyZ9Ssid4412Eyu8q9wVjy8
	fU3vn2U0PQhKS9HXkKjkH/T+SqyC/9YLe2V8R6ivmP/6sDYfJBglumLoF8wcTWHlErB74cpf4Wf
	K6rO7UVFHegFpNNqb39wKw7UqJH/ifQzpZtL9rG9NkHvleOHt/TgLh26nyqHP/8cPCuyTXwLV96
	AqrFlTNWPwIHLpEfBMbBDgyYFvgDV72nFdnMaV/dMCEz7Uce69jrelKVUn8JvNHHHDNU8JiuAli
	ADJb/vx3NCN/GpCzYJjNLfL0H/Llx7NIwEd+yyfNvx9kFeYRysS/D2OAk93N860O00y4guKUh5T
	BT6Zs0r2mThmO/C0=
X-Received: by 2002:a05:620a:28c5:b0:8ca:3854:8110 with SMTP id af79cd13be357-8caf130789cmr57433185a.72.1770325241426;
        Thu, 05 Feb 2026 13:00:41 -0800 (PST)
X-Received: by 2002:a05:620a:28c5:b0:8ca:3854:8110 with SMTP id af79cd13be357-8caf130789cmr57425985a.72.1770325240837;
        Thu, 05 Feb 2026 13:00:40 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:40 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:57 -0500
Subject: [PATCH v2 10/10] samples: rust: add SR-IOV driver sample
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
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
index b277baee5eb6725b3a5126cefb6eef6190b02413..96dffd777c24473063baaeda017f64b15e8c0ab9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20242,6 +20242,7 @@ F:	rust/helpers/pci.c
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
index 0000000000000000000000000000000000000000..84d057629c7b03d743179a4e05ccc092f814bf6b
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
+                pdev.as_ref(),
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
+                    pdev.as_ref(),
+                    "Parent device is PF (PCI ID: {}, 0x{:x}).\n",
+                    physfn.vendor_id(),
+                    physfn.device_id()
+                );
+
+                dev_info!(
+                    pdev.as_ref(),
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
+                pdev.as_ref(),
+                "Disable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.disable_sriov();
+        } else {
+            dev_info!(
+                pdev.as_ref(),
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
+        dev_info!(self.pdev.as_ref(), "Remove Rust SR-IOV driver sample.\n");
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
2.52.0

