Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF551A262D
	for <linux-doc@vger.kernel.org>; Sun,  3 Aug 2025 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754236751; cv=none; b=iliUH7af04e1K1go2tlEgX75s0MUPUAbs8s5CV9u8YV/iq79Dy234pOEbB8c2zr6njMFEKh9gueIbgR7jkULAKauHdTVejEEckKzsV6mB/yTXifCuqWCrxo3I5TWApxrVpiZTrfwpW6kCgutZC9WV9gzlgKwZMRDyDN4gxqwSjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754236751; c=relaxed/simple;
	bh=dOREvHopvvWFJAmzvvzH1bmzFboHl3N3LTpx6CxCqIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tL2/Z631J4iHAd0FVmbnrIf0HfRfaBaD7roM9iTr2i96i1RJ4Pbk6CETSrAVKTbppZ0oVizqpF6ggd3DD4ZeQqZ9wwfPSuWKdieU8/uh0It3eTmxSNQ5ZkFLtq9CvHQ2ARKrgbwDTUn81pVbwvPoLIe7yp6UaSVWcfgTJ9amJ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KMDPVIdA; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KMDPVIdA"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ab61ecc1e8so15770111cf.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Aug 2025 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754236748; x=1754841548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8slyx6E/zt3CNU5aqFjzFMTLA7WC2ifuj8UOdB6q15U=;
        b=KMDPVIdARilgqK3RMMd5glouvtAaCr9HTwIauc4NNLefJxawD+ALrvYggtsC9Dl7E4
         pNwknN7gAtEwjDhJnM+MTNcHDKAVg16gS9Vt/wQsO/dDyHm4bsi3LrZ/20XPb8hMUekA
         VZ4SnuFHk4SJet++wjKqjEU4ukpL8uvA+FlM0x+eOBkDigPwXHZTvuRqzlpyGKnKzBpX
         7bEaW2zH+j9e7r5SYgGp7iqoE8oQF8/ivChUfNyh1qAczs3TUmp1W1KtAUchZutZNd08
         v6cijSARkRhsTwrWo/HQmx35s2a3y9XADPwa5phrBfDgGwt45LESps7CThCMAmssJu2U
         DzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754236748; x=1754841548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8slyx6E/zt3CNU5aqFjzFMTLA7WC2ifuj8UOdB6q15U=;
        b=a8pMCcxB0GJ+yqvwDjI2lUIrDhgmYEgL5egjCmD0VRR8XFJtf6Q2VbEoSui0/HF1FW
         xUHGL1V3Lg/vmnFUrM9Lshw7++JE6nRNs+sy/3zSXFVLiwVTYQc0VM38X1vnXRZpoHc2
         TRj67B0eROip9zhSyqm9p+U98oQaB9MTSnwZ5g3UaXlDSc2uTgjSKRvnedsZg9xVaKVz
         BzvEN/zNlVn+IpA0rsj0sI63SWpOgqovrBLGIVaO4U6wRsfymcYWVgQTmnUDQcWmH5VL
         CXKpbKdRrDW8DgRJ1BLpfvbZEtP8uoogMNwjYbyUTX+atDx8g/5GvPwbUm7+7KAbU/fS
         9IzA==
X-Forwarded-Encrypted: i=1; AJvYcCXjITeSIZLV4aYywJn1sZGubrpx1oBnc5UsdtAIN9YIDdThBpvFYhkQeDZTybGU2JMSNfRDlZvU0Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrQCpEwDOAS/MP0AUY60csGyuDIRdBuuzix0OKYKx8rnsfPjj9
	JMdUIE6j+XFWaD1qbGYE8tbvYVLQhz1a0/YYFqAgD4K2TykZdDPXR0GhD8NHDqgoe58=
X-Gm-Gg: ASbGncs3c61YcvMM6TF+qB+iV5A9/UPvfQWP5GcxUVX3eJsMuQemQrKYoVUzuhOFT/x
	dDKM03BwrDuML8yEQ93tQaCmft/uGIrbBn8tBQllhaM7pc67OrKHBsS9kxIkfnQr6WCyDxXv7Vu
	ygLqieTZQRRI51rPN/zZa2exZ7qfelh4KplYhD8OLfUKlhYh2f/XL1xBcnpJF/mBWJjPsH9L3MB
	QWIpkJRzwYZqwh/9M3B8gMIh0H14c0lg0M8wwZa40amR+QnFbYayhQ0O+bq74h8R6i0q8Zf4vIO
	YdF9hPDmuRVDe3Vmay0NzrR4OBDSI4VBaAFikRKt4hCpiDW/fJLEdHchsvZNoX7U9cU13Vkwrva
	10VCN1if45lpfaClixDe95ao+0QAS4YWfMDhv1WaGoxlEkKm1jFH3I1J1Ybr30g7PQovK
X-Google-Smtp-Source: AGHT+IGXTSS5qgdnpS/eJ13tqSItmWfAUC8meUEvOe7mj0qBpcNtZfptB2QZRGNN4fnSPsBSKZwvXw==
X-Received: by 2002:a05:622a:1dc5:b0:4b0:6da3:26df with SMTP id d75a77b69052e-4b06da333ccmr13497821cf.29.1754236748067;
        Sun, 03 Aug 2025 08:59:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4af01e4aa4dsm29318401cf.23.2025.08.03.08.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 08:59:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uib74-00000001Hym-2XZx;
	Sun, 03 Aug 2025 12:59:06 -0300
Date: Sun, 3 Aug 2025 12:59:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Message-ID: <20250803155906.GM26511@ziepe.ca>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
 <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
 <aIupx_8vOg8wQh6w@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIupx_8vOg8wQh6w@casper.infradead.org>

On Thu, Jul 31, 2025 at 06:37:11PM +0100, Matthew Wilcox wrote:

> The replacement for kmap_atomic() is already here -- it's
> kmap_(atomic|local)_pfn().  If a simple wrapper like kmap_local_phys()
> would make this more palatable, that would be fine by me.  Might save
> a bit of messing around with calculating offsets in each caller.

I think that makes the general plan clearer. We should be removing the
struct pages entirely from the insides of DMA API layer and use the
phys_addr_t, kmap_XX_phys(), phys_to_virt(), and so on.

The request from Christoph and Marek to clean up the dma_ops makes
sense in that context, we'd have to go into the ops and replace the
struct page kmaps/etc with the phys based ones.

This hides the struct page requirement to get to a KVA inside the core
mm code only and that sort of modularity is exactly the sort of thing
that could help entirely remove a struct page requirement for some
kinds of DMA someday.

Matthew, do you think it makes sense to introduce types to make this
clearer? We have two kinds of values that a phys_addr_t can store -
something compatible with kmap_XX_phys(), and something that isn't.

This was recently a long discussion in ARM KVM as well which had a
similar confusion that a phys_addr_t was actually two very different
things inside its logic.

So what about some dedicated types:
 kphys_addr_t - A physical address that can be passed to
     kmap_XX_phys(), phys_to_virt(), etc.

 raw_phys_addr_t - A physical address that may not be cachable, may
     not be DRAM, and does not work with kmap_XX_phys()/etc.

We clearly have these two different ideas floating around in code,
page tables, etc.

I read some of Robin's concern that the struct page provided a certain
amount of type safety in the DMA API, this could provide similar.

Thanks,
Jason
