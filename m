Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CA0175A6B;
	Wed,  8 Jul 2026 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469722; cv=none; b=Cehrb2lWPlZ66Z9gVko9+ZTqXSfwrimIMZdvLQbELUP6dWzj2vGr/PVry/I+UZ6vaGzmPp8xG0Gq1ugUA6aFQsy/kW8Dzmt1k6cfUVfBX0AyR6GjtOzIWZKbOYojGzFlaPniE9ddCcbv1FSnDnCqEdR4U7W4rISw1GNHlYHQ4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469722; c=relaxed/simple;
	bh=c6mOd5Xexy++wyanEkc5J1rjAbH9Ibq2DT44NAKMWMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtmoaTJeONpA8Fe/8P06mBgSzBsXeKmxdJMt7+1gOgNl3r6w1vOpqIQld7By60nf2kNKUu3qlIyMxOWWlDiPAwYeerGP09W8skQYMBzh6nhAkiTSgBmtyLyK9Nq/sTrwijxkjRPhlVIOcsDN4wDCM/Jj6oVLOi6Xu3YdRkjIvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OpRIUlNH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OpRIUlNH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=yTHagoYMoy9xKfXCb9YvxyeFtXMp30EDeG+sZbxkGd0=; b=OpRIUlNHj2AVNXq/1XLyYsbFTo
	r+9K5JZVVlpJUqRJ4QsD2hV+OOuiZzcvx0iYKx0FNcpvQ+KnhEjrnkZDqX4xiX62Ff4qwMz7AsAFl
	5qDDWy3GWAumFfYHMXZ01sYVqP9IUi6KNzTXm2MU2dFp+myFyLvIt8J1vZ3OZVeWvI7EEkpBxKrmy
	Nrz5RJhVTIO2x5FeLpcGd0Sv3f3U0PQXkGooz0aGOk6Uk9G6VFPisdbgAhaj5/6iyY3WCJUWQyE+g
	iOe6PwbOdbmE7RobbueH8yy1eb/E+yQ8yIGcJh4zvoRLXcyTyQswAH+VD3xrNbZSGQ15hAnGTV+Ya
	ZWe/9kfQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whFwT-0000000G2wm-16Rx;
	Wed, 08 Jul 2026 00:15:09 +0000
Message-ID: <214b5333-3aa8-40ef-894f-92caec053001@infradead.org>
Date: Tue, 7 Jul 2026 17:15:08 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/Documentation: fix code
To: Manuel Ebner <manuelebner@mailbox.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703115114.229848-3-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260703115114.229848-3-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/3/26 4:51 AM, Manuel Ebner wrote:
> checkpatch.pl returns 'trailing statements should be on next line'
> for this file. Do as told.
> 

and the other instances of this check are split onto 2 lines.

> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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
>  	}
>  	printf("\n};\n\n");

-- 
~Randy
