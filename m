Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 66B927DD32
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 14:54:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751551AbeCTOya (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 10:54:30 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:37879 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbeCTOy0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 10:54:26 -0400
Received: by mail-it0-f67.google.com with SMTP id k79-v6so2762267ita.2;
        Tue, 20 Mar 2018 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=S9XMqV7gTzQ0h/DAk27qrsW8KiJmEJsOupXHZvkjZ8g=;
        b=YP91/A8sbvADPHl8jVdc+v02Yr+hHfg411kBeFrcdVIZTcZfmWikdEDAS0dCrqH5bx
         QAc3JkUcqGlnE5Sr4MLBcVYdFdCiwuVU/viqNNm0u/cgSUmzyenvvfjPzaM7vZTyn73r
         W8tQyHdV2oAtoclMZ607h7N2SreMkcuG2LFU7KuzXXslwVtBKtEk34DKHR7H9jISz+Le
         hKRdO3diT0F/RCpC5MDkfMn62igJLwT5/xqNWNYa1oC0vXmMHuf1uUCHzTywoFzXzEyy
         58qzu+03vymhDpD3m9oEaQHf28yqxnx3JB+6aUxvdzs1WIQC2gpsSpEb+qhyRdCf9EW4
         t8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S9XMqV7gTzQ0h/DAk27qrsW8KiJmEJsOupXHZvkjZ8g=;
        b=P5Zla9D+K7jjHEZxeKMTSbhfjDarW7vI8bbRQMiIQyD1T5xRii45ew1r3BPivvjH7Z
         su5XYu8uQBGRK1P1HJmd8NWh4PglI+JOugIvlp8pXQlV8cpJ5rdRpcsLAGgbh8Xfze/7
         Arl1BhTgybK9Yq8UTjwuDENvOwxtyPGjA7i5CaWekM1w35dZ08iNPiTUm53lig9N7FZr
         WOYq4IbsWNNqo49TE1HaQ4fa81Hfzd+3rNJHKT3wcA1x1cLymGe7EtBhjrtF6anijJ4m
         Ba2TtXbAUAgpBJK4dz4iIVY/HRDB8HhFbdnWjKP1QzVf/ck6aynhyqABjJl76S4DxTMN
         h1iA==
X-Gm-Message-State: AElRT7G5OdhKMp0l8Zd3Jn0gwS79Ywo33VH5GI5RR4QPm7s1BfeiZfmw
        1wB9SDNTdagW2f0fgwMheAQ=
X-Google-Smtp-Source: AG47ELvU6QRsjvJ/+PDSD7BcpjVoYeBVnTkBd5Yt+qja4PmLt4qRI56uoF8fCbKMbZ2HIDqIC8GIxA==
X-Received: by 2002:a24:d504:: with SMTP id a4-v6mr3100470itg.107.1521557665611;
        Tue, 20 Mar 2018 07:54:25 -0700 (PDT)
Received: from localhost ([104.39.53.110])
        by smtp.gmail.com with ESMTPSA id 22-v6sm1389072itj.16.2018.03.20.07.54.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Mar 2018 07:54:24 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     corbet@lwn.net, yamada.masahiro@socionext.com, slyfox@gentoo.org,
        tony.luck@intel.com, bjorn.forsman@gmail.com,
        mudongliangabcd@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] modify one dead link
Date:   Tue, 20 Mar 2018 10:54:22 -0400
Message-Id: <20180320145422.24331-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.16.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 Documentation/ia64/xen.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ia64/xen.txt b/Documentation/ia64/xen.txt
index a12c74ce2773..aea4bb94aa59 100644
--- a/Documentation/ia64/xen.txt
+++ b/Documentation/ia64/xen.txt
@@ -26,7 +26,7 @@ Getting and Building Xen and Dom0
     DomainU OS  : RHEL5
 
  1. Download source
-    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable.hg
+    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable
     # cd xen-unstable.hg
     # hg clone http://xenbits.xensource.com/ext/ia64/linux-2.6.18-xen.hg
 
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
