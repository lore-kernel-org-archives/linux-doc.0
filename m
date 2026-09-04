Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A72446047
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 09:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513907; cv=none; b=TzPZF554RjV8iJJOaQgFoZMEzxl0Xkpl5ulJ/EUObegw1tz5MPAluOFbb9MZmiuqx6DQiqkQrVEUvh40YMp2UylLXiyl0Nk42Oe7AfDBu7bzN37+JLziCzsUaySMDivaNZUjVcdCOakKsc/NEaSow+lHNxRi6+QYsLL9sms6Ntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513907; c=relaxed/simple;
	bh=2X6NTd5o5cahP7ikmbjYlSQ9HSpozpUrhg4lY0w+n/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cl37FoXhK4UhJA5oqxWJEK2H76PjlFJP5NmIZ6cwg3GnlVed22Muu+o4vy568h6s52xcC/Q7Ly4W4r2eeX5vyO3e8ibJRiOHgC26lDYEGbkS4dxVYf568rJ2R1EUHwBI93zeBB40JakaGs/m21pzLZHq9bdp8RIOS9SrhFYnWoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PmqGs3Jf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PmqGs3Jf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so8330655e9.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788513903; x=1789118703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juEQFS8o8HO1Is63IJWO2O6D58EgoESYis0VW0w9IIA=;
        b=PmqGs3Jfjcm9RsIObXqIelgKvAwX3JWpJvG+mRoBbpCUVMAZkBfkukImAGg6duqEXF
         2/NotoUTM9I9ejF13/4eUmF3m5xFuBTTNIQi6wWO8Ex6PoPY1PbHzGYW13x8Ee5jKIJf
         5DkcdCWxjvwqaS//asktGFgdKxwZf7T1amMonkktp2BydnZW87DoFc3k9M5a73/vYknx
         RkV0UK3cJAk0qkF8uOGpFm4bjoWrn0gu/1rVkutXIXFWouC6GlpfoSv+exiWDmCmHzM3
         p58D6orPCFIJo/yLxXr0vvqLQvARpXLvsbNvlBN+yQ+Xdpu1OWofk+WziZClvMyDfYD2
         jSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513903; x=1789118703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juEQFS8o8HO1Is63IJWO2O6D58EgoESYis0VW0w9IIA=;
        b=JnmNDJoAY1bMp5vbMh4qi+R1sr1PwPsyJtc7TJzmrdIYHQTyzoHlkKF6zmnZnKahPO
         JBVE66za6qsTLUdaQq1X0Ei0OZblYCRy31q/J5w88bPAzok/PkePePlA+g9lEPKP1Koz
         eyUipV9tlTgloWKSGxX4Vu5GSoAAmJ2UVOgztb5lAMBoUBV8hAhS0ThcbdzV/OLLUqZk
         9enHDYIDNZ6c770ynJnBIJ9DESH+bp9kN0gBHTBSwJZCHn4hIQfT/mQPScwVsZaGbOxf
         LkYJAMOUYWEpp2mRLFN5ElPgf20pGCpQXTCzJ4dKxL0FcwD+GmK7sl5F4dzXEy5MQlCe
         6irg==
X-Forwarded-Encrypted: i=1; AKwUvByFlzUBivPzlAd7x/XWE22lhe9VfPraIO3NTtDFF/107N5C474SF3CFGX2EUNwnXOkfzhqVwzlSaAE=@vger.kernel.org
X-Gm-Message-State: AFuF++kj975Yw0/ODL8ODBfEz5zsT6R3+925c9mJIjlgv9dO83dswDB4
	Easf4Iz1Wsw8PFrp7o+6gaA/VWyl354cMojNCEJE5ecqR+B9my18VODpFAHPboJF8J4=
X-Gm-Gg: AYBFou15W6DmNif+/5R7PCcj4l9qK1XngD9g2aYfR87UiTs3GJLeW6ZsFDUeJ3CAGTq
	1BA58Ud17pvpoBcjq9muf204YOVQf+hgvGb6qWCe6bexZ5omHLRBrX5Oj5Ce4JCqxxM3FpA2fzJ
	rTa3z9MZQCgnL/7iWFXMfI16mNW5j6jtYnjRA+BXTQdeCDYOH0utVBYOuQBKk0MzTo7CcCqbHFA
	f6ktiYh4p0VyHlnQDyc6JRRNTgSyHq/W7iQ+34OqZxCSCh5srxc7Z35QiWra57BagJHYf8qXZuC
	0zH53zMYyXnvCJ7fV0NqGsosR4uKGFNzx+2Px2tWoyF8faYQ5+SDvHkFvqQAKAz/ReHlZ+GZ7zI
	TRNw7y9emCbdX1M38DmZ8jue0Gs+jgnoCmtOVxxf8HgtIPhKi6MNTKokYOofjmMpE4Kx69mC2Ix
	qM40pT1zbdHeOTDUCKWsyQm2Actc3OHtQqpb0WryM9pgE9h+zjMu859nAMPPvu+Fr2lZCs2iQ5L
	sRcC0GgSwEb9uVClHugxPFmuMzDMB6RgJs=
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr44304815e9.10.1788513903166;
        Fri, 04 Sep 2026 02:25:03 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm52989345e9.6.2026.09.04.02.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:25:02 -0700 (PDT)
