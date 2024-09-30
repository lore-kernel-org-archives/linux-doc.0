Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE54191F82
	for <linux-doc@vger.kernel.org>; Mon, 30 Sep 2024 13:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702377; cv=none; b=DSdyklbW72LMld5RRtCnWXfwVU61dm5Eovj3GIHxXSaoIycBI+8VMFwOhExMN3QT5fl/Om1vOO1+rgojwEzP/KFYqQY5+pPfk8Y31NFQPIy0yw+TXcNxzUAlarDkMK8CYOVtvUlPMQCaMKZqcm6adT1+x0iUZsX9GGaBhDTPlLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702377; c=relaxed/simple;
	bh=qkJkSWDqHo7jC7vv0hNOivOzsRpZFuaQI5nALrxjD08=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ifbqC51lo50R/D0qnqkMx8/OAakMB8BdG236ujBn5S1+CjFPWLqxtPrVWHmz8Z55KCnyCVyJqYwXVYlzCxfxZhJTZu6ALgXMy2Cj4vcSDw5608aWVnmSFFUUr/KOJdq220P0F2k8TY6ZdOZ4ZcZqfVN1ssMZkIsoHx252abCzJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=avUwoIvy; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="avUwoIvy"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e20e22243dso66949127b3.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Sep 2024 06:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727702374; x=1728307174; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=doWAxVN5J/L0Ed7YaNwkI39cvWlpAx52VjVcfHJc7OQ=;
        b=avUwoIvyUKhdinvDyXSbxUEwcvjLgEj83LPxgKXn56FWujSfu6sXCPcB9gqIqQkPkH
         E1xn4ZSVa5YlDc4s6vLLqB9Gh4DXENlbCpXvYzr1Z9vHQmGc1awAeItzulpjY/wezbbX
         BhnZ/TiH8Gq+T23UlR8jPjZbxwThXuUQhyHwcI1kHw9+jwAL7Swo6DyA8CWXlWTeF/nL
         ns2+zCl1w3pUf5ko4roJabHnQB8lVu4qANkOfHlm/CJE33chBkDfhNCsndfN8SXJy8Hr
         dK4B9eg8lAbMZUka60JJ7tCPfLU2afdFKDWwFmWacE84ZK5Odt8p8B2oVHb648Z73cpm
         vDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727702374; x=1728307174;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=doWAxVN5J/L0Ed7YaNwkI39cvWlpAx52VjVcfHJc7OQ=;
        b=BWB8yp+rGEc59DJ0rFGdcR9kSZaqqY3FyJAvytPOBihg0ZN2yp9dGdRl2mfq+asEJB
         14z6R7GLpbRiujgTZuZeW1CfNjXMEmPC0YmgZ/NYsLd/fHJSE42F7c2Qvb7v22toGebi
         HwiTdkSp7YJebneeyWeGGdKUjTBhEyL78+6kG/YwcOSZemTy7l/k0czQtk/p9pTxfF0U
         EREhX/c8214T55jjYSI0IK8xI7YC3dXhow8KnZ2pDbFu/d04XWrG2Xx0KxCrcy3BjpQu
         +z3O2K3Q5UDgOEASaKMGiiUwbCcOuaUuHS3xok/bTeVUtrfgOj1OxwL07jsXkzf5VHpP
         YPLw==
X-Forwarded-Encrypted: i=1; AJvYcCX4qY7PGfTC6A8CRtERrQg6j8SyCp1pmRjvmkfORUsR8JxWbQu+Hx/bA+pxYJzknSlnUT3AK68TtBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9eYy61LLtFPHekqB2JApNsm4MK+hvI0JodhQ4r/H5e+TWLLnY
	B5D6MDtErvUew2yPk42B0gVIyr5dqnJjeidXWdk7ApTzW0cVBYnHQUf9kSTRgjcTkEdndFg0744
	ES9fZcaZWxBwgGA==
X-Google-Smtp-Source: AGHT+IGPdgpJibr1yfp0X0+jCemoXxyx7N8akB5Pv3w4awlEs6zaJwawSxTtkIdxIhQuk7RIRN/1nZ+2AQnkTIw=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:67c7:b0:6d4:d6de:3e35 with SMTP
 id 00721157ae682-6e2475d39d8mr1073677b3.8.1727702373743; Mon, 30 Sep 2024
 06:19:33 -0700 (PDT)
