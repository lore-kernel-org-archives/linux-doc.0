Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892478F4A
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080262; cv=none; b=V/+mBgtXbAc4B8+aH8o/pbAKTwKwEPYugWBaIYt6fUHoGkn7HTV7SONxFgxRl9ZoWjclChtE7C+ffMywKU/Rie6xlUc+w3kvBTFNTGgD23TndxNY/xe2cyvXROu8tAeIDiESxPddHihUtHYeEZET3GlbVSCgvMhC4LpIXIMX4H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080262; c=relaxed/simple;
	bh=PiEF4dZTXzB/bahHoYvpvUwN2xzfC3fULfkA9PjR6I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vzt25w/QNrT+c3K0I3KliQ96acoaBE9uTHctRXVtcOMzuRSwpYKETIkTAF2FXtEaNJCUCm7KR7T3q9cJ8E0sxgE+inYZoYLFj6YBrCrXkcuIPAuuffCNWjY+WgvP+1KOMHpMfkYSa38BEpj1Ue0HyXdQpPn3aDnG1cUYFthJmNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QsRRpi7z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QsRRpi7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761080258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9bAJqRa8uA5UrlbIgGaXWwm0Ps33WDl0PlkuKaJzgdU=;
	b=QsRRpi7zPGdwEv+PDNTXHMSWklKabZAG5PipGNRpMRGgAbTM17/lhuAhDvMD3XXyCMlJnJ
	/tld72mMyCL2Wd0gcSAgvmNgVqqT26njOg+7I/FnuWMeheCz5rtJiDwla5hZj3sA/gtwGe
	hOUPEfREa7/cHvckrrli5FpXbPxt1kk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-fhTH7WWhPdqTKBhayzj21A-1; Tue, 21 Oct 2025 16:57:36 -0400
X-MC-Unique: fhTH7WWhPdqTKBhayzj21A-1
X-Mimecast-MFC-AGG-ID: fhTH7WWhPdqTKBhayzj21A_1761080256
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-427015f63faso3077113f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080256; x=1761685056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bAJqRa8uA5UrlbIgGaXWwm0Ps33WDl0PlkuKaJzgdU=;
        b=tSoB0Xsmj8Q4IkF9xboUxjH4iAjb3HES4zLuxXfQmb2gvouunk6iBSPxIPRdRGRHWm
         8PJuQVb6g/5C/I2sUvlOLBA62g+sjgh90LOtZMX8psXKSbrx0BTRx/P0LtkQ548JZtEC
         q086kzzzpCIUtAeNAGVHFAQMGlEmoZ67L5olJOztWSCh61GPsGDvuTwHGo8+iqgaEg34
         JWGV5guiHU2QiF3HgrnPwuS6WcYZLoIcdpH9atDFOpJiHS1IEMDZlhSgpWGtW4i1DRRs
         j7v13XPGb9UlPik84b0AD4jVr3SzuK9WNef1OOf8Fkmo0L8odTHkeagQDR6UBjVk4wPo
         4U2g==
X-Forwarded-Encrypted: i=1; AJvYcCX+7wpuwo15Ysv9lUjxGXpa6LhRVahNQy6Wbz7JPAAWkdKaPzhBoVZymrC+6P7FnzJFf0m2eO3PEW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjVEEAuel79uTNzvp8JtaLxgQ5Gn0D66dQdq5ER0+cOPcdFoc+
	RRQ91LgzmigIBRJI80V93EpyEz42ZjX7IDjn32XMK9ktfvEgn0GFdhdkM4N1COPLRj8gyr4MrFM
	bMDFwlNvCcE45V+DPhfC8/LTSO2xMe6zqeI4nz+wUYw8CUvcUqxUD6Bt+fCJO8g==
X-Gm-Gg: ASbGncu8b22rosRGz9gGM8tpwfIzstEnd92or70ZePV/szuQ3OyILps2pnESeEfVLWB
	YH+7SRR/GQKEQ8ZxupD/17+OgkIDvIXnhmEUHYJ3qWLXO/5wl1pTRyeJLAw2BXDce1/ajaFEfxW
	4zTt5P3RpVnixr7k0DSaiHlBOnW8qU4WgELFH5cUObOK+39HTwBmGK5xPFK+7FxpkL68gxy/Xd0
	2Raf2IoGczzusxiGyCVuhHq5xijgo/FS8d4YfoqagcKNqtORRZnyXhzs7zdNSkPmFghCQ7v3bGa
	UuxeWKfs4YjtqZ9u/4b0C+YxahMNN8LRJFBstqxO4GxXOyMQ2xvcen9R5H+8Wr3GDcsz
