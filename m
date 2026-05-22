Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A88920C029
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 01:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779411823; cv=none; b=b9u78hpyDg5feuOsFyQwvfiv6eEWAsNSXcIvaUHZnuFaHgq/h6xt6Vohy66+ZGpbDOVP/TMPlyZIhPDdwdIaPIdJkvy711w29e4otRkjzwqCP/NM2gxtpnGhRC+bFO6M2aqjgSMa4S4sM4hg/nrFWkbWTNNzrq6xn3IsJ1qfe2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779411823; c=relaxed/simple;
	bh=jFuf+29sm0CT6yCCrd/GHo1vk06R/G857Y8gCI5R4Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYWabXQgSQPiTkH8zmpVstRRidZjt7TxrLkOEMK0NisCyfBUSTkttafgS31QajxOfIolgJGd7POjrAuGowT6gZLEQOccrEHLLf98DzbdpomyrO8h4ORCt7i2xLyGSxrYUGcSewgNLUdHeVdvwdvt61eOvM4Id4PeeeLHq7E/dcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LR/7kmEM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LR/7kmEM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so3937401a91.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779411822; x=1780016622; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKk87Bzqf6zyI2T2MlfJ+TmLsi8WzInd0FzeqW5at+k=;
        b=LR/7kmEMDNSrT+3y6I4D5+4hNZEjVqHnRpMHG95sf5xE1etPIXr5EacboAff795Jif
         ulC1/Wxq590dqKhpTOVA0A0MzzT+HNLU7Uyh3qnz+0YmyiX0mS8yiVJ+fKYTEU8vEj5E
         yYLXEjHi6DL81Pso5CvaKo5AVMDQxa4foiAS63VD2zegJdIxhS13h/oQxqlO7BS6uqfl
         V/1Wx1EA22vBIPgHhAeb5giEjahEcof2y1UCAlkUnDuiIj8UxI/lb0pxYlAsqnF72my0
         9ZZdrI5eCPSaVItC0B714NCxsbT1IAEky9yTsL9ffL+J43wEvc0xQ5wqBUahQBQ6Ytr8
         Lodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779411822; x=1780016622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKk87Bzqf6zyI2T2MlfJ+TmLsi8WzInd0FzeqW5at+k=;
        b=CZS8P9fJ3StN165r1+DOhQSpJFtp10VanLizvUfGQJ+Kz0/PSIZP4T7TvQ3Hm2gA4w
         TvdjYhcX27yJT12iXgXdPWN1ZTu3AT1WfnnOAN0Os96tEq+2Os1c5jBWj1wEt2rhKLfJ
         BV7eLpjMOYZ7HA0agfonM3dflnvtXyOF7wFSHmRYgNm6jUaSZGSNvlzQgQnqAEqeDJsr
         TKqSaYgXeTm7AYQXPTOfegNH3DU08xPhocmCcO6n9YanVSQCRLmoVnFdFU+LPf/pJodg
         LHUR1sweiBsBn3/LXH9ACg4rYpfAouD+vaEK+bGDXx5CW2mcyw3Wj7MmDS6jQcdI8mnE
         tTKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+f1clLJq6ioAipxZDA+XRDnITKLKvGJ7htdr87JYbAQW9oleuz0XGalz+ZujU5xpypfSiBiET8/pI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjPZKBwxi/Xpz/tvE62vnRAhUpgzFUG7lb7yr+xihFWrFeBWx
	V3V7G58KowoBXoxGYBONZiQ2uLj0g7Smje7lz6iLcRxlIvlOe605Tuuc
X-Gm-Gg: Acq92OG0E8kK+BrBYR3PSXzqJSeZU9BFWBEvdUTOSyl43KHKpQUw7HpcOtAK/Hl90/z
	H794BLXpeeQcHri94tu/jRAdRySqVqSIPCsEe5ua3wYOoGtMq93jUBvOhoBPeWqmRbnhp1Yc1Sb
	7miBUiBMHUSVBb9n0fJEMvPYSOZnrBZlrs+GlfhH+DMsmHWmsifBj/gyfJXj6vBBzosiEs9m3Ab
	7qj9urUNwizHOsqbdc0WSsK6RUQXYPoshaumQwuUhGSP2TZfDcHUdoSlUYfNkms2sIbY4f+hz15
	8ErEYbQI5si2jOOaXnFGDPdk/bNUJWYhqGFRlEl1Py7+jJHwdWEJc0PVSJ+OFgdbiAj1UBB30JB
	36A9VIJg/lmL4maK1DvWsrhDKWk6pPe7cN5QPUPjSdoFTZ6A4hQVRtto7pbMcfoqyMe/skGZzSt
	zFqdaI1LYZRfK70Q91WcUlAP4CkBNG7DqAFMyHjyoTmZd/Ob28ZXbtWpBq5m+vr9kEaw==
X-Received: by 2002:a17:90b:564f:b0:35b:e5ce:73bb with SMTP id 98e67ed59e1d1-36a676f5108mr1245665a91.1.1779411821776;
        Thu, 21 May 2026 18:03:41 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm189315a91.16.2026.05.21.18.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 18:03:41 -0700 (PDT)
Date: Thu, 21 May 2026 18:03:39 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Liam.Howlett@oracle.com, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
	leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
	shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
	vbabka@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <ag-ra7N7KbUxXPyG@skinsburskii>
References: <177928604779.589431.14703161356676674288.stgit@skinsburskii>
 <20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521163309.c5cc5d3f6cf16bac212cf90b@linux-foundation.org>

On Thu, May 21, 2026 at 04:33:09PM -0700, Andrew Morton wrote:
> On Wed, 20 May 2026 07:09:19 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
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
> Thanks.  AI review identified one possible issue, possibly a duplicate
> from the v2 series?
> 
> 	https://sashiko.dev/#/patchset/177928604779.589431.14703161356676674288.stgit@skinsburskii
> 

I think this Sashiko finding is a false positive for current kselftest_harness.h.

ASSERT_EQ() expands to __EXPECT(..., 1), then the optional handler calls
__bail(1, _metadata). For assertions, __bail() calls abort() after
fixture teardown, not a plain return from the test function. See tools/
testing/selftests/kselftest_harness.h:521 and
tools/testing/selftests/kselftest_harness.h:962.

So for these lines after pthread_create() in
tools/testing/selftests/mm/hmm-tests.c:2979, a failed ASSERT_*
terminates the test process. The background thread does not continue
running after the test function returns with uffd_args popped, because
there is no normal return from the assertion path.

There is still a cleanup-quality argument: aborting skips the explicit
eventfd wake, pthread_join(), and frees/closes. But in a kselftest child
process that should be an acceptable failure-path behavior, not a stack
use-after-free.

> I'll take no action at this stage, shall await reviewer input.  Please
> poke me in a week or so if nothing has happened.
> 

Given the explanation above, I don't have an intent to address sashiko's
comment and send another revision unless you are certan there is an
issue to fix there.
If you are, please let me know.

> Which is quite possible - things seem rather hectic at this time and
> we're almost at -rc5!

Indeed.

Thank you again for your time,
Stanislav
