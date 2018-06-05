Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 000C97D048
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 22:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752658AbeFEWtu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 18:49:50 -0400
Received: from mx.kolabnow.com ([95.128.36.42]:34836 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752365AbeFEWts (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Jun 2018 18:49:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 6740C594;
        Wed,  6 Jun 2018 00:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        references:in-reply-to:message-id:date:date:subject:subject:from
        :from:received:received:received; s=dkim20160331; t=1528238986;
         x=1530053387; bh=RxMj0bKtrW/r6JiDLapwkaDJysxjthVKy8TZWSk9JKo=; b=
        Dt74NIJmorZgIX0onAPNZq5nZ0cQcZXnviRhWm4JYqSi5w4auNLMHY03/DXXxIf6
        BBWmrYgl0EOud0u/kjq2wolSuLNLLflhEyLIJDqK3Qhn+XC9/JoZNnxa7DoWP7Lt
        70aNN3heFYkoPeGcoTvJAuC+yFUFh/J78M1jKWROZxSWgZ8fbpLWJRwhrmzckS7G
        bV+05la+ZEeUX/5qAgSE7WigivESo90UZBaRpYwXQYR3Ji2kPiVAUG9qCnnDbKJ0
        gMUajKeZEDoNquKlaGMtTy3qjleEhDTf/A9KbiOo78i/n1i1ygrixFQ6JVkPYz1c
        wpN2+jLF7/vbf7rSE4ua7cuFHB2nHZYxnxaFpWnTBPA/we0j9fWUZsxPv1MIRDY5
        kM95jnc/X3TycRMkWJOCv6wHzXTtI0On/MwRug4myDPeBLEREe3pzqGYQCeNbkLd
        433dJkz6bP9/sb9Q5piw963rr0Q5XZA8gyGU3hRDdOx6w5hRO27zkkTeZDLabeFN
        5g4sTVKt99Xt1tW7txyHzNg8aC97Eer7vqfYZu5SumdGRkQbEHczazeVq80JhHf9
        j/uV6DeQShYFU2NXGWLUdO+OQRoDc8VODd2whartcNdQZ2Jt3y6fUMeToNJdam2p
        tMot0jAKJsQA4G/ihrBvUC+DltlMHPFig21ViOLAn9o=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cM_37pmjF16n; Wed,  6 Jun 2018 00:49:46 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 48D1A463;
        Wed,  6 Jun 2018 00:49:46 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id E9052163;
        Wed,  6 Jun 2018 00:49:45 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH 1/6] doc:doc-guide: fix a typo and an error
Date:   Wed,  6 Jun 2018 00:48:58 +0200
Message-Id: <20180605224903.9483-2-federico.vaga@vaga.pv.it>
In-Reply-To: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
References: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

typo in sphinx.rst
error in parse-header.rst

Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
---
 Documentation/doc-guide/parse-headers.rst | 2 +-
 Documentation/doc-guide/sphinx.rst        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
index 82a3e43b6864..684490c68acb 100644
--- a/Documentation/doc-guide/parse-headers.rst
+++ b/Documentation/doc-guide/parse-headers.rst
@@ -133,7 +133,7 @@ For both statements, \ **type**\  can be either one of the following:
 
 \ **symbol**\
 
- The ignore or replace statement will apply to the name of enum statements
+ The ignore or replace statement will apply to the name of enum value
  at C_FILE.
 
  For replace statements, \ **new_value**\  will automatically use :c:type:
diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index a2417633fdd8..f0796daa95b4 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -28,7 +28,7 @@ The ReST markups currently used by the Documentation/ files are meant to be
 built with ``Sphinx`` version 1.3 or upper. If you're desiring to build
 PDF outputs, it is recommended to use version 1.4.6 or upper.
 
-There's a script that checks for the Spinx requirements. Please see
+There's a script that checks for the Sphinx requirements. Please see
 :ref:`sphinx-pre-install` for further details.
 
 Most distributions are shipped with Sphinx, but its toolchain is fragile,
-- 
2.14.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