Message-ID: <a79a6a06-cc48-4036-882d-95e9b4cc01cf@suse.com>
Date: Fri, 4 Sep 2026 11:25:01 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] module: pull out add_taint_module() to be public
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
References: <20260904-bind_taint-v3-0-30025465f38a@linuxfoundation.org>
 <20260904-bind_taint-v3-1-30025465f38a@linuxfoundation.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260904-bind_taint-v3-1-30025465f38a@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 7:10 AM, Greg Kroah-Hartman wrote:
> Other kernel code might want to call add_taint_module() so pull it out
> and make it global.  If modules are not enabled, this defaults to a call
> to add_taint(), so all is fine.
> 
> Reviewed-by: Johan Hovold <johan@kernel.org>
> Tested-by: Johan Hovold <johan@kernel.org>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  include/linux/module.h | 10 ++++++++++
>  kernel/module/main.c   | 16 +++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 96cc98568eea..f6f90cd88f15 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -29,6 +29,7 @@
>  #include <linux/srcu.h>
>  #include <linux/static_call_types.h>
>  #include <linux/dynamic_debug.h>
> +#include <linux/panic.h>

Note that I'm working on cleaning up linux/module.h to reduce its
preprocessed size. The main motivation is to shorten the compilation
time of all the small *.mod.c files. Since linux/module.h already
includes linux/panic.h indirectly, adding this include explicitly seems
fine to me for now. In the future, I think we should introduce something
like kernel/module/stubs.c where the CONFIG_MODULES=n variants of
add_taint_module() and other similar functions can live without bloating
linux/module.h.

>  
>  #include <linux/percpu.h>
>  #include <asm/module.h>
> @@ -770,6 +771,9 @@ static inline bool is_livepatch_module(struct module *mod)
>  
>  void module_for_each_mod(int(*func)(struct module *mod, void *data), void *data);
>  
> +void add_taint_module(struct module *mod, unsigned flag,
> +		      enum lockdep_ok lockdep_ok);
> +
>  #else /* !CONFIG_MODULES... */
>  
>  static inline struct module *__module_address(unsigned long addr)
> @@ -877,6 +881,12 @@ static inline bool module_is_coming(struct module *mod)
>  static inline void module_for_each_mod(int(*func)(struct module *mod, void *data), void *data)
>  {
>  }
> +
> +static inline void add_taint_module(struct module *mod, unsigned flag,
> +				    enum lockdep_ok lockdep_ok)
> +{
> +	add_taint(flag, lockdep_ok);
> +}
>  #endif /* CONFIG_MODULES */
>  
>  #ifdef CONFIG_SYSFS
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index d0e1e0bd2ad0..444d990c9983 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -191,11 +191,21 @@ static inline int strong_try_module_get(struct module *mod)
>  		return -ENOENT;
>  }
>  
> -static inline void add_taint_module(struct module *mod, unsigned flag,
> -				    enum lockdep_ok lockdep_ok)
> +/**
> + * add_taint_module: add a taint flag if not already set for a specific module
> + * @mod: pointer to the module that caused the problem
> + * @flag: one of the TAINT_* constants.
> + * @lockdep_ok: whether lock debugging is still OK.
> + *
> + * If something bad has gone wrong, you'll want @lockdebug_ok = false, but for
> + * some noteworthy-but-not-corrupting cases, it can be set to true.

Nit: The final paragraph is mostly copied from the description of
add_taint() but I don't think it is quite right. The parameter name
should be lockdep_ok, not lockdebug_ok and the values are
LOCKDEP_STILL_OK / LOCKDEP_NOW_UNRELIABLE, not true / false.

I suggest updating this part for both add_taint() and add_taint_module()
to something like:

 * Use @lockdep_ok = LOCKDEP_NOW_UNRELIABLE if something serious has gone wrong.
 * For noteworthy but non-corrupting cases, use LOCKDEP_STILL_OK instead.

> + */
> +void add_taint_module(struct module *mod, unsigned flag,
> +		      enum lockdep_ok lockdep_ok)
>  {
>  	add_taint(flag, lockdep_ok);
> -	set_bit(flag, &mod->taints);
> +	if (mod)
> +		set_bit(flag, &mod->taints);
>  }
>  
>  /*
> 

Otherwise, this looks ok to me. Feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
