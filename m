Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4E37BE7D
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489870; cv=none; b=scmlZEYcOuT6Sl65fnoEsR1kmascMce6TajlKhfEI3i5gM3RjhlAndtk7g733/Nyz1iCIyyP+5OySsNrLxjJHhIrf13H8e4VoFFNIWGDzlWDtSRDxRlmuIVEl+7vjbLJnqKOm7Twz4qCvHCVg9/keffm5DiuHI9zw6S2VBeHKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489870; c=relaxed/simple;
	bh=fFn36/p3duEbAQ9DYPKkmS47iFc0AXRNz03ZwMeVLws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPZeapBSNP1huilvjFRr9tiowiJpjppVuObomT4x0saV3sji+G51v7RTPgmkEpZDhdiMUNEw0qQSR62j8Yf7HtI2v6Aa+EX5WhD9cTd5nkYxw8Bni7tPc7OZdyX9MS6TBuCUAXwDXVIUQH4vfWmIjJgh0ukMKv2WJ2qgZdF4kQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XbkSfxlg; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XbkSfxlg"
Message-ID: <cf3abe7b-686a-462c-9203-02187ced058b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782489856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64G3Xshtq4ElK9GIOS9bT9tey898+7R6heARU/+ATwI=;
	b=XbkSfxlg5ZCVqWCy26EzEW1bn/QwhxYqdhK/mTeyKANKVhoYUhzWoQvgP9pjOE+eAADvda
	Kbzp0N96xllhqThbZM/d5BGzthHxQAM9VqbeJOG9/FNFybOGCnbE3XRjdZ1cQq2giHWasA
	5s5fc4Q3GSJ9MnbvGEMoaJ/VXu4Cjxg=
Date: Sat, 27 Jun 2026 00:03:58 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs: pagemap: fix flags location, member name and sample
 code
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org
References: <20260625174447.24292-1-zenghui.yu@linux.dev>
 <511c2e7c-0305-4917-a639-e8e9e8710903@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <511c2e7c-0305-4917-a639-e8e9e8710903@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/26/26 10:47 PM, David Hildenbrand (Arm) wrote:
> On 6/25/26 19:44, Zenghui Yu wrote:
> > The userland visible page flags (KPF_*) were initially moved to
> > include/linux/kernel-page-flags.h in commit 1a9b5b7fe0c5 ("mm: export
> > stable page flags"), and later moved to
> > include/uapi/linux/kernel-page-flags.h in commit 607ca46e97a1 ("UAPI:
> > (Scripted) Disintegrate include/linux"). Upadte the doc to reflect the
> 
> s/Upadte/Update/
> 
> > current location of these flags.
> 
> Ack
> 
> >
> > The member @walk_end of struct pm_scan_arg {} was wrongly written as
> > "end_walk".
> 
> Ack
> 
> >
> > The first sample code of the PAGEMAP_SCAN ioctl wrongly used the
> > PM_SCAN_CHECK_WPASYNC flag twice, instead of the PM_SCAN_WP_MATCHING flag.
> 
> That makes sense.
> 
> > The second one missed PAGE_IS_FILE in the required mask.
> 
> Hm. The description says: "Find pages which have been written, are file backed,
> not swapped and either present or huge".
> 
> But doesn't that mean that
> 
> it should actually be
> 
> 	.category_mask = PAGE_IS_WRITTEN | PAGE_IS_FILE,
> 
> Because
> 
> 	.category_inverted = PAGE_IS_SWAPPED,

Ah! Thanks for pointing it out. I'll fix it soon.

Thanks,
Zenghui
