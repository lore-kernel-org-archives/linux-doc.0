Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B5A330D35
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325231; cv=none; b=aWf5juIErze/PSCJCu3Gl27dLSSzZ+bgkO/uTJWXA5F81ep4dDlPGlOWUnUS+KVQI0/ykPwZ4ZaPtRPz8FSXdjgTyXnXbhs+N32T1WTr8xpFeg5tktVT1FgMOIxz6ajTTgHg/cB0jOOVdopyNHlJOrYwbE1YndeCoQ5EX+ACjnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325231; c=relaxed/simple;
	bh=riWgsBPSndqsTyNSBaBQnrA0qKc+QrXqhP1pn0jiqnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQSpcVcN+jJS8Qj91iscONT627Ndbt8sS14MSINShTriySjvN/rlck70ZXxUIrHnlBYri0ISMHmdIidLaH3IZ+BYpwlfE+E4uTNeIzMheueMWQukcO7qvCz1e8xlVgmngmyIcgUdYsnp0YeDOrcSrSuViWpozzlzzZ1AAv/cxYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0ZRIEHh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iRQ1KruH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0ZRIEHh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iRQ1KruH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwZoKA9DaqBTJxMiA47H9MG2vtbRUN7ZZJ7Lzm/5+UE=;
	b=H0ZRIEHhn9IClltPaBIxuQgNOIgA6n4dMg7V14ZAq9iDdf/u0MZsJ06n8tPw+bOrmAJ/yC
	OQ12EMW/+jl6mY1PelMIw2sgAkGnM/a6CCkheSuyKR67uWlwy6vRq1tAWHhg7Vr2qINRYH
	mOUwI4wS+fSjt7r9gujmGj5IBZsV9+w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-GHUr8cl1NvuXn31nle86oA-1; Thu, 05 Feb 2026 16:00:29 -0500
X-MC-Unique: GHUr8cl1NvuXn31nle86oA-1
X-Mimecast-MFC-AGG-ID: GHUr8cl1NvuXn31nle86oA_1770325228
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946198b977so34947066d6.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 13:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770325228; x=1770930028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwZoKA9DaqBTJxMiA47H9MG2vtbRUN7ZZJ7Lzm/5+UE=;
        b=iRQ1KruH8WOO+2fOzQQ9ZvO3FqFxJ3BHf7SWNDqyzIIf2UpnEWPece5mi1vIHZLBZx
         NccuRsIXikfp6Ycsxr7YebXUyNvUIcyFESY+y1GiVC/OQ7UZN9Yqme5nNQuc/UryngQT
         ns2MUDY18ZDNfhI7tK+LhqYQ6aDNlgGl2TrFWIP8CdYMM1r1H1qHVI9q+O/CWwIoPIfV
         BF+l36MRKk6Y3yOvUPvDpXvSUIxEqiDQEkR0lbDuSYBnfpMykESfRuMc1oxIC7olLskB
         rXdr6c32ykv2K08QE39GoSw4B+xAWC/AMqogQ2BHcBY9dWkibXVWqFk6BS6LSoTkVRv/
         QmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325228; x=1770930028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uwZoKA9DaqBTJxMiA47H9MG2vtbRUN7ZZJ7Lzm/5+UE=;
        b=juMwgc1yxTkRPOanArqCj+lyhOgqJqbPpNb92ldp4408OT9c+QGywHUhCoC9oju3Jd
         JNAkyrP4YurymWofi1xnq8JVU0rpc+P8LRcx2+nP+kAATuWnvQZhX+OJ9gb6YoUvJpBt
         p65CUPZF0ydz0C08xnVkL2toovWu8elHqsUsALEExGrGfV2rCE+7xYc4DpZkUfAPL5cl
         3qV4nX/BBImINROd1kDCBepS+lrzwGPMlbu7p0g51ZlreNDAX4GyJxW9/bL96SoH/dDQ
         U+gcL8Cl2oJf3OeqM4gYfy7J2f/GyIPhZPRP9jLcZTBkf7zGcLjSfaVhcbVXrEVk9S+T
         SR2A==
X-Forwarded-Encrypted: i=1; AJvYcCXvu9wM/pZ0hhypZcOr0Io41GxUIJOYKJTHjhrjwqBQZSB4AQ5BH7n8MzyljZBQcIFYbWZXTD76sw4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0szLmFR8QaAP/mDCh7Z6VGjJ/yNKa8eupi2kj8XPMNgFzpRlt
	irFZvjnhXMM46GJ8Fzhqz8fUHoFnWGTZQhLTlKZF4bTYsTVoYlS4G4EYlV8pi6rIb0N+6pAEgJH
	kEesphp/ou6dFpcg7LrFWeNTi389Gsj+Vu36JALi0bQvYSYOy0mJnbf/D76eopQ==
