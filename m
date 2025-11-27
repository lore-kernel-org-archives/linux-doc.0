Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63F313E2B
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 06:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225641; cv=none; b=SXPr4RWh/p1EPbZqpJEmuvM3uaQZdUxXCf7Eut6htke/Rn2GZjYWQozFjiVMlyTKQgsjq5MBt3XrUWCgCWysY+yHUj/UiuqTIfIfZ52WHueG2SH4jWdQXAxNWEpbmw5CX2MSvyeINjhUa3wbmYdHcDR0IjeMfu7xdF6LZxZmMEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225641; c=relaxed/simple;
	bh=p4zBspV0umYpwlxraVSt9LbhsuCRfZnCfl2fUmVODfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1ue6/YRQFUT5MURbZubAxiZu0AJ5soQhJvu3V0X7tlw8ByVc3wyR2Q05j+k+D5tvUQ6fHXuW+0FkUI7f3f1IJt79IqTiuthldB6VEcRlR8qb5qWNxdiYAhLi3YVv47t2//EVsjNb6/+QDa0PixBpKQ7rajdEKkbzVu3f5N7ReM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KqMckK5O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hw6jYxpx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KqMckK5O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hw6jYxpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764225639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kFZFceCxodv+sVrwXshrWOSA01PvSJh54J0xHtV2LxM=;
	b=KqMckK5OlIm5OfN8CI+1xGSUykS/5rvlMMwlRrNABDokK3BrNXgZPkoqGQqh1RnbXiepVb
	fejs+f7Ek17gzRsvoiy/lXZwp0SZ897HnLP8lgYjHMrksmm8y68TwVjIu6c/xyg6f0qv8k
	XVz9jJC7sujuR9Hu6T/flc70aji5LJ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-10wblPF_PpifYLawArAWlQ-1; Thu, 27 Nov 2025 01:40:37 -0500
X-MC-Unique: 10wblPF_PpifYLawArAWlQ-1
X-Mimecast-MFC-AGG-ID: 10wblPF_PpifYLawArAWlQ_1764225636
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477212937eeso2793135e9.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 22:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764225636; x=1764830436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kFZFceCxodv+sVrwXshrWOSA01PvSJh54J0xHtV2LxM=;
        b=hw6jYxpxwPKIFKJGvab+MkvyWyCbd827Ljgf6Dmmt8Hn0CT7rL62onmKBUd1VdHnAo
         YI3iylFQxACvau8rTBkosao51et2ddJBigJo1nTvpDc//3olZ3rQ801CGtD0TKVs/tb9
         eX05AFNGoP3FLX/gpXgPkH2LHie0hflArld1mja6rZGRMmKGZo0fs+9ikG6g+14KXqd+
         k5B29FvaR3vNimVFKMlOkk5bl8VMCJTDk42l6HNaWhQczgcHAly+X+FeRGpPhf+zxFiZ
         fkHQfI+81lEFGXyWG2WJmpgIdmCO3kSAIu8tB/E049IYipx3Yp3iKsFc/cXhCx5iXHLl
         Me6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764225636; x=1764830436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFZFceCxodv+sVrwXshrWOSA01PvSJh54J0xHtV2LxM=;
        b=pz6qcVeGPXAy24fP9iuAsJZ9cplIzCOrxVGoFyVR2stCmC9VMcQqEXQUd8Setf1pNu
         C9aIJYxdKJUEKkg244Y2m/nFpaf+A9l0Qkie6kyhy4z5pFIfvlduxNCF2+Y+gunYhyKO
         7jrcopqBlIsGcbGdxvDsByzfu5n6F9CXqj20yAn0iXHRLcjLUeEym5vEYy2ORQWHHgTZ
         yGpKgV6o0bEyYLPg8iEiAObCnlxpvzk77sPVJVTKd3fq551k/oyiWjHdjtwor0bWFQbF
         0kjNp5XRiXFthnPyR9J8vE8ZphiWyOLTLUd7QNsStYMsWvA/NGO44MX0e+mdJ1tiqybq
         sG6g==
