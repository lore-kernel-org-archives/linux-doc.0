Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D1D0D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 29 Jul 2019 19:42:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389288AbfG2TmP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 29 Jul 2019 15:42:15 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:52358 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389469AbfG2TmL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jul 2019 15:42:11 -0400
Received: by mail-pg1-f202.google.com with SMTP id h3so38888524pgc.19
        for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2019 12:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Frj/SS/W3AFZFbyzaOV4LWLnrMlPxcryoFLQjik2HTI=;
        b=NaqhEn+nWpsDdrbEejnjDaEBQITcPwt2PLGQeCcKpF/xtDBEPcIWyPuF7ZuPOpu8Pa
         jNyFsHX1Aqgj2NKuQj4deoctFI5yaGYWN+NwWkczUhWZtYXHWdQy6rGievfB0HcQR0CW
         80yz6PRH5wMlDl4QoAi3RlT1thGhUpyMhG5q208bELKjzUdINBEQDQSXotmYt7YzzewJ
         3VhbznDQsUgjfVPiFM2RR34iJmx2dpisKe6LolVq3LOjZu0Xr1BHMc0iHTyYRxMEQRiz
         JU4LhMPMcSrMTOwqhzoTY2rVjhoJaTHuS6CjxExljGBNKHF+98phmihBxTwGrkZSlXB/
         Guvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Frj/SS/W3AFZFbyzaOV4LWLnrMlPxcryoFLQjik2HTI=;
        b=rHMvsgAiLDtbsRskyEM1LsUnzM97b34lDYdVhYJ9iEgOipZ+YbrTvBwOHT+MQXkdUM
         oJnNdJTwSrSRWF7C4dG+FX6LDMSAEYKpcWaT+Fsvut/uaH3dwXjBx0R4dGojfe2XgNSr
         hiqqmr/TgYI8kkop7MqFRFL5IIUb/FectLDGfuq7qnYDOO3eiDAFjU3peQZyd/Y9aNic
         Zdk7IshYRLX8mO1Zu+R1yAUCLKBuwE1XVYodMTNxnnWWBH/9ZPzjO40FxaHAi1wiLoyM
         Z+sPACOtFjSQ1bIQbSj0NyFmGa4zaWCshpZFLnPOlIPHGurYotiYphyZuwBd8FNFqOW4
         aSwg==
X-Gm-Message-State: APjAAAUzikwklIjBmMWXoaolwGrQ8IyTaUGOAUyws8z+lOi6IcBuoDOC
        /xAoGomNlS9nuZ1XGo0PwpaltMBc5E0=
X-Google-Smtp-Source: APXvYqyf9K52n5I7/pZqfWtKK1UU5XmY8cIscUIXJkk8Ba5+O7oBV/xVhhZfFLdsElYAqR6YpFcVrndVWFg=
X-Received: by 2002:a63:a346:: with SMTP id v6mr59564547pgn.57.1564429329902;
 Mon, 29 Jul 2019 12:42:09 -0700 (PDT)
Date:   Mon, 29 Jul 2019 12:42:05 -0700
Message-Id: <20190729194205.212846-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH 1/1] psi: do not require setsched permission from the trigger creator
From:   Suren Baghdasaryan <surenb@google.com>
To:     gregkh@linuxfoundation.org
Cc:     lizefan@huawei.com, hannes@cmpxchg.org, axboe@kernel.dk,
        dennis@kernel.org, dennisszhou@gmail.com, mingo@redhat.com,
        peterz@infradead.org, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Suren Baghdasaryan <surenb@google.com>,
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

