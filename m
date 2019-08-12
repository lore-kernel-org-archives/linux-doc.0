Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 86FC97D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Aug 2019 21:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfHLVt2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Aug 2019 17:49:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42622 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfHLVt2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Aug 2019 17:49:28 -0400
Received: by mail-pg1-f194.google.com with SMTP id t132so50142465pgb.9
        for <linux-doc@vger.kernel.org>; Mon, 12 Aug 2019 14:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+VX5r5f5cF5tCseJubpffqLGoYoFIqCd8nAOS2Bnab0=;
        b=UV4VNRqK2V8oXdZjI846lm0TvkYgelhm3Z/ShKpmDvnsa4yJznguBzAfmFOXQ52rno
         4wOBsmQBdzQlqfQHDVU0OmgLqZ/+pv6lyhNVJOnmpeHAHfv+uq8u4oGh0dGkOioLchI8
         RArBmprnuppbf9ZOANtkSWuTHWE1xQnkXrGo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+VX5r5f5cF5tCseJubpffqLGoYoFIqCd8nAOS2Bnab0=;
        b=WVGbosqnDh1wwfOtWVTmJvk9atYaowoWLASXuPjpA9ML1QvIRzXDmIXMzYUZsqGvqi
         E3sn7UsmHWkbGrk3pKQR8W5+B1sTfYAFWfDqNIdfvy7AD4DMNa0l7CAwou7BaWMFFHd9
         zyrpXycbJQKlJq5HjONCmgm7URCy+sp4kvcbvzNz4Db1nbdFnPtLqanymiyaDs2ndvTw
         v28d8oBusX+F4ZKrkFR6dgZKO6vyWNEx547tc5rroA53rdwXJxuj0OBfTBqvO6ZqGtGD
         kAzq/kUPlKeVuCBKPVlLy5OCg47lXJYxZMegOa23YYEZRuvuDyzrfxopx48FxLeyNuGQ
         oK6g==
X-Gm-Message-State: APjAAAU/Uiu0VqAtKMuXM1xQz2pTwDD2Prwqugl47xA6FALypnv4A+1E
        JdFLqQEX3jQpvKsDFz4oFdlBbw==
X-Google-Smtp-Source: APXvYqwpk5HoZYOES56dT5Hrqd5iS4AYSjw/VkhuQw+LHdOhVcm8tSvP24x6GNfHSM8kduo/3ggB+w==
X-Received: by 2002:a62:e910:: with SMTP id j16mr38564939pfh.123.1565646567232;
        Mon, 12 Aug 2019 14:49:27 -0700 (PDT)
Received: from joelaf.cam.corp.google.com ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id c5sm5434978pfo.175.2019.08.12.14.49.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 14:49:26 -0700 (PDT)
From:   "Joel Fernandes (Google)" <joel@joelfernandes.org>
To:     linux-kernel@vger.kernel.org
Cc:     "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        kernel-team@android.com, kbuild test robot <lkp@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, rcu@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2] driver/core: Fix build error when SRCU and lockdep disabled
Date:   Mon, 12 Aug 2019 17:49:17 -0400
Message-Id: <20190812214918.101756-1-joel@joelfernandes.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Check if lockdep lock checking is disabled. If so, then do not define
device_links_read_lock_held(). It is used only from places where lockdep
checking is enabled.

Also fix a bug where I was not checking dep_map. Previously, I did not
test !SRCU configs so this got missed. Now it is sorted.

Link: https://lore.kernel.org/lkml/201908080026.WSAFx14k%25lkp@intel.com/
Fixes: c9e4d3a2fee8 ("acpi: Use built-in RCU list checking for acpi_ioremaps list")
 (Based on RCU's dev branch)

Cc: kernel-team@android.com
Cc: kbuild test robot <lkp@intel.com>,
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
Cc: Josh Triplett <josh@joshtriplett.org>,
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
Cc: linux-doc@vger.kernel.org,
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>,
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
Cc: rcu@vger.kernel.org,
Cc: Steven Rostedt <rostedt@goodmis.org>,

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 drivers/base/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 32cf83d1c744..c22271577c84 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -97,10 +97,12 @@ void device_links_read_unlock(int not_used)
 	up_read(&device_links_lock);
 }
 
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
 int device_links_read_lock_held(void)
 {
-	return lock_is_held(&device_links_lock);
+	return lock_is_held(&(device_links_lock.dep_map));
 }
+#endif
 #endif /* !CONFIG_SRCU */
 
 /**
-- 
2.23.0.rc1.153.gdeed80330f-goog

