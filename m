Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33C332EB8
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325236; cv=none; b=MuTwjkE8U1cuPbqOVFbMGyD7NS9+PN19Tyr9+QiONGxzrUMnK/t3OXvCWKMVEnfo00pNhv8VgLx2BnRXbDH4UIgHUSZFonlxB2mKab0izxpDsAvXojAuXC2T4T4HnXAjvwTEMcqWGmbBT2tloUfY32SBTC6EjbBZHFbViNmNdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325236; c=relaxed/simple;
	bh=goR6NT6+KiuW9XKjlJCHBNrcq9pPIxNj+WVW2jrpGs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CPih7aET46CHQITJPXXCREGGKsX9vg8cqSzGJiEE8NJdX54ZidI6i99lX8UvUFE2OMn0bkhgSGqfW2sJp+L3fFMLLMd6Ori+uqPjtRELeA0Xwk/ZxKuwq2V+mRdowhMC7cq/VVWPx84owtkQmN60PX3cBk4kiR9xUtcH2RWaeiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B838K7RV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z06xRfEM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B838K7RV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z06xRfEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
	b=B838K7RVZ3xvEyVUrLjkRi2Mv926uLlnBlH/Jc+7jGLN2q9RyTqfAOEt0Iijwy4e4UWe+/
	9A1FMzTVr3CXgWlv+YhyVsuT+/E/7MWpaLVaLcs3rIMKqYD3HWBhYz7BGsryJG8T4yAFcO
	TDiiEu0dxWIQfEmkXWXxiBMqaySVAWU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-6z5pCMmwOcWQcXufHMqOqw-1; Thu, 05 Feb 2026 16:00:34 -0500
X-MC-Unique: 6z5pCMmwOcWQcXufHMqOqw-1
X-Mimecast-MFC-AGG-ID: 6z5pCMmwOcWQcXufHMqOqw_1770325234
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-894766748f9so85882106d6.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 13:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770325234; x=1770930034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
        b=Z06xRfEMrhbiQHuovIknHwoMDaQnsH43t7JklSLAvCy24H64bfZaoAPI0IMMjHy6fD
         VCABfnk8eOlRW8MuzbgFkeh53SeCqnR5JPllvo8DfeoOZK3Jxq2MXx4xfwOi41/uf1oD
         PFZudI2ZRtLH+K5JvErqvYsk9GvfFkfT4YMEptCEehofU5hdn4xzyr6pocX2dHzRQqts
         bjIPGtcAWoRc0Slk3XS/XXDhbqrMGofrpu9kZebon8IXfWa+xejXwzUrdd0mtWveX4Sq
         RV2SdDGVu61yehHoBMJrvXgQwGp5K/NmD/n+8qs4KEoc3YFhWdm9U3F5CZQUYO5KGF85
         6cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325234; x=1770930034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
        b=U/7lOgRW2gxxJkxlqZcZn6+jfWr2YahjXr+aK+2xDYbAGgT6Q9puOiU2xEgRth2PgB
         MXM2jAwR0DH0ozMj3gEuCVS+zJ/Y0nu+0xBmlJv2yH+bXFjV+6jgpSQzmst5/+IRTC94
         UyMTdSDZJw4YbF+wlnO/C2IiW1yTD7I1bbxvA+nTSW66rKL1yLajDCeo33nhBUY6YgzA
         HjbMMhNzvtcJqaWM/Ib1OAJbOXRMDyhz1i44isBMowi06KrU3KT598Um5Waeq4iXkfwa
         3YiIKCknBW3Qc1HiHVYaFpr61qqcIu7ApZlcN3ehzBc6mnMmHqDBVUw+2e9LKzAAjWuw
         1Hnw==
X-Forwarded-Encrypted: i=1; AJvYcCXLYIl21oVGtXlv6MEqrQgPGcz1scy+qvyJ+Se+b0KEiGtgUGA5N4Gnp16/Ws/4g1MfdlRTIEIcX3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNal/+HDZQ6j69Er3qudnJySX2kWdvzP6pLEXQKUf/uwHUywhR
	xFJVUFbbNshx9Wjrms92csmxT7TxXDf4oEwj89CbmhtLhjjFZuaGR3rzh60qZN6nscvT3ivsPTf
	kdvnEqyLZ4zYgRJ+7r110Jp92bwi09ZfEnv6f0ewT53uSn/7978mQDun+rCBpTQ==
X-Gm-Gg: AZuq6aLlxJufqqjqpR+C0rj6JdMVIOSQfuXgt/55vUz9JG42L/NU208K+5wIslTuUc0
	QU8/ClCFRoQ163bZmMtsua4a3KE8rQ2gMpQ3xoEcdsDlS/F6YuvY81HnNtxVUbTF553muBJNoyF
	YLzjcmawoFFsp10TtXG8W9ZgPR56M7MBHC32mVtB/sV+o9PeKZMcPHpO2Wd7WNtqzeSbkV8fQtH
	nLLSCktSIAjqJqUB7W8SfnBAJZobjFhbLrfcV2+4pJbfp+WJL/YoDgntEyiTxBxETVl5FBNd6bY
	0P4iJCWBiCYtXbcl3ux/XCJfvS7BqNBTXDS5X2XOQxDz6C+lFV45Hjjq2WeZgjq0t9NfelqH2kk
	jxvq/Tdg5bKisZck=
X-Received: by 2002:a05:6214:4017:b0:88a:3681:1d96 with SMTP id 6a1803df08f44-8953cd9c94fmr5941916d6.63.1770325233457;
        Thu, 05 Feb 2026 13:00:33 -0800 (PST)
X-Received: by 2002:a05:6214:4017:b0:88a:3681:1d96 with SMTP id 6a1803df08f44-8953cd9c94fmr5941106d6.63.1770325232827;
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:53 -0500
Subject: [PATCH v2 06/10] rust: pci: add is_virtfn(), to check for VFs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-rust-pci-sriov-v2-6-ef9400c7767b@redhat.com>
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
2.52.0

