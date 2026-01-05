Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68592314A94
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601401; cv=none; b=Ktq7rb+Cdi97U4NyfjxxnEqzxnn7hh+P88EtfwQ8GZ7qzPIhThoS9fWi8Hdr6I4q5SfXRWhnyVsRggyT/fe9CoqVoXYoAAmyQ39V8ebYp0Cue7VKtiiyArdK7R2wMPf/evm7552jt14q+u8g2da50puQerzqPJ5PZwoSEhT+H/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601401; c=relaxed/simple;
	bh=3EF4beueqssYSrJr7jAiyWtRxi/ynmIi31SbgxtAbxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVogu2VnvRzs/VnIAiU3oZXdf4/FGq5gZY8FugIhU7VI9162d2JdsP4JkAeuUZCjmyVuYoOwcz7DrNUl25AZrrhIWXgNIexJo/DtbKttRsP2Y09kXXQlboWMENxqm9uWYATBI5BpeotwRS1y9hVuw88sTsi/c96sg+iitWb4gdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EXJG4j8j; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FzAXECaK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EXJG4j8j";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FzAXECaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767601395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jlkdUJvLxIuG9RkypEQ1odBgc8hsD/vyeqVzWJtThQg=;
	b=EXJG4j8jc3i9LI8/XiTkAdEII5VEW3C+codFDshV7MQe/8h9k6rPaUB5cDYjXBLbxnXlUs
	G9uhBsTa/aZcwz+4ybe5C2MtJSmXx7r2+T8QKe9vYLGlz90nTAK/vi8kQsBqLBBZDEd2WL
	6IH3skA4OiyMDF/1SNjHbaqcOkFytaM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-CRhzVPIbO1yx4_Zd5Fc6Jw-1; Mon, 05 Jan 2026 03:23:12 -0500
X-MC-Unique: CRhzVPIbO1yx4_Zd5Fc6Jw-1
X-Mimecast-MFC-AGG-ID: CRhzVPIbO1yx4_Zd5Fc6Jw_1767601391
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42fb1c2c403so8750717f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767601391; x=1768206191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jlkdUJvLxIuG9RkypEQ1odBgc8hsD/vyeqVzWJtThQg=;
        b=FzAXECaK9cpyvzSFZy2EhuHAzlJYHYh1Ucgh0W27TOzjOUZxhoOG8f84Akx1O9zwx4
         CC0i5zi+JAF8JUzNa7jRnGOZgifzp6xP185MLdaxTMhpb3BVub6wsldVxzkRMP7sKCTF
         Wh/9qnZIFH/gtILXIgimM1Q5mF9HE/JX85wGVPpWlctAAhY18PWOK37gvJbETMTa+Spt
         42RiCPItEDLPj+tnu4dl2DVDx41dLyN2aEcuuR2R8kpPrI9Bdk9r7F9OUYvygjmLA4ap
         M0wbuEybZHozcmrIpXIOxIo5REsr3F6Y+qMZG2Jrxljck8M9b1jbMaSbfzVjBHILnQ7A
         q+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601391; x=1768206191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlkdUJvLxIuG9RkypEQ1odBgc8hsD/vyeqVzWJtThQg=;
        b=ghorjNUQwCk/7Ooh5KroO+7liqc1Cpt75hoN3/zflTOPs9mTDb6pOrcvcFhqPLrQ1c
         rr4hMFtF6Dq6OsQEAxkp6PplZMVs1wIXcAOrdc4KQB1AsY8DF7LYnxlPbNyLaiAps67/
         Vgl5J57fTo9hPX37wj7QkauZb7dB0HqoXJZNSivPIUcQqMLTllXKh9fZFEHDhP5SZlnw
         mBJaTkyYgY/3ta7NBjp+wTY7ZNhf2hU0Vd5NcO4h9nvy7SVNMNSyJo10sfrlZjBMGkF+
         Ob2sy05s/gS4Nnks2xZWLLxVd0IkB22qM76FDdUFrXS/ULSEdu2UKoUd+XCHATvM02DR
         eMRg==
