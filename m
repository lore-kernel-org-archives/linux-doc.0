Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8771515ECCE
	for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716815618; cv=none; b=iZqDgHx8T2N7RTYQ8vQXKuZWo+TqTeCWyAOWvLzyNMBOrl6q6mVztcp3VBKvzCiVsVZGNN/p/9j9aVm3voLqhXZ3YB13qU3z8mC74J8xUvEICxJpGu9I0WGTKCdlFsVBogZT9fID7YwuuPyHrmdlBz89H88EnBx9egSyXgpUBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716815618; c=relaxed/simple;
	bh=3DuU6HAXXUEpFj1/CbH0w2NMI18Jg5p4m14poKJ7EVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZstiKSQa1W2YDV6XOqZCCq8gRs8v4B9L222iutkPwAqnoMr+r72WEZ3P1B2qoD/ajgZZEF9qKFyBoNAtd2xdLqOT1ji8jNo7C9x+kHjcVbrj+GRSLpZblNIEH98G5/RIfTMuVyq1iPT4ZNHDSvJViYO3tp8PGjdIWQ9QVvdyVpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E2fhVi0+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E2fhVi0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716815615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ug/+QrBJ1fn4jt7nmsB6WVOTnZkvl361r4prquvMN4U=;
	b=E2fhVi0+tLrd261oMhMod6WsCaPW8RZIXaKHrD6Q3pRmqRVBBLB62auuof8I1CDHOCggK3
	nHLea3Mz56VLQH8chX5wWRbKexcAp/IuNtooDgFH7Xb5CxxgOHqdyEmgnQ755+1vPf8+RG
	6Hu1FObW9hV7w5fTe+44GuoIT3pWBqM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-x_VswCsWNhSSbcWXwm68KQ-1; Mon, 27 May 2024 09:13:29 -0400
X-MC-Unique: x_VswCsWNhSSbcWXwm68KQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ab9e08d5f9so51732666d6.1
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 06:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716815608; x=1717420408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ug/+QrBJ1fn4jt7nmsB6WVOTnZkvl361r4prquvMN4U=;
        b=Jnseyn4VeGxtF1+uZqjbOtuFXwuXxCpYoyo2LwkpAhRdu7SpmHKnOXB8IHeSuMYZbB
         c/5qHcliKeq/gbGLaQIvwc1+eBXuwFSI1Bs+uK3XBg0rcnLrRJL33PGqBScHTKIF3LhP
         ugdnrx72q/Dr8p80YcNS89egAyJJrvIToZYlfrkhLz1TklD1DSmKcAOijvdgSCIYY9w9
         yLx2kiRqi/aZSbzF206y59v61e/jLUCEVUv3m9Y2yTjxWl2I6mDh5PSjJYLOmDKYoUHi
         l7Kvjs2o9Y4vRvDhtlClgYTsXfhV/619aJEpNLaBY0AIukXr/G7821Nj8e748pTxv8gq
         NLzg==
X-Forwarded-Encrypted: i=1; AJvYcCW171vSivb7kzBg79sd+x234MNIr3OH0zuz8djBXMtOB8k6Vk2v6YHr3JYNmNTtq69iigf7WvWN0ClpjMJ87F76W51UcdOoN4Fl
X-Gm-Message-State: AOJu0YzNtUTqrPq92O7l3cxc/LOEUjGfSquzehWER+HB5QMzo1y3TR3N
	fWClsF5VbtBO+Lz0NYRgPcGxELLfwco8AVHXIdKma/vo4zcbvtSpY+HFJ9Z5TvjE2sToQ9dT9I+
	9L6z9loaAFW5za1Wf3O87Ns3pG66tonxZZKBbwSSkhkZ+nuNTsTP4kySQoA==
X-Received: by 2002:a05:6214:76b:b0:6ab:7ab4:f309 with SMTP id 6a1803df08f44-6ab8f327f9fmr190114676d6.1.1716815608538;
        Mon, 27 May 2024 06:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFvp62B55LpZG06oDjDs9C9JeEguHSawvpfFEUQJhPnKmdJaNhFrrUX9ZGDUsNJSeBscO1kA==
X-Received: by 2002:a05:6214:76b:b0:6ab:7ab4:f309 with SMTP id 6a1803df08f44-6ab8f327f9fmr190114306d6.1.1716815608133;
        Mon, 27 May 2024 06:13:28 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:833c:88f3:25a9:d641])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad742b3663sm19273786d6.60.2024.05.27.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 06:13:27 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	Petr Tesarik <petr@tesarici.cz>,
	Michael Kelley <mhklinux@outlook.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] Documentation/core-api: correct reference to SWIOTLB_DYNAMIC
Date: Mon, 27 May 2024 15:13:14 +0200
Message-ID: <20240527131314.22794-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit c93f261dfc39 ("Documentation/core-api: add swiotlb documentation")
accidentally refers to CONFIG_DYNAMIC_SWIOTLB in one place, while the
config is actually called CONFIG_SWIOTLB_DYNAMIC.

Correct the reference to the intended config option.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 Documentation/core-api/swiotlb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/swiotlb.rst b/Documentation/core-api/swiotlb.rst
index 5ad2c9ca85bc..cf06bae44ff8 100644
--- a/Documentation/core-api/swiotlb.rst
+++ b/Documentation/core-api/swiotlb.rst
@@ -192,7 +192,7 @@ alignment larger than PAGE_SIZE.
 
 Dynamic swiotlb
 ---------------
-When CONFIG_DYNAMIC_SWIOTLB is enabled, swiotlb can do on-demand expansion of
+When CONFIG_SWIOTLB_DYNAMIC is enabled, swiotlb can do on-demand expansion of
 the amount of memory available for allocation as bounce buffers. If a bounce
 buffer request fails due to lack of available space, an asynchronous background
 task is kicked off to allocate memory from general system memory and turn it
-- 
2.45.1

