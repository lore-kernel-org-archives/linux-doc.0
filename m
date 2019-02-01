Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 588507D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Feb 2019 22:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfBAWE5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Feb 2019 17:04:57 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45295 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfBAWE5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Feb 2019 17:04:57 -0500
Received: by mail-pf1-f196.google.com with SMTP id g62so3860063pfd.12;
        Fri, 01 Feb 2019 14:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4P8+iVxP1Rc69Xy9s4QzrHaTbw2Spe9hTWw2t2Qy5+I=;
        b=IdxORsXOL3tXzTC912bnW7m4bHgPythoQBB5l3aFWj9mNRtg/ZwNMmVQdS8qPc+jFo
         Gv4xsMVg644d9mrB1uTi2HOy+GJtv+n9IdeDwunaF7XVrDWDQ6KpgN/AkJvQRu4JTbwu
         8Dxrx0GoYMf7SA6l34v7skc1caq58leAO/I05V5WI2C1ORf4WiyR99AcDrE5yOrnveeY
         PVI3N0NKxllvNzQBvEcwNbQT7zzMBqrc9VOJxzVgqjJQ0x8EsF36i8kGg9BQjNOa1iaQ
         wn9keSZi+zggv4j++C2A36B/Y8jnRpUcD4qggMcLZ6hVxKOwuPf7q1L1hJJdVyNdA8VI
         BItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4P8+iVxP1Rc69Xy9s4QzrHaTbw2Spe9hTWw2t2Qy5+I=;
        b=ke7TzADk+WlgxpMktxbFfl+cZeGOoueXlfgGuNiU19NLtUfk0whAVdWFtlzovY8Vr/
         8Jqxz9ZX7PRmFcvrKr/e9K8yCWrINMJ/aUeUO/j4+gVxR3Fjvtr5PWLz1QS5THZMr8yg
         O5bexHWNXqikicmkEwDZKw5doTSXOPkIEOc9ZJjNN7s6610qasPqo6jLrx9qNR7b17ek
         fXmjmbKZuLBCqVU2LMcFVp6zTiitIZRWVmLHRYjPVqwD24Wd4iW7ChoK6FxIyRPIsO52
         7ddLoeb+fRk9JT7v6i12/l7t+1TNj1aOAacNFyTpOdwuAAbMd/KLFVYOkT9tLAbHtulu
         iXjw==
X-Gm-Message-State: AHQUAuY07rExjKGUWxqiN/6//eyIVK2Jn4PDU8wObHZK9HpDoDD0DNRl
        5WAZWqtNGmLvTzeYw+86zAw=
X-Google-Smtp-Source: AHgI3IYND01rz5wIsLScyPYo9j891DNUQYdL1M3qhSaNl/oPzjajPGuYLR+uHBD6dCZgWnybjnb+Vw==
X-Received: by 2002:a63:40c6:: with SMTP id n189mr3905788pga.355.1549058696122;
        Fri, 01 Feb 2019 14:04:56 -0800 (PST)
Received: from localhost.localdomain (c-24-6-192-50.hsd1.ca.comcast.net. [24.6.192.50])
        by smtp.gmail.com with ESMTPSA id c7sm28026597pfh.18.2019.02.01.14.04.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 01 Feb 2019 14:04:55 -0800 (PST)
From:   frowand.list@gmail.com
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Joris Gutjahr <joris.gutjahr@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: kernel-doc: typo "documentaion"
Date:   Fri,  1 Feb 2019 14:04:16 -0800
Message-Id: <1549058656-11119-1-git-send-email-frowand.list@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Fix a typo in kernel-doc.rst

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 Documentation/doc-guide/kernel-doc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 450ac634e92e..6513c16b7e4f 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -490,7 +490,7 @@ doc: *title*
 
 functions: *[ function ...]*
   Include documentation for each *function* in *source*.
-  If no *function* if specified, the documentaion for all functions
+  If no *function* if specified, the documentation for all functions
   and types in the *source* will be included.
 
   Examples::
-- 
Frank Rowand <frank.rowand@sony.com>

