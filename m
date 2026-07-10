Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9152E7394;
	Fri, 10 Jul 2026 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711885; cv=none; b=IyDZ2auBBmuSjz/73HmkhCU086w6OCJ8pAQI7Jv+bLQQY4CG/gyyZThsPss78TqiWAFp5HDWbaYMnFAdeNcmCktC9x0Zg3l/NBsNVLcQgoAPj6ZJwGtUSy1WYU26xKfLxepU4aql6QnafPygv1sBEjB6OiHnj+7NiwuxKMrhDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711885; c=relaxed/simple;
	bh=ButKuriI7LihzXFT+dqUMD9RZxQ/IatSFJuZ4sFck8s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IFRO4qQAywMG+YmxLAgoDYCSR1hS2gtTaisdov5ozlxrtDWDqrIZftlyKitXDgyWg/d1Ym791EztfxmXZpO4xbpL1Bl85IjjLa/3ty+Ayg1oOK8NXyDpVAu8eSS1wYk2yprmPpk1z9p2854Vsyqj1I9WrJvst1cyaUQkgEz0/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fAJpSy6j; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fAJpSy6j"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AEE64108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783711883; bh=fV9XkOpSyRfws3/SSwUeN+jAeSJ2bBxyNAyKKif59G0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fAJpSy6jS2d05znennkIA1l+Vun9yjJCj3pUetyauissdJh5NIMw8sOHe0mDcboE0
	 6bgkNVXD1zoxRMba4UHeTmalRml+70Mp23Zvf7oLuZrACMPSYtMxRI31sGheyJdYfN
	 /dZDqABc6pcUIIRuqvsTPezj3aByRZP0oWUsvbgpUIrzCWIjBKSSGKW0/oS/4C/hcx
	 Ok1I3yA4npzrLtrqvHDCCfVEOhIZP7o0lZM26Flc9JdYKWpdsUrbTPaYs0e6VXsUrm
	 Zfuio2laGY6V/BOErWQn1voy1R2NHfkfmLvphNMFwG3Owc3nZx7I6/AQ8/uosgIiG9
	 p7N1/fE4So2Xg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7AEE64108A;
	Fri, 10 Jul 2026 19:31:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin
 Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/Documentation: fix code
In-Reply-To: <20260703115114.229848-3-manuelebner@mailbox.org>
References: <20260703115114.229848-3-manuelebner@mailbox.org>
Date: Fri, 10 Jul 2026 13:31:22 -0600
Message-ID: <87zezyk5f9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> checkpatch.pl returns 'trailing statements should be on next line'
> for this file. Do as told.
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> ---
> This is the only checkpatch-error in all of Documentation/*/*.c
> ---
>  Documentation/scheduler/sched-pelt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/scheduler/sched-pelt.c b/Documentation/scheduler/sched-pelt.c
> index 7238b355919c..38ff53dcf352 100644
> --- a/Documentation/scheduler/sched-pelt.c
> +++ b/Documentation/scheduler/sched-pelt.c
> @@ -25,7 +25,8 @@ void calc_runnable_avg_yN_inv(void)
>  	for (i = 0; i < HALFLIFE; i++) {
>  		x = ((1UL<<32)-1)*pow(y, i);
>  
> -		if (i % 6 == 0) printf("\n\t");
> +		if (i % 6 == 0)
> +			printf("\n\t");
>  		printf("0x%8x, ", x);

Applied, thanks.

jon
