Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D69528506A
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 20:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080361; cv=none; b=VhAULK5e15pzScUhlqRD/RrL4IAnCA/PQyJLpucqPOCQida94NiLwx9R68DWUJBoJVJCnaZ4j/g/6OHLznV7fKLJHyj4n/4yy6ghFjehi2WKQPHN3f7ZkkmFm+bRNWtq+s4rkN97k9MEp0asKe9LRyt6MvepDm3WMvr+ZjCD1V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080361; c=relaxed/simple;
	bh=JxsgrbLIMb5BvKZzkAFDuSG7tbjQ67Wby1+vPYYWBDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj79AKha1XS8zbp6F+heD9//Wxt1JbFBEcFYJxfxrGlhXJ+D48qwZ4vmYXaYhRrJHKMOABnagksb5Whc6IAWnslAU+FM8yjdRrv11XosTmR8tklDaXm+DGIHmAoFwLiFHHyE650pHi2DjMqEttSAb6h5ZkF+twzNG7Dwk7fx3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ak2MiQod; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ak2MiQod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761080357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JKaU+TdmcHMrV3dqR9kS3A74O+yRTxyeV7YGtEGdpzU=;
	b=ak2MiQodYy8PrtoUF/ePZHXkPB0d+5eMBbTCj72J5WDRY4auwyLmXitX0JFIwKG6dcAXyN
	nFJVpNOnQARhHTZl1tjUNyLNmUNZyqFXKGybcNAiibogmkGMG/jB1k4RmgpfSjnSl1iE55
	rvJ6LeMNpIRwP5tZz8AabrR+ZYXzxWI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-JQkt2c-sNDC49S7LOKuCmw-1; Tue, 21 Oct 2025 16:59:16 -0400
X-MC-Unique: JQkt2c-sNDC49S7LOKuCmw-1
X-Mimecast-MFC-AGG-ID: JQkt2c-sNDC49S7LOKuCmw_1761080355
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4270a61ec48so4395449f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080355; x=1761685155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKaU+TdmcHMrV3dqR9kS3A74O+yRTxyeV7YGtEGdpzU=;
        b=SUL/++2lOor8UMAP/SAW/rnhditJGL2q8Kr+nYPa1cVgVerF6K1dCe90dTmrRrVCM3
         qg22ONpaP5QP8LC/95C2BnFSGX9g1rUQCn3/j6qr9VSgQc51N1m4fukvnEBy15aSuxpM
         tnGFc6+PtfU8Zmpf2v0f26p7hFneuxoO+VM6UZdftzger32ApfpJCxG2wl60LqIFgIk3
         CdbR4/JhbT2vprc6yI1fSh+QIw3x1/yyNbYQoWNSkPQ88Z9EIgGpTp1oC9b7oFavuPmH
         EBhLAE1b0Hns4CblwujvaXRoxVHZ33xOTv5TwgISM2oMDLk+qB4zXNk/5uxy78pPfW78
         L0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqzx/WKJ7+1qVsX/KP7WtDfSBxTZgLokibl5ADFl3Bq5F1Y+kruVRSC5ZEmZ9vEaM+cpAWoDAq5Tc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjrGTpR9l6hFceq0WWI0MjYQB9Z88LNfRQGteA5Xi/J8ZLuBLS
	hsqH4UB/aULjtQBTCnxHlGjdbWW6qX6Q0YTulSiiZqbgbB0bNTQDZ2mDe+ojAdg4w+ZawhSY5TW
	ewU5cpnDMv12PQGieN7OAiVc+SxDygoe2NXI06qJhNCDy6C5/MiA7/xfoyTVoKroJCNVMXw==
X-Gm-Gg: ASbGnctx2v0yhdi2GvHiY+3C3g/1Tj2x+N0HbLm0pGtIKFEl1NLfFlQ3WUW4rSftiV1
	gky/WCNCcXo2kbPZhA2RGvdXh64diTQv8IotZ/Owmj6NTDx6Lc5ehc2QcQtBMDpmWPm/AonNTlm
	x5EwIu8QS3npiHCkxfzgTS7Yo4NojJPnDssJrdyAFwrMroIjOcsfaiIxA6yD27Dl8MScleQN8pH
	4QG11dwD9tccPwJm4nvc0JGGwZ8eyz8Oe9K4CLQxsthCa/uJFyD1neh3yu1a1sOii/qkGiAq69k
	3jlA+wjVlF6RG8eW2F8C6bPTy9l+3vgBZl/YjPuDqI8dtSIXxOcwpJjdwzO+8+DbHTNa
