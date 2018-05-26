Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 889597DF8B
	for <lwn-linux-doc@archive.lwn.net>; Sat, 26 May 2018 20:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1032368AbeEZUfc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 26 May 2018 16:35:32 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:55374 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032384AbeEZUfO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 May 2018 16:35:14 -0400
Received: by mail-wm0-f68.google.com with SMTP id a8-v6so22492136wmg.5;
        Sat, 26 May 2018 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u+nmI5JVCutomPz51oiFdBGXVv5QK4IBYMckdT51x4Y=;
        b=CpG929QS4OmY19c1zQOnnSngnsNqSLk3Wl1aWu5fv3dq3XrVXo7Ki92835EesHk/KZ
         25KA8sajl2LwHgBHYnq0weHB03dMuhKBw5eI1us4c2bGnec46HLft7eAi+V9lpU5fDwM
         7kDHCasxdrexkOCLXQ+dUfU2RCFgQQxLFh60tbWfTOpOuSlmSlCavw59ibHlZFRPXIwn
         kq7S3CQwrL/2u941gFG6GkTJ//zAr9WnAibb/Vf0qpd9z1z7IfPg6IT50vofhp50V6fi
         hnUw19M+mFuhuGu2aVzSvLpaI8Nkt+/60roAYgmsgMISekc3hm0UcQ8c6q/TGfOesrj0
         /hMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u+nmI5JVCutomPz51oiFdBGXVv5QK4IBYMckdT51x4Y=;
        b=c1eYqwmxYVV4v64cwT7P/gip3bhFFZuZc5mvYqRPlzMFmCpZbVf2rNkhxdVZcChSzc
         PYvZ9csAt4zKDqesWicHyzX9adElMkEPegz2T9ogCIjF/vWZukHXa3GgYjZITSQOOgzz
         yDBtX/gxQhVCG7lp6/gfBzKhS0RGJy+92WLupD2diVgcRO0yCvXnHJjMI6F30Jsee2ta
         NrMihrA06yA96MXrfgoUy8ol2KewcDlgalbGOBjGvrf7MbyKEynHvmj6cR0Z4WsUBWhn
         s8D14XqKrtJw9r/ipb2XTxJPaZF4fGBj8OemimWVWwND0K9KbVkDx0SHzxCs0PzSBvjQ
         uUAw==
X-Gm-Message-State: ALKqPwfp26R6HBJy1gaSpZVbgVpDPTJOSZvUr9FtNZtFmOHnZlFEC/mp
        6b477kPy49CjFnQT27QM2xA=
X-Google-Smtp-Source: ADUXVKJx80on9TZGZh5XpXDHI7k9yWMuU5ptKwzSxfevbeDUpOQeE4FaSDbCuZ1/iWIBCHK1XzXFng==
X-Received: by 2002:a2e:56cb:: with SMTP id k72-v6mr4737726lje.140.1527366912592;
        Sat, 26 May 2018 13:35:12 -0700 (PDT)
Received: from localhost.localdomain (c-2ec2c701-74736162.cust.telenor.se. [46.194.199.1])
        by smtp.gmail.com with ESMTPSA id d7-v6sm4953381ljc.45.2018.05.26.13.35.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 May 2018 13:35:11 -0700 (PDT)
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>, davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 3/3] MAINTAINERS: add USB CCID Gadget Device
Date:   Sat, 26 May 2018 22:34:01 +0200
Message-Id: <20180526203401.16586-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180526203401.16586-1-marcus.folkesson@gmail.com>
References: <20180526203401.16586-1-marcus.folkesson@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add MAINTAINERS entry for USB CCID Gadget Device

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 078fd80f664f..e77c3d2bec89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14541,6 +14541,14 @@ L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/usb/storage/uas.c
 
+USB CCID GADGET
+M:	Marcus Folkesson <marcus.folkesson@gmail.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/gadget/function/f_ccid.*
+F:	include/uapi/linux/usb/ccid.h
+F:	Documentation/usb/gadget_ccid.rst
+
 USB CDC ETHERNET DRIVER
 M:	Oliver Neukum <oliver@neukum.org>
 L:	linux-usb@vger.kernel.org
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
