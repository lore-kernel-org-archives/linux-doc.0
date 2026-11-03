Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718626;
	b=eyKV7NP7V8R62ZkqxBoAkYcrMpxVc42s/+h3tuUl8nAcqnoCeEdLARhcbVV5UtUAbY9P
	 uHe4dbmQSBYTI8VgVOfiD8Nm8cSR1ip+LLM013tJe38UD5RCtIQ6O/21aDoeo3dMIwTs5
	 lazJXDhWrMksJroMbkbVyJrCSAoQH5HYxgLPBQ74r23A20P77m3xFSP2LqMSgtX7MkRTv
	 3s9a9Sl/KS15/bXwInhM3zfp7nKKNr+jE4LladsluHN069NBXq4k8pHsaujNBXmCr8dwl
	 BpckZIxcjOTywpl6MENrlLopVo4FiD7TLWsXqjs273ncCqbV40usT7nTl0OMW4hvwig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
	b=y5muTUd3vIC2g55qCAytpMPHZvDR4F3OeSWw/HNWJ+TcQHnEXUiDIZwVsX274KMBLiR1
	 U4xA32gFo/uWN3xdQrCn241b/4ApKhMA/J/RjmMXn577nXBbzZVHy3HooDbJ0L6RQ6wwN
	 ODI64NsnHHe7sm6ZA74CsIe6J1qoxFosy8Vw2u6QI3zcOJ3tFIErIbnrnyhbuzvFjcpUQ
	 OCFHqmuIscK/o+iztG5YXqUfDjpqpcIbzjAVtTjScGuvhk4zCSgTQrnd+sg7KGgkxtigA
	 uB5kRmRbJBmU5myPESjVCWqnfb2GKAuLl22uIo2wuslU7o0JaplDfahVbXgMgCbsrYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=M+V3Eapy;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67B606BA25
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 15:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D67B606BA25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=M+V3Eapy
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5365f9a04c5so70842741cf.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 07:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793718624; x=1794323424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
        b=M+V3EapyX+HqP1fKSJAlOXOQNSBl88VyBTDoawq7gz03CsUQazeiC6Mc+WP+qPtVQn
         UsqVNPLGFj0ef4KFNPZ/tU+07pPNs80lTiQ6+n9y3KoIryIZUUn0L7chcMupFsfI6odL
         CzzKK98n1/SjNmyjDs3IfYnctsWfNLJnpnGOHZmE9A8SI8N0VwUOPtMf+WIbTPBmV1bH
         6KQ91X8H80VPkn5TzAK7Oig6tCiR4ItroxMh5i3IT0X0RKXWkI+3rGyo3oFxpQO/Qb9y
         wZtp81G5ndgrxz6ERStz97IUJBMou2SyFiM2zcPBgA1C8yID7aBtgzm3Eez0211myTs0
         WVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718624; x=1794323424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
        b=GTYIVybSkcULu/eCVkikyxqYu0S1gMOZCCxYEnMVRLarw2xsjIY78Ioq3VLZP0VnuT
         b2uqh/oT64vcBveW+dyFHPzTU5YD/MdEfBxSrRSHjnC11SIDDHjkOQ44d4Ez3Zu3R7dI
         ebp66qzv6G89hLJqRlDTvRiwxYlJL+oxkDlsE4vm+mRfaqVBSgjOSzyw0hdKSTBAM3Br
         h8Gy97He3HByUX4w5sJg+kXX+YBf9NEUsPytJKmdKXAZDwe367chtr0XRzCHHv7JG82y
         oSW6DryXD22WARtPz27/QKmKv5syWvuOZqsKCZ1AZITcUIqoPJ23m2SH4GdVrc+EE3+T
         Ahrw==
X-Forwarded-Encrypted: i=1; AKwUvBxDIHs05OsZCrd18nFbg1F/mosYM6hB3JE8FWsGeSCMHq3bh5KKcrlKXF12gNq3bZygLut2ctG3If0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dhbvqdai7EM2vUONnn1cOPDssSOhl78l8uX9pmm7cGN887MZR
	9nlvyQ0eV73elSP/DAWH1PZpyagAKDwt65G4/iaLu5LX6wY71wgKF2bbu1VVVw98ph4=
X-Gm-Gg: AYBFou0Et2yKfBVAEZMTBIaXr2lP5Lg2pPDDqUXvvhK8EBIwuOe9d3BQEdoqnBtzdwy
	VHz/GfWXNM1dOLfWdVD+hduQSwjtNLI07dZugcpUlYgW+IuvdwuadZTYNFuIze4GBtl1YB4CsUG
	nnsTUyMktI/b1SE7rkfJ5hT5/Vg8qmU5HlDLMQ9ctyPYOGMBxp70Q6zkGAkaW5ddvua1hCvRJkT
	nuBgdy9fzuVUrGmd/QYw5uzzbMHoN4GQG4OnpAUwzWMPwhbn/NzMiRbKQWiUkbsVPpx4ySyaTv1
	6JWU4MyhXEPY/plNARcvSdGmY8YzrpeD3FCuHG4ClwoimJ2f4ruvJTdCIM9e3vr2OHrIiZqvCud
	GbXK1UPIJiuqMhWqMITOKfEzw++gF2cdVyawKPTxsy5CiuAdEcjgvkkrrtHWKp96VDF8ynF138m
	2DXS1kT3ouCW1sNeChfMjTmThHGLqIBm4qxgu+DCA7ThfQSAl6Rk8niZ91fvK2stgfF35HfRUqw
	k5OgoQ7zXpxyFv8sznC5lHEMuiGx90o8VQ87kE69SLjukWHjjLqGx7AkXML1TziJ8kBbjKrVP4T
	9T0X3DG4ym2/Gi1MgTJWYhiAGA+1CZpoC+0fYw6vubFjEokqDSihNOsqjyJYEXFZ/3DR6ta21iO
	XGHi4JFfXZA==
X-Received: by 2002:ac8:5a06:0:b0:536:26db:d4e2 with SMTP id d75a77b69052e-542b639bb42mr236124421cf.15.1793718623983;
        Tue, 03 Nov 2026 07:10:23 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498b49dcbasm27980831cf.6.2026.11.03.07.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:10:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOG9V-0000000DAq9-0szH;
	Tue, 03 Nov 2026 11:10:21 -0400
Date: Tue, 3 Nov 2026 11:10:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Luigi Rizzo <lrizzo@google.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
Message-ID: <20261103151021.GK3889730@ziepe.ca>
References: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
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
In-Reply-To: <20261103080933.GA4213@lst.de>

On Tue, Nov 03, 2026 at 09:09:33AM +0100, Christoph Hellwig wrote:
> On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > Disk I/O is still potentially affected by the same problems
> > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > in confidential computing...)
> > 
> > The disk folks already have a proposal to address all of this using
> > io_uring and preallocated buffers. I really doubt yet another version
> > is going to be interesting there.
> 
> Huh?  If you mean the dma-buf I/O it doesn't really have anything
> to do with disks, except that this is the first user.  

Yeah

> The dma-buf iovec can work for every ->read_iter/->write_iter
> consumer, and should be adopted more broadly.  Including by
> networking instead of their own totally weird different world.

I'm not holding my breath on that one..

Jason
