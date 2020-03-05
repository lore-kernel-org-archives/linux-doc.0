Return-Path: <SRS0=ObY3=4W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEC8C3F2D1
	for <linux-doc@archiver.kernel.org>; Thu,  5 Mar 2020 07:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18F4920870
	for <linux-doc@archiver.kernel.org>; Thu,  5 Mar 2020 07:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J5/XLyRv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgCEHDv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Mar 2020 02:03:51 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37879 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgCEHDv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Mar 2020 02:03:51 -0500
Received: by mail-pg1-f195.google.com with SMTP id z12so2292851pgl.4
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2020 23:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7jbRLVAVV1t65FhLF/sdJH2G4CKA2x85deohg6GB6iI=;
        b=J5/XLyRvp+Bv76NsT3de+Xrs6fP5DiCuG1OM+6lCJs2Rbavj0QmJUJGIwZYaHDj2FG
         hkx0cfUFC8aMhWP+S46As+6w0GdN3uVF+cVakmCy11bRyN0/q3uXOjxOLMsauL44w8Wp
         Y7sEq5Q8OdOHQNuC1F7HVBH8oLoQ505ezE6dM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7jbRLVAVV1t65FhLF/sdJH2G4CKA2x85deohg6GB6iI=;
        b=C45Vxd+NjKmEAyjNtw8udAOSymIZuRQNbd8ediJzCo5fNNo3LxkcO5PG+wSEQTEF62
         UBuUAaQDOcguqiYG7/uhpL9giPLbbSxVekxZgPsWsZTF1L0nMWazTdxoJFrhaYZQau9Q
         FMMlcoi6r5GsKT4FZAo9oOcvrnVLu4v027bZTj+N8bIhSrZkZdPaWheOFPoi/qFZUA3l
         AIxRP0KMN1WhQXKkT9V6+X2J6mFAH7FbOFnmw9WciDPybwiiIb9/ILfCLeijDbTc19SE
         yah5qiY76nWDpUL8Vi9NfZUmiDHVWifqqHNdaBefz6quYqPiO+D7unUHeRavhNJQinEA
         clgA==
X-Gm-Message-State: ANhLgQ221ztAPJvUOc8bM7myuyXVbBuXTAHJwRu0jL5R/BKWXC5Jvh70
        CBiMWn6gxnQDOycnd9fCOvAkNQ==
X-Google-Smtp-Source: ADFU+vv+pJU9j0cc+gV1qWb3HeKiPK5T36bnZ8WPFOYn7N3xvpDTcqkOYgzQPIQrf9EAfh/CWaIS0g==
X-Received: by 2002:aa7:87ca:: with SMTP id i10mr6808918pfo.169.1583391829762;
        Wed, 04 Mar 2020 23:03:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o66sm16817935pfb.93.2020.03.04.23.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 23:03:48 -0800 (PST)
Date:   Wed, 4 Mar 2020 23:03:47 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     James Troup <james.troup@canonical.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: deprecated.rst: Add %p to the list
Message-ID: <202003042301.F844A8C0EC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Once in a while %p usage comes up, and I've needed to have a reference
to point people to. Add %p details to deprecated.rst.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2: rewrite much of the text to be more clear (James Troup)
---
 Documentation/process/deprecated.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index f9f196d3a69b..8965446f0b71 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -109,6 +109,28 @@ the given limit of bytes to copy. This is inefficient and can lead to
 linear read overflows if a source string is not NUL-terminated. The
 safe replacement is :c:func:`strscpy`.
 
+%p format specifier
+-------------------
+Traditionally, using "%p" in format strings would lead to regular address
+exposure flaws in dmesg, proc, sysfs, etc. Instead of leaving these to
+be exploitable, all "%p" uses in the kernel are being printed as a hashed
+value, rendering them unusable for addressing. New uses of "%p" should not
+be added to the kernel. For text addresses, using "%pS" is likely better,
+as it produces the more useful symbol name instead. For nearly everything
+else, just do not add "%p" at all.
+
+Paraphrasing Linus's current `guidance <https://lore.kernel.org/lkml/CA+55aFwQEd_d40g4mUCSsVRZzrFPUJt74vc6PPpb675hYNXcKw@mail.gmail.com/>`_:
+
+- If the hashed "%p" value is pointless, ask yourself whether the pointer
+  itself is important. Maybe it should be removed entirely?
+- If you really think the true pointer value is important, why is some
+  system state or user privilege level considered "special"? If you think
+  you can justify it (in comments and commit log) well enough to stand
+  up to Linus's scrutiny, maybe you can use "%px", along with making sure
+  you have sensible permissions.
+
+And finally, know that a toggle for "%p" hashing will `not be accepted <https://lore.kernel.org/lkml/CA+55aFwieC1-nAs+NFq9RTwaR8ef9hWa4MjNBWL41F-8wM49eA@mail.gmail.com/>`_.
+
 Variable Length Arrays (VLAs)
 -----------------------------
 Using stack VLAs produces much worse machine code than statically
-- 
2.20.1


-- 
Kees Cook
