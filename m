Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C9933121E;
	Wed, 22 Apr 2026 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871323; cv=none; b=rPcSXJtOKxY34wi50CSHT6GZOnjEcIgy8WKddMT1UDFJRFgvtTJ8QcAHfzE0dRqEMUDcYvNM2KHYqrBDwkjOWho7toMnlTEpmzrhsNLG67iW1NH92NlfwVwMtSH2wyhtJ8X+Qp8DUUFUkRimZPspEQnkUz6h/+GpWnUvAxlfyPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871323; c=relaxed/simple;
	bh=u4g2Z/pGHhde/7EEVjb0+AqDYRFNxkclv/xEmYG0bOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebAoz/aB4yd9Ne4dzCUEI3on7dECtBPRuzlOcLLekfY/Xg4LdyIGcd5qtBWJ21VqSQ6MMimaz9b7huLYVhhdDC88QtCe6cPriN4PdMADWTVYXnFrOU7ffgUiBbR2KvULOl8f8+67JVYgH4FKLSdTbF9mCCCVIMV4nbx39U+FsFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=VnN8966E; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="VnN8966E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=64iQhIM+mmjSkPwwk8v33f79twI+c/XscbZtrh5IQG8=; b=VnN8966EV0wQ8VFsn+Qi46AhU9
	HPFetti7INJlHnxxfV2EB4TXDDgAt0c1KYZHWe2gmu1hZX2DT1R7ZVxqG9qjCXz/wJVIuwvOcnSRH
	3HGoW9xjJMko4kWbPWHwwUZ7iV/yYEaNPDcZumfAQbtWpSs+vGy3eidjmiZJyhxaYZmaiCUVemhTH
	jWnR3K0ea0uTSV7kGTdbsP4HblyDnvoOgyCndvBQpRJMoeTcN0e12J6VvTXkgW5wwan2QHSKwfh+y
	j0DSg2g2JtQyO0Bed2JREvV27ZtVYAKbtIXQL1vz0cCMDyw70Z4A+kfhPpbYuL63kIAqcJOm8E67w
	9oNovOWw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wFZOa-001iHE-04;
	Wed, 22 Apr 2026 15:21:44 +0000
Date: Wed, 22 Apr 2026 08:21:38 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 2/3] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <aejlg62nxcF_5g2v@gmail.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <20260415-ecc_panic-v4-2-2d0277f8f601@debian.org>
 <6b505601-747a-0812-7544-63a8ab3cffce@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b505601-747a-0812-7544-63a8ab3cffce@huawei.com>
X-Debian-User: leitao

Hello Miaohe,

On Wed, Apr 22, 2026 at 11:36:11AM +0800, Miaohe Lin wrote:
> On 2026/4/15 20:55, Breno Leitao wrote:
> > Add a sysctl panic_on_unrecoverable_memory_failure that triggers a
> > kernel panic when memory_failure() encounters pages that cannot be
> > recovered. This provides a clean crash with useful debug information
> > rather than allowing silent data corruption.
> > 
> > The panic is triggered for three categories of unrecoverable failures,
> > all requiring result == MF_IGNORED:
> > 
> > - MF_MSG_KERNEL: reserved pages identified via PageReserved.
> > 
> > - MF_MSG_KERNEL_HIGH_ORDER: pages with refcount 0 that are not in the
> >   buddy allocator (e.g., tail pages of high-order kernel allocations).
> >   A TOCTOU race between get_hwpoison_page() and is_free_buddy_page()
> >   is possible when CONFIG_DEBUG_VM is disabled, since check_new_pages()
> >   is gated by is_check_pages_enabled() and becomes a no-op. Panicking
> >   is still correct: the physical memory has a hardware error regardless
> >   of who allocated the page.
> 
> What if the page is used by userspace? We can recover from later accessing.
> Would panic here be overkill?

A userspace page should not reach the MF_MSG_KERNEL_HIGH_ORDER branch. The
branch is gated on get_hwpoison_page() == 0, i.e., folio_try_get() observed
_refcount == 0, and that condition rules out a live userspace mapping, no?

are you suggesting I drop MF_MSG_KERNEL_HIGH_ORDER from here, or, document this
will not hit userspace pages?

Thanks for the review,
--breno
