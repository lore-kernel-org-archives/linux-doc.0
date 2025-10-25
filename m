Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F58E31A04E
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410489; cv=none; b=QiaByNGBqjB1oPsPK3WQ+upCJOe+mf3/WpJzYsZTF7ycxlxGRhLCsziuxB+1S/SN//i2ANFylg5gGCn8XgXcNJ4CbYAnxfG1fdbV+NIVG1cspXS5bdafVrHMGRlyNIkQcSzOMPlfuuAoewH5VlNLcCronHt5XJyEJv41vgGb4VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410489; c=relaxed/simple;
	bh=W0pTJAcfrpLd3MSeWjU9C4zToTzxqvWOKJPAJegCRgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ae+Sz/K0cRpAFGt4amAYboiTq5QBJd3aUupDU4nflaOjoe7PbFKPUT4F7rOyL+vmkmNik/6/qjwdhfo83AiqokNbFqjVXsQtjH50fKDVeumAI/3PFJS6+yVNGjH9O/Q2tpcSnx2PO/hgver/wyY723K7QuNPqx7+JCzpS6PA1yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmdkCzlR; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmdkCzlR"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-88f8f346c2cso332144085a.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410486; x=1762015286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=;
        b=HmdkCzlR2ZV181sY1F/mM051AIewCxk4RD++RSXV/4eyJ6IOO5xFkp5K47ZeLSxExR
         CVKkV49imAR9XLihFoy26xUnIm/67GwVVbS8GkCY4t2LuFdAI+n48O5Dn/jX3KrOaeJb
         VppNAKgxyJGqSMPRcUyIpouAMTXEuxbkOwTzqv3MySV8rXeDShyYkdl4fWUYxJWId6s3
         4wrATqS3p6T3HaITk/P8lWs5zRlOKFnEWfKP+aE7oKmbm/kewrPkES4JDuZNXTqU0ePM
         wx5uIhsmoo1R3Wuid/0fLO5+82UkdRowsq+JEWeQoDYOs8BFfS3a79DI7SZGW6FU1Qio
         +b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410486; x=1762015286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=;
        b=tHml0MQPSNJFs31mAJUUl+CHjKOWaQV88fBOecQHmudaS5MKcIWnDXJQWQq3pAndYz
         VIGUMB1OwteZgzsWMwYxHg5MLttsCez2VKMhXjxrUkDMLijexixcANObnZuzimfwxAZ0
         iHn9dg3q0TLoYvmweP8feCZfJNY4Y3GepOOe5fXh+7ekTv+Vhcpl6NdfkgkOZiFUHy0q
         07ofxI/Pgm/oIN4FOhZFJ+HHMI45bpeb1pjkDKhMJPg/s/fZ1mBe6V22GUldDR8wjWxU
         I0RwW8fpkQ/A7Y2V17zbwl4WvrKw4LrQAPAhOA47BrnA5Q2Rx/t4kf6IsVAYaDlTv6ff
         FgIw==
X-Forwarded-Encrypted: i=1; AJvYcCWeywJaftOvpNR/VrM2CJOZ24w3JSIb8udlK3xOVWiN5ia32WFVaHWVkSwdanDK2PEV2D/TTnHq/iI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcLzpVNiE7rk3a4oHCwdcvMWQ3v4koesXa/uXvyfuOU/bxUJ/
	tYD1xJAqz8XXa9Vt6K3yQETZCw1XBePUxfh/HpgyOJ+katBzSri0UUrz
X-Gm-Gg: ASbGnctvT6A47KtxgjC92Rc3Y5ehhpAAR3bTRvNQAnFctcwX4akgfhGL+xtjHbBV5tc
	kiOUxeq9FBi5enYp7C3bfc0XSDTySfPCFFOi1tHyyGxe5/iqoyFFH9u/sOEJiLjGeLOBSShbXKa
	Apffy7uZKe6JWKShwEp84ii2ZN5oa6Q7vfmG0HoX9/t7KQLCKP1W2V/DS59wEyjK51Xc1rpL6Tk
	9AmwSynUt6JF+c4pzcB0AFKm67XyTs9T7TyPURMBoI+NeBdXzqtCVmr28twnmxkPUaeQiWU2lV9
	NA2EkQ51SCH1El7yEGJqJ+zGtz4NByX+No5NI9jvdRwOV4GsnnLcGH0/IT5uQvSReSOC3eeFP/U
	tum801PAK1rqIUIHB8J6936XKvynG7QyRVS+eZLq6vd0NB5p6jj9YlNPHAXAC9y4H1v6jveI+
X-Google-Smtp-Source: AGHT+IEqr7DdALG20ZOSBwW3gigwHtT069Vv0Qyq2izolgtR2Xh/1150BfEGa5vrjghcvepsgiDnaQ==
X-Received: by 2002:a05:620a:40c3:b0:85e:429b:b5c9 with SMTP id af79cd13be357-890712b9494mr3891854585a.83.1761410486528;
        Sat, 25 Oct 2025 09:41:26 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37d72ecsm15371681cf.9.2025.10.25.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:41:25 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 21/21] Docs: add Functions parameters order section
Date: Sat, 25 Oct 2025 12:40:20 -0400
Message-ID: <20251025164023.308884-22-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize parameters ordering in some typical cases to minimize
confusion.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 Documentation/process/coding-style.rst | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index d1a8e5465ed9..dde24148305c 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -523,6 +523,54 @@ below, compared to the **declaration** example above)::
 	...
  }
 
+6.2) Function parameters order
+------------------------------
+
+The order of parameters is important both for code generation and readability.
+Passing parameters in an unusual order is a common source of bugs. Listing
+them in standard widely adopted order helps to avoid confusion.
+
+Many ABIs put first function parameter and return value in R0. If your
+function returns one of its parameters, passing it at the very beginning
+would lead to a better code generation. For example::
+
+        void *memset64(uint64_t *s, uint64_t v, size_t count);
+        void *memcpy(void *dest, const void *src, size_t count);
+
+If your function doesn't propagate a parameter, but has a meaning of copying
+and/or processing data, the best practice is following the traditional order:
+destination, source, options, flags.
+
+for_each()-like iterators should take an enumerator the first. For example::
+
+        for_each_set_bit(bit, mask, nbits);
+                do_something(bit);
+
+        list_for_each_entry(pos, head, member);
+                do_something(pos);
+
+If function operates on a range or ranges of data, corresponding parameters
+may be described as ``start - end`` or ``start - size`` pairs. In both cases,
+the parameters should follow each other. For example::
+
+        int
+        check_range(unsigned long vstart, unsigned long vend,
+                    unsigned long kstart, unsigned long kend);
+
+        static inline void flush_icache_range(unsigned long start, unsigned long end);
+
+        static inline void flush_icache_user_page(struct vm_area_struct *vma,
+                                            struct page *page,
+                                            unsigned long addr, int len);
+
+Both ``start`` and ``end`` of the interval are inclusive.
+
+Describing intervals in order ``end - start`` is unfavorable. One notable
+example is the ``GENMASK(high, low)`` macro. While such a notation is popular
+in hardware context, particularly to describe registers structure, in context
+of software development it looks counter intuitive and confusing. Please switch
+to an equivalent ``BITS(low, high)`` version.
+
 7) Centralized exiting of functions
 -----------------------------------
 
-- 
2.43.0

