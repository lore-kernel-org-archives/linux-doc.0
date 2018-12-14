Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B3167D089
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Dec 2018 17:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbeLNRfe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Dec 2018 12:35:34 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54154 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729758AbeLNRfe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Dec 2018 12:35:34 -0500
Received: by mail-wm1-f65.google.com with SMTP id y1so6419972wmi.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Dec 2018 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=iJTci/dMZv6OxczQYBaBGFdMVtjgiHQ/y6WXyHH2vVw=;
        b=dWQU/EW3ml7g3V+eYlohjhqI5OZBPxMfQ2S8OSMqehrXZpB8UU0whIN50e8T12doCv
         mFEXEaW01K+MjZ2M8tuf4G//7YpsmA2UTANjAS2T1+KGWktorY4dpG+gR6eMS/DtU1mE
         s48R6wzqZwzC9g21Emh7lH3iKtLQhsLzumgco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iJTci/dMZv6OxczQYBaBGFdMVtjgiHQ/y6WXyHH2vVw=;
        b=Shi/beN1QMyKtwP9W3m4BwYGWMJQq8rr0yhR8qnW6gdy763AjP1LsXjZX9i5oWk2bu
         xfec/ML00JxRJVWb8k5G4OZztq82UaP85uVJSt1dSaIDLXa1q1ykDpewUXm0U1ZIr6bk
         hq+OSnMbW5/JC9hQIPkBeOOPMRcPwoR0DmQuqBM5f9iBUgemJoQbTAPMXj79j/iNZ9qi
         ua4MmJq7PlBkz03y4Lc+ukfKUZk3O0apIbSFkPlig+OvpHJ8JN3veL+Yr/BmZ0RKqYDn
         0J6ZiFGGY5ToBkS5dIioabX1J0Gm2GtMRY41uY8EaZB6shSCDvxLqVJbub8vuy2jpvb9
         g1uw==
X-Gm-Message-State: AA+aEWbGinflwAXlDfT0JaWxL2TqGnFSq5uX2xArIsVATKKFRgqcrsrX
        rGZzsYdG9nXsakqLlqvnynDGCA==
X-Google-Smtp-Source: AFSGD/Xe8WISKtGrsCIoWGNkNPDfkLgzPa/sF4bJ7pjFX0VSYxalUeiLwX0ADqWcJAW6vkdddbanCA==
X-Received: by 2002:a1c:c483:: with SMTP id u125mr3966389wmf.14.1544808932896;
        Fri, 14 Dec 2018 09:35:32 -0800 (PST)
Received: from localhost.localdomain (58.red-81-47-145.staticip.rima-tde.net. [81.47.145.58])
        by smtp.gmail.com with ESMTPSA id 199sm6259772wmh.21.2018.12.14.09.35.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 14 Dec 2018 09:35:31 -0800 (PST)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, joe@perches.com,
        gregkh@linuxfoundation.org, himanshujha199640@gmail.com
Cc:     apw@canonical.com, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, niklas.cassel@linaro.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH 0/2] Fix Co-Developed-by
Date:   Fri, 14 Dec 2018 18:35:26 +0100
Message-Id: <1544808928-20002-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following set unifies the terminology for co-developed patches
(losing the capital in Developed) and adds the rule to the
checkpatch.pl script to stop warnings.

Jorge Ramirez-Ortiz (2):
  docs: fix Co-Developed-by docs
  checkpatch: add Co-developed-by to signature tags

 Documentation/process/submitting-patches.rst | 4 ++--
 scripts/checkpatch.pl                        | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.7.4

