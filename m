Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D41A58A
	for <linux-doc@vger.kernel.org>; Sat,  4 Nov 2023 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncf.edu header.i=@ncf.edu header.b="aDJFS3Pf"
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB9D112
	for <linux-doc@vger.kernel.org>; Sat,  4 Nov 2023 06:47:29 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a822f96aedso35439357b3.2
        for <linux-doc@vger.kernel.org>; Sat, 04 Nov 2023 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncf.edu; s=google; t=1699105649; x=1699710449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QRyo4uayRcD1OGB0/F9hU4wPpRqY3YBFvShQiftusTQ=;
        b=aDJFS3Pf3oowHLw6elukZyMOfBpXkaIhEgf3jyWGpUr/auFCGiSPrW2fwMEPzGOLgs
         rgVUv5PAycNB7EpLsZU0dvmy2kww1t8h0jd/lZZC8L7aOK41TQ69yYG1I3Q1/bXfq2FH
         wEEZIrSn8iuL7Ob6/u/Hfak1cRJ7RpcodusqZ9c9o7/yEm5B2c56zSyxLayo3LRt8tKI
         0HJG6Ckz8UmWky7dpbI1IvdCN6jEdJjNjwLQf4E2ONG9BhOZkRmKE3NlVK+8ORsardHQ
         Gej8eUfrM+8jvqwSj3hBhDkvf4O+Rf6/DA5jcAuwfEiY7myRMNqdJIK1ipI8ftLS/gw6
         PSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699105649; x=1699710449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRyo4uayRcD1OGB0/F9hU4wPpRqY3YBFvShQiftusTQ=;
        b=X0hYbHp3T9xBMJOFEjdLnlHS1ktlPD4Rk466oKlyMUuzDHYYXOf4fwR3BuZFoY78pa
         n8KyhR37BB/rneB7Z5WvoC9DFW2xRtrM3JWwKiD7GL9KzQh27oWGYqsp8sRevXvpEaEu
         EpRCKrmluvXmFoa3LXURCH7dMTIYFPC226MzMXaB6Cxun4qZxS78vPFLZFIqjFKsrQtc
         VH9Txisy9DbZNM5jIS999ngu42LVAT3atXGs7x9euRVeo+HBzuciyTTrCqhQnCIr8Xvr
         u63G8LDfGHa7qFkQrXhrGL4SPWAtV6tqxliGLM8r4myulRup4IIgoI/gZ/h4avK6LVZI
         eiNw==
X-Gm-Message-State: AOJu0YzHaFWnR+xzlbjVpu3A8rycbydQ1KNkimveLkOLWsM6NxuTLv1/
	qe9cKFrnq3QRUua82qLM56rd+Vvig4QuFRsWqfMImw==
X-Google-Smtp-Source: AGHT+IExWjX7G6DBFF4kwLIBDEgMe2CCFTXHC3Hx30D8yPn2WKmrR6jLGq4sGRWw1jQ8lSDpAO2cAw==
X-Received: by 2002:a05:690c:ecf:b0:5a7:bc78:81e7 with SMTP id cs15-20020a05690c0ecf00b005a7bc7881e7mr6540808ywb.30.1699105648902;
        Sat, 04 Nov 2023 06:47:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:580:8201:d0::c6a9])
        by smtp.gmail.com with ESMTPSA id p188-20020a815bc5000000b00559f1cb8444sm2088339ywb.70.2023.11.04.06.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 06:47:28 -0700 (PDT)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: corbet@lwn.net
Cc: airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hunter Chasens <hunter.chasens18@ncf.edu>
Subject: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused directives for namespacing
Date: Sat,  4 Nov 2023 09:47:08 -0400
Message-Id: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unused directives for namespacing I believe to have been
originally introduced as a workaround for a Sphinx warning.

Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
---
 Documentation/gpu/rfc/i915_scheduler.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
index c237ebc024cd..23ba7006929b 100644
--- a/Documentation/gpu/rfc/i915_scheduler.rst
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
 drm_i915_context_engines_parallel_submit to the uAPI to implement this
 extension.
 
-.. c:namespace-push:: rfc
-
 .. kernel-doc:: include/uapi/drm/i915_drm.h
         :functions: i915_context_engines_parallel_submit
 
-.. c:namespace-pop::
-
 Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
 -------------------------------------------------------------------
 Contexts that have been configured with the 'set_parallel' extension can only
-- 
2.39.3

