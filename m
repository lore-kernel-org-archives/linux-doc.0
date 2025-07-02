Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179CB235341
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443912; cv=none; b=kWzZ9soH+tXB9tiSHJZmWDE7B+K55XLYcCgjWN6AnJjXs/n0ULVPcHWqJDCy8EhmFUificho2q7amo5yiltRdT4iPdOalf0sZQ5N71xXRd89x5VhHhamnMFD02yNGN1WvX8D1Msw+fbGWkb10wlAACUygc3jEmkTKDUhO5Zx4qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443912; c=relaxed/simple;
	bh=QG1iZiP+R2rzXaTe56gOjHC0fYF3d/JOXWrEX8czvSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzKULMpIbkB/2mx/pi/vwn35G3PqxlsHh7h0ouUjFFidVCkWg9p3vqPx/ORPGuP9Xv0z6pTOxGqRaebriapYwrxkAuOXlOqyr254e9DkoncyYI0FpLlcwhDjqq4LUPlLKXjC5JnSzr1MXzW/zD1d0ENxavK3WfwJXKF6Ui2288s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XmCcyH2e; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XmCcyH2e"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234b440afa7so66213895ad.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751443910; x=1752048710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndb+JaIMrjzxA+tCLX6/GeFttkCVzpWqjwe11W0C+PU=;
        b=XmCcyH2eZ+1iYyBqxZGqz3hKWHLiT6hDZ9LdpBV3k95bYP9/xlpjKst8L6GxYj3dHl
         lB++zWksjl1GR314xlEomUGtOiUcQ2IFC+dh/Ls7PxjVns8cTzHFXgcr6UuqYWcTOm1m
         oJzwy6dxnLRNYNK5mkgvZ+X6u0BFWre4F8DTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751443910; x=1752048710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndb+JaIMrjzxA+tCLX6/GeFttkCVzpWqjwe11W0C+PU=;
        b=D5r2eUgJXNZOhJjV1sg8UrPaSyYnvxAYgvNmnzs92HZ0BrlGIv6RDVAErhBCsDHnyb
         PQ5SlpuCdVsKCLyMTRsceHIz/85Kijra1Bz3E9nr0e69ptz/EjQtkcNaVjJlC5WlZu38
         5a6M5Lv5+5u9pPu6rqM+se0x2t0AFuPPJh9tU5AN9yH/tbeS5ItF3iipr0eWXC/lvgHR
         2maOS6MuqSG03hANGWHFgUpGprjTiLAb5m4mqTCjQg7q+yF//KuoGQtTOcQ9mTp/jZ2e
         WrpAmdLvj8jRxifU46f068NaSdbQXQzlCq1aFM7eEdw3hnC9Rd+xgs2zwCgyY27rEMp2
         Z5tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlTLP6vaSIUZTOHvEgXXiLC5a7ydc84RisRoDZRvfATHGTQIRvGMj4/HUaBjnof42nyRX5Q5uBoM8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz01zU7RfP1G304en/R+B4nleGm9TYAeqMcxfVAMkSshxJAsVer
	1Q4B9WJJepz4vVZQWcHCYvIDnSO6qjB0Fs7IpTTTHCU1TBi2rWeh9D45trcZAnMV6Q==
X-Gm-Gg: ASbGncusOOM1gmSUIP607zQ5xWYqjxeplKZjtssFSmsp7PwZtpLLn+IgcQZu6ELk7yf
	lN0bgqIRe/w+oxOnbcYDNXrRRus72n6+B0Z/dsVt4r77QeutYrhCG0oxxBYYbYWnbZhyjElsIYt
	+h6gvDDXh8EkWaiVGdtzmbkwWrQvYij6lK2yGXlvJFJ+ECfYY7h8PPM1zkpnpI8h8EbE8BFARsT
	xEXkCjr4iZf9vhUj4kLyYErAE6FiV1sgBfMpr3m4CrBCMO/Z1avbJzt36eFxoYw1WMmspedi1bS
	7/p1cunMgH3cU+25eYnNFNOU2uAxwnpUEvPFYHbdO4DL/DgArM3Y3q8BVIO8sb6p5g==
X-Google-Smtp-Source: AGHT+IFyaxLPiNw4RnMZfl9Tf3kKU0bVL2nwN672ya66HP6pYgxM8O8hDYVQs76FVVGhmt0dmGwu+w==
X-Received: by 2002:a17:903:320b:b0:234:f1ac:c036 with SMTP id d9443c01a7336-23c6e5e23d7mr21917615ad.50.1751443910448;
        Wed, 02 Jul 2025 01:11:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8825:8cdb:cb6b:8e71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3013d7csm12080632a12.11.2025.07.02.01.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:11:49 -0700 (PDT)
Date: Wed, 2 Jul 2025 17:11:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630130011.330477-13-david@redhat.com>

On (25/06/30 14:59), David Hildenbrand wrote:
[..]
>  static int zs_page_migrate(struct page *newpage, struct page *page,
> @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	unsigned long old_obj, new_obj;
>  	unsigned int obj_idx;
>  
> +	/*
> +	 * TODO: nothing prevents a zspage from getting destroyed while
> +	 * isolated: we should disallow that and defer it.
> +	 */

Can you elaborate?
