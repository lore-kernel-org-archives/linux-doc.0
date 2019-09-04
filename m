Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EED2D7D981
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Sep 2019 21:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbfIDVLf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Sep 2019 17:11:35 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:48048 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730795AbfIDVLf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Sep 2019 17:11:35 -0400
Received: by mail-qt1-f201.google.com with SMTP id v16so85286qtp.14
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2019 14:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=fqo1KOf+cOCC74wEKfOYxznTOIvWMgdfyPycEAYi4u0=;
        b=PeL1qXyMOH//w9FqqtXrPr0U/fbDTH8pM+CFv9qRRvE17R9i8phJPFcYx2wFFxFpmT
         L2cbFIIwQDA9YrgppFjttAjSOEOmhICQmJvE4W6EA7QqG0nO9pkamwBxhvOuK90B+pr0
         4iDR4xDi7PX1bC/hzHDEQeyS+3t4BvNnwAM8YxVQVoaYJ9c2UdwvJ6Vb1kf74DBQXsmC
         hHFEqPWNoPKLNtORfG0uAOqBI2Xdt8R4U2cEXo7CX2dmMTLq5Qq5yUNvCK5W/zmE6OS8
         rHPGwU/JAiWewE7cAyguYpreK9lmidgwwFxNgnYattgdi5WJE2fSoA6hFE8RX40f47XT
         5VtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=fqo1KOf+cOCC74wEKfOYxznTOIvWMgdfyPycEAYi4u0=;
        b=OYFffafQnW5rujn+tBuIWqV9o1lye+wO50t4EuyOrskqG1HTlcWWFiqim1d3zSEfzR
         dJxYaf63KbwZ2hu7siQbvfDQZSHMSMQGOWduInJ8xqlVQaoDibn9wY6Vca/TjN8T9fW1
         lJ0d5J6M525bDF9jYKsaOMx70+FHFBFqp97jeX3GBdzgd/+cdJdDKyuq7eCPb5VLEkMV
         Ps/DigbGWjXzIYbpcr1IPJE9zVmxJmK96iFCAIhyWBlJ2HlQaRa+g/qED2kmxXFRcEJb
         1qvaHLiTktqBds1h6zOpLYSH0LnP6Ss0TcLYUah2msdjrwKnAFziKpJS0gOt892nmgaI
         ZdgQ==
X-Gm-Message-State: APjAAAVxci3RuFHMvps7A3xGB4VyWplrkb0H4OX6ffqrucGAtDxzEvPH
        Vb6P67srF5X5zhfoHxCvhbMY14zbIcCPh3o=
X-Google-Smtp-Source: APXvYqxLEwDRwPCj/iR1Fw4FryEYrIIw49FmN69S5sYNfxhbYpfvQtinGUDL7+sP4kfmz2sV10P7WzBguuQ7Uu0=
X-Received: by 2002:a0c:8402:: with SMTP id l2mr12315654qva.201.1567631494059;
 Wed, 04 Sep 2019 14:11:34 -0700 (PDT)
Date:   Wed,  4 Sep 2019 14:11:20 -0700
In-Reply-To: <20190904211126.47518-1-saravanak@google.com>
Message-Id: <20190904211126.47518-2-saravanak@google.com>
Mime-Version: 1.0
References: <20190904211126.47518-1-saravanak@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v11 1/6] driver core: Add fwnode_to_dev() to look up device
 from fwnode
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com,
        David Collins <collinsd@codeaurora.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It's often useful to look up a device that corresponds to a fwnode. So
add an API to do that irrespective of the bus on which the device has
been added to.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c    | 7 +++++++
 include/linux/fwnode.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 2db62d98e395..510fabf8918c 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2198,6 +2198,10 @@ int device_add(struct device *dev)
 					     BUS_NOTIFY_ADD_DEVICE, dev);
 
 	kobject_uevent(&dev->kobj, KOBJ_ADD);
+
+	if (dev->fwnode && !dev->fwnode->dev)
+		dev->fwnode->dev = dev;
+
 	bus_probe_device(dev);
 	if (parent)
 		klist_add_tail(&dev->p->knode_parent,
@@ -2342,6 +2346,9 @@ void device_del(struct device *dev)
 	kill_device(dev);
 	device_unlock(dev);
 
+	if (dev->fwnode && dev->fwnode->dev == dev)
+		dev->fwnode->dev = NULL;
+
 	/* Notify clients of device removal.  This call must come
 	 * before dpm_sysfs_remove().
 	 */
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index ababd6bc82f3..d8c6d231d577 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -17,6 +17,7 @@ struct device;
 struct fwnode_handle {
 	struct fwnode_handle *secondary;
 	const struct fwnode_operations *ops;
+	struct device *dev;
 };
 
 /**
@@ -123,5 +124,6 @@ struct fwnode_operations {
 		if (fwnode_has_op(fwnode, op))				\
 			(fwnode)->ops->op(fwnode, ## __VA_ARGS__);	\
 	} while (false)
+#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
 
 #endif
-- 
2.23.0.187.g17f5b7556c-goog

