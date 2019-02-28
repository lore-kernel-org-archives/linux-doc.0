Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 07A327D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Feb 2019 19:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfB1TKj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Feb 2019 14:10:39 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39330 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733274AbfB1TKj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Feb 2019 14:10:39 -0500
Received: by mail-qt1-f193.google.com with SMTP id o6so24827757qtk.6
        for <linux-doc@vger.kernel.org>; Thu, 28 Feb 2019 11:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+TfQWGMGs5ObBJodcOfCCLLfPFDT3yxUHkAF1a8U5pg=;
        b=l5RZhBdloG5SnuEpC7J80qco08NL6zfZAxkTcaznq32CSbl1Fl6HOIZVB1gb1Ig5GQ
         jfTPJz7YCH03JwzA0V2LbbykTqcoCFl5npJinI6Sap8KFNy9Q2Wl2JLj60qIBeQR3RsG
         IShrGDzKjjlNM3Uu7Z0Ze64W0J0mLEhX/+Uec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+TfQWGMGs5ObBJodcOfCCLLfPFDT3yxUHkAF1a8U5pg=;
        b=uBm8idI+CE5nqrS2e9/jag6Mfro/oKkD8YfF/uM7LKee5XUUJvUJUBpGxMLH6ZP7td
         GSdJLc3qK6sgQGtlWgKTfDf7CrqNn9bryu+D94x8zirElWtePHDbpKjj17/fz3U7Z/tB
         tYcqs4XWzzsxCs7zhc4gfEn3Q7sYP2r/tWRRsX0qiXtvvbdriQgVOaHqgMfj6gzuD3cb
         Ilb0Lrz/lASZlJxqTtnXDctUrGtAREVx1THXTjqEUgWHAKKYvTvJGiK66FjLMOsnzbiR
         Dusaxb3I02xYAEoQ53/NmwobKOtyVUz8pOeJABrKnFle7l+LRqJiZ0HUSkARd+dU4vvR
         3/+A==
X-Gm-Message-State: APjAAAVC8tkCxZySBHvUibIc6zbEV8iD6izJT6Qvwmlv2PB1HT/HQhh+
        gfYUcFXrrkmn6zvDf9Q8+QlIOg==
X-Google-Smtp-Source: APXvYqy+TEco/RrLJg0x6DwgujHE/KEmoQqB+GMeGU4Nek5SZHYM7shD34UwjLyEuaMVNk9ZcC2VqQ==
X-Received: by 2002:a0c:d121:: with SMTP id a30mr657202qvh.0.1551381038318;
        Thu, 28 Feb 2019 11:10:38 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id n21sm11413235qtl.97.2019.02.28.11.10.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 11:10:37 -0800 (PST)
Date:   Thu, 28 Feb 2019 14:10:36 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     Qais Yousef <qais.yousef@arm.com>, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, dancol@google.com,
        Dan Williams <dan.j.williams@intel.com>,
        gregkh@linuxfoundation.org, Guenter Roeck <groeck@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-trace-devel@vger.kernel.org,
        Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        mhiramat@kernel.org, paulmck@linux.vnet.ibm.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        rdunlap@infradead.org, rostedt@goodmis.org,
        Shuah Khan <shuah@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, yhs@fb.com
Subject: Re: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
Message-ID: <20190228191036.GA203889@google.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228135343.23kzkilig3bsioov@e107158-lin.cambridge.arm.com>
 <20190228144759.GA156098@google.com>
 <b100f0a2-7966-b6a2-dcd5-ca11abe57ead@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b100f0a2-7966-b6a2-dcd5-ca11abe57ead@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 28, 2019 at 05:04:59PM +0100, Dietmar Eggemann wrote:
[...]                      ^
> kernel/kheaders_data.h:1:1: note: in expansion of macro ‘KH_MAGIC_END’
>  KH_MAGIC_END;
>  ^~~~~~~~~~~~
> kernel/kheaders.c: In function ‘ikheaders_read_current’:
> kernel/kheaders.c:38:12: error: ‘kernel_headers_data’ undeclared (first use
> in this function); did you mean ‘kernel_headers_data_size’?
>             kernel_headers_data + KH_MAGIC_SIZE,
>             ^~~~~~~~~~~~~~~~~~~
>             kernel_headers_data_size
> kernel/kheaders.c:38:12: note: each undeclared identifier is reported only
> once for each function it appears in
> kernel/kheaders.c: In function ‘ikheaders_init’:
> kernel/kheaders.c:31:10: error: ‘kernel_headers_data’ undeclared (first use
> in this function); did you mean ‘kernel_headers_data_size’?
>   (sizeof(kernel_headers_data) - 1 - KH_MAGIC_SIZE * 2)
>           ^
> kernel/kheaders.c:57:23: note: in expansion of macro
> ‘kernel_headers_data_size’
>   proc_set_size(entry, kernel_headers_data_size);
>                        ^~~~~~~~~~~~~~~~~~~~~~~~
> kernel/kheaders.c: In function ‘ikheaders_read_current’:
> kernel/kheaders.c:40:1: warning: control reaches end of non-void function
> [-Wreturn-type]
>  }
> 
> 
> The reason for me to stay on v4.20 is that with v5.0-rc8 I don't have ebpf
> 'raw tracepoint' support any more on my arm64 board. But this issue is not
> related to your patch though.

I'm glad mainline fixed your issue though as you said in the other thread ;-)
I will refer to your email here later when doing backports if I hit the issue.

> Another point which supports the functionality your patch provides is the
> fact that maintainers don't want to see new TRACE_EVENTs in their code. So
> here your patch comes handy when using ebpf for tracing in embedded
> environments.

Yes, I agree. One can also use the series to build custom kernel modules
which can also contain tracepoints in their own right. Glad you also find it
useful. I will CC you on it for next spin.

thanks,

 - Joel

