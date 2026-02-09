Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A1238C1A
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770627215; cv=none; b=s5rVbxMJ/7yseHexDRr7SQRwyzF68hjYHWmARJ1Xwt6IWZGWXfa9aD3pfIpuT6DyqK5C4FzpUL783q4P6oiqn+2gtBLoUEekfmz34zcWHqF00f24R97tgZHXeobj82pei9euKVg9um8e7ThScod0pSlcHMW14/yg48LAGv2GUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770627215; c=relaxed/simple;
	bh=I7RussHr7jIE+YwhryDgvUp6nHg/qg7le2TgdwLgn/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=td32vbWArupDhdPMnCQGWbDpo5WK6AcqodL9svC9VsdNsg/E4XJ9FtZLFTrp97EIzQmO8timzjq+UVe75rUGiW5jOpeWHsYInLlnFZC2m9H2wH3TD8Egw3qRc1tNrF8Oy7uENKKHOBsBvRcLd5pVNt6sIp6pZIOEExkdgNcchGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKaIII4R; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKaIII4R"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c47ee987401so1760828a12.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 00:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770627214; x=1771232014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GObI56Pf/Z0BmT1HYGW/jC0+YM2QQRZ0TQHkYLyVIds=;
        b=FKaIII4RKDO7YJfSaNdiUvJP2pH4Zjk/AjbJEaGegZ2jjEzJGHCG8/qAz8tOr5m/pN
         lTBdBFx8fpkDiEb0ohh6BXpsC6hqBmA4oMnz6aZ2fRL5ogcbh9poDHbdAtX4nq/yVylP
         XiJs/nctJC1VCfyMpSZ49TGcw8jpaH1p5lTc4cKR7YIs6mNA7skX+wXCeTmTwgDNQpbz
         SG4wEElVQ9yY2S5dDqZA7+I49fc33KRR9mgxtMS9ecs2Xg6s3kjlgQZURxJ4fJKnDTVL
         6Vl886DFDPYr31GHOyuMQwDWT6iJ2fe6ZJRe2piNWJ97rF+uOl+HMp7leHx8XC1rqdVZ
         aKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627214; x=1771232014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GObI56Pf/Z0BmT1HYGW/jC0+YM2QQRZ0TQHkYLyVIds=;
        b=sMHjctztqXhrQVomKAZE8hCHxMTaR+9cnbwkS6WcsSZrmDwA2SFID16lhml9oNDdYM
         SnIS/QYyL3jdEw7twsFsGIqjFAETYQWXZNVVIQ8y3LVlXzx8B8uwk7eKU3+4jCVJblon
         2Y89w5zmHF9fKniMfiUKnHUyF4LDcWanw6fVt8z/w0wa8iiYeZOnJodF99FZ2UrsH5/Q
         ujpsRyAvFCR3x70l8uZVav1G5wJ9gs5WJy5OVLOGri1NWw/psf023hWXtUwnu3XPNf+f
         Oa4kkwhC6/RlcAyK1/vo39XWkncBD1k14U27slvQ/RFdNvr4kQlrdmAQGMg8NL7xbPz4
         qWKA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ5ig6QZAhY3ZGJLUoxH3fY4hwfou06nSDQcskBbL8deTkTrszSRM1Z0BffkSA0i1sZ1Ctof8SNOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdld66SltGOZ1r+l33nOpu9FCCRAJ6rNPNvk/tj4Ov3k+U0PB
	E2uEze8ohR2fg1qjFiC53KOfgXcboZejXChZIHlrZ8PRaq7uSb8usbOR
