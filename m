Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 52D7E7D912
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Oct 2019 16:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfJDQkH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Oct 2019 12:40:07 -0400
Received: from ms.lwn.net ([45.79.88.28]:40202 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbfJDQkG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Oct 2019 12:40:06 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 65D3A2D7;
        Fri,  4 Oct 2019 16:40:06 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/2] Improvements to the genericirq documentation
Date:   Fri,  4 Oct 2019 10:39:53 -0600
Message-Id: <20191004163955.14419-1-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Initially I started out just getting rid of :c:func: clutter, but then
noticed that request_irq() wasn't documented - I am guessing that got left
behind when request_threaded_irq() came in.  The second patch fixes that up
as well.

Happy to carry this up or let it go through the IRQ tree, whichever is
preferable.

Jonathan Corbet (2):
  docs: remove :c:func: from genericirq.rst
  docs: Add request_irq() documentation

 Documentation/core-api/genericirq.rst | 52 ++++++++++++++-------------
 include/linux/interrupt.h             | 13 +++++++
 2 files changed, 40 insertions(+), 25 deletions(-)

-- 
2.21.0