X-Received: by 2002:a05:600c:8b8c:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-471178a4af1mr109338075e9.13.1761080255561;
        Tue, 21 Oct 2025 13:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnSG23+FoLb+GmLuXvkTK9R1YegvexPcW+2uOk5jzx98hZ61iH9ju7jBpY4P6BKlTjZs87DA==
X-Received: by 2002:a05:600c:8b8c:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-471178a4af1mr109337965e9.13.1761080255096;
        Tue, 21 Oct 2025 13:57:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428e9b2sm9981535e9.5.2025.10.21.13.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:57:34 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:57:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 06/23] vmw_balloon: stop using the balloon_dev_info
 lock
Message-ID: <20251021165626-mutt-send-email-mst@kernel.org>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-7-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021125929.377194-7-david@redhat.com>

On Tue, Oct 21, 2025 at 02:59:11PM +0200, David Hildenbrand wrote:
> Let's not piggy-back on the existing lock and use a separate lock for the
> huge page list.

which is fine but it is worth documenting that we are also
no longer disabling interrupts while taking this lock.


> This is a preparation for changing the locking used to protect
> balloon_dev_info.
> 
> While at it, talk about "page migration" instead of "page compaction".
> We'll change that in core code soon as well.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/misc/vmw_balloon.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> index 52b8c0f1eead7..53e9335b6718c 100644
> --- a/drivers/misc/vmw_balloon.c
> +++ b/drivers/misc/vmw_balloon.c
> @@ -354,10 +354,15 @@ struct vmballoon {
>  	/**
>  	 * @huge_pages - list of the inflated 2MB pages.
>  	 *
> -	 * Protected by @b_dev_info.pages_lock .
> +	 * Protected by @huge_pages_lock.
>  	 */
>  	struct list_head huge_pages;
>  
> +	/**
> +	 * @huge_pages_lock: lock for the list of inflated 2MB pages.
> +	 */
> +	spinlock_t huge_pages_lock;
> +
>  	/**
>  	 * @vmci_doorbell.
>  	 *
> @@ -987,7 +992,6 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
>  					unsigned int *n_pages,
>  					enum vmballoon_page_size_type page_size)
>  {
> -	unsigned long flags;
>  	struct page *page;
>  
>  	if (page_size == VMW_BALLOON_4K_PAGE) {
> @@ -995,9 +999,9 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
>  	} else {
>  		/*
>  		 * Keep the huge pages in a local list which is not available
> -		 * for the balloon compaction mechanism.
> +		 * for the balloon page migration.
>  		 */
> -		spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
> +		spin_lock(&b->huge_pages_lock);
>  
>  		list_for_each_entry(page, pages, lru) {
>  			vmballoon_mark_page_offline(page, VMW_BALLOON_2M_PAGE);
> @@ -1006,7 +1010,7 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
>  		list_splice_init(pages, &b->huge_pages);
>  		__count_vm_events(BALLOON_INFLATE, *n_pages *
>  				  vmballoon_page_in_frames(VMW_BALLOON_2M_PAGE));
> -		spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
> +		spin_unlock(&b->huge_pages_lock);
>  	}
>  
>  	*n_pages = 0;
> @@ -1033,7 +1037,6 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
>  {
>  	struct page *page, *tmp;
>  	unsigned int i = 0;
> -	unsigned long flags;
>  
>  	/* In the case of 4k pages, use the compaction infrastructure */
>  	if (page_size == VMW_BALLOON_4K_PAGE) {
> @@ -1043,7 +1046,7 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
>  	}
>  
>  	/* 2MB pages */
> -	spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
> +	spin_lock(&b->huge_pages_lock);
>  	list_for_each_entry_safe(page, tmp, &b->huge_pages, lru) {
>  		vmballoon_mark_page_online(page, VMW_BALLOON_2M_PAGE);
>  
> @@ -1054,7 +1057,7 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
>  
>  	__count_vm_events(BALLOON_DEFLATE,
>  			  i * vmballoon_page_in_frames(VMW_BALLOON_2M_PAGE));
> -	spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
> +	spin_unlock(&b->huge_pages_lock);
>  	*n_pages = i;
>  }
>  
> @@ -1828,6 +1831,7 @@ static int __init vmballoon_init(void)
>  		balloon.b_dev_info.migratepage = vmballoon_migratepage;
>  
>  	INIT_LIST_HEAD(&balloon.huge_pages);
> +	spin_lock_init(&balloon.huge_pages_lock);
>  	spin_lock_init(&balloon.comm_lock);
>  	init_rwsem(&balloon.conf_sem);
>  	balloon.vmci_doorbell = VMCI_INVALID_HANDLE;
> -- 
> 2.51.0

