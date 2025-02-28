Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676F2189902
	for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740758363; cv=none; b=jUad0qPPJc59XDHxPcxEepzafAY/a8cX5t3MzQW1OVP4i44AQgxQ6EyqohbGZqJKm0+uKeAZwtec2D4PgzMTbpKeCF4EZPOnJ/Mu1KNXoD1qingBPr3AkBfl784SR7oEkB7bck9gLJix6qJ2uP4M/DB93JNQxYdyEC4yRxap/ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740758363; c=relaxed/simple;
	bh=b46EP5IzWq8UU0xT/34RovEAbbytBs+vdnTdJMSt2qM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIeiUziD+dD63SNLwmU2i950V/+8zzUCw01YeOcc5hMckc/9zx1kKqZ8bsSMPoqbuZAt/qSGd6HkmRcrfWlDoFcWk5W+4mVT3ED6CICb6yLotW814q/8ni96kEeEhlnKl6RT5/mEacbFrfEgCPWcndQ+xieYyGZo4G2ULjTtIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g/mWKkm3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g/mWKkm3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so3802596a12.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 07:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740758360; x=1741363160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=77jE1/LyMPegdPWJf8a9cIaRHVuPbBJvb9L7XbmoSfk=;
        b=g/mWKkm3vZFpj7AfXv3uDkZR5iIUqx6RZO1JFn2PGyYTpqZPjZC3nwA2Ve2YS7hmmF
         /DKl69e+yPHPsbMAFJp8pwzN6kcUAs7n6RssFr5/TSIBCuaknPD32nrRS25IU8pOiIX0
         S/jWNYUhhr3F3XgIhHGh6HhTIzGQg+ChuSX91iQIA57xK2u8ZQd/OnaxMAPguUCDQqrc
         pPFi6zmBSMoVgU5+G8oidlwb9hTQE23HmxNaLFGrg/EYMfmwDmWVbYe/K8qODLzc/OS9
         LQyvl3mu90iOdxq8TBLlP/WWiYV1OtraA4NXAt2FG/J8fyGe24TBLZxRBCpeJ3+tnEOY
         sALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740758360; x=1741363160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77jE1/LyMPegdPWJf8a9cIaRHVuPbBJvb9L7XbmoSfk=;
        b=JwuA6eENPP+xktpxbq2ygtWQCUUTj6DwnFWZC0EQs4XiHc1yPy7WJPGHfsKy7T5tT8
         gMnR1O11Wn0YU+ig94fdPH5TNs8l/i6kyFraLlvOEjg12MdKQF1OX0l111LfeGt6rVpK
         SJK4B4TVbAKdsoxvk3+yKOyX9oRUUi5XuR4PcKzKMvCEEZSZjm+h3csR9VWpa/H9dZGA
         SOM3pRkh8+3CpSK02iiW4EnoB74tNMKvqZXtfWNEMWVFeYT5aAhRXjTSTmQurmDxlGVQ
         EJ2cnMUwvFWfaQL6d3ZANoCOzl23V670k8i8Ba6p8LKLf8w+e5DkUQjRgrC3EzYAxkIh
         rpmg==
X-Forwarded-Encrypted: i=1; AJvYcCXIWbCfEHbklJPia6mEu0L8R9hQyPg54KkS+ryjYavSWNETW1xa66UGfYY2dxbSMAkulw6oEF3Lsdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWnQupjhdyr2vAlPm4mGEi63iljbQZh/cKrLV4rKE/42BUD2z
	GBYnL3qEoie0/4TiMObIbwR/UXaAPqnna3GQ8+eTv/bV1MI7tfzo+tRWXiAKl14=
X-Gm-Gg: ASbGncvS9Ker9U9ICLCitfIGCsFxuSdxniSU5sc5Ecu3U2HZvsSiySuLR6tbovAg3Ei
	n3iHxMpglS5tJtFNFAKooW5XdIIouM3kWZYnINbj8d8rhUjZcU7ea/lhD9b8dUcL2ljnYEWAB82
	nIujaRpqo2OEpB4N6LUnPtaiKPBaDWW0f3qHVsNVJ4vRPBUQ+9uV//qy2ykHSnjl4rw7Bj7QCK2
	VRHDU3/MWu553F+ZTGh8EWZ+yGK0VFNdKvojcWtFlVCHJXU2d1DLeYd1J0hgnXI14HE6JpQIUOK
	Q1T1bgNObz/5a7H+rGIda8BY9Yvo
X-Google-Smtp-Source: AGHT+IFn7pQ0YfG5opXpIxWkH3TKxQe435WJeIcDsK+/6jZv4G4I2NoKhduLn6iQSoe62P9qjjwEwQ==
X-Received: by 2002:a17:906:f59d:b0:ab7:a5f2:ed22 with SMTP id a640c23a62f3a-abf25fa0374mr480905066b.1.1740758359562;
        Fri, 28 Feb 2025 07:59:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0ba58asm308277866b.31.2025.02.28.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:59:19 -0800 (PST)
