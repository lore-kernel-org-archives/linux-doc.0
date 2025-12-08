Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F3A2248A3
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205563; cv=none; b=QyOCmXvkIy+BQS5qi1mNqyOHyVS1VXFgaGAFO8QzZ7mEPW+diCxnSHMQEnKNYlFUAxFKkLzI2PCjxcgEijFI4OT+S2YZ0rBqLaH4YaQiGFaKCRo5J9BaE3U7Bu3I+AGemYqjaQ7p1qDVFJmsHwyzEuMiWAQgODrmjweaSnQEBbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205563; c=relaxed/simple;
	bh=nWYvcuxh+/OUCF+kUOaYMcU6xa+E+OgBk319NfCP2kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJrnI1+XX+mCrMlVLqfM1l92+WmfgzF4FJdXYXW9Qat5t2XNOg5SkWaH3RsS26pgb+izlrvPODy/Ur12bpIH4umDOho4SUCUn6PqvREzqUQoTaqv2LSnj2HeJbfw2wmmQmvrFCGm6vUyqZT5FQgZveCJeWz5oKXBZq1ekPhBp7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gENVV1Nl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gENVV1Nl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso37656705e9.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 06:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765205560; x=1765810360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc7vh9/1MW0ercfPSZaOiADdk8flNIR0dxHdxBVjOzo=;
        b=gENVV1NleFZMGwJ7z7341i/s5/vr8tmkNwrac2ik0RDD67WOGJaufg97BkzwohPs9Y
         5sqEXM/w/RTlJx+cRi43ZroIo5EeTP5iEOYh4KNmdl+QhkvcEeuhCpzHFhVrvozKerCL
         cpVN/ATsQ8OVwcIPaV/xDW70W44ZWJcK/Mco5QQIorLY0GiCnPrLhDuun5uRVhrdSpRH
         cULP78wB3xd41d1V0rDXGmC6A8ZL88bWZMbKA0NYrI0WxI/y+tAMg1E9jXuhuCoAetQT
         lYC/47eJqkuvTMxPDLrcLetru5XrYGclWHmyWUvRE4EYITtY2m/kN2/QfQN99woi3C29
         mwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205560; x=1765810360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc7vh9/1MW0ercfPSZaOiADdk8flNIR0dxHdxBVjOzo=;
        b=cQ4ormolQhWdpwHMzm15B/WKTcI5/9V6N6IitaeU3qNRxAq31chQ67QbI7bD2lneCM
         nt8eP+ImoW8Qrn996YSxvaaqIEzsSkV25qZvad+aymHTfjtLoCPm4vl8Vg6le/mbGlRM
         V0cwBGbVe3OCprobQuW1KGQzCY9Qj4Vp4rLA6OuV1EVeR3LlAA7qWNT1jF63w1VsP051
         8jQCKSCtkNoyE3dq0kg7hHWY/RyjY+DpdtAEM2DWwbaco3vkqIU9pl7yQPEHrA1GRc2q
         uCbOUq9HbuSNR2w7c4DvuvgcgPfhXzZ4kXjblpUQwY8oaWgcSpQYmls6Db2ripwDeiiZ
         o6jg==
X-Forwarded-Encrypted: i=1; AJvYcCXZhqAdOAImne3ZMLgnUKyo9J4D1bWD9t/Pe5ULCHFcRoih4+AsEfTXMmG+QSnfIvw9UinsPGX5X2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhnz0Aqyzy+fw6L3woa8lgG1V4XFFtaDu2O8Te8amrmktrU+vx
	pR9+/R9+0WYRKMWwuqIajZkPlKzRgL8E4Fy/k6dJUUZ6Q3xMMPgwwULBH0FhBK6ADPo=
