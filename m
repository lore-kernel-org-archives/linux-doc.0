Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E4B47D071
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Jul 2018 23:04:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932828AbeGIXEs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 19:04:48 -0400
Received: from mail-oi0-f51.google.com ([209.85.218.51]:39908 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932797AbeGIXEr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jul 2018 19:04:47 -0400
Received: by mail-oi0-f51.google.com with SMTP id d189-v6so39050072oib.6
        for <linux-doc@vger.kernel.org>; Mon, 09 Jul 2018 16:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kent-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=94U35/x1+jS5/4kBhWySM4XkspkdJ/5KvHp4+qxVdQo=;
        b=EO65qttrncyuT+uhGgCcAsjcjKbYpur8IB+FxQXhE2kRARZYKf+wP0TBkjuPWT3VRM
         PhCtvYD+8YrRwlawLf0KvcUpZKCjCRF8qXfshsg4CbIfMWfXF1gb6NK6Bf099URmqHZn
         bXX/yn7UwxpE4n4Nh1h4EZ+o3DOsjmB/oNi4UwYlnNCR5m2hfv1OuyIk0c5vFR7Iht3J
         cJONwx8Av/QzTeeAcTSNMf58T32iccuFeU9K43+zk3eyCVAby9RqbJdZ37/DdTgn1txD
         oLYUU5QxZgd2mivfiSit9QfvVJG6dmqQ1Q3ERLf4htT4HzSSKl2UJOopGd6xHKlS+Haz
         YpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=94U35/x1+jS5/4kBhWySM4XkspkdJ/5KvHp4+qxVdQo=;
        b=pPZt8ZnR2WQROFTMq5BsS5OlNISy1H2tSMd4SqsmBvVezMfI3PDpizcPGToNCOfI+J
         tLxa15guvNXN6ZLZQuvhVH6O5+Mu9UHgqPwgbFDbOAj+gFDxR3pYY8fI9b/iBIn9/D2b
         tZmIKjBCcErmlF8uE9EyK0mwHmUaUxlogiS8qSt7g7shoc9kTdCqLT7qLaRiQ2FjmqU+
         ulT0vvSwjdb6IY/QklvMkdUBRqaWlqk6XtCw2sYlnQ1LVIo8nB4VE2eQ6yGnpTaVjJLz
         JNdfYDi8p8yfS4Hh5JwOZrXEp0egCvUFME/U3I9XXosFGXPhFZiZFzpQJuM2UGwLWwzK
         Z5rw==
X-Gm-Message-State: APt69E2t5aXuPtJK57x5RZRhgNhiUHw+8RkP411Krszi7NXYswNHOu5r
        YIKJ8xFk3C1gzCEnKCTmyYggh7EpgnlMdCrJKZU9Gw==
X-Google-Smtp-Source: AAOMgpc79VxOJK3VxFrphRvW1X9yQNYmHQBGJnETBSof9XM5R6juAJDF/lswJ3cUfr4b+aLQoTy2szZmXD0vftOS53Y=
X-Received: by 2002:aca:6a86:: with SMTP id f128-v6mr23714072oic.330.1531177486602;
 Mon, 09 Jul 2018 16:04:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:ce2:0:0:0:0:0 with HTTP; Mon, 9 Jul 2018 16:04:46 -0700 (PDT)
From:   "Md. Islam" <mislam4@kent.edu>
Date:   Mon, 9 Jul 2018 19:04:46 -0400
Message-ID: <CAFgPn1Dfen9u6ebs0ke3eZ3D0jREzRa3OY0tKRasyRMQbhjTqw@mail.gmail.com>
Subject: [patch] printk format for u16
To:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
index 361789d..955866c 100644
--- a/Documentation/printk-formats.txt
+++ b/Documentation/printk-formats.txt
@@ -14,6 +14,7 @@ Integer types
     If variable is of Type,        use printk format specifier:
     ------------------------------------------------------------
         int            %d or %x
+        unsigned short        %hu or %hx
         unsigned int        %u or %x
         long            %ld or %lx
         unsigned long        %lu or %lx
@@ -22,6 +23,7 @@ Integer types
         size_t            %zu or %zx
         ssize_t            %zd or %zx
         s32            %d or %x
+        u16            %hu or %hx
         u32            %u or %x
         s64            %lld or %llx
         u64            %llu or %llx


Thanks
Tamim
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
