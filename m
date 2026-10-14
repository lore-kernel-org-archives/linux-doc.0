Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913F4DE72F
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971828; cv=none; b=LvH3Rbudvhc+R2sFfmTXSmC9TbGP7AN6Q99lFKFpobC5VyFUToFJIQSZyumLu+rQk+l6VlaTl+4xsCQT+FJ1j+B6s1umj39Idq03JyLyS7+gxlQpgHZDl42xhxaZCnu8JJtfX6Cew9I8RKGCwHjikJYweLqk3oE+LeJ0+0I3BZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971828; c=relaxed/simple;
	bh=qA69ri66dsMoSQKZKokr8N+gVHGTbzuvnNDHG21QYWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LugUKf3stvemOovbPr2kHC5mpZs2Yu4ViKCEjRCCookNBWZ3A9VGCQdADzUYaVBYT6Uj44821Yoiic6+J7fNivjiM6pJG4hhOZW9c5PwnPECnAZbNj8Q8irEd+Iu/V/Zk4whqUZSSrQTPp4tEaMGq8TJWJv0m/PkRYUHqKU08EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dc59VUkB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dc59VUkB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a02718da81so31126585e9.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791971824; x=1792576624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhQ5yirY83poEzPx8x3H8aN7RnWItIKkuGofgEQwLq8=;
        b=Dc59VUkBcSJFKU18k1Zdcfw9Tf8Ab9IjtxWZ1jGUTSdA1hd5a4N8uqA2K4v57Wv4nY
         V8ekyZ8hhlwFrY4vnrZY4HGRoPDeJrKaU30YxzNdlsp8lpynXfhtD3xqnmAhFA9rSFBO
         8Wd2cX+4PO9Byo5uk+aIRM+jGSeYDbdyAOI3zrabmZ+5Xng1YNHjUZxItGtqIEKyKc2/
         Sf/j8su775EkNfg9ODWxCVCdwtxK9WsGVmsEGcferUQizct8kDgI0lcEF76Zi5pg72XZ
         li1szsWIVM6I6UKuPhRImv5uHFNVC3/uPopohVohBuToxHsaqtg0vbq3XCsNRZ+FS0Yo
         n6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971824; x=1792576624;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhQ5yirY83poEzPx8x3H8aN7RnWItIKkuGofgEQwLq8=;
        b=xe+mepgT3qP23dV2KMEwIdiEUUBzDRUcnRfy9ULjWXz5hZ9eLa20XWrsbKHfm12aYI
         Crc+MfVxst6JH1na9IkEiPVu6aQhmB6NE3+t+h8RONx69kQDiVvhsTYos7/PPp6JjYci
         jwOYl5WpYT1pWGHOf3SpD2uKUbzXd7Njta5CC9FW5O5O860hmNEib+DD9fPMHU6dIz5U
         AvzamUo8ytb36xrw5TrWmOVfgWG1Dmsrykipuol5Y7cxTdFMdWrD62QM3TtFHCEQnmnN
         D2HdBc4vWAWvHAOju2vcjSOMutm4HzRRUPIUXaa76bti/5yPl4WGyOI5JMJDhBNrIuTy
         mVUg==
X-Forwarded-Encrypted: i=1; AKwUvBxj4rmJW5rA+RFWRljlqfGtQ5u08Dc2lN58CmYmZlFYY+urKFJxlO/Tv9/bXfI8tWb4lDJ4jGbia4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDa1p01g81/C770TVQP7p1K+9y/T2u6PfvGxX62YF0i9jWQXgc
	u/zbGRadIrH9OIiM5I+G4rXTQfWpBGCK2rh1MWvne0c8c1KW/PQivXm5
X-Gm-Gg: AYBFou0ZKLgfb30i0uaxlrdudXT0lYzs3NETj+jKNk8hQ9KA6woTpY/cyosO3W0+y5G
	mzfqiycw5K11QaImDU0Dz3kRMJiWjgkz6pIeUxLadtHOiSwCtCac4sxoR0AzWU0NK0POHJv3n57
	eQ1PMJEG9idHqxmth7igQU5eUzQLeF6lk9tUftkxAj2T3rxXxJLRXXiQUgzSwvg861SYeTsDcJY
	MtHJd8KgIR0sx04iGsB5iD38oZzZtb3FuA1zTrCOOtOKqQeD9EFb3h5Z9uiHv1Q8RmRulTUdp8j
	GEeqgUvOCyTQtBnVgbye3Z/O0sm5hc1BOtwdkYRxH9LmLQyxXSXH4KBGv3kz0Ss/SLyAmOiVGOX
	j8AGmj2fKslxMHppueEbiJ7xzVIpo3rmp+ZPqJkaMU5Ino1FQYotdFB/NJD4wpd4jyg7W7d8+Dt
	3lOsj3hLYgMNI3Cdc/Zgy0PcA/f0EbnrfnY7H3WjzXB/a3QEjYZ4vYZ+t3dZTD2w6Yc7nQig1t6
	SGfnQ10i1V+AYV9ML2oMhr6Q5clzpODFD9MugTGeYVbV8enFnPNjc5D0mV53r9Amlx/a8mIe3Sh
	IIXyfunB0MOCZX6Qq2zFBAyXnXhHZ942882Q
