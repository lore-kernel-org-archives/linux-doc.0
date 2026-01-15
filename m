Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F92C0299
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469562; cv=none; b=tsaJu8IN7hSPKmKnn8mOADiywfu2ZLwzenvrJD9fJb+PEDkICbYdf142XpEzsu9iCsfyIrSW5liCOWgkzZQV3pNHzZPcpARhj4MY/I09z8AjUKgwR+mh/Mmv/xibU4z1Hcs8wKXBVmYFNpniJc09s3v3QjRzzyjtats/AfjD2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469562; c=relaxed/simple;
	bh=Ozn0e+aZcK60IGQOTAmLmLlDwBXMY/IeGnN4Og7JQKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LDRVo4stfxFznOYVf4BHnwbqvXvClE8P70DUcmTfZYm8+cm6lCuIiK1RW7CbvrhPC2znijwJAtkAauQ9F144XS0hkXUbD9py8exITB2hKujCalzStNRU/SaspovATOjMh3mbUqASzt4eHBIOM00GB9XWp40A6PoMm3WcB681BmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LeyevfOw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jpBJN/JQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LeyevfOw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jpBJN/JQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4Jd2k3tJmH6usMx/hzIeIrNAyuq9j42Ypf29Ccd2co=;
	b=LeyevfOwHDIGsrfXe9WHxt+oBhKtvDkP9J88zjs/3+H73+RvBXLTeEh1fTsHOj8HtbGuqx
	hb1lGVKCHyJCBLSfyuG4FK5kCygd7ShYS61i0TE4zkGGz9SU+I0VR2f09/892ZLtAPanaW
	a47QOMuqhJiwcJhvFGiKEreWRjt9FOI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-5v-0wMJ9OCy7z6MBDEoAgQ-1; Thu, 15 Jan 2026 04:32:35 -0500
X-MC-Unique: 5v-0wMJ9OCy7z6MBDEoAgQ-1
X-Mimecast-MFC-AGG-ID: 5v-0wMJ9OCy7z6MBDEoAgQ_1768469554
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-431026b6252so625830f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 01:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768469554; x=1769074354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C4Jd2k3tJmH6usMx/hzIeIrNAyuq9j42Ypf29Ccd2co=;
        b=jpBJN/JQ5muZRJsiReCbkzUpLYYJxk140qhyCCZQWBo91G0ki2g+ID/M2wnIbcWI+z
         1hzRvHH7umlCpEzlkP0LFf+Vv4CARAj0ioAB+SwBUj1n//JyketFE5pISHKxGjoKnp/9
         Uyeq1UUtPamAxIaX3qHRrv3+T7WFDH5GxkqHXfCOWYtGfd9W41sDt1bnIrFcII8W3WB0
         Osm4T7FJzrreH2rLQ+axf7kDvpMWVwvh5l58uQoYMxls+oyWPtliIIjv1uT5rh5zC+9t
         sTso8Xr064CTOr2qc2JmsHjTTNmXB23Ku5QJWwOATuoJw0nEhz46rLoieGtMavsCVQI9
         VJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469554; x=1769074354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4Jd2k3tJmH6usMx/hzIeIrNAyuq9j42Ypf29Ccd2co=;
        b=bKsdkVkIBuruCt0uGSqnu7ynJBX40nvYm3c4xt1jBBvuH2+4P0CsWxq18/Yh86gRRS
         4GxIN6uHpwqUDSLrW6R1eHWAKsvleBmEw11c4AcQXPGtTP1H5Xsn/mvWGg2Tjj3Gj2rC
         eNklw1mvawVBz0wclpS3sj1iGDQNP2p306D62ssk/MdpVmA3jZM5kq9NQX6FeDBtL468
         tru4p/Xhjm4m+3YwGZ/9IeeNA5BzKx0RJ+6P9tJ09Aq4HvtgdNHlHuIxasgo5CyBdaXL
         YQFa2VZzSM0KiRCcpoZ28UjrpnypoxO7/bjemBXFaL3oM5h4tR/KRSUUlRA6gptqYu9k
         SM+g==
