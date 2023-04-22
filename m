Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FD1C6FD18
	for <linux-doc@archiver.kernel.org>; Sat, 22 Apr 2023 17:53:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjDVRxD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Apr 2023 13:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjDVRxC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Apr 2023 13:53:02 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B072100
        for <linux-doc@vger.kernel.org>; Sat, 22 Apr 2023 10:53:01 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1a9253d4551so26855385ad.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Apr 2023 10:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1682185980; x=1684777980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUwLHex7C0qMDCMBJbcjdVcJIndC8iDzP/c9aUCV0NQ=;
        b=GZb5EdcEM1+UWMyalZaRnvlyIxe2QKWw+ojKu9jtqu6Ow/xPh64SMPcszyFyQz+SYV
         ynk8iN2tycPtYEpVkftN+E1hI4Q5E/1lHejnkl5pb4jTTC+jRdqftSnO92qF07i5Q7lN
         0M3bH70bnyfiWF+YRlF47c3aSvD++76u095DdJaxzF7C6I2KG9FH2bRJ7r7zxCQTuV6k
         R56cUhSjY6ku6UV2ucGINPbkbAWGySB/Jec0SaSYTHiqyYv3F1FchQ+3t/oxKF5ReutV
         Zf5pu5ithdijJbD7DxJx3CuYfMX+QTS8+TBMAjDAfMpeR/UgpxF/3JH2Sji44BsmkkAU
         E9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682185980; x=1684777980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUwLHex7C0qMDCMBJbcjdVcJIndC8iDzP/c9aUCV0NQ=;
        b=LHQCoGFDTDnNw1lJP/I4NHuzTGoLqQY4MyHrEXUv5xOaKfJa4ly1mjxgE5Vf7zxj9B
         /+344ihnvfZJLI+wVmOxcqOz6Jmn4eJzsHat0D0hK/m9XrWIjSCab1QJqdQVPRkVOfb+
         gF++ZzF4bsi8sRTTOld9+e6C120BYLTbwUQlpzm0nOIx9uhptLROpzybC3/rtBx/Kmw0
         ERavQZPOLaUGM6ZB+3yUeGZRknNNRShIQhZ+6pnDInvN2/Emd67AxMICnyEOD6A3+oPm
         xhp+MCVpqrK1yeK3lbuCxo6hdhEUn3GzTCvON+QN8eAQMwwK8f9m9AGnVNRbjM8KkqQ9
         pDnA==
X-Gm-Message-State: AAQBX9dpGbwLl9Aezk4gYrhc+ffIOLXYEqOyJ9vtfOTMtMRrq1Rd7gg1
        eEqAEK8PJxDzn38v+kAJFlfolHPm+DbtQppuDuGvaQ==
X-Google-Smtp-Source: AKy350Zi74ClXpjhA9Zl/jZd8Sb7pF42op6asdZNN7o2+rdqJ5N8tnaJjTckrvzIEPMPZJFixMTWvQ==
X-Received: by 2002:a17:902:d503:b0:1a9:6d12:9f29 with SMTP id b3-20020a170902d50300b001a96d129f29mr150133plg.36.1682185980130;
        Sat, 22 Apr 2023 10:53:00 -0700 (PDT)
Received: from carnotaurus.. (c-73-252-184-87.hsd1.ca.comcast.net. [73.252.184.87])
        by smtp.gmail.com with ESMTPSA id y11-20020a170902864b00b0019c2b1c4db1sm4247513plt.239.2023.04.22.10.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 10:52:59 -0700 (PDT)
From:   Joe Stringer <joe@isovalent.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: [PATCH linux-doc v2] docs/doc-guide: Clarify how to write tables
Date:   Sat, 22 Apr 2023 10:52:56 -0700
Message-Id: <20230422175256.3396430-1-joe@isovalent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Prior to this commit, the kernel docs writing guide spent over a page
describing exactly how *not* to write tables into the kernel docs,
without providing a example about the desired format.

This patch provides a positive example first in the guide so that it's
harder to miss, then leaves the existing less desirable approach below
for contributors to follow if they have some stronger justification for
why to use that approach.

Signed-off-by: Joe Stringer <joe@isovalent.com>
---
v2: Simplify recommendation for either simple or grid table syntax
    Remove example, link to rST user reference
---
 Documentation/doc-guide/sphinx.rst | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 23edb427e76f..77ac7dc27715 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -313,9 +313,18 @@ the documentation build system will automatically turn a reference to
 function name exists.  If you see ``c:func:`` use in a kernel document,
 please feel free to remove it.
 
+Tables
+------
+
+ReStructuredText provides several options for table syntax. Kernel style for
+tables is prefer *simple table* syntax or *grid table* syntax. See the
+`reStructuredText user reference for table syntax`_ for more details.
+
+.. _reStructuredText user reference for table syntax:
+   https://docutils.sourceforge.io/docs/user/rst/quickref.html#tables
 
 list tables
------------
+~~~~~~~~~~~
 
 The list-table formats can be useful for tables that are not easily laid
 out in the usual Sphinx ASCII-art formats.  These formats are nearly
-- 
2.34.1

