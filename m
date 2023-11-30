Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRe8l8lt"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D6910D1
	for <linux-doc@vger.kernel.org>; Thu, 30 Nov 2023 15:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701388617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isRSmHfA7wl0UpgP4f3nZ8cWSqDYWRF8DVcNYkEZCpE=;
	b=NRe8l8ltHoNFZCMAZJNJg3wVCUYAWROXZv+F27OCBIqm+kLjFmyeh+t84K2WKGvRa/F5g8
	rmHx2eNyjRdEoEtj3VjjRbI5L4aGFvhnQFpfNVhohRsWfSYYzmxvajKJJ/tjohrRuMziVq
	4Sbfzf2Wqw8b/dImHnKn5qzn07rfkFM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-y6qr_XQ5O52A4CV1P-MZsQ-1; Thu,
 30 Nov 2023 18:56:54 -0500
X-MC-Unique: y6qr_XQ5O52A4CV1P-MZsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87785380450D;
	Thu, 30 Nov 2023 23:56:53 +0000 (UTC)
Received: from [10.22.9.192] (unknown [10.22.9.192])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 234422026D4C;
	Thu, 30 Nov 2023 23:56:53 +0000 (UTC)
Message-ID: <151f2b05-bcb7-4e69-866a-c76286383175@redhat.com>
Date: Thu, 30 Nov 2023 18:56:52 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking: Document that mutex_unlock() is non-atomic
Content-Language: en-US
To: Jann Horn <jannh@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231130204817.2031407-1-jannh@google.com>
 <2f17a9a6-5781-43ef-a09b-f39310843fe6@redhat.com>
 <CAG48ez1oXW=4MfQ0A6tthud-cvDZUTA+VB=jzu-HxvWzbj+X0g@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAG48ez1oXW=4MfQ0A6tthud-cvDZUTA+VB=jzu-HxvWzbj+X0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4


On 11/30/23 17:24, Jann Horn wrote:
> On Thu, Nov 30, 2023 at 10:53 PM Waiman Long <longman@redhat.com> wrote:
>> On 11/30/23 15:48, Jann Horn wrote:
>>> I have seen several cases of attempts to use mutex_unlock() to release an
>>> object such that the object can then be freed by another task.
>>> My understanding is that this is not safe because mutex_unlock(), in the
>>> MUTEX_FLAG_WAITERS && !MUTEX_FLAG_HANDOFF case, accesses the mutex
>>> structure after having marked it as unlocked; so mutex_unlock() requires
>>> its caller to ensure that the mutex stays alive until mutex_unlock()
>>> returns.
>>>
>>> If MUTEX_FLAG_WAITERS is set and there are real waiters, those waiters
>>> have to keep the mutex alive, I think; but we could have a spurious
>>> MUTEX_FLAG_WAITERS left if an interruptible/killable waiter bailed
>>> between the points where __mutex_unlock_slowpath() did the cmpxchg
>>> reading the flags and where it acquired the wait_lock.
>> Could you clarify under what condition a concurrent task can decide to
>> free the object holding the mutex? Is it !mutex_is_locked() or after a
>> mutex_lock()/mutex_unlock sequence?
> I mean a mutex_lock()+mutex_unlock() sequence.
Because of optimistic spinning, a mutex_lock()/mutex_unlock() can 
succeed even if there are still waiters waiting for the lock.
>
>> mutex_is_locked() will return true if the mutex has waiter even if it
>> is currently free.
> I don't understand your point, and maybe I also don't understand what
> you mean by "free". Isn't mutex_is_locked() defined such that it only
> looks at whether a mutex has an owner, and doesn't look at the waiter
> list?

What I mean is that the mutex is in an unlocked state ready to be 
acquired by another locker. mutex_is_locked() considers the state of the 
mutex as locked if any of the owner flags is set.

Beside the mutex_lock()/mutex_unlock() sequence, I will suggest adding a 
mutex_is_locked() check just to be sure.

Cheers,
Longman

