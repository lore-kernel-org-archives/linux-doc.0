Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F304E1C73
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611367; cv=none; b=Y6+rJcNFBp/OiTeFQX3kO9ivktqFeSQLf5+urxypMSknqf6c2r0j+HDhl5l57AZtvt698WxihrPahNMhN8gczt5+EnwaJRJFHB6F5Op75Iq75gLn12KSV2w1AwTnMQegUE79jZgtuOQwPrXccIYj3Q4ZmeyFOFKXGdc/ZkR20KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611367; c=relaxed/simple;
	bh=A/f+F6aaD8HY32lhaRCz6AjcLaXATg7+0bzSGgyq1D4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijQ7jXhu0/UUh+kxsNRovoXfveffja5HkVauuiDXj4G5QQ8mBNtQWRKFom9KO/ebkjeXE6Ur8hSlkKKxKVQsqJC7p2TKzjWo8q9JHKWB1swvBbGddkqwunGWw/SVX+QFcT10qRJQHNga2RMRYOjeXbznm5oQqGmQpAFg/KhQ680=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=qy6MBYhI; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="qy6MBYhI"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91437cd26d9so24961346d6.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790611364; x=1791216164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnavoMh2luGLfYugxKmC3/HXPrjVOPHbgSWf0XMoQRA=;
        b=qy6MBYhIeS6dsuk+Tc8urM08mMCMUIsn6du/akoZJLSk4R284Ctwy9t2cDVnbNxFdR
         XvCaomoxwF/jG0CxcghseAS6GvocrI3k+EOvgQxEVopwgSLjlnxSlNxYvQm50jOutwi1
         Uv0beICMraLZMomlbBc9wru/PNA2a8H91ftffmNdAQEZE9bs0YGmC7/gLBmVBNnM+AW8
         aSAUDzqpmxZs6Ne38BfHKyrqBIngLh0x4XPoOibNqrfbSimrapNOYue5fmnYFwRMAStZ
         HdLa1Avva3y4V893IHO1lYvG+hW0LjV+jsKuzrA4h1t+QKeuUuD20HU9EWmYLcgzFfdp
         jDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611364; x=1791216164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnavoMh2luGLfYugxKmC3/HXPrjVOPHbgSWf0XMoQRA=;
        b=wlQyGom1VYZ306MQhos/wPu1D6ozIPjP2GEfHdyjOMW5n5ESPe7lobMM56R6NQCouh
         3R6wyaF1EfxoRWRGwxfctrgHiI2buf/rUx+Eh6u1V+dMaJoFVntiIUsitooky9NdjR9j
         1j3HbTGIQBQfITDSxbBqaAAjeSJ3VDo82VigA5TjsA21OgQ6N1xonjSpejRE51CvphAm
         /u6Y2eVADeG/JblOpg8rzj+utivYU6mWlZsWCYcmwXyIU0f0CuCZYY/lQYIfgfowNUFG
         0UXkKfM1sLKVis6tFYQiMZ4DVAnZsWXBsPqWiHoirQPpA1UoSvh7pRO6pF7KSOzbd6ke
         +bYw==
X-Forwarded-Encrypted: i=1; AKwUvBy3hrwkPBlSgIC8Z2QlPez2bFWiN6UluNLGiIeEAJkqO6NuL4iQ1+I4vd8qmaSA0t04fZJdrWzXncE=@vger.kernel.org
X-Gm-Message-State: AFuF++nzBvB7R1FTJIkUcfEbkVpnm28Qkfjx7+twtNBILmawsp9+xe+k
	wPF+Hq/0/ff++n/uJYLG5MPNqEVBnELM+KtHiCDTdC8ru4mmRjHLEyWwK4dWf04rDpg=
X-Gm-Gg: AYBFou02cL7ieCGW+Fn+RkadQw/WrgF28jbb3hvS8/WK1ixkEP97pPYWIlwp1vqUbqS
	6YvLRmUzGesi5ybmSf7f02k3ioBKQ9vTkJpjp7g/ygmaqPR3gYT9iOO1zMzFdFWe4q14WACIo/W
	9s6mQ6JqXI6R7F/k6CJdb8KGlyVWbbv47eVJaRM7L6I6OL1WCBjAM4vAjO0gLhuKdhpLZhOxZ2X
	yt4ngAhTsk5w6lUCPoX/IqUOlFBQf2TQjufdvUoMg9mIxITni3p52vEcQQ2YL1qsQBYd8T4zepJ
	BVi3CfhIOOZBcJS6+RGHp7t+4Ydv9OIc59+Q42NVkD/TrKxBAr1nsIJHzF+BkFAOgW2LD/hwV1e
	M8acyRCk1qM05XJCNpktO6rQVJLsecppm90Gstki78y0bECY2kkzdXanhFWfdlr4p2Tb0M2h//S
	HuzBc7aJfLbJqcNjCZLyO77degXQFqPNrlEhNlL74/DuXu5LZFl1jm6jDYD036TALNvZuUUw26O
	p/YXmtdBxZtz8s=
