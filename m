Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6BF3E51D2
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419948; cv=none; b=Eu36+EfLhhHDxX8Lr4jSydIuUYRPLd5FnWTydGqnQHGUbRSseQNaem2fO8AqmL3ht0cJqeNSNPxgnEJCxH9If1qrSESfgznS8bmNWQBPldj9Ur7XlLZgIUyBgvCl3SSGTulu6wQvUx36hYvyeIdvyG4YD+4o8u7QFOfkKhRoQAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419948; c=relaxed/simple;
	bh=gqOFLV/X0owYRcnHzvrsp/DH0uPVs/VkzGR4wK4JoEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbqOWnUCIvFVLnCC9tYLMP4K18ORUE0LBxEPT8cudfuheg74D+SWpt/QlHQ/19+8JRw/4/AYStYDcmN5HmHuafOI6Wjri4t7k0FSwnRJRJ2iBZmPlYlj0j+g8aIFg57KNCCaj0UFppbUpJm5OoaOiO9v+nADjZYdkegfY+AQ8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UMqazu3Q; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OZdLAA90; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UMqazu3Q";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OZdLAA90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783419943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VR1L8Tfvs37DPjneOYKS8+jqtMz73BhJHMeN7x0oADU=;
	b=UMqazu3QrR8Yyd6QZ8fXhCk9DN/PZD6NYTTXO1EoLHWHBk5klGHolsl8okD4q9M7aVah7y
	fE/x7LoIvAhyVKL76md/6s3iUgJCrCgs1sLQc/U9nKFH/6PRC8ykihVtDNRzzgdRPi95p8
	YxFGMQx7KwANzmSkwko9cZC6OTiC7mI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-pTQLfgkvPDmi5opsAPnUgg-1; Tue, 07 Jul 2026 06:25:42 -0400
X-MC-Unique: pTQLfgkvPDmi5opsAPnUgg-1
X-Mimecast-MFC-AGG-ID: pTQLfgkvPDmi5opsAPnUgg_1783419941
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493c20d0468so54496175e9.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783419941; x=1784024741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VR1L8Tfvs37DPjneOYKS8+jqtMz73BhJHMeN7x0oADU=;
        b=OZdLAA90hZClBd9ZaS4A7GjeCRQeL+VBh5NO0bYmK/mSaXddnnOcNQgZOZnyhN5hgt
         6hUk1EniddSpJeDE9mN2CoPlOQGFwYyf8tWKHPLV5W7WghRV4qfqwPAc+jOgKSxSWLc8
         kebgulCLg1ZrAgu4Q/MQJEVK7JEJsyFfOkCfu40zHfz2hrZ2vZO7pRydmuyy5E8OuIS5
         kOyCRtCp2XpsD93hM6dwiMMZar0eXrX4ykHFhPryvH/CTLlyiDUnzjk7kv7JWEXOm63n
         DMjTu1gPno/GnO6PpZcdk5RhvM6w78LZUGvPFRmicJ+aQd5G5JHJLvBiXXFdaZduUJWD
         Z5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419941; x=1784024741;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VR1L8Tfvs37DPjneOYKS8+jqtMz73BhJHMeN7x0oADU=;
        b=DS3di8bEqTF9ylg5/BwT2a0XqKulpx0laRypIaKAcRc0HPTvcP5t+zHmMI7WXNTKD7
         OT/QG4y96q2lMEyvIC0tVfKniggvUDKDSO2XzL9oTzQjASkKggXk7DvGTNHP5jBiwDln
         9U4alxbZSicw2TCj3ZiGshkxU5QZFFzFesmCe006+BTM8rYeC8Q9Pkn/3ac36DCIK77F
         kcvhIr1ftSi0kl5J77XiB7Sd665lC+v/9EjGQrADwFOIuVa0HpeangDW+N+5M0U6FYPR
         WJqV6ft/IYFpSRRYI5LHY3ofY1z2uUdk9vgSmcaAnsctcwb3M2oxva5lRFHzLnoTAHMl
         A+bA==
