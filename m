Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A11C43217
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 08:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12271600CD
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 08:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbhJKIXP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Oct 2021 04:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38804 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235064AbhJKIXM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Oct 2021 04:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633940472;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AaKkIEW3HUO2tgQVS8IhxeXIR+5mDtqE3xTnoz6JfNs=;
        b=cf9tOkM2/BobLFGFcDxIIV6MlUm8WDHqoo31H1ma7SJQbXtiHIeOSRyZDdUSpBLfWXACYY
        8SRlJ+sC100u7hkNxHWya/rU59yjFLPlAyGlRSgoYSyV5IGhnExQ/2we2uTgFq+b6P6tlh
        8dLqdoICKx7W5DRRY9BcJtRkEpzHsD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-RlQM-El_PwiQGJjTk0cxiw-1; Mon, 11 Oct 2021 04:21:09 -0400
X-MC-Unique: RlQM-El_PwiQGJjTk0cxiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87868802B40;
        Mon, 11 Oct 2021 08:21:07 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C49D5F707;
        Mon, 11 Oct 2021 08:21:04 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2 1/3] memory-hotplug.rst: fix two instances of "movablecore" that should be "movable_node"
Date:   Mon, 11 Oct 2021 10:20:56 +0200
Message-Id: <20211011082058.6076-2-david@redhat.com>
In-Reply-To: <20211011082058.6076-1-david@redhat.com>
References: <20211011082058.6076-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We really want to refer to the "movable_node" kernel command line
parameter here.

Fixes: ac3332c44767 ("memory-hotplug.rst: complete admin-guide overhaul")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 03dfbc925252..27d748cb6ee0 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -166,7 +166,7 @@ Or alternatively::
 	% echo 1 > /sys/devices/system/memory/memoryXXX/online
 
 The kernel will select the target zone automatically, usually defaulting to
-``ZONE_NORMAL`` unless ``movablecore=1`` has been specified on the kernel
+``ZONE_NORMAL`` unless ``movable_node`` has been specified on the kernel
 command line or if the memory block would intersect the ZONE_MOVABLE already.
 
 One can explicitly request to associate an offline memory block with
@@ -393,7 +393,7 @@ command line parameters are relevant:
 ======================== =======================================================
 ``memhp_default_state``	 configure auto-onlining by essentially setting
                          ``/sys/devices/system/memory/auto_online_blocks``.
-``movablecore``		 configure automatic zone selection of the kernel. When
+``movable_node``	 configure automatic zone selection in the kernel. When
 			 set, the kernel will default to ZONE_MOVABLE, unless
 			 other zones can be kept contiguous.
 ======================== =======================================================
-- 
2.31.1

