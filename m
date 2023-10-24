Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957621115
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SNEB0fqk"
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083F010EB
	for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 01:34:10 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-581d4f9a2c5so2707637eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Oct 2023 01:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698136449; x=1698741249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzccM6C4HLhaCIv/SAdijHFdTidMSXBWQyZ1w5RDJYw=;
        b=SNEB0fqkUuNyllJMMihVQAlGEvxlD846I1ZA7TkiLKmn/zyiO9QTOKglOHgTOcy7cw
         YaQlyKeiffS0uBl0lsyehChNpguuAEKJpZsQ442epIy4bfYmwaCX82TCvQ9KN0h3NGUV
         mxBJaH2rWV1QYqjdWxijJtnCIpnOTP9hu7rIzjFqVqMUYJZUP42NmhsYjTqDZpdFVIa2
         rH4ZlQYIjLZVgBGvDx1lkWCUz+ETFTNWdf3q5XYEi5MWtUfNqfG7SY9kwJI6VQ7LHvzy
         ccFB3SBBXl2A7Qla4vYnkGr+P0ogb5fKONd6b26qNaUv4Jvq4fW3EDpC0hAgGT5zTGbV
         NUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698136449; x=1698741249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzccM6C4HLhaCIv/SAdijHFdTidMSXBWQyZ1w5RDJYw=;
        b=HI65hik2RJuigNG/j80k1tJitAIF86N9KiJHB4bXzjHfL2RYxmc3Y1eiXAiOHXa50z
         xIzIiTqvROtfEx4N44OyfR03KrND0oGXzOS2d3ITs8xb1yAa9F9Rs50uOSylIRybpmy0
         Ku8VAiwko7JjKTVIupYg15EHCjndyx6pjVXZ64RAZ8/nyi1B+Te9hpsSiNXJx30owSNy
         vivh4xNiCDEN20N1fzV2PuCEeEsrOvxSNgwVsCQztqvsLiccadFPS2T+DK1L60Z8iWcu
         K/OhSwx1h4Ak1fKUeoIK1qnJ9rdksjjrCvcgnWJjrplAlafMj9DBWIPY/Y4Xp9xmur/9
         QQ2A==
X-Gm-Message-State: AOJu0YyIb5likeD4HsdEuyGrgy1zyybAe91cWuDmJ3F1crDSctRr5ZB1
	CNnU9Wa1H63hVNQwkmpDq57/Zg==
X-Google-Smtp-Source: AGHT+IFL9wgTTdwcf5iN1EU6ZDwg7/3PqxSbUY7aeR+GMticX3N3Q7oIRaxH4CtsM5Y8o0vT2v0b1Q==
X-Received: by 2002:a05:6358:810c:b0:168:d6cd:7b2e with SMTP id p12-20020a056358810c00b00168d6cd7b2emr7924030rwk.29.1698136449463;
        Tue, 24 Oct 2023 01:34:09 -0700 (PDT)
Received: from GL4FX4PXWL.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id y21-20020aa79af5000000b0068be348e35fsm7236977pfp.166.2023.10.24.01.34.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Oct 2023 01:34:09 -0700 (PDT)
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
Subject: [PATCH v6 09/10] maple_tree: Preserve the tree attributes when destroying maple tree
Date: Tue, 24 Oct 2023 16:32:57 +0800
Message-Id: <20231024083258.65750-10-zhangpeng.00@bytedance.com>
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

When destroying maple tree, preserve its attributes and then turn it
into an empty tree. This allows it to be reused without needing to be
reinitialized.

Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
---
 lib/maple_tree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 6704b5c507b2..b9e238e7a7af 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -6765,7 +6765,7 @@ void __mt_destroy(struct maple_tree *mt)
 	if (xa_is_node(root))
 		mte_destroy_walk(root, mt);
 
-	mt->ma_flags = 0;
+	mt->ma_flags = mt_attr(mt);
 }
 EXPORT_SYMBOL_GPL(__mt_destroy);
 
-- 
2.20.1