X-Gm-Gg: ASbGncs8d4JU4o881BfjHcjNbYc5t0fJZSCbcxh+1wcKDUm/noN+TThDOzB0rtQZjgN
	ov12189g4AVT/Zh+z7qucBX7hSuL7J3wuz7wA8F38juCroax9UF1bobYtOYe9uPZh2OB+5B8Kls
	3AhEcFTBZdfpPgcfz652k1SheTxFEJAO0Lrf7uLApYTHV1F3oVKE7BMTiUw48tzMd/SNFbreMb9
	QDpMdpC1sgH8dhxJZ4hdGta9mdJGiObIfyBS4lWGSEgTzyTygW4iZsUzIJmStrOXa1bRfGPxjsc
	S7UsTuplyfR0UCAjfRuNdK1xuvjU1+zKvGvXCqQ0lRG4YDAfQ3wxE54PBFDl74ZFLnJqEEhO6ch
	krUczT7iiABB17EdlBRWpargLW1McZrGpthYVxYHqsbwfEbxsR0zuf8p4oSNxS3W3bxhaJOt0LY
	XFkhA=
X-Google-Smtp-Source: AGHT+IGPqGF0PL/yzGyxsLLi0EbdeViTJA32Dxo2JhBeeDK3ixfFVxZQLIPBNdNJ+8OuoujtL4YFhQ==
X-Received: by 2002:a05:600c:3b08:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-47939ded20fmr100247175e9.7.1765205560087;
        Mon, 08 Dec 2025 06:52:40 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311ed466sm242094905e9.13.2025.12.08.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:52:39 -0800 (PST)
Date: Mon, 8 Dec 2025 15:52:37 +0100
From: Petr Mladek <pmladek@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: kuba@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, gustavold@gmail.com, asantostc@gmail.com,
	calvin@wbinvd.org, kernel-team@meta.com, davej@codemonkey.org.uk
Subject: Re: [PATCH net-next 0/4] (no cover subject)
Message-ID: <aTbmNdilvUq78bjc@pathway>
References: <20251128-netconsole_send_msg-v1-0-8cca4bbce9bc@debian.org>
 <20251201163622.4e50bf53@kernel.org>
 <4oybtunobxtemenpg2lg7jv4cyl3xoaxrjlqivbhs6zo72hxpu@fqp6estf5mpc>
 <20251202102442.568f91a7@kernel.org>
 <aTFmew5trILX3RpO@pathway.suse.cz>
 <aTFnzmc0ZtBvGg4y@pathway.suse.cz>
 <7jdruzcpkeyhuudwi6uzg2vsc5mhgpq7qz4ym7vqqmgs7j3524@cvtnzneddg2d>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7jdruzcpkeyhuudwi6uzg2vsc5mhgpq7qz4ym7vqqmgs7j3524@cvtnzneddg2d>

