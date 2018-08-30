Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 098E07D581
	for <lwn-linux-doc@archive.lwn.net>; Thu, 30 Aug 2018 11:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbeH3PnQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 Aug 2018 11:43:16 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:55971 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbeH3PnP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Aug 2018 11:43:15 -0400
Received: by mail-wm0-f66.google.com with SMTP id f21-v6so1648275wmc.5
        for <linux-doc@vger.kernel.org>; Thu, 30 Aug 2018 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ppVHi2qDpVAko4oywEUyVH03nYNtDWMaAZh6pkh+TAI=;
        b=vM2W1vbB7o60flHuNJ/bgTQROh+Zt2m1p0PT33/imyxEkZK1/Esv7iYw9LpWqbIh3m
         hobo1vU1c+v0Sblwfgp+dimNnJPZy/F0NvOautf7atu0tq8HTohJpgdmmMrdl4AYk151
         y1FKxABUZJiw/FShkiF4Vjx+avpapwRzC5R32XJn5fMZrR+LCeV7OWD7REcGraJpxEGx
         pZQS5IbOZ+yijKZDr2ka3/sxT/vVG5mZpKvFVey/NkAxEkpyZY7MDNEqyN0Dv5ql+VJW
         4UYj6K8/zcqE3BRWKLrn8aXymf+gcl3zDhnzQaYNb/VkQUlbBIQ8Zyx56geVgZccD9MO
         FSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ppVHi2qDpVAko4oywEUyVH03nYNtDWMaAZh6pkh+TAI=;
        b=h2o2gOK5X5xnVmzbNTETgk6mxN6e+A/db6fmhxM7Yf4OQf46ijk6azqPKl8NI0Ux+R
         Dejh1gqe/lGXtAiTW0R5tWFj9TXMHn5+Fr/r1JIKnDFxRjF5NJ05A5wcZ8883A5QU2Ea
         zDlUi7YTfY93xOdCsL1KdTThVH5o+H6vPNFaDC+MJrGTl7LSk2sf6riztj2+4lE88z6x
         C97WFL9EYD2GRYxt2/xhMFFragknqjK+ZNaz83k3gy1h7AYNN7HapSmDYCL4Rl9mAYgm
         KAx8vRTf+1zjPNu4pQWOdZi+PIDzq77/llSPO0VQXJMDl/zFTygkN2L3R8gW1hZAKZ9s
         8sRQ==
X-Gm-Message-State: APzg51AwIzDS3oO/9dEO8EFxCS+HbOiwsskXajqZdOrsQEgCCJAv7KqV
        7ePhPfhhx6nqUZkvFW3FItLnxA==
X-Google-Smtp-Source: ANB0VdYOFoy1sxoEnv1Wgj/+prhG1/Y/jGlov/9lPGGe6D7gsNtu3J1gP5Nihdp90zj4LxikZG+9lw==
X-Received: by 2002:a1c:4c0c:: with SMTP id z12-v6mr1615687wmf.57.1535629291034;
        Thu, 30 Aug 2018 04:41:31 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id z184-v6sm2175218wmz.0.2018.08.30.04.41.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Aug 2018 04:41:30 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kees Cook <keescook@chromium.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v6 07/11] fs, arm64: untag user address in copy_mount_options
Date:   Thu, 30 Aug 2018 13:41:12 +0200
Message-Id: <89806bc1c1f85fa97c62887075cc2d46b8bdeee2.1535629099.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535629099.git.andreyknvl@google.com>
References: <cover.1535629099.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In copy_mount_options a user address is being subtracted from TASK_SIZE.
If the address is lower than TASK_SIZE, the size is calculated to not
allow the exact_copy_from_user() call to cross TASK_SIZE boundary.
However if the address is tagged, then the size will be calculated
incorrectly.

Untag the address before subtracting.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 fs/namespace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 99186556f8d3..51f763fb9430 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -2672,7 +2672,7 @@ void *copy_mount_options(const void __user * data)
 	 * the remainder of the page.
 	 */
 	/* copy_from_user cannot cross TASK_SIZE ! */
-	size = TASK_SIZE - (unsigned long)data;
+	size = TASK_SIZE - (unsigned long)untagged_addr(data);
 	if (size > PAGE_SIZE)
 		size = PAGE_SIZE;
 
-- 
2.19.0.rc0.228.g281dcd1b4d0-goog

