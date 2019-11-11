Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6539F7D917
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Nov 2019 08:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfKKIE7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Nov 2019 03:04:59 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35133 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726770AbfKKIE7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Nov 2019 03:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573459498;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2FRKI5+6EDUKwn2QzAstv2u6dW0Q8/ilQLcz5atGxuE=;
        b=YzL85NUQPYbV3CULNH5NR1+PPEfYPyWQXAfwXEWi7yJ4neLhUp3MBpFGLWQvSwW1Yt7B9g
        VUy7ympG6dTWDPJTp6P+yrE+12NDnAw8y0nE9FtTv8nVJo6GIkgpFsCJrb4wcJVidE2Cth
        hrAOj52Q7eHBahdg26Njs7XtWVGjEAU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-GHyGpE8zNBqqPYSmgk-hbg-1; Mon, 11 Nov 2019 03:04:57 -0500
Received: by mail-pl1-f198.google.com with SMTP id x11so10096981plr.23
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2019 00:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BgAr5VVOQXh1yien5qVgdgmIL5RHbScoYGF2ala0/ak=;
        b=dkJIIqhKc2DCwKJeswdOA8J8ZCub4VTWOOhwSD2ZkOaiHdoQIntdk3roYsJPBzDUyh
         UTb2evGrZPD2LiEWRWRsTTN1dSvkek/JM1M/xgIhJAz+mvT+junZrHr34oYs9K4NrQgF
         hu4dpCIk8RY8FZe76BclybDLjNsjV0lSCn2kRbtgFjcpVg+ebLpPAgQL1oPgJQTPoFTM
         GEtjNlSexwbY3j5Z1KEgX3L4UhK7BZKSBpAc6sM4mblzDElFDyp7YcWZf2X6KXZLyQgO
         ToPWrMcYbLXiQbPmxOYf5iGIfmwYy2KNXC3Gaxvst7SZsJkhJMCZ+6u5BOnMxW0jZSFl
         4cFg==
X-Gm-Message-State: APjAAAU5kIvzN7pJiwCAmO3AktJIkB5Ix6SyoE40fkdWLS2RTp8u6Z0b
        TphueZcJifrlAxGnFGGFQbcEXKOmJhL3Vj8X8SA7mEIWSlKu7i7+zypoq3IlFgu/gJkyHukEwe9
        S3SdCQIq3dgOEfpWDmeCF
X-Received: by 2002:a63:cc17:: with SMTP id x23mr27009237pgf.446.1573459496120;
        Mon, 11 Nov 2019 00:04:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJWpQcBQvquc5dbnGBM6G4yNAtHiqFdXD409t0Q0+sK5yPSXKJEhVQvzS4/XbjlsLJyg9EHQ==
X-Received: by 2002:a63:cc17:: with SMTP id x23mr27009207pgf.446.1573459495818;
        Mon, 11 Nov 2019 00:04:55 -0800 (PST)
Received: from localhost ([122.177.0.15])
        by smtp.gmail.com with ESMTPSA id m123sm15397699pfb.133.2019.11.11.00.04.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 00:04:54 -0800 (PST)
From:   Bhupesh Sharma <bhsharma@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     bhsharma@redhat.com, bhupesh.linux@gmail.com,
        Jonathan Corbet <corbet@lwn.net>,
        James Morse <james.morse@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>,
        Steve Capper <steve.capper@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] Documentation/arm64: Fix a simple typo in memory.rst
Date:   Mon, 11 Nov 2019 13:34:45 +0530
Message-Id: <1573459485-27219-2-git-send-email-bhsharma@redhat.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573459485-27219-1-git-send-email-bhsharma@redhat.com>
References: <1573459485-27219-1-git-send-email-bhsharma@redhat.com>
X-MC-Unique: GHyGpE8zNBqqPYSmgk-hbg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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

