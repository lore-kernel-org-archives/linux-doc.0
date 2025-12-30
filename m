Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C04E22A4D6
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089759; cv=none; b=SXN9RQwGQFdi8FNeithH+fI7kY3HHYZO0ay+MgLDWyWiHdtH7YEGmrGyzYleMxwocAJjGjG42575jZ5Oxbh1K1r5sl9uF9tF1Rvq2nPzBOoqg/OErMoHV93yXKBhjMJZQj8D4nJV7/8bJ1P92eZpHDBymK8xauFVNWdb/fuNh4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089759; c=relaxed/simple;
	bh=1JUA4c0efATkxneQm73kN9tTpnR2rWTicL6pMgMgIPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sROANW+4NBD0m8U+PNBHBhRQEh6zOem9eo4YaZwFqwZpVMTifb0TBwEfeaurxeeYXtsS4t90rkX3d5CakFHOCwD1oSBNw6khMJP+9GU7QS+IyXYdYVP2vrVeY1+5EJdFRgKU4o83UcBGA2WHRcpKFIC/oXHVrxgvHVNJLWThuSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hvoCvzfd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lT34bftq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hvoCvzfd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lT34bftq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767089756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lIFloJTLYi5ioijSED2t687CZ+kUT7GxSlzISMtKW5A=;
	b=hvoCvzfdYVI5QnmibP+2Yajm1ZhOWvPiSLWw22wJxk4akt6ZEkoNRCt/E6rQe8E02O2dG1
	u0+tK8UWATMvs3Q7iUbi4PnqB2fic9QoSW+7L/5kdiCPHLjOpweM/DXA0SwBxigpcCz3qn
	5s1u/+cCMULSkZyYkuzBAFP+x5qYBPM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-XxkL7cYPO22_1AMaoBtrrg-1; Tue, 30 Dec 2025 05:15:54 -0500
X-MC-Unique: XxkL7cYPO22_1AMaoBtrrg-1
X-Mimecast-MFC-AGG-ID: XxkL7cYPO22_1AMaoBtrrg_1767089754
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477964c22e0so70029605e9.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 02:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767089753; x=1767694553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lIFloJTLYi5ioijSED2t687CZ+kUT7GxSlzISMtKW5A=;
        b=lT34bftqfcQNEx1gsdT2Z4JbiLJjkSYCtlmz5O9ObMJdgqltstSG+SMo+X36WAnllf
         MXJzVSiU/jMj2oZaHQ6/o9C+9ZBk2OJfpffBBAWAY+gdiAMmWumyhH9uAo5Vc4SyJi/I
         rtjC0tTxAV+Y2JNaqTth2RIY1NCsPh56gCE614rdOYKjlOOAOQCI2KKN7RE0zal+/kVM
         1QqGHORS/8MDI4BmqZ3J+Z6WZXt+8XSu/mBtAoQpVRLvabg3R1fIJTwGAksWAJUW6JTH
         k/3veBB7vYjqN1fdZxiJeDXiahM4KtcWfKoum16l0Hjn5tPzgPeTLv4E6+8ETMy8/zyK
         rBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089753; x=1767694553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIFloJTLYi5ioijSED2t687CZ+kUT7GxSlzISMtKW5A=;
        b=BBgHmsX7SsMScsb+nYMJnh0zRnE7fwL732v1kaZaTshOJgiukmsJ3vaXDkec/zsCpK
         jSy9G/1Oj5dQBZqD5ihkNMpcvfMV6lmSGKFTGOqQvYBz8JAQNJBKGoQgd2PruoBPeOGb
         r6ViyhTisUzrom+b31Lp0i41bY6oJk9WsKxS75Ch3knFyiuGdIyTQ47zZUUs2J/6slcp
         f+R4+qv8b32k89btOC5we9YQpzTfJXmSZ86sgMjMh0aRH0xDAg4M1qF17Vltq3h7DtXw
         bzwuD8UHak9GuaoUw1BUbMjgk4B2dB+gkWcdEkxExF50/ktJ5Ys/7VZ2+BLAi+YDG3+s
         ljaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMX1ha2+ajQ5VPcn4uwLElnNTUomn0lMAl7s9J4VB8DJcfFJMwN2RxCtMaUSISCflHEIi34pxDzBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGiocJE6eQPjw9g1E7qTC/zm/0vQTb+D5raP8Ww6aOW5VGVkoT
	JTlWiNhmuD4LB6YifFSQisGEj+DcgUAPra7R9CpJKJsdDYxJKG00+ZsJbU5G+q6LlLTj5+xW3X9
	AOxPIfBVR7/Zi+3bbx0XmUkNFX3oUuZMvS3nWL3vU2j3LhbjhVbeILs0bvA+GKg==
