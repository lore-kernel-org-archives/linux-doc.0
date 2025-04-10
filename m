Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07282147E6
	for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744329012; cv=none; b=gFGt79XuaNmqBetusOlRfM8eFWCrALzHtcP3/T6EaDHdLBjTqBFDDAPHXq+5wjwM52C9/8i5l9ohzBWj94yuFG9it7vhlFmJESuRdX+atqAODQVeBjx1W73uqbWH1KqayvMig+q3YLUp+79Gxw+ZYxCP3hoi2YQZe7Bi9dGLyhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744329012; c=relaxed/simple;
	bh=/TaCDQD9gujPzgIz+tQm/iK3rlI3gN/6gBVv4SmlB8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iz1F+b8plaK5D5Hj2bHEkaDDXrotdebnPABIe7TY0/fG/VKEAFEfR+S5X5zkZL1LlZq155LBD1A2uM1nbTGv+9jtU2cVju6lIKfmCA1eAmTyRufdxhstZk6Y/2y2S5xZ/X9oEAcneVu+JCEtz9DLr2Ps8RmnFAXeh5P4Vqa8lS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=G7szoQni; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="G7szoQni"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c0e135e953so155624285a.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Apr 2025 16:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744329010; x=1744933810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TaCDQD9gujPzgIz+tQm/iK3rlI3gN/6gBVv4SmlB8g=;
        b=G7szoQniuDaYE9r1VZifZJkSrvwcrrp5IEflSaJx44rzXepOe20MWhpWsfRm/Giz+8
         XqGqb4AMHIz/DTsGheZEag8RcG/gX1zDKffshath9cFAzTgfOKhpUuQg4u75vXpi67vh
         ymM6oBgbYwWGuklS7TQJc9hHVKuzCl+cRlww4XAem3Rq7DZAkCu216Z0zX++uJ9QDXv0
         PMdurGnVq6AO4kv7u2yvghn58wjK99AlddW7VXY3d4cdUSlMhs5j0JWhh6t1PbuQb3Y0
         1ii9SrCcRZJh+i7OiUwhAUscON72y0oHob55E9HOheDaRGa9NQbUaBASgdOXVSN3X7ik
         ytYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744329010; x=1744933810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TaCDQD9gujPzgIz+tQm/iK3rlI3gN/6gBVv4SmlB8g=;
        b=eU6W3uCYyWVWhtvB8wUG4q04BZW41Z4mmRNSAI6N6Q4R0n23e/iueNgRHRjtUef1LN
         eJK2Ahk3wMzhLdo9Z+3FIfsCg4zdYS6OHFe+HHQrHwa5qZsiR/+9jiFqIFbfuf1amegV
         +aDnesVA9pUdDlnyv4Gji69fa2Vy6IblnfZJFnfI8Il20+LyNvH5B/xO1Lo1bAXAC3BK
         6U3fq6FhbAbsxZ1SZQm+l8aRrgIYXjjDHzTj4C1cgisoovIQ4je11n3XcgxUMK+limUl
         H5/7fGVCiq5jexEdBFQ4naEPKynu4cczDGQzS9kit0bq5AUUfpsLVJqjbhlzHKQTDbnE
         dSUA==
X-Forwarded-Encrypted: i=1; AJvYcCVKvjx17Tdguwi4CJjT6iV3bVc39libry5s+czPfEOZE7fxVs+A0iOx686t8p3BZQn2BBxhSUL8K8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwtktMUZljWAsKjI+bPb8GtH9IoKBL6kAZVqyT+CwT6Y6mdXn
	gNDSOZRitW15Uxl3lV1v/xVnp7rOIPWI6LKSwa2F96QmuUSeiW87m1GESE1ZnH4=
X-Gm-Gg: ASbGncsV8mc85d9wIUfXK/me8OauLQW9bAINrgRLnZ0NUHBLZ2K7AsCnR/vUwT8czWb
	cjPMmaxILkpfM8IQpGKkzIj9fvT8CFZ9H0gAMfLizzjvDOAsFKXSpf6WxxxdbVnp3THLgiYhVYu
	r4uwncZHVaK4z2gD0700pR3K9z6ya2yyKYjz4kwa8DzaKLMkag2o5D72D/3um/FkEic8eaJOYPF
	apgymhEwCmqhKG7S9AC/x79glg2nj0iTPI4gmRLqqoIPM1q2pDMq98IKllZ6IsbAGQIKvBxdujN
	kyzDoZ9kh7cnHxE0b5Bp5LhzSLsbLxX5b5O+GQ3Y+WS6tiJ77ofZvGkB7AdXo52s9RCDuK4F1nf
	rsL+BTZwdyrra/6RQxNY=
X-Google-Smtp-Source: AGHT+IGBLI6Qr1HBGp7OT4pcrwS60eByYVaVonZGYRx+m25dpRuIj9JKldOpH5t3hWR9bGfwXIeN2g==
X-Received: by 2002:a05:620a:c4a:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c7af0bd257mr150080685a.1.1744329009833;
        Thu, 10 Apr 2025 16:50:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89f9639sm169568385a.78.2025.04.10.16.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:50:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u31eq-00000000N6G-3QH5;
	Thu, 10 Apr 2025 20:50:08 -0300
Date: Thu, 10 Apr 2025 20:50:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Roman Kisel <romank@linux.microsoft.com>,
	Robin Murphy <robin.murphy@arm.com>, aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hch@lst.de,
	hpa@zytor.com, James.Bottomley@hansenpartnership.com,
	Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
	lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
	martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
	quic_zijuhu@quicinc.com, tglx@linutronix.de, wei.liu@kernel.org,
	will@kernel.org, iommu@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct
 bitfield to not bounce-buffer
Message-ID: <20250410235008.GC63245@ziepe.ca>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-6-romank@linux.microsoft.com>
 <0eb87302-fae8-4708-aaf8-d16e836e727f@arm.com>
 <0ab2849a-5c03-4a8c-891e-3cb89b20b0e4@linux.microsoft.com>
 <67f703099f124_71fe2949e@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67f703099f124_71fe2949e@dwillia2-xfh.jf.intel.com.notmuch>

On Wed, Apr 09, 2025 at 04:30:17PM -0700, Dan Williams wrote:

> Like Christoph said, a driver really has no business opting itself into
> different DMA addressing domains. For TDISP we are also being careful to
> make sure that flipping a device from shared to private is a suitably
> violent event. This is because the Linux DMA layer does not have a
> concept of allowing a device to have mappings from two different
> addressing domains simultaneously.

And this is a very important point, several of the architectures have
two completely independent iommu tables, and maybe even completely
different IOMMU instances for trusted and non-trusted DMA traffic.

I expect configurations where trusted traffic is translated through
the vIOMMU while non-trusted traffic is locked to an identity
translation.

There are more issue here than just swiotlb :\

> A "private_capable" flag might also make sense, but that is really a
> property of a bus that need not be carried necessarily in 'struct
> device'.

However it works, it should be done before the driver is probed and
remain stable for the duration of the driver attachment. From the
iommu side the correct iommu domain, on the correct IOMMU instance to
handle the expected traffic should be setup as the DMA API's iommu
domain.

Jason
