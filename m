Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AA5D77E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 07:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751020AbeEBHvM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 03:51:12 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32869 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751004AbeEBHvM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 03:51:12 -0400
Received: by mail-wm0-f67.google.com with SMTP id x12so17651254wmc.0
        for <linux-doc@vger.kernel.org>; Wed, 02 May 2018 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ZweXpq+vSw41jboRFRtRpq7qHkGeJUcg9jYZAFbyCIg=;
        b=JmxzKos0+kHiXr3R225gMRO9pBlPzGnjQIaBjjmH2Ujp2aypjn4sGfmQUix1UlpZJS
         xjT2Stkn+lMl31RSHsSQOk2uQaxV50nMjDjXEJDsMPZxj7l+G/FkBGZ28o86FzmmHiE+
         pLjiU0XS1Fk6YzKpDeuhz4OI7I+qTSS1E5UbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZweXpq+vSw41jboRFRtRpq7qHkGeJUcg9jYZAFbyCIg=;
        b=ZBfA0uXEG3NdnprxUzqyRb/ksfY4D5DdV7zUwVi39z0CXjGaq6DeC0q/bNhQlDDO0B
         9+g5fQVR9zqvSNF40qaZvfScH9x5lJU1oV8CCdAQkDhkM4flPSTz4JcZCmQtvtny9YQ3
         USbiCNRdwxHDcHmtyo4fIGiRDwTrEd0TPY19tqmQlQYkJHYhjAx0OOXtNlUlsQ7A+EsW
         DcD/cXw/EDIH8z3sRuC/dkEohEhHXVq8TjEe+1bP2KGDVPjO67noYa1OlIBAuUzDSSdm
         veqHY2iISohGD9JsheOQJ7P+XE1b8Q7Cw16W/JXuyCZwcW8ezXHRp2DVqWFJwSKVtOAE
         Ozuw==
X-Gm-Message-State: ALQs6tAsJ2MwCoTSGurvBLIymhxZ5jQeyLqOGj0sFHMkuIXV4Y7OOLAa
        claeG3QXIxsG+TTAOj6KL9hw1Q==
X-Google-Smtp-Source: AB8JxZpbBZyE1JuUbrQG08br+h8idjKeD+k7pnyqcNc5UquA49zBJLkCMDMbGrskSvToDzkBPzu7Ag==
X-Received: by 2002:a50:949c:: with SMTP id s28-v6mr24664159eda.201.1525247471238;
        Wed, 02 May 2018 00:51:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:5635:0:39d2:f87e:2033:9f6])
        by smtp.gmail.com with ESMTPSA id v23-v6sm6353224edr.48.2018.05.02.00.51.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 May 2018 00:51:10 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Eric Anholt <eric@anholt.net>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] doc: botching-up-ioctls: Make it clearer why structs must be padded
Date:   Wed,  2 May 2018 09:51:06 +0200
Message-Id: <20180502075106.7476-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.17.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This came up in discussions when reviewing drm patches.

Cc: Eric Anholt <eric@anholt.net>
Cc: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

--

Aside: I wonder whether we shouldn't move this to some other place and
rst-ify it? Any good suggestions?
-Daniel
---
 Documentation/ioctl/botching-up-ioctls.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/ioctl/botching-up-ioctls.txt b/Documentation/ioctl/botching-up-ioctls.txt
index d02cfb48901c..883fb034bd04 100644
--- a/Documentation/ioctl/botching-up-ioctls.txt
+++ b/Documentation/ioctl/botching-up-ioctls.txt
@@ -73,7 +73,9 @@ will have a second iteration or at least an extension for any given interface.
    future extensions is going right down the gutters since someone will submit
    an ioctl struct with random stack garbage in the yet unused parts. Which
    then bakes in the ABI that those fields can never be used for anything else
-   but garbage.
+   but garbage. This is also the reason why you must explicitly pad all
+   structures, even if you never use them in an array - the padding the compiler
+   might insert could contain garbage.
 
  * Have simple testcases for all of the above.
 
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
