Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ADF3A1CD
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 04:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725252096; cv=none; b=inirKCjvIoxWiKK65LFS3ekFWPres3C1wYGehOOAcUZ0cxr1WT7CCgptk+OOwBSYpWt6cwHkHl6OBAHGkqjATbqDObgb32wmJ0AhHktI0W2xluAlxHH5A+Rtfcp7s4OdoTUKB5101HojvgkN6xnAniUGegUc7GvmpTWTKefADfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725252096; c=relaxed/simple;
	bh=knnBZu7kPS2XiZHCOoomuagEtSw2A+8o8O+N0AJpu1I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MMMz5Q03LQerax20dK9JQgpPSqzSAOGHl8HAV56xloVzk70AEipZ9nRsiqCKwSH4UIFrhNhi1+8eO7N1VTb9gHHOmoOFpZku7ew8wIYhWAcUr8FnaxGm1DTUjQcWs9AsqIOruNY3EbKg3fLiMwA35fvin07IOVVy7a87waGD8fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ObbJEsFl; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ObbJEsFl"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02fff66a83so6351080276.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Sep 2024 21:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725252094; x=1725856894; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kLpU39ux3x2TTO/xeONsOF6qZRhVUZNcpjltFBicrmM=;
        b=ObbJEsFlLJj8q/uKPICo68h7XtFK06WRs42lj1wo+168rApzvRYv51HHAlJitWtqhe
         /uNRbCQ8Zmt/9Igg0ogICyUA3lZO9IfvX3pUV25vgVQz+ys9AdH++a+hDTIkc6e1tqHt
         fdybiZ7BtsHMX4zid+OMrBrn90A1oPdVW3rHcZvmkOTSkO/tI7piYo0ajYi78Al6IAmJ
         qaG8Rwy/6Ebw8cZtQyzfQPIAW2G++DWwCYOn5Kbh9ugsFMlCLN1O0xkdSKpS/DTZQ0H5
         1Zmd/csCJnyNXSm8miBpMWZa+P6PIF4PupFNY1iySiwyLlidYQfNw5OZbl/ZqaiqSyp8
         BXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725252094; x=1725856894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kLpU39ux3x2TTO/xeONsOF6qZRhVUZNcpjltFBicrmM=;
        b=P7UUV0LJ3jbnJz13wePNYoGcPX7NcCgIs5y7YJRkAwUrO9VnTx7B+U3o3oe2oQLIZu
         dkxy+zGppd4gqLAYfThpoSlobflhea4MJsMtjeSoKv1femZxeMMFfqCmY4Bxec6N/9+E
         l5Vmtt8nSSPhFTo7GjKNC6qC7YCf5c7NDeEE3DMyxvpTk/DDzJAbwfWo6zMrrQVKnTjm
         ymuGr/NodtBb1BJJqU/KX7rNGmf5vvurdkxhmHMY+06BumH5ylufDPHd9ueWjsnRrhOE
         ZkVCQCbuRj+r3Q4Wa2xpQQbL+R4yatq1Di+q0PbpglNDmvMKBYC5R6QOdxV82JWt8xYC
         j8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUWTjSwrOAHsW/zJCjpMMXgoiC6NJm4DxLTso9TTwN83iyjcYuoa03OfJL8H67dduSVeakPX5eqrXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLrU7WoALT9+Gtl2OTt25WqUCdsYzfrh8fOBJrb8X7Z1bERa1X
	5TkTxOsFC3IsAVpK4nEKCKFgruhnPGxfoQh9o7sLBYlRZBd/N3SVkXkgMSftLARZzdd/ZM3GEv8
	qsQ==
X-Google-Smtp-Source: AGHT+IE+2G0xxDfv2kbdFSiqwhGjdz1DeNRKuCcVpqvSyerK6sADotCLCA7OoS3t5ommCEFjIJVLeySgq3I=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:7343:ecd2:aed:5b8f])
 (user=surenb job=sendgmr) by 2002:a25:83c4:0:b0:e03:3683:e67f with SMTP id
 3f1490d57ef6-e1a79fed1aamr15821276.5.1725252094100; Sun, 01 Sep 2024 21:41:34
 -0700 (PDT)
Date: Sun,  1 Sep 2024 21:41:23 -0700
In-Reply-To: <20240902044128.664075-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240902044128.664075-1-surenb@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240902044128.664075-2-surenb@google.com>
Subject: [PATCH v2 1/6] maple_tree: add mas_for_each_rev() helper
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com, surenb@google.com, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>
Content-Type: text/plain; charset="UTF-8"

Add mas_for_each_rev() function to iterate maple tree nodes in reverse
order.

Suggested-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/maple_tree.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 8e1504a81cd2..45e633806da2 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -592,6 +592,20 @@ static __always_inline void mas_reset(struct ma_state *mas)
 #define mas_for_each(__mas, __entry, __max) \
 	while (((__entry) = mas_find((__mas), (__max))) != NULL)
 
+/**
+ * mas_for_each_rev() - Iterate over a range of the maple tree in reverse order.
+ * @__mas: Maple Tree operation state (maple_state)
+ * @__entry: Entry retrieved from the tree
+ * @__min: minimum index to retrieve from the tree
+ *
+ * When returned, mas->index and mas->last will hold the entire range for the
+ * entry.
+ *
+ * Note: may return the zero entry.
+ */
+#define mas_for_each_rev(__mas, __entry, __min) \
+	while (((__entry) = mas_find_rev((__mas), (__min))) != NULL)
+
 #ifdef CONFIG_DEBUG_MAPLE_TREE
 enum mt_dump_format {
 	mt_dump_dec,
-- 
2.46.0.469.g59c65b2a67-goog

