Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8CDA87E244
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 13:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1946587AbeCBNaZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 08:30:25 -0500
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33491 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1946584AbeCBNaX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Mar 2018 08:30:23 -0500
Received: by mail-pf0-f195.google.com with SMTP id q13so4014734pff.0;
        Fri, 02 Mar 2018 05:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=q6038ZUHfVNRA19tcHIlkMj8GO/ksxiwQr1vyOwVnBA=;
        b=uZ5MAGcXbvm+vc1szsVyAQHI8oaabdlbJWCdwKzK0fEy8uS6bkqXy01ApvNSNWBC8c
         hb897Fl/QtEC46XuOnn11kLPAByKhLTrdiQvXw/cYp+UnHwf+EAYbH+9aetvNcr8NPvb
         kdovnr6y/KUwA5KYGb+G0ydw7rC+ja642PDUzz2zGdBlAa22/IxtQSEceEGqsuBeY21J
         KY+ExRkVwRPTWx0nAaLnICRMcxOy0CNoFmUZfPr79xq/aOEbVEvKWcJG4MnIp0NQFd3C
         BGmctgAQmsQlv0yox5nHz2Z7Z896qu6zg1WlznN+bcJQuaBL75KoR8f2vsqA4qpRnEbv
         psaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=q6038ZUHfVNRA19tcHIlkMj8GO/ksxiwQr1vyOwVnBA=;
        b=tOXP7Z9N8f8V7FPd4dlroPsUIMt7Wh/+4oXwGUMyzjSrDfi9lJ4s647pN8ln9T4mEg
         C5kTgEBdRBibHWbl8PYbHtngunA9oUOo58hT4553hC/ftxKj2lhiRcC8uLnrmC4oa0aQ
         TckI8azMCd01Gnq0XybjLsB3EQ7H2sPg8N/orvs46rpgdFheNHuNNcrxWQ21CjcmyemF
         f+6Pa4QG9eONkSysxEPimsh74JFldgR0zXK0715KKhMk+IPZPc/0UPYya0JUCyRTvjeY
         7huPrOV2F8NDKdHJEMm4PlIAlIWi52QCQpzs7+3UTOuF+1Zt8PkhSLW+ij3WcYKvZpek
         LjWg==
X-Gm-Message-State: APf1xPAVB+cesF6yDT+xiuXcmfFPf0iDyLd1hroeUoUxii7ABDVN7uCv
        6vjtFziUMrFiBUjh/kc+/6c=
X-Google-Smtp-Source: AG47ELsb7vfg1QfM3h7Q+C7FhWXEH+NN9mVkW5BSSb0kc78P5sCJQENOrdqrlliLBgt5ge7PnCrTOw==
X-Received: by 10.101.96.212 with SMTP id r20mr4574261pgv.139.1519997422834;
        Fri, 02 Mar 2018 05:30:22 -0800 (PST)
Received: from masabert (i118-21-156-233.s30.a048.ap.plala.or.jp. [118.21.156.233])
        by smtp.gmail.com with ESMTPSA id u9sm10122270pgb.11.2018.03.02.05.30.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Mar 2018 05:30:22 -0800 (PST)
Received: by masabert (Postfix, from userid 1000)
        id B1744201094; Fri,  2 Mar 2018 22:30:18 +0900 (JST)
From:   Masanari Iida <standby24x7@gmail.com>
To:     darrick.wong@oracle.com, linux-xfs@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Cc:     Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] xfs: Change URL for the project in xfs.txt
Date:   Fri,  2 Mar 2018 22:30:13 +0900
Message-Id: <20180302133013.9744-1-standby24x7@gmail.com>
X-Mailer: git-send-email 2.16.2.345.g7e31236f652a
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The oss.sgi.com doesn't exist any more.
Change it to current project URL, https://xfs.wiki.kernel.org/

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
---
 Documentation/filesystems/xfs.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/xfs.txt b/Documentation/filesystems/xfs.txt
index 3b9b5c149f32..4d9ff0a7f8e1 100644
--- a/Documentation/filesystems/xfs.txt
+++ b/Documentation/filesystems/xfs.txt
@@ -9,7 +9,7 @@ variable block sizes, is extent based, and makes extensive use of
 Btrees (directories, extents, free space) to aid both performance
 and scalability.
 
-Refer to the documentation at http://oss.sgi.com/projects/xfs/
+Refer to the documentation at https://xfs.wiki.kernel.org/
 for further details.  This implementation is on-disk compatible
 with the IRIX version of XFS.
 
-- 
2.16.2.345.g7e31236f652a

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
