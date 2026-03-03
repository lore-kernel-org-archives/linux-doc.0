Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786993CB2C3
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572549; cv=none; b=mYh8Wp8GTtMrw+OSBq4Q8yDXvNGgnDhTkupvqULZ5liyWtIL5DHAg1ZF13rQ2iEGZQL+s7vtUufM6UaDmUBWEKd94iFigVnacHReeUW5lKosQap50P2HAyyVKfbyGEz35/dK7OV5ExVXsF0494G3RFJQ2A0/F29YCQ+aVSVUeyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572549; c=relaxed/simple;
	bh=lJwT02KVG7/pESXAOG8cyaW742ucvP9hALO2Uv3N7Ys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQ6UpKIYNUGGtz0DWsaur1PPaxwIyLMv+CPSZrnKZMCz5NpejKItPYoDl5UlV3l51AZvVJ7UYk9cF3yWhZGVRHyrFVLwxFX34ml+M+sg9n+sQHAEKo1oDSa1kfxC33snt/Pcf0HwyRo3EjQQENd4/b2ptgcsqbgjNa4fD1535zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d1agVTT1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M9pAa5ka; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1agVTT1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M9pAa5ka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ld6zN/9/7YmG/EDhmcZckbqpb8XwO0ah+2Ai3kR30j8=;
	b=d1agVTT1mdHe2RTcnyqqu47Hr+4NPzeFPlaO7lQyK+XY4kfWdXgMB6RgxkSerwvoVXRE5B
	bzQBh2MkjW8m/GDJNVnETrOz8RimqCb8sEYaJAY+ml/0X9z0zZhuljhtltUpDz67JKk+CP
	zkn9swyNG/bYIi0VCEWI020vrHOh9JY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-khNshmmGOsKoCsbrnAyUag-1; Tue, 03 Mar 2026 16:15:45 -0500
X-MC-Unique: khNshmmGOsKoCsbrnAyUag-1
X-Mimecast-MFC-AGG-ID: khNshmmGOsKoCsbrnAyUag_1772572545
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f671c5c1so124340246d6.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 13:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772572545; x=1773177345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ld6zN/9/7YmG/EDhmcZckbqpb8XwO0ah+2Ai3kR30j8=;
        b=M9pAa5kamLG4d42fKOUrWooO7+revNokH+wbAuoUluLIDuYwpiIuNgFI5FJouogS1T
         cPiv5ftgGB1gNgsSR+mQCQRqNq1eiTVP1LNpIoD4jxpabHcsU08junB0y8G+T/U4IOAZ
         1HbakjfN/rD3BUDtGIGKQuu00lGe05CbSwslU1W9GDhG2Q/sJDLszCfHBUiYvuO4Wupw
         +vSfZWjydEIKPzYWQQw1gzfOyhRVN6zXpdoZunfDvGz8qRqlf+Ea2gOtSPKjFpSCkLxY
         UrcAwqruUX97dmn6ho9CC5kKtatKfY2ycEkgNgfISI6JDmJII5rWcoLdJUyPWjIGFfVu
         Vk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572545; x=1773177345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ld6zN/9/7YmG/EDhmcZckbqpb8XwO0ah+2Ai3kR30j8=;
        b=bsXoKFdtBWNCj8Bz5vtlMy19L7X0lvjoTDg0Ml0cEA+MObjT7XSaZcThzVuwfyb0Q0
         q1DzasozzocIB6gCRAbWDnWRmX+ePtKHaUeRdMBRL347pF0rw2aOklz4ag7YVeZjuSfM
         wBAfdNmQVHb+zg4kDMkFtR2x9a3hoYSk0b8Z+vBlEE07KRrFAK8BPX9/4LKMtXAhj0Yr
         DlkPY7S2T2KfCK7wl9OVx2TO4sGYMXLcNy3EbP9Xb8Fu1b9kHaaRfrDcQyPLz/6J1H/O
         jQqSNn1RvpD0Y32Y0aIbZ1z7PGE2qFlSpHYKcVlanjAx/J3F19EVtU9GO3KyufXz8um9
         flvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhTADKeUy9577FuFouP94i8FwTOmJmlzej2OUB+c6a18PSRJOa8qscMsi+I5bqOuE0EfwNB92Weks=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJpI6vY3xzKIXCzyO3Zj1xhaQdtjbKCJG+rKMKikJfN6/1b0g
	mxuuetSHlzfxfGxPEQYhO3aNpCpyNGWlxMQvheopuWZY1WEUGdyczWGCMvTBqtai22xbQ380Ef8
	BTAq+zJqapc1CUMP60ywMqIgstDLgPqMBUstXonkukdkjFlsl/2DuRXEhQNn5iA==
X-Gm-Gg: ATEYQzwj5W7IOXepwzY/rwy7JM09hT4aSUsmiBcXwLrAbqmdHzg2W1lM3iZKJvflJIG
	O/ddUJDg1Brgc9DbSZBiXNHodUbZExSUTh6Yt/2ZE93LwBfz9v4c2iZ5lZdkjyqGl3617fFto0h
	c296RbHyVb9W+lDiRWTfZ5OFLseiL4gYoyZOEd8w6U/eRydJPd6AQpVpu0UTzTRso25skM6r6N+
	vad4Ckia0FQ8SzHHJfdGqJxQAXe1TPaYZ6O5NjfSGM7EfedFKmTryUmlWzOiDGjFbPHbVZEUesm
	f1TfI43vqrCM90aV+EWHTHoQA+O/RqFKm041j1JRpNo4d3w70sxqGG2OD2hTGFVmrBhCr4HznGA
	rTVGgPdcXdJ7kEDra6PqlCniYdw==
X-Received: by 2002:a05:6214:509e:b0:899:fdd6:9ada with SMTP id 6a1803df08f44-899fdd6a682mr113463516d6.4.1772572544932;
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
X-Received: by 2002:a05:6214:509e:b0:899:fdd6:9ada with SMTP id 6a1803df08f44-899fdd6a682mr113462916d6.4.1772572544344;
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:26 -0500
Subject: [PATCH v3 06/10] rust: pci: add is_virtfn(), to check for VFs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-rust-pci-sriov-v3-6-4443c35f0c88@redhat.com>
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

From: John Hubbard <jhubbard@nvidia.com>

Add a method to check if a PCI device is a Virtual Function (VF) created
through Single Root I/O Virtualization (SR-IOV).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Add #[inline] to is_virtfn().

This patch was originally part of the series "rust: pci: expose
is_virtfn() and reject VFs in nova-core" and modified as follows:
- Replace true -> `true` in doc comment.
- Shorten description and omit justification specific to nova-core.

Link: https://lore.kernel.org/rust-for-linux/20250930220759.288528-2-jhubbard@nvidia.com/
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 88bd114970431bf8c3edef94c1d48567d895eaf6..db05641186c3a42922e2b6a463de9c1b099a4673 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -484,6 +484,13 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Virtual Function (VF).
+    #[inline]
+    pub fn is_virtfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_virtfn() != 0 }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.53.0

