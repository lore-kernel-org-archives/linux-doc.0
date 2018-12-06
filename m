Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 878597D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 00:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbeLFA0c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 19:26:32 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39926 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbeLFA0c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 19:26:32 -0500
Received: by mail-pl1-f194.google.com with SMTP id 101so10873234pld.6
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 16:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Q+ykiBMRTkCeImqS+tC78J5Rh8XlO4UH5sOpHLm2riY=;
        b=h9F7wLZFqRiMYuebpBQeZkD1Uzf7nnDxqkjrZvFlpI+6b+WMMRfMoZKck5fbU9xglk
         gEHxKZzutP/r7zojICtrQy5KBT5NHUD+3C9NWjZ/x3eWLRk923PR6xPwOGcI5uzFSU/E
         JRRAehsxzEmoLf8aZRVCCjep2/Rz2Ud6Jx341O8p8+vK05evlGWbArF6zNSWVjkL8hkP
         aeBBImDZn4NodwZVrdAeP16sh41GfR0T8v74GQX5FKEEtFqBoVFNeKkbda4kpnwt50JS
         0Fqw6dKvyHL043v+7xJFlDHAiMR63vhfV/HYkB1S3IobjQJ2xBItjSbUpqkEX5nHqUC2
         6KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Q+ykiBMRTkCeImqS+tC78J5Rh8XlO4UH5sOpHLm2riY=;
        b=iY2BXsXUZM9p7Rx+eNUSJ8XApzT+YMRrtY5ynVyZRCiDD9SagC0bkremeB3mAZEWHX
         lwqNyH4VVvQCPBpe70EQFbwnH3BniHG80e/YX7kGIEgPNS7wEwD4zWO9SUZakk5Zgg5F
         yFb0f6mueNG4EwRAae63+Lb8G4pPlTDPmClLJ5IEyDp2B9rfhqLM02M5gEwZc5/2lVL6
         uo8RxU8QhOsynzwRszBG30Vk4SUlFHXe1UVzxQ3FF0A1mffM9ehnDt9wOOkf2b5dgzUq
         YuRCnKDxMdrOqW4nhCFFgtiDBTo3veUPCmhu+qOtCkwTDpgYWXT0m3rjXgQ0uLa5vo/f
         6klQ==
X-Gm-Message-State: AA+aEWbfCC8zcT+XlBZiX4ZznW0pTF7u0t9sxeu7yzdO/jOm0/bhkPf0
        re2XoL/t3B9YFbV3DFEvWXI=
X-Google-Smtp-Source: AFSGD/XYP1iDJaINowV0OHqBgU+KrIneycWfBQNEdVmXtrovPSboSSw+z6xVLwlxBMDCnyiekjM/3w==
X-Received: by 2002:a17:902:8c91:: with SMTP id t17mr25395582plo.119.1544055991816;
        Wed, 05 Dec 2018 16:26:31 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id z8sm49214584pgz.53.2018.12.05.16.26.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Dec 2018 16:26:31 -0800 (PST)
From:   Wei Yang <richard.weiyang@gmail.com>
To:     rppt@linux.ibm.com, david@redhat.com, mhocko@suse.com,
        osalvador@suse.de
Cc:     akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v2 1/2] admin-guide/memory-hotplug.rst: remove locking internal part from admin-guide
Date:   Thu,  6 Dec 2018 08:26:21 +0800
Message-Id: <20181206002622.30675-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20181205023426.24029-1-richard.weiyang@gmail.com>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Locking Internal section exists in core-api documentation, which is more
suitable for this.

This patch removes the duplication part here.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 40 -------------------------
 1 file changed, 40 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 5c4432c96c4b..241f4ce1e387 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -392,46 +392,6 @@ Need more implementation yet....
  - Notification completion of remove works by OS to firmware.
  - Guard from remove if not yet.
 
-
-Locking Internals
-=================
-
-When adding/removing memory that uses memory block devices (i.e. ordinary RAM),
-the device_hotplug_lock should be held to:
-
-- synchronize against online/offline requests (e.g. via sysfs). This way, memory
-  block devices can only be accessed (.online/.state attributes) by user
-  space once memory has been fully added. And when removing memory, we
-  know nobody is in critical sections.
-- synchronize against CPU hotplug and similar (e.g. relevant for ACPI and PPC)
-
-Especially, there is a possible lock inversion that is avoided using
-device_hotplug_lock when adding memory and user space tries to online that
-memory faster than expected:
-
-- device_online() will first take the device_lock(), followed by
-  mem_hotplug_lock
-- add_memory_resource() will first take the mem_hotplug_lock, followed by
-  the device_lock() (while creating the devices, during bus_add_device()).
-
-As the device is visible to user space before taking the device_lock(), this
-can result in a lock inversion.
-
-onlining/offlining of memory should be done via device_online()/
-device_offline() - to make sure it is properly synchronized to actions
-via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online_type)
-
-When adding/removing/onlining/offlining memory or adding/removing
-heterogeneous/device memory, we should always hold the mem_hotplug_lock in
-write mode to serialise memory hotplug (e.g. access to global/zone
-variables).
-
-In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) in read
-mode allows for a quite efficient get_online_mems/put_online_mems
-implementation, so code accessing memory can protect from that memory
-vanishing.
-
-
 Future Work
 ===========
 
-- 
2.15.1

