Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4A25A62F;
	Fri, 17 Jan 2025 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737141927; cv=none; b=br+jwZgNigdRnV1rMfnGKYqMAjUfty4UTPTf6W3jHqiaH+my12RaIrlUBibO4JrEHPR+SuBmmh2CVToB9Uh6isYA21cgMPs7437I8OhctZg5Whm+U8YoXUZSeOUQ4LoHq+To0JBi8YRE5qTq6Mo+07NeyikXRw5emxelXwWiaXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737141927; c=relaxed/simple;
	bh=P+anVeCvdzSe3m7yC20OIi5jCZF7U9XVWw3q0Nvn+rs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QDb52Y2RRoA4g/ONrQQsjv7sCFufMnmNBueiF0W+jlFv4FRo2nNrLIU+HGUUdOo7H0RYCj68XdOeKaQBwbhk0pflApVYI2grBCQjtRr+/C7grvrDtPh7sJUv+7r15jN9xFTh2qdKNOJ7d5Z5zAECdQsUD/W1Se9IOmUJYBHLR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfRXEL0b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfRXEL0b"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so23715475e9.2;
        Fri, 17 Jan 2025 11:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737141924; x=1737746724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxLbjVWzy8rDLg3Yq12D03LDd3gFCPbd/09pz8eUXOc=;
        b=dfRXEL0bcQpwlkDuKqPpUzOjIJXop/lIJBGpifvTBc1iE5H2mhuMzDo5oDD4aXD5YV
         tl038s+WbCQtFMyHCnncCoKmJsXS3mYceBu85cl/oMdIPxUC8WzCdAxAY5Jn8rFZU1ZC
         Li15PpxVzSmz06yhw4mnu8nIb+DolSRZbW4K6CUm1hwBWGo0l+EM1PEDOGSZSf9H/HJs
         OKrd5hhEwq1lVUrzo5qE/vwIyjWMkhE4CVy/l6uWq9SCIL2G17jWUEePLSxRRT+ZX99g
         3XQDAHLlILmbiyM2nTty4rZJxZBOD7uTqkrORVzs+KFnD3Ec5pMiHGjDLzgFlSH4XLix
         7vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737141924; x=1737746724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxLbjVWzy8rDLg3Yq12D03LDd3gFCPbd/09pz8eUXOc=;
        b=l6PLkZ6canNF7H7cZLHTWguWqd0m1ZRvAS7E0B7S9TSlo/Z5CgXX0ESITu3QyTjXPI
         2ZND7ScQ9ub8E4Nd/7C/sp6Xp5RFY1zRbvQLo1JckIYMbkC9Czp1q51IopDRQwjfOnHX
         lSJZBowzqGQVPzNymB8I9+QUhab9DVe0zAjktxfBUhWpxDF+PBbcLAvlRZ5h3zwQqWGa
         e2h0a28VsQcwt4MVluvuO5WeHttCML/zbSsX5LdHeYnEOOfIYlx7IEDrwCiExgYjlaLm
         9Fc45bGGL6A3zvmzvbq/SQHOoKnGLb7wCgtT9haD7IGFWvTEPXdb/0Q3LguYWbWWkrWt
         f0Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWhDHGL4kPTlxTXxhyYBVzCpkpUrJpj2qnZrLdjV9WgfbunwlyKuGoAY+DdDvsJPiPL2wHKKFVbnTI=@vger.kernel.org, AJvYcCXoKqdBB7l4PxWzutmCba80z1BaTjDONGcrG9f2v4EIhSkrq7bxEHWjjajEwGzy2AKbKgBm/r2xOB+5kMsZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxzhjqdoi3I65YWxuqA0QQ1eM35Xljwss5ENRXUsH1/RSBBR3r
	h2DrU8FXzOqE67Ory048XeIlp0P31yGCrC+haNcNga3QKHRX5/4U
X-Gm-Gg: ASbGncv9taEMSFCHCzLlCMYtn5TbtZDVOQQr+opRuD43HE6GP+Qcc0rSa08m495H6m1
	D7Ufjgmf/a5XkkfDjNhUSJYHLTCvBe8hp/0XxG0XnwKQMXuaW+XwCvYWhOh6t5wUqOlFLGzW2V+
	TknuRQQY8j7wOr4b1brwEEAbfoPIXhdeFloTkeQpfRdWYx3zRdDJTK7qzk9jk0utXg7y97r0MoF
	hpXS0rnHhHPeu/i7HCztoJYtgtdRZ/wCv6BuwjQGYY62O2GOn7vBnu3PeTxpJY3KjzjRw2hVmRL
	HkshCJxPkSC4xK9cIKI=
X-Google-Smtp-Source: AGHT+IGOQ1fctCFL7J1JJaYKHmRLkPldX8YN/rGWh5BJbh7VRac0KU67YD53kiYKZE+UHLjJTdB7Aw==
X-Received: by 2002:a05:600c:4e89:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-438913f1649mr43526175e9.18.1737141923918;
        Fri, 17 Jan 2025 11:25:23 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046c59csm43292695e9.40.2025.01.17.11.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 11:25:23 -0800 (PST)
Date: Fri, 17 Jan 2025 19:25:22 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, John Ogness
 <john.ogness@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
Message-ID: <20250117192522.0b2e7c65@pumpkin>
In-Reply-To: <Z4qE7tsTOvggdUET@pathway.suse.cz>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
	<20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
	<Z4UInSRCSXzNN5Ug@smile.fi.intel.com>
	<Z4qE7tsTOvggdUET@pathway.suse.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Jan 2025 17:27:26 +0100
Petr Mladek <pmladek@suse.com> wrote:

...
> IMHO, it is perfectly fine to add support for skipping identical lines
> only to print_hex_dump(). And I would go even further and replace
> 
> void print_hex_dump(const char *level, const char *prefix_str, int prefix_type,
> 		    int rowsize, int groupsize,
> 		    const void *buf, size_t len, bool ascii)
> 
> with
> 
> void print_hex_dump(const char *level, const char *prefix_str,
> 		    enum hex_dump_type,
> 		    int rowsize, int groupsize,
> 		    const void *buf, size_t len)
> 
> and combine all the flags into the one enum:
> 
> enum hex_dump_type {
> 	DUMP_HEX_ONLY = 0,
> 	DUMP_HEX_AND_ASCII = BIT(1),
> 	DUMP_PREFIX_ADDRESS = BIT(2),
> 	DUMP_PREFIX_OFFSET = BIT(3),
> 	DUMP_SKIP_IDENTICAL_LINES = BIT(4),
> };
> 
> How does that sound, please?

Rename it as (say) print_hex() and add wrappers for the existing callers?

	David

> 
> Best Regards,
> Petr
> 

