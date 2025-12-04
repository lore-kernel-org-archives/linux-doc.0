Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4CF2E8B76
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 10:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764845526; cv=none; b=a+8MJ82xnPGP6oXeke2ed2fEFenBAOmEf59MRcTo5WvQOZsP7JsgP5Lex1u+lSJFpsI1bxJ2GjMHN6RMuoHl+MF/eWUNBTwbHzMqdI6s3Mp+iQpgJ4WMkfkSFY5yVz06f5NT+MOEeI31++XMAYmpdhonp3+YoLDgl7laGZ/FsXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764845526; c=relaxed/simple;
	bh=G2VymRjHZXe3qyNYINHvi9WbRT5j4d1zO0m+NFNgafE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVeYH1UVVoiOZ+0I2lTzLgPeyWelpqGB0WYJd3oq0cLwWkoHa6mUtqU/GAJUr13zpLQOdYAtDT2lF4ByE3si52Z6W7nZbFXr8rV+NO7xkWQXT+t1/2J4ccKwBDAjafpIn8r8FSFp0nUZjeEMF+TXcNs/bgJGQ8GmapuaG0r1Nmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YMvxTj7T; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YMvxTj7T"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so6284075e9.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 02:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764845522; x=1765450322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikuUYmMKKHVhIQyzeW7NNfRK3UsPxb6hcXRzMAgnkDE=;
        b=YMvxTj7T2MxpxtNAfN8rLMK6eKt9NARsPxcRqKPbthMnh+aO3y1s9uYxw4Q4c20l0D
         Jj0fGEZ4ZU34JiOifqtMAhiFvy4tOt9kw0LnIljiKX5xDcaSEjbH067p3yIeK0j38RKX
         NwTXUjHPLlfrBKzQDnmVTO82kxjxbutnmmqPbM5Rik/jT54886szWH0DrBYXYMHKvBL0
         eB6kvFMh8VBos5UMo/e34kLcWqn5Re/CofGFHyW1eMu/ZE/SCe0n63Sf+QFo6bqyXEv5
         PzKcCvU26/i2ueIuH6R48ml1e3lGrA/5wBd7el/IQV2wzyQfnY2I/pcXolKkI1bPrT80
         8cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764845522; x=1765450322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikuUYmMKKHVhIQyzeW7NNfRK3UsPxb6hcXRzMAgnkDE=;
        b=m5fi40XhqQTAR/8iza1z4nPYtOlfDFRxpHJ1MhmCL4LV3ZumXAppJXRKygo5bFrb/f
         DROSt/az6osOcdZytkZh87NCh+nvWLNHlcvL5w/rkNWwl5ghu7A5yoBc+Y7/A7n0X5Yj
         mPIBe2BjspGYmzmQk1n4Hxs6+aBE+FZZqfauF97t0inkBD7nDWV4lbJshI+U7evD80Hf
         aJ04Z6wEXY/FkhhXw4SSKTN5fXQmHTB7aKd339oi9XoP9TW2+rnGYFlKUrtB+TDv8nsa
         yHigQp5ZEDo9DdkTjU26ZR84JjrELcMpE0l5Z/KF8dXMiqahj9VAdwz1ncvIe55EdwuY
         nHFg==
X-Forwarded-Encrypted: i=1; AJvYcCXtKqKLI7D9PfGOHENmaIYXti9Qp4fHYEPNqeTtc7pF1yLSUTvswkJTBW5LeFFeBDXEVtB41LF+nD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4gtJpoxV31cnrWmAaNTsYtm/yrRAIEmCZBDxBoKBT/6ENA2hx
	6ala5LTmFvJtmr+gEMS9nYfOMRH9xLE9BnDunCy+9yiLG6Uj8seZAgfBlctkKR5k7ts=
X-Gm-Gg: ASbGncvHZv3fmC5i/FMdJJWT7dTGCPh3l3B2utgYr/Dsfb6cYAIsCEp0F6OZlkFb6Ol
	DkpTDFii8Jtj8+Uk7Npm1I5mVOpbadXXOSvgiPZewUMIqNj2PRMTDagrjB2+eFs5oZpNraZ2rX4
	3OzQwkMYyE3J5tdyJlKRTfUGcBhWq8veiEKYRdTSiGXll0XxwKqMbaBi0/mqNjcyW3Unoe3xrdg
	e/M7O4vAS+mcfRw7plD7zu9Kx9TwV5dhB8UzH2qVNdmwtejTpwvJTOBL0xXCOoNpDCceQ9wFe8Y
	4PplBzr8+Cm92DQNKu5jFobv04o0ukaC9H/XWGzJMtdd/TRTEUbrnRUfWXLBa0LrWDN8FDeBNUr
	O+z1Aa9DJmDifmJ5kKKIL/ab8LD7eJRA3/XwRIMbeh/aFMDWjP9CN9hOMqgWKdqE7mmMnQVU+CT
	6NmXRusr+lP0pNnw==
