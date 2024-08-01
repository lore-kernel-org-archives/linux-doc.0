Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969761BA88C
	for <linux-doc@vger.kernel.org>; Thu,  1 Aug 2024 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534974; cv=none; b=tfgZid4BJ2CP1C3kFE7Ky5I3Y8shXTGhhGdfqZQuopKY95ezeEeaFqSlaGbucytD4L9HwEw3RcuqKs4BdJI2axfbenoAylg5ZYZdHlPCOxfg0IAZHIyqpwp5fCgpGU0QQ9/vvZBMtyibojyfTGcLENkXo6wATY5o0EkoY4zcqec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534974; c=relaxed/simple;
	bh=RuMDuPIyTfHh9y+AmyefSxAA9N7VfDDvvbHO50ATeI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJ7ajNjEqX/5E6kCnoRKf5a6gdVLD4tPVmeML6gR2vdeQlI2jw471zjpPkOCe6nxhevklHUUQw1hDu/yj0z00aJcxJ2+GOdFsgNbsfktcIO4i20dSdFZ/16iwFn11wSNvnP/YZCwc4MweE40Gfa3HYIiw1uztBI9HePmSztm+9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iiYKyfvG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iiYKyfvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722534971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MuSsWoFff78J8yjVq4pT+k5ugpCaxGaJf6GePdVC2I4=;
	b=iiYKyfvGZozzO8Yolfy3bkWSCfcmlXM2yoge7XO5ivEXeiZQLtlhKJCl/o9lqxq3as//6J
	HI5Fv2WKN42aO0i7OmFcEBJFmbts7yyZvNxssOzIBB6cJXimBHYWS1oUK3bMaTeCdmUfXv
	TNgWNoL3L97f8GNbQMV+WHo8fcbKgxc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-eeP5EXeHNyqEaOVTc6tZ8g-1; Thu, 01 Aug 2024 13:56:10 -0400
X-MC-Unique: eeP5EXeHNyqEaOVTc6tZ8g-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5a1ab480f90so1273052a12.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Aug 2024 10:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534969; x=1723139769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MuSsWoFff78J8yjVq4pT+k5ugpCaxGaJf6GePdVC2I4=;
        b=oI2VbvB5b9Jf8D9Tx5Yux11vTpxd5VFuw05Ye87+rFMI8t7882/cWRd+wJJp1B7BBK
         HE47MQeDngax9t2cFFLh91nHQ5qxq3zkMDA6WoUgwKklXUf/5TvVULR4N4PpLWI1CjND
         PL2iQfe8AJwmnAqTtnA+Gxe6L5o9XdflqzuKN6QK+7H0DPl6VZ+pWsqWuWeTJwnEKDj2
         gAkvJsvCBrD0f5SRECjVfs1PqZydTapONP/+rr7+DnomTqqtPibFFplepLVsIZuo7C99
         ls800MsWneRofsFVbW1fGxQVH68WS7QM2xTsheeNF2O61zDgS0X0Y+uKeiJnzjV+zKe8
         2lFQ==
X-Gm-Message-State: AOJu0Yy+3Soo0iXXCl+vh5uJy54kN9tFxsDnO6OqKiaHhmnteDW71HeV
	tLuUXgnJA5pBHGC2WMyjHx0LJTw7Sj1XWGDZobNmDlRXtBITJmYzLXTzxiUM9EvTFnm99oYIpjc
	3WTGE1kZBTBH1tkvHQBiH6rviWD1blomtPcRUtP7c3ZJ9yC4L0Yy/LMpWIA==
X-Received: by 2002:a17:906:478f:b0:a7a:9f78:fe4 with SMTP id a640c23a62f3a-a7dc4dfb4c2mr32474966b.3.1722534968936;
        Thu, 01 Aug 2024 10:56:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3YNYmcksNDsheMu0uIi0ecbeWrwb+5Hhu4U7CjUo9vDsR9fcD6yt49amTbFO0Q3Np4TeStw==
X-Received: by 2002:a17:906:478f:b0:a7a:9f78:fe4 with SMTP id a640c23a62f3a-a7dc4dfb4c2mr32474366b.3.1722534968454;
        Thu, 01 Aug 2024 10:56:08 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3d4b:3000:1a1d:18ca:1d82:9859])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c61575sm6510666b.92.2024.08.01.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:56:08 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mark Brown <broonie@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Philipp Stanner <pstanner@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: devres: fix error about PCI devres
Date: Thu,  1 Aug 2024 19:55:34 +0200
Message-ID: <20240801175533.51885-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation states that pcim_enable_device() will make "all PCI
ops" managed. This is totally false, only a small subset of PCI
functions become managed that way. Implicating otherwise has caused at
least one bug so far, namely in commit 8558de401b5f ("drm/vboxvideo: use
managed pci functions").

Change the function summary so the function's dangerous behavior becomes
visible.

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 Documentation/driver-api/driver-model/devres.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index ac9ee7441887..5f2ee8d717b1 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -391,7 +391,7 @@ PCI
   devm_pci_remap_cfgspace()	: ioremap PCI configuration space
   devm_pci_remap_cfg_resource()	: ioremap PCI configuration space resource
 
-  pcim_enable_device()		: after success, all PCI ops become managed
+  pcim_enable_device()		: after success, some PCI ops become managed
   pcim_iomap()			: do iomap() on a single BAR
   pcim_iomap_regions()		: do request_region() and iomap() on multiple BARs
   pcim_iomap_regions_request_all() : do request_region() on all and iomap() on multiple BARs
-- 
2.45.2

