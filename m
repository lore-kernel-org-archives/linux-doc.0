Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D0B1C9EAC
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729703286; cv=none; b=u8EfTtzjbtUxRKpm+HGq4SrxUIchY+Sp1KZNNFsBQy4IBVeRkODL99TeQmcL2djHFfnZ2ADatdwSSd4gMUPsw0tvzjknXF7aRHaDq5AAnwRBzzB/Pr1s+ez2UlAJOdmBXPFd0fzE91+MMyM+vGAv+VhoFAQW75pt+su4zi3Xd4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729703286; c=relaxed/simple;
	bh=oPiAZk7sAUwyc2ZRzUfKOKHVYouPvs61/fhZTZAzOCM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pE+Sj9Xt2x88R344zVb7JyQfkdnBtTkndqQOkyv1wy+/+5o1Oo383GiYt1aS1nBvfzkDTm9ptHXlxAAa06u9CT5pzLaWIE8id51GoEZQytZF6fsGQka9GAbiD0qENq3uDaSKM2BkeFGJYv1zrCgh95G7z+NtRi7SfrJ8QhDoOSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qx652BjR; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qx652BjR"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e2954ada861so17289276.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729703284; x=1730308084; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy4VkAGTnueEjEvw1TSjR77Zk0lX1faSNj+Oljrwa2Y=;
        b=Qx652BjRJlLBDhiwtgP7rFltqcVCeOz64AMfJMi1lfmNwRT3W6yJF2h66vz/NOdKvE
         iZX2r/6r71iZd3H6wP+kW3t8a0HXMP2YOsXTg3tOJAbvPBlyVSndmovQp59wBX4nnbV8
         jejqeBwwjT7qIeRe08oGq0Cp83lM1+FOvt43wByN6sfYVEa14DIljwjJONrccZ7wFFHv
         fZNNV++nuuSoZIeX9NJpihOasG9IF1MQ4QIyGQFQJs0TmnWguyVWNAywiZshv+JiuOUm
         SH/lNNTmYiapZtyvrkKBGRczlN8UQ2w9m85DNYwABykAZaiWY/T+pOmFff90ZJdc96hQ
         4Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703284; x=1730308084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy4VkAGTnueEjEvw1TSjR77Zk0lX1faSNj+Oljrwa2Y=;
        b=ehs7hw9pLcJ6xOWUjv+sw3CyrzkVWlmsaY0kW4/Go3bFaFKBgQoE/MIFPMf+75I91P
         LAW2G7Nq5nLjbzNe+9h8f2sQX2hRysDnInxiEGGJxr8UyfRCK1w/fa6rqPgzJS4oHt6h
         HFqpstXk8ojel5OYW54IZt8syt7WnDh/H6DGxZPq7opL0I0dPMh1qvskq/Gwmbd2ATx7
         Zdc2ljly2uR1DqMO3tHOt3f5nmsIzSkp3lzmPKsHBFXy1YtTZDhSDh9Ut+1RgLb9jDND
         ZfNpKM184lKYAqN2DeDzgzzS0D6NTdMesKC2zuqlqvrfeIYjaEjbOxb8nGLRn4z5jsMS
         dnRA==
X-Forwarded-Encrypted: i=1; AJvYcCV6L+Wg2J5kV9s9UxS1I+J9D3wfOz7pHObV+ClT8Fu9eMZdwyUCmdjImDbu69eGuw8OS2yw1ylZIrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXekiwp97LK2H73kmCFr+glXiz0LNn1UPQ50wbFQ7fXfbAT4pu
	8tfiFyUkAkXdlkJlxy6TlPfsiM/IeZrTbAvUlZyRSEjDhcFYvelU0qCHBwaWOr8rW2duRM9Oxer
	Lrg==
X-Google-Smtp-Source: AGHT+IG5P3EOBq94xAhs93OihXu6fn1+vh8Hj0b9Xh0nro0ohDjLm9Tm7P85Bm8yXiSBBXuIOUCegUy3OSE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:a087:59b9:198a:c44c])
 (user=surenb job=sendgmr) by 2002:a25:7241:0:b0:e2e:2b0f:19fc with SMTP id
 3f1490d57ef6-e2e3a631bf2mr3476276.4.1729703283882; Wed, 23 Oct 2024 10:08:03
 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:07:54 -0700
In-Reply-To: <20241023170759.999909-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241023170759.999909-1-surenb@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023170759.999909-2-surenb@google.com>
Subject: [PATCH v4 1/6] maple_tree: add mas_for_each_rev() helper
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, urezki@gmail.com, hch@infradead.org, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, yuzhao@google.com, 
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	maple-tree@lists.infradead.org, linux-modules@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>
Content-Type: text/plain; charset="UTF-8"

Add mas_for_each_rev() function to iterate maple tree nodes in reverse
order.

Suggested-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
---
 include/linux/maple_tree.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 61c236850ca8..cbbcd18d4186 100644
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
2.47.0.105.g07ac214952-goog

