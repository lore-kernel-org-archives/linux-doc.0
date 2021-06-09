Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BABC48BCD
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 07:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDCDC6100A
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 07:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237366AbhFIIAD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 04:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56850 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237334AbhFIIAB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 04:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623225487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E1X6mDwvWEwCM4qkv2vY7/L/oZAtoLR8LCFJEbDinOo=;
        b=B7/fWF+X1mBJ0ck1F6MX3UGKduEK2I33k/dHlowUb4UQirVEiUeVsgsycN8hkRylWQzrld
        FognXDczYJNpvIiyNSNV8pTCMLfNJV9aMe5QMIIOhIdRGnUpReCTwGvDOeh1ZOZ4IbubR9
        YsIsq4T3zVGuc4DGmMd+JtzfrHi18zM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-3ZvitKbGOrGOoA5nG_hdbw-1; Wed, 09 Jun 2021 03:58:06 -0400
X-MC-Unique: 3ZvitKbGOrGOoA5nG_hdbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6747136278;
        Wed,  9 Jun 2021 07:58:04 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-217.ams2.redhat.com [10.36.114.217])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7712319C45;
        Wed,  9 Jun 2021 07:58:00 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Oscar Salvador <osalvador@suse.de>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 1/2] memory-hotplug.rst: remove locking details from admin-guide
Date:   Wed,  9 Jun 2021 09:57:51 +0200
Message-Id: <20210609075752.4596-2-david@redhat.com>
In-Reply-To: <20210609075752.4596-1-david@redhat.com>
References: <20210609075752.4596-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We have the same content at Documentation/core-api/memory-hotplug.rst
and it doesn't fit into the admin-guide. The documentation was
accidentially duplicated when merging.

Acked-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Muchun Song <songmuchun@bytedance.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-doc@vger.kernel.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 .../admin-guide/mm/memory-hotplug.rst         | 39 -------------------
 1 file changed, 39 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index c6bae2d77160..a783cf7c8e4c 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -415,45 +415,6 @@ Need more implementation yet....
  - Guard from remove if not yet.
 
 
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
2.31.1

