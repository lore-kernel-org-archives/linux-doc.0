Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 252487D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 02:04:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730810AbeKML7g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Nov 2018 06:59:36 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38306 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730769AbeKML7g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Nov 2018 06:59:36 -0500
Received: by mail-pg1-f195.google.com with SMTP id f8-v6so4906545pgq.5
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 18:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=subject:date:message-id:in-reply-to:references:cc:from:to;
        bh=JM+S/eFsNskgo7atW/iBIZzDQR4tvlY1/M1nNBefE3A=;
        b=XuGcgN502rs9GsiYN10cXgrgKSex88J3/+pPISvc+m2TdFHfUDOnNFsNs6ZBGtV5qL
         Jj+0p0S1FE8+mMwy0k4BGzRJLNVOOJlEhMSVzRlhWNCaSGK4smyRQnUPoE7TOMT0UnIr
         1AwlGVZfM5qGDJ1jKKrAzTdaNhcvjf4TqrAFg0ScnkT5CjUBihY1i1D4eHc3FCYzjicL
         nGZKQnRH5kLKqz9tOnVTsI7o4QZSHHfSglDhfCzVdRIqPACRLORn1tvhJQlF34l/t+Ag
         c5jb7J0r1BHpXWgZzsrO0iL1cQc/Q4SWgDDdPMGXrnyVBcTLMpPV2aL+Qt+WchCqmG/E
         471w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :cc:from:to;
        bh=JM+S/eFsNskgo7atW/iBIZzDQR4tvlY1/M1nNBefE3A=;
        b=emqDBQG3LQlRBS3gPqr0KvDKCazZ62d6CZ1L2FghCdfiFBDoDuNjpUXE692v7nTVTL
         HhKynEQoRK086tE+k9isOH5ioESa5kt9denZKiW834MqQmRmTfy88RJsOOBYu8+wYszt
         MkLDpDA0alBKI9k3m3G2PEyhI8Keh3KyI+ILdd1au4qNGRFM6VouHO0IDk2V+DsoHE23
         xVqYdjvQfMqEI5h3Q+1RAob7wgc5dp9GLb5so9IzR6UGGYufrQRgqReVxrvW7VhPBalc
         fBiPSFs6apSlb5pg/dk5lcauvIFcfcdTSXShAhNA80tI1x3E6oou4U7hjV46oPDQ1Sxi
         k8yw==
X-Gm-Message-State: AGRZ1gLmh76dO01j60Vz+DTN+w4mfSIon3SOEs78rS/XSC1R9rocTi+o
        V66/l2dlSCYV3MP1BE4sAdibVA==
X-Google-Smtp-Source: AJdET5e5F9BMkGMJpsPyH9pjxG2eOrIWxjz1Z71qqgOUywCdnDfywSML5a9VGIZ5Wm3QckGBAzfIlA==
X-Received: by 2002:a63:31d0:: with SMTP id x199mr2982886pgx.10.1542074624095;
        Mon, 12 Nov 2018 18:03:44 -0800 (PST)
Received: from localhost ([216.9.110.4])
        by smtp.gmail.com with ESMTPSA id d65-v6sm24529216pfc.144.2018.11.12.18.03.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 18:03:43 -0800 (PST)
Subject: [PATCH 4/7] doc: Indicate that xtensa supports sg-chain
Date:   Mon, 12 Nov 2018 18:01:10 -0800
Message-Id: <20181113020113.29640-5-palmer@sifive.com>
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
 Documentation/features/io/sg-chain/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/io/sg-chain/arch-support.txt b/Documentation/features/io/sg-chain/arch-support.txt
index eac96f99174f..3c85efb8bc8d 100644
--- a/Documentation/features/io/sg-chain/arch-support.txt
+++ b/Documentation/features/io/sg-chain/arch-support.txt
@@ -30,5 +30,5 @@
     |          um: | TODO |
     |   unicore32: | TODO |
     |         x86: |  ok  |
-    |      xtensa: | TODO |
+    |      xtensa: |  ok  |
     -----------------------
-- 
2.18.1

