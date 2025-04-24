Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC84D27BF71
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 13:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500097; cv=none; b=iYkO//I07sBi9eJl7B+ry8tiNnfgXy1Qqgao+A7ZZ7vyPRUDctMmd/aKvAQqIU19hlYQLUFivWnRMHoLmCsA0p0B/yuWCTEuPYhCiplrgW89cRUvojEI6uD7RSsinvMUQ6Cbt33BqB0nzvGCSgzjc326JIMSIC0pYNUlAd7BzIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500097; c=relaxed/simple;
	bh=dBh43d05JPaTFzI4tVAr4KW3VJiwFVSs07sUTiMBl3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHUQ2Pj6cvcvYFwWtgRAp9v6AdSYPu4PxsFCHwSL3nYF86Qexk31VWXrpEqdUWtVu9uICx0Rz8IgRYA4Vl1by8PYGRYt0DptBiQrDQvgbG/y/54P8nZEdgPm+84pzZd2/5VuwdzmwJDu5i/NYjYGVH/XLCHF8QScxv62bardksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=gmc2XK7y; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="gmc2XK7y"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c59e7039eeso146059785a.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745500094; x=1746104894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t9tjejH+aT/nxyoiEDM11iJSGPvdQo5zscD8cSUP0nQ=;
        b=gmc2XK7ywcHfJhe7Xx9/im0XXRHXrVay6vPULQELd4jmwYurJ6swWAB2Mm6HSTSg9M
         8tSirpMIBuBrqE/dt0wk+No3C5395so8+zQ9TJFRwSYnAOk4sMx8YPJRyCDKEi/gj19b
         //SyDxACsXkSDkc+KEf3RPc2Z2CVctAiER8Xjg/fHSWz8dT6Yb9MeIy5O/FVHy34LBeZ
         9qrlbzJP6MlTxLVzhIYsW2/XvSIn22aY8Hnqf40MrGBNs4/kKn6DVysvxFnq544XGysG
         CSpwLMPbjonk5Xog8xD4qFTsO4dR17F6j/l/3cFaNsX0PI8/mIQgkGA9ELrRoXu5vwkx
         3QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745500094; x=1746104894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9tjejH+aT/nxyoiEDM11iJSGPvdQo5zscD8cSUP0nQ=;
        b=Vm5/JOIqd0k/wAgwRRSXWTq0KzyH8nYfHp88vs4wqmqTMTNJ3SbZzPxnxaXtsfieJR
         7VOd8t2ihaCbbt6T9Q0FdWKTdDHpHL9GFfZGwwBzYNfk5i5ecYXu5NqZLBaFO2s/E43q
         4Ck/hhYtJr3p72OeJEzTO9vxn2Hxk9V+FILexhJBy0hSvO47V6TPB2di/dn6j/mG/MSX
         b2oWoSP2BTiI8KQ1GCOO9uKHy2hUhMByLerYEGUtojH8jaXa2dIW+lo6Yy8OWDuoD3U3
         1kWQ1aZ2WzEJ0ZFB1lTgUA05BtGc1PVS32vonEpCtMmwoZGfhCHGczc2ZxxPelEZ+4OF
         73iA==
X-Forwarded-Encrypted: i=1; AJvYcCWE/ocADP3xWr1EGpBpxmaSQULJP5sC1IYIKg7xkKjGojFKct77f3kPkK/Nx2iJw9KYI6q9LvSvxCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxU5veKFsUN1m42NUl4I5ktT/rltjBE8/URKUvIS5PTXsLmYsF
	ThYPpjSSxZKQxtdZWd8updj9sEUO8/oPY1hr3oxElXFRBuRMO2dzIdUvsvTW/bM=
X-Gm-Gg: ASbGnctZmYys1VzODLoDYhXbrH1XJ1f8Qn3F/HdCMDnsDfmdKvSr6sfglU11mRoBf8z
	/qXJ+OmTayp3y684E0cl8GwHAgEk2didIbBBa3J3ZS0q5ygr0CWS17WuWlpPVCUNayJSOAP+GjC
	qAuQnIx5MJJa1YMMiyxbfobE/8IIMt47OldxI3MoOuLyrq5jniikkZZqAPjRIuvjbgFB+k/dDdK
	D3YHFrvgzUlU/99U90JKe7/dFAcnsgen5oMDa36QRwPA10qmU4SAe2I43auSs5Wy8roegJp3JDK
	HYHq8PXpjXOHjnccROpIXdtNB+o2JOrC8FcFUHBpymV03B0rVV/3KhzJJiAqdVtuwczmVnfQPR4
	hNjIMwqqO8cJtnikkaxY=
X-Google-Smtp-Source: AGHT+IFf1O6xGhdHKl6+2HV6nVAPSFzlmWIRSiCQgOhIrXIGUIOWfO/3KcZH+AEpqhBBAwnRKtBRCg==
X-Received: by 2002:a05:620a:2442:b0:7c5:5296:55be with SMTP id af79cd13be357-7c956ede013mr373709185a.27.1745500094571;
        Thu, 24 Apr 2025 06:08:14 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958c92188sm85129885a.23.2025.04.24.06.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:08:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7wJJ-00000007U7r-1YtD;
	Thu, 24 Apr 2025 10:08:13 -0300
Date: Thu, 24 Apr 2025 10:08:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Abhijit Gangurde <abhijit.gangurde@amd.com>
Cc: shannon.nelson@amd.com, brett.creeley@amd.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	corbet@lwn.net, leon@kernel.org, andrew+netdev@lunn.ch,
	allen.hubbe@amd.com, nikhil.agarwal@amd.com,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Boyer <andrew.boyer@amd.com>
Subject: Re: [PATCH 08/14] RDMA/ionic: Register auxiliary module for ionic
 ethernet adapter
Message-ID: <20250424130813.GZ1213339@ziepe.ca>
References: <20250423102913.438027-1-abhijit.gangurde@amd.com>
 <20250423102913.438027-9-abhijit.gangurde@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423102913.438027-9-abhijit.gangurde@amd.com>

On Wed, Apr 23, 2025 at 03:59:07PM +0530, Abhijit Gangurde wrote:
> +static int ionic_aux_probe(struct auxiliary_device *adev,
> +			   const struct auxiliary_device_id *id)
> +{
> +	struct ionic_aux_dev *ionic_adev;
> +	struct net_device *ndev;
> +	struct ionic_ibdev *dev;
> +
> +	ionic_adev = container_of(adev, struct ionic_aux_dev, adev);
> +	ndev = ionic_api_get_netdev_from_handle(ionic_adev->handle);

It must not do this, the net_device should not go into the IB driver,
like this that will create a huge complex tangled mess.

The netdev(s) come in indirectly through the gid table and through the
net notifiers and ib_device_set_netdev() and they should only be
touched in paths dealing with specific areas.

So don't use things like netdev_err, we have ib_err/dev_err and
related instead for IB drivers to use.

> +struct ionic_ibdev {
> +	struct ib_device	ibdev;
> +
> +	struct device		*hwdev;
> +	struct net_device	*ndev;

Same here, this member should not exist, and it didn't hold a
refcount for this pointer.

Jason
