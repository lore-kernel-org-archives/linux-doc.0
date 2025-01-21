Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66DF8F58
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 00:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737420096; cv=none; b=AxFZur0v6Bep55dtdepYxk0dbrqH5XP1wz3yS4PigmB/rud4wIrXz/RtN1ULEaG7plcLg2FqByX4RKLubS6h2lMc2OvKIcz+sIp+KldxcFijjxMs/Htp7TSq4hHJchZD+M7w/1CjS5MPh1lze3RgPDNHA6NSOJMxhUwJlY3a2oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737420096; c=relaxed/simple;
	bh=qXxw60W58BrhmDjheFYIewBNylawUhpJWIjERyZdT+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=pJXGazTkzMvUQK/sNqIfCJDYgU51amI8tHiDmDF3FJh3RqpfDnEhnJHckSmBM0DlWmW68DMbL7DgXHkRQ4Oe20+RnyCK2j40VxemL17l1P92HxAhkr5d9fsmfz/fC0EJ2MzQ24ATBE3s087iyiJwnHGPB8xTilFJPHL20tPfr9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ELe7t98r; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ELe7t98r"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250121004125epoutp01ebd78c1862038c3631aa52c086db8c38~cjlzeqCFJ0586205862epoutp015
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 00:41:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250121004125epoutp01ebd78c1862038c3631aa52c086db8c38~cjlzeqCFJ0586205862epoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1737420085;
	bh=ojgrCIvPlnH6cQZFmu5OkS4ec6+B9yTPFsedmSyR5PY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ELe7t98rwsIkJrVttgXDmgM5EfshyfHZy1gPIpXyO3tqCz0C6DfiCcEQnD+FsAueT
	 v3ve8ZX2n5xlBQxoOpDWoOdOU6NdrsilV87j4+CmnTEq4OSiA52KgFuX8mOF7NkQa/
	 vIufV7hskU6NA58jbAdnbccB4c45Qsm+us/Y0e8A=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20250121004125epcas2p4210f0428bb1136f050f81da62ebb5e0c~cjly_a4kl0985409854epcas2p4J;
	Tue, 21 Jan 2025 00:41:25 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.99]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YcT0h4z4rz4x9Q8; Tue, 21 Jan
	2025 00:41:24 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F0.B7.22938.43DEE876; Tue, 21 Jan 2025 09:41:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250121004123epcas2p1419337826780ed4bfcfee1da6d8007dd~cjlxrc0PI2190521905epcas2p18;
	Tue, 21 Jan 2025 00:41:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250121004123epsmtrp1c31c8f0ea96abff0d4e5c8246700cb09~cjlxoITR70414304143epsmtrp1z;
	Tue, 21 Jan 2025 00:41:23 +0000 (GMT)
X-AuditID: b6c32a43-0d1e67000000599a-cc-678eed3456f0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7F.57.18729.33DEE876; Tue, 21 Jan 2025 09:41:23 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250121004123epsmtip10aee1fe8fda0eca6cff48461a16eb27c~cjlxV1moN2753927539epsmtip1X;
	Tue, 21 Jan 2025 00:41:23 +0000 (GMT)
Date: Tue, 21 Jan 2025 09:40:01 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: janghyuck.kim@samsung.com, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Christoph Lameter <cl@linux.com>, Pekka
	Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo
	Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>, Roman
	Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
