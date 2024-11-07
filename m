Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC93212179
	for <linux-doc@vger.kernel.org>; Thu,  7 Nov 2024 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730989506; cv=none; b=MoAuBObIQ92A8v3b81aMylxkaZ5S2P8wQAlwilVKXoXxDGP450pg5zfjVMLA0JrmPB0QHzv+clfGb11ojVNZ+ZErbLc/Zb6sZ7AYsUaRScZ4qGVVjqz50uN/qhMIqbpyI+VESja1Oe4LET5lsQDHCKavme20zTTnXpZDQ/wUPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730989506; c=relaxed/simple;
	bh=c+hf6uB4fqH3d+WnnBByOCsUBIviwNFcQsOTMU6mvKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYpWUF6jiwPUy0okSPCav6tX627bJlYUDpi3d8EkS7kz3Ev+7W64VP7Rw3ZfWbusG3Hh1ImXHpMb/NcElTtjVFJ3hq0XBq7zWKOvsHuzqmgNqiMnSiAHI1W0cxkixkPTWtaJ5am1va+Mi7tAQtQr+V2wpotuklH17UxjtCKnTyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gdbyXreu; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gdbyXreu"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so672293f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2024 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730989502; x=1731594302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbRzJJ/6WJtGg6mWwg9t7KQ5S1Rzj9qib33nN9SCn2I=;
        b=gdbyXreuJqP+CBEYXKtaQJ5/CSX5qTLqpZ7+MoOVnDSKzOrgjCqUozpVydX5T4fc9H
         2qhAaPUzVveFT6MdIia066NZxiGpWxXtoraHAztV/yaA0iAdEcCtdIISQ91+mj/Cx7ir
         wiDtajn9GEE66GePjYUPH3CA23ZIJIoZcpZoiUbx+ZqoERPZ7PZTxgSgRaa6glpWaCT7
         EgEnYgtZSL8F9PjQi/BCjwmMCAatmM5BuBRiylwkf1dS/SDpegOoaILr91tMVGA0EpSK
         QhC9o20XniG6vNe5tmr2x1b1RxLflnF3TvSPnJOvUUGx3VIOmhmBjRwxplYm9xnx129q
         eQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989502; x=1731594302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbRzJJ/6WJtGg6mWwg9t7KQ5S1Rzj9qib33nN9SCn2I=;
        b=Pz1VU3OnBYMd7SHD5KS7BwhHZvxNKPDe6b4FaE+ZzTQ28Ax3KBzS0n5ENSSx2KE3+c
         NzVyJ7bEHUfzZXtnOj0jh41iBWzA6ugm5U/kIh16Gc3zhQl5srYpNwYrzaQupy65mVqH
         5mMpFt3zkfT6bA4BY2XgQxLoVOiQtUBrNtjeen3bd7KpvnHJiA+um9JZbb6DsPF0eFlA
         vvaxiRBgLSF4xyVJ+VfD2V1pYeWWBoWEvEVn7DeUyr8pT4uk0Opx15klIdkUhahpNyEM
         vaZcPNl2MWFfxdCB7wJTqfqGiN2KoIjWoMo9B2lFND3aIyWAZ6uirUMUE9cRhJ98EZIx
         pCOA==
X-Forwarded-Encrypted: i=1; AJvYcCXRujBAVcX5+wypmRJ0HV83zXvJsHcPnlZ4U9+xWwDAwdpvHtGSmb+aWsdrIJGrzbtBqXOqCjr2Rr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSwfmTehyz4/TIFKW19oXlhECE8cdsKiAK9nEzPQvjJ+Fd0qbd
	mMMgeZ5tVPRbtJNvFnp8R6pmRdg1JVFe19Lbtv2OZZ7r1O4HdbMdcjh457gd5nk=
X-Google-Smtp-Source: AGHT+IFM7WGqm0tmvVPpXPZBla5CuqK2zZ/9lXPmqEDUa+4PIGt5LF4OSu5sUzW3/qV8o19bqFF9mw==
X-Received: by 2002:a5d:64ce:0:b0:37d:45de:9dfb with SMTP id ffacd0b85a97d-381c7ab2cc1mr15453550f8f.46.1730989501840;
        Thu, 07 Nov 2024 06:25:01 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed987d33sm1907677f8f.43.2024.11.07.06.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 06:25:01 -0800 (PST)
Date: Thu, 7 Nov 2024 15:24:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Fan Ni <fan.ni@samsung.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v2 3/4] printf: Add print format (%pra) for struct range
Message-ID: <ZyzNuh9BJxQxihYv@pathway.suse.cz>
References: <20241025-cxl-pra-v2-0-123a825daba2@intel.com>
 <20241025-cxl-pra-v2-3-123a825daba2@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025-cxl-pra-v2-3-123a825daba2@intel.com>

On Fri 2024-10-25 19:46:55, Ira Weiny wrote:
> The use of struct range in the CXL subsystem is growing.  In particular,
> the addition of Dynamic Capacity devices uses struct range in a number
> of places which are reported in debug and error messages.
> 
> To wit requiring the printing of the start/end fields in each print
> became cumbersome.  Dan Williams mentions in [1] that it might be time
> to have a print specifier for struct range similar to struct resource
> 
> A few alternatives were considered including '%par', '%r', and '%pn'.
> %pra follows that struct range is similar to struct resource (%p[rR])
> but needs to be different.  Based on discussions with Petr and Andy
> '%pra' was chosen.[2]
> 
> Andy also suggested to keep the range prints similar to struct resource
> though combined code.  Add hex_range() to handle printing for both
> pointer types.
> 
> Finally introduce DEFINE_RANGE() as a parallel to DEFINE_RES_*() and use
> it in the tests.
> 
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -2229,6 +2264,15 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
>  	return widen_string(buf, buf - buf_start, end, spec);
>  }
>  
> +static noinline_for_stack
> +char *resource_or_range(const char *fmt, char *buf, char *end, void *ptr,
> +			struct printf_spec spec)
> +{
> +	if (*fmt == 'r' && fmt[1] == 'a')

This function is called only when (*fmt == 'r'). We do not need to
check it here.

Otherwise, this function should trigger an error when (*fmt != 'r').

> +		return range_string(buf, end, ptr, spec, fmt);
> +	return resource_string(buf, end, ptr, spec, fmt);
> +}
> +
>  int __init no_hash_pointers_enable(char *str)
>  {
>  	if (no_hash_pointers)
> @@ -2277,6 +2321,7 @@ char *rust_fmt_argument(char *buf, char *end, void *ptr);
>   * - 'Bb' as above with module build ID (for use in backtraces)
>   * - 'R' For decoded struct resource, e.g., [mem 0x0-0x1f 64bit pref]
>   * - 'r' For raw struct resource, e.g., [mem 0x0-0x1f flags 0x201]
> + * - 'ra' For struct ranges, e.g., [range 0x0000000000000000 - 0x00000000000000ff]

The range is printed without the space ' ' around the dash '-'.
I mean that this should be:

 * - 'ra' For struct ranges, e.g., [range 0x0000000000000000-0x00000000000000ff]

>   * - 'b[l]' For a bitmap, the number of bits is determined by the field
>   *       width which must be explicitly specified either as part of the
>   *       format string '%32b[l]' or through '%*b[l]', [l] selects


Otherwise, the patch looks good.

I am sorry for the late reply. I had vacation... The problems are
rather cosmetic and could be fixed by a followup patch later.

Best Regards,
Petr
