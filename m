Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C5177D043
	for <lwn-linux-doc@archive.lwn.net>; Sun, 27 May 2018 14:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1032590AbeE0O5F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 27 May 2018 10:57:05 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:42292 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965011AbeE0O5E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 27 May 2018 10:57:04 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 5634E37D;
        Sun, 27 May 2018 16:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        references:in-reply-to:message-id:date:date:subject:subject:from
        :from:received:received:received; s=dkim20160331; t=1527433022;
         x=1529247423; bh=f6uSySHfj+D9dF6eTFsN26jOz8uDDk7iDx4aGxT/VrM=; b=
        2fUgD3bB7bMMNWLo4TU3LCNsw/P0q4Cm7Pc6GnMp0oMKqtJm09+869W7GAncUCuE
        ClH2mRRdTxvfPlWseSgxWRR6qzgWUa9wdkddFov004m3T9X0NV2ovmPBwznwQZ+P
        uMilNBGSJv8gJz4LfMwVhXXht+JRh+rFxjHyTsila+oFCZBGdkf5ii+BapxXxONM
        DpHOccvbuGogm/iT4eESQSn+BtBjtTZn627r4rZaQ44L30XWgllK6gT2Q1W5jAne
        NhWJ5DUF6ILOhKfarVLVnJneoOiAE5hxLILYiIW3z7+AJ9dDoMdY+HC+n/lnQ9rz
        83mGHt4xMQkjYQwWEChHHPmDtRCkcxfOg8T75T2p9phCR8ievzmV0780qs+Mpo5R
        P1TFkKnle6HMhxc46Z5+BgL/QwSydHDueKvzC5OyPqn66sLgZzjedVIGbJSkC+4l
        AwaUoatdqkShzTJj5uah1NUGeI/bPaN+DtduJbdp5ozUvL8WhKjET95a+dgm3nXp
        rJ+Z0DJB/iY+yuR1UF2I3Joiqf+rQKIrP+MTn1C1yjho5nUGX2jmIBz4TEJJnUv9
        J/PUhY7qTZAiQf6oSPSnQzt2NYRg0aj/ABijmhdvUENvFiCu7U+7YK6rZ0GMuCvq
        0rR2dcB60ZEL2UlQ2usMssfgmeLnNPicGp9MqBuHgZ4=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id x_HgaEoBbhV4; Sun, 27 May 2018 16:57:02 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 4B5A8247;
        Sun, 27 May 2018 16:57:02 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id E546125CA;
        Sun, 27 May 2018 16:57:01 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH 2/5] doc: add chapter labels
Date:   Sun, 27 May 2018 16:55:57 +0200
Message-Id: <20180527145559.16411-3-federico.vaga@vaga.pv.it>
In-Reply-To: <20180527145559.16411-1-federico.vaga@vaga.pv.it>
References: <20180527145559.16411-1-federico.vaga@vaga.pv.it>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The idea is to make it easier to create references (doc-guide does the same).

Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
---
 Documentation/index.rst                | 2 ++
 Documentation/kernel-hacking/index.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 331da87c82c8..8f11fccb9744 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -3,6 +3,8 @@
    You can adapt this file completely to your liking, but it should at least
    contain the root `toctree` directive.
 
+.. _linux_doc:
+
 The Linux Kernel documentation
 ==============================
 
diff --git a/Documentation/kernel-hacking/index.rst b/Documentation/kernel-hacking/index.rst
index fcb0eda3cca3..f53027652290 100644
--- a/Documentation/kernel-hacking/index.rst
+++ b/Documentation/kernel-hacking/index.rst
@@ -1,3 +1,5 @@
+.. _kernel_hacking:
+
 =====================
 Kernel Hacking Guides
 =====================
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