X-Gm-Gg: AZuq6aIRD5KrGt6rHgGMJyKRCplmdNjPcXy+H9OHBgrCfImmnoLHiKFtSQg8ZNv2I/X
	Mot+1rPlydJ5gaAaQCrL+oBZZ5OLdImBVl7v+MLOPHvlnF9fgiRzy6tNDzzf7oZyyIWiZeV1Plm
	PRfsnMjS5nv9eNQjRTWZU9vaZp6Es+L94ExugMs+VD8mY2BCizB+MKPhPfIl4s/CoH1CgpvrRMS
	7jG71r9b8y80+IZPICDI42JSlbSUFu9OqsfPUFrfgURT2uXoSytDOBnU8eXEq41B3XEt+MmYj5G
	vSSMSr59O8xscAm2b7T7HczIewb2XiYTPZVVYglaGUkhuQeTsBu+C1ALXbFVhQ2nebG9W+Y8398
	Wo6Zm6OtVcJJsUoQ=
X-Received: by 2002:ad4:4ea6:0:b0:894:61c8:947f with SMTP id 6a1803df08f44-8953c83ab92mr6627806d6.25.1770325227641;
        Thu, 05 Feb 2026 13:00:27 -0800 (PST)
X-Received: by 2002:ad4:4ea6:0:b0:894:61c8:947f with SMTP id 6a1803df08f44-8953c83ab92mr6626756d6.25.1770325226981;
        Thu, 05 Feb 2026 13:00:26 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:26 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:50 -0500
Subject: [PATCH v2 03/10] rust: pci: add {enable,disable}_sriov(), to
 control SR-IOV capability
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-rust-pci-sriov-v2-3-ef9400c7767b@redhat.com>
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

Add methods to enable and disable the Single Root I/O Virtualization
(SR-IOV) capability for a PCI device. The wrapped C methods take care
of validating whether the device is a Physical Function (PF), whether
SR-IOV is currently disabled (or enabled), and whether the number of
requested VFs does not exceed the total number of supported VFs.

Set the flag managed_sriov to always disable SR-IOV when a Rust PCI
driver is unbound from a PF device. This ensures that when a Virtual
Function (VF) is bound to a driver, the corresponding Physical Function
(PF) is bound to a driver, too, which is a prerequisite for exposing a
safe Rust API that allows a VF driver to obtain the PF device for a VF
device and subsequently access the private data of the PF driver.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Set flag managed_sriov to disable SR-IOV on remove().
- Use to_result() to handle error in enable_sriov().
- Note Bound device context in SAFETY comments.
---
 rust/kernel/pci.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index af74ddff6114db3c2ce8e228c5a953cd0769e8a5..e1cab1574a3d309d25bf5267c0b0d8da8fb66d44 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -82,6 +82,7 @@ unsafe fn register(
             (*pdrv.get()).probe = Some(Self::probe_callback);
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
+            (*pdrv.get()).managed_sriov = true;
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -458,6 +459,38 @@ pub fn set_master(&self) {
         // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
         unsafe { bindings::pci_set_master(self.as_raw()) };
     }
+
+    /// Enable the Single Root I/O Virtualization (SR-IOV) capability for this device,
+    /// where `nr_virtfn` is number of Virtual Functions (VF) to enable.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_enable_sriov()` checks that the enable operation is valid:
+        // - the device is a Physical Function (PF),
+        // - SR-IOV is currently disabled, and
+        // - `nr_virtfn` does not exceed the total number of supported VFs.
+        //
+        // The Core device context inherits from the Bound device context,
+        // which guarantees that the PF device is bound to a driver.
+        to_result(unsafe { bindings::pci_enable_sriov(self.as_raw(), nr_virtfn) })
+    }
+
+    /// Disable the Single Root I/O Virtualization (SR-IOV) capability for this device.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn disable_sriov(&self) {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_disable_sriov()` checks that the disable operation is valid:
+        // - the device is a Physical Function (PF), and
+        // - SR-IOV is currently enabled.
+        //
+        // The Core device context inherits from the Bound device context,
+        // which guarantees that the PF device is bound to a driver.
+        unsafe { bindings::pci_disable_sriov(self.as_raw()) };
+    }
 }
 
 // SAFETY: `pci::Device` is a transparent wrapper of `struct pci_dev`.

-- 
2.52.0

