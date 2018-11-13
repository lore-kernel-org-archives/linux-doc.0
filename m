Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D3D9B7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 02:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbeKML7e (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 06:59:34 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38302 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730379AbeKML7e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 06:59:34 -0500
Received: by mail-pg1-f193.google.com with SMTP id f8-v6so4906506pgq.5
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 18:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=subject:date:message-id:in-reply-to:references:cc:from:to;
        bh=NUwhYXSJlOLk4MgqEvu2/18kJmm1v5aePUdHVkXphZY=;
        b=C4qmaTA3oAHjZRvcymkthP9RKZi0HUpubM/34AurR79c6Oo9E+sZI7nrlW3eZjwKTg
         qYnHiHtcZ/Qhn6T4LjcpAJBkrK/kKfZIF5ZNVRZzFvJj6i287V4UJhrI6SZXsofpXxLC
         4qlCoHmNcdRSjDFqsmWgi1ATJQBoqylYTDP+5G1lYC1LOqvPvlkxA4fhthLM7osfVJQg
         PtpTja3/B67xIg3UJUGv7INSApBE3Z0+ADyvIkYbM0pXIJpYE83XRcoEsDo9X0jc/sGE
         Xu8jSLN/Sldc+YWfB1VMUiFDdhcCbmUPmVIh+VsOVt4qs5lRBZwri9j/oV8n1Hq57jtl
         z6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :cc:from:to;
        bh=NUwhYXSJlOLk4MgqEvu2/18kJmm1v5aePUdHVkXphZY=;
        b=unSIVKztuP3FuIMNm/lwYfnhVwxtPxy5qfT/ga1+FHcLBJL8Y+63kcjKzTZIOBVE3B
         v0jrV+avNldG8oJp95MDFhZ5j212cDX1GWLAl+EJysK928VPOMPesOMPNUL/8IQY2mvL
         gNPdfCivgjUiDb+Q4SX+RfHG2RV08r1pVDGAGFs1DqQAsbs5S4oh65GqksGKCoJ865dC
         IZ3uu1bAqG/GFePbFDFGxpmU9zQWZylnWS0F5EaisdDZOKFGWNtFLX2+vb39bygIFImA
         7s22PYUvp/BPtCiT/Ggw50Kud6gTZDMGyBk5TBPYQjqwCI5wZT7OT41yQ3Nb0idV/xn4
         o1VA==
X-Gm-Message-State: AGRZ1gL/Qe3ULQsgIvypu4xoGE5aqAg/vCvimxUrwNcYQ+VprXYIxiua
        hd8x2I2WYa3uk82THViOas4s/g==
X-Google-Smtp-Source: AJdET5dyv9OG35uZqV0PsX2J7Sakl0QOMWxpv9ayxV0HozTuG5WYHxf795aoMsccEk0v0MBvGE2aNA==
X-Received: by 2002:a63:9402:: with SMTP id m2mr2890710pge.93.1542074622218;
        Mon, 12 Nov 2018 18:03:42 -0800 (PST)
Received: from localhost ([216.9.110.13])
        by smtp.gmail.com with ESMTPSA id v12-v6sm22272715pfa.167.2018.11.12.18.03.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 18:03:41 -0800 (PST)
Subject: [PATCH 3/7] doc: Indicate that powerpc supports stackprotector
Date:   Mon, 12 Nov 2018 18:01:09 -0800
Message-Id: <20181113020113.29640-4-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
Cc:     corbet@lwn.net, Palmer Dabbelt <palmer@sifive.com>,
        aou@eecs.berkeley.edu, ren_guo@c-sky.com,
        andrea.parri@amarulasolutions.com, Arnd Bergmann <arnd@arndb.de>,
        jhogan@kernel.org, dhowells@redhat.com, jcmvbkbc@gmail.com,
        keescook@chromium.org, yamada.masahiro@socionext.com,
        mathieu.desnoyers@efficios.com, mingo@kernel.org,
        rmk+kernel@armlinux.org.uk, Will Deacon <will.deacon@arm.com>,
        jglisse@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        david.abdurachmanov@gmail.com
From:   Palmer Dabbelt <palmer@sifive.com>
To:     linux-kernel@vger.kernel.org
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This was suggested by features-refresh.sh

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/features/debug/stackprotector/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/debug/stackprotector/arch-support.txt b/Documentation/features/debug/stackprotector/arch-support.txt
index 9999ea521f3e..32bbdfc64c32 100644
--- a/Documentation/features/debug/stackprotector/arch-support.txt
+++ b/Documentation/features/debug/stackprotector/arch-support.txt
@@ -22,7 +22,7 @@
     |       nios2: | TODO |
     |    openrisc: | TODO |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: |  ok  |
-- 
2.18.1

