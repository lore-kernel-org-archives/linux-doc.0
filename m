Return-Path: <SRS0=E6DB=AO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B762AC433E0
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jul 2020 17:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99C9C20870
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jul 2020 17:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Inx+jCP3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgGCRo0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jul 2020 13:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgGCRoZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jul 2020 13:44:25 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7CEC061794
        for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2020 10:44:25 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id c1so7006948pja.5
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2020 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=2h0QK18zaUPaUqAjh5YkqAicWcgkzJc9489a2LCjca4=;
        b=Inx+jCP3hKZgQKCRfiKQ0ofFvqfWfhRL7Oz7DWoibuGcIuLssvnp+1d8EGPpWQ0FVq
         URPEixapoTzDtowKlAoovEkFk0YokKkWPiiisKBBOFNi/hMANfRyFn0jmDzZiOmS6riM
         ZqApnRJMvphlxGWmMlZAs10bUBJ1lDLt9Wz7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=2h0QK18zaUPaUqAjh5YkqAicWcgkzJc9489a2LCjca4=;
        b=isejXxdLqNWTtz3udRZ60rmil5PGIolRvMtgpaz+N493PzNLy7BbeIXtDd9oCOnTyv
         Tslk+JRpkngEvG9bcptFTU/LJRxKf1IJioQaNpbm3y3FcvXUTulB11PRWwDa/ARvAOHQ
         h6rG5iDwaF0uFEs6fjSrETpnttMiyOV0jw+pgOu4HtpxMpAZehP2WSzZetxi7ZLMuJPi
         aAdUoCH1Au4uAoy2Y7J8Rf3HhrcIRJC0wMqMUWdeXbvAX3zWVY2CC0y6HhqL2dnAv7g4
         B2agPDVEbz9byvD13RJRoshVghkJTYR+ocvtS0xhvpjMW7uONdp6GdZK0zj2e4kRb1eW
         Q2sg==
X-Gm-Message-State: AOAM5304OM7HhfgtnhXUzPwvTuWEbkCSfV19pScG57Dg31/WRKL6892N
        wV0P/+xxKO2hk9giwg6+epDGRA==
X-Google-Smtp-Source: ABdhPJz/GEBtxkeqBBqmrA0999MF4SBi2tMI/8MYeDn7LRUvB7PBx+KxjZU+C6vkDq/IBeMgGgVr2A==
X-Received: by 2002:a17:90b:1b4e:: with SMTP id nv14mr8662092pjb.30.1593798264615;
        Fri, 03 Jul 2020 10:44:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s6sm11801449pfd.20.2020.07.03.10.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:44:23 -0700 (PDT)
Date:   Fri, 3 Jul 2020 10:44:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Dominik Czarnota <dominik.czarnota@trailofbits.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: Clarify f_cred vs current_cred() use
Message-ID: <202007031038.8833A35DE4@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When making access control choices from a file-based context, f_cred
must be used instead of current_cred() to avoid confused deputy attacks
where an open file may get passed to a more privileged process. Add a
short paragraph to explicitly state the rationale.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
I forgot to include this patch in my kallsyms_show_value() f_cred series:
https://lore.kernel.org/lkml/20200702232638.2946421-1-keescook@chromium.org/
I can either take this in that series, or it can go via docs?
---
 Documentation/security/credentials.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
index 282e79feee6a..b7482f8ccf85 100644
--- a/Documentation/security/credentials.rst
+++ b/Documentation/security/credentials.rst
@@ -548,6 +548,10 @@ pointer will not change over the lifetime of the file struct, and nor will the
 contents of the cred struct pointed to, barring the exceptions listed above
 (see the Task Credentials section).
 
+To avoid "confused deputy" privilege escalation attacks, access control checks
+during subsequent operations on an opened file should use these credentials
+instead of "current"'s credentials, as the file may have been passed to a more
+privileged process.
 
 Overriding the VFS's Use of Credentials
 =======================================
-- 
2.25.1


-- 
Kees Cook
