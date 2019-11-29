Return-Path: <SRS0=1Ifr=ZV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE3CC43215
	for <linux-doc@archiver.kernel.org>; Fri, 29 Nov 2019 19:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41FDB21844
	for <linux-doc@archiver.kernel.org>; Fri, 29 Nov 2019 19:59:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQANLXP3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbfK2T7s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Nov 2019 14:59:48 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21447 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727158AbfK2T7r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Nov 2019 14:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1575057586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2FRKI5+6EDUKwn2QzAstv2u6dW0Q8/ilQLcz5atGxuE=;
        b=NQANLXP30sRk0tXFB+ffKa9zZTtMQXSoaD2W8LshSl3Q7Ylv8BBiQQyfiYm5As3WuQG94s
        EjWu+Cna3UG4FM8zBBI98tY8ctinVKFCPfpq9MWWCfP6aJUpSlsdHMw0jwCq8jFkRPaPYQ
        HAy5Gvo5IU+QmXZfeP360nCl2HdA//s=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-D6Cx4IfxNTaad9ReuV8AIg-1; Fri, 29 Nov 2019 14:59:45 -0500
Received: by mail-pg1-f198.google.com with SMTP id k10so17083156pgm.7
        for <linux-doc@vger.kernel.org>; Fri, 29 Nov 2019 11:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BgAr5VVOQXh1yien5qVgdgmIL5RHbScoYGF2ala0/ak=;
        b=d2B7s+7iuL/Tse+jSUz64XKcZM1Q5nB6c9NjFnx5Qp2oCkyBPmnUeQSwplwY7matkI
         LZosGcxcx31eD1/7Z4fVGmq3zX9lTCH81wjwKu4GFg7O4X0p2+uZWRSIB2+z6HJ37qdK
         BLZkAoFBgxhg3g4tbzTqTWASLfAzBpQbaUHp53pO7AHFZrpQQkKdKDSnpsiovSRu/Lyn
         6Ameio71cYtPBObQM41HErzJHmapvTVTQUxRP9rLPBQ1fKk7E9YE8LldDkdNsgTl+0LL
         Y/QnXBMcQEiXyS+FHgv5m/6STLbXSVQMQH5JBVoFMk069IuQyK+bTjYExSRmvy4lAatt
         1Hug==
X-Gm-Message-State: APjAAAUQgZ8KuCOC695q0mq8Iv74bCtSSv/pszhetUyuFSDI4D0N3iRe
        KlymBCIEC7RJ9M+1HXq/A+8k1DwZVBhlac4+z3s0Z+Y+gg98fZcMDPeD6OYRLegavyrR9qqKImw
        Z6k4TiizEfbd/NlvojY+s
X-Received: by 2002:a17:90a:fb53:: with SMTP id iq19mr20314623pjb.138.1575057584293;
        Fri, 29 Nov 2019 11:59:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4gnI9c2bYrtjkLwMhPYvWHvZw+YasEX6lAkryf7HpqeVi2n8s5GR/Ai2re8lnbcSS3E4aLw==
X-Received: by 2002:a17:90a:fb53:: with SMTP id iq19mr20314608pjb.138.1575057584113;
        Fri, 29 Nov 2019 11:59:44 -0800 (PST)
Received: from localhost ([122.177.85.74])
        by smtp.gmail.com with ESMTPSA id 67sm15725427pfw.82.2019.11.29.11.59.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Nov 2019 11:59:43 -0800 (PST)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     bhsharma@redhat.com, bhupesh.linux@gmail.com, x86@kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [RESEND PATCH v5 3/5] Documentation/arm64: Fix a simple typo in memory.rst
Date:   Sat, 30 Nov 2019 01:29:17 +0530
Message-Id: <1575057559-25496-4-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: D6Cx4IfxNTaad9ReuV8AIg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a simple typo in arm64/memory.rst

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Bhupesh Sharma <bhsharma@redhat.com>
---
 Documentation/arm64/memory.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm64/memory.rst b/Documentation/arm64/memory.rs=
t
index 02e02175e6f5..cf03b3290800 100644
--- a/Documentation/arm64/memory.rst
+++ b/Documentation/arm64/memory.rst
@@ -129,7 +129,7 @@ this logic.
=20
 As a single binary will need to support both 48-bit and 52-bit VA
 spaces, the VMEMMAP must be sized large enough for 52-bit VAs and
-also must be sized large enought to accommodate a fixed PAGE_OFFSET.
+also must be sized large enough to accommodate a fixed PAGE_OFFSET.
=20
 Most code in the kernel should not need to consider the VA_BITS, for
 code that does need to know the VA size the variables are
--=20
2.7.4

