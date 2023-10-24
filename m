Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13021378
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kuVRWVg+"
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54C91111
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 01:33:24 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6b709048d8eso3256255b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698136404; x=1698741204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3L72Q2C0A6XyhsC7UMGOLSZK5Azm/i+GpPRU3MZq4Q=;
        b=kuVRWVg+GOfFDNXgWomsTeaxeDK5DweWacq3Eh7wQKXo50OjyMnBfSUMh2r9xGvEfT
         5cOPGlpVkPwNjL5sT+eqGivC285OAWO8LyWrQejCOA69F4FNVQSJZesTTLXPm5Z7jVf0
         83RE/i4wmr4jYUpiwAG5MjzsexAlzEWSxlHjM7teRNWIqujqCbSdIzKR61K71/dOJOXm
         Ezu6Uj0oBQqxu7nSaliDAlNU2sROr908almnzcXk7xG/Hbj5dCZiS/sDebWuYuaDGMQh
         IwWnYpTQWHDBYu9DMf9ChpeGRgyLtAAncNwBf4dpxn3UARsGA4r93f7Mbmj6w+OyVbZW
         Ubeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698136404; x=1698741204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3L72Q2C0A6XyhsC7UMGOLSZK5Azm/i+GpPRU3MZq4Q=;
        b=PxmpD++dvceFIusOJUa5Wa6ED9fgP2n/kCutEnWQQKypPZoZS1zjNW84uOrnWxuaMk
         3XKsTSIFic/swUjlYCPqnTkacllm7ZhyDedkJ0yEtxlMnrhHajPi4Sve1NEFsS8goVT/
         Q7QbdzXLbLDaMPC1w5OMOw4dVWmEd6eRSATUjC/MVoNTvQN5sOwu9KbTh9POmGs6SMvD
         z06qnwjNDcEs1zKPiUoYKaWDpHN9pzkFnhpCt64lzM9jeWI5m18ZYttHAHWPcdjkkyft
         r8E1g0/DyzDGK4R4/hNZrCyx5ye27TWvUkspJt7ZHv3+6JlVfCfTxY6/PY0hT7hOql8w
         x9Kg==
X-Gm-Message-State: AOJu0YzOLHttjsCs3TosUQnJt+boU47ORobZAKVkRCsLmB0cuq3uqOiM
	GtQHjG/YzprMqdksp24rxvNdVQ==
X-Google-Smtp-Source: AGHT+IFRF2d7NaEqXWWjz92Xh2LjjQSzD8bGo9Dbzm/HViEErv6yA9g/lWFc+D2a7eTh24RKV68/bg==
X-Received: by 2002:a05:6a21:a108:b0:17a:e79c:c5ab with SMTP id aq8-20020a056a21a10800b0017ae79cc5abmr1692896pzc.48.1698136403796;
        Tue, 24 Oct 2023 01:33:23 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id y21-20020aa79af5000000b0068be348e35fsm7236977pfp.166.2023.10.24.01.33.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Oct 2023 01:33:23 -0700 (PDT)
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
Subject: [PATCH v6 02/10] maple_tree: Introduce {mtree,mas}_lock_nested()
Date: Tue, 24 Oct 2023 16:32:50 +0800
Message-Id: <20231024083258.65750-3-zhangpeng.00@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231024083258.65750-1-zhangpeng.00@bytedance.com>
References: <20231024083258.65750-1-zhangpeng.00@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

