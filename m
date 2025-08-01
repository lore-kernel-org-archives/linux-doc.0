Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EABC19E81F
	for <linux-doc@vger.kernel.org>; Fri,  1 Aug 2025 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754067618; cv=none; b=OaeIWFs1JIDZbOYwnfmBxHf22MbzWzpobR1IwdDIO853dWQ3XZV2ayEDAybEbDYgiJ0Gb7TvAeAUIcYxOu+hAKD1MgtfJKRIxEURsWQ9aJSUgDVaFc4Dz0sugOAoC4FW2+oxFj9EiKvm9pi/IolA0/CBoHl89QGjuHZ7MqtpHPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754067618; c=relaxed/simple;
	bh=ixzhB2IWkCoD0F1aKbqXUptaL4fTvucgYZy4AJNb4ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KU2LGDPjW+ThQh7nHxYezBrQEOMt9WznYyKY15GzyTG2LbQGhllUMTDH3ER6oFokKf9Rx7NuhKsijuubaItwjpb4M5ldU0AU4/TZVI5cn9oNqao3nU5SFsvOXjyBWW4vIJWO2kg6q5rmdU34fItpd71fg8X9FPKUt2wMa/bhdRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BdKQwNse; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BdKQwNse"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7dfdcded923so227955785a.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Aug 2025 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754067616; x=1754672416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwE+9sTgjNRdMVVYO7khCffe4vKwvJxjH8fF2V6zz5I=;
        b=BdKQwNse6pRrj/tOebPDpz5/au+yyTJVkZhAEihoTdxL5JLbjUtin2tHbPSdTwKDZS
         k+nbnR1YyNnEWE8XAyHqo/lk5tgdlq97oe48JGWIFhhLeW/O/XOGnF2T7ItGvxs7mKpc
         Hm2g2aS06SNiMrrCVcq9jnvLV0FryY1hWIcL9ksE516v2sOnS7IirX5sA9n7oWY4PFMV
         97zLmaElZJ+G4Its4Z6Lol3SZJAjPJ3WM5DHoLxE+N4HD9/9nMTTqhml9kpWsJV5C/u1
         GOQy3m1WTTy+cUzJqdHSZO7bNxEXRa/olGZufNJvzFSbbTHt9DWg9/K4vUiBF5NUxitL
         J71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754067616; x=1754672416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwE+9sTgjNRdMVVYO7khCffe4vKwvJxjH8fF2V6zz5I=;
        b=MAQMVQwS8kjIwAdb5PqDgk2lTcoPTkgvxYcC8jVxhcaSIzk2BPJ3YP5IjnPls51HX8
         Djz/v0mHgu0YN+JKAJ9q2EFun/ncM19DKvDCwNt5pJR+k0MFU5AT51n07fnd4ayWwB+o
         TQGmfW7u9m0L+rDnzRbnWS4ox3CMnMCzrMhGHyiTGxPuSayOI83sDXOM0Kah7OH90ajV
         5+bqYpXsjoz6t/OfiMzFeM354MMyuK2lh1TXoWcDR9X0lR4tZZ15nq7TSPgbumc1IcGV
         k9ShUuDVj0kuPb+ls+f+soe9uyMNarleDfqciI5cNnj2th3SML6rqSrUT1SL3Jhz2Pid
         uCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSxOGSUeNhy2kchLWAMsK7LvwlaHGfG0/8C6e7mRc0lNf8VgBxr5MH3DBgkzIdRfDDNhYyfYCd1YU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu7P6clMtGwEXUVOsWY5UXGXt025a5MeuLdDF6GaUi8xWxrpRb
	WjZGQS0s4Z0WFJecokZ1EwQ5gW9hbWwUxxVOEGuSp54dX/13rhheddNWm/dAEjy+iVE=
X-Gm-Gg: ASbGncvelh/riAuigwHHCLmlyS6r1RAxRg0JzzjjM0emMFeRkcRIUdjY9eHT3b/RDpz
	oUI1ub5jsxVJyV2RUAKkT3VgSf+cYsjrLN69KjCzQCnWyo6vn6JyzN38md1GU8l3B0IEXkJH3x5
	Xs47hM5ia15DXs+DRvYf7SPnd8ADa0UdPuZ2ayBrYwC/ttNCDxXm1yG3KBlXye/gbOIc2fIDyV1
	Fd8Iqdsbwkw0aj2gvo5QHLafkM71r17HKuU9whVuQG/O6MOB+UbKiZoe5WrvBRWsr3hqglqHpqg
	uSgzOsP9of1yV82fvrLu66/dQ85upMCOZnoH9Tyh1/5qdcFuX3tuC2SykKL1AYcmEc1LjoCKcld
	c03fAfacqyTzZeKgpLTdE/fkJT3OFc7avg0NpJo7hCkIPZ7tpITrRZBjrWrq6DI/9jLd2GtrTGX
	Yctr8=
X-Google-Smtp-Source: AGHT+IGeo72sFurahqpXhqOszMWIFx1nBofLsBki44tDG5x4fiYUv0PBxN8jfJdDWgnL5yoXO3nTZg==
X-Received: by 2002:ae9:f10d:0:b0:7e6:5f1c:4d78 with SMTP id af79cd13be357-7e696650ea8mr57651285a.33.1754067616031;
        Fri, 01 Aug 2025 10:00:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f75c053sm235155785a.81.2025.08.01.10.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:00:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uht78-000000013Jb-2qVs;
	Fri, 01 Aug 2025 14:00:14 -0300
Date: Fri, 1 Aug 2025 14:00:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Simon Horman <horms@kernel.org>
Cc: Abhijit Gangurde <abhijit.gangurde@amd.com>, shannon.nelson@amd.com,
	brett.creeley@amd.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net, leon@kernel.org,
	andrew+netdev@lunn.ch, allen.hubbe@amd.com, nikhil.agarwal@amd.com,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/14] net: ionic: Export the APIs from net driver to
 support device commands
Message-ID: <20250801170014.GG26511@ziepe.ca>
References: <20250723173149.2568776-1-abhijit.gangurde@amd.com>
 <20250723173149.2568776-4-abhijit.gangurde@amd.com>
 <20250725164106.GI1367887@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725164106.GI1367887@horms.kernel.org>

On Fri, Jul 25, 2025 at 05:41:06PM +0100, Simon Horman wrote:
> On Wed, Jul 23, 2025 at 11:01:38PM +0530, Abhijit Gangurde wrote:
> > RDMA driver needs to establish admin queues to support admin operations.
> > Export the APIs to send device commands for the RDMA driver.
> > 
> > Reviewed-by: Shannon Nelson <shannon.nelson@amd.com>
> > Signed-off-by: Abhijit Gangurde <abhijit.gangurde@amd.com>
> 
> Hi Abhijit,
> 
> Perhaps I misunderstand things, or otherwise am on the wrong track here.
> But this seems to open the possibility of users of ionic_adminq_post_wait(),
> outside the Ethernet driver, executing a wide range or admin commands.
> It seems to me that it would be nice to narrow that surface.

The kernel is monolithic, it is not normal to spend performance
aggressively policing APIs.

mlx5 and other drivers already have interfaces almost exactly like this.

Jason
