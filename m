Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699952;
	b=lSPly7QJzraUMmsBmrDlFpYPNqZR9SlmrulS3vUMXSpJ27sS2V/4j49rO7fBbrrZfhsV
	 J1mmtV7Mo+7JbJIJe+iaq94uQtnx2D+sb1ha4EkbqcJWhFeDUTOR/sFeDO+1HyaotNd82
	 azbMJ+CxH6fiSkfwJuiKT7MXOQi8tsDNo2DyHkqTMOyoZ75eIM5CRYknw4vKvcLKbb7pF
	 NHw3Mfj432gfx5trq5YMbeFw5q8KEzMG2aS+GB3yKaZ1eEDxtEfpSagBR0ci4/YcIGv7c
	 wA8gLQsIOBJ96sdBPNQhFD1LaTec+quhpTN5SF5L9YglzH10jLOvyz/1fYAHKGjDFwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
	b=f7Q1EdL77dUMppNbtejaYA+eEcnlYr/rAJTtsSV9NL96SiiTR8O1OvF/zqBpcz2oRDuu
	 SGFTXxAjkXZXlrZPRoloUZYN+TaFf4ZlgPV76/UkuOl/+ooIu01t83PvneizdfXWsH9zs
	 9wU/DSMIEsc2p5Zjl9DsWZTCy5lnq+hOg2BBAQDqKVh2sNJzPTPcAmuePuVoa8otx/IyX
	 MZ/oFz3QAX3Gx3zyURPSG9d47xd7iiyU2UjvkrLbCR46fzBEYcwpOsMyNggr5s4WWbbvz
	 d7USuRbIXTc3z0wq01rdsCdwNpBHh5A2TemyjnPprM1DcbMEnf+pEoOJzmgq3OriKHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bEf24BE7;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA68606A319
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 20:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EA68606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bEf24BE7
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5361e313e63so1136031cf.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792699950; x=1793304750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
        b=bEf24BE77jeSVrye/0K8bqAhBtq3l4ipVokvy1WTo9I171dh1cPnLebWZP98ZbHc1p
         AY82b/V/Z8Ber8ZWp8VUWvVQdVKVcws1+qTT8I1nIkiiUcBGdUJt2If+NgtXZWXT8aBs
         uKfYqDijGgrn/rN6GkRbg/nS7tyReOXZC1wz27PGG3UX69KRZ1voQbKcO/EJ7VCH+ev3
         9w3+gkzOCiUWskxpeRuVsDRp3YDSWCkTFq4QinNxLt/YPbd0DW10RzKL39WEfK6b51Xg
         gE0pjKAlKmDwW9sqvGKBvCi87C9mbwgaQyyqQUYs4WaTKD+zF6NXq0IhdXGPVmv9ZqYX
         i7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699950; x=1793304750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
        b=F/zqHAIo+bMgKxlUYQkSi73rsVTPN60ePIIOgp2WXTK2NwG+5zEIcjXv7o36Ihky04
         +zsBhxtRDxHKjbtf8933AadlCiKYjz5E6Y/VpUSEZZTxP1fzQqDq4J3tEv8P/hvc1G6g
         pQS+vcUfAsKFsx4MuoINbfLRxUReh2qkZ+8ci06XsPECMwjsYCHnpdScj6QiHuyWIhnz
         wnblhCaInYjbadY9RaGbWGKYTwynDhvGMncwlVhybqlxzYcOgVDMTwcDR+8h/E0C6PjC
         k0hZTIt3d57Zg9ZTAZU8k5dI5du65YMbKf7m76z8jVx+hH7zsnGT1lblWONAJ8w6vO9C
         kiUA==
X-Forwarded-Encrypted: i=1; AKwUvBzK8O2FjuDmhfEYGsz0fi4vvOsG7UHiT46sb1qYOAYWtQTHMBU8ibhK8XaLNJ67Dwg3cwMYtqTfpvQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1aIW6fkcjo4ElgIbv+Iwpf9fNr3j+MhWyny7/Iv+VZqxKuc/E
	tdK+Dbre0m7WWl2E1TuHdF34M37w+uFry1wF17KuNtPfaPAMMEtoRWl3JYjYPmnpneY=
X-Gm-Gg: AYBFou00Bcl2qHVv7OsKnj1PyNmPCbnl8jvfypgD2uYHVlAW7uz7jSxhMoI2UPLhRJg
	S85HrGgW1Tx5fsnBl9/4Iqt9jhWYp6bs8eMHcw4t4hASgrSPPbPgljjM4bcCKcgu7zrGSSnCQ9I
	5VTybPsdAMz6UXulNNrBf3dSAETBH4nNUbglIUjjyxGJkzZLcf2Oaqr5Hr1g9kr+hdKO5eupNcp
	1PU89ahUKiAwvZPUBlRAO0M7rd9MuX5+92ahPgIeNJR+HtVV59j1nUSwMXDL3+TizZctcw2sWkn
	yGWQ5r+XQN64JQVFkLCkzZ7nLXaZDyvIVW7Vvx4+4I0mVtgIEAW3KhZOLb+AOVmN4hevJBKY7mD
	4lLrgsDZP67YJS2OmZkgyUrUvltACk7UHDcCo/Sfcm94Er1c2FTfbORPHiDk+AqK6oOFd479gU+
	To03KVpaE6LnThuh9V/KIgznB93ZlixyRP3HR2cu8wIstzDaoRJ6c9F5BSaTaGFyJB7vXzS4w3/
	VyWTA3DygjY98ojcmrhRzWXl9ahgg1WAyNxuBCzYC2Be0zaSziW/88Y28ZveEjIEK+sfFYxxer5
	zkuc2zuYxB5j2Xbn+ItgqsYJPcp+Vv7/uvuZXw==
X-Received: by 2002:ac8:5a85:0:b0:536:6378:c7fe with SMTP id d75a77b69052e-5369b8204d9mr99553871cf.47.1792699950468;
        Thu, 22 Oct 2026 13:12:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c14da10csm1768631cf.0.2026.10.22.13.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJz9J-0000000FoSN-1XEC;
	Thu, 22 Oct 2026 17:12:29 -0300
Date: Thu, 22 Oct 2026 17:12:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Luigi Rizzo <lrizzo@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20261022201229.GH3381610@ziepe.ca>
References: <20261003212241.3432303-1-lrizzo@google.com>
 <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
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
In-Reply-To: <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>

On Sat, Oct 17, 2026 at 07:11:28PM +0200, Luigi Rizzo wrote:
> > We should probably just find a way to describe that this is a POOL that focuses
> > on physical contiguity in some configured granularity.
> 
> Before embarking in a global renaming, I would like to get opinions on
> acceptable alternative names (possibly with a short prefix usable for
> identifiers in the code). I could think of the following
> 
> DMA_PMAP (for PreMapped or Persistent Mapped)
> or, ahemm...
> DMA_PISA (Pooled IOMMU Superpage Allocator)
> both using dmap_ for internal name prefixes

Can someone explain what outside netdev would use this? And why you
couldn't do this in the netdev page pool?

It is not a common workload to have the DMA allocator be the one that
allocates the memory. Usually we are DMA'ing from memory that was
allocated someplace else.

I think Robin is right, this is just a special case of the dma pool,
and it certainly shouldn't be something as grandiose as a subsystem..

Jason