X-Forwarded-Encrypted: i=1; AJvYcCVSOZJnxN5vUfbBQ2bogznmoY+U52M0yPjUO/iNTgbs41rRfA9GVWm6TYKdj1+ycr1hHPosww77Mds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6+LlakcAyOSn7UQJkRIbpmYAAS6MZ9s24OMDUcnjcdSGdOGn
	M92A6eCH4NdBNvLXo5Sc0rLaq4sv2kiuDYiI8C0oGQKVD1+Ajj56fBGfUfE82qFPDm5QWxSfbUR
	EHCc3npojMACJ5Rs/tbOnaFU+Kafm6LbN+cxI7lzZOeaZypoUmavNc/MV1odKcg==
X-Gm-Gg: AY/fxX5sykhVom9skKjvfgxrZJYcnzR8CB0ePKEQgSB64Tmns5LfeLMLXhfq8VlLeuq
	guqkb3nwUDbDt1Wt05jMygs3zBAkoNQbi3w126KR7AUCDFv5vvIqDEaHjIZqtXxMrlXPq2Zq4w8
	QigoSXUNbqgwq90t73zQkqkAZNq5RBBm2NgsmH4Hj3nOf8glV68E4ePdw/frTKqiCxiotua45JN
	I+5VtICShpmhadmSIujZnx3Pp1xThzuFiZPD9s+xRUvw6UfXWyqWnLcO3m2HAuqvOTRzPyi9kI9
	6S6qOxnfnBvW9TRqAvLyK173/SVsppL3ROBcwd3HbWcy5e/E+v1qaJZiWW0y+KUiBisUNaXSNCg
	BtCSaTitDLVHsz1NbO3x45hXsinKsh2ocqA==
X-Received: by 2002:a05:6000:2c03:b0:42f:bbc6:edc1 with SMTP id ffacd0b85a97d-4324e4c1230mr54966720f8f.1.1767601390683;
        Mon, 05 Jan 2026 00:23:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwk1Ttr1N2m9x2GBHG1pWtih6zeyM7Sr9HAGjGkjK9L3/ihsrFeD/P27Wy0cj6YonFT6KolQ==
X-Received: by 2002:a05:6000:2c03:b0:42f:bbc6:edc1 with SMTP id ffacd0b85a97d-4324e4c1230mr54966659f8f.1.1767601390077;
        Mon, 05 Jan 2026 00:23:10 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm99604028f8f.35.2026.01.05.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:23:09 -0800 (PST)
Date: Mon, 5 Jan 2026 03:23:05 -0500
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
	Bartosz Golaszewski <brgl@kernel.org>, linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 04/15] docs: dma-api: document DMA_ATTR_CPU_CACHE_CLEAN
Message-ID: <0720b4be31c1b7a38edca67fd0c97983d2a56936.1767601130.git.mst@redhat.com>
References: <cover.1767601130.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767601130.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

Document DMA_ATTR_CPU_CACHE_CLEAN as implemented in the
previous patch.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 Documentation/core-api/dma-attributes.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
index 0bdc2be65e57..1d7bfad73b1c 100644
--- a/Documentation/core-api/dma-attributes.rst
+++ b/Documentation/core-api/dma-attributes.rst
@@ -148,3 +148,12 @@ DMA_ATTR_MMIO is appropriate.
 For architectures that require cache flushing for DMA coherence
 DMA_ATTR_MMIO will not perform any cache flushing. The address
 provided must never be mapped cacheable into the CPU.
+
+DMA_ATTR_CPU_CACHE_CLEAN
+------------------------
+
+This attribute indicates the CPU will not dirty any cacheline overlapping this
+DMA_FROM_DEVICE/DMA_BIDIRECTIONAL buffer while it is mapped. This allows
+multiple small buffers to safely share a cacheline without risk of data
+corruption, suppressing DMA debug warnings about overlapping mappings.
+All mappings sharing a cacheline should have this attribute.
-- 
MST

