Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A473E8C67
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286331; cv=none; b=ijbWJqc1bae4X16Jicinr0Zg5u3efn4bYxRwk0fnqztRHFMu7Eif2sPELVxXyitz7Z5kGGmwQ1pRrWexLZUnuU7V0+/nYnMLOTLKxhPe4VeD9wcDVu3InGZemfSQF6sfuQjLHFKHfyKYT7DTndNy7XB2A6GbB79HgV88CniWhkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286331; c=relaxed/simple;
	bh=2N1sMKTzNJnEbxKXP67LDZnmahmTf3OBuRzLjC/o+Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAKYCCTE2aqGtM4QYkjBrXFc1VeBlM4yogrIQADsiNYNDiVfpLIx4uWJIkrcB5x0bLfnkqPnJm8IQ4zMVkHdvTzxQ1MytTFFeTvQwT5wYaDZiERedPxhmqzm0VxUNZH+X6D/AsMJ7MzYQDhlpQY+n55OUxRVuWtbhhH65tyelGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaqOJAE1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaqOJAE1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba6485d219so35363015ad.3
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 07:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286329; x=1779891129; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGS4g7trviZuWuV8kj9ji3KsBnr4BymorUPX2qH0oeg=;
        b=DaqOJAE167OL0IAiIBHFqqHTEbsb/qSLd3RCutK56IIKSnd05WXKORoFNLt8qJWquY
         ad9z+eUuBn4NUw3OCQU+x0drVRaXywhBMD+1XE8JRCSqgtLJw06fRZ9Ma8VUYlOc1dkA
         a65Po2Jzqs3M77W+ZqBkPNzFrQeF6v1bwB9CQUiFkbHX10riOyotWgz0uxtJWtsKbvQS
         RBFVAeSabl/QK+rBfCvkfHHeXPtTST30niyTtd4h2gh/xQ+uubU1/7X7Fs7aaiPEomKO
         bRHoo79tu+fev0SdMm453y9d0JyBzIQD5mbBV010qZ3/H1mxsfDT4K59b0J/DqRk8GAX
         h/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286329; x=1779891129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGS4g7trviZuWuV8kj9ji3KsBnr4BymorUPX2qH0oeg=;
        b=d6rpcZLF+QZjxGXAHKRx1x7vt/BjPRgp1dSi5+v7K1XViP9lxi+MA3he1E/cWhrzng
         /uIm/2uXzHyfp49b7R5uE9qT2AiJDXY0RQq7W1ul3Qz0YOFka8J0vCNLjKPtaxoNv2Gx
         xfrCw+yxkVsfelVV5I3GrfWKf6n3LEHK+r5PrtmSMB93uCnXFkEpRcHLue6+s4WyLgqu
         Lq9pi/UU5R92tO8LhmRN7fc4I1bDwnBf11KeIu2Ds8vmAeJ2pwn+XD2qB4qnoB2/KSEk
         CbJ9x2mlhFkHNp1IU/Jkqqrg8pkuWW/0QLNSn5PbQQJC/lx26xJih3POKD7TkGdHo6MT
         yq8A==
X-Forwarded-Encrypted: i=1; AFNElJ++ECbksX6a5V3ju3yghmREQ8oYL7miIMOYB+Rstyyj5WBxd471mX/1DJvE6XrNatsI5B+sCQfKEgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiTo+vszf/LORcQvsjq9mF1xta4d7K4gRjPcUk8aqkbxUnMxix
	7sgxOy/IeIh1wRB7oP9UJQtzeMhgqawAHDIA4IwE25E5XMYp4Ph25ReE
X-Gm-Gg: Acq92OHOmh7359oWj6isGyb3EqwcDMO4iXPA/4M6f4BJYFZjywK1lW1xtHw35yr+bfU
	ds/al8wUYFOY3rYE7iONQ5cjRM7UEgqai3ZJkdncYTT/bq/qS1MjBZHF+V3ifY4KR6tatqJlLYi
	+K3IjAxaW5RQiQwVPCAewdyTRQGKcpaTnotGYoG2nr4wEbngE9JmHQIngxJsX3oROBnhBpgN4IJ
	uBthrsB/u2v3STySBgeuGO52K9MvLMSLtUgQEgKu43vknbP1WC6LlTR29n7hH52vec3qyJIYUEB
	+Ero8Xl4VuR7aKzc7Opsv4naTFPzfmX5S/Mx54cyGUu9pgA3vxiNgXGY+B/HCTG1NAFErVrHiXn
	KFF7ftCCeI/DLI3Ot7hBJDJ5Z2N03gRm0IY3Bes1O/IQJuxK01jY+4VGJiSx+60Rvry7O7rfxUO
	tJP4wrJ0AyAoL0SpCRobdwFnmIFKE1fR5s2M+9fPLZLjcYuJZ8ZSx6OM6A8KBzG53duQ==
X-Received: by 2002:a17:903:2907:b0:2b7:a350:463f with SMTP id d9443c01a7336-2bd7e8883d8mr164318035ad.10.1779286329405;
        Wed, 20 May 2026 07:12:09 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11ce67sm227565595ad.74.2026.05.20.07.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:12:08 -0700 (PDT)
Date: Wed, 20 May 2026 07:12:06 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	kys@microsoft.com, Liam.Howlett@oracle.com, david@kernel.org,
	jgg@ziepe.ca, corbet@lwn.net, leon@kernel.org, ljs@kernel.org,
	mhocko@suse.com, rppt@kernel.org, shuah@kernel.org,
	skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <ag3BNjx2zJz31NTr@skinsburskii>
References: <177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
 <20260518104808.ba773348f8564303c4330a33@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518104808.ba773348f8564303c4330a33@linux-foundation.org>

On Mon, May 18, 2026 at 10:48:08AM -0700, Andrew Morton wrote:
> On Wed, 13 May 2026 02:40:11 +0000 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com> wrote:
> 
> > This series extends the HMM framework to support userfaultfd-backed memory
> > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > 
> > Some page fault handlers — most notably userfaultfd — require the mmap lock
> > to be released so that userspace can resolve the fault. The current HMM
> > interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
> > in pages from userfaultfd-registered regions.
> > 
> > This series follows the established int *locked pattern from
> > get_user_pages_remote() in mm/gup.c. A new entry point,
> > hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
> > mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
> > VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
> > the caller to restart its walk. The existing hmm_range_fault() is
> > refactored into a thin wrapper that passes NULL, preserving current
> > behavior for all existing callers.
> > 
> > Faulting hugetlb pages on the unlockable path is not supported because
> > walk_hugetlb_range() unconditionally holds and releases
> > hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
> > inside the callback, the VMA may be freed before the walk framework's
> > unlock. Hugetlb pages already present in page tables are handled normally.
> > Possible approaches to lift this limitation are documented in
> > Documentation/mm/hmm.rst.
> 
> Thanks.  AI review asked some questions:
> 	https://sashiko.dev/#/patchset/177863991557.82528.15288076059759579141.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net
> 
> I'd ignore the fist one: don't write buggy fault handlers!
> 
> 

Thank you for the review.
I addressed the issues found in the new self test in v3 of this series.
Please, take a look.

Thanks,
Stanislav

