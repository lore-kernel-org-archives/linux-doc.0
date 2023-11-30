Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJ3QjTWl"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C56C10F8
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 13:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701381215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pG2lRKOWfMEjs9VpsMcZUPdW+pUgM81zvIo8oiA6l4=;
	b=gJ3QjTWlXm5wvh1oa0cadDFjAjWfNU/sH6ayo4UTj/d8ZphB6kyAufKKAxnkrmYLJa5AFJ
	pbWnzbKrIKCy11tQUiJw1e+ogSMsAzy3BiPV0O6o8jL2j+iVIcqYZi6xg645JuqtpyF90L
	cH2OoIwN/GYIcvlFPu4WtV7rD3i1t4M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-23t9BpumOcWX-WjgRFx-gw-1; Thu,
 30 Nov 2023 16:53:30 -0500
X-MC-Unique: 23t9BpumOcWX-WjgRFx-gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5029B1C06E18;
	Thu, 30 Nov 2023 21:53:30 +0000 (UTC)
Received: from [10.22.9.192] (unknown [10.22.9.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4C2F40C6EB9;
	Thu, 30 Nov 2023 21:53:29 +0000 (UTC)
Message-ID: <2f17a9a6-5781-43ef-a09b-f39310843fe6@redhat.com>
Date: Thu, 30 Nov 2023 16:53:29 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
Content-Language: en-US
To: Jann Horn <jannh@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20231130204817.2031407-1-jannh@google.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20231130204817.2031407-1-jannh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

On 11/30/23 15:48, Jann Horn wrote:
> I have seen several cases of attempts to use mutex_unlock() to release an
> object such that the object can then be freed by another task.
> My understanding is that this is not safe because mutex_unlock(), in the
> MUTEX_FLAG_WAITERS && !MUTEX_FLAG_HANDOFF case, accesses the mutex
> structure after having marked it as unlocked; so mutex_unlock() requires
> its caller to ensure that the mutex stays alive until mutex_unlock()
> returns.
>
> If MUTEX_FLAG_WAITERS is set and there are real waiters, those waiters
> have to keep the mutex alive, I think; but we could have a spurious
> MUTEX_FLAG_WAITERS left if an interruptible/killable waiter bailed
> between the points where __mutex_unlock_slowpath() did the cmpxchg
> reading the flags and where it acquired the wait_lock.

Could you clarify under what condition a concurrent task can decide to 
free the object holding the mutex? Is it !mutex_is_locked() or after a 
mutex_lock()/mutex_unlock sequence?

mutex_is_locked() will return true if the mutex has waiter even if it  
is currently free.

Cheers,
Longman

>
> (With spinlocks, that kind of code pattern is allowed and, from what I
> remember, used in several places in the kernel.)
>
> If my understanding of this is correct, we should probably document this -
> I think such a semantic difference between mutexes and spinlocks is fairly
> unintuitive.
>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> I hope for some thorough review on this patch to make sure the comments
> I'm adding are actually true, and to confirm that mutexes intentionally
> do not support this usage pattern.
>
>   Documentation/locking/mutex-design.rst | 6 ++++++
>   kernel/locking/mutex.c                 | 5 +++++
>   2 files changed, 11 insertions(+)
>
> diff --git a/Documentation/locking/mutex-design.rst b/Documentation/locking/mutex-design.rst
> index 78540cd7f54b..087716bfa7b2 100644
> --- a/Documentation/locking/mutex-design.rst
> +++ b/Documentation/locking/mutex-design.rst
> @@ -101,6 +101,12 @@ features that make lock debugging easier and faster:
>       - Detects multi-task circular deadlocks and prints out all affected
>         locks and tasks (and only those tasks).
>   
> +Releasing a mutex is not an atomic operation: Once a mutex release operation
> +has begun, another context may be able to acquire the mutex before the release
> +operation has completed. The mutex user must ensure that the mutex is not
> +destroyed while a release operation is still in progress - in other words,
> +callers of 'mutex_unlock' must ensure that the mutex stays alive until
> +'mutex_unlock' has returned.
>   
>   Interfaces
>   ----------
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index 2deeeca3e71b..4c6b83bab643 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -532,6 +532,11 @@ static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigne
>    * This function must not be used in interrupt context. Unlocking
>    * of a not locked mutex is not allowed.
>    *
> + * The caller must ensure that the mutex stays alive until this function has
> + * returned - mutex_unlock() can NOT directly be used to release an object such
> + * that another concurrent task can free it.
> + * Mutexes are different from spinlocks in this aspect.
> + *
>    * This function is similar to (but not equivalent to) up().
>    */
>   void __sched mutex_unlock(struct mutex *lock)
>
> base-commit: 3b47bc037bd44f142ac09848e8d3ecccc726be99

