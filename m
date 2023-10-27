Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC93C2A
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 03:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="L0j9qS/c"
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09387D7F
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 20:39:54 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-27d3ede72f6so1377525a91.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 20:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698377993; x=1698982793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5YTmJUCjjpdhuy3lqQAZ858a5z7S5zSCc8pR4j7dSE=;
        b=L0j9qS/c52jpRdSAjdoay53+uq6mhPq/L6aRTherG9grqUTiNk3dXRoy1P2fMTtJIu
         CiWt//TD1MbQJqHjpXdLChz1Koc+cqTIuMfXKeGo+YtN0PFuM6HoYN0hNWJzszSKg0yB
         H2rAlSKBT6y/qy1KEGmt2I0N0O3bVCSzjiGxBs/hc2YVAfMgBZZ034kuUzkVKCKgJKjS
         wUmqlkfASKylqI2ZsxE1j61kifVLNAuFggff8XHWuSU7tWoe8dtz82ydohoymi3tqQst
         tEJZHrI0W4n4Ji1aJlNjd/aUVZto++1F3u6sQa0ZE0bImicsvsIg7qRu6u9zgDMuR8gL
         X+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698377993; x=1698982793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5YTmJUCjjpdhuy3lqQAZ858a5z7S5zSCc8pR4j7dSE=;
        b=Bw/LHQSvVUYFHLmvsblZHiZpY2KfaRtEJ4Z+9oi0gKaedsNlWh3YRZl0NKw87WX0aT
         H/jSoAhqxyc4i+VxRNrZ67q52whhlxQaF/RtllUTNJ3DfNvlkhNbQU89ifEC65h7tesj
         3MQgFrPLf/kY+lOPDOtcOzXYganA5Ts3khTNQPZLQrEDQtIOiJIgvD0WyIuCwzhCg6JI
         LsBgWOqaimzyP9a0+J3Jj3oPPw6AKvGfgfqpB8oWfetJXaRS26T8mvipb286s2m7WOCp
         cAk+P1+9cLhcMLuFKgxLtjiC3D9yK0WcG1Eb5PFI+37gDZslPS9Cwz7V2cp3PojF0XOi
         GeaQ==
X-Gm-Message-State: AOJu0Yzab6NROwkWA+YXyQPzqUGBrIzZ9nfMOkhHOfY43jhu6cTIbgbU
	xu75dMRtWGPxE+hAugPwz36xAg==
X-Google-Smtp-Source: AGHT+IGP7vALm36zcf78WOHdDsQMZ6gR6l+CE8E8raNCoeG3jAG7u2Ud7OkIO091/2fqWLXD+y+pYw==
X-Received: by 2002:a17:90b:1486:b0:27d:e1c:5345 with SMTP id js6-20020a17090b148600b0027d0e1c5345mr1376337pjb.15.1698377993313;
        Thu, 26 Oct 2023 20:39:53 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id ms19-20020a17090b235300b00267d9f4d340sm2345676pjb.44.2023.10.26.20.39.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Oct 2023 20:39:52 -0700 (PDT)
From: Peng Zhang <zhangpeng.00@bytedance.com>
To: Liam.Howlett@oracle.com,
	corbet@lwn.net,
	akpm@linux-foundation.org,
	willy@infradead.org,
	brauner@kernel.org,
	surenb@google.com,
	michael.christie@oracle.com,
	mjguzik@gmail.com,
	mathieu.desnoyers@efficios.com,
	npiggin@gmail.com,
	peterz@infradead.org,
	oliver.sang@intel.com,
	mst@redhat.com
Cc: zhangpeng.00@bytedance.com,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v7 07/10] maple_tree: Skip other tests when BENCH is enabled
Date: Fri, 27 Oct 2023 11:38:42 +0800
Message-Id: <20231027033845.90608-8-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231027033845.90608-1-zhangpeng.00@bytedance.com>
References: <20231027033845.90608-1-zhangpeng.00@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Skip other tests when BENCH is enabled so that performance can be
measured in user space.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 lib/test_maple_tree.c            | 8 ++++----
 tools/testing/radix-tree/maple.c | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/test_maple_tree.c b/lib/test_maple_tree.c
index 464eeb90d5ad..de470950714f 100644
--- a/lib/test_maple_tree.c
+++ b/lib/test_maple_tree.c
@@ -3585,10 +3585,6 @@ static int __init maple_tree_seed(void)
 
 	pr_info("\nTEST STARTING\n\n");
 
-	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
-	check_root_expand(&tree);
-	mtree_destroy(&tree);
-
 #if defined(BENCH_SLOT_STORE)
 #define BENCH
 	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
@@ -3646,6 +3642,10 @@ static int __init maple_tree_seed(void)
 	goto skip;
 #endif
 
+	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
+	check_root_expand(&tree);
+	mtree_destroy(&tree);
+
 	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE);
 	check_iteration(&tree);
 	mtree_destroy(&tree);
diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index 12b3390e9591..cb5358674521 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -36299,7 +36299,9 @@ void farmer_tests(void)
 
 void maple_tree_tests(void)
 {
+#if !defined(BENCH)
 	farmer_tests();
+#endif
 	maple_tree_seed();
 	maple_tree_harvest();
 }
-- 
2.20.1

