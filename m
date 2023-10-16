Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81D154BD
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 03:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ldXmvkon"
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C472B198
	for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:23:42 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-27d1373f631so3255773a91.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1697426621; x=1698031421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVtomugZIRVe5XO/IomDBee5ri378ZRM5/INN5nVYsk=;
        b=ldXmvkonFc0oiRTa3tuI17TeE/i5DRDVkQ099+h4xoCEQKH/OUMGK9IGih3zfhX1ts
         BkJAi9wcx46uomc/yOdmAclf6OE/lQ9eVqYIM4+Cb73UjmVkx9DcDY10Qv4yn+z3lGDd
         cao9Ouzf10x0ug40yO9UYynQ/kv7Sy9MGBtnFalBE+TObIGDy1mEot2XEBlHwv3yBrZa
         oAqgKELyfPoKnsXiiq67dn7FywAJzYZTVellFmvhkxs9N0hxvOJm2V7JPNoos88uh3Hz
         vK0DiTCnpbo3WS1zAhUqcoeMggBhBboRZbwu0yNp/PKfC/EA7Xeg7HVOagM+rm9IDqcL
         DtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697426621; x=1698031421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVtomugZIRVe5XO/IomDBee5ri378ZRM5/INN5nVYsk=;
        b=JOYSibeQ6i1Cg+g8AxWkL4j9lssddRFdQcJ8qnULk0aMSiXHILuAnNKygYypJPT5h0
         4kxX58aNomttO2ukZ1Q0XB560F3OIF0gZQeDQ0HiqenPdD4A5QceTzoftAYgQMolKkUY
         LPaRucIH5l1oFAtQx51oKDCr3Ym3sBLaTOmQzBKyJVZfwbd+Wp9bkKBZ1dSb08fuqp+L
         Zzwttzrvto0hLciy1tFuBjkkj9eAPAOj+ClPqLPX57T3L8tiUSyV5gtZHZtLULcrKlYl
         G+yahcft62V23ZtRbH60HzcpNwX1z8Yz+8PUv62BpPVa/HyU7K4Xs7PSgHoI/b1QbgNq
         +v/Q==
X-Gm-Message-State: AOJu0Yygyeg9UaVOpGIwFdUAgDt4YP2WuH68D/0+l6kQIAHnKcc7tVbA
	7C9jxQTrCBKSbXY19wqJp8G6NA==
X-Google-Smtp-Source: AGHT+IHSb0DNGBGR2h/8IDjSmu+jqGvudTUl4FEPI1UTDCPUIrsebdcLp2Rpr+bgZ6cxOHBljaILuA==
X-Received: by 2002:a17:90a:d48b:b0:27c:f2e5:a82 with SMTP id s11-20020a17090ad48b00b0027cf2e50a82mr15318761pju.15.1697426621551;
        Sun, 15 Oct 2023 20:23:41 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090ae28800b0027758c7f585sm3452770pjz.52.2023.10.15.20.23.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Oct 2023 20:23:41 -0700 (PDT)
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
Subject: [PATCH v5 09/10] maple_tree: Preserve the tree attributes when destroying maple tree
Date: Mon, 16 Oct 2023 11:22:25 +0800
Message-Id: <20231016032226.59199-10-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231016032226.59199-1-zhangpeng.00@bytedance.com>
References: <20231016032226.59199-1-zhangpeng.00@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

When destroying maple tree, preserve its attributes and then turn it
into an empty tree. This allows it to be reused without needing to be
reinitialized.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 lib/maple_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 6e0ad83f14e3..9b5e5580b252 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -6779,7 +6779,7 @@ void __mt_destroy(struct maple_tree *mt)
 	if (xa_is_node(root))
 		mte_destroy_walk(root, mt);
 
-	mt->ma_flags = 0;
+	mt->ma_flags = mt_attr(mt);
 }
 EXPORT_SYMBOL_GPL(__mt_destroy);
 
-- 
2.20.1