X-Received: by 2002:a05:6000:25c7:b0:427:854:787 with SMTP id ffacd0b85a97d-4270854085bmr11773143f8f.51.1761080354908;
        Tue, 21 Oct 2025 13:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm6nUHK4Q2KcRAx2gRXyZZ7eczPX8h4ab+8B0PRAUXehLh5qUDHKRiFzbQIJWCndKqsBf56w==
X-Received: by 2002:a05:6000:25c7:b0:427:854:787 with SMTP id ffacd0b85a97d-4270854085bmr11773131f8f.51.1761080354419;
        Tue, 21 Oct 2025 13:59:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b33sm9493345e9.14.2025.10.21.13.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:59:13 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:59:10 -0400
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
Subject: Re: [PATCH v1 11/23] drivers/virtio/virtio_balloon: stop using
 balloon_page_push/pop()
Message-ID: <20251021165854-mutt-send-email-mst@kernel.org>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-12-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021125929.377194-12-david@redhat.com>

On Tue, Oct 21, 2025 at 02:59:16PM +0200, David Hildenbrand wrote:
> Let's stop using these function

these functions

> so we can remove them. They look like
> belonging to the balloon API for managing the device balloon list when
> really they are just simple helpers only used by virtio-balloon.
> 
> Let's just inline them and switch to a proper
> list_for_each_entry_safe().
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/virtio/virtio_balloon.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index f7d6a4a6e54f5..4b22de6a5f845 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -242,8 +242,8 @@ static void set_page_pfns(struct virtio_balloon *vb,
>  static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
>  {
>  	unsigned int num_allocated_pages;
> +	struct page *page, *next;
>  	unsigned int num_pfns;
> -	struct page *page;
>  	LIST_HEAD(pages);
>  
>  	/* We can only do one array worth at a time. */
> @@ -262,14 +262,15 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
>  			break;
>  		}
>  
> -		balloon_page_push(&pages, page);
> +		list_add(&page->lru, &pages);
>  	}
>  
>  	mutex_lock(&vb->balloon_lock);
>  
>  	vb->num_pfns = 0;
>  
> -	while ((page = balloon_page_pop(&pages))) {
> +	list_for_each_entry_safe(page, next, &pages, lru) {
> +		list_del(&page->lru);
>  		balloon_page_enqueue(&vb->vb_dev_info, page);
>  
>  		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
> @@ -474,15 +475,19 @@ static inline s64 towards_target(struct virtio_balloon *vb)
>  static unsigned long return_free_pages_to_mm(struct virtio_balloon *vb,
>  					     unsigned long num_to_return)
>  {
> -	struct page *page;
> -	unsigned long num_returned;
> +	unsigned long num_returned = 0;
> +	struct page *page, *next;
> +
> +	if (unlikely(!num_to_return))
> +		return 0;
>  
>  	spin_lock_irq(&vb->free_page_list_lock);
> -	for (num_returned = 0; num_returned < num_to_return; num_returned++) {
> -		page = balloon_page_pop(&vb->free_page_list);
> -		if (!page)
> -			break;
> +
> +	list_for_each_entry_safe(page, next, &vb->free_page_list, lru) {
> +		list_del(&page->lru);
>  		__free_pages(page, VIRTIO_BALLOON_HINT_BLOCK_ORDER);
> +		if (++num_returned == num_to_return)
> +			break;
>  	}
>  	vb->num_free_page_blocks -= num_returned;
>  	spin_unlock_irq(&vb->free_page_list_lock);
> @@ -717,7 +722,7 @@ static int get_free_page_and_send(struct virtio_balloon *vb)
>  		}
>  		virtqueue_kick(vq);
>  		spin_lock_irq(&vb->free_page_list_lock);
> -		balloon_page_push(&vb->free_page_list, page);
> +		list_add(&page->lru, &vb->free_page_list);
>  		vb->num_free_page_blocks++;
>  		spin_unlock_irq(&vb->free_page_list_lock);
>  	} else {
> -- 
> 2.51.0

