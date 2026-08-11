Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C6F2BD11
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 05:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786427263; cv=none; b=uYnBKPKGav+RmPDRODd1t3Ecy/2mISJMtO4S6NPHif8hUyfwbWJo4S4jRX+pjjt/m+mmzAehosItdUd7EoVLHMjhn1gt5XqqEO2U3ccY0TpwuAq5ClPHgwmrVkEqHgKu4vF+un9Y3no1O1zRhnThMMRsUbq9irNKsJjYS5BBhrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786427263; c=relaxed/simple;
	bh=dihANXH9jq5skEL+GRUW9VWxsk+/ZjCNyGzEtRSQTSE=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=NF4opH9wiwE6ZY+nBJDT2Eukdd1m4Q5FIHIlFnqKDdIr4M0Q/sOtfGtELmN1sz6HzZTbZf4BYjJy5ZOsPvhdG+HUrp4slMO9RJWKl4uToM3HKff774G9FWGeshp+k5f2SWU9NEpuLiht22Ww19SHt9QZ9TkxqPOhPSgWFEAinCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qjLN3bRT; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qjLN3bRT"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260811054737epoutp03b275915b649ccefdcd97c0253db01ad3~KqiA2TuIc2227522275epoutp03m
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 05:47:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260811054737epoutp03b275915b649ccefdcd97c0253db01ad3~KqiA2TuIc2227522275epoutp03m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786427257;
	bh=w378j2B9OmVdyWX4AEyCdiC5mUThjGg9iAQH1q9CdYc=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=qjLN3bRTsMHMEB0k/RaeWOMbGqwST3apzGNSYv5ICzVsTagf83suKAa15daurOPfE
	 39eeVPdhpME7NWlmbvZIuJFK4P1hNQ7lArf5E7SrJh15okVjLmU5s28i1KE/svDtU+
	 fMJ5gbnBUP/eG7Yf7TO56hGs98mOwytcbBhr58rc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20260811054737epcas2p1eb23d79a6927453dc08b458b976acfd0~KqiAg9ZYC3189831898epcas2p1-;
	Tue, 11 Aug 2026 05:47:37 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.201]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4hK0yJ5wQMz6B9m4; Tue, 11 Aug
	2026 05:47:36 +0000 (GMT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: RE:(2) [PATCH v2 2/2] f2fs: introduce gcless mount option to avoid
 foreground GC
Reply-To: yonggil.song@samsung.com
Sender: Yonggil Song <yonggil.song@samsung.com>
From: Yonggil Song <yonggil.song@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>, Seokhwan Kim
	<sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>, Yonggil
	Song <yonggil.song@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <f7dabaa3-6d3c-4c70-b953-08dd52c35f49@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260811054736epcms2p2f8831acf8c6072e0c0104ebf554d0450@epcms2p2>
Date: Tue, 11 Aug 2026 14:47:36 +0900
X-CMS-MailID: 20260811054736epcms2p2f8831acf8c6072e0c0104ebf554d0450
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87
References: <f7dabaa3-6d3c-4c70-b953-08dd52c35f49@kernel.org>
	<20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p8>
	<20260707225453epcms2p4f8323f4f8b88f3ee892cddc126da51a6@epcms2p4>
	<CGME20260707225035epcms2p812b92e6001afb57eb06d98225f1acd87@epcms2p2>

To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org,
    corbet@lwn.net,
    linux-f2fs-devel@lists.sourceforge.net,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Dongjin Kim <dongjin_.kim@samsung.com>,
    Daejun Park <daejun7.park@samsung.com>
Subject: Re: [PATCH v2 2/2] f2fs: introduce gcless mount option to avoid foreground GC
In-Reply-To: <f7dabaa3-6d3c-4c70-b953-08dd52c35f49@kernel.org>
References: <20260707225453epcms2p4f8323f4f8b88f3ee892cddc126da51a6@epcms2p4>
 <f7dabaa3-6d3c-4c70-b953-08dd52c35f49@kernel.org>

Hi Chao,

No problem at all, and thanks a lot for the careful review.

Let me answer the four points in order.  Two of them (the update timing
and the node/data typing) are real defects in v2; for the other two I
think the current code is already correct, and I explain why below so you
can tell me if I am missing something.

On 8/10/26 02:10, Chao Yu wrote:
>> 8 GiB UFS, 2 GiB random overwrite at 99% utilization:
>>    baseline: WAF 76.7, foreground GC calls 578k
>>    gcless:   WAF  1.2, foreground GC calls 504
>
> Can we mitigate this by increasing min_ssr_sections?

I tried it, and it has no effect.  Near-full random overwrite at 99%
utilization, everything fixed except min_ssr_sections: raising it from
the default 66 to 2000 left every counter identical (94 foreground GC
calls, 602823 SSR blocks, FS-WAF 1.53), while lowering it to 0 did
change things (476 GC calls, WAF 1.67) -- so the knob is live, it is
just already saturated at the default.

>> +	if (test_bit(seg, free_i->free_segmap))
>> +		return 0;
>> +	if (test_bit(seg, dirty_i->dirty_segmap[PRE]))
>> +		return 0;
>> +	if (is_curseg(sbi, seg))
>> +		return 0;
>> +	if (ckpt_v >= usable)
>> +		return 0;
>> +
>> +	return usable - ckpt_v;
>
> If SSR is enabled, there may be valid but not checkpointed blocks in section?
> such space can not be treated as free?

Such blocks exist, but they are already excluded, because
ckpt_valid_blocks is not a pure "as of the last checkpoint" counter --
allocation bumps it immediately.  In update_sit_entry_for_alloc():

	/*
	 * SSR should never reuse block which is checkpointed
	 * or newly invalidated.
	 */
	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
			se->ckpt_valid_blocks++;
			...
	}

	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
		se->ckpt_valid_blocks += del;
		...

