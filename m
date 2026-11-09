Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794188393;
	b=o4WxVOf/TNf6EVERXo/xFhv/W3vNvJl+AUJakDKDXag46IUGa424ytw4MLbPJZwVD204
	 Pp3Icb6iWsK/43z//wtjE30AAA+E290cV9O/cuklqUIq1OB48OGOmtLC5i/DQuML9rNfY
	 T8PNvKBwnw3jVrFEm2nG4JOalr03HBsfrU3+n+bQFgi3JnCvoa0rndIKefiuhLGoDFgw8
	 j8rnc9DG3AQnSqFKzx35XM0uJ/qqW9aOYfjRo3gMni3ElCTpbjj2YSP/ACCqInuvErJ78
	 3FosGgsPWyW3Fi0uWY/qP0VYqfJmJWHbzVQMfyQbT0AtTfKRLBoIFpcA7v4g/4GLvWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794188393;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=N2xK06hAlle1j90a3CpPJO7vvIwv6kxEANWMFayYuqs=;
	b=cQyYQBPsvDQ9KsEq/iDN70baONTQCOcGZxw8ReqmppQ5+0Qq3yrjTAQIQxKWSX9K/O9e
	 rgiQgAeCeL8i5yQ1+w1PR5CgP1C7PMFk/vJvxZwDQw7SE0DovApWc6tZgGrIGgj6enjPv
	 eAxwyxR6konGgUQfFdnl0V1ZrM6+hSJEhDKWL0jS9jSXchaZwWw0oh9Uj5Ww4LG9tdzYN
	 lcjThlDBeK2Rmqt0qyiuKDkioFWO/J0dsmFCGSflperK+2CEOWr6uf1/g3eOdvXlSayxT
	 BGdwkIPwx0gFKTvP980gpooIC/gd1ZI3xGVmvJP46beuSBsCa6Xhb/EeEbvCrF732AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W6MpHeay;
	arc=none smtp.remote-ip=95.215.58.186
Received: from mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C95606A325
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 01:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C95606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=W6MpHeay
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=e/0Al7Jq6L2SmlHKUg46RwY+VbHjriaoTpVNtLR0LwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794188389; v=1; x=1794793189;
 b=W6MpHeayCZbzjlvQ0OSO4gVtStvURQRY2n5R2aLNua9loedlbM71B5O3kbUmU+kyDSu/YpNJ
 LuaF90vm8YbEGDtICzIfmmEGUyqz7sl9ZBPEw0Vw8fDrA8nAZnLHLFN9+H7A+6OS5kh0e/EVGcE
 j6VcxBpkRDEfzgA34mqRJ5As=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f7a6dd49fc22b4a2;
	Mon, 09 Nov 2026 01:39:49 +0000
X-Mizu-Trace-ID: f7a6dd49fc22b4a2
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 09:39:39 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
	g@dgvxl46587.localhost.localdomain
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	"Liam R . Howlett" <liam.howlett@oracle.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, Huan Yang <link@vivo.com>,
	Wang Xiao <xiao.wang@vivo.com>
Subject: Re: [PATCH resend] ksm: add merge_only_zero_pages to merge only
 empty anonymous pages
Message-ID: <avEkWyGoKsVlCCRG@dgvxl46587.localhost.localdomain>
References: <20261106034841.233085-1-xu.xin@linux.dev>
 <899b1b2b-4f6c-45e2-abd6-a333ac77b23b@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <899b1b2b-4f6c-45e2-abd6-a333ac77b23b@kernel.org>

On Sat, Nov 07, 2026 at 07:28:50PM +0100, David Hildenbrand (Arm) wrote:
> On 11/6/26 04:48, xu.xin@linux.dev wrote:
> > From: "Xu Xin (vivo)" <xu.xin@linux.dev>
> > 
> > Add a new sysfs attribute, /sys/kernel/mm/ksm/merge_only_zero_pages,
> > which, when enabled, makes ksmd merge only empty (zeroed) anonymous
> > pages with the kernel zero page and skip the stable and unstable trees
> > entirely for pages that carry data.
> > 
> > The attribute requires use_zero_pages to be 1, and the two are kept
> > consistent by symmetric constraints: it cannot be enabled while
> > use_zero_pages is 0 (-EINVAL), and use_zero_pages cannot be turned
> > off while it is active (-EBUSY). The new attribute can be changed at
> > any time and is only effective for pages merged after the change.
> > 
> > Benefits in three aspects
> > =========================
> > - Memory saving:
> >   On memory-constrained systems such as Android and embedded devices,
> >   zero-filled anonymous pages are the largest source of duplicate
> >   anonymous memory. They are produced by userspace allocators: the
> >   zeroing of freshly allocated Java objects and buffers in the ART heap
> >   (new byte[]/int[], Bitmap buffers), calloc/memset in native code, and
> >   preallocated media buffers. Merging them with the kernel zero page
> >   frees a significant amount of physical memory, which matters as DRAM
> >   costs keep rising. With this enabled, we measured 100MB–300MB saving
> >   tested with several popular applications on aarch64 (Android).
> > 
> > - CPU overhead reduction:
> >   Merging only zero pages also reduces the overhead of ksmd. A page that
> >   is not merged with the zero page carries data and can never be merged
> >   with the zero page, so there is no point in searching the stable tree
> >   or inserting it into the unstable tree for it. Skipping those tree
> >   operations for data-bearing pages reduces both the CPU time and the
> >   rhashtable memory footprint of ksmd, which makes zero page merging
> >   practical on low-resource devices where full KSM scanning would be too
> >   expensive.
> > 
> > - Security:
> >   Finally, this shrinks the KSM side-channel attack surface: only zero
> >   pages are ever merged, so the sharing status of data-bearing pages is
> >   no longer observable through KSM timing side channels.
> 
> Lol. Did you come up with that or an LLM :)

Ha, fair question :) This came from our own investigation. We were looking
into whether KSM can actually provide benefits on Android phones, and this
observation came from real-world application workloads. To be fully honest:
I did use an LLM to help polish the English wording of the commit description,
but I carefully rechecked and verified every sentence myself..

> 
> > 
> > Note
> > =====
> > - Suitable for Android, embedded and low-memory devices, where zero-page
> >   deduplication is wanted but full KSM scanning is too costly, and reduced
> >   KSM side-channel exposure is desired. Many handset vendors may prefer
> >   this knob, which can be used as a default fallback policy.
> > 
> > - Not suitable for server and virtualization workloads containing many
> >   non-zero duplicate pages, where vanilla KSM provides better memory
> >   savings.
> 
> I proposed something similar when I was still at RH. My concern back then was
> that we don't want/need all of the stable/unstable trees.
> 
> IIUC that's all still in place in your implementation, right?

We still keep the stable/unstable tree data structures, but zero-page merging
does not participate in the stable/unstable tree search path. One more reason
for keeping them is that merge_only_zero_page is designed as a dynamic knob
that can be toggled at runtime, so when it is disabled KSM can fall back to
the traditional full KSM behavior.

> 
> -- 
> Cheers,
> 
> David
