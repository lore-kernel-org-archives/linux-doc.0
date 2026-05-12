Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD0947DFAA;
	Tue, 12 May 2026 08:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572941; cv=none; b=IYoktPcD9dMHw8TwU0pBLAjCKaEe2qzFO5xsqsrSKvLP93MTQXS3qCMkJBE6VeIMFgyRuOmHHMAf2tnlNyMTsPajYn9So3no5P2NNexauIBCvfbhrbJ7CLokRTT3Y/lvE6axcDbllMdKX+988BBannfM7YyrL1tHOKGb8wdpxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572941; c=relaxed/simple;
	bh=9f0RLzhaM7GiWaAa7mPBj5c0HU1iP/Y73Gpni4CsCd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dq0SV/7RoSXXvYhsjp9Gt7ajktXeJWZqQuixHFrQhn1T0zPcP2lWPjC+QfqGorMlj2WtR8z0STf3l6YqMSSDKsF6DOYvfLN+gD2NQ4hvbVov1JWSVQEqJM+qblkqvU4+ByhGN2zfeQL2OkVZl5A72Y+Q59pjKJogNQ818/8e6bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=txM1hkq3; arc=none smtp.client-ip=43.163.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="txM1hkq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778572935; bh=tI1r0mwk0o7G6xaiL3mOxJQ01p5jhRB3ZUeK6emnYJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=txM1hkq3iQo07sbYvSaTjXDac1LsMK2Is6/uSYCvEZGOHCQv3DTqLe38xCw4UqqLo
	 hIQFjT6tXRdfuaSF6UDQ+ioyxYrUf1qzPsSnEZgJzOTQtUhlTS0hMpPHVr1UaoVffl
	 JZ9ylPDm+dcNU5x56nGNOXzKV6S5gjbZ9KtIRQ3w=
Received: from [10.46.141.45] ([36.112.3.68])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8C17A06; Tue, 12 May 2026 16:02:12 +0800
X-QQ-mid: xmsmtpt1778572932t62l8p1ed
Message-ID: <tencent_97B6CE6F79248F14DD48584071DD3C97290A@qq.com>
X-QQ-XMAILINFO: No7DFzN00JnRebaFL0JIYufn4HBmABsd5tv0m3aN5HXehIHsfO4GJcODnhgaW8
	 A+K0fcrKpa5YOW5APgeyhgcGpTFq8Pr5E7uleKtdzBFR5RWV4ihV3Hv/Zj62QgWVdzdoJMM779Va
	 6rPGzAzUl87GFwx4OLBFp1q2IJUtwLyUBnMl9i7FgsEXxuNN6MfP4J6qy1pGzBSQ4RfbXJVr+tKe
	 7KCGwErybID/Nnjv8qMBCwSwAk4bYQsdwIz5kHo3R7uRA9oUpvIDayFONHyDlwYKtgyDjXRMedWl
	 Q6IKDVgGUSsoBzXCXD0WpuioqUhmvW+a7E/DAhG5jvunbPia8Mj2Dnh1nFjZjP7rTPVPZbBk8qe0
	 Ybz4RNOjTOjPTAA+LKoXBZ6vpv2yTcx0ZJtm5S1UG131ffUcL1B4xKL4vB07STSU5hz/OxdYgC4T
	 OovPjjICMsuqe/HP7J9W0iLqB/nBIDdHccrnUvqjIxQu+rVoIq47O+9JeQ8+4P7P1JRi/0jLRb7C
	 9PTggqiBXdFHXmEk/tkC+Qqq7NY74aj7oGtIO4xe77MHdkfrEBOqL1RG2bLcPf1PrFyR58wl3OyR
	 sLufsMUTrseuvbWBs2uM0yTYj7rQ7BYPQJQPkmTgw0OrkxHaEJWij3uAGfp8GAQPygXdCz+Nqvp5
	 MJL4jJ9zIwGLuqsnEsMCPmATA4QTr+7CIDAeqdyFLfluv88An2RzkXgglAYj6NubkVDM1qtH1t++
	 E4Uf/7QZQcaayltoJ3efpcE69sTuNbaLhrxLlRQPDIqsVVVJdXr3sFYsR9kFQ/30j5Q9IC273ySY
	 Gl/Wh7T8DL9/ujp99PXBLhm9se342WuDkIgyeiLnMHlcSNYndWAT+KxacqNaSk15kefwY0TZEFep
	 U+rgr8ASWTS5s3Cmc+XcvVCtDUGC/eDa334xzowl6FMPKCtQYY4NGvKDfb07PRzVfZu6zBVE5OuK
	 I8cfLVYtptNbyN66qzULdaKk0CNSMOByucQq9zaSPFyqSQgIsPhcGkR01lta/jY4EHcATFcdrTbl
	 DrkOSuE/KJEtwHLW7QSdjk4p34CzYZHyEabdj4PlSrRbvTCYCo4K3inG+F190=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-OQ-MSGID: <a7a05e33-d10e-4991-8991-04597de38b3b@qq.com>
Date: Tue, 12 May 2026 16:02:12 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] mm: support zswap-backed anonymous large folio
 swapin
To: Yosry Ahmed <yosry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <bhe@redhat.com>,
 Lorenzo Stoakes <ljs@kernel.org>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <agJT6D5zaUD6FpwQ@google.com>
From: Fujunjie <fujunjie1@qq.com>
In-Reply-To: <agJT6D5zaUD6FpwQ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/12/2026 6:13 AM, Yosry Ahmed wrote:
>> Feedback would be especially helpful on:
>>
>> 1. whether it makes sense to support all-zswap large folio swapin first,
>>    while keeping mixed zswap/disk ranges on the order-0 fallback path
> 
> I think so, yes, but based on my read of the code this RFC only affects
> synchornous swapin, which is more-or-less zram+zswap. This is an
> uncommon setup outside of testing.
> 
>> 2. whether a follow-up for mixed zswap/disk large folio swapin would be
>>    useful after this RFC
> 
> That's a heavier lift and I think we should consider this in the
> longer-term, once the virtual swap work settles down. This is
> conceptually not a zswap thing, you can have parts of a folio on disk,
> in zswap, in the zeromap, etc. So it needs to be handled at a higher
> layer (virtual swap for example).
>
Thanks Yosry.

That makes sense. I agree that the mixed zswap/disk/zeromap case is not
really zswap-specific and should be handled at a higher layer, likely
after the virtual swap work settles.

Given the feedback on the swapin path structure and Alexandre's ongoing
work in this area, I will pause this RFC in its current form and follow
those series first.

Thanks

