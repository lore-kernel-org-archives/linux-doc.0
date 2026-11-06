Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793991715;
	b=yPVznpvlaPZndiwVD9Im/j2jge99CVXOehrIoor27Yleu9yAllIQmbct2aEYSyJbC01i
	 eoOne3nNJqSIWp/iBiwHNkSAzblMM72RLaE7YgGCcA6hkiHDXy6f86Hq2gNaUFC3DVspR
	 sWp+Hst0LSbEwMa+Qyw8z90apIp0VZDIxc/Jqa9UCbMnClgHulDlEophWJaUsYNid+7V/
	 h6GTFnWQ1tMXo/keSpqYUMaz7ZRqKNGG/1MdKYS8hFHEhjX8hHh2TMfrw8sXWoTMakvFG
	 zQMcPsxTyKXc+hVlAWKWJzlBcLQdMOZEsqMgA6eHSH+pSCosVXITnG/ErNHwQHpcJpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
	b=ek42Ua244F1Fme/WCG+/9TaSoOlpJakqs488ReR3T9hdu1mmj7V58YR+c2lmP4QQInVD
	 jAlCUrWGERJlqzZZAlGTuejgJ4Ga6h56d4hUD7JsN/wW8czAhB/S6ZbXvQa8Q3F5emaJQ
	 WJoly8UmU6xlx1lmU5mdJMYTyJvtn1VFt8mCppPJMDRcYoH2UJcpdb2ioXEZ7B3AJItxJ
	 ac5p283Z2dPfchFOb0YojU3kZghXLFDPUpNMS0TBOZzzjxaxls/8AQYQJh7fvsJnOvcTs
	 2490dpKsnDAYBwVsrtTNA7hr1gdeR1EnkmCy9k6ktyBaf4hnQN2ScVVxQaYxVGfq6Fg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QZd5DdfN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4D1606A332
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 19:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC4D1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QZd5DdfN
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-535f598d126so31951cf.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 11:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793991714; cv=none;
        d=google.com; s=arc-20260327;
        b=CMPLSLBd5a4W0wWGYhmZ4jCmS9rUQ6JsO1dO5J85d/m+LshQpsT/0vFjc/sPqOkCNW
         B5lyK6VJH52BlXFdlEqLmRHIa1COFCkQGh9Ui6+HwCi+DKILHdk/LpVMe7s21deNNGCx
         HFv7GJpQI0Ulz/qkrmSO1vhhlcTIHLqyCbfmSWtp2lFRW9q4YWBBHoj3XffhqbFX2+CJ
         qm232MKSWi4y73AkAeiIZyzgOwsQpPEIPH8/f1BQtLhN3+0PTUlb+dko2F5OwbfdHcCw
         1Wk9OVqniNTqrBBtrzQPo2gXbGD79wM5hUxLg70hbUq83g4nC+ql8GPOznYkeKMbq/t+
         uKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        fh=QAlMoO3NpVEWMGpKpHTALkDyADSFTvhOsnL0MxfGcYs=;
        b=k9n8qw1vB897waGT7vn+FGX8fSChmpOlEX4d/aCXTEoxW2AZVuYrOFZvf1rAffu7bi
         E2LXrjhpsK+lONH793AU1sZ1q8cEMm5BqDYFej3qpb0+Y0ZYwKYfOqG2D7YarI2lkTah
         BDs5m8lPPIkFldUUupw4QJg/7JFxiFtY+CZH/eETiTEco9aSABr+nxiZkdLeTG6XbECC
         hPVSU4xuu5chkkH8/hXTXVRl0qUzHkTTnnoF/FQj768CnKEu5w9y/5xq9lesDUo9NgLK
         QJhesQ3kk1D+O5jTcQC6Z/hHQYdCav14FSLF3bxjpjGmuQAN53553QY5Zxt9SXtXejxS
         QT/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793991714; x=1794596514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        b=QZd5DdfNiPMqB2kvwbYh3nO/5GPYD674T9l6eR+OCaSzIdoSmtUqaZQ6M5SMMWn6U0
         85Du0GrXpfeB3VGHIFcJIGpPcmRcQJ9MieNmOPZPDmHSrd1SHgI3G1UzJB7qlF0EDKjJ
         +tUP1uWkYEo7G7jHPSO40yaTMj+/bF/O+wDuxzwM+cc6DcXP4YwoRqx1/NvSHq/Jv/Pq
         Vcj8E2sK4MFsxfgnSfB4dUAmBcnkC74+mQ/zLyy1dVfCigQTEXcrDOd7zwvCjwNroYzg
         OBOy00EbN8NBdCcABv2CzdN7yM9CVV1KJIzVSAl1eXNHuDKeBeRPxhoFnXCm5AvjnUun
         VARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991714; x=1794596514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        b=vXwoplSh1djOPDBKd6qiPHHCQ9xIWqkH4mlHx4cTDx/IGBQ9tHl8lcJVd/swNKn67D
         N7b7KZE5bPjtVYKcmRRZ5KObhG2keRM97jghj1NDK5YMby9plFXKjtNz5DKMdc2Q33Cz
         E7FBCq3jl3WZHe44Fp3Oyb5d7wVs1CgadtMpIiMF2vRet9bYBQcBivdBUSGMkOY2IllH
         pO6zpVb5Yp0MWSiObEP6pfYPsIENzdSHyn+NZjTtSCLxLghdoitn/SdJEz8XXWIC49X3
         WjF1qdOTVOXXKnUTvmGYli6ZduXBFB4ayFRdm7Mxb1hUbn0ZE+7z+bxNqf+nkrcfATRJ
         OESQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOfGmottJgp0thRrQ/TOQt4Y8DrcHguH6d3cNHnzJ53fpoIP+vdsPz3iYqj0wElOi2PqH3GqkP9q4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L2sKY1khMJhjoP4E8XDSsX6FzWo2ioFG1n6Wb2kyGUPgbIEAL
	Cr84C7h9kxB7uR9IowcqRXFczmsp7Sc+XvxEuSdUcT0dcU7v/vWSuwk34jpRNRefgYAFCujwKCw
	wQTSLnlCDdMHOwo+vIs4IUwiNVp0wBkuciV/LuBR/
