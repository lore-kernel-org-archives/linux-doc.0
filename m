Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6240D259CB0
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503689; cv=none; b=V+CAVJ8izmCYhUDq2axRTgv+yf62t05h9vXf7ghcBRmxJNRNwP3koJCeA0pGQVNL32ESLVS1fE7ZTLVl1yWGzg+3pqLOU5iFMvQA8ypC67dpGzT7NNZlk+wM48ACoWvIYv7xYBQw+Tt/iN1T9cdTT0TZx5jrTNGsKZRLYm2hL9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503689; c=relaxed/simple;
	bh=x4VH7WP8We2sREpSucr6S63/HIKE6v5vuALeoeU1eKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqVY7FhT7OyDC+Sj+wAug9Prl1BOoWb3CtN+mq7D26OGZKW3wB0YhhKUZpH5nKZmvdpqFqa9nh1ZcKKeVhehhbfRHDu6hO5YHa8nN5xeHMMg07dmSn6FIQYQUq2MilBv8dzZGDhVKybfOdRo9MNkCVGNe5FRj92wUaI8DDNPNtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AmWuMjaD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AmWuMjaD"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d3dd14a7edso620180985a.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752503686; x=1753108486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sZ/uMtd7PeY7ArKUEfzEaQhJJ3owfAv8oDZUoZLeu20=;
        b=AmWuMjaDAhTE8Qz8oOABGBiGJh/Lzrn3OUIF+otBL7hL1G931+0x56xiHyr/QkE7GL
         NNhJprZZ00o3CHkvQv8vZqsc+Uph0v3iBNKgPrMYVRHhtoar/twrOQbIXENuJMutm/lZ
         rXi72Ydx72JOyES+gojbLVxlAfboGgvUmMpsh4lY25kg19Z7NYmM4xcE1LQK9Cj8/sp5
         zzKuFO74Jo5QchP7ob8f41D6LKfdquDY583Jt2ntmwH5D+QfTsuyYyJFY1yVfhyVA2Zs
         m2REWJpv0uuponGmvwUX2AXH3qa3kPRLZsap7dyTQ096V7GSlDzkAsHBwz6N3BA+wPIE
         nk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503686; x=1753108486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZ/uMtd7PeY7ArKUEfzEaQhJJ3owfAv8oDZUoZLeu20=;
        b=BwKxhLweNgTAMONP+xs8VqA73bKh0dVmdMY7kgkADFHVfdUqMKoP85BmceuGHsfvQI
         P3LDhrkFPyB/7DDWa+5DREYtwKOT58TH2CadT6v2snfFq53zvYEPb3/UwTHjLJzE/OUi
         CjdCWhJM8PaouKzzrAjiUiE/ub0Ao3k98nJu0o74pguFANUCZYy/yP+pAHM9Iw7Od3/V
         GxaUx2KIDO30DPRIxT+8XJjvSWyqMqDF6MS5AZcJ5GkW6x3A/E0hLjRKHaisDK/ob7rG
         xVluCD3g87w3qNVBVJReps5UvHXOSpbpUyiTw0nSjAQfldAPOw0+SlJd9dAlq3B5jBpP
         nIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrm5bsoTLZ1s3t/2DGbB1N8cW6Aq9YfZkcHLCuCwc2r2apV2V7L1a5qogGFqg81VRVVP3xtJ7qS7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUh/1EfeTzlhiFfsz6VCCSEDxkwVBafwwjnY0tbbmfxBsKbPsX
	TDtnq6J+qyqXDXNwihR05t4Err91wT7+B+wGZ7SLCS2we3SVQ12DR57InmchoZaiD24=
X-Gm-Gg: ASbGncuS+5MtjLMjRoNFZ32bdQGG9VE1YDp0yZcGUsEAjoSIGjSUOycFnc9W8jKFwiL
	ZEE9K3+4gUPpMG776CDDzB7o9u5j9ACcIPTW8q+sLWvicYQk5RA/+lVg9/nJ1AxnXjEt4J2FPXu
	bpij+CJVYWl8V2vTMjyNwEz90SWgnNIAqJdPz39nWr3m3bmr/df43Nj2ZB/b7gu7y+24QLrqvlj
	HuzixszK4xJ94ZcYwRat3CN4aznHA01z3Iy6PO0yERPw7o0PFnVSU6yaKrUOOjceuUUpXy+DaNb
	1sGd8ckoKUayBO2tMnSgCwMlaMCxwYOfMndjEatV5pJa7qW+08QvROhJmYUxRgx6y1cnYvb7/Tl
	0r5+FVSvxI4eW9LYNYF0SnX5+/16Fe+mddiDM7mNh+UDNj+lAVF9yFgA5lbx5VfMfFnGc8xzW1A
	==
X-Google-Smtp-Source: AGHT+IHDPqyfa5MILfbuRhIA4DZi+evKn5JL2EKdUIYjPKjjIxXzRswcxsKcTqlW4cqrt/sU14Hkyw==
X-Received: by 2002:a05:620a:4613:b0:7e3:2ec5:69e2 with SMTP id af79cd13be357-7e32ec570ffmr287943285a.28.1752503686149;
        Mon, 14 Jul 2025 07:34:46 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc0f5d42sm515494885a.28.2025.07.14.07.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:34:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ubKGR-00000008ft9-1MVt;
	Mon, 14 Jul 2025 11:34:43 -0300
Date: Mon, 14 Jul 2025 11:34:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, jasonmiu@google.com,
	graf@amazon.com, changyuanl@google.com, dmatlack@google.com,
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
Message-ID: <20250714143443.GF1870174@ziepe.ca>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com>
 <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
 <aGqHFkPWOrD6whv6@kernel.org>
 <mafs0qzypys0j.fsf@kernel.org>
 <aG9rNQ277weSR_dl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aG9rNQ277weSR_dl@kernel.org>

On Thu, Jul 10, 2025 at 10:26:45AM +0300, Mike Rapoport wrote:
> IIUC Christian's point was mostly not about using VFS APIs (i.e.
> read/write) but about using a special pseudo fs rather than devtmpfs to
> drive ioctls.
>  
> So instead of 
> 
> 	fd = open("/dev/liveupdate", ...);
> 	ioctl(fd, ...);
> 
> we'd use
> 
> 	fd = open("/sys/fs/kexec/control", ...);
> 	ioctl(fd, ...);

Please no, /sys/ is much worse.

/dev/ has lots of infrastructure to control permissions/etc that /sys/
does not.

If you want to do ioctls to something that you open() is a character
dev and you accept the limitations with namespaces, coarse permissions
and so on.

Jason
