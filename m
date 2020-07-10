Return-Path: <SRS0=prDY=AV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A021DC433E4
	for <linux-doc@archiver.kernel.org>; Fri, 10 Jul 2020 20:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FDB6207BB
	for <linux-doc@archiver.kernel.org>; Fri, 10 Jul 2020 20:01:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ICz1DdUa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbgGJUBb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Jul 2020 16:01:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43857 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726832AbgGJUBa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Jul 2020 16:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594411289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=+C2myllbgYXs+g99CIHc8NDHrLcr23lDtc9CD243bBo=;
        b=ICz1DdUaaR2CFTk90z+/6bHzqTuBdzK84lekcVNSqj1oSOkEw2AxyHszNu7ZyQbihjG8q4
        JKbvN91+l0//ZbHODVQz3rpFHd0v6vC7bm/YlmGeVL1Tdd9xPUNUmb7yI9Do1UESB5wn0j
        QAMVVCSr99fo7zrmRI+5U9dpEmnM+zA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-4Sx1-MYFO5amHAl9oK3uQw-1; Fri, 10 Jul 2020 16:01:27 -0400
X-MC-Unique: 4Sx1-MYFO5amHAl9oK3uQw-1
Received: by mail-qk1-f197.google.com with SMTP id 13so5205433qks.11
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2020 13:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=+C2myllbgYXs+g99CIHc8NDHrLcr23lDtc9CD243bBo=;
        b=akxQvJFV+2VLpE3gnBfzLt7UaYgfYdRcgcmWQClrN/masyl0Zgl4mAEw2kb3aJFuBp
         UcNxjs4IwHAAp4Iuqq6C9sYvY5NIWsryGZDe0aKjn+UU5k5mN8+TQruX/6Xi406VNjYH
         bP0J7kph9JsmSIswmvTWSuyZDm7/96vuGq8e8xoYFgCUfLMbAMBdVdtZJJ6FsDzmj343
         pMc46/2VSkiiXGLMo8ieygXnnlfjBj7Ul0BBxNueIM7nG/2EHMVdGfKdVIhRfcr/clj6
         70DwIfVpjlqCC7hXIy5VyY57/BsSYjiWo9BvaVeGCSxH5EIdQdNgTjsilotCl9L9+lUR
         f7XQ==
X-Gm-Message-State: AOAM532RaVE7KCKNrWDWTMVVU2xJz/HgcyhFDOIkr0A8vlVabkt/d6WQ
        vJKEZHJPCDWUQNKxcm1VmrYlsqFmQWM/+DS3aArffTUcE5M9VKwM8tKDV5e+Y5aDEPrE4A4gWd0
        Q6ZqP+44Nl6zEsQ8x+Xqi
X-Received: by 2002:a37:a785:: with SMTP id q127mr67258142qke.334.1594411286797;
        Fri, 10 Jul 2020 13:01:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwklCrfU4uCNNPvT//9/MhCMu829xHS+A0xi5HVdKiVFOgP3sesoeTEoTKpkzNpXzpLZQe67w==
X-Received: by 2002:a37:a785:: with SMTP id q127mr67258119qke.334.1594411286528;
        Fri, 10 Jul 2020 13:01:26 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c9sm8380430qko.24.2020.07.10.13.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 13:01:25 -0700 (PDT)
From:   trix@redhat.com
To:     corbet@lwn.net, jacobhuisman@kernelthusiast.com, robh@kernel.org,
        grandmaster@al2klimov.de, mchehab+huawei@kernel.org,
        konstantin@linuxfoundation.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] docs: process: Add an example for creating a fixes tag
Date:   Fri, 10 Jul 2020 13:01:15 -0700
Message-Id: <20200710200115.21176-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tom Rix <trix@redhat.com>

To make it a little clearer how to create a fixes tag,
add an example based on the preceeding gitconfig setup.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 Documentation/process/submitting-patches.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index e58b2c541d25..5219bf3cddfc 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -196,6 +196,11 @@ outputting the above style in the ``git log`` or ``git show`` commands::
 	[pretty]
 		fixes = Fixes: %h (\"%s\")
 
+An example call::
+
+	$ git log -1 --pretty=fixes 54a4f0239f2e
+	Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
+
 .. _split_changes:
 
 3) Separate your changes
-- 
2.18.1

