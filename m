Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F983290A5
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031719; cv=none; b=D4oeTGIklm92JbCtT4GMB+fjRTtvCv3LcrFn1YHdCG0osb5RY4L3ULuIckphoUBHPsSIsnFAwVe/aXS3wYsgEBOBIxh84SuUNSkiWlCOW+fh1S4+MjjYoJ4spSPjelGB9IATr00kDcYgKWhs6LLxZqfV3nMR/u0INThwMKTZaTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031719; c=relaxed/simple;
	bh=NJlVrRT3rKyX8Zx92hAAkUo94p/tcoww3dztI4rs/68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TauR5VcSut4/uGMEKknodrG0QRfM3GaTedUAiN44umA11wLbsLHJu607u/A67+MNTry2Lqa/dOcZmZWoZqVdR4l3Tz+PqYzBz8+3FchgRXpw89NMOSBfa9Z2AqOQO6QaWmUYF9nguJrv6pTaynLTAKRnjw3PR68ag80TDtLIWH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e0HeLhpR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VKlOJeYC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e0HeLhpR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VKlOJeYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777031717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nEN+2szXTqM9oTIsUX5r8HOMqWdfRhmjKH5pfjGEKMA=;
	b=e0HeLhpRZEGYs2m++mNc43sQdLDXtnGQELjh6D+uOTXxcPjdktF3BsaOCZ6T6EXWqT8QXo
	r5AalDEE+ZedIgN7LqHGTPZ+I9AuIkJ0IH0vjb5ck2h1btqEtAw/SgaD0e0UIkWRvvkuwL
	CFtoHl2jC3KjW1lXVoJffzW6z3QN3N8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-KCFzfpKzNaObm5HuY2J4iw-1; Fri, 24 Apr 2026 07:55:15 -0400
X-MC-Unique: KCFzfpKzNaObm5HuY2J4iw-1
X-Mimecast-MFC-AGG-ID: KCFzfpKzNaObm5HuY2J4iw_1777031715
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb55e55394so1083015085a.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 04:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777031715; x=1777636515; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nEN+2szXTqM9oTIsUX5r8HOMqWdfRhmjKH5pfjGEKMA=;
        b=VKlOJeYClQ/kyFiv2qD0g4gVw79oOAR9qCfpows4tavsuThP5zUhf5WvQUQChq69xc
         qMdT7Qi8sihRiggkvyZB0mq0Y0KKFxBCBZhlFjArEnCPoSUhZABmiOrEx9b3INenTlVg
         bE12T//5Tv+UJTST8J1fTMx7K0bpfD8RRpRnkQx+giMPWTcsm5meGvQCGfnk0qVRGamv
         FsNXIfC87/h7DASEMr/25OjlTDPB6utLMMDhjHaEMZPHyhZkI+2VHx51Z3F614rJ/onH
         C6N2zeZMt8P+6jWvOZH4q2Df/JRFaR17cE+lRR8j1Nwor5weobleR95TUu/JH2j+Seec
         K4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777031715; x=1777636515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEN+2szXTqM9oTIsUX5r8HOMqWdfRhmjKH5pfjGEKMA=;
        b=SAZ8JkYUkPos7Hjs/KtByTb1vnPOdUpZV+tkX+O+xTmWfJhNSkMzPcDA9gMtFmA/2g
         QQ0F8R9RnOgTSYOrNzFzKHqZXP41p58oOGMjvJADZ5137aGnUsdUrOT04w+e44sn3Mv9
         C/vTL66KqT7JhWaXf3Y5hqg0jNoCA5PhEvPmEC6nfNFcvT/KOvgI79lbUPPAt8Z/fPE2
         9gOC4mDbpVAaAuNQ4WXN/Jp8NqkAOHy/Wjtjtba0jOzAFxN/uBREstwkZ3w3WmelluSi
         cGE2GvqqPHFZCbpHEf+/0QqQHvAIQ86vx1qF4IwCzNwLQI5rHpH/8PJAp/puwzM4GVvB
         gw6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9zbWA/16fcQ6kh1sQHad1sgUEvGZbjIrME3aKMmw1/jCQycMZOAk1dXk0K8cGRtGzOX/uO12LwO50=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIlbgiDpeedyHX0r2mDCorxWFDx5RZ93ySfgM4ET2RRbkpOlMK
	AHMG3k6eJP15bGvMrtK+3h+N9Z3VAKY8oRXbW9FdpZC/OqkdIkSH1MGvbvO7WSNXn6DsCK2+xWU
	QHkvY37DBtRLf7Rvvu++HNIXkRAIOnfLFIacsirwyjzBNkg5v+QXsORSn6mYtRA==