On Fri 2025-12-05 02:21:08, Breno Leitao wrote:
> On Thu, Dec 04, 2025 at 11:51:58AM +0100, Petr Mladek wrote:
> > > > > > perhaps it should be configured to only log messages at a high level?  
> > > > > 
> > > > > Chris is actually working on per-console log levels to solve exactly
> > > > > this problem, so we could filter serial console messages while keeping
> > > > > everything in other consoles (aka netconsole):
> > > > > 
> > > > > 	https://lore.kernel.org/all/cover.1764272407.git.chris@chrisdown.name/
> > > > 
> > > > Excellent! Unless I'm missing more context Chris does seem to be
> > > > attacking the problem at a more suitable layer.
> > > 
> > > This would help to bypass slow serial consoles. But the extra messages
> > > would still get stored into the kernel ring buffer and passed back
> > > to user space logs, for example journalctl.
> > 
> > It might actually make sense for the "workload enters or leaves" messages.
> > But I am not sure about the "ping" messages.
> 
> Agree. Let me back up and explain my "ping" messages better, which
> I think might add more information about this topic.
> 
> Meta has millions of servers, and all of them must have netconsole
> running 100% of the time.
> 
> Of course that this is not reality, and problems happen for different
> reasons, the ones that interest me here are:
> 
> 1) Top of the rack switch MAC address changes (mostly associated with
>    network hardware (top of the rack switches and gateway) replacement)
>     a) Keep in mind that netconsole target has the destination MAC as
>        part of its configuration.
> 
> 2) Netconsole got associated with the wrong network port, which comes in
>    two different flavors.
>    a) The machine got provisioned wrongly since day one (Most common
>       case)
>    b) The machine NIC changed and: 
>       i) The target doesn't bind correctly anymore (if netconsole
>          target is bound by mac address)
>       	   * This is easier to detect, given the target will never be
> 	     enabled.
> 
> 3) Netconsd (the daemon that listen to netconsole packets) is buggy or
>    dead
> 
> 4) Network failures across the route
> 
> 
> Possible Solutions
> ==================
> 
> In order to detect those issues above, I think the best (or only) way is
> to send messages from the host, and check if they got received. If not,
> raise an alarm (in the common distributed way).
> 
> This could be done in very different ways, tho. Such as:
> 
> 1) Have a binary in each machine:
> 	a) This binary reads the netconsole target that is configured,
> 	   and mimics "ping" UDP netconsole packet.
> 
> 	Pro: 
> 	     * It doesn't need any kernel change
> 	Cons:
> 	     * It needs to reimplement the netconsole logic in userspace
> 	     * This needs also a widely distributed binary on all
> 	       machines
> 
> 2) Send a ping directly to the console
> 	a) Something as 'echo ping from $hostname" > /dev/kmsg')
> 
> 	Pro:
> 		* No kernel changes
> 	Cons:
> 		* These debug messages will be sent to journalctl and to
> 		  the console, polluting both
>
> 3) Using per-loglevel patchset.
> 	a) Same as above, but, setting netconsole loglevel to DEBUG, while
> 	   all other consoles to INFO.
> 
> 	Pro:
> 		* No changes on netconsole
> 		* Netconsole "buffers" continues to be synchronized with
> 		  kernel buffers. Everything in the same page, but,
> 		  netconsole data has one loglevel higher.
> 		* Sending a message to netconsole-only message is not
> 		  special at all. It uses the same workflow we have
> 		  today, through `/dev/kmsg'
> 	Cons:
> 		* Needs to change printk/console code (Chris' patch)
> 		  that is on review for years now. Will it ever get
> 		  accepted?
> 		* These "ping" message will be in kernel buffers and
> 		  journalctl, and are useless in there (!?)
> 		* It is not possible to send a message to a single
> 		  netconsole target.

JFYI, I am going to review the last version of the per-console
loglevel patchset later this week. IMHO, we are very close to
get it merged.

BTW: How often do you ping the netconsole, please?

     IMHO, adding a short message once-per-hour might be bearable,
     once-per-minute might be questionable for the kernel buffer
     but still fine for journalctl.

     Also it depends on the size of the kernel buffer and whether
     you use a crash dump. I mean that it might be handy to have
     some useful messages in the kernel buffer when the crash dump
     is generated and used for debugging. Otherwise, the only
     important thing is whether they get stored externally either
     via console or journalctl.


> 4) send messages only to netconsole (this patchset)
> 	Pro:
> 		* It is easy to test netconsole connective (problem above),
> 		  without kernel buffers/journal pollution
> 		* It doesn't depend on the per-loglevel patchset
> 		* Adds flexibility to netconsole targets.
> 			- only certain netconsole targets receive
> 			  certain messages
> 	Cons:
> 		* Messages sent to netconsole is a superset of messages in the
> 		  kernel buffer. In other words, "dmesg" and machine
> 		  logs/journal will not be able to see messages that
> 		  were sent directly to netconsole.
> 			- It might be seen as a back channel (!?)
> 		* Different netconsole targets may receive different
> 		  messages. Too much flexibility might be bad (!?)

I do not have strong opinion about this.

That said, the location /sys/kernel/config/netconsole/<target>/send_msg
looks a bit weird to me. I would rather expect /dev/netconsole_msg
or so. But I do not have strong opinion. It might be an overkill.

How important is it to trigger the ping from userspace, please?
It might be sent by an existing watchdog.

Best Regards,
Petr
