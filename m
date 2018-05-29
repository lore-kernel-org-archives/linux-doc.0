Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD8597DF8B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 18:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966171AbeE2Suy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 14:50:54 -0400
Received: from mail-lf0-f65.google.com ([209.85.215.65]:40556 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966058AbeE2Suq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 14:50:46 -0400
Received: by mail-lf0-f65.google.com with SMTP id q11-v6so347563lfc.7;
        Tue, 29 May 2018 11:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rr5lBUide6LuhtoQwUnJcPWKnREEvDM3+fpQ/ZzS7jc=;
        b=RIGwDIit/WuPR9u0quSc79szF6NkcYV9LtajQrEF2samoBgTyrJwERydAEnTjNV30B
         IQafHDe3Q7a56wJ9qLbWAgGGqrpwxmyXIaf3KSmYfS+yRv1ju3zq4K4lHxEpBCoM3vvX
         8TCkuzJQdGawO60bZzSNxRK6bqvJROm47x2qhsy3UX4QJfiaZiKHRWGsYe7SDlLRfT1g
         DsuKwDi9ZcqpTte6k5kWA7U+jcmFPzKNMWZd+9ZoxGXM6Y/QHPs8O5hiMI3n9rfcFJNg
         +MoJXlzEMfMr8uA6tP5H6OwQYsz3M87xwP3vM45WzGndGu8XhnPaKRdPpi/7WSRctPMk
         gKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rr5lBUide6LuhtoQwUnJcPWKnREEvDM3+fpQ/ZzS7jc=;
        b=bwSqUMMWmK+bsC4pHxWW5aEQ6GiDXd8KgC+2itHEw5aVz7p9/N1LVvx9TDJsUCdzCe
         MgQAE/9irN30o7jDN5NC/HbaNfzBQ4gxKzVgkoojIPN1b59N0xVOWSf41tHY5OOxgE66
         xzIAWiFCcIM3CckeR3rU7uFLiq2EAuhPs9bi+kHo+Ai7GPeQkMXgZCOB2JaIivIWhauT
         ACKkyifog8xIsfS4aEpziiuVei30xiQj6ggmSX8ujOIzDZ9x4zYdxdvY6D8mJOEqrxeW
         eyX+nWbqx+WIscKw3ma3sULa//uDzePvbwAG9tT+9GSD8b/prDhsklW1Iyucm987rNPG
         8TzQ==
X-Gm-Message-State: ALKqPwfLP+32+3MFnyz39NzqYXpTdvDzvc5e1vivdAJvotXdE4x0anUr
        eiW3Zfs+kVEVxlM+1KNEYao=
X-Google-Smtp-Source: AB8JxZoGXOpccjglz156adc+h0HamElAReE5+qxmSb41T57ZLiyUGy+DJvNhfbcq6WrPFuLxGYT+pQ==
X-Received: by 2002:a2e:6e10:: with SMTP id j16-v6mr11942817ljc.61.1527619845306;
        Tue, 29 May 2018 11:50:45 -0700 (PDT)
Received: from localhost.localdomain (c-2ec2d783-74736162.cust.telenor.se. [46.194.215.131])
        by smtp.gmail.com with ESMTPSA id i29-v6sm7488306lfb.89.2018.05.29.11.50.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 May 2018 11:50:44 -0700 (PDT)
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
Subject: [PATCH v3 3/3] MAINTAINERS: add USB CCID Gadget Device
Date:   Tue, 29 May 2018 20:50:21 +0200
Message-Id: <20180529185021.13738-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180529185021.13738-1-marcus.folkesson@gmail.com>
References: <20180529185021.13738-1-marcus.folkesson@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add MAINTAINERS entry for USB CCID Gadget Device

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v3:
    	- No changes
    v2:
    	- No changes

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
