Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 799D37D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 20:47:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfBGUrG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 15:47:06 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33671 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfBGUrF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Feb 2019 15:47:05 -0500
Received: by mail-wm1-f68.google.com with SMTP id h22so5266567wmb.0;
        Thu, 07 Feb 2019 12:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=kxMUWUSSEJzEo3fq5gCt2EQxQAklB+Gkyf8IA+NJrtk=;
        b=f/k3NCq3z+jbF4N5fzwV5/FtzRllhFv4gcmrQnkNG4e8HN1t8cSjUcLwBOSbz9w8to
         oDiLn4ufOsi1A5PElBbfAU/vpBFJeWZwUzoUegU0lgqPwuV736pt5ZM8ZrLkWZV63aua
         qD5SwTgU1nqI54UT5IncfaGIO88nVRLDxDdl5Xg1VhwfglG+VQ/+XU6hc2fPFJbLQBG/
         LC/IHhu6hSt0LalJpATAQePH70VEO4fyA3UEhazsYgI7cFhPiT8NMNWIbfzdDzGeWzZJ
         VCzY0msdRv37fIk9O2nZEXS8NJrDf4UT7y0wJ/xj9/hXuZGzxpEGfgaKadYe03CKKiC5
         PGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=kxMUWUSSEJzEo3fq5gCt2EQxQAklB+Gkyf8IA+NJrtk=;
        b=oIbtadRGhhkRkAZUJDm2E2LKW98eBiqOytuh0ejZlrwe8F6AcbWOBtL93oF7LSVTcK
         WHo1YzPfcVMf1kJrTuPuIZqoYLynj5pHVneTf6y8wDBlf4LsNbIZdKF75KpZUpxqu9Hf
         7bSLqoNRlt8xzqabk8L1jxyB+dYo1lBCr6mjrrgAwM16M7sx011v7FSRf111NH3UZOri
         8nfqmeOYTJ7+v+7PRcX+3T9YWvNYx90aGGUJJWvluBXU9h9zsq4+h63ihLvueT8oyMqb
         fLvzuB4H7MV0EcXXBJR8ESKQzjNC4qN6ybKgbC3OFti/eF6M10XIP2y1SQKHw4N8P6gs
         dBKg==
X-Gm-Message-State: AHQUAubiWlbWoFJxqRBKdGVU0tpCzzC4HCbvC7YiWv/t9Sx6uCLIf140
        aQhQib03OUVhXu4jOwb8gDMvnYhXZ/M=
X-Google-Smtp-Source: AHgI3IacXpa8/QRaBxc6yjOsDs3eHrxj7Cfm6u2WLFDQ/oOUa+8+8GqqYpemuOK9giFLLtJKVVpuZA==
X-Received: by 2002:a1c:a104:: with SMTP id k4mr8640657wme.54.1549572423624;
        Thu, 07 Feb 2019 12:47:03 -0800 (PST)
Received: from [192.168.1.200] (host31-48-208-136.range31-48.btcentralplus.com. [31.48.208.136])
        by smtp.gmail.com with ESMTPSA id z3sm266198wmi.32.2019.02.07.12.47.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Feb 2019 12:47:03 -0800 (PST)
To:     linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org
From:   Richard Fearn <richardfearn@gmail.com>
Subject: [PATCH] fbcon: add new font TER16x32 to boot options documentation
Message-ID: <990625e7-a0b1-81f9-3371-808159c31df9@gmail.com>
Date:   Thu, 7 Feb 2019 20:47:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: sv-FI
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

TER16x32 was added in ac8b6f148fc9.

Compare the list in fbcon.txt with the output of:

   $ fgrep -h .name lib/fonts/*.c | sort

Signed-off-by: Richard Fearn <richardfearn@gmail.com>
---
  Documentation/fb/fbcon.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/fb/fbcon.txt b/Documentation/fb/fbcon.txt
index 60a5ec04e8f0..97bf1d19dec2 100644
--- a/Documentation/fb/fbcon.txt
+++ b/Documentation/fb/fbcon.txt
@@ -78,8 +78,8 @@ C. Boot options
  1. fbcon=font:<name>

          Select the initial font to use. The value 'name' can be any of the
-        compiled-in fonts: 10x18, 6x10, 7x14, Acorn8x8, MINI4x6,
-        PEARL8x8, ProFont6x11, SUN12x22, SUN8x16, VGA8x16, VGA8x8.
+        compiled-in fonts: 10x18, 6x10, 7x14, Acorn8x8, MINI4x6, PEARL8x8,
+        ProFont6x11, SUN12x22, SUN8x16, TER16x32, VGA8x16, VGA8x8.

  	Note, not all drivers can handle font with widths not divisible by 8,
          such as vga16fb.
-- 
2.19.1
