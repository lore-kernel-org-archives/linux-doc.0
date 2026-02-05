Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2516F334C3B
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325240; cv=none; b=NOSwElFxkPTi2wUt/0AkxjwkNoydfvxRt3Dm6CasG/R5ogmJ0skm0ijHnMq+fAwRHhdWwsoquWCZd+O5DWyLsiRryHY577Z0G7/LbUr7GZ6A34rwDS5Ov0GTms1mDzhUL4mVGAWzx5cdDa6YPbW7I2vZznyJInwWR70nWeQ9fW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325240; c=relaxed/simple;
	bh=zYEg72eTegIm4aBsUkMl8q2KG4rMnFZIPR9seQA5Ej8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPFcHag2BMplw+N6pPQD4XJwqvYZfpsSxhmUjLUDRHGh+MRjntUvql3sFvcFhesBPa71UEXxFScbzszDUIkb2Wdp91UcIhBxUMQvxcvF5qt/eRjIRRCgCvjqBOa4pLQAyUaJgLTxc1BqwF45IboY1aMGmxYySSIBNXeUnPpfoQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0ZuDU6W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gs5Y8Fe2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0ZuDU6W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gs5Y8Fe2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
	b=Q0ZuDU6Why2aL+sRV6jj9bhCHZ5rE/jluIhLOGGodSG22s3IH9jKGsCz79UqAJjnMssfl6
	Ojz0INf1V9QrgOKgXespGzuni/d8xmSB8iEfR2X9k/W54RTBaSEK07+Lp6xvsDV5z7dV+q
	AgfcKl9+x5VD87r+hMXC3vke6bJTq34=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-sSrRzhPNO1K_thSmofOtQQ-1; Thu, 05 Feb 2026 16:00:38 -0500
X-MC-Unique: sSrRzhPNO1K_thSmofOtQQ-1
X-Mimecast-MFC-AGG-ID: sSrRzhPNO1K_thSmofOtQQ_1770325237
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52d3be24cso240722385a.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 13:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770325237; x=1770930037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
        b=Gs5Y8Fe2u1BVoCIIfWVuAew+NDxTEBwKtArLqZiGDPZRBy1dLP5zzIZkpljltmJLqb
         DWtXoxV7aWQquJVxNxIyqTOtnFxWhCWOdqzrmVVRsWV7zRtEffiutjAUTinG2YJ2hF1c
         aAYuC38vKOzLkb6Mskb5QZfPwURt76blJKMctWKkjof7EkQeOu/6ScyVfK8kzonahC/B
         ewbYpxD9JnLYuYA7HbZA0IoRoS0w77nlC2ACRzjeKdEAx2ckDqVLg1ITuDS5F0Yf+7h0
         ox+Eg+RQ+QiJEEUBt8YekPRmNT4L/oi9zVLmflGCBEoXdgybS0bY+X09kEIpF8ZttdgI
         3kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325237; x=1770930037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iChE2sHYyL+SE0NwtrGJ4SsAVC7actOKSXH6xK1kyOw=;
        b=IRGaXur0YqqFQRE9THai26BWQL3ozKeVyKjni4Mie6kgRAgqyyycxZlrQl9EtWIbdw
         3KdUpwTLS8ybIPq3J7XQvbi1UbQ8bS8fSof6fWr3rzNkh3PRcu4PSBOlXjyB2FlbPEfp
         TomFUq0aHutxQ8E7QbfzIkm8scntLfymQ1L18uboTMRL00YDTSBL67cJbY/WT+Qg9Yk7
         66E7udLh3A1lGEmcf6Y8IyZwyzfGbt5o31T3qN8kAGpF5mP+iFOsU0cbpir1SPIkFXEB
         qw8Qx6fob4S1DEed0ALZe9DKmSan1ekuTLKX2J4EtvIU28Wn9hgiwk7vafl9izvjTBcl
         1k3g==
X-Forwarded-Encrypted: i=1; AJvYcCX16P2qld+oytUPgoKaAmJfFmkG+vJppfpbX1UPQ/ZudwTajuymQsWfXbI07cxk9jtYpzvfeVGJL0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE6ksTyCrqthbnHOmEYXyS39xMIfO4LO7jd4+V2Dne/UsB7mWa
	r/iXTMTd7gIUMDB55T++jiipvpH6HJOkXwZ6xw3bPT4bhKzQ4lKhzYxNsvu54rBavwcP9JjPQ+/
	5Z6K+oILEVpbFTdzvyXIVpXfFA6pUOeDVmO/fTwSzogLG8dx6UltRLGMLoliY/Q==
X-Gm-Gg: AZuq6aJyOyImxdl7SQEGYWTNI3awzn8iOuGAIAvfUnh5R5JvMFbE0bCXHjYwEWetghe
	c+NLId4rDNhawaax1koc1+uILdV+RaS87/Pxn7V4qPSRaH1pPaJ3OO/F1DWXJX7/WWeQeF0bzNl
	geRVmFL+i/cwsGL4a1BOFQQTBT692h3C/RWP5wOktlpYWZK6IiJYWZ9H7+z1t367bJ27JzvCvai
	wHiYpSmAJh7WfRQ9l6YlrBf7wSQJPiWgezXztGjkeYrLFKfTp6hj4KF2VFUOLhGUMvulqeOZS9K
	yImgNMdQR/t1VNpTCsu/BASGDSfd0Sayta5XyuVGkyP73b2td/nqTXBzQUhwsVUh+xr8opP1aSo
	JaZOjwraQTx9tHFY=
X-Received: by 2002:a05:620a:44cf:b0:8c5:3067:903c with SMTP id af79cd13be357-8caeeb50f3emr72337185a.11.1770325237541;
        Thu, 05 Feb 2026 13:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:44cf:b0:8c5:3067:903c with SMTP id af79cd13be357-8caeeb50f3emr72328985a.11.1770325236916;
        Thu, 05 Feb 2026 13:00:36 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:36 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:55 -0500
Subject: [PATCH v2 08/10] rust: pci: add num_vf(), to return number of VFs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-rust-pci-sriov-v2-8-ef9400c7767b@redhat.com>
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

Add a method to return the number of Virtual Functions (VF) enabled for
a Physical Function (PF).

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index df39ad3f0d5fd898b034609efb03368f83c2a2e9..581930d0afe98ccc29d729e4d9aab75b4144e46c 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -498,6 +498,13 @@ pub fn is_virtfn(&self) -> bool {
         unsafe { (*self.as_raw()).is_virtfn() != 0 }
     }
 
+    /// Returns the number of Virtual Functions (VF) enabled for a Physical Function (PF).
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn num_vf(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { bindings::pci_num_vf(self.as_raw()) }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.52.0

