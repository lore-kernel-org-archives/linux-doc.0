Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF890197A67
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737368744; cv=none; b=XbEGBPZQyMmz1zhmFym8yLYKAcfGmhEsVSDUet13L2vrK1If+EvuyfM/s3xbNdMNIhBpbhM7eHZaW44YpR6tNhGoueUNHsVhk3s9+l6oU1ScuHQrDpuQpeS6ne4ofItwziebPqV8Wc6gYqX5OTUoTXAnMnDxYvU9PpOTwacy7aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737368744; c=relaxed/simple;
	bh=LD8OuVw8n3F+UjqdO0zdMsAuE9OqG7caHsIEKdL9ptU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGHBJTS0G2xq0tcTtaxwK6esVGsEMBN1byydTqddjPBw/IpBD+StPAcI7TTqpY++1zTB2KLeeV0gp7F2MJeLlWjNQzPys7H1RYl7tasPkutAiBrtoHMeOay/oTSiH7o1ZkNVT3ATkJqHCq1/RabchryCGlDsklw8MlVu6hzUdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YpvcVHqe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YpvcVHqe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362f61757fso43940245e9.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 02:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737368741; x=1737973541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/plAlONRzFatYjUDsmYEo6CR3UeB2Jc5rLAfXDiJdtk=;
        b=YpvcVHqegktJxV4UHAHBIF5jDE0UA2mPIOI6a63q5OgN5gXz8ilwzncOp3w/+0Ziup
         KYbBoojJXW9i5R3ATcUtmDDxwq0MN7rgROtmBBb2bWNgK7R9fN+dUjHity0pg07Lf7pe
         LkEmYqW6iMZr4URw50Udj53PMaW60NaQ27+wJlE418k6uInmiz9AA6P1vIB81u70Cg01
         RV8pNmngzTfXyABf4NtOjnNWSVJHDUZTyl74f2omyxNRF1f/ZHsQAE2w/y2/oIJPQ9yP
         IeT6khiuzZNYlQGP+gSDm1dWOIcsQro57Sqqhq9JH94JPo3ON3V93gIDe9x22i41b/TA
         Y1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737368741; x=1737973541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/plAlONRzFatYjUDsmYEo6CR3UeB2Jc5rLAfXDiJdtk=;
        b=ts3SDfVUNX2/rbaLg9d1c8ikGcX6MVGejUSz3WJLnCBQtZfWrKxX8lZufM7jAhaoz5
         d0MBk57mPwJ7piboZR81/WKGdnFDZ6NutjW/lmY0JuP6TMoELvqe2bWDrYM/8BF4gYQi
         jDNxve6leS9Zv7Knx5/DGOjmvHhSzqUcE707OMOcP82jBgjKkE0F/Rj2DDI4yLSv74V1
         r8xMSlHrskdqtqT52h/h5TrSU2kJ7WEeCcNZbKhGwtoiPYSufdzr9mulcvpZLR+vhhLj
         s3uWbW6dAYwOLrLLvD46/NoI61hih9caXs25cDdSn7U4iDE+ppf5wG+O5DApCfq4BJKh
         RkwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf209QhdcHgveskndHB3WlO19lwZAxrl9DKPt1qZoKWm0nX+tSYlCa57sEfxV2FWWwKNpJP35PNgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YySck11HSpHRltlX4B7tptTMZiDSwL0z5isIi2/38rsmHIxIzg9
	CaQSn0PWC2Amj8GTjwZ64eNKuSL6uqwxll3KlKdxMyfK7SVRBeeaWzn8uPD2O1I=
X-Gm-Gg: ASbGncsJ9ieLUW+sIfbbUWwx+Z/jmpC9bv+AdvIdBAAErQ8SzK9oboick5n9WVqO1V/
	/sjiaAHTFq+RRVNuCWygVoLQUx4zDrMYnZiZhJNwKhRzAh2gRTaKcn91DYM3sRq1YzYYCwaRiXM
	5ZqL6VIXHIucXPZ79AX3F/ep32HjS+52Sd8uu1yS2ftd43haxdyE4Cf0UfRPsyGZDRQp6kZw2ip
	O23Dh2uCDNl799ajkWHZxU8uyoxz+0YfYYbcZKLafBr29wId35KYi0zv30WvsyIIohc3kY=
