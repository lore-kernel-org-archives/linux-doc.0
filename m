Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DE2DA768;
	Sat, 22 Aug 2026 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787419731; cv=none; b=GN6K/v+0xYXwbEq+0WkIRQKfNspWz3IimRr5Q57EuOSryyNJLJfZeuaQVQGLwQHcjlt0kIQOD1S0Hro2IawWgFp7ZAkeMwetTgvkZ5Z38SeenXYdAJLAYlxWQSI0BlPsVzVSJYUZzyDuI8Ohsn2Ps606ofRyCCVJ5CFAURyK8kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787419731; c=relaxed/simple;
	bh=IK+bclge9RPuDPD+uon02Ux8Hc+ZuwQc1HMBuJ5+1+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LIG6uO38wusBCqfpQlf2t7DlFPWB1j6+iP9rDBlyG80LoE5yTkbDgrOslMNDCu63dYlgL8c/90hO098RCwIwWlKjsWbh/QPo+SdpGCT6sKwybPoYZDcTjs77pberIsKfVi8DMWFQIJ7HWDQShSYzW7rM6Vu1y7f/kQWWEyJe21I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=48w8L0o5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="48w8L0o5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gN4XRXE0lfmrhPhD6X81QWm6Sm+hsXWnittn4zjEBVY=; b=48w8L0o5kfc/9nUadS0L8bak+f
	k4y0pny6Gzy4/yxxeNEYIrMh3I4D8fds/yrqb3L8HLR7AASNKRYkfV3AvlPHXfYwLichcOaeQdKjA
	rjKfzSCdHMp+4iATt/sXwwyyaeGcShvTUsPpCL7KpfxyX+9W1wOKRPnd8dJkPCkde40lmsWbca4lF
	5OBe/sstFWpybfhy7Azcz4A3WtfKzIlIJLsF1cgnbAq6KnPpHJp1TP+w06/5gIkYKafn+J3V25wre
	k+HFw+9F3Fp9R0W0CW4E0fCHwn75lEBcXVXpMb0yXy8vYrrGP2Umsqo0P6dmtoxN9gGK9WvGObKNQ
	zvPsfqgw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxpWT-0000000Egln-1sNp;
	Sat, 22 Aug 2026 17:28:49 +0000
Message-ID: <f5c01293-8d88-45b3-bd9d-7dc6d39b63b5@infradead.org>
Date: Sat, 22 Aug 2026 10:28:48 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] docs: this_cpu_ops: Fix SRCU helper names
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-6-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822121651.1559-6-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 5:16 AM, Karl Mehltretter wrote:
> Use the actual srcu_read_lock_nmisafe() and atomic_long_inc()
> helper names.
> 
> Fixes: df0cee43114b ("docs: Improve discussion of this_cpu_ptr(), add raw_cpu_ptr()")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/this_cpu_ops.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/core-api/this_cpu_ops.rst b/Documentation/core-api/this_cpu_ops.rst
> index 533ac5dd57507..367706d1714b1 100644
> --- a/Documentation/core-api/this_cpu_ops.rst
> +++ b/Documentation/core-api/this_cpu_ops.rst
> @@ -150,10 +150,10 @@ preemptible code are addressed by raw_cpu_ptr(), but such use cases need
>  to handle cases where two different CPUs are accessing the same per cpu
>  variable, which might well be that of a third CPU.  These use cases are
>  typically performance optimizations.  For example, SRCU implements a pair
> -of counters as a pair of per-CPU variables, and rcu_read_lock_nmisafe()
> +of counters as a pair of per-CPU variables, and srcu_read_lock_nmisafe()
>  uses raw_cpu_ptr() to get a pointer to some CPU's counter, and uses
> -atomic_inc_long() to handle migration between the raw_cpu_ptr() and
> -the atomic_inc_long().
> +atomic_long_inc() to handle migration between the raw_cpu_ptr() and
> +the atomic_long_inc().
>  
>  Per cpu variables and offsets
>  -----------------------------

-- 
~Randy
