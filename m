Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CF433981;
	Sat, 11 Jan 2025 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736597411; cv=none; b=etwV+/VR697LZ+dc2+60F77Dtms0Y+N4XS3QFDsAzntUZiHoIAmih4+oOYRX52LEp6pIbWfjBLOrPIyKo1CFRmZRqGyXfDRVEBIYSO6cNJJS+HQzBQ3FDGf/PQhf/Q7VYolkN3Tkd96Iqt7EiYoe97CqmaT+SwgVPxOc+oOi2Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736597411; c=relaxed/simple;
	bh=GShfHRmpLs5MBpU4DB93wLBxi0Cg7zKKzF9jRBl21nI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=njMY1n2c/pG2O3j+LfPuxdkq9OUeljxElR8o5agXihBKQN0yoq2ZD2sknZ+lOgidnQt9LdhCnRkXQM8SQ7d2Rl4s1R61sxoIktFvCvJNY/2PN87VjzwsQVWdPpeJpSVlTXLtx0O2ikjcY9mOUURgKZGHa29diEmyzy2TJmHG0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncNOoVhF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncNOoVhF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso30849265e9.1;
        Sat, 11 Jan 2025 04:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736597408; x=1737202208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTT7ZUTuipiKXlRUDfKl1K6geEftjapKSYCPm3RShOs=;
        b=ncNOoVhFByCqPLol7/Cd9De97jTs01gp7cPDXQFQSUscGWIINxZP/6Hrkv2NaMlGXV
         u3SQ+mYAFTYJ8QG5W/y8a0ayOcmKMxXDDtUU9C50PwYEbrOg+y8lPsObVXrsfzSspvTI
         M0zWQCyORlLIKf6pdbes1o3+/6W5zxAsVBHEm9id/fhWWEK1wUyiifcwiF8AMfuIAgvg
         pWJJ8z/9mQSH0ViiGcFCnSq5LDmOWFNU9OGzG0Ae1PjYLI6FcmIiW4ySPZzLB9jl6CZ8
         0azyCZx/93PJpmRWwtb//lxtV3Ip7TYxrqEZCG6iuVq6mW3QODvWKqwJiRs6dii37QbM
         IM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736597408; x=1737202208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTT7ZUTuipiKXlRUDfKl1K6geEftjapKSYCPm3RShOs=;
        b=xEdV4eTHil6Yq375Wha5b4oSgqIygD0Lmgj3CyIcbaY0zrMMlIvhx4lSybR2DVr9l1
         of0EefZfKD4cDaeYW7+GJa93zEj7qMMXjp0m/nVK9PBtsjPoY1gGOCsET/DuP/PRNlke
         IgE61nwTQRBY8M7thDZUMwCYNExuTBr2BQcK8XeCk6HrXujNRKkqEd/lWYsn+868hccT
         RxcsEs7kYt6nvAUnetkMNu/5R4ajAd/B5k+Hu4bk3bYJiqRoQJjXoVLEYwIqQyltaCY0
         he1BTxrDrzaHOn+h2YXmItFFNnHrW6exKf9CCpavGNs5uosCquA6VRVLmvIgQxDE1asa
         qcNA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Zr+IvxjZdvwUnsHZLTYSEAPOh8itorMo0VR8jskl0is+thqXAPUhOIisvRTf044QvPs8IpBf9Y0=@vger.kernel.org, AJvYcCVWVINSRN9fjuEa0Y3Z10TvbiDZ7sokmeIPRweGahVUqADZU1lf6NOkh6ISIiWOb5exOcVVwbgxdCBeC1X/@vger.kernel.org
X-Gm-Message-State: AOJu0YyLe79BgUq8VLW1APOsNsrFG4zbCneQTKG3/bqKZroUzUVG6hbQ
	zlG/L9C88+afrErMrrV24qjTlAJ4i1qyVH+F/MCOtiX9XULBgCbh
X-Gm-Gg: ASbGncteqjy9hvahAKgj5f9cSI9HRYyjYUWgpzWyk6wY+jmojzyYfR751ghDLuW7ZFE
	1MXG14WrpVu/H1v7JdGPYOYh8U5U4S6/r6Q5FDKyQz6BcUUlPJajY8Kd2dKlNF5vpTJyNz5xpl5
	Dyye2/Pd0qbln05HQ9nri01w6I7bzMs6yNyASN5iM4exTY/Hz6wymgit30RkmjUEiDpFk0XvUkc
	JHdIco6ud5o5Ybo/KXVgWTqrSSEYgmlI+VWt6ZTJSkzNrMC0d3AWKaKo2gP7eAng+5kDRsggB6H
	HCLagiq2cn6ksVNemY4=
X-Google-Smtp-Source: AGHT+IFrHsg1CYIsa5jLn+ZmI7J8sQqRgF7QGi5a6JusD2wxK4uj9M2hhb+kBNx0cXhJW3cVl5rqeQ==
X-Received: by 2002:a05:600c:1c1a:b0:434:f753:600f with SMTP id 5b1f17b1804b1-436e26ba95dmr120579765e9.19.1736597407475;
        Sat, 11 Jan 2025 04:10:07 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc08eesm117328125e9.10.2025.01.11.04.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 04:10:06 -0800 (PST)
Date: Sat, 11 Jan 2025 12:10:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, John Ogness
 <john.ogness@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
Message-ID: <20250111121005.0fc89c94@pumpkin>
In-Reply-To: <87o70dsmj1.fsf@bootlin.com>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
	<20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
	<20250110193930.26b08c2f@pumpkin>
	<87o70dsmj1.fsf@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Jan 2025 10:54:58 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi David,
> 
> On 10/01/2025 at 19:39:30 GMT, David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Fri, 10 Jan 2025 19:42:05 +0100
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  
> >> When dumping long buffers (especially for debug purposes) it may be very
> >> convenient to sometimes avoid spitting all the lines of the buffer if
> >> the lines are identical. Typically on embedded devices, the console
> >> would be wired to a UART running at 115200 bauds, which makes the dumps
> >> very (very) slow. In this case, having a flag to avoid printing
> >> duplicated lines is handy.  
> > ...   
> >>  enum {
> >>  	DUMP_FLAG_ASCII,
> >> +	DUMP_FLAG_SKIP_IDENTICAL_LINES,
> >>  };  
> > ...  
> >> +		if (flags & DUMP_FLAG_SKIP_IDENTICAL_LINES) {  
> >
> >
> > That doesn't look right to me.
> > You want:
> > enum {
> > 	DUMP_FLAG_HEX_ONLY = false,
> > 	DUMP_FLAG_ASCII = true,
> > 	DUMP_FLAG_SKIP_IDENTICAL_LINES = BIT(1),
> > };
> >
> > and maybe you can get away with not changing all the other files.  
> 
> I'm a bit sad all the time spent on these changes will go to trash :),
> they kind of looked "nicer", but for sure this approach would be
> transparent. I can definitely try that.

The only way the big patch would ever get applied is if Linus himself
decided it was a good idea and 'just applied it'.
Otherwise it needs an ack from all the maintainers.

The other way to avoid having to change all the files is to rename the
function and add a compile-time wrapper for the old users.
So you'd end up with (something like):
#define hexdump(args, ascii) hexdump_new(args, ascii ? DUMP_FLAG_ASCII : DUMP_FLAG_HEX_ONLY)

But in this case you might be away with binary compatibility.

	David