X-Google-Smtp-Source: AGHT+IFg5ESd2o+IvztcBtJ0/wOI4aSHSZlOftAJV5K+ufU+HQ3XjtFJaAZBBsA/B0v7OSUnyh7DWw==
X-Received: by 2002:a05:6000:430a:b0:429:c711:22d8 with SMTP id ffacd0b85a97d-42f7317d13emr5968584f8f.15.1764845521589;
        Thu, 04 Dec 2025 02:52:01 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7ca4f219sm2565843f8f.0.2025.12.04.02.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 02:52:01 -0800 (PST)
Date: Thu, 4 Dec 2025 11:51:58 +0100
From: Petr Mladek <pmladek@suse.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com,
	calvin@wbinvd.org, kernel-team@meta.com
Subject: Re: [PATCH net-next 0/4] (no cover subject)
Message-ID: <aTFnzmc0ZtBvGg4y@pathway.suse.cz>
References: <20251128-netconsole_send_msg-v1-0-8cca4bbce9bc@debian.org>
 <20251201163622.4e50bf53@kernel.org>
 <4oybtunobxtemenpg2lg7jv4cyl3xoaxrjlqivbhs6zo72hxpu@fqp6estf5mpc>
 <20251202102442.568f91a7@kernel.org>
 <aTFmew5trILX3RpO@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTFmew5trILX3RpO@pathway.suse.cz>

Ah, I have sent it prematurely.

On Thu 2025-12-04 11:46:21, Petr Mladek wrote:
> On Tue 2025-12-02 10:24:42, Jakub Kicinski wrote:
> > On Tue, 2 Dec 2025 02:18:44 -0800 Breno Leitao wrote:
> > > On Mon, Dec 01, 2025 at 04:36:22PM -0800, Jakub Kicinski wrote:
> > > > On Fri, 28 Nov 2025 06:20:45 -0800 Breno Leitao wrote:  
> > > > > This patch series introduces a new configfs attribute that enables sending
> > > > > messages directly through netconsole without going through the kernel's logging
> > > > > infrastructure.
> > > > > 
> > > > > This feature allows users to send custom messages, alerts, or status updates
> > > > > directly to netconsole receivers by writing to
> > > > > /sys/kernel/config/netconsole/<target>/send_msg, without poluting kernel
> > > > > buffers, and sending msgs to the serial, which could be slow.
> > > > > 
> > > > > At Meta this is currently used in two cases right now (through printk by
> > > > > now):
> > > > > 
> > > > >   a) When a new workload enters or leave the machine.
> > > > >   b) From time to time, as a "ping" to make sure the netconsole/machine
> > > > >   is alive.
> > > > > 
> > > > > The implementation reuses the existing message transmission functions
> > > > > (send_msg_udp() and send_ext_msg_udp()) to handle both basic and extended
> > > > > message formats.
> > > > > 
> > > This feature (in this patchset) is just one step ahead, giving some more
> > > power to netconsole, where extra information could be sent beyond what
> > > is in dmesg.
> > 
> > Having extra metadata makes sense, since the interpretation happens in
> > a different environment. But here we're talking about having extra
> > messages, not extra metadata.
> > 
> > > > The 2nd point is trivial, the first one is what really gives me pause.
> > > > Why do we not care about the logs on host? If the serial is very slow
> > > > presumably it impacts a lot of things, certainly boot speed, so...  
> > > 
> > > This is spot-on - slow serial definitely impacts things like boot speed.
> > > 
> > > See my constant complains here, about slow boot
> > > 
> > > 	https://lore.kernel.org/all/aGVn%2FSnOvwWewkOW@gmail.com/
> > > 
> > > And the something similar in reboot/kexec path:
> > > 
> > > 	https://lore.kernel.org/all/sqwajvt7utnt463tzxgwu2yctyn5m6bjwrslsnupfexeml6hkd@v6sqmpbu3vvu/
> > > 
> > > > perhaps it should be configured to only log messages at a high level?  
> > > 
> > > Chris is actually working on per-console log levels to solve exactly
> > > this problem, so we could filter serial console messages while keeping
> > > everything in other consoles (aka netconsole):
> > > 
> > > 	https://lore.kernel.org/all/cover.1764272407.git.chris@chrisdown.name/
> > 
> > Excellent! Unless I'm missing more context Chris does seem to be
> > attacking the problem at a more suitable layer.
> 
> This would help to bypass slow serial consoles. But the extra messages
> would still get stored into the kernel ring buffer and passed back
> to user space logs, for example journalctl.

It might actually make sense for the "workload enters or leaves" messages.
But I am not sure about the "ping" messages.

> I do not have strong opinion whether adding the
> /sys/kernel/config/netconsole/<target>/send_msg is a good idea or not.

I just wanted to point out that it is not only about slow serial
consoles.

Best Regards,
Petr
