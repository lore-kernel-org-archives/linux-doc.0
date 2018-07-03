Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 49CC17DE6E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 02:17:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932440AbeGCCQ6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 22:16:58 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:40329 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932216AbeGCCQ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jul 2018 22:16:57 -0400
Received: by mail-pl0-f68.google.com with SMTP id t6-v6so221183plo.7
        for <linux-doc@vger.kernel.org>; Mon, 02 Jul 2018 19:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ZRMCOOALmdPBNTvno/w/l5S4XOYv4a3poPPiFJRGf6U=;
        b=CA3fVeTyUUN1tfG608Y2v+JxiDnCDtKLqiH6+F4kX9DQ39gue5/wEN8s/cS4wtalLk
         tyyZ3zQK7n5h96klnbg/xuuKzrDLWY81DgJOrnRd2DXfOtt5b0XVLulLYw39EgyRYlLW
         9qoeL6L2W1nh3H88SJHTbS2uQQmt1dV433yvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZRMCOOALmdPBNTvno/w/l5S4XOYv4a3poPPiFJRGf6U=;
        b=PHcuItU1typB7iieRhn9BR5xiwZUhkWsRSzuhfs1QU9Ul0oZnpm+wEnmj7XMi440gp
         W+CbCdQ2kB9yKjdJbC71lrerJq1ZLTHv1Sb8EB/LxfRtb7fRkGH1SiM10CABqAWJebEG
         xPj5Tx+O5F+T+7WbSNJn4b7qNgwl8/o/n+7PPV8836GiiMJp7UFAu4NWPgk9+XfvBYV0
         0K96C8jmlDmICBciOSPLjQpxM/sI9yKCWafq4VvO3xnpuF3IlPNDrMRYoYop53TsUx0r
         +zPbYtv4xzRKMWtx1eYBwJSMoSTwEPjk10HVhwgDb+6toKVh+M8gK4cgMSJFZzbUqeGJ
         fHHA==
X-Gm-Message-State: APt69E1GooJBl61l4Wr200SE/rcGaWPvQwfokbPijQ+tTblsoTQ885bI
        gzpIPJoSJjGtMDgDdkTknCfJPg==
X-Google-Smtp-Source: ADUXVKI+w1pXL43mODOiJABeBJGUAoHIl7r3s49TduCfU47LRfbeWaDA05zkuZNvteVn8jEYEKXucw==
X-Received: by 2002:a17:902:622:: with SMTP id 31-v6mr27837008plg.135.1530584217358;
        Mon, 02 Jul 2018 19:16:57 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id n18-v6sm13045pge.37.2018.07.02.19.16.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jul 2018 19:16:55 -0700 (PDT)
Date:   Mon, 2 Jul 2018 19:16:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Eric Biggers <ebiggers@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] kernel.h: Documentation for roundup() vs round_up()
Message-ID: <20180703021654.GA42417@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Things like commit 3619dec5103d ("dh key: fix rounding up KDF output
length") expose the lack of explicit documentation for roundup() vs
round_up(). At least we can try to document it better if anyone goes
looking.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2: fix whitespace (willy)
---
 include/linux/kernel.h | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 941dc0a5a877..dce6ab779a83 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -85,7 +85,23 @@
  * arguments just once each.
  */
 #define __round_mask(x, y) ((__typeof__(x))((y)-1))
+/**
+ * round_up - round up to next specified power of 2
+ * @x: the value to round
+ * @y: multiple to round up to (must be a power of 2)
+ *
+ * Rounds @x up to next multiple of @y (which must be a power of 2).
+ * To perform arbitrary rounding up, use roundup() below.
+ */
 #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
+/**
+ * round_down - round down to next specified power of 2
+ * @x: the value to round
+ * @y: multiple to round down to (must be a power of 2)
+ *
+ * Rounds @x down to next multiple of @y (which must be a power of 2).
+ * To perform arbitrary rounding down, use rounddown() below.
+ */
 #define round_down(x, y) ((x) & ~__round_mask(x, y))
 
 /**
@@ -110,13 +126,30 @@
 # define DIV_ROUND_UP_SECTOR_T(ll,d) DIV_ROUND_UP(ll,d)
 #endif
 
-/* The `const' in roundup() prevents gcc-3.3 from calling __divdi3 */
+/**
+ * roundup - round up to the next specified multiple
+ * @x: the value to up
+ * @y: multiple to round up to (must be a power of 2)
+ *
+ * Rounds @x up to next multiple of @y. If @y will always be a power
+ * of 2, consider using the faster round_up().
+ *
+ * The `const' here prevents gcc-3.3 from calling __divdi3
+ */
 #define roundup(x, y) (					\
 {							\
 	const typeof(y) __y = y;			\
 	(((x) + (__y - 1)) / __y) * __y;		\
 }							\
 )
+/**
+ * rounddown - round down to next specified multiple
+ * @x: the value to round
+ * @y: multiple to round down to
+ *
+ * Rounds @x down to next multiple of @y. If @y will always be a power
+ * of 2, consider using the faster round_down().
+ */
 #define rounddown(x, y) (				\
 {							\
 	typeof(x) __x = (x);				\
-- 
2.17.1


-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
