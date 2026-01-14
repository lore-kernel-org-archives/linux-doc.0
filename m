Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD513A1E6C;
	Wed, 14 Jan 2026 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406862; cv=none; b=BS+0T0IhWhGT8OKUAghfXF6nL0t78xSZGzdZGjF6XTm8mCOZ6KUlrlRTLgbg4UAVg7D42OK8q4LOJH0u/YMYESvsQPIjV8a9J1N/IbnEsOMK4+Cox16vFYP5qskt/7nJ1gN64QIo5r+wtqkF1CnQzg/4ZW6hWzdVaVqf6mqzEcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406862; c=relaxed/simple;
	bh=WnSXUAnhOG3FSmZ1JYqLHBMBmUzUH8YS1OrBbRH+0EQ=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=qBd6fc1Pa6BYvwxp5V9p9FsYxorIysSc9htHpORApwMuRktfEbYVX9fIo6uKhPMYG9c1FkwyjL014JDOhs6nh9Wt/NOkPRQk7rQRD4VuLbjpjLO0IPgiNz+o2l/EH5rtLHfNyciJoQneYjNif9oCQ8U5XL39JISy6XlVRS6b+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4drrc44CmCz501bR;
	Thu, 15 Jan 2026 00:07:32 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 60EG7VYC011669;
	Thu, 15 Jan 2026 00:07:31 +0800 (+08)
	(envelope-from fan.yu9@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 15 Jan 2026 00:07:35 +0800 (CST)
X-Zmail-TransId: 2af96967bf478d7-6d081
X-Mailer: Zmail v1.0
Message-ID: <2026011500073527739u8ZCgcuiQ9Ej-uQVS1s@zte.com.cn>
In-Reply-To: <202601141934036563c-MXYWMY4VX0grNNmdA_@zte.com.cn>
References: 202601141934036563c-MXYWMY4VX0grNNmdA_@zte.com.cn
Date: Thu, 15 Jan 2026 00:07:35 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <fan.yu9@zte.com.cn>
To: <wang.yaxin@zte.com.cn>
Cc: <akpm@linux-foundation.org>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gZGVsYXlhY2N0OiBhZGQgdGltZXN0YW1wIG9mIGRlbGF5IG1heA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 60EG7VYC011669
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: fan.yu9@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Thu, 15 Jan 2026 00:07:32 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6967BF44.002/4drrc44CmCz501bR

> bash-4.4# ./getdelays -d -t 200
> print delayacct stats ON
> TGID    200
> 
> CPU         count     real total  virtual total    delay total  delay average      delay max      delay min       max timestamp
>                45      176000000      181535534        1429077          0.032ms     0.418387ms     0.124835ms 2026-01-13 12:38:39
The output shows "max timestamp" which could be confusing. Consider 
renaming to "delay max ts" or "max delay timestamp" for clarity.


> @@ -87,6 +88,7 @@ struct task_delay_info;
>  struct task_group;
>  struct task_struct;
>  struct user_event_mm;
> +struct timespec64;
In include/linux/sched.h, you added `struct timespec64;` declaration
which breaks the alphabetical ordering rule mentioned in the comment.
/* task_struct member predeclarations (sorted alphabetically): */


> @@ -435,6 +437,9 @@ struct sched_info {
>       /* When were we last queued to run? */
>       unsigned long long              last_queued;
> 
> +     /* Timestamp of max time spent waiting on a runqueue: */
> +     struct timespec64               max_run_delay_ts;
> +
>  #endif /* CONFIG_SCHED_INFO */
>  };
Adding struct timespec64 fields to sched_info changes its size and 
alignment, which affects task_struct layout. While this is acceptable for
internal structures, please ensure there are no padding issues.


>  void __delayacct_wpcopy_start(void)
> @@ -286,7 +296,8 @@ void __delayacct_wpcopy_end(void)
>                     &current->delays->wpcopy_delay,
>                     &current->delays->wpcopy_count,
>                     &current->delays->wpcopy_delay_max,
> -                   &current->delays->wpcopy_delay_min);
> +                   &current->delays->wpcopy_delay_min,
> +                       &current->delays->wpcopy_delay_max_ts);
>  }
> 
>  void __delayacct_irq(struct task_struct *task, u32 delta)
You added timestamp fields for IRQ delays but doesn't update 
`irq_delay_max_ts` in `__delayacct_irq()` function.


> +static const char *format_timespec64(struct timespec64 *ts)
> +{
> +     static char buffer[32];
> +     struct tm *tm_info;
> +     time_t time_sec;
> +
> +     /* Check if timestamp is zero (not set) */
> +     if (ts->tv_sec == 0 && ts->tv_nsec == 0)
> +             return "N/A";
> +
> +     time_sec = (time_t)ts->tv_sec;
> +     tm_info = localtime(&time_sec);
The `format_timespec64()` function use the non-thread-safe `localtime()`
and a static buffer. Please use `localtime_r()` instead and consider
passing a buffer as parameter.


Best regards,
Fan Yu
