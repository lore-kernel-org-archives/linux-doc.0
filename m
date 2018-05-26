Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5732C7DF8B
	for <lwn-linux-doc@archive.lwn.net>; Sat, 26 May 2018 21:20:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1032491AbeEZVUN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 26 May 2018 17:20:13 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:37032 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032377AbeEZVUC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 May 2018 17:20:02 -0400
Received: by mail-wm0-f65.google.com with SMTP id l1-v6so22960105wmb.2;
        Sat, 26 May 2018 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u+nmI5JVCutomPz51oiFdBGXVv5QK4IBYMckdT51x4Y=;
        b=ukWSkr7dVUaIftxoTarSCB+yPYModo8Gpq7lV689z3RaG08s9lKWUIL6JKbiUX685I
         1d4/rp0jWjIitGbU3XiYeRsWt2obO0/Y0wVeaOJTzcClkzuRc7QdJCpKxW64G1Iw9/tX
         uKS6eYgRTg0JPfKa1sO2g0Jg0QGmcPs+7Q/17Bv+OKuRJuOhuk8Vgo077YVB6UFue8E0
         piUwUlwhEZELyZFMfbN+Jm0S5dXIvuH5cne/Uwmw3BVQgzvdobomQz4GlQVETlElpAya
         sXHvgfcVeGBRIDJazMn42PRIxJ20E7hQbwi4QirLGP876ywKbZdCWra5exK2IKMv4QxZ
         3l1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u+nmI5JVCutomPz51oiFdBGXVv5QK4IBYMckdT51x4Y=;
        b=kAobFdnFy+ZX0Ms7X8Ze7CXtox7O2GIvvwawpfK9R1H/rHz9kzVcWRMSM91NSq/rrg
         QSppSJq48NASO2+6hUokhzVkP80quTZ8NY1zhylYdBR3+C7anvm+djmJ0Q9I8/PQZG1m
         1Ux9hQDlFEmi8AnBj8vPkUEygzj7Lr6fcK0I8aIFoMwnIXVXERxjlJLraMRzFmSTzjMy
         Af6EuQb+Iay+zdic1sk53lJ/FdYphQl6C1jLlkD7W/RML1Y+yWtK3frdAcxIfDNNELte
         SQWPk9NI6kwO07h1g8edBJwS9Loo6MCoYpPx8MsmQWGTqCcsruic887q4grzN6tJUOZH
         735w==
X-Gm-Message-State: ALKqPwd41xJfX05XNR3HelN9iF+Guo9IZRUDHIuVtClYbeBOZ6E5EgIy
        xeZUtxTdZS+ijR+AWHPx22U=
X-Google-Smtp-Source: ADUXVKKnj68AMD4gioHP1DQ3SQvRqyIWy3qtS4zr7nx+jNOSQ4J+FrkXkZiNR8MFjwxF/7Z6iuDfpQ==
X-Received: by 2002:a2e:9a06:: with SMTP id o6-v6mr352672lji.17.1527369600546;
        Sat, 26 May 2018 14:20:00 -0700 (PDT)
Received: from localhost.localdomain (c-2ec2c701-74736162.cust.telenor.se. [46.194.199.1])
        by smtp.gmail.com with ESMTPSA id d8-v6sm2397243lfe.95.2018.05.26.14.19.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 26 May 2018 14:19:59 -0700 (PDT)
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
Subject: [PATCH v2 3/3] MAINTAINERS: add USB CCID Gadget Device
Date:   Sat, 26 May 2018 23:19:40 +0200
Message-Id: <20180526211940.25474-3-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180526211940.25474-1-marcus.folkesson@gmail.com>
References: <20180526211940.25474-1-marcus.folkesson@gmail.com>
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
