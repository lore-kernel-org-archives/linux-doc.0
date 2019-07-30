Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC8AA7D910
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 01:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbfG3BdY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 29 Jul 2019 21:33:24 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:43806 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729473AbfG3BdY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jul 2019 21:33:24 -0400
Received: by mail-vk1-f202.google.com with SMTP id j140so27277911vke.10
        for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2019 18:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Frj/SS/W3AFZFbyzaOV4LWLnrMlPxcryoFLQjik2HTI=;
        b=HZV5K3snh9+hZYi0hyCp//JyWT/fXpO3R4ntivO3tTKVGtiJDw32+qKHYjRImOIIZW
         VxTiXkHj+VspcOQwMQmsA2V4AKt/XjP3LHtr1xFiKnUbnM3QWXE/wSzzzjwb8HARp0NL
         NnuTKiG3/MUCJOwH8yeiqO0PT9JR5nFtwF6U8A53/0E2cI+PwTcE9W+5puIoSJsXHcYY
         pGpqdjgsz/Gm/zNNZuQ/PWKC68R/embIB/nPMOQPIpfTsQj4rmJs4brzVzJl1hn7d19A
         ijF6rMV/AiriXix/ERN3pm4aTwkganjyHVi9+SBcKd4uYnPHslwXHHddmjlMGT2iycj7
         WlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Frj/SS/W3AFZFbyzaOV4LWLnrMlPxcryoFLQjik2HTI=;
        b=prbVobRwMCGeKyCjyQQMLQV8dIdNhbSX/aHYeFdjlxJRA+0iClpsIDEmrgswg/qoGO
         AZQWOLnDksclgpJX70Ve7xcPMMgZQxTvImZV/2xVuhNDrrGZvOjQHfEpQHOvA6tiZPUF
         MjZwB4pCqJV0AeuAqCeC4AEReZqVRA1ayTAEGphj0AiAZdC/jCq+xGLl/si7qi23jKMS
         7yFzfvxxesjEciZHFeE/C5MzsJaZx/oR1NjPaimcZa9nDtMrBI4Yrn35x2Mg2TLP92MY
         h3jXOo7mPVyUDw2zv1Mi1aUUw3w7ANG3xxl311ts40QsFa9rACiwizD950DnaZ057t0W
         FWWw==
X-Gm-Message-State: APjAAAVpaKqjA7RpFjc5gDnfPNpXqO8jY3ZwKBy2XB1LHFMHcMli9OH8
        c7tShjRO3JQlbOvZp4yb7SFew1BAcB4=
X-Google-Smtp-Source: APXvYqzqfX8t1uXNFJXNaDwGRiqkwrH6h4jiFWfc6T5iZhZ57KmlPWww1KkuiFIxc6pVEcoJJlMga4+hqnw=
X-Received: by 2002:ab0:740e:: with SMTP id r14mr68442936uap.108.1564450403321;
 Mon, 29 Jul 2019 18:33:23 -0700 (PDT)
Date:   Mon, 29 Jul 2019 18:33:10 -0700
Message-Id: <20190730013310.162367-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH 1/1] psi: do not require setsched permission from the trigger creator
From:   Suren Baghdasaryan <surenb@google.com>
To:     mingo@redhat.com, peterz@infradead.org
Cc:     lizefan@huawei.com, hannes@cmpxchg.org, axboe@kernel.dk,
        dennis@kernel.org, dennisszhou@gmail.com,
        akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Suren Baghdasaryan <surenb@google.com>,
        Nick Kralevich <nnk@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When a process creates a new trigger by writing into /proc/pressure/*
files, permissions to write such a file should be used to determine whether
the process is allowed to do so or not. Current implementation would also
require such a process to have setsched capability. Setting of psi trigger
thread's scheduling policy is an implementation detail and should not be
exposed to the user level. Remove the permission check by using _nocheck
version of the function.

Suggested-by: Nick Kralevich <nnk@google.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/sched/psi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 7acc632c3b82..ed9a1d573cb1 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1061,7 +1061,7 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group,
 			mutex_unlock(&group->trigger_lock);
 			return ERR_CAST(kworker);
 		}
-		sched_setscheduler(kworker->task, SCHED_FIFO, &param);
+		sched_setscheduler_nocheck(kworker->task, SCHED_FIFO, &param);
 		kthread_init_delayed_work(&group->poll_work,
 				psi_poll_work);
 		rcu_assign_pointer(group->poll_kworker, kworker);
-- 
2.22.0.709.g102302147b-goog

