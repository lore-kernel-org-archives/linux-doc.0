Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B903E3151
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143976; cv=none; b=h78WKOrV5EwCrdf3N3h7RdK+wI9KFsRp7xFxNVN+z2nSiNNcIPVsmLlguoP0k3zwQO4GZvsblbIpKXA59hsSDuR3FqWcP+RzTXX7NQSYPV4TCTNZWJV4Cy36mW618tja3V5boj4b+c7nVI/8W9g0BlPC/tMY4HrYrn2DkzQD/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143976; c=relaxed/simple;
	bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaAPH12kN5qsTmWokC2+4BcxlgpTGTP1Yssg3yEACaNFb5bHG3/ii6lJWAgVImvOpXDLXfQxFjeBPIkdr0EarpI9v2Mum6kSrzSyL5B5lNci+PvQtiRYsbgiwBJoG5og8k8bsCWvSR3WDDcLmDxlkpCzlU2QEjjYrnTUOlwluek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEfSOoVj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEfSOoVj"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a061a13884so50773015e9.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143973; x=1792748773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
        b=NEfSOoVj58mfNWYWD0HBk9CT923PjsiXayk+W4diiizADUl5gWFolKCOmfHSVvTCs1
         +h794OQFcnI4VxGBrjRmYKYNPZZlEJeJKxFuLAdlqzITndINEspIxDSTinaJ79MIWPwm
         ON3UuhlS5KVtsmGhygxfRDhW/CTEVozMxOM2/ArIFPRUt6S4N3wHah3YltILTp3EtwHB
         mEv4ODp7kKJgpkji5pYf735jSa+T46G3W6B5bM/c41OsFSvGAOZQHdOOSgCIIyQUbG+z
         z+JuDj0XUZjZdvHkweJHJcGeAznwfFH7zARrpSGzvyeuSzPMKTvumLA8y8i0QK/Nqu8G
         ON8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143973; x=1792748773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
        b=AEVj36tX517OXNLFF4leLpZnTqwekxfPrR2fhQ8CYrrpA2HwyBOjlPcm2A2xi6AtPI
         yNaqnV01mvitNqJFHbObAOGGB24kYiARHFebL5Q3oulL6aQug1z472qR4TumhwLKP0hS
         i59OfglgBBNnlhBK26hXUbPm1m+l12UyYDfAHmBUA+ozuehWWvzb0zL/wO43j3UAjLRm
         kWK8uXyPdzemDj5hMg36FUtVQniyDf2YmGIftSrqYAb2Ofe3II5iPBHoGGGSSqeUBwaW
         tbkXZinxtiL70vCX6hGpi5r8l5CXf6tFIY8HaxcDK1BHK7P0VpkiCKbnWktg6bNrWum9
         nUaA==
X-Forwarded-Encrypted: i=1; AKwUvBzOjVMu/NoC9bVw2lLr4UyD+iEq1NO23Ixh5nos1FFz9moZySQeTnZ4KcaxI0iAfWlQ8Ey2hFvGm1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKodTxOVxjy5s5svEN+uhbFyhnx5AeUMyZBkNVf/NfoRiGuFz9j
	ASZva41PPwVG/yFNqDf8jMIjfrGxiUleF52YILbqk+SSm1EQy7jKCBiH
X-Gm-Gg: AYBFou2BT785/YiIxGmls3eJcikV1Mm9DiHJY4Q7eqHXX6yU2OtaBi9nU5tD9uQoz+1
	eUVXqM5TlDHD5v6rCef723+S6ioau2b0fyupZJfBZ8yEGLpbfEBd4IAMBQnHrm3wBAPFVj/1FHW
	4QMJgpqUxT7ZgccQHDOU1GHc395cAq8i/p1GK+w+YQJLgArvAIYqDcYx1SFYGuCMc5CIS4evMZu
	nd0m9qcq4UXb/d6ztmwvDDZ/TKjk5a8s9CoT5/4ta2joh2I1vHqO2s3otXyS2Y4Id5CUsMJmL/7
	hqn+Wpn7GjiuziBJRHszVNQR+PLDAf1j5uu0Cc5Ps+sp6pmbEpOt6eIl39O0hlvoDRzzvo0dd+g
	d/5g9FMF664gpXKbRQE1YZEjRJwoTE5P1K1prEJK57MvvL6uZN0Wb2MQiWIiITVPfB0CR/02bV6
	FadwtHwfJGr2zaljybgc0ZFn1/WzkAHJBWxG4RoJih7xSAUukHJtqr7lT0fmGOUJb/G2HZgUnWY
	vjrq5MEPAEW8cuw3qT1XchE021ydKwmBMWp/9VQYY+DZH9Xd3Ojt67CSnJTFUlNsnioXak/MGdO
	HVpbGJ3WrGnq6mPdOpUxeEPBF2776MY5OeQ=
X-Received: by 2002:a05:600c:83c6:b0:4a1:7093:40c7 with SMTP id 5b1f17b1804b1-4a18e493048mr406737735e9.8.1792143972697;
        Fri, 16 Oct 2026 02:46:12 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca43012sm17041055e9.3.2026.10.16.02.46.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:46:12 -0700 (PDT)
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
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
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
Subject: Re: [RFC PATCH v2 07/11] iommufd: Use large IOMMU pages for provider mappings
Date: Fri, 16 Oct 2026 09:46:10 +0000
Message-ID: <20261016094610.57849-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016001448.GC14213@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com> <20261014093733.90312-8-griffoul@gmail.com> <20261016001448.GC14213@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 09:14:48PM -0300, Jason Gunthorpe wrote:
> You are going to need to go into generic_pt and implement cut and a
> more suitable unmap to make this stuff work properly. We can't over
> unmap on conversions.

Agreed. I'll drop this patch from v3 for now.

Just to check I understand what you have in mind: a cut operation in
generic_pt that splits a large entry in place into smaller ones, so
that the revoke unmaps exactly its range, and iommufd uses large pages
only on domains that support it?

> Also please don't write commit messages with AI. WTF is this even
> trying to say? The subject is "use large pages" and this text says
> "map each page with its own call"

Sorry about that. It goes away with the patch, and I'll check and
rewrite the other commit messages for v3.

Fred
