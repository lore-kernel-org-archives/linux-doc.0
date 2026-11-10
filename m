Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274486;
	b=ZLH+elwmkrG0KUIXc/kHY3Orh6lX7TTDSgb+ZshIRZ1Aih2kjW/hUinN9qJZjNtXlO80
	 q+RnUTA9QrRRnZylQx1C8L3WtuHtI+oXpOmXV1mpVaUbFRnLoDhe4n/WToEDthFhagknX
	 jZDid8KuPVF0aN6Rqvwh3TkLhNmPpjbprD6O6olAXveThTyVF7+R+l9ikmAhizC/opBQP
	 6v8U6iZxcYBjgTK4xttQCNZixH1MXUFHtG0AdPilH1+ldT4TGOvyu9ZNSBEpQEpR/q3sf
	 O99TETQVWN/p0vO0Q4ES/XfwjW+axHztp5kL1F7KSHOmSgfqv4EKZUbfBIyL3Z/rI9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274486;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=mokQoEIcfGB/Z/vjqUY62jcJF6mYDAaM4ddLv+h/SLY=;
	b=INjqA5hqI1Ujt9pIAwcmXtfGkEGte3QNpTH50QXxQhR2jKNTjwCv1je/r6ybtXxXNzkq
	 5Tb7KOwDw/kfO0zgf97wUzL5EMZRd+ug7e1hKKg0V6zfcbqEdAe4nTC2b7yVuy2W9X3aI
	 ZbtTHNsruo0h0OIFnL1KmLHTBnBrxEkiCmvfrmbMDaE1nqGOJ4jpf38q7dDXujbUVMhux
	 QazvjS4LW+cKz6JXI5KlxCym2n7VKdE9SLlaqZEHCIJjyXjRHryIUd5wgza5VR81VqVqh
	 EI27bRqwXSFPyQEe7+w4zwLuNyidpvsvKa6GhpIyu092IQBTVkikNvVugtP+5fQSLhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e3rPUk5L;
	arc=none smtp.remote-ip=95.215.58.149
