Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E8E331A67
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325233; cv=none; b=IEvXZNq9zf6EV61PueQerSN8s3ZffDhtjS9RB2mj/MvG4mdpYn6sNra1rH5fsJg1rzd5ZLhOT8zlKZZVw39afpqhwv9ve4Bgx/lYSI5yDCoEN7VmBmIqk1V2z4154b+X8ZkxuKWWjLutDLreDn+pLmtj0gle3cKwn9WFDB5kiuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325233; c=relaxed/simple;
	bh=jkpwy4GP+toHnd9AMJZipLXyNcEvG6BNgGl4osE5Tb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EoQVgrA5h28o5bqkIkXf/6coBrpOUeQRsLVtU+RSBTJbcGdxXt+1K0U7vmMy7BXWsvQS32OGhqdDYtsUlBme3eydtF0oCxNxDEDTVfEjAeWvze/UfjdsAuywfmA4pPBZ/RCS4IMJsEgpznaxxh8L2mUk8RelbHOlKvMuau1cNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BVLbSJos; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JAnT6UMa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BVLbSJos";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JAnT6UMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADQ8gPT48rFRIIyS12cDuNBpt1e1vav+7FNrnrbDyrE=;
	b=BVLbSJosjyduorSE6ghsZloHUt4JxspXuT7fClRGmWcpavJVoWj7UnJ0IY4wMXhuUx5uFC
	V1CxgS6CiP4IhrsWTMte4n1N6XEc5vPRWSdO+NOFDfPCvcrTgtnUy80POZFSjmtncHVhA2
	pxIcSaQ5QTiKE5dVAOH2Ar/2WWpKiK0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-0siLVufnNtG5TYQx0ZPIWQ-1; Thu, 05 Feb 2026 16:00:31 -0500
X-MC-Unique: 0siLVufnNtG5TYQx0ZPIWQ-1
X-Mimecast-MFC-AGG-ID: 0siLVufnNtG5TYQx0ZPIWQ_1770325230
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so322482985a.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 13:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770325230; x=1770930030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADQ8gPT48rFRIIyS12cDuNBpt1e1vav+7FNrnrbDyrE=;
        b=JAnT6UMaNIA9JW4/9YywS/xvrZb4nwmW5NiyPOLO8yVQSY+mdc8d3gqkqAOZqP/MAY
         +Q/GL31jy3sc5qJ5UI+lsh9kSb86w3cJ82EjvVMerNxNPgjxAGWsa2SRKBZ4o1w4qsyK
         C9bJlasRoEWQSammJg9CGCwCi8n+mRfqnhESsE6qnI/9+TrkGrQy1HjjHfWZh3B/d/Dp
         8u37WFqfkvjVVe9qHYMgRLdwAmcyc48H5wYe5WcmgDxWdu5rQWgorZb38wxBHLO43lNX
         jAE/Mpbv+2mz/klOPrR68r+XLPysPlgWp6tXoze7oc41ooP4y5XuI2uduf8M3wlBzm35
         mz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325230; x=1770930030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADQ8gPT48rFRIIyS12cDuNBpt1e1vav+7FNrnrbDyrE=;
        b=ZGyTDq7IOmA/7qXYaUda1TreeQEGCGz4uEY8b4cXeIhpaDnxoLO/Y1nrJ8PFK7GWPW
         DbnRXHjZhr5p50RnWh3RKkcHjJbTaBDH7+0CfNKPIz3is0hw1NdfEjO9boobI1Olviyk
         cpi4wyw0ENlEmA/qkzCtfOi3SguUM3UuBbIUeG2sEaJAd3AJEtTi50xonsFIBDU+ydPw
         N0hH1OL/wXizn7yv3GIFrnfMtkYAoBZDOOQFDkxPsyBeTdbsXibI+/C5kODxFp5phy/Y
         ke0EbEaoE8102BAb6TRNTtMa1eJA2kuTF1xLGQz8+pKsvPgF/mM0zZpPnGLiw85PkdBB
         ZagA==
X-Forwarded-Encrypted: i=1; AJvYcCWGhhRdVy33upu83ZMqM90vOL+DfP5ooB3wNi91jpn6OBv8dU4d0rHsLqigpFwxQLUtHu7rlSsKG2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvw/mE8GXpOwxtOl3AmCvseblXq/BIEKURiBxzV2LSkvSl7pcI
	S6tVS4Dt8e/56zrbUbVGBdZgBLHZ4rBYxhhFO/fGruVz57NkyRZ03gjoKoZBk3lasECsjQZzfuI
	XrCh80T47GxrSXsf42p5g3hMOnpIvRNVBTzK9AoRMGT/ifXkhJA+U2b1IP+uFEA==