X-Google-Smtp-Source: AGHT+IGuenfcVRf8Q07QNfEdMYeTuOKNmKjxeSjYso288tHkR+4lZp1kulMIxxTWOTGhuEhOwe35wQ==
X-Received: by 2002:a05:6000:b10:b0:382:5141:f631 with SMTP id ffacd0b85a97d-38bf56740b4mr8607242f8f.29.1737368741058;
        Mon, 20 Jan 2025 02:25:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221be1sm10086350f8f.31.2025.01.20.02.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:25:40 -0800 (PST)
Date: Mon, 20 Jan 2025 11:25:38 +0100
From: Petr Mladek <pmladek@suse.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
Message-ID: <Z44kojleQta1bfoe@pathway.suse.cz>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
 <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
 <Z4UInSRCSXzNN5Ug@smile.fi.intel.com>
 <Z4qE7tsTOvggdUET@pathway.suse.cz>
 <20250117192522.0b2e7c65@pumpkin>
 <87wmepvnns.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmepvnns.fsf@bootlin.com>

On Mon 2025-01-20 10:29:27, Miquel Raynal wrote:
> Hello David & Petr,
> 
> On 17/01/2025 at 19:25:22 GMT, David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Fri, 17 Jan 2025 17:27:26 +0100
> > Petr Mladek <pmladek@suse.com> wrote:
> >
> > ...
> >> IMHO, it is perfectly fine to add support for skipping identical lines
> >> only to print_hex_dump(). And I would go even further and replace
> >> 
> >> void print_hex_dump(const char *level, const char *prefix_str, int prefix_type,
> >> 		    int rowsize, int groupsize,
> >> 		    const void *buf, size_t len, bool ascii)
> >> 
> >> with
> >> 
> >> void print_hex_dump(const char *level, const char *prefix_str,
> >> 		    enum hex_dump_type,
> >> 		    int rowsize, int groupsize,
> >> 		    const void *buf, size_t len)
> >> 
> >> and combine all the flags into the one enum:
> >> 
> >> enum hex_dump_type {
> >> 	DUMP_HEX_ONLY = 0,
> >> 	DUMP_HEX_AND_ASCII = BIT(1),
> >> 	DUMP_PREFIX_ADDRESS = BIT(2),
> >> 	DUMP_PREFIX_OFFSET = BIT(3),
> >> 	DUMP_SKIP_IDENTICAL_LINES = BIT(4),
> >> };
> 
> Would a single enum (in the prototype of the function) work? I like the
> idea but we need some kind of OR combination to be supported, typically:
>
> DUMP_HEX_AND_ASCII | DUMP_PREFIX_OFFSET | DUMP_SKIP_IDENTICAL_LINES
> 
> Maybe something like:
> 
> void print_hex(const char *level, const char *prefix_str,
> 	       int rowsize, int groupsize,
> 	       const void *buf, size_t len,
>                unsigned int dump_flags) // flags instead of enum?

Yes, the parameter would need to be an unsigned int or unsigned long
type so that we could use the logical OR operation.

We could also define the bits without the enum type because the enum
type won't be used anywhere.

I just thought that you wanted to have it "enum". AFAIK, workqueues
code uses enum because it allows to use the names of the bits in
crash/gdb. The enum will cause that the names of the values will
appear in the debug info...

> enum hex_dump_flags {
>         // I'm not sure what to do with the default value?

I would define

	DUMP_HEX_ONLY = 0,
or
	DUMP_HEX_DATA = 0,

It would be used only when the caller wants only the plain hex data.

> 	DUMP_ASCII = BIT(0), // renamed?

You are right that DUMP_ASCII might be enough. The names of the flags
would mean what the caller wants on top of the plain hex data.

> 	DUMP_PREFIX_ADDRESS = BIT(1),
> 	DUMP_PREFIX_OFFSET = BIT(2),
> 	DUMP_SKIP_IDENTICAL_LINES = BIT(3),
> };


> >> How does that sound, please?
> >
> > Rename it as (say) print_hex() and add wrappers for the existing callers?
> 
> That would avoid the treewide changes, so yes I can try that, definitely.

I am fine with it. But a treewide clean up (2 parameters -> one flags)
would be better from my POV.

Best Regards,
Petr
