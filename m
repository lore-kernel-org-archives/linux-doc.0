Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D53FB7DF87
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 22:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932104AbeFEWuD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 18:50:03 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:34848 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752365AbeFEWuB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Jun 2018 18:50:01 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id AB82C594;
        Wed,  6 Jun 2018 00:49:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        references:in-reply-to:message-id:date:date:subject:subject:from
        :from:received:received:received; s=dkim20160331; t=1528238998;
         x=1530053399; bh=LmahrYowJJV+SzJp7O+/eKvW7/kglsYSaC0ZrT7BPAk=; b=
        mIu34e4NRilj5Gp+Me0PYBEQPVDnnsrE7IbSH3VczfiItJrKhPa874VwMp72bLU/
        avKZvYsNEl/ALhOBMh18ahv8KoEiKdC7o1cpDEsT5sBleRu1sf3D+G6KLvQcnMtl
        3b9yVRl/YC1r0uZujwD2rgCCTrV6Jf0ZCCGmtI8C/7Jit0/J3TUSBpWgGicYb/5o
        6JcyMqLae3htiWekLrz1mYoNYKSJx+wdwqhc/Ou+p9Ueka9tUqCC0/fE25T+81x6
        mrolFpWDUNfd2gQA5VLJ7hHJx95qAJZ0ZgBNTtth7Q/oxvgiW0j2Xkwy9YSKsOu2
        n1kAN4CoSbKaRchJbOpcThPmP8dObz1gFWXVwbZagpb6o0sh9isqbYslObboSckW
        u0k1/Vh4ggCiYg2179hlN0whmk9dQQggRyT7d0iojTAU5Yey/SxKHF63Dv9y1fC0
        Bcta/kLNxP3deVwAEA7YewYffjPb0TvzaNL/8j0pQWVTX4jIm7pV+CxXtghRqKjj
        bXfYrmXWhB4eazXe3yYLpYgYqsSFKPxudkZP8CPeHgz0BULMxnzrorjWHskHQlhh
        qrO0WdiLlB7iZkLb4KX3gABJBSnijB0/kgjtlVZ8fO7GMLehqPddo+hBhfIA0Y1y
        vGtROiRbnMsaDkiI46n8KBN/tAKR0cx0NmgGsOoZJrs=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UrW9vw0mfe8V; Wed,  6 Jun 2018 00:49:58 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 9B482463;
        Wed,  6 Jun 2018 00:49:58 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx002.mykolab.com (Postfix) with ESMTPS id 553222C3F;
        Wed,  6 Jun 2018 00:49:58 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH 3/6] doc: move away translations from top-level index
Date:   Wed,  6 Jun 2018 00:49:00 +0200
Message-Id: <20180605224903.9483-4-federico.vaga@vaga.pv.it>
In-Reply-To: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
References: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In translations/ we have now a dedicated index.rst where we add/remove
references to translations. Translations are in English alphabetical
order.

Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
---
 Documentation/index.rst              | 24 ++++--------------------
 Documentation/translations/index.rst | 12 ++++++++++++
 2 files changed, 16 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/translations/index.rst

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 3b99ab931d41..f7ab4d6a281e 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -101,29 +101,13 @@ implementation.
 
    sh/index
 
-Korean translations
--------------------
+Translations
+------------
 
 .. toctree::
-   :maxdepth: 1
-
-   translations/ko_KR/index
-
-Chinese translations
---------------------
-
-.. toctree::
-   :maxdepth: 1
-
-   translations/zh_CN/index
-
-Japanese translations
----------------------
-
-.. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
 
-   translations/ja_JP/index
+   translations/index
 
 Indices and tables
 ==================
diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
new file mode 100644
index 000000000000..4969c58920ef
--- /dev/null
+++ b/Documentation/translations/index.rst
@@ -0,0 +1,12 @@
+.. _translations:
+
+============
+Translations
+============
+
+.. toctree::
+   :maxdepth: 1
+
+   zh_CN/index
+   ko_KR/index
+   ja_JP/index
-- 
2.14.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
