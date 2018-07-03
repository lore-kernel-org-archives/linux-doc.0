Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4293A7DFB7
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 00:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932126AbeGCAJL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Jul 2018 20:09:11 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:41276 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932098AbeGCAJK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Jul 2018 20:09:10 -0400
Received: by mail-pl0-f66.google.com with SMTP id w8-v6so87103ply.8
        for <linux-doc@vger.kernel.org>; Mon, 02 Jul 2018 17:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=kiGPGwNZ4IUkNPqITG5crCOZrcsIuNCmTWRzqfgxC1Q=;
        b=Zsz7neUmi4LdbmrV7KtW98Y4B7UFiK954a1hHJBf5auZ3pb7cKr8KRjmMRhqROeV31
         WxrN587Rxwndg4u+QbrNexcHb+hKTyNiLXkepE/h7um48rHfo+IoL5yAqCn/9e/csQVQ
         8v8/2CUdFp8+ExqZO3q29UkFoYas/0yBC8yEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=kiGPGwNZ4IUkNPqITG5crCOZrcsIuNCmTWRzqfgxC1Q=;
        b=FBWFpD6cm2bESnmQVdPsNCtRNVLGSVFKqUwXQ7QwT4Rh06e1gJ45IqKOEmkeOLG6ma
         9uUq/LV1Dv0AXKV9syg+iE7pjqRggPoaH7PvLZ4SCSiMl8i07hfhAc5PTMfRH2EM0On7
         JAeoG9SVsUmhD7z4024xNYWpa1LEjZKY763v/FE0HDOCKdVIvuqyCbEj20iAsf3XgE8/
         LQ71UVCoKJG/8nHD9n8QdbRzSokhShOUJxTzaXhoi7YlGoiCNHHPODdK5cEjrdZUdzt2
         k6tnHPxzaYXTBqrFIsxcmm9+pdjb4Y5O91bdm9y4MjjpT0RXIOROwHLaDuSpla5iNwuU
         fsvA==
X-Gm-Message-State: APt69E0QylD+CmoifVqeSJq8yDeUk34hOa9CjrsPt+VHwEG5N8eQAeg4
        9sj5gPwnjdccD0ld4J2acmStbg==
X-Google-Smtp-Source: ADUXVKLGP5IXshUq7KgfRZg9Zmc0Tegqyslcikw2J/m8+sju69kKbzY/0xrxNHiMWhxpV4exP4kHeA==
X-Received: by 2002:a17:902:381:: with SMTP id d1-v6mr27760110pld.309.1530576550366;
        Mon, 02 Jul 2018 17:09:10 -0700 (PDT)
Received: from www.outflux.net (173-164-112-133-Oregon.hfc.comcastbusiness.net. [173.164.112.133])
        by smtp.gmail.com with ESMTPSA id b1-v6sm1338426pff.141.2018.07.02.17.09.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jul 2018 17:09:08 -0700 (PDT)
Date:   Mon, 2 Jul 2018 17:09:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: [PATCH] kernel.h: Documentation for roundup() vs round_up()
Message-ID: <20180703000907.GA27014@beast>
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
 include/linux/kernel.h | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 941dc0a5a877..28f8830e1b3c 100644
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
+ * The `const' hereprevents gcc-3.3 from calling __divdi3
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