X-Forwarded-Encrypted: i=1; AHgh+RoIKWRf4dBoQrtmYvkEIp/yh5Tr64KNjzpOQOSmdGC8O3rsL0CrOqWAwV3rRkArGlkloKW4o7lyIAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwREkqnbqOuVzEJwSHRXpzjNT0o2xBYS1emkxscpmzrVwjrK1nV
	+d0JzBH9wH/lbvT/KNwHlEbWfO5O4C3RsZcPZxaIsBPFpCbRQ5nnP84egt9OY19E5K8ECja7wTo
	kl6ficeB9CLnlYSbRgidlCmrroIMHkEO+32GjlYFC8Ui+orGB8QshMQn8yRRDVg==
X-Gm-Gg: AfdE7cnFUXuHi3IWiNnB7cz6eEac5klvQHbW+5gzt/ippNY5tkbai/MXAYCZVbhvQlH
	fzosuf1DyvVZaIEtAoUGZOyhx17fVtwgyv33tOKpSb4E6Vkgjk72aaYBJHIOSNDEeDGfxQAAXN+
	mTZeLikqIrNT48lu0tsyF2fF6oyNhlFHJU4nWY11VewieXIWOuOzbj11pHalyH7AH8CS4sTmnHs
	9vXmyCV/atqHxiI3kmzpnWUg3pJAFZGvRM3aJaugY6P7myjIalCvbKw/Dxwcm2Fl69UDUaGjl6z
	cddiNYM5eN2JidmyR/Qlglgi1HnTj/tyMedqMocmqDry4Gka8+SFN5Bk1/s8AkpRVH6J+/pidpe
	n35kWObIzjh60UtWzE94sq8lZffpjHIsW
X-Received: by 2002:a05:600c:1383:b0:493:b647:1acd with SMTP id 5b1f17b1804b1-493df090a95mr49448565e9.36.1783419941244;
        Tue, 07 Jul 2026 03:25:41 -0700 (PDT)
X-Received: by 2002:a05:600c:1383:b0:493:b647:1acd with SMTP id 5b1f17b1804b1-493df090a95mr49448105e9.36.1783419940603;
        Tue, 07 Jul 2026 03:25:40 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm32286020f8f.24.2026.07.07.03.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 03:25:40 -0700 (PDT)
Date: Tue, 7 Jul 2026 06:25:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Sourav Panda <souravpanda@google.com>, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, mhklinux@outlook.com,
	fvdl@google.com, gthelen@google.com, mike.kravetz@oracle.com,
	pasha.tatashin@soleen.com, rientjes@google.com, riel@surriel.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache &
 Free Page Reporting
Message-ID: <20260707062428-mutt-send-email-mst@kernel.org>
References: <20260707064235.1386552-1-souravpanda@google.com>
 <9624988a-366e-4884-9408-3f3b88c27290@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9624988a-366e-4884-9408-3f3b88c27290@kernel.org>

On Tue, Jul 07, 2026 at 09:29:07AM +0200, David Hildenbrand (Arm) wrote:
> On 7/7/26 08:42, Sourav Panda wrote:
> > Overview
> > This patch series introduces a dynamic, NUMA-aware HugePage Cache,
> > backed by a kernel shrinker to safely return memory under pressure, and
> > integrates it with Free Page Reporting (virtio-balloon) for HugeTLB,
> > specifically targeting gigantic (1GB) hugepages. The goal is to solve
> > the tradeoff between allocation latency and memory
> > fungibility in virtualized and heterogeneous cloud environments.
> 
> Hi,
> 
> in general, we consider hugetlb nowadays to be mostly in feature freeze, as we
> realized a while ago that adding more special casing on top of something too
> special for all of MM is only going to hurt us more in the long run.
> 
> We want to have less special casing and less special sauce, not more.
> 
> Now, there is nothing wrong in making hugetlb be less special, by making it use
> more of core infrastructure etc.
> 
> But optimizing for surplus hugetlb pages by teaching hugetlb about new caches
> and its custom free-page-reporting support rather looks like the wrong direction
> for me?
> 
> -- 
> Cheers,
> 
> David


It is currently bypassing free-page-reporting completely.
Making existing free lists not ignore free-page-reporting would
maybe considered "making it be less special"?