X-Gm-Gg: AZuq6aK4rcwZru0bMzJC9zUgqSwM7N0CWjkQ46r4FmfpvuIPJzXZ7el0NyKrOGm+ncz
	3e5vpwJEAgS8cOrOLkmrCPxrimntFkE0Z3dP5No9TFvkz4iPNpH1N/hapZSvnLAAVXyfD4rrARE
	BoBQcny+mKidnHKujUMQ1BfUZA/TRnA7K+pudQtO5f21KI3wYT+9fVBG1Qx6UxknV5M4DAjnsON
	cQtncj/5F+k+RI2NlGD22B9efs5m+QmmE4sHwkmXIfU05mYp7JuK8gcGgWQAmNTKEuKwjks+UFk
	FtYOy1aUBLd6oXUctk3RFqkzhIXhu+obMrHTZcSfjUubRoEt1xTnEBEF6ZbF6W3l76pG5OCATlR
	KCOB9JmNa0VfhnhU=
X-Received: by 2002:a05:620a:28cf:b0:8ca:d5cb:6842 with SMTP id af79cd13be357-8caf0c44afdmr60949185a.44.1770325229830;
        Thu, 05 Feb 2026 13:00:29 -0800 (PST)
X-Received: by 2002:a05:620a:28cf:b0:8ca:d5cb:6842 with SMTP id af79cd13be357-8caf0c44afdmr60935085a.44.1770325228925;
        Thu, 05 Feb 2026 13:00:28 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:28 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:51 -0500
Subject: [PATCH v2 04/10] rust: pci: add vtable attribute to pci::Driver
 trait
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-rust-pci-sriov-v2-4-ef9400c7767b@redhat.com>
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

Add the #[vtable] attribute to pci::Driver trait and implementations,
to prepare a subsequent patch that adds an optional bus callback
sriov_configure() to enable or disable the SR-IOV capability.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Add missing #[vtable] attribute in PCI driver trait example.
- Add missing #[vtable] attribute in nova-core driver.
---
 drivers/gpu/nova-core/driver.rs       | 1 +
 rust/kernel/pci.rs                    | 2 ++
 samples/rust/rust_dma.rs              | 1 +
 samples/rust/rust_driver_auxiliary.rs | 1 +
 samples/rust/rust_driver_pci.rs       | 1 +
 5 files changed, 6 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index b8b0cc0f2d93599358c8cd6562d23c27e4654a87..3944077adf550ac91422ca1cb235365b8502586e 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -65,6 +65,7 @@ pub(crate) struct NovaCore {
     ]
 );
 
+#[vtable]
 impl pci::Driver for NovaCore {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index e1cab1574a3d309d25bf5267c0b0d8da8fb66d44..a4c27c674bd8bdf5e3316789d38d566e90b93fe2 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -278,6 +278,7 @@ macro_rules! pci_device_table {
 ///     ]
 /// );
 ///
+/// #[vtable]
 /// impl pci::Driver for MyDriver {
 ///     type IdInfo = ();
 ///     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
@@ -292,6 +293,7 @@ macro_rules! pci_device_table {
 ///```
 /// Drivers must implement this trait in order to get a PCI driver registered. Please refer to the
 /// `Adapter` documentation for an example.
+#[vtable]
 pub trait Driver: Send {
     /// The type holding information about each device id supported by the driver.
     // TODO: Use `associated_type_defaults` once stabilized:
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 9c45851c876ef33414eb0071c42a2fb4ac3f1e78..ae6f7328b830e32bcaf7f8b5f8b1f117135ebf8e 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -51,6 +51,7 @@ unsafe impl kernel::transmute::FromBytes for MyStruct {}
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for DmaSampleDriver {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index c20961f168356c6bbe0faefc0079d7a90b013684..67a17f4b4657b5f91a4fc603ca7025478d79df2d 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -66,6 +66,7 @@ struct ParentDriver {
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for ParentDriver {
     type IdInfo = ();
 
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 4dfb8a6a47077d2c565b09f7c7822f7f5e2641c8..fe4db08d42a74abb5865c75968249b58bedc01fd 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -92,6 +92,7 @@ fn config_space(pdev: &pci::Device<Bound>) {
     }
 }
 
+#[vtable]
 impl pci::Driver for SampleDriver {
     type IdInfo = TestIndex;
 

-- 
2.52.0

