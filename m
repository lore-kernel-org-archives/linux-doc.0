Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D907F4
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 02:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shopee.com header.i=@shopee.com header.b="llTHM6dY"
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16291A9
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 19:42:35 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68fb85afef4so423646b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 19:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1697078554; x=1697683354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Q0G7SAJYo4UkLsXiQBpIDaDgLDqF1LJ1c6VmD0yOVM=;
        b=llTHM6dYgFRz0uD+zmp5iv/aMgdmNzjEIW3KmrBNFkwvXoKKWBXB9cZG7GlHGCSpfS
         GlTSTJIICVEoRiG9P3+Id3a49fmOZJNbYRCOiGS5v5Ebtd1+WliuBuvpMA4kKCl0kKxn
         XprLpsj5wwBWSSt4YAV9//u43QyBHO+5eRXc6vZrgmjHQa4EBbq32bDGS5xrUeCNNhhR
         AsDGGblPn26y1+GYPmkn3C1fiZrJ6Wdk+dzuwCSw7Z9UvJQUhqUUTXMAIqWZxzuw5Q3d
         bHh7cKjqyT8KU3dn+JcVaEogtjHmlgpn6Iuu6atz84InyfP4wXdu1ME1mTebVZHOm3/M
         P2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697078554; x=1697683354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Q0G7SAJYo4UkLsXiQBpIDaDgLDqF1LJ1c6VmD0yOVM=;
        b=HtnyaWOOCCj+CT8OQN9GPd4Y7ZbBOdV4onPpWtwHjoAP/Wzaql3mE5+zTN5h59ZPHH
         hkseQ6xYY6o6eVNAWY6sAu+vBf4baUIev2n7jPERdcP6TXafqU2PfAwalweRGYe9miaa
         gwacfId96bDJaQexMGs4dDR/tvIvcBnr8Wh+V2ndXOpm80vMhb8g54AL5h+Yy8xFucmd
         Ym4ez9OHtX2oACVNlA93V4Q9PQ46Al43Rar5o/hPrKtk9y/gJmElz4Y/9sN1hHabbfz0
         tAvzYnyTCw9ZUsYVcb6gLEp+iKikJkmeGds2X/qKAJsWoVOaNAohi9pQshghuf4Ks9nC
         0dhQ==
X-Gm-Message-State: AOJu0YwPxCQPdGpNW1R3L424pqq0Qb0yvJe0ZTJ7qFgfxfZeTiQur9dh
	53qHY+Q1k7qwE/vJT7VaHlb30w==
X-Google-Smtp-Source: AGHT+IFFy3uxF7uFKfjkdWUeHCfhK/bx2P4yWiMaOXUfCJPbmqiLdy7t31a1cbnl7KgaPpe8K2vH6Q==
X-Received: by 2002:a05:6300:8089:b0:174:373b:4381 with SMTP id ap9-20020a056300808900b00174373b4381mr2417195pzc.49.1697078554508;
        Wed, 11 Oct 2023 19:42:34 -0700 (PDT)
Received: from ubuntu-yizhou.default.svc.cluster.local ([101.127.248.173])
        by smtp.gmail.com with ESMTPSA id a8-20020a1709027d8800b001b89a6164desm618060plm.118.2023.10.11.19.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 19:42:34 -0700 (PDT)
From: Tang Yizhou <yizhou.tang@shopee.com>
X-Google-Original-From: Tang Yizhou
To: houtao1@huawei.com,
	jack@suse.cz,
	bvanassche@acm.org,
	kch@nvidia.com
Cc: axboe@kernel.dk,
	tj@kernel.org,
	corbet@lwn.net,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yingfu.zhou@shopee.com,
	yizhou.tang@shopee.com,
	chunguang.xu@shopee.com
Subject: [PATCH v2] doc: blk-ioprio: Bring the doc in line with the implementation
Date: Thu, 12 Oct 2023 10:42:28 +0800
Message-Id: <20231012024228.2161283-1-yizhou.tang@shopee.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Tang Yizhou <yizhou.tang@shopee.com>

Our system administrator have noted that the names 'rt-to-be' and
'all-to-idle' in the I/O priority policies table appeared without
explanations, leading to confusion. Let's bring these names in line
with the naming in the 'attribute' section.

Additionally,
1. Correct the interface name to 'io.prio.class'.
2. Add a table entry of 'promote-to-rt' for consistency.
3. Fix a typo of 'priority'.

Suggested-by: Yingfu Zhou <yingfu.zhou@shopee.com>
Reviewed-by: Hou Tao <houtao1@huawei.com>
Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
---
v2:
Accept Bart's suggestion and rename the title of the patch.
Pick up Tao's Reviewed-by tag.

 Documentation/admin-guide/cgroup-v2.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 4ef890191196..10461c73c9a3 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2023,7 +2023,7 @@ IO Priority
 ~~~~~~~~~~~
 
 A single attribute controls the behavior of the I/O priority cgroup policy,
-namely the blkio.prio.class attribute. The following values are accepted for
+namely the io.prio.class attribute. The following values are accepted for
 that attribute:
 
   no-change
@@ -2052,9 +2052,11 @@ The following numerical values are associated with the I/O priority policies:
 +----------------+---+
 | no-change      | 0 |
 +----------------+---+
-| rt-to-be       | 2 |
+| promote-to-rt  | 1 |
 +----------------+---+
-| all-to-idle    | 3 |
+| restrict-to-be | 2 |
++----------------+---+
+| idle           | 3 |
 +----------------+---+
 
 The numerical value that corresponds to each I/O priority class is as follows:
@@ -2074,7 +2076,7 @@ The algorithm to set the I/O priority class for a request is as follows:
 - If I/O priority class policy is promote-to-rt, change the request I/O
   priority class to IOPRIO_CLASS_RT and change the request I/O priority
   level to 4.
-- If I/O priorityt class is not promote-to-rt, translate the I/O priority
+- If I/O priority class policy is not promote-to-rt, translate the I/O priority
   class policy into a number, then change the request I/O priority class
   into the maximum of the I/O priority class policy number and the numerical
   I/O priority class.
-- 
2.25.1

