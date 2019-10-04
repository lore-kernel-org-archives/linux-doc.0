Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 918B37D92A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Oct 2019 16:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbfJDQkI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Oct 2019 12:40:08 -0400
Received: from ms.lwn.net ([45.79.88.28]:40210 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbfJDQkH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Oct 2019 12:40:07 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 0660C7C0;
        Fri,  4 Oct 2019 16:40:06 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/2] docs: Add request_irq() documentation
Date:   Fri,  4 Oct 2019 10:39:55 -0600
Message-Id: <20191004163955.14419-3-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004163955.14419-1-corbet@lwn.net>
References: <20191004163955.14419-1-corbet@lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While checking the results of the :c:func: removal, I noticed that there
was no documentation for request_irq(), and request_threaded_irq() was not
mentioned at all.  Add a kerneldoc comment for request_irq() and add
request_threaded_irq() to the list of functions.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/core-api/genericirq.rst |  2 ++
 include/linux/interrupt.h             | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/core-api/genericirq.rst b/Documentation/core-api/genericirq.rst
index 2e6c99e3ce3b..8f06d885c310 100644
--- a/Documentation/core-api/genericirq.rst
+++ b/Documentation/core-api/genericirq.rst
@@ -127,6 +127,8 @@ The high-level Driver API consists of following functions:
 
 -  request_irq()
 
+-  request_threaded_irq()
+
 -  free_irq()
 
 -  disable_irq()
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 89fc59dab57d..ba873ec7e09d 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -140,6 +140,19 @@ request_threaded_irq(unsigned int irq, irq_handler_t handler,
 		     irq_handler_t thread_fn,
 		     unsigned long flags, const char *name, void *dev);
 
+/**
+ * request_irq - Add a handler for an interrupt line
+ * @irq:	The interrupt line to allocate
+ * @handler:	Function to be called when the IRQ occurs.
+ *		Primary handler for threaded interrupts
+ *		If NULL, the default primary handler is installed
+ * @flags:	Handling flags
+ * @name:	Name of the device generating this interrupt
+ * @dev:	A cookie passed to the handler function
+ *
+ * This call allocates an interrupt and establishes a handler; see
+ * the documentation for request_threaded_irq() for details.
+ */
 static inline int __must_check
 request_irq(unsigned int irq, irq_handler_t handler, unsigned long flags,
 	    const char *name, void *dev)
-- 
2.21.0