X-Gm-Gg: AZuq6aIsoWAzQmqyd7AC6JJ4TuasN72pLthrzHUjk1rr6El52Eh4F6jIOAj6fg6B2+J
	+GR0R9Q87+nudGsipz5v1f/xmi+rNlKrxT9wLaCTgI08/rpL2mNKnYiSouQebmkY4fBcbLXhln8
	/h0XWZJM7PMjA03noUNJx0Ebbmlw8RNz7Apshdl6YbilLEU4LMBG237JZ/xqmtYTyZZRV+9I5oE
	20vc5mxkBs+a/YA1wZajQifU9rJvpkiPQpi39tAEzDvLUBn5URC3ameuCvw1toDZKgvsT0QJJ2c
	yTaUSF9/DxsKXsbCj9skj9tsHOxKuUSqZ30V1/XNA/gg4S2Zj/2ozsojB+syiYBTAl0PYQD4aqw
	eijVHEA3PFKBI+6xJitr+j5Bis1WvBmKzAYQUHEwEtz4/WKVD06MmbiJCaAiDBhp+RmDGwpMiNp
	3MyCJZ3+oqU8vm8A2bpKJJ1734sVMSfSvUdyWkCENsfvmbXKg3ua8xYShTdvvXKAj3JdcWOZY3j
	A==
X-Received: by 2002:a17:90b:50cb:b0:340:29a3:800f with SMTP id 98e67ed59e1d1-3549bc1482emr12444643a91.15.1770627214312;
        Mon, 09 Feb 2026 00:53:34 -0800 (PST)
Received: from localhost.localdomain (123-194-188-82.dynamic.kbronet.com.tw. [123.194.188.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c392608sm16061098a91.15.2026.02.09.00.53.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Feb 2026 00:53:33 -0800 (PST)
From: Min-Hsun Chang <chmh0624@gmail.com>
To: visitorckw@gmail.com,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Min-Hsun Chang <chmh0624@gmail.com>
Subject: [PATCH] lib/min_heap: fix spelling and grammatical errors
Date: Mon,  9 Feb 2026 16:52:50 +0800
Message-ID: <20260209085250.75237-1-chmh0624@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Min Heap API documentation and header file contain a few minor
spelling and grammatical mistakes.

Fix the following:
 - Add a missing period at the end of a sentence in min_heap.rst.
 - Change "customise" to "customize" in min_heap.h for consistency
   with the documentation.
 - Change "on to" to "onto" in the description of min_heap_push.

These changes improve the readability of the API and documentation.

Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
---
 Documentation/core-api/min_heap.rst | 2 +-
 include/linux/min_heap.h            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/min_heap.rst b/Documentation/core-api/min_heap.rst
index 9f57766581df..62439be2cdf6 100644
--- a/Documentation/core-api/min_heap.rst
+++ b/Documentation/core-api/min_heap.rst
@@ -75,7 +75,7 @@ elements in the heap and swapping them. It contains two function pointers:
 
 - **less** is the comparison function used to establish the order of elements.
 - **swp** is a function for swapping elements in the heap. If swp is set to
-  NULL, the default swap function will be used, which swaps the elements based on their size
+  NULL, the default swap function will be used, which swaps the elements based on their size.
 
 Macro Wrappers
 ==============
diff --git a/include/linux/min_heap.h b/include/linux/min_heap.h
index 79ddc0adbf2b..cb1cc0c0e8bd 100644
--- a/include/linux/min_heap.h
+++ b/include/linux/min_heap.h
@@ -40,7 +40,7 @@ typedef DEFINE_MIN_HEAP(char, min_heap_char) min_heap_char;
 #define __minheap_obj_size(_heap)	sizeof((_heap)->data[0])
 
 /**
- * struct min_heap_callbacks - Data/functions to customise the min_heap.
+ * struct min_heap_callbacks - Data/functions to customize the min_heap.
  * @less: Partial order function for this heap.
  * @swp: Swap elements function.
  */
@@ -373,7 +373,7 @@ void __min_heap_pop_push_inline(min_heap_char *heap, const void *element, size_t
 	__min_heap_pop_push_inline(container_of(&(_heap)->nr, min_heap_char, nr), _element,	\
 				   __minheap_obj_size(_heap), _func, _args)
 
-/* Push an element on to the heap, O(log2(nr)). */
+/* Push an element onto the heap, O(log2(nr)). */
 static __always_inline
 bool __min_heap_push_inline(min_heap_char *heap, const void *element, size_t elem_size,
 			    const struct min_heap_callbacks *func, void *args)
-- 
2.50.1

