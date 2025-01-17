Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FFF19C578
	for <linux-doc@vger.kernel.org>; Fri, 17 Jan 2025 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131251; cv=none; b=nw1h5QuIwg8HVOkAjPzh26QK0n5xdccuPCPoMoh+LjwSgSnF56koBYTi7zNptZs3lE3XxGuAfhf/DIOQOVYc/mly4NLVJwKzpAvbqXk6yD6cH/1aZvriCoIRI5n2PoHi1fKhDmyLYlBUScsPZcy69+Dfp4vKQX9C4yON8AhBftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131251; c=relaxed/simple;
	bh=JAa6aWhnL4CBkq+HEKQskEBWJbY6om7pUdiVIXe48uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZs+gQ/hQn9UV+fkTx4wB39wrSDujcKVwN4YxVqMfij3LRnOi5zRJkzenGgiosVdTGEoZ4erdlerqTetfUgev2dCHWJZJ0TkoUH48dbgWPY8Ii5XJpRm7WA2t6KG01phvTjAX9Ut+ExnXXAeLFaEKkK/xJYXnsUUrFDlatIaucE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aNlftqdp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aNlftqdp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436a39e4891so15666975e9.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jan 2025 08:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737131248; x=1737736048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s2yh0wenwsVQ/ajWBRotlG9x/udMdmnRE49KKV/DpW4=;
        b=aNlftqdpUseufIN5QVGxyJiGAbHJ0FGoZhrw3poemwo/qshzRbY4MywHIehrOKGjSC
         u6n8PT3toaks9GQs5Z3f2O3LIboSvi3P/3O3EPqYAFKUkWUuA1tl7Ykaf8l63hV1x82v
         fEtpZVexoQivxkNwyiCIAX+oDubSq2JCPFjMtIcuL77XpRyrGki+SYv8pSKFT0/bJYJD
         37EiD32O9Ev81ok/MkLWAob20kxALlCMSV1rAHnm4QKLHF2BS3DBsGhWj4oOCTNQatze
         lDkaD8ABV39ul0BtEAmcGwGHeZ3V3Mzqpv2x1PLpVT4I4Y8D0brn4OXHDEMGnUA6ZVeY
         Rtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131248; x=1737736048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2yh0wenwsVQ/ajWBRotlG9x/udMdmnRE49KKV/DpW4=;
        b=Dkb1x7CFJXRizjmUmcxZMxV1iLYiX9d2tCjCV5FzMWtiz/QjXDvfW5DmnuTYKjZXZ2
         ngycewU5ISD4uv8jj79kJ6WQVgxtVmWMiif8FKmNYMr2tF0pfj3YlLAujONaNHVTiNng
         rh6hbM4J7XWTTDTr+ErSZ8B7Rj7XZjTpOTadYX3HSkffUTSNoDe02CLLsrWFSsCB95Ie
         AYfTsKNSD/xalrHGrbXE1j8NUsw+NM5kXPIkhEzTSaqYLkbKSda36GfxHrvo/6FFEO//
         BGFCfmi3nAiQcH31Ro5LObBRafkzwNxCu0a0zQNkYsAFRKodFgpTrmh5A9fRL+ZN5ncv
         0x9g==
X-Forwarded-Encrypted: i=1; AJvYcCXjuRQACqmawqj17S0xtE1xyz8N+mo9KIEyE1rma0XQNuLe5bRh068QQj9cUUuWaqvM7F45zLb4Ta4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg34gmV2RAgjNu8iOmBhwX5CV0YHkF9kDabAqljb8u+FkEIOxm
	EbzdBOstAKSegwRgNcXTV1EtIbtxN7EseMLweGcNpUTOIoucDY3onkaab0sND4Q=
