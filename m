Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3761BDC8
	for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 22:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715379280; cv=none; b=WZZ2clDQ+HCFRYRgC94QFAfsWxsejV3YOxk4kwYlURSfgpZpU+qWMLCsPM9e2trzcCLpzv2v5RfrFrDFMffE2EujM2zywWFn86ntIrwS3gi4nKbXsuBOEI53Ub5w4RPCsCb4GWfGnxUJVAg3xDUYYM93KT50E2joLI3nHOzLXRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715379280; c=relaxed/simple;
	bh=ROcGEvtftnjYPI08GGYz9bNGpaH/RrDFIcR0zoLFgN0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7lcrum1Wb60MuvNA8XrFYFA74g/6Ceb442/tuHLGN5/4Ywj+L5FE1l+gDV3zPbo76Zaa14PtiBRcGL0ick31rlw5iyFavbl//FU3qemntVanulVc3vjbGf3Z/Xp6XJ74oacM45B+8iZJrktmCE6bY/jr1Tu7RBJcSk8MJuK2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A06IhSg6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A06IhSg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715379277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/QlJHr+D+VnlQcWOXKBfsNZlT2gXuYn22rJbWjqVyA=;
	b=A06IhSg6DFHpyiew0AUjunx1TX0PZURZavkmAmZdYHcwtC4Ty8qNHlWiGNTyAn9VPD+fe2
	CL3ztIAlTAKCgxlsatA52DPAZi0UW2eGJYRFPckOtR47xik8glRsSq4xse+TGMmELAJnm5
	pegR7rGHT+hfdLMm5gBLzyeH95ROHiE=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-dpVfItwdNj2fUU8Qv9LJQw-1; Fri, 10 May 2024 18:14:29 -0400
X-MC-Unique: dpVfItwdNj2fUU8Qv9LJQw-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7e186a8af8bso272120039f.3
        for <linux-doc@vger.kernel.org>; Fri, 10 May 2024 15:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715379268; x=1715984068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/QlJHr+D+VnlQcWOXKBfsNZlT2gXuYn22rJbWjqVyA=;
        b=aOjvy+W6MOpUguhKAW6BbHy+g8EgLqBw+MVWaXxv/kpOKtrVZlbepC/mpOdEmNWLbT
         0B25KIXscFc7qd4Qjn/cm91x3fhkJTHCJEQMxajZwj0TUlM7hoYBIqiJKZzsenYB8Txm
         ycUH69zjPvpDQ+KiAxyJzxA5kiGsfH4HtSCMm+DfujGgmu/d8vGB0O14dwKfEB8x7l1G
         +Q4Y9ZGjXarh6zQoj1Bh5wRQGUaDDnCfWXHo5kSAAUhAPXGzv9VktMzr5Z+pKbgUZJpC
         BINOYja+zAOFO5zRUYvzNFV46auo+zxGMqG0KMnJQSlnFGeAf4D93QxO5z5hQl62Zrf/
         MJdA==
X-Forwarded-Encrypted: i=1; AJvYcCXJUuwz7Uyelb4jv93AeNiIprIo/nY5sA8IQ3oTcu7Vg1mFX9ehnjD2ecgIOe4Sn8V+Ew9rLJ3MlFeseHFuIL9YBvYW+C9bGe2+
X-Gm-Message-State: AOJu0YwU/gV7tTfV3z+Da55JeEs7qkOwTo88eh3Ua4OY01Tm3zorCpYH
	7UTJ8njSmXr5rk3j53JHU+Oh0Kvv6CHvyQ3kZy4koXVJKby41b5iK7LfD2ZzVoO9xGou+EStbGD
	UwvCg5gEkH9e02Xslb53PsXobozMNzqJ1JFBSNQWoadNJj3HPG+gDauCJNg==
X-Received: by 2002:a05:6602:178d:b0:7e1:b4b2:d706 with SMTP id ca18e2360f4ac-7e1b51a3f2fmr446829239f.3.1715379268282;
        Fri, 10 May 2024 15:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBFf1hFugwXrr0klEwmRsIlfe4M8Guf0BNT2CGB9vmEx+wes5EAiaXPPMN4KI1D245YbdcEA==
X-Received: by 2002:a05:6602:178d:b0:7e1:b4b2:d706 with SMTP id ca18e2360f4ac-7e1b51a3f2fmr446826939f.3.1715379267902;
        Fri, 10 May 2024 15:14:27 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7e1b9499ba6sm54162539f.31.2024.05.10.15.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 15:14:27 -0700 (PDT)
Date: Fri, 10 May 2024 16:14:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "foryun.ma" <foryun.ma@jaguarmicro.com>
Cc: corbet@lwn.net, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com
Subject: Re: [PATCH] vfio: remove an extra semicolon
Message-ID: <20240510161425.589eb25d.alex.williamson@redhat.com>
In-Reply-To: <20240510003735.2766-1-foryun.ma@jaguarmicro.com>
References: <20240510003735.2766-1-foryun.ma@jaguarmicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 May 2024 14:37:35 +1400
"foryun.ma" <foryun.ma@jaguarmicro.com> wrote:

> remove an extra semicolon from the example code
> 
> Signed-off-by: foryun.ma <foryun.ma@jaguarmicro.com>
> ---
>  Documentation/driver-api/vfio.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/vfio.rst b/Documentation/driver-api/vfio.rst
> index 633d11c7fa71..2a21a42c9386 100644
> --- a/Documentation/driver-api/vfio.rst
> +++ b/Documentation/driver-api/vfio.rst
> @@ -364,7 +364,7 @@ IOMMUFD IOAS/HWPT to enable userspace DMA::
>  				    MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
>  	map.iova = 0; /* 1MB starting at 0x0 from device view */
>  	map.length = 1024 * 1024;
> -	map.ioas_id = alloc_data.out_ioas_id;;
> +	map.ioas_id = alloc_data.out_ioas_id;
>  
>  	ioctl(iommufd, IOMMU_IOAS_MAP, &map);
>  

Applied to vfio next branch for v6.10.  Thanks,

Alex