X-Forwarded-Encrypted: i=1; AJvYcCWPcuKWEe/knmwEoNX5B1h9bq/L3rt0eICaOHq2Gt43F6Io1yEwucSHgfQVyMooKm1Axfj0byNSET8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4o8eAbUcqf0OrzcqU9XDYeosRTvmk2ePp/koIPSFW1Y7JUeqF
	1GUOOVOzv2jWAw50ObZtpFOS8K8tY9oFETchNP1zSZE6lbCKkXq3ghi6o578VUU9JkIv5rFU2Co
	EvxnmxOd9YTsevwG7GiEEXyCrC3a8N0pgLwS3H7wOBE6nh3fE58pF3TL8imkGAQ==
X-Gm-Gg: AY/fxX4+65SAx4YuQl+d+4NoAqNprK5/Nl3WB8NmR3v0vekG9CNGVKPNdpsbNV9zTxl
	vaGzF50C3uzy3/n0UAe9i6y/sGQAISYgeFc4vOAbPQyRmdI2h5SeKN6scB2dfifquh6yC4yfqjR
	Q4R6eO2Yn/i9mT0tvnV5hQsKEgv1MOKrVGRnbGXnoR3XSbhJKl9sghcT9yFgqqbGRF9cGhrQ6/R
	H2aTpc9qgBcegLQm0PO5beMVwpnLS/NNf3Y5JFAor7GO38dUz1kO/S+hHBaBqyLcpCdxAIGzsph
	Z4Qrjmc9GqQMjrS9nEAHvmCtVA9dPPfjSDoOT2RXjbYLESFqMnU09OSVjsArT6B5trbG5mt/pE0
	hoNhNs66lviZfOBvhiQjTPkO9ln2xcw==
X-Received: by 2002:a05:6000:402b:b0:430:f41f:bd5a with SMTP id ffacd0b85a97d-4342c5727bamr6648843f8f.57.1768469553984;
        Thu, 15 Jan 2026 01:32:33 -0800 (PST)
X-Received: by 2002:a05:6000:402b:b0:430:f41f:bd5a with SMTP id ffacd0b85a97d-4342c5727bamr6648783f8f.57.1768469553541;
        Thu, 15 Jan 2026 01:32:33 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af65f649sm4794185f8f.19.2026.01.15.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:32:32 -0800 (PST)
Date: Thu, 15 Jan 2026 04:32:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
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
Subject: Re: [PATCH v2 23/23] MAINTAINERS: move memory balloon infrastructure
 to "MEMORY MANAGEMENT - BALLOON"
Message-ID: <20260115043136-mutt-send-email-mst@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-24-david@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-24-david@kernel.org>

On Thu, Jan 15, 2026 at 10:20:13AM +0100, David Hildenbrand (Red Hat) wrote:
> Nowadays, there is nothing virtio-balloon specific anymore about these
> files, the basic infrastructure is used by multiple memory balloon
> drivers.
> 
> For now we'll route it through Andrew's tree, maybe in some future it
> makes sense to route this through a separate tree.
> 
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
> ---
>  MAINTAINERS | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de8f89ca1149f..b974f8c1c2225 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16454,6 +16454,16 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
>  F:	mm/
>  F:	tools/mm/
>  
> +MEMORY MANAGEMENT - BALLOON
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +L:	linux-mm@kvack.org

I'd still like virtualization@lists.linux.dev included, too.

> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/balloon.h
> +F:	mm/balloon.c
> +
>  MEMORY MANAGEMENT - CORE
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	David Hildenbrand <david@kernel.org>
> @@ -27536,9 +27546,7 @@ M:	David Hildenbrand <david@kernel.org>
>  L:	virtualization@lists.linux.dev
>  S:	Maintained
>  F:	drivers/virtio/virtio_balloon.c
> -F:	include/linux/balloon.h
>  F:	include/uapi/linux/virtio_balloon.h
> -F:	mm/balloon.c
>  
>  VIRTIO BLOCK AND SCSI DRIVERS
>  M:	"Michael S. Tsirkin" <mst@redhat.com>
> -- 
> 2.52.0

