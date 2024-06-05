Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378CD1946CB
	for <linux-doc@vger.kernel.org>; Wed,  5 Jun 2024 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717579946; cv=none; b=Lu3ImoPzAqd2/zmvFCTdPRUqfhYIgv4XXpVCOsCWTHbvakzGYNQV1l7G8GjBu/ihcIvTIWmbc9cd+SYhrnDExpaQva+Mhk824cGSXW8gZe5Tfs2N8ZQzaajk7MIUfzcHxShsXdWuLxaKIHQAk8PxgTBtEtLaZdDaC/2v6x1s8Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717579946; c=relaxed/simple;
	bh=A/gOzPUwckRQSfrNHNR843u/F/x3yV4eQiL9bWvwnB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbAgXUz2xtmYDRwcQrUtYVckVOs2ZIMiEqYBnoeyEhjiW51gFczFoqFgj6DRnF+WskU8ZmGD/BWX2EG8KeLQKjtHGhL+eiY3VM7QZCtWidrW2QJD/A+m6Rq8LqRVdD49yaHg1nN5nlyu5WccctEmnGSybWOJ6Ax2iGfAJOXXvlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iZh0mX6a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iZh0mX6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717579944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EIHWoHv/QvLBTsW9LF2D/X7toxaXXwp5mTAPZT4vSL4=;
	b=iZh0mX6ap2my4ZKO6Ma6Gzw7TMiKqTnQZj6k3jdn3NUvhUjqJHtDK1ivvz2BFEVQO9aFVX
	wXf4TnSMpmtB934u0F14f3DM0do271BaUZ4mR4jWar1qqIi03tATMOuBp9xFIUJAAPvPO/
	lJeWcFuW3A6GVpYpVa0WDHcH/OD5fqE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-oszDWSLUMIiQ0iP48kfWbQ-1; Wed, 05 Jun 2024 05:32:23 -0400
X-MC-Unique: oszDWSLUMIiQ0iP48kfWbQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-795200bb8e4so147212085a.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Jun 2024 02:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717579941; x=1718184741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIHWoHv/QvLBTsW9LF2D/X7toxaXXwp5mTAPZT4vSL4=;
        b=n7cRF18JygXKyTNvv98wl+v+H9PjdthMX17Kx0VOw47BgINn8e4aUbO7xzm+et7m6J
         W1obQ4YEgNLlvLIMmmABeiuHYXQnM0KXbH3iGkZ+XZlZl4ksBeaDIGQ24HNV9bOq4FtD
         mh5TVGaX+vutCGHPl+xG5UCKHJqjWCkKoK9uNdEu/LUlp3qiLteQ79Eh7uIvlwsPCLWz
         3IDrx3AFGmSbMPOaFXTP9YB2Zx8ogQrvbLFwPKJdfc+22xKUecdRP/hVx/ykfbdDXGtA
         1EvKvK+60sV01ZjiOFm83NfNIgJJgDziMTLbnHyVAIGz2RBos5zZvIg4Az4NFMCrde5r
         yRcA==
X-Forwarded-Encrypted: i=1; AJvYcCXhoqV/4OjrneBQMAD5D7pCYG/vMYN9tu+DDImmVq2qJBRQGUnmuHOZjs1RCSpWb+BVbk0MfeplOY9QIWPg2Q57W2nbLy3LXoWC
X-Gm-Message-State: AOJu0Yzfoa+1otNkdcgjaHrKKf9DvZ/OytPpP+EvRHwXqKA4Q/igRO7u
	jP5TPJ75bkftWVvXCIdurdIvoHuAih8AN1JqceaLwNvbeGu02Vrc+GyEB9mxFIyyt9K69onoZ88
	ta65P+0j4lGYLOKdYnP1Id6sWm7bdXDoa5wDRCGjIZPdvFc6zXf6mlqWHTIC8SXx1Vg==
X-Received: by 2002:a05:6214:3a89:b0:6af:2676:1a67 with SMTP id 6a1803df08f44-6b02bf749b2mr20745136d6.28.1717579941393;
        Wed, 05 Jun 2024 02:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5ikW1FE7KKc1M+K4oFqEtBv+CXhwGrhdL4tT32ka2r1ldJIrtTLooEIM1RfE/m26z2wnCxA==
X-Received: by 2002:a05:6214:3a89:b0:6af:2676:1a67 with SMTP id 6a1803df08f44-6b02bf749b2mr20744926d6.28.1717579941039;
        Wed, 05 Jun 2024 02:32:21 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.3.168])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4b405e14sm46658136d6.80.2024.06.05.02.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:32:20 -0700 (PDT)
Date: Wed, 5 Jun 2024 11:32:15 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sreenath Vijayan <sreenath.vijayan@sony.com>,
	Shimoyashiki Taichi <taichi.shimoyashiki@sony.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	linux-doc@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Xiongwei Song <xiongwei.song@windriver.com>
Subject: Re: [PATCH printk v2 00/18] add threaded printing + the rest
Message-ID: <ZmAwn3pc5wpyA8fm@jlelli-thinkpadt14gen4.remote.csb>
References: <20240603232453.33992-1-john.ogness@linutronix.de>
 <aqkcpca4vgadxc3yzcu74xwq3grslj5m43f3eb5fcs23yo2gy4@gcsnqcts5tos>
 <875xunx13r.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xunx13r.fsf@jogness.linutronix.de>

On 05/06/24 10:15, John Ogness wrote:

...

> Yes, that probably is a good candidate for emergency mode.
> 
> However, your report is also identifying a real issue:
> nbcon_cpu_emergency_flush() was implemented to be callable from
> non-emergency contexts (in which case it should do nothing). However, in
> order to check if it is an emergency context, migration needs to be
> disabled.

I see.

> Perhaps the below change can be made for v2 of this series?

Yes, this seems to cure it.

Thanks for the super quick reply and patch!

Best,
Juri

> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 4b9645e7ed70..eeaf8465f492 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1581,8 +1581,19 @@ void nbcon_cpu_emergency_exit(void)
>   */
>  void nbcon_cpu_emergency_flush(void)
>  {
> +	bool is_emergency;
> +
> +	/*
> +	 * If the current context is not an emergency context, preemption
> +	 * might be enabled. To be sure, disable preemption when checking
> +	 * if this is an emergency context.
> +	 */
> +	preempt_disable();
> +	is_emergency = (*nbcon_get_cpu_emergency_nesting() != 0);
> +	preempt_enable();
> +
>  	/* The explicit flush is needed only in the emergency context. */
> -	if (*(nbcon_get_cpu_emergency_nesting()) == 0)
> +	if (!is_emergency)
>  		return;
>  
>  	nbcon_atomic_flush_pending();
> 