X-Gm-Gg: ASbGncvC/NNF6i0ME2ZSRbYGlyAYEPI3Bbbnb8jPar2chEGdtEUtqY4khhWWbJfHkSp
	Lf1IGR2gBlIOV1osIu1SkT/wdsLqk8nTvWi9cdLfuo2MX2Yijl4gG5YSRyDily56wtOtROJha3N
	031sdFy+R6xCAuOXTsJq3NP+Hts41VQsgEwioOKpcKtU+8RskDqia2NsRb3GSJIqoR4cobogTSu
	E7f7E6v93xIHudNbHqDuYZCpzlqDfw4iLaCzTp7mHXoren05BPMNGOcBA==
X-Google-Smtp-Source: AGHT+IFOWQv36zZEkECJubsYeBpjbbu4VrMES77gG9IobNI/fp5ubH2hiSTPu0FD0ijq+IdCQJYERQ==
X-Received: by 2002:a05:600c:348c:b0:434:f1d5:1453 with SMTP id 5b1f17b1804b1-438912dbfedmr38384195e9.0.1737131248162;
        Fri, 17 Jan 2025 08:27:28 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890367b48sm38371385e9.0.2025.01.17.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:27:27 -0800 (PST)
Date: Fri, 17 Jan 2025 17:27:26 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
Message-ID: <Z4qE7tsTOvggdUET@pathway.suse.cz>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
 <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
 <Z4UInSRCSXzNN5Ug@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4UInSRCSXzNN5Ug@smile.fi.intel.com>

On Mon 2025-01-13 14:35:41, Andy Shevchenko wrote:
> On Fri, Jan 10, 2025 at 07:42:05PM +0100, Miquel Raynal wrote:
> > When dumping long buffers (especially for debug purposes) it may be very
> > convenient to sometimes avoid spitting all the lines of the buffer if
> > the lines are identical. Typically on embedded devices, the console
> > would be wired to a UART running at 115200 bauds, which makes the dumps
> > very (very) slow. In this case, having a flag to avoid printing
> > duplicated lines is handy.
> > 
> > Example of a made up repetitive output:
> > 0f 53 63 47 56 55 78 7a aa b7 8c ff ff ff ff ff
> > ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ff ff ff ff ff ff ff ff ff ff ff ff 01 2a 39 eb
> > 
> > Same but with the flag enabled:
> > 0f 53 63 47 56 55 78 7a aa b7 8c ff ff ff ff ff
> > ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > *
> > ff ff ff ff ff ff ff ff ff ff ff ff 01 2a 39 eb
> 
> Still thinking that it's not okay to leave the cases where hex_dump_to_buffer()
> is being used for the similar. I would expect that to be modified as well.
> As told in v1 thread this can be achieved using a context data, instead of
> providing zillion fields, one of which may be a kind of CRC32 checksum that
> makes this work without any additional allocation.
> 
> But I won't prevent you to go with this if you get a blessing from other
> PRINTK/PRINTF maintainers/reviewers.

Honestly, I never felt as a maintainer of the hexdump API.
I reviewed patches when time permitted but the changes always went
in by Andrew ;-)

Also I do not know the history of the two APIs. It seems that
hex_dump_to_buffer() is capable of writing more lines but
it seems to be primary used to fill one line.
This might explain why it does not handle the prefix...

   => hex_dump_to_buffer() is not much useful for dumping more
      lines because they would be hard to analyze without the prefix,
      ...

   => print_hex_dump() is the API for dumping more lines

IMHO, it is perfectly fine to add support for skipping identical lines
only to print_hex_dump(). And I would go even further and replace

void print_hex_dump(const char *level, const char *prefix_str, int prefix_type,
		    int rowsize, int groupsize,
		    const void *buf, size_t len, bool ascii)

with

void print_hex_dump(const char *level, const char *prefix_str,
		    enum hex_dump_type,
		    int rowsize, int groupsize,
		    const void *buf, size_t len)

and combine all the flags into the one enum:

enum hex_dump_type {
	DUMP_HEX_ONLY = 0,
	DUMP_HEX_AND_ASCII = BIT(1),
	DUMP_PREFIX_ADDRESS = BIT(2),
	DUMP_PREFIX_OFFSET = BIT(3),
	DUMP_SKIP_IDENTICAL_LINES = BIT(4),
};

How does that sound, please?

Best Regards,
Petr
