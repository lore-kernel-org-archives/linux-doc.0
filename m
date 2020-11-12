Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD54C2D0A3
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 09:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A392216FD
	for <linux-doc@archiver.kernel.org>; Thu, 12 Nov 2020 09:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="se8skr7N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgKLJOH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Nov 2020 04:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgKLJOG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Nov 2020 04:14:06 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D308C0613D1;
        Thu, 12 Nov 2020 01:14:06 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id y22so2467426plr.6;
        Thu, 12 Nov 2020 01:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=uHAT9NIQOmV3xlfk56csymxbJFSSoYDhng2Y5p+8Fyk=;
        b=se8skr7NQR8cOnUlsICyx+H+Clcf1XNWXLVGU5waUaFk8i3mVUi5E1+4OlFatawQZi
         A2TeTLTi9qtWpELpYckksSK9n5hUgBkvH7Cbv0euNsN2kS5qcsVBw0AFkdDQmeD2FY/H
         PVZlJ6LwPUMFm+ZbB29tNJAZKxTL2dWmuFAKZ+HsykF7px36Dad7TCWuw2A/fHn3QnY0
         bDKpld60/EtekZF53PcV7m7fHqmgLWrBngtiVbXG86dzS8/ZE2dijnvK8n/kNRHAoeZm
         jODx8WJ3E6j1Y/SodMa4sJq0YM0SHyfmfBtAi/QpMxHhPNyayOuj6j5tMWXazx2rLBfX
         81qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=uHAT9NIQOmV3xlfk56csymxbJFSSoYDhng2Y5p+8Fyk=;
        b=bqkzKRCIFUhlDZN7gQljLEt0ztITeu8qMdzEZ1+kRLftqII3XWKbHRLD/wE+69n0xg
         mw/0mOnEixiJYbH++OHQCIzDSLz+MFJ2pLKVzitz22i4Z3aG+PtggNokcSARJpSxIOoT
         5wGUiEmhlS+wuDu1MEocelhxKSU35372gTYTWHoqOue7NdzW9HNkVN05GUos3qwp9Dbc
         ehCpH/coCt5Fsq6Gy9SSg8LUwb857FMe6FltrN9DAUmB0sJ/vlfxQyz7NsHV+s+sYB4F
         FNcmhuuvPQ28u+7dJ2sSCxuKtuzOGK+S+21gYulRa9uHp0s5lr1looUzdWua9Vx1o+AT
         aVIw==
X-Gm-Message-State: AOAM5329vb7MO9UouggjwheKjnEMAklVHFhRI1Gbhxzd+/EJw0CUU6z2
        akhi8iFev7pf9yTy7LRFB+JPYOgkmCtc
X-Google-Smtp-Source: ABdhPJy6NTXYlf5HaYJ/l2A8eLa0i/fEuLgbOgnrGoWZ5ynZILwf9/WeLeriZqyi17C5JMVyr7Ol1A==
X-Received: by 2002:a17:902:c154:b029:d6:efa5:4ce7 with SMTP id 20-20020a170902c154b02900d6efa54ce7mr24720694plj.73.1605172445533;
        Thu, 12 Nov 2020 01:14:05 -0800 (PST)
Received: from Sleakybeast ([14.192.29.96])
        by smtp.gmail.com with ESMTPSA id p188sm5229317pgp.65.2020.11.12.01.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 01:14:04 -0800 (PST)
Date:   Thu, 12 Nov 2020 14:43:53 +0530
From:   Siddhant Gupta <siddhantgupta416@gmail.com>
To:     corbet@lwn.net
Cc:     mortonm@chromium.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mamtashukla555@gmail.com,
        himadrispandya@gmail.com
Subject: [PATCH] Documentation: admin-guide: LSM: improve the title underline 
Message-ID: <20201112091353.GA19262@Sleakybeast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning of title underline too short

Signed-off-by: Siddhant Gupta <siddhantgupta416@gmail.com>
---
 Documentation/admin-guide/LSM/SafeSetID.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/LSM/SafeSetID.rst b/Documentation/admin-guide/LSM/SafeSetID.rst
index 17996c9070e2..0ec34863c674 100644
--- a/Documentation/admin-guide/LSM/SafeSetID.rst
+++ b/Documentation/admin-guide/LSM/SafeSetID.rst
@@ -107,7 +107,7 @@ for a UID/GID will prevent that UID/GID from obtaining auxiliary setid
 privileges, such as allowing a user to set up user namespace UID/GID mappings.
 
 Note on GID policies and setgroups()
-==================
+====================================
 In v5.9 we are adding support for limiting CAP_SETGID privileges as was done
 previously for CAP_SETUID. However, for compatibility with common sandboxing
 related code conventions in userspace, we currently allow arbitrary
-- 
2.25.1