X-Gm-Gg: AY/fxX4pKZ/p71lFvE3ovEdhHro/Tveg88c7Dx8FqSgwVTFG+WlY+BJwgkgvkf35rF0
	4uLlUMbftfkbrvmsHf5fysaqDgx6JNs816A836ACjTCorJZtHhuLbsBrK2dcpnnIlxizICs25j3
	nfrF97YYqG6PGBXHFm1rs7d5Lh96khIpaljH+yc8H82He2U33TiZuTIvJT4wPVUH2YsKb0o3Dxo
	y6Kqry3eHCJYaV8tTDKs6+tTrv+DAxdh1AvKT44l4rgC3cmgeKw++uiBMPqHlM0CVN8uR7q8k8k
	gwOM4kJySAr51G9M+qJ/S26a+3Km6K825e0DuZi9cUhBffnkGN52yy3TNeBqFUKa63NKLLdvcKE
	cI5jCjJOUWDx6csYmEJsDCVvnyFyznau76Q==
X-Received: by 2002:a05:600c:46cf:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-47d18b833a6mr393752825e9.2.1767089753540;
        Tue, 30 Dec 2025 02:15:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0nrcJnS7RjupXcIyxgJ/7OwvI0dkgJ3plFmvdD3JvcGLBLhWJUwOhq1auRl2SqH+pkIX7dw==
X-Received: by 2002:a05:600c:46cf:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-47d18b833a6mr393752425e9.2.1767089752979;
        Tue, 30 Dec 2025 02:15:52 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272eaf8sm630001695e9.5.2025.12.30.02.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:15:52 -0800 (PST)
Date: Tue, 30 Dec 2025 05:15:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Petr Tesarik <ptesarik@suse.com>,
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH RFC 02/13] docs: dma-api: document __dma_align_begin/end
Message-ID: <192a335d783a2e54f539dc5ff81bf3207dafa88f.1767089672.git.mst@redhat.com>
References: <cover.1767089672.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767089672.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

Document the __dma_align_begin/__dma_align_end annotations
introduced by the previous patch.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 Documentation/core-api/dma-api-howto.rst | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/core-api/dma-api-howto.rst b/Documentation/core-api/dma-api-howto.rst
index 96fce2a9aa90..99eda4c5c8e7 100644
--- a/Documentation/core-api/dma-api-howto.rst
+++ b/Documentation/core-api/dma-api-howto.rst
@@ -146,6 +146,48 @@ What about block I/O and networking buffers?  The block I/O and
 networking subsystems make sure that the buffers they use are valid
 for you to DMA from/to.
 
+__dma_from_device_aligned_begin/end annotations
+===============================================
+
+As explained previously, when a structure contains a DMA_FROM_DEVICE buffer
+(device writes to memory) alongside fields that the CPU writes to, cache line
+sharing between the DMA buffer and CPU-written fields can cause data corruption
+on CPUs with DMA-incoherent caches.
+
+The ``__dma_from_device_aligned_begin/__dma_from_device_aligned_end``
+annotations ensure proper alignment to prevent this::
+
+	struct my_device {
+		spinlock_t lock1;
+		__dma_from_device_aligned_begin char dma_buffer1[16];
+		char dma_buffer2[16];
+		__dma_from_device_aligned_end spinlock_t lock2;
+	};
+
+On cache-coherent platforms these macros expand to nothing. On non-coherent
+platforms, they ensure the minimal DMA alignment, which can be as large as 128
+bytes.
+
+.. note::
+
+	To isolate a DMA buffer from adjacent fields, you must apply
+	``__dma_from_device_aligned_begin`` to the first DMA buffer field
+	**and additionally** apply ``__dma_from_device_aligned_end`` to the
+	**next** field in the structure, **beyond** the DMA buffer (as opposed
+	to the last field of the DMA buffer!).  This protects both the head and
+	tail of the buffer from cache line sharing.
+
+	When the DMA buffer is the **last field** in the structure, just
+	``__dma_from_device_aligned_begin`` is enough - the compiler's struct
+	padding protects the tail::
+
+		struct my_device {
+			spinlock_t lock;
+			struct mutex mlock;
+			__dma_from_device_aligned_begin char dma_buffer1[16];
+			char dma_buffer2[16];
+		};
+
 DMA addressing capabilities
 ===========================
 
-- 
MST