Date: Fri, 28 Feb 2025 16:59:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"sven@svenpeter.dev" <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	"alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z8HdVfr2hWyzhwHh@pathway.suse.cz>
References: <DB7F502D-1477-49C9-A36D-1DEE408ED23C@live.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7F502D-1477-49C9-A36D-1DEE408ED23C@live.com>

On Thu 2025-02-27 06:30:48, Aditya Garg wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
> 
> %p4ch   Host-endian
> %p4cl	Little-endian
> %p4cb	Big-endian
> %p4cr	Reverse-endian
> 
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>

> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -648,6 +648,38 @@ Examples::
> 	%p4cc	Y10  little-endian (0x20303159)
> 	%p4cc	NV12 big-endian (0xb231564e)
> 
> +Generic FourCC code
> +-------------------
> +
> +::
> +	%p4c[hrbl]	gP00 (0x67503030)
> +
> +Print a generic FourCC code, as both ASCII characters and its numerical
> +value as hexadecimal.
> +
> +The additional ``h``, ``r``, ``b``, and ``l`` specifiers are used to specify
> +host, reversed, big or little endian order data respectively. Host endian
> +order means the data is interpreted as a 32-bit integer and the most
> +significant byte is printed first; that is, the character code as printed
> +matches the byte order stored in memory on big-endian systems, and is reversed
> +on little-endian systems.

I am a bit confused by the description like I was in the past, see
https://lore.kernel.org/r/Y3zhhLoqAOaZ7rMz@alley  ;-)

I wonder if the following sounds better:

<proposa>
Print a generic FourCC code, as both ASCII characters and its numerical
value as hexadecimal.

The generic FourCC code is always printed in the the big-endian format,
the most significant byte first. This is the opposite of V4L/DRM
FOURCCs.

The additional ``h``, ``r``, ``b``, and ``l`` specifiers define what
endianes is used to load the stored bytes. The data might be interpreted
using the host-endian, reverse-host-endian, big-endian, or little endian.
</proposal>

> +Passed by reference.
> +
> +Examples for a little-endian machine, given &(u32)0x67503030::
> +
> +	%p4ch	gP00 (0x67503030)
> +	%p4cr	00Pg (0x30305067)
> +	%p4cb	00Pg (0x30305067)
> +	%p4cl	gP00 (0x67503030)
> +
> +Examples for a big-endian machine, given &(u32)0x67503030::
> +
> +	%p4ch	gP00 (0x67503030)
> +	%p4cr	00Pg (0x30305067)
> +	%p4cb	gP00 (0x67503030)
> +	%p4cl	00Pg (0x30305067)
> +
> Rust

The patch has been malformed. I guess that your mail client
removed spaces at the beginning of some lines.

> ----
> 
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 59dbe4f9a..056929c06 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -776,21 +776,46 @@ static void __init fwnode_pointer(void)
> 	software_node_unregister_node_group(group);
> }
> 
> +struct fourcc_struct {
> +	u32 code;
> +	const char *str;
> +};
> +
> +static void __init fourcc_pointer_test(const struct fourcc_struct *fc, size_t n,
> +				       const char *fmt)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < n; i++)
> +		test(fc[i].str, fmt, &fc[i].code);
> +}
> +
> static void __init fourcc_pointer(void)
> {
> -	struct {
> -		u32 code;
> -		char *str;
> -	} const try[] = {
> +	static const struct fourcc_struct try_cc[] = {
> 		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
> 		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
> 		{ 0x10111213, ".... little-endian (0x10111213)", },
> 		{ 0x20303159, "Y10  little-endian (0x20303159)", },
> 	};
> -	unsigned int i;
> +	static const struct fourcc_struct try_ch = {
> +		0x41424344, "ABCD (0x41424344)",
> +	};
> +	static const struct fourcc_struct try_cr = {
> +		0x41424344, "DCBA (0x44434241)",
> +	};
> +	static const struct fourcc_struct try_cl = {
> +		le32_to_cpu(0x41424344), "ABCD (0x41424344)",
> +	};
> +	static const struct fourcc_struct try_cb = {
> +		be32_to_cpu(0x41424344), "ABCD (0x41424344)",
> +	};
> 
> -	for (i = 0; i < ARRAY_SIZE(try); i++)
> -		test(try[i].str, "%p4cc", &try[i].code);
> +	fourcc_pointer_test(try_cc, ARRAY_SIZE(try_cc), "%p4cc");
> +	fourcc_pointer_test(&try_ch, 1, "%p4ch");
> +	fourcc_pointer_test(&try_cr, 1, "%p4cr");
> +	fourcc_pointer_test(&try_cl, 1, "%p4cl");
> +	fourcc_pointer_test(&try_cb, 1, "%p4cb");

Nit: I would use ARRAY_SIZE() instead of the hardcoded 1 in all cases.
     But it might be a matter of taste.

> }
> 

Otherwise, it looks good to me.

Best Regards,
Petr
