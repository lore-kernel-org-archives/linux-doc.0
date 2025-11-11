Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411843491E8
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873442; cv=none; b=cNGFwqNJ8/SBGFCOfl21HqydDWKUQr7JLW7VEW+FUg+r3MVwKUeDGkWrDiqC5L7gzDL9/UHwy3k8lvn0TGyBskpZjpMJtn10jkpaQkcijophoh63GjoQve9lrQ1wpamf+zDGRdkAXCKMvbnNEpQdILUyQ9QK8+ibvVI3ooNiGoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873442; c=relaxed/simple;
	bh=ftiPYvx9c/Uo7f5Ce7Yzxcg1QUwJlxqYP2TiKTcKQ1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/zriGEJ01B7NGwACfDo/Ty3Jm1uPLcEB20zWl68TlISi+ptAzW4Ot9Bm1qpTU5ldz/AWKQ4ZUROv7eKJxtIFmyqvZ61XuPw9WGT8jYaBN6zL54RIYrLZB8Vl633FtoriEEE2FKCfbVcn8N8pqvDA2n++Fc8KkYBC1SdbiI+oXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wr3VZuHa; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wr3VZuHa"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b73161849e1so387984866b.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 07:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762873437; x=1763478237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wi+5dbYm5JIgaP/t7Nx547fFCD450JcmYNBqfgVm42E=;
        b=Wr3VZuHacnX19+kU8w1BvT68Xtso8bA8jlTRBVCYJ1QSuvBs90fW594AJGYD/sbcE7
         zxfKSkMaz4WysTITq4/7YriC+cQSmhKybush57z8b7uRuaTcbHBANmIDfT/kvFehUGbD
         sa2WDGvCupBaFLVNib0xm7M88OsMK+KVbkGvRv4wvS4KHLvTYQG7EePJTLqW1aHI85zL
         INKcGCRRzF6J7N7BmrhtW9M7UhXv6JUTmkrQzq4x8G7ZqU0H7eSS+ojS9/DTLkAN67Bj
         1wDhCFVl0BccErhxh7JzXNm1WChW2BMRTVSKywdBU4Q8uuZOXEejQRVPSvQONAdw7x2q
         TGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873437; x=1763478237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi+5dbYm5JIgaP/t7Nx547fFCD450JcmYNBqfgVm42E=;
        b=dUt60HHpjUUK2QbxinbjuqZDdY6e+aKax0+oyP6eQWHLCeZBv311FG4VVoOkCE9voO
         qkGMKqB3fd9iU3CTg+KFuw94wsNwVieIau0gguhtvLBSvvXooZ9dxn2vyardreNNzfN7
         mC7gN4uRqnRbo+giAjRw185Sd4g5/M05VSMU57I9xFygOumAz/DYqILjX1uB5ib7edpx
         9Ima3S+xrEgHDgfYxgoeYfw9+QOXpzmORXufV8OwQYtT8QEtEMCTAjEmhSbszBlNV6ke
         KC+Bm2s4Kjg0zdBnpW4xndPOen9RK24dDes6XAscXwq/6/3Kzel/QAlCDe3Ju25AxCwq
         lEZg==
X-Forwarded-Encrypted: i=1; AJvYcCVdfF/pETBB8TPsveE3LtLCJ0fAvD3QsIm0nWGCi0YltL7t+FEl6+qm+HyCcqMTzbr3SitTKoykKi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy428ow6dDfapLZYXV33Lu5gcLP2RIVIPLBHJ53CjQVxL/aUNTk
	MFEMkYDLoAgiUG0NEa1Su6Pp85EuB5AbeSIyoIK1UkFsEfNVDhuj4SVPnTdvzexmAnQ=
X-Gm-Gg: ASbGncuh4NYD0zVGddtLuAEsWOiCYnaG+v/L5pAMKnnqkEX3ZexPzmwWhpNf6qkqhTC
	fwh7FMGxvHnX7oPcOXpU50dblVyuwnYnqG22taOa7cG80+sPBbeF3WgPkECwpDPgvD+nc/ln+gH
	EJpocxyWPc5U1bp3KFeqQsmqdBaSvgKpAu7uOYomBeK4KLdwPvqcBDdKcMR8ck2JKZxqBpWOOAm
	sa8oHUXIzWgX8HNfdluXCLD8GsU2N7SleYGix6SeVnHnqmx/L3Z06IK6ccNvms4m8SFPg48QAT0
	NXnknDWRNTUu2vhoscjCZAN8LIVppZYcg57LS9OBRz/TSyi4EvxLnalU5SnGgmdYskgRMwmjKM6
	0JqTb/IzAsoPDeSAsxPmG/0G2SFPYZIvZiTNOIyVkf+p4VivaDbyY1ckIiC2aBYiZodRnyZQk/y
	MYGUlPShaYeYYjRsGQbA==
