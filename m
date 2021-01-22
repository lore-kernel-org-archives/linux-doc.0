Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653C7C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jan 2021 11:17:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 185A02246B
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jan 2021 11:17:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbhAVLRf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Jan 2021 06:17:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727671AbhAVLRB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Jan 2021 06:17:01 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69FFC0613D6;
        Fri, 22 Jan 2021 03:16:17 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c128so3992871wme.2;
        Fri, 22 Jan 2021 03:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VZLx/PblJd6MezWoeQ4GsUV4rI21p1au0Wz2+FJg3/Q=;
        b=dTCXUoPDVQAxKr7QSSOZrhclx2dJ9Z4Kx+saJmKVCKm+BejIayWHEFuwdENdfw4TSi
         gaIDxUuNrftFL71ss4xTKY7E6LqZegNfgu0NqdZCVQUJELOBLFnMJWx5LfWg+3+CUryi
         30CAXQqGpWTQ6ChI6OuufZ9vrBb3SLyiwKqkLgB74TpT23U9nR6uDYh0EQxhQhb45O+b
         6qTpiwXTxQBXnYTyV5KYXXXqvyo4hILLKFdZwt/UIjGz7IEqHc9V/pY8DSZql2CwFnfh
         /sM7V4FZ/Nw5K/nGxAKpQW/owlL4lJg4wT88EGM8OtqDZowpO8qeTqMi+3di0jCtrX8D
         O/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VZLx/PblJd6MezWoeQ4GsUV4rI21p1au0Wz2+FJg3/Q=;
        b=piI6+pjH5QtRkjWk2wNSfKUXMJx1wkKqNoj5DpUBaNeJpOxXcgl0v6vIOWHxApik5E
         XPuHTBGf25EzeFFzTHw7zzTmZ0i1nlkd/G/gMRESS5Q6EIdMmPewWysT0KqGYQBpHrFL
         GMjn3Rjv1+WxJYgX7hWvu2j9vipgJY6Oe2aJVVWSXuiF3C61FJttvxxX5RevgzEVtsid
         mCoutSaIIfGtkj2VF1czt7yQi3VBLCLs2KSMyUyjn1GbWyUlpGor8pb+YZ5fXHdoP1q2
         JKXrivtUQiom3e6XynLYeK4oDlDrFypvZs6VZLJjUTKWAvCzdOtQi8+9bPhWADnReZHa
         YRbg==
X-Gm-Message-State: AOAM531uSwjnXELFoVbg6rt71BBOHSgHKtW2cijyHFymD6FpbsqyIq9p
        PVu0y6G8HYTCkX8LwJxwCng=
X-Google-Smtp-Source: ABdhPJz8/MaE6nni4CXTndtsyWaxV2OGHflQZJxSd+FMQer7kgkXcf9NtRaiKp+CYyEttSwZESC6aA==
X-Received: by 2002:a7b:cbd5:: with SMTP id n21mr3600591wmi.5.1611314176509;
        Fri, 22 Jan 2021 03:16:16 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d97:4900:808e:47fd:6ea4:7fa2])
        by smtp.gmail.com with ESMTPSA id x128sm11556111wmb.29.2021.01.22.03.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 03:16:15 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Mikulas Patocka <mpatocka@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Cc:     Alasdair Kergon <agk@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH for device-mapper/for-next] dm integrity: follow ReST formatting
Date:   Fri, 22 Jan 2021 12:16:06 +0100
Message-Id: <20210122111606.24999-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 61b8b2a834bf ("dm integrity: introduce the "fix_hmac" argument")
adds some new part to dm-integrity.rst, but this causes make htmldocs warn:

  dm-integrity.rst:192: WARNING: Unexpected indentation.
  dm-integrity.rst:193: WARNING: Block quote ends without a blank line; \
    unexpected unindent.

Make dm-integrity.rst follow ReST formatting.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mike, please pick this quick documentation fix in your for-next branch.

 Documentation/admin-guide/device-mapper/dm-integrity.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 39a9fdc9f6ab..ef762857da95 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -188,6 +188,7 @@ fix_padding
 
 fix_hmac
 	Improve security of internal_hash and journal_mac:
+
 	- the section number is mixed to the mac, so that an attacker can't
 	  copy sectors from one journal section to another journal section
 	- the superblock is protected by journal_mac
-- 
2.17.1

