Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858C66FA2
	for <linux-doc@vger.kernel.org>; Mon, 16 Oct 2023 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="abKwRmNn"
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832F1D9
	for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:22:55 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6bce254ba56so715901b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 20:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1697426575; x=1698031375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3L72Q2C0A6XyhsC7UMGOLSZK5Azm/i+GpPRU3MZq4Q=;
        b=abKwRmNnzlGZCY3tRMgEIeqabVUqnrsc73kFTdzliIaUuGYlhaNGFPSBwpUdMKBZI0
         nAZ/zX/RT2dcOPTOzY80G3FmbYSCtTUEOhkqOeUi2Z9w/Fv7GvPz9At3CaZ0OeoPNHdI
         ExT7GHm6YipgEFfgIjRgLptN519oO2XosJj+hOg2LqcXaN6vK9u8fIHc9jCfanV/Ws2h
         D1tvDrsBv4NHs4IU+UDdddoqueVIfdnVeZVX3E7V0X7dDPulw3WfvC30rlLhNjo51jxw
         ObHoaRU2hMg9yZzrjKNUENfzlUqNOMGUFLAg8U1EnbM/Rk1YNG6Vksxyb3Dxu99T6P+5
         TcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697426575; x=1698031375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3L72Q2C0A6XyhsC7UMGOLSZK5Azm/i+GpPRU3MZq4Q=;
        b=k6H9EcEBOm8BtK7SDVMrXRKjJ6dbUO2SzuTsBZu4XGbeTq7ZOidh13vGA2bEzED/e/
         1CLG9da/sWALZi3qTSfiZQG4m2ymmzPOQ4PBpjdYfDH/NGPYcBL9kgLiO29MapT+pwr6
         cCGIzUCgsw4soJneyPcnKauQ7Z/O6jLyJKVXFm/bvgKnGrWxttM1Jt/fXa9KRvdQTswW
         rqw3BYsq4vwMQ2xZz4ZS7ZfKfo+9nSefZnCpCgZX+qT5SIjH2qkJDQlT/HK6W+4q3dUD
         lU0RoffQbMvV6vfU999m641jsU2rjZEuO4GCiBI8iCTaB67TNpuyZ6Ft5UHmNd8AytU/
         N1+w==
X-Gm-Message-State: AOJu0YxF3x3gBcx8aG9eF99UTB31A30xSwPkkULMFsF5DlAR4kOPGlBU
	et35t4lHcTb/Qj0tZPTh2c3kPg==
X-Google-Smtp-Source: AGHT+IF6N8e9Loe20mQNUBXUIhiXmTkb8m7FtzL5gkme8mgEaofINIog9sVAbKEQ8545hYi479/lHg==
X-Received: by 2002:a05:6a20:1613:b0:15d:9ee7:180a with SMTP id l19-20020a056a20161300b0015d9ee7180amr33444332pzj.4.1697426575048;
        Sun, 15 Oct 2023 20:22:55 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090ae28800b0027758c7f585sm3452770pjz.52.2023.10.15.20.22.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Oct 2023 20:22:54 -0700 (PDT)
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
Subject: [PATCH v5 02/10] maple_tree: Introduce {mtree,mas}_lock_nested()
Date: Mon, 16 Oct 2023 11:22:18 +0800
Message-Id: <20231016032226.59199-3-zhangpeng.00@bytedance.com>
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

In some cases, nested locks may be needed, so {mtree,mas}_lock_nested is
introduced. For example, when duplicating maple tree, we need to hold
the locks of two trees, in which case nested locks are needed.

At the same time, add the definition of spin_lock_nested() in tools for
testing.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 include/linux/maple_tree.h     | 4 ++++
 tools/include/linux/spinlock.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index d01e850b570f..f91dbc7fe091 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -256,6 +256,8 @@ struct maple_tree {
 	struct maple_tree name = MTREE_INIT(name, 0)
 
 #define mtree_lock(mt)		spin_lock((&(mt)->ma_lock))
+#define mtree_lock_nested(mas, subclass) \
+		spin_lock_nested((&(mt)->ma_lock), subclass)
 #define mtree_unlock(mt)	spin_unlock((&(mt)->ma_lock))
 
 /*
@@ -406,6 +408,8 @@ struct ma_wr_state {
 };
 
 #define mas_lock(mas)           spin_lock(&((mas)->tree->ma_lock))
+#define mas_lock_nested(mas, subclass) \
+		spin_lock_nested(&((mas)->tree->ma_lock), subclass)
 #define mas_unlock(mas)         spin_unlock(&((mas)->tree->ma_lock))
 
 
diff --git a/tools/include/linux/spinlock.h b/tools/include/linux/spinlock.h
index 622266b197d0..a6cdf25b6b9d 100644
--- a/tools/include/linux/spinlock.h
+++ b/tools/include/linux/spinlock.h
@@ -11,6 +11,7 @@
 #define spin_lock_init(x)	pthread_mutex_init(x, NULL)
 
 #define spin_lock(x)			pthread_mutex_lock(x)
+#define spin_lock_nested(x, subclass)	pthread_mutex_lock(x)
 #define spin_unlock(x)			pthread_mutex_unlock(x)
 #define spin_lock_bh(x)			pthread_mutex_lock(x)
 #define spin_unlock_bh(x)		pthread_mutex_unlock(x)
-- 
2.20.1