X-Received: by 2002:a05:600c:4747:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a18e4a9862mr311763425e9.15.1791971824195;
        Wed, 14 Oct 2026 02:57:04 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac5257sm11206338f8f.42.2026.10.14.02.57.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:57:03 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ackerley Tng <ackerleytng@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] mm: Memory providers for guest_memfd and iommufd
Date: Wed, 14 Oct 2026 09:57:02 +0000
Message-ID: <20261014095702.39676-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAEvNRgEseLO+LbkwXrEit0H2LH5Wx-srSvHEMpt0=upPL3tF=g@mail.gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org> <20261006183235.16576-1-griffoul@gmail.com> <CAEvNRgEseLO+LbkwXrEit0H2LH5Wx-srSvHEMpt0=upPL3tF=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Ackerley Tng <ackerleytng@google.com> writes:

> When the provider wants to revoke the page, the notifications/function
> calls flow this way, the last [ENTITY] in the chain actually does the
> zapping.
>
> + [PROVIDER] -> [KVM]
> + [PROVIDER] -> [DMABUF] -> [IOMMU]
> + [PROVIDER] -> [GUEST_MEMFD] -> [USERSPACE] (AFAICT this was not
>   implemented in the RFC.)

Thanks for going through it. I have just posted v2:

  https://lore.kernel.org/all/20261014093733.90312-1-griffoul@gmail.com/

It changes two of these chains. dma-buf is gone: iommufd attaches to
the provider file itself, through a small interface in mm. And
guest_memfd now maps the file into userspace from the provider's
frames, so a revoke also zaps the VMM's mapping:

  [PROVIDER] -> [GUEST_MEMFD] -> [KVM], [USERSPACE]
  [PROVIDER] -> [IOMMU]

> IIUC guest_memfd conversions was not illustrated in the RFC: what
> happens on a shared -> private conversion?

There are none yet. Only VMs of type KVM_X86_DEFAULT_VM can use a
provider, so all their memory is shared.

> Does your provider need to know if some memory was transitioned between
> shared/private states? The provider can be notified too, if
> necessary. If not, then isn't guest_memfd doing all the coordination
> better than going via the provider?

Our provider does not need to know, and I agree: once there is private
memory, guest_memfd converts the pages, so it should tell the others
what to zap.

I think the two models meet there, and the v2 cover letter now says so.
The iommufd side of v2 does not pin and keeps no references: it asks for
the frame behind each page, treats a page with no frame as a hole, and
maps again on a revoke. guest_memfd can offer that for its own file:
shared pages return their frames, private pages are holes, and
guest_memfd revokes a range whenever it converts it, in either
direction. That is your [GUEST_MEMFD] -> [IOMMU], and it should work for
folio-backed guest_memfd without memfd_pin_folios() or refcounts, as
long as guest_memfd also revokes a range before it frees its folios.

The one difference is that v2 also lets iommufd map a provider file
directly. Going through guest_memfd would add nothing without private
memory: it would only pass each revoke on. And memory that only devices
use, such as MMIO, does not go through guest_memfd at all. Both paths
would use the same iommufd code.

> Does the revocation model work for you? If it helps, I can rebuild the
> sample provider to illustrate how the revocation can be done.

Yes, the revocation model works for us. v2 replaces David's sample
with one that moves, donates and makes pages read-only, and a selftest
that checks the guest, the device and the VMM's mapping after each
change. It may be a good base if you want to try guest_memfd as the
provider for iommufd on top of it.

> 4. [DIRECTMAP] Kernel direct map.

Agreed, that is separate. The memory we have in mind is a range hidden
from the host with memmap=, so it is not in the direct map.

Thanks,
Fred
