Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50507261C;
	Sun,  3 May 2026 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777819625; cv=none; b=Wx1xZwPKMQ78QV/ZgJimUuTKYfeUrnA7LEq3CP806mVRTy4a+OXmlE+snhHG1hVbIF65FUu8Drz4fC9vy2QFtDGux/xB2h/b8ojlI5SaMU7Ci0KOr4xN2llDaojjnk2pXSIDm94q6G4t65s5tlF86OTFxSoAsz+npVh5ddblpqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777819625; c=relaxed/simple;
	bh=fNr7CCGmNQKEsrULQIX6uC4o6Lw+jtTaQTp7cblunbM=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oDdD8C7DzjzAWBMO+GSs6P5VG3n+DxOxPqG7wezrJgcf6uLmI+PmNZcq2DxbT/phARR0hb2NVfY+xtiJ/Q+wwoo0acBCWYNpKbMwP0jKy4zW2OajLR1SGx3P4AQ6Bc2LQW64j01QoSHpDPC0u+VZq32xqP92yUWSbnjVX1aUo7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=a0+P/2g3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="a0+P/2g3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D9F1141084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777819624; bh=SMN2Eewx/CTAvp70lwaK6YexDNASPyDFGYWGrSggTUU=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=a0+P/2g3/27CNSDCL21UEikU8sTyrtGuXBnhQStcUfNL2gXlyw+PkKM6e598v+TWL
	 WWxm6OemisJkNBOjo7cQ0iVCsu3gzxIg6SRKvZbw62JFhcfg7ll24YukFLmv5lSUB5
	 dj1KPr2iPOQNZ/D7+N+LNkeJDOSquC3PDaNhETFb3YZTP7go3Uq6FRR+Nko+pKKr0A
	 Hn6BUv+QyXCu0Srm20NgGjps0W7x76fyBzkuNaBdf0NkrIvMB+RyTwGg7vE4M9XRk4
	 bf8MTCDZn9h71Zt6Txyc3bVOcn7aFnBBCcFXwZuQi4vPWUrSZoe+khfr6HuRZ575rO
	 0KIecm2hFkYJQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D9F1141084;
	Sun,  3 May 2026 14:47:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Ryan Cheevers <cheeversr0@gmail.com>, Costa
 Shulyupin <costa.shul@redhat.com>, Waiman Long <longman@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: housekeeping: Fix struct member access in code
 example
In-Reply-To: <20260501043855.980567-1-costa.shul@redhat.com>
References: <20260501043855.980567-1-costa.shul@redhat.com>
Date: Sun, 03 May 2026 08:47:01 -0600
Message-ID: <87wlxkczyy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:

> No such array housekeeping_cpumasks
>
> Fix to housekeeping.cpumasks.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/core-api/housekeeping.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
> index 92c6e53cea75..ccb0a88b9cb3 100644
> --- a/Documentation/core-api/housekeeping.rst
> +++ b/Documentation/core-api/housekeeping.rst
> @@ -99,7 +99,7 @@ the same RCU read side critical section.
>  A typical layout example would look like this on the update side
>  (``housekeeping_update()``)::
>  
> -	rcu_assign_pointer(housekeeping_cpumasks[type], trial);
> +	rcu_assign_pointer(housekeeping.cpumasks[type], trial);
>  	synchronize_rcu();

This looks actively wrong to me.  I think it should be:

  housekeeping_cpumask(type)

... Frederic ... ?

jon
