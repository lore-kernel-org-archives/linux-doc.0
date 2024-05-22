Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37551B815
	for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716391099; cv=none; b=E9ArxYOuRmCGSILmazodk7XHlhVgmdKL7FTag/NWsDQaZEhFclPPh27DeOOA1HECiZVKwf3D8dgdv6wKmQDtduNvhs17IECqCrkI01S7INC7ke1sRboZNpo94TkPS9LdPECSkSBgr67K03Ihl7n04bSKdUoXMYpaVDnjAOMwUyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716391099; c=relaxed/simple;
	bh=sYIrj0Iso+GkGLJvhkjsCdF5mUygCRp/pk2z46+PRps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFYC2Gx3eTxg58E0poIstfjJxVrPrMz+TEGGmPYKcsChS2uXCGLaFDLpjgXRANFo2TBqTJ3/hzV1xAJYUWrhSCkKfcSm3CMxNOSe+dE/kFXuQG2v9UszcxABDUgnCmC+ZcgXPokTOF2wGL0awOnb8GS9aefiFXU4X7DYLUt/skU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O5agnHKn; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O5agnHKn"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a5a4bc9578cso980857866b.2
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2024 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716391095; x=1716995895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/VaHGLRs/J+Fd8zTYkJgbyVxa4bOKjtKO0wVzh6qgxg=;
        b=O5agnHKn6hK6uZz19BkSlwfKfZF/bIBLNaxr9/rZSo3TimocCvdv2jd/A22G9gotqU
         xOxscx4ry2cv57rz7lAwTy80hcRH+J1fDHzvME/d9Ou7ZvSAXU3rxWA9X+35LHg7Zz87
         pszvcsErJy/gdYhexy6WF2z8CJC8A833Y+0zXYEFSXs31UHMy0z8vL5rWiOx+PZIauM2
         zEkkijD9zzLgXf+M8lohCBGAkS+j3iz0mjxCAOIUkWA4SUCkxUxBJViasHYMY0UKOeGr
         J92K0nTT8TCMq77igMot+zOPlc4BHVuwg6+V5BZYVdrH8VP/k/xscQcz1p0iY9ygbHmc
         J/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391095; x=1716995895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VaHGLRs/J+Fd8zTYkJgbyVxa4bOKjtKO0wVzh6qgxg=;
        b=c+mHy4YdNOprhuC/eZ5jMdjfPPqORXZggIGSBKEbB4xs4XGdojBl0q3z9gITDOY2ch
         G+MYb3GKpu6+UJYxEaSaxGRJ14oUAXohi5/p4xq2T6DFA9x/5lc0O2o7WSq9Zqo5FRgp
         gJtGE7D+Q7m09eUn1RM0rdNKYK8+XO4Ob6rnLg5Rs1DRAXj3MYdq6yPFMqu6RilpevJS
         yOZ/t7QeDDkC1Vw7mdN7D0m9SSk1E39suwMndipyRoRZOHxii8CNjywWqmFiawyGGZBZ
         SYDGgSFbTiun02USEXfBXFrgAdQ7ErnVSaAca8GHBfmnJM9GrgNWxISUAtWsCC0EuD1x
         SNTw==
X-Forwarded-Encrypted: i=1; AJvYcCV/uNuM2oTu+y9ImuF9/hiyihxK1/iV7LV/AXKc/X29KJ1AX4RXaIs/zXeqSbXxN5MQJewEtFlhlnoQ1l1E9Az8nKe/yF6jcFQ9
X-Gm-Message-State: AOJu0YxXxnUP8YBzVEmS2EXoyxHQPoT4lqa+HcUgRErD7vHACRLfaK6x
	UWvzrio5dLBsrTvHy9cfEB8zFCCMlKRJBYsJQknOdD0IlYzgA8NLCnWs9TPjgwg=
X-Google-Smtp-Source: AGHT+IGhVrh0vkrvTvfbs3er6vrivFWDI/IQXfXpBK+NV3F9Nmm1m/IafyZ6ElTvE9ivt0/9AaegMg==
X-Received: by 2002:a17:906:cc12:b0:a61:42ce:bbe4 with SMTP id a640c23a62f3a-a62280d6253mr228842666b.27.1716391095199;
        Wed, 22 May 2024 08:18:15 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d6bfsm1789227566b.31.2024.05.22.08.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 08:18:14 -0700 (PDT)
Date: Wed, 22 May 2024 17:18:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sreenath Vijayan <sreenath.vijayan@sony.com>
Cc: john.ogness@linutronix.de, corbet@lwn.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, rdunlap@infradead.org, rostedt@goodmis.org,
	senozhatsky@chromium.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	taichi.shimoyashiki@sony.com, daniel.palmer@sony.com,
	anandakumar.balasubramaniam@sony.com
Subject: Re: [PATCH v6 1/2] printk: Add function to replay kernel log on
 consoles
Message-ID: <Zk4MtXxbzGrQhSFA@pathway.suse.cz>
References: <cover.1710220326.git.sreenath.vijayan@sony.com>
 <90ee131c643a5033d117b556c0792de65129d4c3.1710220326.git.sreenath.vijayan@sony.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90ee131c643a5033d117b556c0792de65129d4c3.1710220326.git.sreenath.vijayan@sony.com>


On Wed 2024-03-13 15:50:52, Sreenath Vijayan wrote:
> Add a generic function console_replay_all() for replaying
> the kernel log on consoles, in any context. It would allow
> viewing the logs on an unresponsive terminal via sysrq.
> 
> Reuse the existing code from console_flush_on_panic() for
> resetting the sequence numbers, by introducing a new helper
> function __console_rewind_all(). It is safe to be called
> under console_lock().
> 
> Try to acquire lock on the console subsystem without waiting.
> If successful, reset the sequence number to oldest available
> record on all consoles and call console_unlock() which will
> automatically flush the messages to the consoles.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -4259,6 +4271,23 @@ void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
>  }
>  EXPORT_SYMBOL_GPL(kmsg_dump_rewind);
>  
> +/**
> + * console_replay_all - replay kernel log on consoles

It should rather be called "console_try_replay_all()" to make it clear
that it is just the best effort.

> + *
> + * Try to obtain lock on console subsystem and replay all
> + * available records in printk buffer on the consoles.
> + * Does nothing if lock is not obtained.
> + *
> + * Context: Any context.

This should be:

 * Context: Any, except for NMI

Basically only lockless code is safe in NMI which is not the case here.

> + */
> +void console_replay_all(void)
> +{
> +	if (console_trylock()) {
> +		__console_rewind_all();
> +		/* Consoles are flushed as part of console_unlock(). */
> +		console_unlock();
> +	}
> +}
>  #endif

Otherwise, it looks good. With the two changes:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am sorry for the late review. I have been snowed under tasks.
Also I had healthy problems.

I have seen a mail that Greg has queued the patch in tty-next.
I am not sure if it still can be fixed. It will be perfectly fine
to change this by a followup patch.

Best Regards,
Petr
