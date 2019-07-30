Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B75E17D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 21:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387648AbfG3VUw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 17:20:52 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42694 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387476AbfG3VUw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 17:20:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so30477211pff.9
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p7dnDK6H9SahbARleR/Q2DwmEq2lmdqCyjjpFTu4H3s=;
        b=KFPaOPrQyZw+bawZZpKuOF9eMNcb8SWFtgMrxbvJiFsbTq5bXGuhq61Iu+DoFjYLjr
         uMxxWqhK9E9zQT6WGNFKGzvJRPN36hycRmMSNrycTuU0G54Kc40jfiKXKSvcQ4wfppsN
         cE4nYGlFbyZLZ3T/+z6w7SqMyOJwofXkmrCSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7dnDK6H9SahbARleR/Q2DwmEq2lmdqCyjjpFTu4H3s=;
        b=ZOM1pCKKhIK/hyA1lBiBwFezRkXlQl/MLTtfQIOKBHA0L70KA7LMZVvwUY9YoH4Ir0
         43bqPx650IB4lRJ7XIVU+OJxtncGWfMrIusAOq+0Ztn8FjSkA5jCi0ntfuQNQhocoaCX
         kUkQM6N6hkg792Ijo2jx+rrN6PkVV0oMdQYfGX3K9zdKwYKBvuuyonX94x58Z+B1cjMY
         cXS1I9k6wjPvGhKjiGzJuabqyBvBRL1PVoq6GOKO5WUB2l67uZkA1WTajoukQjdNHfmg
         8GTwnyHl8g2LqMg9iui+8Kwt/vWqE0OBGTn1kwDAjFq6GWWAgYmEnGFrBhFMx0eu81iq
         HCQA==
X-Gm-Message-State: APjAAAXk7Xvsj4NY1oJDwwj6B0tZoM94aiKdbUwtWYgRCeXYSEN0DHhb
        c7+jNODoxsuLOgiZc3sfkqPyBA==
X-Google-Smtp-Source: APXvYqzsTyh96T1xkgu3NVZAClAdd/dL910dpPjg5fs+kLb+t+7VvwS6e3WVven83W+AxHF33v5QRQ==
X-Received: by 2002:a65:4489:: with SMTP id l9mr114011518pgq.207.1564521650996;
        Tue, 30 Jul 2019 14:20:50 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n140sm68205686pfd.132.2019.07.30.14.20.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 14:20:50 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Tri Vo <trong@android.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] idr: Document that ida_simple_{get,remove}() are deprecated
Date:   Tue, 30 Jul 2019 14:20:48 -0700
Message-Id: <20190730212048.164657-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730212048.164657-1-swboyd@chromium.org>
References: <20190730212048.164657-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These two functions are deprecated. Users should call ida_alloc() or
ida_free() respectively instead. Add documentation to this effect until
the macro can be removed.

Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Tri Vo <trong@android.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 include/linux/idr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/idr.h b/include/linux/idr.h
index 5bb026007044..12f7233c7adb 100644
--- a/include/linux/idr.h
+++ b/include/linux/idr.h
@@ -314,6 +314,10 @@ static inline void ida_init(struct ida *ida)
 	xa_init_flags(&ida->xa, IDA_INIT_FLAGS);
 }
 
+/*
+ * ida_simple_get() and ida_simple_remove() are deprecated. Use
+ * ida_alloc() and ida_free() instead respectively.
+ */
 #define ida_simple_get(ida, start, end, gfp)	\
 			ida_alloc_range(ida, start, (end) - 1, gfp)
 #define ida_simple_remove(ida, id)	ida_free(ida, id)
-- 
Sent by a computer through tubes

