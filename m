Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65383769EC
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009938; cv=none; b=iTuRFKV71SqZLTXZlBdlbMJQmSBuks1CaeHgzrilcT9ZSh8fK2/B+xbPnfJBb0XSe1+J/PMB6ADjyZzqTM0MUUItlbBjEtYsRE7Yay+uPofDjJe9wq9nPsoIS71mRtrdg56WxlHYHh5VEuPMAL7YUA7mXpve/HhPRSCxEK+msS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009938; c=relaxed/simple;
	bh=a6tvBVn7TkeFVDWd6/gju1M7ekbHU4LygyctP2naUgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isQfaronB4WpW1FNlGqRdUvEPeIfhAWWdbHN1EcOuktp8BoHsteJ368Fjj3gp4ujodd/Gjy50zV1toQ/wmIh67DlRCfT1TYE3Dr4bG8ECVh1FtJxwZOMHdc7jOPBrTtxQCVUPTXZc24GgFol66+fdQ60kPjG84hcfQnOsbp4o90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=gPTFy1aF; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="gPTFy1aF"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-533952f3714so48032521cf.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 13:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792009936; x=1792614736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FxWsMrxZQ6m0iiQC2ennCbyhDPNK9cewi7MvMPPF8GE=;
        b=gPTFy1aFJit0Y/o/hdKB45kzE8Cms6OwDaym+qTV19TBLhlV8e/ipYe6rr1SOXz3iz
         Y3FwxnSeiRIVpQYT+CEa3IXmWv1bctVTGhGt0DUsL+nfmBht2LREQ2BDvNOAdnD1TcKp
         BXpUnks1U2YOGuLj9pCSwzAkkuJbpuR7p0ri+qf1lWuUwG/oQIqqxmbo7v7XOympMsoI
         a5/TIaj5GR15nkz1GULCJQEZvjbtZdYcxzEggkrLqBhBWVdCflXSLEkgZmpEG02d3lwJ
         ri7JPtVZ0jkD+8CQmF0FlnUsLDBA5kXoSczFgHVqd/Vt8hc+2SvzaBiNhkRP30+ERi02
         E0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792009936; x=1792614736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxWsMrxZQ6m0iiQC2ennCbyhDPNK9cewi7MvMPPF8GE=;
        b=THMf2LWrMNTeFuPOEtqKUxpjfQ/ahuWqeSQjNOa0H7rpVzEXrW+meUYgyy8n5PQFst
         1ohI46Uh/5/A1khDef9dGawR528fzz7VfXd8iuL2YqVkceeK8W6iaSVR3gYPUddiRR7/
         g5TOhmgajudxfypljxROXhP6rF+2+wDVHuu9j9d2/SUvKEw62mZSKYicDVc4fpatwwhN
         DFURWhbrFY27xSqjuLRgo8HGGtH/Ak+EjRd7QiBVhlmMtrahvehNPNF31QNtknQd3COj
         XWpnEXnwO757QT+0OyAVhv58q0IjeFtHMT/2hzHlAoR943+YiC0bmPmTJsuC0UifCkZ1
         oLig==
X-Forwarded-Encrypted: i=1; AKwUvBw5UCR4sc7bPRtid0HGRFFiPEoDeDCScBYMvDsiwNTGANhE3ILUAU+hMTQnvsBQypU9fAEB3eSjIE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM3znHkS4k7OgYcaIX/hY9P/IjQw1B9GJ/bf0da5zxrPoblWRE
	TR7lamchgsjmnFJ4qpn6vVq9WUUAN20PLJdDkVjfe0+goLIeURV0/dnWmwOSKFAQDXk=
X-Gm-Gg: AYBFou2HuyuD5eh+FMKOEQ8AgyvI1LTnarQFIKl6Ne5bM/oX9XRvyKBKJ8Sg3di44PT
	eMqlWwN+mcvCdzlFx6pFQHb+eq3tasaYZ49yJS5PFMT/fCtyVYH6+SMAh4iG76if8Xvx7296/T4
	bT0Eaq2pvmANaOKtW4MoZ9fBteke1QZg2DCsmMNMQ+1gH11ERnv8a9s9MZEkP6kmTW4FkmAawJF
	oH1wWiX6RkWM/jjIIzqwIEeMCEwE7gaCVswrmOOPdg2MNqCZtsrPrjqI2bOrdeTZ841CFwTk6BC
	SKAmLlLCxGkz0UmRVcL2HjNn88AQ+Gb/Elo5W8VaODJmd6ZyBeCiqQpMrLYJggZONF/eGmDylCL
	IvG5dy/i6qU2NoOASKqGbeBMxe+a4bynZ9wuJrcyoiSZSZNE1tvKNn1wbaZ+JLb0iK8EkZZycYQ
	Eekty/0aCZh14YCHMDHdhWO/PXMgcXhjMUCgLiI5Pxqtrhe6GUAmQ8+GmCOAag8sOFdSDV
X-Received: by 2002:a05:622a:130c:b0:532:e4bc:b80f with SMTP id d75a77b69052e-5359fdf65efmr280266751cf.60.1792009935766;
        Wed, 14 Oct 2026 13:32:15 -0700 (PDT)
Received: from localhost ([2603:7001:f100:5081:9526:3c0:45cc:5ac6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536127b29desm6136881cf.11.2026.10.14.13.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:32:15 -0700 (PDT)
Date: Wed, 14 Oct 2026 22:32:14 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Nimrod Oren <noren@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	David Laight <david.laight.linux@gmail.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: stop recalculating min_free_kbytes once set by
 userspace
Message-ID: <20261014203214.GF371161@cmpxchg.org>
References: <20261014140859.1006967-1-noren@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014140859.1006967-1-noren@nvidia.com>

On Wed, Oct 14, 2026 at 05:08:59PM +0300, Nimrod Oren wrote:
> min_free_kbytes is recalculated on memory hotplug and on THP sysfs
> writes. The new value comes from calculate_min_free_kbytes() or, while
> THP is enabled, from set_recommended_min_free_kbytes(). A value written
> to the vm.min_free_kbytes sysctl is replaced whenever the new value is
> higher, so a lower value does not stick. This matters most when THP is
> enabled on configurations with large pageblocks, where the new value
> can be excessive [1].
> 
> Stop recalculating min_free_kbytes once a value has been written to the
> sysctl. Systems where the sysctl is never written keep the current
> behavior.
> 
> Link: https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.com/ [1]
> Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Link: https://lore.kernel.org/r/d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org/
> Signed-off-by: Nimrod Oren <noren@nvidia.com>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
