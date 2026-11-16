Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850961;
	b=ThIeq/5jK9Ep5/oN2U/Pxog8oSD5zzFWMl2NgviJyC2h20MVnbYMqwT0fVb+own7f9tc
	 rkyjouCs/PiHNgugKNBCIub7DjUB9DHR6qYmxlfectB9Zuw19Sf6t2Hah6nL5nRRxGBVO
	 PDTmYO130Yb9V1aHrOYVcu/AnCeavICre9CVWP2OhcNQQnR3Igztp0+EJNruu+dE7E7nh
	 sB8YwyYgXtSjvRXT9Fa5r47yYsWnE8fwCeBm9JIdv2aKBK5I2kxRujIyORar0TI7Jbf5i
	 QbD1ZgRfaEzoQakaXO5WN4RAYQB89R1jOBtJvEQiE5rRqO1OtWO1VwOW/jYXHXA9jZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
	b=RQaO5ZuxeH49KVLX6wRZcRaY3CCoHgfRYA4Jsdpy/2xXlOxZPSU4YVTsrPqEtQfpqLpV
	 hl68aA2Gics+LWRUslL8XV8HxZamQOU/3/f9YfEDrqG9PwKNpBBS3lQjbae9hU9adhcmH
	 p+IsgmeDuR7QKBY4VlLdA5d75uftuu/B+4226zDrQVIlAFciNDQYPkG2uUq6QiURK0kor
	 g3E3Gb8p34RUi6IkTUdiuGRzBaR0HnxzeoNkxeBKVsJCm70cb7+RqEFC9GNfWNwDX35TT
	 3DfKbslmjA3hl5xfiMlqobntPWlHAEaPaaUVFVM5X5wsyYANl+gD4C2IPmiTfI/32Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="k7Z4B/rJ";
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49217606A334
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 17:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49217606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=k7Z4B/rJ
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91ec396c93dso67689116d6.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794850960; x=1795455760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
        b=k7Z4B/rJV4BYSUn5DoRoCZy1plPwC9x9ovWb+QgIDH90LhQdOFFxPVKW8y+1D9G9U1
         dNY8XVweGaarB2H+Mo7+Ljohv4m7UtEMEOmREkcVV7D8kB073e4yluVQ3yHRLhBQRnee
         4TqEgTAlDtU1ys9YubCtkkzdgVNxjSb/z0ZOeeMy+Dto3b55aymi8viQ9OFG1sW0DGih
         8D6jlFgrgUETHCS5Y/tuPfdN2LnKjoAPDH5mWH9pRi7ZNxryEEPrCdvQ8e7Jdo25dOiS
         e4eE2v/9+zfQbQDE11ZD8kbUMaw71HaObIFAeMHeeeBCI/kUSTVNlSkktEgKUO5axUxy
         0psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850960; x=1795455760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
        b=LSfeomV+qV+NAKOtjqoELDp72dbdrOHz0A2H1ojkSvfRtXHEiXRoqFNootbJYrHtWI
         ELegMWeRu1CwGvJ8jXOHsuugXN4ggw+QVnkXQgc4tmmxy14IPu+mB2PiRnDzOmaFXk1S
         LQB2/1P40IQvUjyROSMhdwPzbKuqlh5u0Ay09IXv5MhLwCzO77eV6XOQwfdL5zpWcI4Z
         RDEzyLZqG2LFRjMTeJfMv8xoKi2xQlkhmU7Ek/qTqJOxpYc4wYAWV0uMTq8ug7mJxCiq
         04+j8LqoUhI4S0wk1qhWsgFndT+ysyPsoBsNCouju98tbR3H2QT+RWDsfCJelHltwBnA
         vLpQ==
X-Forwarded-Encrypted: i=1; AL+hErFsbpQ9al8hsjfLKDzUO/Ad3olj3s/hHadn7zQRFLuUZMK5zeZ8NW5ZYno45aSHlb4gUobFjYKkq4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5zuSHSNX3zCIYO9ItARPeeclSTVwzVgy+CbfWrvFuoA+2KkkR
	kbV4zmkIMCodpjtQVIGT2rRh4hMRiPN6rM4+MMts3KHj9w0JErPA97OvXPQbQIgAdK8=
X-Gm-Gg: AZFdTZedqChqWEP71VBjfVBXSQiwkvTSCmaNd1gq54YOddj5rSRwwaI3q8KzDk82TTi
	/gEkdzM8XrwxTXXSCZ9wp9hdjGCFJJvAhDpV9eLLERoSCbmTr+Wg9tKdOPWw1zGbdtYkHeXYBF4
	YNZTEPxr46+Diw3HImYZu8nrigQKaUVh/9fFcVU4wAoCJJRnmWiTyS+iQSx0iBfAkSj1AUT1qAc
	Zv1wItUrXLuGC5xOPkpVzt5zN9h0tlUriEGmovKkrVJE+hcgeU2u85+1NBR9fQK9rEozBztqqcc
	MmhJtORoxTLjf/LkuJ/UsFkzcEAKPjuWz6TqOyjjGsEGvTDOoiCN9nfsDP42M6qtW+8rNwHu+Mp
	H+x/el5k+9zOJBMdnijsD4DEIyPaFGfxsyU/ZyfKwaV6UXMPdQwXGr5oIqOIAX+RhkHOwRMJ7V/
	bQIr7xyFqY2TmKVXGqaZnXzTv4MB2hx5IuISixmoYo6b8t3eBxcP2F/6DuyBtG+DX9JW4/4Zm7Z
	xZJPxE2J5jyqziTlCv0pA0v/95WjFi0qchPkX/4uguYD+EB1+Lm9JGFT6rr6ra/hwVhAV1OHK24
	j8lrjg==
X-Received: by 2002:a05:6214:4698:b0:91f:1004:2ba4 with SMTP id 6a1803df08f44-91f2400b38fmr177678706d6.2.1794850960144;
        Mon, 16 Nov 2026 09:42:40 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73206sm91150276d6.25.2026.11.16.09.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:42:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT0j0-0000000A2D3-2QWe;
	Mon, 16 Nov 2026 13:42:38 -0400
Date: Mon, 16 Nov 2026 13:42:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line
 parameter
Message-ID: <20261116174238.GC2299285@ziepe.ca>
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>

On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:

> Instead, I propose handling this in the generic IOMMU core via a
> kernel command-line parameter. This makes it available uniformly
> across both Device Tree and ACPI systems and across all IOMMU drivers.

Something like this could be useful, but also Leon's series will allow
userspace to do it from the initrd too. IDK if that is more/less
interesting to Android.

>  static unsigned int iommu_def_domain_type __read_mostly;
>  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
>  static u32 iommu_cmd_line __read_mostly;
> +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;

We can allocate memory at this point.. No need for a fixed array.

Jason
