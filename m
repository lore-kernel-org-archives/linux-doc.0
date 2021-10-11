Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356D2C4321E
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 08:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18A93610CC
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 08:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbhJKIXS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Oct 2021 04:23:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39473 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235035AbhJKIXR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Oct 2021 04:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633940477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iUT00SFFMSyhOoEnBK2kV8REPmBQWV8bxInejpzsCM8=;
        b=MwrtSTaS966jaRQcuG7BmIt4bO6igPO+3+A0V+WBghRKWlwoEv6OG9QTrytLsr0iWUHhvs
        kl1mr4qQ9jnnEpgcCZRrAmoagrNOdkHj3K8syh87iMt7glgNqqxj4XNvDyi14TFFOK05+d
        VDPWQihgH14/p6LNFwXzu1AAKsPtJTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-I-rhEkf_MhatSmPAKr0lJQ-1; Mon, 11 Oct 2021 04:21:14 -0400
X-MC-Unique: I-rhEkf_MhatSmPAKr0lJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83E3C801A93;
        Mon, 11 Oct 2021 08:21:12 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.99])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E6B095C232;
        Mon, 11 Oct 2021 08:21:07 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2 2/3] memory-hotplug.rst: fix wrong /sys/module/memory_hotplug/parameters/ path
Date:   Mon, 11 Oct 2021 10:20:57 +0200
Message-Id: <20211011082058.6076-3-david@redhat.com>
In-Reply-To: <20211011082058.6076-1-david@redhat.com>
References: <20211011082058.6076-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We accidentially added a superfluous "s".

Fixes: ac3332c44767 ("memory-hotplug.rst: complete admin-guide overhaul")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 27d748cb6ee0..ee00b70dedde 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -410,7 +410,7 @@ them with ``memory_hotplug.`` such as::
 
 and they can be observed (and some even modified at runtime) via::
 
-	/sys/modules/memory_hotplug/parameters/
+	/sys/module/memory_hotplug/parameters/
 
 The following module parameters are currently defined:
 
-- 
2.31.1