X-Forwarded-Encrypted: i=1; AJvYcCXz6X9PLCNY7NDpogPtL4NiPZUjxo1WIwxOnXYfTTGFvGcn45wHaYU/Bm3GuTDRSl6XaPHVu0QuZ0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPe6Pi2M+vLGk11KoLIfBEK0cjoPX3FXVm33G19rEQvDApEG0S
	l5ZuWM40NrRpvLSgUAdHwLqO35DQaC0JZoVayIApH9lnpL3R8wGoL0PY6yje7ryhfrQmNir+mnj
	HZ9fdP444dgWROHjJRGVd/6ofMZ840oDvwYOZo0ro2dL7xp9kE95Qc6gBiQWzGg==
X-Gm-Gg: ASbGncsyUXtGQob/QI4xgejqpMQmroaRUxxhuDGUNPKJ8OYza6VK+5+xvP+IbusFsVW
	AiSfBlW5RJV3cR3XOU8FNIfNZDBkpyBnaE1N2wIQ7EBNKYNa3S2o2lWtE42v90ePrppCsUG/8zp
	Jd9V4S57xHKEjtxz+ZLgKDBtBRFQQ+hV6g2uKcAhQ1AbeEHFQ/DA3lByGK5IHOSwYY33qmoGpB3
	4xYlz82NMqpi8XtZLnjxDkNNlbBsEJa43Csj3RzyRUbIciyKybCdGSbB8BzelWlpoJ1tKwuxY0E
	MFotTKOJ0nSOUc94OE02wbRvIy12ij/8b7DZFDF0UDhujAqbkpmllp3IfoMPfyQ8a+X+TO64AvW
	YcJBBXlLEnRB9yMFzXAGCTGoPMhnekg==
X-Received: by 2002:a05:600c:3543:b0:477:1ae1:fa5d with SMTP id 5b1f17b1804b1-477c1142268mr180867375e9.20.1764225635786;
        Wed, 26 Nov 2025 22:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmaKJl3GPl1IrG9e+lyxemKaHO0wPm9ET8yhjMSTC9B7Xozmw3CvG5GdadD3czzW5PwSFbkA==
X-Received: by 2002:a05:600c:3543:b0:477:1ae1:fa5d with SMTP id 5b1f17b1804b1-477c1142268mr180867165e9.20.1764225635290;
        Wed, 26 Nov 2025 22:40:35 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0c44dcsm78642495e9.11.2025.11.26.22.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 22:40:34 -0800 (PST)
Date: Thu, 27 Nov 2025 01:40:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 2/3] vhost/test: add test specific macro for features
Message-ID: <23ca04512a800ee8b3594482492e536020931340.1764225384.git.mst@redhat.com>
References: <cover.1764225384.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764225384.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

test just uses vhost features with no change,
but people tend to copy/paste code, so let's
add our own define.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 42c955a5b211..94cd09f36f59 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -28,6 +28,8 @@
  */
 #define VHOST_TEST_PKT_WEIGHT 256
 
+#define VHOST_TEST_FEATURES VHOST_FEATURES
+
 enum {
 	VHOST_TEST_VQ = 0,
 	VHOST_TEST_VQ_MAX = 1,
@@ -328,14 +330,14 @@ static long vhost_test_ioctl(struct file *f, unsigned int ioctl,
 			return -EFAULT;
 		return vhost_test_set_backend(n, backend.index, backend.fd);
 	case VHOST_GET_FEATURES:
-		features = VHOST_FEATURES;
+		features = VHOST_TEST_FEATURES;
 		if (copy_to_user(featurep, &features, sizeof features))
 			return -EFAULT;
 		return 0;
 	case VHOST_SET_FEATURES:
 		if (copy_from_user(&features, featurep, sizeof features))
 			return -EFAULT;
-		if (features & ~VHOST_FEATURES)
+		if (features & ~VHOST_TEST_FEATURES)
 			return -EOPNOTSUPP;
 		return vhost_test_set_features(n, features);
 	case VHOST_RESET_OWNER:
-- 
MST

