Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A21487D1
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 02:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855959; cv=none; b=XYyNSBVyEeJ0GDmaAVwXY/3eldC9nuVqHXAlJoEGp33URTxD2ZhVJe/FViIzRNpcUQQ6REL4ch1aNc/IIj8S4b69IxTBxw7r8ag2nVzm2/uT3/yHN42QglnWDRFK0rBA+SFRarPVLIU8cxk4qkDyzMYp66ODzCeImtXIzVpZZ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855959; c=relaxed/simple;
	bh=atyvLyGvCJNyDgAWZ4IJQR5kCqQIHDUYFs82Oe/4Rqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsBuUpfv/SaPt/mzJb7og/CNSGu5F7sL8iTvycFmONWhqTV+C7Np5kB4R5m36cQPF7RIPSbXzbZ+bS/ZnUQOKITIP17KaRGZg4JTV0OV9owCy7dRB5ch7/d1ipDf/VLwCH6vfYD3fOUdzvRehkYC9//FT7xAX1w5vHyBadN/pCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gmz+XUvP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gmz+XUvP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2030643b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 06 Jul 2025 19:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751855957; x=1752460757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2eqbUK4FYCJiLH0zvQx8aO0ccOeXGf/PUZ4UYY45Alo=;
        b=Gmz+XUvPBvXzCFBQIPvrzi746qy0JZY9fDtFxKt4GRSnYKfbLX/+fOAy2mhmsSJj0L
         M35O0ufh9eCqPzvrkR5joOnTUFtVx0FWDs9NRnLAvVqySdB82DHBRUGoql9BKmsXEU9r
         nZLfajN/uUy3Dhqtyya1jE8TY2dQDVnNpaliY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751855957; x=1752460757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eqbUK4FYCJiLH0zvQx8aO0ccOeXGf/PUZ4UYY45Alo=;
        b=ns7MseShqL1IUZ1iA/3+K+P+l7tZCVJmgE5NITnuxYqNhVbVsFJLW7BAFb9j4wFk9v
         5/Pqrj/k0ZsjgSSYLZVE/LE8X5GF21G8spVvhEkOqveYnFYI/lNjer348k/DwhQZoEnY
         3rG/0R1TjTy0ua1xT4YxcusRc43JZyy7BQq+4T/ixVS0bG8xq79LuK8d0rvanT3gynsA
         cdTFGjz7/N52MpOnHzSx+qIeAJUN/lBsfIEFSnuIP/r/eRQjPOu7dZOEfnNFPb4N6+qx
         RID1rZ++BuXqEYbgHzZup38BETT+LzN02H2bFst1gZvNJh+yaLTO7t/FGlfC0MgpldqQ
         oQhA==
X-Forwarded-Encrypted: i=1; AJvYcCWEk1hd9tsiASyKvycibpInz6N9j6ZdEr2h/P2vq2CXc2wLP/OwfJJT6zVanrq1qdiPnhtGJ80hutU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww3N3EMYqFBbnuf6nhKEYO4DkeOsFwYTpHu5hpznQpR8gqMSik
	lWrMEwmGpsPxOP/HvaonJqfOmNPbYb1aFmCP+LgD0l6sxCQfVwxJ+HYErTz+SIJx3A==
X-Gm-Gg: ASbGncuB/UIi3N5WsK7VHyy9mjmVHfPy1Htz17BX1DAR+i2yhlq0XBeYWJQ01oOPU/7
	PINFiCFI0SoVIfy6JqsrbaSpT9h6nmNgNWRoGOgiHUgLggdfL0IVLf20Tg9lmOkS2D2iWTb7nmz
	FFifYV5maucL4Kmon24KKwjBGWx0u4zUKxJ77HrK+7zpzv6WgsdDkLyoY2owq+uqsmb7vNpG1ac
	CB6xakzaJNSzcETxR7Roi5UZ3AJu5dWvXG+DRZyAKyKQIHyUPWduejlFvlbeIKQLyPhITNjjUFm
	sqBd4MR2MADofw0mAyfYDxLgzppCaFl9BbuwH2AEfSyasw2acmEeH1JF4zt3CWzEwQ==
X-Google-Smtp-Source: AGHT+IEurZuttkS95VnXcSGu+b+8TgCle7ih6/mBYzXLZUJ1AXkAhgjCuqtatOUxrSPej26STHUETw==
X-Received: by 2002:a05:6a20:4328:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-226095a5143mr15866459637.10.1751855956675;
        Sun, 06 Jul 2025 19:39:16 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:5470:7382:9666:68b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee74cf48sm7419649a12.77.2025.07.06.19.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 19:39:16 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:39:04 +0900
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
Subject: Re: [PATCH v2 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <5bc5vidilgjb37qypdlinywm64j447wtkirbmqdbmba2bgr3ob@22so3brrpctt>
References: <20250704102524.326966-1-david@redhat.com>
 <20250704102524.326966-13-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704102524.326966-13-david@redhat.com>

On (25/07/04 12:25), David Hildenbrand wrote:
> Instead, let's check in the callbacks if the page was already destroyed,
> which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).
> 
> If we detect that the page was destroyed:
> 
> (1) Fail isolation, just like the migration core would
> 
> (2) Fake migration success just like the migration core would
> 
> In the putback case there is nothing to do, as we don't do anything just
> like the migration core would do.
> 
> In the future, we should look into not letting these pages get destroyed
> while they are isolated -- and instead delaying that to the
> putback/migration call. Add a TODO for that.
> 
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