Message-ID: <20250121003959.GA610565@tiffany>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z45taJAEqdcyIXX-@casper.infradead.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xbVRzHd/q4veCKd6VlhxoIu/gChbWMx2UZaMZCLmoiUfePj9Ta3lwa
	Stv1ttOqWahsLfIarJubpVa61Qm1iLt0s3TqGI8Ai1viRHFPFoZTBCIpC3ObY7ZcZvbPyed8
	z+97fr/feaB8yVlEjuoMFspsUOtxJFFwYjCLyMmfb6EV4alMoq1JQXh6gggxsTQHiOl+JyC6
	GusQotfDED6HX0D8HPEgxNXgfSHhWFyODf5jPKItKCPa7S2AuPuPB3k+iexzXxGRHayV7O3M
	JtnAxwjJRveJyIb5cR45euiugJweP8gjfbUH+OSRFpeQbAkFAPljx5CIXGTTK8WvV2+potRa
	ypxBGTRGrc5Al+AvvqoqUxUUKpQ5ymKiCM8wqGuoEnzbS5U55Tp9rBk8Y6dab41JlWqGwTeW
	bjEbrRYqo8rIWEpwyqTVm4pMuYy6hrEa6FwDZdmsVCjyCmKBb1dXXVtwiExfP/reyUOyWjCy
	tgEkoBDLhz80e0ADSEQlWBjAr7ynefEFCRYFkJ2WcbwEYHQ47YFh0l4r4gzfA+i0O/jc5HcA
	G3Z3r7gF2BPQ/VNAEGcEewqOho7GUqCoFHsazoXy4jIfG+LDfp8lzslYBQz83SmMh4ixHMj6
	NsRlMbYOjn06vbJLQizvIntaxNXwGwrrz9Acb4PhQCuf42T410hoNUYOZ/Y6VpmBJ44M8uJl
	QqwWwN76yVXDJui+4QRcPTro/czFi9cAsUw4dFHAyUmwfvCeiJPFsN4h4ZyZ8NRRr4DjVDjV
	7RRyTMJZ900BdyIRAIODB5BWkO5+qB33Q9k4fhZ2nIwi7lgKPvYY/HIZ5TAL9kQ2dgBhAKRQ
	JqaGpjR5JuX/l6sx1rBg5V1nl4XB+OfLuQOAh4IBAFE+LhXLFppoiVirtr1PmY0qs1VPMQOg
	IHYzbXy5TGOMfQyDRaXML1bkFxYqi/IKFEX4evEH4d20BKPVFqqaokyU+YGPhybIa3mN+Ozl
	Ual2tAsnKqbMj3/4yprN5w5mILIJw1LP2gqVp39ZHCwavu7Pfc1dpVCUBJjU2cul3eesjXb/
	H48MnJpPGflu+73OHNmuqPPCmU8uXZDCvOupHyU+FxSW70/wP6OraHYl7bg2Qr7x1rve+ayp
	LxYcCYlsn3MslP6kl0jvu72p/JeKw+nFproXmqH//NbKq7eib758Q9uYe3Gdh0T621Kkt7Nu
	Fk9sbT/cvSfE2N7p+vf48VuRs8zkn3NeG6bbafr1vDTZxu5N/ca5ZsdQU/u3ml1XmjbYLkXs
	rtL7Xnlq2UjdHXr96MyxNNe+1pDrTtL2hmRayYwN+7L2zKQhKbiAqVIrs/lmRv0fqTdL1GAE
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWy7bCSnK7x2750gwd/1Cwm9hhYzFm/hs3i
	+rc3jBZPDrQzWqzsbmaz2Dyn2GJh2xIWi8u75rBZ3Fvzn9Wi7fM/ILFkI5PFxDWiFrMb+xgt
	fv+Yw+bA57Fz1l12jwWbSj02r9Dy2LSqk81j06dJ7B5db68weZyY8ZvF48mV6UweCxumMnss
	7pvM6tG3ZRWjx5kFR9g9Pm+SC+CN4rJJSc3JLEst0rdL4Mq40ZRe8JqnYuWDxewNjHO5uhg5
	OSQETCTuNzawdzFycQgJ7GaUOLDyHxNEQlJi1ueTULawxP2WI6wQRY8ZJa5N28QIkmARUJWY
	dXEVC4jNJqAucWLLMqA4B4eIgIbEmy1GIPXMAqeYJT79bQarERbwlFj1fgUrSA2vgK7EpoWK
	EDN3MUp0vHnNClLDKyAocXLmE7B6ZgEtiRv/XjKB1DMLSEss/8cBEuYEOvrzpoPsExgFZiHp
	mIWkYxZCxwJG5lWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMFRp6W5g3H7qg96hxiZ
	OBgPMUpwMCuJ8Ip+6EkX4k1JrKxKLcqPLyrNSS0+xCjNwaIkziv+ojdFSCA9sSQ1OzW1ILUI
	JsvEwSnVwGR2TWnTwtuhlZr5ifP27P1xeO9ek+APAnduP2QPvLQu/t82SYHp2b4nj88rqku+
	0FOjsVnNSFnBYvrzPO+0pxO53xhNuDqHabvVd64w1wsBd4SUZh6+6lq4Pe3K600nlkVvS5wj
	/u1ilfHGn12PrHrWrehI1FzCvOrJFUZmPv7/V641hXsrppRVaGbkJtee2VMhl9czNXr/bLXZ
	eS9zVk618/7J2PKvRGsHs131RMubPuuVBU0NP290+yzGe1vzh+WWyaeZXHMc3dh1v/w8JNdV
	bC0/15z90fpH9X7LvNjXsV/JkFe6v7Fnr1rs7ctV/6+45pw7I8xv/eKYwiv+eac1F4naSFs/
	eznhtfXWZ7+UWIozEg21mIuKEwHkaXtGKQMAAA==
X-CMS-MailID: 20250121004123epcas2p1419337826780ed4bfcfee1da6d8007dd
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----E.S4k9jnDbDNDtdsn6uvGjyrm0uEuz07ASbU.whEIUpklEOI=_2a5f81_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>
	<20250120082908.4162780-1-hyesoo.yu@samsung.com>
	<Z45taJAEqdcyIXX-@casper.infradead.org>

------E.S4k9jnDbDNDtdsn6uvGjyrm0uEuz07ASbU.whEIUpklEOI=_2a5f81_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 20, 2025 at 03:36:08PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 20, 2025 at 05:28:21PM +0900, Hyesoo Yu wrote:
> > If a slab object is corrupted or an error occurs in its internal
> > value, continuing after restoration may cause other side effects.
> > At this point, it is difficult to debug because the problem occurred
> > in the past. A flag has been added that can cause a panic when there
> > is a problem with the object.
> > 
> > Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> > Change-Id: I4e7e5e0ec3421a7f6c84d591db052f79d3775493
> 
> Linux does not use Change IDs.  Please omit these from future patches.
> 
> Panicing is a very unfriendly approach.  I think a better approach would
> be to freeze the slab where corruption is detected.  That is, no future
> objects are allocated from that slab, and attempts to free objects from
> that slab become no-ops.  I don't think that should be hard to implement.
>

Thanks you for your responce. That is my mistake. I will remove the change ID.

I agree that freezing is better than recovery or panic for the system's stability.
However what I want from the patch is not just to make the system run stably.
I need to immediately trigger a panic to investigate the slub.

I would like to analyze the corrupted data at that moment to check issues
like cache problem, user errors, system clock frequency and similar problems,
not just passing by without any issues.

However I agree that panic is not a friendly approach.
I will modify it to notify the problem using warn() and then use
panic_on_warn to trigger panic.

Thanks,
Regards.

------E.S4k9jnDbDNDtdsn6uvGjyrm0uEuz07ASbU.whEIUpklEOI=_2a5f81_
Content-Type: text/plain; charset="utf-8"


------E.S4k9jnDbDNDtdsn6uvGjyrm0uEuz07ASbU.whEIUpklEOI=_2a5f81_--
