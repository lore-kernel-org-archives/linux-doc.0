Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5DA12FB0B
	for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709238824; cv=none; b=ezjLJgGuBg5lhEeQKpqyiEgKVWxmCGmNciaiX08CrF+H0qjLusK0RxDAGW7jFBOB6yfTFvFU4VcsMRvSVsakHTXiJO+gXMfGb1xoR6DgjROeq5m0RoRelHbWFVd5q96+EDNAbP7djcuYChT45lWiQF8ilFPCX7qW5H7l966kH24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709238824; c=relaxed/simple;
	bh=NVxrcJoo12TU3qZCW+W6Vd8nOd2A/gUPkg/bJzxkS/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2LI8rsOxaA/NeAHCCt08xieTl0pA/jbD4RNt4RHvHuKNiBtKx6vvQP1gEbplznq6dX7cSEg8oQX5y+vBNC5IlpPqfwtiiJi4//n3yzfgvoITc7rm04pcNwWupDcFDhw3oEE3hN5MkipdxvzzTLXILIGU1dgYiAPZh3kC0rQWdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d2IgmnOM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d2IgmnOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709238821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SmIHX6Y7vZxIL5GaMIQETwxnKgF7XXugu9W+eqW/pI8=;
	b=d2IgmnOMk2VyEcgBGVAsEUnQPDs7H9PI48zCxzU7V85XVFSeQAbNhvryPO1MmFUGydztq0
	P4phTKMbupD/EsFqFMePwLZjx8c1W4zUlO7fKJzZ5lph8XqIdTDXWPK/exqmtStLC01oCI
	Fhsncu43OHtICu4pp1HIqODFWdLNt5o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-RIDhUS8LP4iqTJPrBISx8w-1; Thu, 29 Feb 2024 15:33:40 -0500
X-MC-Unique: RIDhUS8LP4iqTJPrBISx8w-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33e0d943844so466379f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 12:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709238515; x=1709843315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmIHX6Y7vZxIL5GaMIQETwxnKgF7XXugu9W+eqW/pI8=;
        b=bUx/vjJxST0YtTqa4htn5Je6n+fgX1Be9XCnjat4IQOOQ5AuG+wOAJ12qjFHaPvu+d
         Ighz1mxCOGVDDs1Ns9wFMhnSRXwmt5BSzNbCik6+FPXOEqju0hNavBUfImzue67v6eBL
         e4KD+otcAETtNnCorYbbnFsYaT9Iogl94stkiDWMAQ9E8qR4CteMShtu+DEgEGXZQmAG
         sXuoo/WkDQROUXTUTJjiHlDpbTUhL0MKpmo3DxVAJcMbR3aT5BFSHaefPkQoQ+/t7w9q
         o+UR83/DEdwY3P38o2n+fCTsbSUYCwSlcY1wkIYsdqPNpcOQIpOBXx4epOT6yLLHV6/Q
         r/6g==
X-Forwarded-Encrypted: i=1; AJvYcCU3oj+BEdyeBcuswWwD6e0asLyKKa2+T6I5LCUrvREF3ayYGbWW5oECI9oSH6mqDqn9g6Pp6w2U+UUus5BFmzytdmWl4zjnVgDV
X-Gm-Message-State: AOJu0YxYCFndwxvryYiu3jVXK6EJAK0AbxVMlSz+yhT/LKWDFaAP8K42
	tHPkRX+HIpNIS6b56JTWsZmW8HBy6pbDn/AM8kOZgSZeAn5ApopwSIeQRZapeyhMsal65XBUdd/
	EB9k7VFUYHnV+QUsQ+3gepzixRuu9lBcWQq9uA34YDK73e7q3Y7ArYvg9iA==
X-Received: by 2002:a5d:49cb:0:b0:33e:1818:7956 with SMTP id t11-20020a5d49cb000000b0033e18187956mr86353wrs.5.1709238515383;
        Thu, 29 Feb 2024 12:28:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5Jx2+Irv/obGwjeP9whbDMr+s9YId14EB3u4zXUdHLaSwpMrti0IWA9JKGqUMoV8obWO77Q==
X-Received: by 2002:a5d:49cb:0:b0:33e:1818:7956 with SMTP id t11-20020a5d49cb000000b0033e18187956mr86343wrs.5.1709238515052;
        Thu, 29 Feb 2024 12:28:35 -0800 (PST)
Received: from toolbox.fritz.box ([2001:9e8:8984:bd00:2340:7b35:5e60:4abd])
        by smtp.gmail.com with ESMTPSA id h5-20020adf9cc5000000b0033dd9b050f9sm2604385wre.14.2024.02.29.12.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 12:28:34 -0800 (PST)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: 
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Document requirements for driver-specific KMS props in new drivers
Date: Thu, 29 Feb 2024 21:28:31 +0100
Message-ID: <20240229202833.198691-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When extending support for a driver-specific KMS property to additional
drivers, we should apply all the requirements for new properties and
make sure the semantics are the same and documented.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 Documentation/gpu/drm-kms.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..afa10a28035f 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -496,6 +496,11 @@ addition to the one mentioned above:
 
 * An IGT test must be submitted where reasonable.
 
+For historical reasons, non-standard, driver-specific properties exist. If a KMS
+driver wants to add support for one of those properties, the requirements for
+new properties apply where possible. Additionally, the documented behavior must
+match the de facto semantics of the existing property to ensure compatibility.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.43.0

