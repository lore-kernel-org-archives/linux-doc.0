Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2E9497DE71
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 10:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727428AbeHUOEe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 10:04:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34220 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727367AbeHUOEd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 21 Aug 2018 10:04:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CC6F240216FA;
        Tue, 21 Aug 2018 10:44:53 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-96.ams2.redhat.com [10.36.117.96])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0B41E7D4C9;
        Tue, 21 Aug 2018 10:44:51 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-mm@kvack.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
        xen-devel@lists.xenproject.org, devel@linuxdriverproject.org,
        David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH RFCv2 6/6] memory-hotplug.txt: Add some details about locking internals
Date:   Tue, 21 Aug 2018 12:44:18 +0200
Message-Id: <20180821104418.12710-7-david@redhat.com>
In-Reply-To: <20180821104418.12710-1-david@redhat.com>
References: <20180821104418.12710-1-david@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 21 Aug 2018 10:44:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 21 Aug 2018 10:44:53 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Let's document the magic a bit, especially why device_hotplug_lock is
required when adding/removing memory and how it all play together with
requests to online/offline memory from user space.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/memory-hotplug.txt | 39 +++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/memory-hotplug.txt b/Documentation/memory-hotplug.txt
index 7f49ebf3ddb2..03aaad7d7373 100644
--- a/Documentation/memory-hotplug.txt
+++ b/Documentation/memory-hotplug.txt
@@ -3,7 +3,7 @@ Memory Hotplug
 ==============
 
 :Created:							Jul 28 2007
-:Updated: Add description of notifier of memory hotplug:	Oct 11 2007
+:Updated: Add some details about locking internals:		Aug 20 2018
 
 This document is about memory hotplug including how-to-use and current status.
 Because Memory Hotplug is still under development, contents of this text will
@@ -495,6 +495,43 @@ further processing of the notification queue.
 
 NOTIFY_STOP stops further processing of the notification queue.
 
+
+Locking Internals
+=================
+
+When adding/removing memory that uses memory block devices (i.e. ordinary RAM),
+the device_hotplug_lock should be held to:
+
+- synchronize against online/offline requests (e.g. via sysfs). This way, memory
+  block devices can only be accessed (.online/.state attributes) by user
+  space once memory has been fully added. And when removing memory, we
+  know nobody is in critical sections.
+- synchronize against CPU hotplug and similar (e.g. relevant for ACPI and PPC)
+
+Especially, there is a possible lock inversion that is avoided using
+device_hotplug_lock when adding memory and user space tries to online that
+memory faster than expected:
+
+- device_online() will first take the device_lock(), followed by
+  mem_hotplug_lock
+- add_memory_resource() will first take the mem_hotplug_lock, followed by
+  the device_lock() (while creating the devices, during bus_add_device()).
+
+As the device is visible to user space before taking the device_lock(), this
+can result in a lock inversion.
+
+onlining/offlining of memory should be done via device_online()/
+device_offline() - to make sure it is properly synchronized to actions
+via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online_type)
+
+When adding/removing/onlining/offlining memory or adding/removing
+heterogeneous/device memory, we should always hold the mem_hotplug_lock to
+serialise memory hotplug (e.g. access to global/zone variables).
+
+In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) allows
+for a quite efficient get_online_mems/put_online_mems implementation.
+
+
 Future Work
 ===========
 
-- 
2.17.1

