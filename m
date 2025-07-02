Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4AADF42
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 10:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451049; cv=none; b=NeMbAwUNwtikvYBKOwUeRdrv9ESjjQbaehInVgWeqVlhRXpFp074C2JlOOVqAupH2Gmoq/UNDBxaDyZg7xnwDJETqFTZ4L9rhHWQwevcNHRa+oFei0PvwcKBcmgn86Gj67vuz2nTTO8V38JhE3+X8RykVDxiGmmLIf9iNVeZUgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451049; c=relaxed/simple;
	bh=X/8cCALWl6B46verGcMgk1pVS/SO1QUX5EH6YbyQquQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiPx6vTghmqwnbnuSprQX3zLDGaf61gYM3mpE3pWW41hyFZ4wSFm4SRjw0RISKpP4jinmMsq+RdleVcyGql1SkbkxyoeL0AXxD+donopp/UpbtHO1BSqNHgU69fCm4YbrQEkdJYD6Eufc/CkactwZdPT8A48XFqT/P+yF8DKyVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RchncG7I; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RchncG7I"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b34a8f69862so4251079a12.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 03:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751451047; x=1752055847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld1XwWyA21yaiRgsO+RmuHJahSek4BWAE0bK6K3RNA8=;
        b=RchncG7IPeq1A1lS1fUZ8SZUGpOUPDZkFaiIL67nEZdW697fpG3n+FDT4QuI3L+rz/
         xqSHHBBnSOvChhZdxNvzWuVve1mwl5anE5VQ0n9ypya+t3pxtAWsqRY9EUXmduTWhyP8
         uYMgUyThWVvwssYfj/o3If9vw0xlqX3W4Nf9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451047; x=1752055847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld1XwWyA21yaiRgsO+RmuHJahSek4BWAE0bK6K3RNA8=;
        b=PYNe/fa8SiTsK2UH9Ty0hxxeMRMuqXWD6Kxd0u+JR7tX8OImAdJ7cLDi9M3M+I+LXh
         pgNsjgc1W7Eosm7KQQcdmaVEsVIEa4qpedMffVceIYOOp7AiVdxCkNz9yWdbR1gTbodB
         F5JXFjbqPKeYSk150mzydM9FVNo1gRJIbeJ4YA8sKfr6RGNHYObcX9AaU1pzTW6VqbV3
         qdARJP9NZuxNtK1HqsIP4G2pw5n2Xhh7OHGpEy9wEr0RMxAxd/sXKyXZkxl3dAj3N6bj
         Cj5jR9ulr4EXU8uapSpq8EpwnTzEAGE7Rt58w6Kr3c+IhuUR8/mo4hJkC/9+iovCv9Xj
         z96w==
X-Forwarded-Encrypted: i=1; AJvYcCWH/0poXhaXOqbqBXM4cn4JcqBJ/qH7RYd7DXM9qyCmaV0DMX0uOgqLW5QdZSyOFQGlKI3kocKmHMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7m6wTR3Ehn4Alm9K6c6QHhAHXkAiKlerpUnHo/z8o2HOt8hbd
	gd5RqHM7Y7tKculWGeV7g4LTOOD2DNmY+wdpYe6qR7ZVor2wXicWiiyXeUs9F1H7lA==
X-Gm-Gg: ASbGncuYliL2ZRjPfCLaX4fUUbhVrcymXvM1b2rUehA3rX0vsSzzXtwNX4qhvwXbDUB
	u0YgQemKUEdVJlmf9hEulYi7QpHU3+RzuGTwciOiji38MPnUvwuVvk2hB5RekIkz8rh99xJ3rr5
	2Zk2HdewxPCre2RnP/9INmEWSV7KL/x/qKoq0Pf7pLoT0nwiF9khXZNpHt+nAkFFLg5CiuD6xIX
	Yvzko8aVmV4T88ETqbBvRoCm5MtLys3Msd4ODVfhsgkHiTlLmmIL8pGUIjomfhKIqszw2w+Bt1R
	WKPmG6HcViytp6utxP1HeWYPSOoWVDFeCrqarscc7p2jki/Zww96X2+Pfq5NEhGPk5FZUYZjPCq
	y
X-Google-Smtp-Source: AGHT+IFD0I3P0mnZDdceuRH9XAJvvYKmYNHVDtVURKEkoHBc3BGVYVJeT3uh933j6Dzbu2Zpclzgcw==
X-Received: by 2002:a17:90a:d64e:b0:312:18e:d930 with SMTP id 98e67ed59e1d1-31a90bd4c31mr3078996a91.19.1751451046749;
        Wed, 02 Jul 2025 03:10:46 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8825:8cdb:cb6b:8e71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5383eb6sm19125723a91.10.2025.07.02.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:10:46 -0700 (PDT)
Date: Wed, 2 Jul 2025 19:10:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>

On (25/07/02 10:25), David Hildenbrand wrote:
> On 02.07.25 10:11, Sergey Senozhatsky wrote:
> > On (25/06/30 14:59), David Hildenbrand wrote:
> > [..]
> > >   static int zs_page_migrate(struct page *newpage, struct page *page,
> > > @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
> > >   	unsigned long old_obj, new_obj;
> > >   	unsigned int obj_idx;
> > > +	/*
> > > +	 * TODO: nothing prevents a zspage from getting destroyed while
> > > +	 * isolated: we should disallow that and defer it.
> > > +	 */
> > 
> > Can you elaborate?
> 
> We can only free a zspage in free_zspage() while the page is locked.
> 
> After we isolated a zspage page for migration (under page lock!), we drop
                      ^^ a physical page? (IOW zspage chain page?)

> the lock again, to retake the lock when trying to migrate it.
> 
> That means, there is a window where a zspage can be freed although the page
> is isolated for migration.

I see, thanks.  Looks somewhat fragile.  Is this a new thing?

> While we currently keep that working (as far as I can see), in the future we
> want to remove that support from the core.

Maybe comment can more explicitly distinguish zspage isolation and
physical page (zspage chain) isolation?  zspages can get isolated
for compaction (defragmentation), for instance, which is a different
form of isolation.

> So what probably needs to be done is, checking in free_zspage(), whether the
> page is isolated. If isolated, defer freeing to the putback/migration call.

Perhaps.
