Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9F242C4F0
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764195; cv=none; b=gAnU5rGaIZTSDFajtlWUM7prOcMU1uOpnMLbrIbFRCjnptsylISYlS7pXneuMl2ECeOowR50vaA0rGbLtoHOAJZoZfqgFSO4kga0Omdcgb3bWS2wqx3kYPVFCWTywkHa/5QRbJPJ7TCJM1R0FVn+oBBFDyJzDjwpOkkX01FcXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764195; c=relaxed/simple;
	bh=HryDV6+5qMbLhZY2KERuGiFp2ZKXAOvyWcXmP57Eq3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUpiBfp7Kf6LzEteb3wG7GqfWwda8l3VLakx4r0TiXfTqKVSGApJSw90h4K502QNbqJasgzYdfu7xCqr09rmDd2QopUSGTimg45m+b2Y+m1MEi6sX3+4us3Co/3N99LD4+kQPdQzu3bNhMmXsnqW1Zm3b6c2b802nM6yRdzCo7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDZeQKGj; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDZeQKGj"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso2034511a12.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787764179; x=1788368979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJATd1QCK8mzBoL2c8+JxSkXmq9RldTbZrwKcwNjBmk=;
        b=kDZeQKGjuHP6Ge59bPmUk6WLTc+NcJVo2XZ1RnDwli+aHKDJAUteHSksxGVCdR8du1
         bAlX3fA2NcX3AnXBJU7KEwF8QJ82o0afYQ1yoEks10qxCmhjvFJyMRhxUyWrzvpO6Sj4
         e56n85zapKxQLnEDpayB4Oo7O6hkMgnqLhzRvOI04G80GgjzotdM7u+jrApjqOUiDekE
         Sw2qaevbutXor/bcuUNh6UvAQfGa0s64DntC/iy122R2E8qD+Bri8AsE9m8N9GCtjPlL
         X93R02CxR8/3bjmcG4FiYQ3CDYiqIG5ZYYxovOiOxNEKcoITwgL6IdaAjbpsaqtLPPzt
         JmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764179; x=1788368979;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJATd1QCK8mzBoL2c8+JxSkXmq9RldTbZrwKcwNjBmk=;
        b=iaz90LIj5P3ta+za9ZcDWNLClJv1oiPNwSd9au5VSDYc82jVfDgorCGJNniLVT7tY0
         KVOn5b3Aw2Uc+9O4oeN5j4aKC0ZvIzuk4Ws48K2tFEiNv7P4XAlycwPus781mw2/UCAw
         uoXrc8YwNg0UjDpY86527vnbT9GCD7K15yXJksgm1UahP30qZAXu5Yv5KsUUDvyE9NPw
         +LRef5gT2CQ76IBj9z5CGLupmAveHYQ70HzK/X6nodnw7SDjSa7q9aTWF6Sm0Wi9JQse
         5gOSM6Z/+MA6A/UU7VxwmwJZH1er3gONgw8DDFw6w4xYCb9bQGS/9s2Xqy7y4Pfva/bo
         ghdw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3EUEKjgFR2NoE57XrUI7k2okKhWjaMYymm1VyT9Zd/uyWHD/gcBrHwnPyeKaB/DnQKwysVbZUWAA=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ2BsZn30/JtlNjqq4k/Ol7N+r9DvQpWTKiBS9bEvyA7f/kArT
	/5bijTf85HThbbwIbC97538qQAfthfv5UC/8KxJZbRnYijTqlzbggOLL
X-Gm-Gg: AR+sD10OFNHALr+z4VufjYpka5T2dALXPkCaaWlIm7sLRbtXfvjCskQSALOAlNdxl5U
	Jxo/sOhcT6UyaMQUlrt/1IsH1uIxrfF+umykZ8Jfay0DyVuhDCcPZ+unjnGznf59LPlO2khLS5r
	d7jJtThGQCBVSq9U+aDDJeIZYQkei/NVekNPuGKQE5MjDI6urrDLA6BtoeFhOFTbw5IMQntFsen
	DyniGTayNo5V3RKQnnUpgoPpLpXDEirH58XDBfW3plKBdQ5ntXK8CHx+J3mv3+KvTIqxIX7Szcy
	MjeuovPrOtSXoSTFNz8XtRV0reMGr2E+C7+tMmpnfdn7slTeaACRgivRXh2PU1Wt3jPXGyT4Kaz
	CtG8bA1IPCYvCiOKlI1L6+Aa7OMhE1r3vv1JiRNmxigQd9RT69L7Cdihyjq8N6xo6Hk/+D7EdI5
	Arm3FTP9WCXWgwybNh2jK114lScnVZtKs7UCeR0ikUCTPNYfiT/8W96LWx9oeuXQc4N0Q=
X-Received: by 2002:a05:6402:a0d9:b0:6a1:f092:3c1e with SMTP id 4fb4d7f45d1cf-6a5df6410cemr9897163a12.13.1787764179194;
        Wed, 26 Aug 2026 10:09:39 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm2563163a12.17.2026.08.26.10.09.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 10:09:38 -0700 (PDT)
Date: Wed, 26 Aug 2026 19:09:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20260826190934.5042b344.michal.pecio@gmail.com>
In-Reply-To: <2026082634-cloak-ambush-3861@gregkh>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
	<20260826153311.6340efcd.michal.pecio@gmail.com>
	<2026082658-statue-census-dc39@gregkh>
	<20260826173549.18c8a89c.michal.pecio@gmail.com>
	<2026082634-cloak-ambush-3861@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 17:44:06 +0200, Greg Kroah-Hartman wrote:
> On Wed, Aug 26, 2026 at 05:35:49PM +0200, Michal Pecio wrote:
> > You can't bind random drivers to random devices out of the box,
> > you need ID overrides. And then you don't need to bind manually,
> > the kernel will happily select the wrong driver by default.
> > 
> > Authors of the recent xhci and thunderbolt patches admitted that
> > 'driver_override' was involved in both cases.  
> 
> I'll be glad to taint if driver_override is also written to, but it's
> bind() that triggers the actual action happening.  Or so the traces
> show.

Well, I suppose probe() is the first victim to crash in such cases.

But if Syzbot is binding random drivers to random devices, the obvious
solution is to ban 'driver_override'. Using that is just cheating.

If it still manages to crash drivers by binding them to appropriate
devices then I would say it will finally be doing its job right :)

> > Meanwhile, Syzbot also found a stupid write to freed memory in USB
> > core when HCs are unbound. You may say it doesn't matter, but:
> > 
> > * USB HCs are hotpluggable thunderbolt "gadgets" these days  
> 
> We support PCI devices being removed, but that falls under the PCI
> hotplug rules/requirements, right?  Anyway, sure, we can fix those bugs
> when found, but that's not the majority of what we are seeing at the
> moment.  Look at all of the dumb platform drivers that are getting hit
> with this on the syzbot reports...
> 
> > * there were plans to alter this code so that UAF is triggered by
> >   hot removal of the USB device, not its parent HC  
> 
> I don't understand what you mean by this.

There are ideas to change some code to use per-device data instead of
per-HCD data. Coincidentally, Syzbot found that this use races with
freeing the HCD and it would also race with freeing the device, making
the UAF easier to trigger after proposed changes.

I gave it as an example of Syzbot doing something useful with 'unbind'
when it isn't wasting time on driver overrides.

Regards,
Michal
