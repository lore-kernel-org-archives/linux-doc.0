Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684441;
	b=Fwq1qJQJu5XHddQxvjaNHG6IPQjcfMMZlzsNGXEuJP3xkEoRgTcHsM9JSWk36whnN2In
	 LbLCySzNWLubjxgUsNYtAq2dTAr6DwoONE+Fg/lDov+ujYuQ2Rw/HeGvqns3P8c72j3xK
	 CSYu+XjTwpFV+fMdUr+g+c5fW5d5I+OFJ/riQqfbGxUq23pY3ei0RGHvynv5Q+5YNE6Wr
	 m/4a8ym+/c0jCJkqrZZV2TLUzQLz2JQMOz/q51Xy4Wvhm4cGfuJTmsoZWsgS8VxgOzlOn
	 PNZA7KSosOwu5cfMAJuEIvHuSM89mN1XCJ3isFXUZxiF7+bf31H8Owh0oKPSGZLyHCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KI910im9LTbTVP0mkZ5a0lfmv5lwSA07KjHuia0I/3A=;
	b=wHbvVe6eEFqWIiXco7QU/92j+YUUrDRCZX1sGlQHEvdH2A2c3FWCkIUACnh+JGxUKZHt
	 /iXkUHzdBqHJNAZ5uoPNLQnYTpIEJ1ppoygvnzMu6Al2Ygj8FOeav+OlN/I3MVLNhTTrh
	 Se5vu09j9VDyNu2JuTy959PQ/0qOGN9kSx4ukW+3eOLRyWzDQSnge9GMmL0voB5Vu2l1Y
	 IGyQa/Cp0ASOCiP83GccpxZD9cRdFJsETd0RgDHf6nTKklxIw9ww11BtbrTFQMbBU4wrU
	 ddKWPuDcZ/BYw6xM/ckWxasqUgrl5lQQTIVWIezcvSI7fyFV9E43NvzjJV2ZMJ6iekw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="KaQPx/n9";
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1099606A323
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1099606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KaQPx/n9
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dfb24dfedfso19522495ad.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792684440; x=1793289240; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KI910im9LTbTVP0mkZ5a0lfmv5lwSA07KjHuia0I/3A=;
        b=KaQPx/n9OKgBo7g58ndZ9L8mghRWuJopTgkml+I/OhRf/9AmhitUCJGPqCK/Ql2oH9
         iY7RWgXQtK5gUUs4qTgDVpfnSYMqpZkCd1Pnj96D/OU7mAZI5WoW9usU4H9P3BtbTawl
         Ay5arszfDhhIbsYBMD6gpRVQWn+eg4N3VgarXO0J1Mk9D+8smbUPXnbpp/6J2jIcoUuq
         2GFgs88pFkNw7Keg+v6CM3E71x6xOiF2lpIhSarbDCziimt5ckVwwnTd6Qdno/H7xMld
         OQnp2oNVW0HKiDWANcB6W0OArMVHHxgUbgHVVyJ0a/Hogff6z9o3/1mYw4cyd0diAhMI
         QwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684440; x=1793289240;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KI910im9LTbTVP0mkZ5a0lfmv5lwSA07KjHuia0I/3A=;
        b=snTHuqdyHO5Gcwl2iuYbA/x86Nd74AwTU8BF3tdXIWSUZvREyMoUFegvRCXS7Jf/Dx
         bLv/6hgs7CHD/3ZLa6eaYvkAmJvT80s0UZfpQC5OxrivCABTXp17TTieDIVkeqgqMXhs
         UaQSCNRkoScXfPWM1Vbcp+nBb6s9gizYm7fMp9In3i29abepTY00sDcMFhBNcf+sf5Xe
         hoQT69efZqBSQDCYkI2fVxyll/a2jWbDB4pXH+/bvz1zIB1WFySqBsDSr8Lj0uvCxPUB
         l7gqtJy3wgR+HMZcYSrL4DDfakIAiJM9kqA6yL3nbhkwSunQZq5hmY3IdgK0b5VlymaD
         EcoA==
X-Forwarded-Encrypted: i=1; AKwUvBzkCtNWOYfNTEUGDUbgGken/mxjWeco/yuoLbVcr6CgsbTcwrOl+Dnd4trqRifZMPHJkQuunTZYMW0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL55lkPOz0DIbCTf9Fb4TW5sP1TSFYEXto7J3O6WNKDWq7gihZp
	E3MT1PscYy2pkw9w56JvqQR1Z+0k+6lcPQfV9qKWBGDO1u1u6H1YMlKaREtZERZVRm/PWBnUHRM
	q0AwPNpDvAA==
X-Received: from pldc14.prod.google.com ([2002:a17:902:d98e:b0:2e1:2a71:d15b])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ffce:b0:2e9:61bf:6587
 with SMTP id d9443c01a7336-2ea43cccc07mr43696895ad.49.1792684440077; Thu, 22
 Oct 2026 08:54:00 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:53:34 +0000
In-Reply-To: <20261022155352.1293020-1-wfelipe@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022155352.1293020-1-wfelipe@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022155352.1293020-2-wfelipe@google.com>
Subject: [PATCH 1/3] workqueue: preserve pwq->stats[] when unbound pwqs are released
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>, 
	Shuhao Tan <tanshuhao@google.com>
Content-Type: text/plain; charset="UTF-8"

When an unbound pool_workqueue is replaced (e.g. during CPU hotplug or
apply_workqueue_attrs()), pwq_release_workfn() unlinks and frees the old
pwq along with its pwq->stats[]. This causes cumulative per-workqueue
counters to go backwards.

Add retired_stats[] to struct workqueue_struct and accumulate a released
pwq's stats into wq->retired_stats[] under wq->mutex before freeing it.

Signed-off-by: Wilson Felipe Pereira <wfelipe@google.com>
---
 kernel/workqueue.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index f2e8071a6f4e..88c8cc2b38d8 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -397,6 +397,8 @@ struct workqueue_struct {
 	struct workqueue_attrs	*attrs;	/* PW: workqueue attributes */
 	struct pool_workqueue __rcu *dfl_pwq;   /* PW: only for unbound wqs */
 
+	u64			retired_stats[PWQ_NR_STATS]; /* WQ: stats from released pwqs */
+
 #ifdef CONFIG_SYSFS
 	struct wq_device	*wq_dev;	/* I: for sysfs interface */
 #endif
@@ -5475,8 +5477,12 @@ static void pwq_release_workfn(struct kthread_work *work)
 	 * @wq, and @wq is invalid to access.
 	 */
 	if (!list_empty(&pwq->pwqs_node)) {
+		int i;
+
 		mutex_lock(&wq->mutex);
 		list_del_rcu(&pwq->pwqs_node);
+		for (i = 0; i < PWQ_NR_STATS; i++)
+			wq->retired_stats[i] += pwq->stats[i];
 		is_last = list_empty(&wq->pwqs);
 
 		/*
-- 
2.56.0.218.g1ec904b173-goog