X-Google-Smtp-Source: AGHT+IGWUxoIalLG5xLZllX+zCkekRXIo7e3xykwl2APS2wZQPGHNLqastwX+dw6XlJnfwm9Fe+bGg==
X-Received: by 2002:a17:906:f590:b0:b71:cec2:d54 with SMTP id a640c23a62f3a-b72e04e4ebemr1306841566b.57.1762873437355;
        Tue, 11 Nov 2025 07:03:57 -0800 (PST)
Received: from pathway (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbc9656sm1374243166b.7.2025.11.11.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:03:56 -0800 (PST)
Date: Tue, 11 Nov 2025 16:03:53 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vitaly Lifshits <vitaly.lifshits@intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sagi Maimon <maimon.sagi@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 01/21] lib/vsprintf: Add specifier for printing struct
 timespec64
Message-ID: <aRNQWc8O2y94zoj8@pathway>
References: <20251111122735.880607-1-andriy.shevchenko@linux.intel.com>
 <20251111122735.880607-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111122735.880607-2-andriy.shevchenko@linux.intel.com>

On Tue 2025-11-11 13:20:01, Andy Shevchenko wrote:
> A handful drivers want to print a content of the struct timespec64
> in a format of %lld:%09ld. In order to make their lives easier, add
> the respecting specifier directly to the printf() implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/core-api/printk-formats.rst | 11 ++++++++--
>  lib/tests/printf_kunit.c                  |  4 ++++
>  lib/vsprintf.c                            | 25 +++++++++++++++++++++++
>  3 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 7f2f11b48286..c0b1b6089307 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -547,11 +547,13 @@ Time and date
>  	%pt[RT]s		YYYY-mm-dd HH:MM:SS
>  	%pt[RT]d		YYYY-mm-dd
>  	%pt[RT]t		HH:MM:SS
> -	%pt[RT][dt][r][s]
> +	%ptSp			<seconds>.<nanoseconds>

I know that that there was no good choice. But I am curious.
Does the 'p' stands for some particular word, for example, "plain" ?

I do not want to start bike shedding but I think about
using 'n' as "number".

> +	%pt[RST][dt][r][s]
>  
>  For printing date and time as represented by::
>  
> -	R  struct rtc_time structure
> +	R  content of struct rtc_time
> +	S  content of struct timespec64
>  	T  time64_t type
>  
>  in human readable format.
> @@ -563,6 +565,11 @@ The %pt[RT]s (space) will override ISO 8601 separator by using ' ' (space)
>  instead of 'T' (Capital T) between date and time. It won't have any effect
>  when date or time is omitted.
>  
> +The %ptSp is equivalent to %lld.%09ld for the content of the struct timespec64.
> +When the other specifiers are given, it becomes the respective equivalent of
> +%ptT[dt][r][s].%09ld. In other words, the seconds are being printed in
> +the human readable format followed by a dot and nanoseconds.
> +
>  Passed by reference.
>  
>  struct clk
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 3f99834fd788..fdd06e8957a3 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2464,6 +2488,7 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
>   * - 'g' For block_device name (gendisk + partition number)
>   * - 't[RT][dt][r][s]' For time and date as represented by:

We should add 'S' here as well:

   * - 't[RST][dt][r][s]' For time and date as represented by:

That said, I am not sure about the optional '[p]'. We could
either do:

   * - 't[RST][p][dt][r][s]' For time and date as represented by:

or

   * - 'tSp'	For time represented by struct timespec64 printed
		as seconds.nanoseconds
   * - 't[RST][dt][r][s]' For time and date as represented by:

>   *      R    struct rtc_time
> + *      S    struct timespec64
>   *      T    time64_t
>   * - 'C' For a clock, it prints the name (Common Clock Framework) or address
>   *       (legacy clock framework) of the clock

Otherwise, it looks good.

Best Regards,
Petr
