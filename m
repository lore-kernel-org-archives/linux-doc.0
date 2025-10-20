Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E4276046
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760978130; cv=none; b=qW8KRalOe8Yb4lLMueJNSh26DtH2Gw43pL130LujklZnG1BCjW3N5uxoHAw+aCO6JEULoHRF6jlfchaIqpQBzwsLccGinTfP9pp+kT2ktEx0a+cZUMlvzlvirt3rxQXrBernI3VK9aqzWL7fUm1eQdLE158mqKlmoM6+B995Rkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760978130; c=relaxed/simple;
	bh=Ggl4GURIKN0o4pra5emg8y/1hbzWm6LY8VHCYb4NIP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYKkTPgal9MXQBnd+XE9t1ZXiuYGv4RW+hIIWCdUahBKZ+Dxiy+AZMoGK0cUdR4hdOuMngd/SYeJeaTDtKQxQ0V6V/F5zGHQEk7tyAZDuapwdTVhirXS9lSxbT4sdjGGhpfv6xRtT9l5Lpdm/acved7Z1O/j235iwy7FJVGhHps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HVyW9qzN; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HVyW9qzN"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-87c217f4aaaso55503966d6.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1760978128; x=1761582928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m6jVHb7ezLC5hsANkudCILXiAJL70RDGwYPCifMHsG4=;
        b=HVyW9qzN3r7JyDdOhkzVNVMRjKfXShlEXghBy0iVYI+i4F1J/q3coVFXeXHhmeKCaW
         2F/c7WYqrCrGenP9z9zJVqW8AZG0PBZENZdyzckNaHxYqDbGULE4tImwssTJ1IEDLc5P
         d+HA0vbUtS2cNsA9DXx439ztAPdZjeOxBgFjJ6J8aftkNE+xHpjtrM83mQiOczTeZosM
         74rl5tWn+bQd0Jh2+3zOuoYEoM+4U/sHGS71auVtUhTQl7YH5ltAurDzE5OW76oNJbtU
         ZWLtscjfCarnmuSJUMcXhD80xl5QNOzqhf3se66BQ9ucmPzDDC6MVXI29fiqHPjODSZN
         lGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760978128; x=1761582928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6jVHb7ezLC5hsANkudCILXiAJL70RDGwYPCifMHsG4=;
        b=dy2u78ZLbIdNiRC42nSh8Bq63gpc8LJM/bq8SGJfe2z259H82i1sacd3D15U4+l81A
         9NEsMAKsjCGWEMEjhbVYUR5pUvO0/pWH1s3+6gezTtupQkaETZSd9PNRm5A/lTwpc/8t
         TWCZ68UJFVsaC6NC2SBJ20xvFPn1wOZu+Rc6OkErKBXs8oC+Kn18djWR9tBQkTcUpiRS
         7Lcmz0lOdahXxx2wnoy7QQiwDN08ji08BgLaGUtgNd/UBCmfRMk3wNTCtsGrn3m/ZwPT
         rEQw0JM0g7rzVr+Dc3+RBZCYTKwyfHmoRjXRgCtg7RxxztF76m83QeJg0+oG6XmA97DH
         i98Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvktNBpKU7JncudER3ecNDKpEx7fqpP4U3Tw1czxS/3WA+OthMbZPr3BRiBZyAVpQQuP5q/VdWcrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/UYIyCAJ5PVnUfw/FeU1gKJPf4MqgQ0alZ7rV1Teus2UhO0V
	5YDtfzMLtUzkjDy2QRJn6quA+mi4s3F3NW06eTOCIAbB650O+iZHcp7IsS1sdOzTrHM=
