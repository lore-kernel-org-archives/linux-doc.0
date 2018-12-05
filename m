Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9E8817D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 02:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725841AbeLECfd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Dec 2018 21:35:33 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44620 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbeLECfd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Dec 2018 21:35:33 -0500
Received: by mail-pf1-f194.google.com with SMTP id u6so9203570pfh.11
        for <linux-doc@vger.kernel.org>; Tue, 04 Dec 2018 18:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OBRiPkArGg9pvbpKBjvwsW5lZXZ35bCeYSQi3SQgqaI=;
        b=R4aC+HRl1fc9MgkD1Sqi+zkuZojGWX9XieTDI3ljT9Y2Vyg1TsMyv1W7BrQalQ/2ao
         8cMk2FjFxyZ+QgUngrRu3Og/wTXui+/lEx3IYvGLbeYnjlM1nmnf3vBUidBs208fxdwB
         whUysH+sLKOuJa6Q/Ci2RhjagPpb6/qXKwLrQ9+7k+hmEH6AaizixK64P3s0ADUnb20j
         ORoY02R5vwU5xDFxFpYio2COHTziOb8pwJ14u4RF5x5vgAP2v54OxS23x4Nm9czz2HrQ
         pcSa1jBCoyn3HweiBFq2AEjSX3elJdHVVR1aqNaKPoyl/Is0n6kb2xyti8kn/bEwpMzO
         O5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OBRiPkArGg9pvbpKBjvwsW5lZXZ35bCeYSQi3SQgqaI=;
        b=bPJsdVI1q2lbJsiQLK62bAK95x0+fGBcyUTdOLMuseVOpIhHG9whkWtzgbbk8Lk53r
         2n43jt9PO9rDX3fyOaEjxgRaTIHCSiPcBB4USiXMTxP60oSUfveQrDt9vLr3BRLbIVi2
         kSV0swNuO7XcvUV21UbVaMPCglAI4HmiNDfEUahtB/UvfQo/tMYzNmep0rmgbbnIRFHa
         ZH8fBLsOtILeXLIDPvSmj4tYk5TBSvoqyLhvtBxwmUhEYcDlGLKoKVOLFE7cq4F7ATqS
         58P4DC4cqmcn4uZh/7ev4EfqH165nPPSBcflwexYkV7VIOo/6okkvPD44hIlDnjOQQIj
         6/2w==
X-Gm-Message-State: AA+aEWZ0IDJDXBSfagjNdLJvtwq+VLfc4FGLOgpKgWRfXdk7miF2nW2n
        zKztfFP3sili0qkGw0bIn/A=
X-Google-Smtp-Source: AFSGD/X4u6RzQJ0hbVoIKgY2Y4Not5sn8w0uiDD5wtxwcz5ONMsqmC95RWdJ1mpelqg/t33simEYpw==
X-Received: by 2002:a65:6542:: with SMTP id a2mr18753013pgw.389.1543977332056;
        Tue, 04 Dec 2018 18:35:32 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id i123sm35791186pfg.164.2018.12.04.18.35.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 18:35:31 -0800 (PST)
From:   Wei Yang <richard.weiyang@gmail.com>
To:     david@redhat.com, mhocko@suse.com, osalvador@suse.de
Cc:     akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH 2/2] core-api/memory-hotplug.rst: divide Locking Internal section by different locks
Date:   Wed,  5 Dec 2018 10:34:26 +0800
Message-Id: <20181205023426.24029-2-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20181205023426.24029-1-richard.weiyang@gmail.com>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
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
 Documentation/core-api/memory-hotplug.rst | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
index de7467e48067..95662b283328 100644
--- a/Documentation/core-api/memory-hotplug.rst
+++ b/Documentation/core-api/memory-hotplug.rst
@@ -89,6 +89,20 @@ NOTIFY_STOP stops further processing of the notification queue.
 Locking Internals
 =================
 
+There are three locks involved in memory-hotplug, two global lock and one local
+lock:
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
+sysfs. Even mem_hotplug_lock is used to protect the process, because of the
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

