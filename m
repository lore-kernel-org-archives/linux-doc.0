Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C02627D048
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 22:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932072AbeFEWt6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 18:49:58 -0400
Received: from mx.kolabnow.com ([95.128.36.41]:60834 "EHLO mx.kolabnow.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752365AbeFEWt5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Jun 2018 18:49:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTP id 2DC80346;
        Wed,  6 Jun 2018 00:49:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
        references:in-reply-to:message-id:date:date:subject:subject:from
        :from:received:received:received; s=dkim20160331; t=1528238995;
         x=1530053396; bh=0pvbK6fIgJKt+9jLnEEYKRBmstfOF0sLp8dy7Z2QrvE=; b=
        Z6dn9U7coqj4fUQxPsUUOXiTofeuJLCpgZsz+Nr+rY+H4v4dICj1mbAChtngXF8u
        YihZ699Gq4wErORYjNA8QdwRx4jW69qQQxz1iruRIwA+QWasEnk/wnWYnsTvkncQ
        zx/aZHOSXDXn/NgPv6id6cKX9S+1VEWdrOAvNmrIEzSAjDCcm6E234TZ02k4GZPs
        CURgaPVOPkK6e3kbwS4v7Y7R3Fr75Guo/W/5jPFfLBq9gv8RUdECnCr0b6OVRGY6
        ApGGgyc/XVgZybpx0BFbjtbTAEc03EYzB/njEvP0RhMqIkYWnzrSzQ4C51zoptxH
        hxwyU0MOfDBuOe1q8veztIXpRdP48SjUND0lsWlseTW+dI6KBVSLXE50mVGhwEer
        8JTM16FsQEkE6qnBLErerQ2DBrHr3j792DFCVNTX9w6AYn157/LGIXxO0mNxf3H3
        Snq78BtGvi953YJlRCFW3XYPeXV2oNGU1NzriZa9z9WhyQiFNhC/XwW5BFMjT7vr
        HHoqChYIhCWOoc9fcgwlKE7yE+Tdllg9WELZabdpbWjxezOW/cPPARgaiKz4007Z
        GWYQX05r7hmjPVyot3xvTxkSwESA2Efhw6ivYKU4cqUFS6K3VFNtCusKl5vbh60F
        woZ3bUAnezDlqKFxUBfS/9xw/j0llY1i4g+rx+GoCgU=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
        by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AE_R7BRfqcLe; Wed,  6 Jun 2018 00:49:55 +0200 (CEST)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
        by ext-mx-out002.mykolab.com (Postfix) with ESMTPS id 27D7D1A0;
        Wed,  6 Jun 2018 00:49:55 +0200 (CEST)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
        by int-mx001.mykolab.com (Postfix) with ESMTPS id E2270163;
        Wed,  6 Jun 2018 00:49:54 +0200 (CEST)
From:   Federico Vaga <federico.vaga@vaga.pv.it>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH 2/6] doc:sphinx: fix parse-header description
Date:   Wed,  6 Jun 2018 00:48:59 +0200
Message-Id: <20180605224903.9483-3-federico.vaga@vaga.pv.it>
In-Reply-To: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
References: <20180605224903.9483-1-federico.vaga@vaga.pv.it>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The description speaks about the option ``--man`` but it
does not exist. Instead, there is the option ``--usage``

    $ ./Documentation/sphinx/parse-headers.pl --man
    Unknown option: man
    Usage:
        parse_headers.pl [<options>] <C_FILE> <OUT_FILE> [<EXCEPTIONS_FILE>]

        Where <options> can be: --debug, --help or --man.

Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
---
 Documentation/doc-guide/parse-headers.rst | 2 +-
 Documentation/sphinx/parse-headers.pl     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
index 684490c68acb..24cfaa15dd81 100644
--- a/Documentation/doc-guide/parse-headers.rst
+++ b/Documentation/doc-guide/parse-headers.rst
@@ -32,7 +32,7 @@ SYNOPSIS
 
 \ **parse_headers.pl**\  [<options>] <C_FILE> <OUT_FILE> [<EXCEPTIONS_FILE>]
 
-Where <options> can be: --debug, --help or --man.
+Where <options> can be: --debug, --help or --usage.
 
 
 OPTIONS
diff --git a/Documentation/sphinx/parse-headers.pl b/Documentation/sphinx/parse-headers.pl
index d410f47567e9..c518050ffc3f 100755
--- a/Documentation/sphinx/parse-headers.pl
+++ b/Documentation/sphinx/parse-headers.pl
@@ -344,7 +344,7 @@ enums and defines and create cross-references to a Sphinx book.
 
 B<parse_headers.pl> [<options>] <C_FILE> <OUT_FILE> [<EXCEPTIONS_FILE>]
 
-Where <options> can be: --debug, --help or --man.
+Where <options> can be: --debug, --help or --usage.
 
 =head1 OPTIONS
 
-- 
2.14.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
