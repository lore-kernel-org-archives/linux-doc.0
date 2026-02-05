Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5609F33509C
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 21:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325243; cv=none; b=paYLjpHrBTUBouY4YrRWG4Q2E9TECnKVxlDKHj/hOxJbcuQt6bji+QTu7hY0teDgq9WWW9KzpxpAQf0fR96UUk34jdHuLCOTdqbuCj+lsqEq4rf/1OVoHnzMP2ttTmkYwldAEHOjfiLo1VI1LgqB5DMH3r2h/b+uh6AQlfKiNrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325243; c=relaxed/simple;
	bh=KLbaRgHVZXPc1lQS39X/po8u/6fvm7lynlb8kx1LgCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nH/UxE17fI/FYtOsHAgxLBIJg6gf6wYIyPk7HvwMJFVM57bH0uqOImGJi2GAWbM81STb+k7VFqyWfEcxD5aHWO+lB5q9/K1RcjQ181FNbUfWOuTh/cuzHvEBs39CVRfkcYGs8NGJqnIvPDR3qIidzChBDyick4+c89dRL0f0lLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FoAjm2F0; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/IJ5Nn2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FoAjm2F0";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/IJ5Nn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
	b=FoAjm2F0+C0lIDsMprrIgJ8Jwa8OkDVMqK0lixuZ+YVQeY0fqll3qYfI6Hk5ebcu3rnBsF
	NFLpw5V4lpvPfuyE4d0qBhv4K2f3aISa/9jPrHf5TEa6407DKGuTbMG+G1zG9JTGRdDJM4
	HThLzERRi9FNIsfArESOH+OgH4LN/BU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-DB5loGy_NIqIXaa6uFIW-Q-1; Thu, 05 Feb 2026 16:00:40 -0500
X-MC-Unique: DB5loGy_NIqIXaa6uFIW-Q-1
X-Mimecast-MFC-AGG-ID: DB5loGy_NIqIXaa6uFIW-Q_1770325240
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a62ca32so416167985a.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 13:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770325240; x=1770930040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
        b=M/IJ5Nn2e1zalLsMQcV9xn3IR5HsYWg+UoIwOxvJw3JOyFy3zy58Fgpz3X9QVp5T4e
         v8MBIZbu2lZO/4xgsxmBakehdR+/fq/ciGNRZC17eebxAwU03NF5hoFqJWF/V8ZZU7TO
         MkGnSAkS+dytExI1EnUzeX7yI8rGPu67zK12ZeGsW7eLMhU8uEvgFu1jaqNlPuAVVPvN
         KOtZl37pFa2ox0zYI9N3CFOG2Sd323BokctBP/4wiIZ8swqYjRbCFHZ6ydK2btG24clA
         X2ubOs89UvivxzAPnAPiQxI31xgOS8UwpX/UlWgNZEE+86ga5VPfOJMp1709UWe471Hs
         +0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325240; x=1770930040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
        b=X5v4mYnUWmf6BWrQuvRm70pZFkmBVfhRDiWSbTImp3O3NKDdJS0JN0FvJpxdvvxBFO
         fhAIKM77riuxKVyhOP47YB9FzjHeC/e71fa5uMvZiK6LMK8qzFDCmAwyl24n4qXSuHPE
         V1Qx+zgVnZHSl3vgZlaTJDmvdVNUeJYXqVeTMQJgmmefhzMirVVFV402Q+6eqPENEnGp
         zvdFtxrYbZ9h0UFAM8dWz/+VNfGEjmjeWVWNr5d6SjBcSUmnG+sZ8rtf0kyFa2MBNQto
         OBnW7w4SQBn2jQIumLWejE8DretU6OotR38pSNp/wSq3JQD0tW5V5g2EH9SxpZVt/inD
         rxGA==
X-Forwarded-Encrypted: i=1; AJvYcCUONiAoi9K6W9lpJK6m2sHLhyKJ/y4PTIL3k6iDHBx5l3PENjePYs4M3efjRq6aVLo0UXd8Zp5Ecr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOdXlSZeiT/jXK5fU+TLT77zZz0RGed3UWnPaJzQDg40djPfak
	zfCjD4z9SxSJ2fxrpesSJZg1gFUYUk1BrPJc0uFs5yC8Juq9ze+CXpNlwTADzE+Y0yPQ7Bq0sWJ
	nXPhKJizAvp8Gdy8QqxEYaGah/42yS1vucaf20oQS+d3O8ZIVp8yBfaCgd6y7wA==