X-Received: by 2002:a05:6214:5e04:b0:914:3ef6:ec29 with SMTP id 6a1803df08f44-9143ef6fdbcmr151746926d6.11.1790611363067;
        Mon, 28 Sep 2026 09:02:43 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e281a8sm83180696d6.33.2026.09.28.09.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:02:42 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 28 Sep 2026 16:00:38 +0000
Subject: [PATCH 2/9] ublk: clear ub->canceling with the queue's own flag
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-ublk-cancel-stop-v1-2-4a4360232a46@toxicpanda.com>
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
In-Reply-To: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
To: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790611253; l=2915;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=A/f+F6aaD8HY32lhaRCz6AjcLaXATg7+0bzSGgyq1D4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QL/Nh5d1hZOL57OfiAxEtFl8DKAYzKCrbHXg1HBBX0bjF8L3LGbtWuspNYjHUpsBei0EIEiu5RZ
 Yat5LSZrRogY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

ublk_queue_rq() dispatches a request to a NULL io->cmd and the kernel
oopses when, during recovery, the task serving a queue which is ready
already exits before the last queue is ready. ublk_start_cancel() skips
marking and quiescing the queues while ub->canceling is set, since that
means every queue is marked. Since commit 3f3850785594 ("ublk: fix
batch I/O recovery -ENODEV error") it does not mean that any more:

    queue 0 gets ready:  ubq->canceling = false
                         ub->canceling stays set until the last queue
                         is ready
    queue 0 task exits:  ublk_start_cancel() sees ub->canceling, returns
                         queue 0 commands done, ubq->canceling unset

The disk is attached during recovery, and on a queue which got ready
only ->canceling holds requests back, so the next request for queue 0
is dispatched.

Fix by clearing ub->canceling together with the queue flag, under
cancel_mutex, so that the next cancel marks and quiesces every queue
again, and by dropping the clearing on full readiness.

Fixes: 3f3850785594 ("ublk: fix batch I/O recovery -ENODEV error")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/ublk_drv.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 183de080e008..50c99b28ef21 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -3049,14 +3049,21 @@ static bool ublk_queue_has_canceled_io(const struct ublk_queue *ubq)
 /* reset per-queue io flags */
 static void ublk_queue_reset_io_flags(struct ublk_queue *ubq)
 {
+	struct ublk_device *ub = ubq->dev;
+
+	mutex_lock(&ub->cancel_mutex);
 	spin_lock(&ubq->cancel_lock);
 	/*
 	 * A command canceled after being fetched is still counted as ready
 	 * but can't take requests, so the queue has to stay canceling.
 	 */
-	if (!ublk_queue_has_canceled_io(ubq))
+	if (!ublk_queue_has_canceled_io(ubq)) {
 		ubq->canceling = false;
+		/* not every queue is marked now, let the next cancel redo it */
+		ub->canceling = false;
+	}
 	spin_unlock(&ubq->cancel_lock);
+	mutex_unlock(&ub->cancel_mutex);
 	ubq->fail_io = false;
 	ubq->force_abort = false;
 }
@@ -3084,17 +3091,9 @@ static void ublk_mark_io_ready(struct ublk_device *ub, u16 q_id)
 		ublk_queue_reset_io_flags(ubq);
 	}
 
-	/* Check if all queues are ready */
-	if (ublk_dev_ready(ub)) {
-		/*
-		 * All queues ready - clear device-level canceling flag
-		 * and wake ublk_dev_ready() waiters.
-		 */
-		mutex_lock(&ub->cancel_mutex);
-		ub->canceling = false;
-		mutex_unlock(&ub->cancel_mutex);
+	/* All queues ready - wake ublk_dev_ready() waiters */
+	if (ublk_dev_ready(ub))
 		wake_up_var(&ub->nr_queue_ready);
-	}
 }
 
 static inline int ublk_check_cmd_op(u32 cmd_op)

-- 
2.55.0

