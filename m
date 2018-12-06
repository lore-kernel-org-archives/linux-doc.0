Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 960A57D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 00:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbeLFA0j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 19:26:39 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38158 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbeLFA0j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 19:26:39 -0500
Received: by mail-pl1-f193.google.com with SMTP id e5so10873151plb.5
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 16:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=URCyZCPL+TUEFjSpR/fenuVZXwVf0zMM4zm8B9xW2pA=;
        b=X2SljuWn+9bHWDMbyEyaxzOXEa1CTVhuZwutL1yEfJLDYl9NKJm2Kgw+1uosRkYMNl
         3QJwbPA2cJv6vDvAGJCcIsk7y1bqjyT0dDsQMOOrENr9O0mPGPACPkmlmbPA+70I/fse
         FzdEa6l+FYByRZ4nUDwk3mlQN2asxSvYj7SL7/DmyqBjY9LcKiMAY4MtMCGoH6MSmFyI
         cxBe70WguRLY4Y594pSW/MGy6XTO6e/sGVZwUWbWm8MeGYKgFWgLGF3luO45x7oJoEFI
         rL3gU4OPcd0w/A+gP55Qkj+ccP94wq1M6QKcAWVzE0d7oRY94CtfmCT9o0QRNkzxVsbD
         onhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=URCyZCPL+TUEFjSpR/fenuVZXwVf0zMM4zm8B9xW2pA=;
        b=j23vEtE3z0PKl8HrAhHLPn/baPjn/NjvNlCMaFGyt9oNUSxciISdvbhG7VuYDGIBmo
         KbLi3fDqx/kfG3y9hLhow1QIoBAQmBInEtxYnoSYkzjRVlbLVtpSt5Du+NEt72bAKfjm
         k21GFDvYDlAcZC4oeuHzbI5z3w8aWGHFe5yOOhZrkIbOvmiWnqJctgLZqD9a4lRn/xJ3
         T9DZd1p2QIC5X8NxMdnIfXvzDZOrEr1LXvE60XVtznE3Du/8Hetn5qe/GSd9GV7Ssz9y
         +sHzwHOWbp5DSMUaLcTn7+VY4iceY61x4CRY1xkdtHyYWRJAiRQfE6xFWPqUFXAsUpNI
         1RuA==
X-Gm-Message-State: AA+aEWYEKmLXObFQF9gNco/kVxlzvuOgZRhNvXOQWs6B2qL0OefvsDOH
        OsjeuGR/F9N3Q3roIaSQGFg=
X-Google-Smtp-Source: AFSGD/W6/H8znQ6RfXPvhVzpcTkpVDdl7lQ7B+GA01lNNYw1QkCIeTJkfpeKW+9gzt6QzH2a3lYoGw==
X-Received: by 2002:a17:902:70c6:: with SMTP id l6mr26947492plt.30.1544055998474;
        Wed, 05 Dec 2018 16:26:38 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id e24sm30646534pfi.153.2018.12.05.16.26.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Dec 2018 16:26:37 -0800 (PST)
From:   Wei Yang <richard.weiyang@gmail.com>
To:     rppt@linux.ibm.com, david@redhat.com, mhocko@suse.com,
        osalvador@suse.de
Cc:     akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v2 2/2] core-api/memory-hotplug.rst: divide Locking Internal section by different locks
Date:   Thu,  6 Dec 2018 08:26:22 +0800
Message-Id: <20181206002622.30675-2-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20181206002622.30675-1-richard.weiyang@gmail.com>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
 <20181206002622.30675-1-richard.weiyang@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently locking for memory hotplug is a little complicated.

Generally speaking, we leverage the two global lock:

  * device_hotplug_lock
  * mem_hotplug_lock

to serialise the process.

While for the long term, we are willing to have more fine-grained lock
to provide higher scalability.

This patch divides Locking Internal section based on these two global
locks to help readers to understand it. Also it adds some new finding to
enrich it.

[David: words arrangement]

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
v2: adjustment based on David and Mike comment
---
 Documentation/core-api/memory-hotplug.rst | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
index de7467e48067..51d477ad4b80 100644
--- a/Documentation/core-api/memory-hotplug.rst
+++ b/Documentation/core-api/memory-hotplug.rst
@@ -89,6 +89,20 @@ NOTIFY_STOP stops further processing of the notification queue.
 Locking Internals
 =================
 
+In addition to fine grained locks like pgdat_resize_lock, there are three locks
+involved
+
+- device_hotplug_lock
+- mem_hotplug_lock
+- device_lock
+
+Currently, they are twisted together for all kinds of reasons. The following
+part is divided into device_hotplug_lock and mem_hotplug_lock parts
+respectively to describe those tricky situations.
+
+device_hotplug_lock
+---------------------
+
 When adding/removing memory that uses memory block devices (i.e. ordinary RAM),
 the device_hotplug_lock should be held to:
 
@@ -111,13 +125,20 @@ As the device is visible to user space before taking the device_lock(), this
 can result in a lock inversion.
 
 onlining/offlining of memory should be done via device_online()/
-device_offline() - to make sure it is properly synchronized to actions
-via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online_type)
+device_offline() - to make sure it is properly synchronized to actions via
+sysfs. Even if mem_hotplug_lock is used to protect the process, because of the
+lock inversion described above, holding device_hotplug_lock is still advised
+(to e.g. protect online_type)
+
+mem_hotplug_lock
+---------------------
 
 When adding/removing/onlining/offlining memory or adding/removing
 heterogeneous/device memory, we should always hold the mem_hotplug_lock in
 write mode to serialise memory hotplug (e.g. access to global/zone
-variables).
+variables). Currently, we take advantage of this to serialise sparsemem's
+mem_section handling in sparse_add_one_section() and
+sparse_remove_one_section().
 
 In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) in read
 mode allows for a quite efficient get_online_mems/put_online_mems
-- 
2.15.1