X-Gm-Gg: ASbGncuIG5HvNOuff8t8MLawnmOBF3/eguofIEA70+R6hllAXy7sm/XWFUg1wETHDuH
	fAhkMrOngDohTT7zv2663VZckHexTCauxHZ4VrCUpikriydLYREA4d4NPgCAKru3Fxn4gf1oLML
	rER2zr2sLggQ2R6H9oXMr+CGRqI1wQF6GMegFari/x1BwrTr1KV7JFV+F2elBw6AY+aOYsk6Ryt
	fR3AmhEDwFbkDKfGwaBoy4YSrvzbm2VWH+hk2lKPO5uYE/B/uwt+erJnsvp4M/fynSlT64BnHrk
	cYQqaJjwJe2PKljMwDaLm9UTWAlXi3DetNAVb+TcAfEo3vYv7dTM14zEJ7wnsM+WFKxpIk087Rz
	kngZlj5Z9oxj2q5OqO0dgvl3ikzb0CIPcH7wlVNk6bdY2YrjH4cQcw4wH9YnNJsKVzUN1XKHLbC
	Vahlfjq29UZnKp44T2F+kQ1CfGYrzz7xLFthwKV8Hc8dFjVOV5T57SDJ9nuLY=
X-Google-Smtp-Source: AGHT+IGyom00LhOrlga+gwQAQ7ZtNc5cObbKCtXH8k1bXmEvQN3xISJWYitE42OrQ56dVinEXqIIkA==
X-Received: by 2002:a05:6214:4e83:b0:87c:2213:ee81 with SMTP id 6a1803df08f44-87c2213f473mr139696046d6.33.1760978127833;
        Mon, 20 Oct 2025 09:35:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028b4316sm53736976d6.53.2025.10.20.09.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:35:27 -0700 (PDT)
Date: Mon, 20 Oct 2025 12:35:25 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, osalvador@suse.de, corbet@lwn.net,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	hannes@cmpxchg.org, laoar.shao@gmail.com, mclapinski@google.com,
	joel.granados@kernel.org, jack@suse.cz, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [RFC PATCH] mm, hugetlb: implement movable_gigantic_pages sysctl
Message-ID: <aPZkzY6cGfdKo8K8@gourry-fedora-PF4VCD3F>
References: <20251009161515.422292-1-gourry@gourry.net>
 <6fe3562d-49b2-4975-aa86-e139c535ad00@redhat.com>
 <aPZd1dAIzAw7Ii8E@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPZd1dAIzAw7Ii8E@gourry-fedora-PF4VCD3F>

On Mon, Oct 20, 2025 at 12:05:41PM -0400, Gregory Price wrote:
> On Mon, Oct 20, 2025 at 04:17:06PM +0200, David Hildenbrand wrote:
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 5549b32cdd31..5def2c53092e 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6922,8 +6922,12 @@ static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
>                 if (PageReserved(page))
>                         return false;
> 
> -               if (PageHuge(page))
> -                       return false;
> +               if (PageHuge(page)) {
> +                       /* Don't consider moving same size/larger pages */
> +                       if (!CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION ||
> +                           ((1 << compound_order(page)) >= nr_pages))
> +                               return false;
> +               }
>         }
>         return true;
>  }

Quick spot-check of the compaction code suggests this is handled
essentially the same way - and in fact compaction expects
alloc_contig to be sending compaction requests w/ hugepages.

So I'll go ahead and submit this separately for discussion.

~Gregory

---

->isolate_migratepages_range()
->isolate_migratepages_block()
{
...
	if (PageHuge(page)) {
		const unsigned int order = compound_order(page);
		/*
		 * skip hugetlbfs if we are not compacting for pages
		 * bigger than its order. THPs and other compound pages
		 * are handled below.
		 */
		 ...
		/* for alloc_contig case */
		if (locked) {
			unlock_page_lruvec_irqrestore(locked, flags);
			locked = NULL;
		}

	 }
...
	/*
	 * Regardless of being on LRU, compound pages such as THP
	 * (hugetlbfs is handled above) are not to be compacted unless
	 * we are attempting an allocation larger than the compound
	 * page size. We can potentially save a lot of iterations if we
	 * skip them at once. The check is racy, but we can consider
	 * only valid values and the only danger is skipping too much.
	 */
	if (PageCompound(page) && !cc->alloc_contig) {
		const unsigned int order = compound_order(page);

		/* Skip based on page order and compaction target order. */
		if (skip_isolation_on_order(order, cc->order)) {
			if (order <= MAX_PAGE_ORDER) {
				low_pfn += (1UL << order) - 1;
				nr_scanned += (1UL << order) - 1;
			}
			goto isolate_fail;
		}
	}
}
