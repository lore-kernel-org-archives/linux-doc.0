Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c68nmUyn"
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00995D54
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 12:48:34 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40b51e26a7aso1315e9.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 12:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701377313; x=1701982113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDbR5wn/ymhzANEbstkor6jRTtY0ksRtmkAGEgVn3ME=;
        b=c68nmUyn7+GdxK0l9ja1a0VcOWtqcXOOGjajdIyD6+8k0y0R4Au3jI6lvPrQzmZyJN
         2PkvNbIRZCddExGR53DD36OXokzDkVXErQ+FBTKB6RY1Fx8Sciw85Wov/ssJbyDlPUQX
         wvmK+GYxpc343e/HeTKnQqlPslSAXrZYxxvG3E7rFxjMo5dOWh4emMvPXVOF9VSgeafJ
         55TT8smWaxH/e3bg8/oNBF9e2z13IgauuQR73DiNJe8SzrHLah5EbKWBO1GqDA0g9OB9
         RBE4syT1eo9KbhesACFq1vBiXm1AX7PhChy8PYKzKeoW8xTfMiv14wgpncY4V0wmNU0K
         0Qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701377313; x=1701982113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDbR5wn/ymhzANEbstkor6jRTtY0ksRtmkAGEgVn3ME=;
        b=wQW/EHOCC8mjkJMDeDPYNDgIga6tP45FEeKWoTKQUkQPf96OFohcW0/7fCMmSvNok/
         2MrGNsdf01dM4KgK9BMaCw3xdjdq9iLSYJCwLyOD1iVSXWPXsqqqzai0G4F54u7HwdO6
         smezByMTBsXPyaePZXXrOihdPuRk6/9wJVJg+97yjApY7u41j3f6yoWYw4H9QgZqDuAr
         tNR8JCnWXb0HfkoaRdO4dNqW2azMs1En99jOzqlWGHubJo5ifXdnKKpxQy+1+pZiw6wo
         ZIEhbFRai71S3SwA7jECEqfQF351g1l3rhdpQQwD3T/Mv1yJPgXpKctiTLZBlW7CY0sN
         f1iw==
X-Gm-Message-State: AOJu0YxBlTeCrPcOwgsMry1Du9aUNq32YrUtj6SGuylVdmZd0l84BK7K
	Yb6kCYwlcF/GTkkrPH5n8WKTVQ==
X-Google-Smtp-Source: AGHT+IEWEtiVFKWOO64KC6IV7yjdz4Ob7/rD3TYHW6b0lUwhNd8FJc+db/wlIt7p6MnnQ9/yGFkmqA==
X-Received: by 2002:a1c:7202:0:b0:40b:4355:a04b with SMTP id n2-20020a1c7202000000b0040b4355a04bmr15152wmc.6.1701377313270;
        Thu, 30 Nov 2023 12:48:33 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:9869:5af3:4653:dd50])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b0040b347d90d0sm6680258wmq.12.2023.11.30.12.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:48:32 -0800 (PST)
From: Jann Horn <jannh@google.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] locking: Document that mutex_unlock() is non-atomic
Date: Thu, 30 Nov 2023 21:48:17 +0100
Message-ID: <20231130204817.2031407-1-jannh@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have seen several cases of attempts to use mutex_unlock() to release an
object such that the object can then be freed by another task.
My understanding is that this is not safe because mutex_unlock(), in the
MUTEX_FLAG_WAITERS && !MUTEX_FLAG_HANDOFF case, accesses the mutex
structure after having marked it as unlocked; so mutex_unlock() requires
its caller to ensure that the mutex stays alive until mutex_unlock()
returns.

If MUTEX_FLAG_WAITERS is set and there are real waiters, those waiters
have to keep the mutex alive, I think; but we could have a spurious
MUTEX_FLAG_WAITERS left if an interruptible/killable waiter bailed
between the points where __mutex_unlock_slowpath() did the cmpxchg
reading the flags and where it acquired the wait_lock.

(With spinlocks, that kind of code pattern is allowed and, from what I
remember, used in several places in the kernel.)

If my understanding of this is correct, we should probably document this -
I think such a semantic difference between mutexes and spinlocks is fairly
unintuitive.

Signed-off-by: Jann Horn <jannh@google.com>
---
I hope for some thorough review on this patch to make sure the comments
I'm adding are actually true, and to confirm that mutexes intentionally
do not support this usage pattern.

 Documentation/locking/mutex-design.rst | 6 ++++++
 kernel/locking/mutex.c                 | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/locking/mutex-design.rst b/Documentation/locking/mutex-design.rst
index 78540cd7f54b..087716bfa7b2 100644
--- a/Documentation/locking/mutex-design.rst
+++ b/Documentation/locking/mutex-design.rst
@@ -101,6 +101,12 @@ features that make lock debugging easier and faster:
     - Detects multi-task circular deadlocks and prints out all affected
       locks and tasks (and only those tasks).
 
+Releasing a mutex is not an atomic operation: Once a mutex release operation
+has begun, another context may be able to acquire the mutex before the release
+operation has completed. The mutex user must ensure that the mutex is not
+destroyed while a release operation is still in progress - in other words,
+callers of 'mutex_unlock' must ensure that the mutex stays alive until
+'mutex_unlock' has returned.
 
 Interfaces
 ----------
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 2deeeca3e71b..4c6b83bab643 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -532,6 +532,11 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
  * This function must not be used in interrupt context. Unlocking
  * of a not locked mutex is not allowed.
  *
+ * The caller must ensure that the mutex stays alive until this function has
+ * returned - mutex_unlock() can NOT directly be used to release an object such
+ * that another concurrent task can free it.
+ * Mutexes are different from spinlocks in this aspect.
+ *
  * This function is similar to (but not equivalent to) up().
  */
 void __sched mutex_unlock(struct mutex *lock)

base-commit: 3b47bc037bd44f142ac09848e8d3ecccc726be99
-- 
2.43.0.rc2.451.g8631bc7472-goog