X-Gm-Gg: AZuq6aLbZAJ1gN/TH3LJiOpqOFL2jf0Dfuhxekrrmky5K+q69rEnzItQ1oaxx+jDmni
	0kSDv9GRqh5b9sj/UIa/3CuHZGKleZTN1jL/xIVrCbXLlooKABhManSzUgik7ZAB7oqqaKDNHT5
	mhOLbs+Jc00aXkJzMT/dM51pUEj9rQYXoHYGajLIFl9ZVrSdZYv/CWPKCtHzAa6WWauoWtUyX4v
	q6yA2ZwL0QINZQA4Vb4wlHeREIgQyysugZTt8psZUXfld2o38PPp6Eclbv3w8z+Wn15fI7fUN2Z
	/zKz3+EjMxgTEKjd9Uu3Pn1IfSrQRp4bDx6tKvzJiIRknQuXSWS8vHPLQMRkoZgkyw0qAYlsy9n
	/Qi3CER/gHE3vKzw=
X-Received: by 2002:a05:620a:3953:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8caf0487af1mr60626185a.19.1770325239533;
        Thu, 05 Feb 2026 13:00:39 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8b2:eae0:bbf4 with SMTP id af79cd13be357-8caf0487af1mr60617885a.19.1770325238937;
        Thu, 05 Feb 2026 13:00:38 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:38 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:56 -0500
Subject: [PATCH v2 09/10] rust: pci: add physfn(), to return PF device for
 VF device
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-rust-pci-sriov-v2-9-ef9400c7767b@redhat.com>
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

Add a method to return the Physical Function (PF) device for a Virtual
Function (VF) device in the bound device context.

Unlike for a PCI driver written in C, guarantee that when a VF device is
bound to a driver, the underlying PF device is bound to a driver, too,
by always setting the flag managed_sriov in the pci_driver structure.

In case SR-IOV has been enabled by a C driver that has not set the flag
managed_sriov in pci_driver, return an error from physfn().

This change depends on commit a995fe1a3aa7 ("rust: driver: drop device
private data post unbind") to also uphold the safety guarantee in case
a (broken) PF driver re-enables SR-IOV in its unbind() callback. That
commit extends the lifetime of the device private data beyond the
remove_callback() wrapper. In particular, that commit ensures that the
device private data for the PF device is still alive until after the
function pci_iov_remove() is called and forcibly re-disables SR_IOV,
which means the data can be safely accessed by VF drivers until then.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Uphold safety guarantee when PF driver is written in C.
- Let physfn() return error if driver flag managed_sriov is unset.
---
 rust/kernel/pci.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 581930d0afe98ccc29d729e4d9aab75b4144e46c..3b11f73a9f2b69a02fe003b8feadd61864adc8c0 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -525,6 +525,59 @@ pub fn pci_class(&self) -> Class {
     }
 }
 
+impl Device<device::Bound> {
+    /// Returns the Physical Function (PF) device for a Virtual Function (VF) device.
+    ///
+    /// # Examples
+    ///
+    /// The following example illustrates how to obtain the private driver data of the PF device,
+    /// where `vf_pdev` is the VF device of reference type `&Device<Core>` or `&Device<Bound>`.
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci};
+    /// /// A PCI driver that binds to both the PF and its VF devices.
+    /// struct MyDriver;
+    ///
+    /// impl MyDriver {
+    ///     fn connect(vf_pdev: &pci::Device<Core>) -> Result {
+    ///         let pf_pdev = vf_pdev.physfn()?;
+    ///         let pf_drvdata = pf_pdev.as_ref().drvdata::<Self>()?;
+    ///         Ok(())
+    ///     }
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn physfn(&self) -> Result<&Device<device::Bound>> {
+        if !self.is_virtfn() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct pci_dev`.
+        // `physfn` is a valid pointer to a `struct pci_dev` since `is_virtfn()` is `true`.
+        let pf_dev = unsafe { (*self.as_raw()).__bindgen_anon_1.physfn };
+
+        // SAFETY: `pf_dev` is a valid pointer to a `struct pci_dev`.
+        // `driver` is either NULL or a valid pointer to a `struct pci_driver`.
+        let pf_drv = unsafe { (*pf_dev).driver };
+        if pf_drv.is_null() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `pf_drv` is a valid pointer to a `struct pci_driver`.
+        if !unsafe { (*pf_drv).managed_sriov } {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `physfn` may be cast to a `Device<device::Bound>` since the
+        // driver flag `managed_sriov` forces SR-IOV to be disabled when the
+        // PF driver is unbound, i.e., all VF devices are destroyed. This
+        // guarantees that the underlying PF device is bound to a driver
+        // when the VF device is bound to a driver, which is the case since
+        // `Device::physfn()` requires a `&Device<Bound>` reference.
+        Ok(unsafe { &*pf_dev.cast() })
+    }
+}
+
 impl Device<device::Core> {
     /// Enable memory resources for this device.
     pub fn enable_device_mem(&self) -> Result {

-- 
2.52.0

