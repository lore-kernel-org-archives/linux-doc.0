Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339037AA6C
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671813; cv=none; b=dQxN0qNF1/k1WKU50VBW1uwjL+x43F22iI9wgyrd2HJqxJe9mDjmFyrug8wSYnfyK65CbpcdqF0WyXjCO7gv5XL9qRVF+sJGz7aeNk2Ntf6r2J6ZWLA3ZW87XES4ZKtZwk/eQEk6r1ligTvTYnHR655vdvOxf6LfRK4UkIH6GD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671813; c=relaxed/simple;
	bh=FmkY4SatpzjGfLIPpd6Gpluj/xLWyAKYAcW7/q3R5Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7nIqIjtZ1pOCBmIaKqWdRUrKxp/ExPpwXaAmhCoaXDrUMqw7QSS/wx+KAHxhZSbTkX2gUdO3LdccCxAGMkgLjkvRfEmmKQrUPSqcp6PXrRRnuf2StzFHhgut8UYsbzARK+dKH0QRBDw/xWrHWFSncVa939s90YQZkWy2SQoSmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI4zLzLf; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI4zLzLf"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45c8b850f96so466725b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671811; x=1770276611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw9yO7mwTQnQ0r65U4QsCYOKxY/82LUhk+hkyZXe+sY=;
        b=GI4zLzLfLg9wQW/XRusozPfvZ1DFwfS0ZwVVQwbFdYFPRrNUG94RUMUfvsOX7pL3xw
         HQmaN1eV/z4I1RUBj453fbAA2Po4JyAABEVELH+L83g3NoPVKvHDghGIODYL8O21UzN6
         WVz/qd1m6ShFxx1xSCilz8a2q4CHYF1WMf4JYJn0Ym1IJRHFNpEzrO0G9I5BG6/NzOMn
         ZJIuf8ixePm7Aa9GIFDsniLXdRUahebYhTZ0xeXQ44d5gFlADbn2ECi3eUfyIi9o9pU+
         jbIkZBrLQJeKK8dA0r3PRiuskwoT7xY6cuxxmel/Z4PBfhi5KEoOgpB8eZRUyWWHNN1a
         IZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671811; x=1770276611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dw9yO7mwTQnQ0r65U4QsCYOKxY/82LUhk+hkyZXe+sY=;
        b=o6kVW0owtETaoJwM432bDsbAoQdEyTIl7NIWcNbhdgWHw6Ziztn8mC01d4mPGTvT3K
         ZvQ2igUz1pNSEH29QVb57dvMrDQVOAKdbkfxf/4Hlb4i8vu1QEHSZ9dqAYCzhn6TQN7C
         h+yXsnlHeHg04SsxT6XRiT7GapaBRbXc841CmQOChxgdBJBI/Y0bVX9nX5w/uspEh4cM
         OBrkRi96NONdMvZwgMQSk4vII6UfOQIs6pohQ5/NyhYcOzeOxKzQ8HE6ES9CX3DIbAfv
         DvMngAjW03g9PmThgMlwigYIGkZrKEB1OkgryI8sQTK2mYy194OvmlwTq/TO1jFN3tvs
         qrXw==
X-Forwarded-Encrypted: i=1; AJvYcCUBri94VJEK/sjjXismiUyISRnBZ2NapbtMYQVT/QHCaeuKl3iX8lUT/KQR44CVKTV6g5bbjvs5HYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUdkXRxBoybsxp4zJizpqPrWoOJOcitG4Nz9i305G7xytmvN+D
	u7Ig4EA18ZDDwFznSUnDWHWbT5blbAhzawjMK87OsBIoaZWCfmS4Z8c8
X-Gm-Gg: AZuq6aKVu41fxkY09n3lSm3h2Kw15w+FGpkPFPRLpdNsWDE65a+JvVBaOlhNh2H0BR/
	YFslPGd5CHTVdTYsqV+eLOrS1wuknVA2bv6rbNmKqBUao4EdE5uV2EMSfNQRwIp4FsCm4ha5b+6
	6Hm+zN7Fnub7AIzxcLQ+mI7Uo58wTe685iaquHtCOIsgd0xgDAuY8jdW1/2LSJ1ZKBV7fYGZlm4
	HagIT4+RZZBTdn4OKs3ZQASdxz0D9GfRG4AoNmrhWVxn7voKnA8aa5GckIvKDBqecRIOpy2D4lw
	yHkcev6T3lwCikRZfJ1Ka1ICs8vetpnNcaE8RqhLFZ2THNLSPuo/B2oT9dp4M0dnPXoVDWrQ4NY
	KjOa5rLMYFctOY28qzF65loWQT/UNNm4Tr7tDmMyXvbgEoCBiw1oWZ5yMmRvEpOpOvPkB8NKJuC
	ua7N+K6ShSckcmy7izsLBAOuPjRe/lNqREK+qhMhhC/TjXL10BRK4=
X-Received: by 2002:a05:6808:18a9:b0:44d:bf83:d7f8 with SMTP id 5614622812f47-45efc4d5962mr4032674b6e.4.1769671810881;
        Wed, 28 Jan 2026 23:30:10 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-45f08f5ff30sm2718275b6e.16.2026.01.28.23.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:10 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Ye Bin <yebin10@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 05/32] docs/dyndbg: explain flags parse 1st
Date: Thu, 29 Jan 2026 00:28:51 -0700
Message-ID: <20260129072932.2190803-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0