Date: Mon, 30 Sep 2024 13:19:29 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608; i=aliceryhl@google.com;
 h=from:subject; bh=qkJkSWDqHo7jC7vv0hNOivOzsRpZFuaQI5nALrxjD08=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm+qTRv6lr2h6hJjTCYXUhWOzjlbFE2QW4rMqor
 4r+Yf4XSdCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZvqk0QAKCRAEWL7uWMY5
 RgooD/4xXLmdo+ytpDkC6yKYeUiuk+LHKaEYur6l95hgEs9scy357uIsll0p5wkGJ6St1FXnjmr
 zF8aR42eWfotFNK2URseQR/Z9SftbSXn3rn09iEM2E+hIM/uK+vjF8GvGXMmrzTPaXmrjcKCatR
 /GhYfHCsoFegd8y/bHUABjkdIeUhBYoGGaqdJ7xycuRpYz+BUJ+2BydT8dZRv+ZuRB5zYK5Rm1b
 H4GqbBJxtwkbh07wE2Xi3Y22c3MohQ+XWGsakBeMqQfvb2OXORSRR8HuDFf7y2a3wg9dQR4V6d5
 XL9epWfyGAsG392Wiedd3b5IaKFNz1pLGsyzSFDdbqESXTTkMZxuPfYo9ZyR7VUnss3kGLOVEec
 Pj+Q/xQLlRX23IFhsuz/j8icsK44bN9Y2td972HXSW23TPbWM9Ej+9t9OAaX8TdELvuwtNUPdF6
 2kuMW8+TIJP2Rdn2B6TURD5qOGV3Htpvuv/CgraUthXNppiTR21cLK50Oh86nUrsRBG9H4+TtXO
 gXPRVGLXpxr9hKhFN10FM2mrRpjUkTRXyYWUlGsl8aIb4EEOel+ky5u2gGPJd+YU5UaX3hxdSAC
 ivfSQMglALtu+gPTqk0qwJ7gvtocvqje/h4J++kJRVRISfosKeZMsXwxAVa6YL5+CIrz20liX/H e6RDoxBZ7t2hJKA==
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240930131929.1424352-1-aliceryhl@google.com>
Subject: [PATCH RESEND] xarray: document that xa_alloc uses the smallest index
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Wilcox <willy@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"

The deprecated IDR data structure was used to allocate *small* ids for
things, and the property that the ids are small is often desireable for
various reasons. However, the IDR interface is deprecated in favor of
XArray.

Clarify that when replacing IDR with XArray, you do not give up the
guarantee that the generated ids are small, even if you use a very large
range such as xa_limit_32b.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Sent previously here:
https://lore.kernel.org/all/20240201084739.1452854-1-aliceryhl@google.com/

 include/linux/xarray.h | 6 ++++++
 lib/xarray.c           | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/include/linux/xarray.h b/include/linux/xarray.h
index 0b618ec04115..b525113d8d47 100644
--- a/include/linux/xarray.h
+++ b/include/linux/xarray.h
@@ -860,6 +860,8 @@ static inline int __must_check xa_insert_irq(struct xarray *xa,
  * stores the index into the @id pointer, then stores the entry at
  * that index.  A concurrent lookup will not see an uninitialised @id.
  *
+ * Always allocates the entry at the smallest possible index.
+ *
  * Must only be operated on an xarray initialized with flag XA_FLAGS_ALLOC set
  * in xa_init_flags().
  *
@@ -893,6 +895,8 @@ static inline __must_check int xa_alloc(struct xarray *xa, u32 *id,
  * stores the index into the @id pointer, then stores the entry at
  * that index.  A concurrent lookup will not see an uninitialised @id.
  *
+ * Always allocates the entry at the smallest possible index.
+ *
  * Must only be operated on an xarray initialized with flag XA_FLAGS_ALLOC set
  * in xa_init_flags().
  *
@@ -926,6 +930,8 @@ static inline int __must_check xa_alloc_bh(struct xarray *xa, u32 *id,
  * stores the index into the @id pointer, then stores the entry at
  * that index.  A concurrent lookup will not see an uninitialised @id.
  *
+ * Always allocates the entry at the smallest possible index.
+ *
  * Must only be operated on an xarray initialized with flag XA_FLAGS_ALLOC set
  * in xa_init_flags().
  *
diff --git a/lib/xarray.c b/lib/xarray.c
index 32d4bac8c94c..f0579aa37534 100644
--- a/lib/xarray.c
+++ b/lib/xarray.c
@@ -1831,6 +1831,8 @@ EXPORT_SYMBOL(xa_get_order);
  * stores the index into the @id pointer, then stores the entry at
  * that index.  A concurrent lookup will not see an uninitialised @id.
  *
+ * Always allocates the entry at the smallest possible index.
+ *
  * Must only be operated on an xarray initialized with flag XA_FLAGS_ALLOC set
  * in xa_init_flags().
  *
-- 
2.46.1.824.gd892dcdcdd-goog