So every block written after the last checkpoint (LFS or SSR, and with
checkpointing disabled too, via the second hunk) is counted in
ckpt_valid_blocks right away, and update_sit_entry_for_del() only
decrements it for blocks that are *not* set in ckpt_valid_map.  As a
result ckpt_valid_blocks is exactly the population count of
ckpt_valid_map | cur_valid_map, which is precisely the target_map that
__next_free_blkoff() refuses to allocate from:

	for (i = 0; i < entries; i++)
		target_map[i] = ckpt_map[i] | cur_map[i];

	return __find_rev_next_zero_bit(target_map, BLKS_PER_SEG(sbi), start);

So "usable - ckpt_valid_blocks" is the number of blocks SSR can actually
hand out in that segment, not an upper bound that includes freshly
written blocks.  If you still see a case where the two diverge I would
very much like to know -- that would be a bug in the counter itself.

> And, only updating sbi->cib_total_blocks w/ f2fs_update_cib() in checkpoint()
> is not enough? since free space in section may change due to SSR allocation
> and deletion. right?

You are right, and this is the weaker half of the same argument.  The
per-segment counter is accurate at all times as described above, but
sbi->cib_total_blocks is only a snapshot of it taken at checkpoint time,
so between two checkpoints the aggregate goes stale: SSR allocation
consumes slack that the watermark still credits, and truncation creates
slack that it does not yet see.  The stale direction that matters is the
first one -- it can keep foreground GC skipped after the budget is
already spent.  My reasoning in v2 was that gcless checkpoints often
enough to bound the drift, but "often enough" is not a correctness
argument, and I should not have relied on it.

>> +	if (test_opt(sbi, GCLESS)) {
>> +		unsigned int sec_blks = CAP_BLKS_PER_SEC(sbi);
>> +		unsigned int add_secs = READ_ONCE(sbi->cib_total_blocks) / sec_blks;
>> +		unsigned int room = free_secs < MAIN_SECS(sbi) ?
>> +					MAIN_SECS(sbi) - free_secs : 0;
>> +
>> +		free_secs += min(add_secs, room);
>
> A free section can be reused by any DATA or NODE type write, but above GCLESS
> "free_secs" may not, e.g. all free_secs are from DATA type, then latter checkpoint
> won't write any node into DATA type section w/ SSR.

Agreed, this is a real defect.  SSR never crosses the node/data boundary:
select_policy() restricts the victim search to dirty_segmap[type], and
get_ssr_segment() only falls back among the three node types or among the
three data types, never between them.  So crediting one pooled block count
to free_secs is wrong exactly as you describe -- a budget made entirely of
data-type slack would still let has_not_enough_free_secs() claim there is
room for node writes, and the node allocation would then have to fall back
to a real free section that the watermark just pretended existed.

I will take both points into account and validate the result carefully
before sending the next version.

Thanks a lot for taking the time to review this.

Thanks,
Yonggil