X-Gm-Gg: AeBDiesSDBNIUtY/LNGOPCIl4j3MV86bweYLhsWEnX57xoEhiki2txleeAhWq/5jVm/
	KXaBq1Muk4Kjaq7n9Z2hBbN/y1gqn96GokvAivF9Fms5V4caMfsFb+BUpIe85Hz+hDaJcoYL1zE
	C5+BO3xObfHDhynjwDHvonqeBdlb1+g9D+Mbeg49+XfTFvmLPatlbcxvfA2Sw73O/XPO84XJMnF
	9WO8y5xkSo9EkDGYMQJ8vYTQj8i0u6wPAsrqKq7Nmwhn1yJbPZeA+r7xZzke8wcqiTFp5y5S4Qr
	EVn5wBJbQkwVxJ7tx6HBiZQNx2oZ2/w2/D3LnB/i8vvDH4H+hs9boitXng1s3IeMt/uZrGN76RM
	V56Fag/fpT24p7oVKNYd/w3aOha3q5HBlGzIiOJPW7Z+cAjoYY/at0SFIyQ==
X-Received: by 2002:a05:620a:4513:b0:8da:358a:c482 with SMTP id af79cd13be357-8e78fa1dd02mr4607937985a.12.1777031715103;
        Fri, 24 Apr 2026 04:55:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4513:b0:8da:358a:c482 with SMTP id af79cd13be357-8e78fa1dd02mr4607932485a.12.1777031714498;
        Fri, 24 Apr 2026 04:55:14 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ef12122800sm837694385a.18.2026.04.24.04.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:55:14 -0700 (PDT)
Date: Fri, 24 Apr 2026 07:55:11 -0400
From: Peter Xu <peterx@redhat.com>
To: SeongJae Park <sj@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [RFC, PATCH 00/12] userfaultfd: working set tracking for VM
 guest memory
Message-ID: <aetaH3W47iR56nQ5@x1.local>
References: <aeprnnccJeyHB2rt@x1.local>
 <20260424002625.89857-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424002625.89857-1-sj@kernel.org>

On Thu, Apr 23, 2026 at 05:26:24PM -0700, SeongJae Park wrote:
> On Thu, 23 Apr 2026 14:57:34 -0400 Peter Xu <peterx@redhat.com> wrote:
> 
> > On Thu, Apr 23, 2026 at 07:08:00PM +0100, Kiryl Shutsemau wrote:
> > > On Thu, Apr 23, 2026 at 10:50:06AM -0400, Peter Xu wrote:
> [...] 
> > > > - Whether we have explored other approaches on page hotness tracking
> [...]
> > > DAMON is built around sampling. It is good for working set estimation,
> > > but I don't think it is directly useful for eviction decision. It can
> > > miss hot pages. LRU rotation will also loose info.
> > 
> > Exactly.  If we need to collect ACCESS bit (or anything similar) for
> > eviction accuracy pusrpose, IIUC we need per-page info, we can't estimate
> > by sampling.
> 
> That's a fair argument.
> 
> Nonetheless, there are some companies who use DAMON [1] for a similar eviction
> purpose on their products.
> 
> Also, page level accuracy issue was indeed concerns from many people.  DAMON
> therefore provides page level DAMOS filter [2].  The idea is finding a large
> region of cold pages in low overhead first, then do page level access recheck
> on page of the region using the filter, just before doing the eviction.
> 
> DAMON-based memory tiering also uses it [3], to avoid wrongly
> promoting/demoting cold/hot pages in DAMON-claimed hot/cold regions.  The
> evaluation result was not very bad, and a few more users reported positive test
> results.
> 
> Also, DAMON can be used for page level monitoring [5] and open to changes for
> users.  Actually a work [6] for making DAMON-based page level monitoring more
> lightweight is ongoing.

Good to know that, thanks for the info, SJ.  I'll add a note and try to
explore all these at some point.

I recall I read a paper describing damon tracking overheads when
granularity is small and when the memory scope is large (in VM's case, it
can be e.g. 1TB or more).  Would there be quick answer on whether this one
still suffers (or maybe it was never a problem)?

> 
> I understand no one fits all and the decision is up to each user :)
> Nevertheless, I will be happy to help if you have any question or request for
> DAMON.

I'll definitely ask after digging more into that, thanks for the offer!

> 
> [1] https://cdn.amazon.science/ee/a4/41ff11374f2f865e5e24de11bd17/resource-management-in-aurora-serverless.pdf
> [2] https://origin.kernel.org/doc/html/latest/mm/damon/design.html#filters
> [3] https://github.com/damonitor/damo/blob/next/scripts/mem_tier.sh#L40
> [4] https://www.phoronix.com/news/DAMON-Self-Tuned-Memory-Tiering
> [5] https://origin.kernel.org/doc/html/latest/mm/damon/faq.html#can-i-simply-monitor-page-granularity
> [6] https://lore.kernel.org/20260423004211.7037-1-akinobu.mita@gmail.com
> 
> 
> Thanks,
> SJ
> 
> [...]
> 

-- 
Peter Xu