Received: from mta1.migadu.com (out-149.mta1.migadu.com [95.215.58.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10DF606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 01:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B10DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=e3rPUk5L
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+CVoqE5ZB+NLoPvHg5KqhaCiBL96mDZaZ9g+LiiiVRw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794274484; v=1; x=1794879284;
 b=e3rPUk5LBsgmimyOy8skpozEtHUoQOutbtXA9TzeXUZUSvfztLKgH5mRGn6ssOXUbO9+5d1y
 BmPqVaSdwSHmHpbLMYEuVEpQucHa3jHQSMfny+2YvgTNzFQA4c6B0JehZakiTywzu0+EIA966+r
 /nURuxXHQnCai6wEcOdV7awQ=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id c7e84b47a2292ca9;
	Tue, 10 Nov 2026 01:34:43 +0000
X-Mizu-Trace-ID: c7e84b47a2292ca9
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 09:34:31 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: g@dgvxl46587.localhost.localdomain,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	"Liam R . Howlett" <liam.howlett@oracle.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, Huan Yang <link@vivo.com>,
	Wang Xiao <xiao.wang@vivo.com>
Subject: Re: [PATCH resend] ksm: add merge_only_zero_pages to merge only
 empty anonymous pages
Message-ID: <avJ0p8ZfjZc9EewW@dgvxl46587.localhost.localdomain>
References: <20261106034841.233085-1-xu.xin@linux.dev>
 <899b1b2b-4f6c-45e2-abd6-a333ac77b23b@kernel.org>
 <avEkWyGoKsVlCCRG@dgvxl46587.localhost.localdomain>
 <3e126b7a-d7d9-4a8c-9c83-b6fbf5bf1539@kernel.org>
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
In-Reply-To: <3e126b7a-d7d9-4a8c-9c83-b6fbf5bf1539@kernel.org>

On Mon, Nov 09, 2026 at 06:41:39PM +0100, David Hildenbrand (Arm) wrote:
> On 11/9/26 02:39, Xu Xin (vivo) wrote:
> > On Sat, Nov 07, 2026 at 07:28:50PM +0100, David Hildenbrand (Arm) wrote:
> >> On 11/6/26 04:48, xu.xin@linux.dev wrote:
> >>> From: "Xu Xin (vivo)" <xu.xin@linux.dev>
> >>>
> >>> Add a new sysfs attribute, /sys/kernel/mm/ksm/merge_only_zero_pages,
> >>> which, when enabled, makes ksmd merge only empty (zeroed) anonymous
> >>> pages with the kernel zero page and skip the stable and unstable trees
> >>> entirely for pages that carry data.
> >>>
> >>> The attribute requires use_zero_pages to be 1, and the two are kept
> >>> consistent by symmetric constraints: it cannot be enabled while
> >>> use_zero_pages is 0 (-EINVAL), and use_zero_pages cannot be turned
> >>> off while it is active (-EBUSY). The new attribute can be changed at
> >>> any time and is only effective for pages merged after the change.
> >>>
> >>> Benefits in three aspects
> >>> =========================
> >>> - Memory saving:
> >>>   On memory-constrained systems such as Android and embedded devices,
> >>>   zero-filled anonymous pages are the largest source of duplicate
> >>>   anonymous memory. They are produced by userspace allocators: the
> >>>   zeroing of freshly allocated Java objects and buffers in the ART heap
> >>>   (new byte[]/int[], Bitmap buffers), calloc/memset in native code, and
> >>>   preallocated media buffers. Merging them with the kernel zero page
> >>>   frees a significant amount of physical memory, which matters as DRAM
> >>>   costs keep rising. With this enabled, we measured 100MB–300MB saving
> >>>   tested with several popular applications on aarch64 (Android).
> >>>
> >>> - CPU overhead reduction:
> >>>   Merging only zero pages also reduces the overhead of ksmd. A page that
> >>>   is not merged with the zero page carries data and can never be merged
> >>>   with the zero page, so there is no point in searching the stable tree
> >>>   or inserting it into the unstable tree for it. Skipping those tree
> >>>   operations for data-bearing pages reduces both the CPU time and the
> >>>   rhashtable memory footprint of ksmd, which makes zero page merging
> >>>   practical on low-resource devices where full KSM scanning would be too
> >>>   expensive.
> >>>
> >>> - Security:
> >>>   Finally, this shrinks the KSM side-channel attack surface: only zero
> >>>   pages are ever merged, so the sharing status of data-bearing pages is
> >>>   no longer observable through KSM timing side channels.
> >>
> >> Lol. Did you come up with that or an LLM :)
> > 
> > Ha, fair question :) This came from our own investigation. We were looking
> > into whether KSM can actually provide benefits on Android phones, and this
> > observation came from real-world application workloads. To be fully honest:
> > I did use an LLM to help polish the English wording of the commit description,
> > but I carefully rechecked and verified every sentence myself..
> 
> The reason why I ask is that this effectively disables most deduplication where
> KSM was originally invented for: VMs running the same kernels, libaries,
> executables etc.

Yes, it closes the original scenarios like KVM, so I wrote a Note to say that in
commit description and Documentations. But it opens up some new application scenarios
 — scenarios with high security and low cpu-consuming requirements, where merging
zero pages alone can already bring benefits.

> 
> So yeah, disabling most deduplication shrinks side-channels ... by disabling the
> core functionality of KSM, to dedupicate pages with the same content :)
> 
> > 
> >>
> >>>
> >>> Note
> >>> =====
> >>> - Suitable for Android, embedded and low-memory devices, where zero-page
> >>>   deduplication is wanted but full KSM scanning is too costly, and reduced
> >>>   KSM side-channel exposure is desired. Many handset vendors may prefer
> >>>   this knob, which can be used as a default fallback policy.
> >>>
> >>> - Not suitable for server and virtualization workloads containing many
> >>>   non-zero duplicate pages, where vanilla KSM provides better memory
> >>>   savings.
> >>
> >> I proposed something similar when I was still at RH. My concern back then was
> >> that we don't want/need all of the stable/unstable trees.
> >>
> >> IIUC that's all still in place in your implementation, right?
> > 
> > We still keep the stable/unstable tree data structures, but zero-page merging
> > does not participate in the stable/unstable tree search path. One more reason
> > for keeping them is that merge_only_zero_page is designed as a dynamic knob
> > that can be toggled at runtime, so when it is disabled KSM can fall back to
> > the traditional full KSM behavior.
> 
> 
> What's the memory overhead from keeping these datastructures in the
> merge_only_zero_page-only path?

In the merge_only_zero_page-only path of current implementation, the main memory
overhead comes from the ksm_rmap_items for non-zero pages, RB trees of stable and
unstable, and mm_slots.

If the allocation of rmap_item can be avoided (following Tu Jinjiang’s idea), then
only the stable_tree and unstable_tree remain, which are basically empty, and these
overheads become so low that they are negligible. The mm_slots are essential so can't
be avoid, but won't take up much memory.

