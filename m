Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFDAE95A8F
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 10:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbjJJKMr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Oct 2023 06:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjJJKMq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 06:12:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168E797
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 03:12:44 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4064867903cso55581325e9.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Oct 2023 03:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696932762; x=1697537562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=teYJaujWBCZMTxCLTD+iOO+xzJ4IWgTIsHFi/8ohCow=;
        b=RYELOLeFmbycvKbS5j7pdiq+gIU9r6GKjpP7iyvoWjvStQ1zfGZenwc/gDCH0QFZp9
         ToIDV1m6wE04IHsyKpRgnX3nSxj3+4mNuuMshD7dTV6nkhyyrGQyVb9RH+lVBhtRDTAA
         K8zkEKJ3tZl7xt61/8oNiqkLwn9/WBF59R1Pj9qy0Jm/cE8+0HNfqi+e0rJIX4xN7EEt
         TlUpO/Cvm7v+FlYK/6v52Zhl1rueHulPuILI+Qsl6VG5uCydU6+kFk4taaxskvA9m7dG
         8aBiLhJgxZBAp3qAkwo9Bm952urWHVzu83/qWVcKQaXEiiEZ+DhdsFVTU3QI4nlABQ86
         drAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696932762; x=1697537562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teYJaujWBCZMTxCLTD+iOO+xzJ4IWgTIsHFi/8ohCow=;
        b=UuFe86GNLFdyclviYmXS1oJr6CMrYkPJI9GKJSj8VXdQMWJti0cui9ZVzi4j4A1VWm
         rZjWhd97rBB5h2NQDODwnhiA1fxOPeM1G7o5nhE6eW1FUw3OGk0sCl71r735f4UluA+z
         vLZAcp/VG+UWhck40Y6o+a9N61DIzqXD7qoFQwsEI4NMQ3m+M4O0BvJg1lKt1IY+ges7
         e19/+Qv8I8/zisC9mDmaWdpFjDG1nwn8d1vZWiT5e/3SH9k5CE8mzUWzK4a3mIl09KD1
         cSPozQvZiEYBX2j4grFkiyoRLE8vViop5mXGVhZTtn8LCeFf59ClBMyGmGRiCkUmW3hX
         MT1g==
X-Gm-Message-State: AOJu0Yz0ylC2jVgKfyzlDRxR1UhGCB6LChbenTBbpjf+P3HR9c08bwnz
        2lHIkU5Zgf1/7Jr5Xta7/tgn6A==
X-Google-Smtp-Source: AGHT+IEmxKv6FlPH3O6WPf3LYHGGN3ufjTjlBrrE6YWVYP2w65QpCOqWBYzL851J/FKoQGpYzulCSA==
X-Received: by 2002:a1c:6a18:0:b0:405:4a78:a892 with SMTP id f24-20020a1c6a18000000b004054a78a892mr14910939wmc.9.1696932762426;
        Tue, 10 Oct 2023 03:12:42 -0700 (PDT)
Received: from heron.intern.cm-ag (p200300dc6f49a600529a4cfffe3dd983.dip0.t-ipconnect.de. [2003:dc:6f49:a600:529a:4cff:fe3d:d983])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c230100b0040644e699a0sm15977562wmo.45.2023.10.10.03.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 03:12:42 -0700 (PDT)
From:   Max Kellermann <max.kellermann@ionos.com>
To:     linux@roeck-us.net, joe@perches.com,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Max Kellermann <max.kellermann@ionos.com>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/process/coding-style.rst: space around const/volatile
Date:   Tue, 10 Oct 2023 12:12:40 +0200
Message-Id: <20231010101240.992984-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are currently no rules on the placement of "const" and
"volatile", but a recent code submission revealed that there is
clearly a preference for spaces around them.

checkpatch.pl has no check at all for this; though it does sometimes
complain, but only because it erroneously thinks that the "*" (on
local variables) is an unary dereference operator, not a pointer type.

Current coding style for const pointers-to-pointers:

 "*const*": 2 occurrences
 "* const*": 3
 "*const *": 182
 "* const *": 681

Just const pointers:

 "*const": 2833 occurrences
 "* const": 16615

Link: https://lore.kernel.org/r/264fa39d-aed6-4a54-a085-107997078f8d@roeck-us.net/
Link: https://lore.kernel.org/r/f511170fe61d7e7214a3a062661cf4103980dad6.camel@perches.com/
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 Documentation/process/coding-style.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 6db37a46d305..b40830517938 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -271,6 +271,18 @@ adjacent to the type name.  Examples:
 	unsigned long long memparse(char *ptr, char **retptr);
 	char *match_strdup(substring_t *s);
 
+Use space around the keywords ``const`` and ``volatile`` (except when
+adjacent to parentheses).  Example:
+
+.. code-block:: c
+
+	const void *a;
+	void * const b;
+	void ** const c;
+	void * const * const d;
+	void * volatile e;
+	int strcmp(const char *a, const char *b);
+
 Use one space around (on each side of) most binary and ternary operators,
 such as any of these::
 
-- 
2.39.2

