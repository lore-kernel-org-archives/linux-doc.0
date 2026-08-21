Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFB22D838E
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315412; cv=none; b=HWSCRFiJM1pXyLGlJyoCqT3i0ucu+HYVeTD0mK/lYg1lT2L/FLh4U/wBuerdV9+tDCL/Fi/I83Ijguqvt4evSxN4kP7mCIPpQssM1D7K2PoGdpnwGNdMrNF/Xdpqw1CK7HmL8ePTNvBLTeLG71dYMuNx95xlXhj3lobESXU2FLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315412; c=relaxed/simple;
	bh=f6YWX4JaKHfoxBtRZia+JZbw071klqQdJimBMOZqknM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=crmrigAbsI9FjEWQmKsnqQxL7ph2YGMrNvU/owv3e3XUcLSx5jFbRGPKNEBOPW8j33u0foVB1xIFeWemqLh6tA++O4FkXKPfI6pJKZcFQwWxlTWntqZyFndIuY1dNkNhAfdfDDUONgPOHOH6z4+L95bu8l5iaiDy0cmBYnZQ42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LPTJWPAK; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LPTJWPAK"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84870e7f498so941816b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787315410; x=1787920210; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0TDZ3//ZKM374BdreK4yr9CabYhqfPGunU2baHmMPE=;
        b=LPTJWPAKkvLWrMreDySEm3inMdKsS3pcHQH8aHNFS9JsrDYzcTdGw+23vixaCau+l0
         YDqng1awjS+UwuhQkZ6Q6P2vHzZ3pW6OmNXcbqKnnIIYL0SgF3PmF423YiA7R4oaMvIE
         BFI7cGLKqcQBapjmQgj2HXU1WK2xMwGK3uxn6VER8Ef7tEsrraP/Nb9YsGkGUGBW5cjF
         6zPX8THNYgfjQMsH8401adc11mJUZHnxbr8YEa+AchdbtgGyXpRYLvIFRYOm5AwEsziX
         4QCGvaZHuIZXNwd8syCIYlc7+J+kwUkX4OQlh4txDJyBwRvIY1mLUOqZiOEOVgtv6J2L
         0wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315410; x=1787920210;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0TDZ3//ZKM374BdreK4yr9CabYhqfPGunU2baHmMPE=;
        b=MaDyrgA/qlDWJtcyWzNzI6rWhZfbZ2lwBUGL3jM2VtqX7zFinUWlG/JTHHPj+hFDpI
         60qcf2QSsn0THKhHXnm49qV8xUXxFB841P5KeElA3UcjLg8Xzhc7aYYSTg0l48/TlfoB
         k2D7E/lKuQr0vXy4UxjXsicM6YMLMKPgyVeA8M3powDO+sHCh/ciE93OKZMdGg8AoRuC
         Fg3kdWKazcp54zeH8oLrfF/5ydX4mJbU/6sEHeOJtDMPZUVp3y0pdk/FFPYaQG7hzUu0
         6cibplXC5wK0HWSfPfksXg/lsOEzA4Q6nDNA5zSmVC0+eRuETtNkOu9AdX/fg3oG5GZy
         K7bg==
X-Forwarded-Encrypted: i=1; AHgh+RoYW39jvN+AMGMZph3xrYZhOZS81PN7NpV9PRAyVKsvvDUvxtZCGZIa8oFfXBwS5I1QeXQTDhjD9qY=@vger.kernel.org
X-Gm-Message-State: AFuF++n1TtmolMKIXgS6xfrpVY8OCuWeflaKra2w7NMMlSJ0of8HirB8
	r/sFsa7kQjQrmn/PSEyI2D6fZ44B5Xo2xFuwWhhdZCuy/oKm4aZLDAkq1hceGgjhx2+1N7bZ/89
	+eoc8xg==
X-Received: from pgly12.prod.google.com ([2002:a63:180c:0:b0:cb5:f989:9b3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ab03:b0:847:8acd:747c
 with SMTP id d2e1a72fcca58-851fa01e93fmr11460030b3a.13.1787315408882; Fri, 21
 Aug 2026 05:30:08 -0700 (PDT)
Date: Fri, 21 Aug 2026 05:30:07 -0700
In-Reply-To: <fe1c6359-7371-4ccd-9807-1d81c160d12b@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-40-2fc18ee6d3ba@google.com> <fe1c6359-7371-4ccd-9807-1d81c160d12b@intel.com>
Message-ID: <aohEz_1JFVDtlSnE@google.com>
Subject: Re: [PATCH v10 40/41] KVM: selftests: Update private_mem_conversions_test
 to mmap() guest_memfd
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Fri, Aug 21, 2026, Xiaoyao Li wrote:
> On 8/8/2026 5:53 AM, Ackerley Tng via B4 Relay wrote:
> > From: Ackerley Tng<ackerleytng@google.com>
> > 
> > Update the private memory conversions selftest to also test conversions
> > that are done "in-place" via per-guest_memfd memory attributes. In-place
> > conversions require the host to be able to mmap() the guest_memfd so that
> > the host and guest can share the same backing physical memory.
> > 
> > This includes several updates, that are conditioned on the system
> > supporting per-guest_memfd attributes (kvm_has_gmem_attributes):
> > 
> > 1. Set up guest_memfd requesting MMAP and INIT_SHARED.
> 
> If I understand correctly, even with in-place gmem, the model that shared
> memory comes from the userspace_addr and private memory comes from gmem can
> still work without passing GUEST_MEMFD_FLAG_MMAP flag.
> 
> Since this model is not prohibited by KVM. I think we should keep the
> testcase for this model to ensure test coverage?

+1.  Deprecated doesn't mean unsupported.
