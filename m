Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A732EC433EF
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbhLENtD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbhLENtC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:49:02 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD14EC061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:35 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id gt5so5796185pjb.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MPYrBQHPudA2q8FkVv3LU+pDiDnMD5JotvTJvdYrXjo=;
        b=mvqdgeybzGGh/JXQbqxXzF7y7883PuED+RpbCI4EViB917sa3lFT+n4fbU6V1sGhC8
         bn7/soKmTB6n0AMPfNyL7SbxMY2s6z5H3d5449tbiZVj84/EeV660agrtEpN7zIZ/AMX
         WqlxP1kL8nzNtrPAicHqBcPS1drC+MxVwqpPxCqpOw9UIJ90YP1moA3KXN6nfz7JD6m7
         2PSPUTZpjcsset+uOzIvJaA9oX1z7+7BxKafwMQeLMGBb3XXblCMa0DH449Z6jUEU9fm
         txxmTUhhlGqy0nQ62J4myLdobeK19QuIXhcnYk4Ng4egFFAuzBwkU5digzhEHnW4j+8L
         rzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MPYrBQHPudA2q8FkVv3LU+pDiDnMD5JotvTJvdYrXjo=;
        b=IHSbDwHhjLH52sO0qUJgdN19cHMvWLihzlfyMBV/RqoGcOrTSB7YP3+gfm7WFlzl5s
         RHLnvOxCnQMCqCr2jKP4xTnC4jcv/SXGT2Q4ZmHHaTUPql3yZWn1EEVemKl6yg8Wq4pA
         fIg5iXw8sqs2OPcyXQ0k8QK2qB3Z2Q7sFpiqq8FED2nFi4aJsSJGQcgxY3ymGrdain3o
         FNVksex/JmvzBcXs07dyv/LoqFYlaKb2iMbB2f7WNpZ3onMv7NG+UiSHJNeVOXpOnbQT
         palQ6RwaGbpE2yxubERTGAfUTJ05J/PBAUgzoLuBPj6CClwqQZXRVgw9UsoXkmaqRzQm
         TlOA==
X-Gm-Message-State: AOAM533T8OQehp7MiIn/BDe8U4KhOnZN+ni7bGno7INHDhECDe+kKqVY
        8ry8e+gBsSfURqoIq6A9ZAc=
X-Google-Smtp-Source: ABdhPJwqaBbn/JzNTiiaz+MKBd0PyETNLpDneljtNX/MbkgpKCdZISKWEaPIcRobyl5pf1XhSv4Ssw==
X-Received: by 2002:a17:902:b581:b0:144:e601:de7 with SMTP id a1-20020a170902b58100b00144e6010de7mr36921896pls.71.1638711935290;
        Sun, 05 Dec 2021 05:45:35 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:35 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 05/11] docs/filesystems: add four apostrophes to _start and _len
Date:   Sun,  5 Dec 2021 21:43:54 +0800
Message-Id: <61ac8efc45e28b661e4f81595a65dd804e3b13e8.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

linux-next/Documentation/filesystems/netfs_library.rst:519: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/filesystems/netfs_library.rst:519: WARNING: Inline emphasis start-string without end-string.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/filesystems/netfs_library.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 732139d58e74..10d97b87de2a 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -518,7 +518,7 @@ The methods defined in the table are:
 
    [Required] Called to prepare a write to the cache to take place.  This
    involves checking to see whether the cache has sufficient space to honour
-   the write.  *_start and *_len indicate the region to be written; the region
+   the write.  ``*_start`` and ``*_len`` indicate the region to be written; the region
    can be shrunk or it can be expanded to a page boundary either way as
    necessary to align for direct I/O.  i_size holds the size of the object and
    is provided for reference.  no_space_allocated_yet is set to true if the
-- 
2.27.0