X-Gm-Gg: AYBFou2DRu+4UrMtYFR8g74HfW1Q6IvuhFomEoxmFStK4KgdZ8ltM/YONYlf7trY/x8
	2d0yqBNgZe/GLSSVh7eZPHxKh3EIB6n4POYbbWWALBOlc3U5JerFEwA/uhQXifHcZMMlQuw3ylB
	Gr8F5/lhim78e32tstgfT2ibi8DB7DCBc8d5MISoN05Bxrm+XileE+RIHnpFWKD9Pkawxtq4ydy
	S2of3U5Ujx/xqSaCXMRrOgHwB7aPzlwJ+YSdi2U33frMG2IU80tzLIUAExJ1aHFrh9gL+90UCdk
	ciwKi4YXOplvuFrolJGJQemt9K67xl+v+70+s24LyujtBADh+dk08P9kEQY2lybArDmX+4txjWg
	suyGbNMzdG7wYZkUXp98Ju8kvuyPV8HiHZNeEWQ==
X-Received: by 2002:a05:622a:90c:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-54f5c235197mr4277431cf.5.1793991712760; Fri, 06 Nov 2026
 11:01:52 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca> <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca> <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
 <20261106184346.GJ663069@ziepe.ca>
In-Reply-To: <20261106184346.GJ663069@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 6 Nov 2026 20:01:14 +0100
X-Gm-Features: AclHuK8RLl1nJ3Ebb-rbtl0GPWPY_LeKIqNGDlWDxF7jQ269eiN5kMKC-Dmlr_c
Message-ID: <CAMOZA0L3c0zWvvVF9btAxQSox_hQTZP6W1sK0vgYPQ2OMJtS8Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Naman Gulati <namangulati@google.com>, Christoph Hellwig <hch@lst.de>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:43=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Fri, Nov 06, 2026 at 10:17:38AM -0800, Naman Gulati wrote:
...
> > This problem extends to generally reducing IOMMU overhead in
> > networking - taking the dma map/unmap cost out of the hot-path and
> > avoiding IOTLB thrashing.
>
> Sure, that makes sense, but just having a pool of entirely normal
> pre-dma-mapped memory is quite a different problem from what launched
> this thread...

Since I launched the thread, I guess I should comment...

I wanted to address multiple problems, in random order:
- IOTLB thrashing
- better security than DMA-FQ
- reduce dma map/unmap costs (both on the host and guest)
- reduce/avoid bounce buffer overhead in Confidential Computing and
overcommitted VMs
- not just for networking, also for disks and accelerators etc.

Now it turns out that one way to address all of them was to
- create a special memory allocator, which distributed ordinary  memory but
  with additional metadata that make it easier to implement large
iommu mappings,
  track lifetime etc.
- hook this allocator into relevant kernel subsystems so that consumers
  could use it with little or no changes.

As it happens, the first version I posted last month was not terribly clean=
,
and possibly not terribly well presented, and had some redundancy that
was unnecessary.

The next version (hopefully next week) is hopefully a lot cleaner,
and i think the best witness is how small is the change to pagepool,
basically "if the device has opted in, ask for that special memory"



diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index b775b6305fb78..e12ba47a20e43 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -16,6 +16,7 @@
 #include <net/page_pool/helpers.h>
 #include <net/page_pool/memory_provider.h>
 #include <net/xdp.h>
+#include <linux/pisa.h>

 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -602,6 +603,8 @@ static noinline netmem_ref
__page_pool_alloc_netmems_slow(struct page_pool *pool
         */
        if ((gfp & GFP_ATOMIC) =3D=3D GFP_ATOMIC)
                gfp |=3D __GFP_NOWARN;
+       if (dma_map)
+               gfp |=3D pisa_rx_gfp(pool->p.dev);

        /* Don't support bulk alloc for high-order pages */
        if (unlikely(pp_order))

The network tx side is more complicated because, as discussed
earlier, we need to be sure that the leaf device is one that needs
those special dma-able buffers, and there isn't (or I have not found)
one central place to hook into for tcp, udp, zerocopy,
security things etc., leading to a plethora of small hooks


 net/core/skbuff.c                                            |   42 +++-
 net/core/sock.c                                              |   62 +++++-
 net/ipv4/esp4.c                                              |    4 +-
 net/ipv4/ip_output.c                                         |   19 +-
 net/ipv4/tcp.c                                               |   23 ++-
 net/ipv4/tcp_output.c                                        |   12 +-
 net/ipv6/esp6.c                                              |    4 +-
 net/ipv6/ip6_output.c                                        |   19 +-
 net/tls/tls_device.c                                         |    4 +-


cheers
luigi
