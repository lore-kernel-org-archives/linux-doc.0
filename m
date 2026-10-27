Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105937;
	b=f0E0vR5w3AnB8uMLZrJNPFML20O0CG9zznV3gKMkIAfTo+A9NNNPhmPL3x6vb81Ts81U
	 hAFhIvg6bP/JzPGiUgq6r7hdoWpCNsWlztUr4XC4vjliBmm4wKfRCbttjKqlRC6W9AWB1
	 8wd6EYSR2wVumNXz1FxEfElmYQIWEM9ShlUMZqKZE5xz43eQJFidwnfqHfytJypYvPX7G
	 /quYnrSzcz2WwH7UXkf56VH8t7SKCrUUHfsnnaKEQ/J8tzTEUc8eXMutlVaZ9I3MJt0I5
	 aE0HPGyOHntEuq5FYiiCG0g93QPF9AyfGJDsrfKzwRj2hnDRuYBgVQRSYiLdjh6wwBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=b2oJG/Cx+yrxp2tVulERESQsUaYqENiGI/N1hIw4DgY=;
	b=KHA+O3htfdyMuPsEHtgr8mqAA3rgHNG+mQNGpGKBUbShxBdRb8TNIhJrygXesrZZ4Eez
	 6F9KFWK+9zWfwmyj9Nly7swyywq8CEPNia91tw0c0cy3q3QPaCxZIr4ITLu1JB4w8qSo/
	 V4IaDKkg6gWP+FGLIX58rkfOiauMAFxH/iIjea6RCEsLLgbxqZrlgGxL1brsCo0FggOLB
	 DsOIZDEZE2tSeqZ7sA/bEp2bAFMsOWTV6r5dvFlDvsJtDLDX8alSPrgaJoW25v14n7fh+
	 5yVYMTBPvReQY4n9YeBa/XiWk7KHJjtSHWqo+5j1eAPjfysuv6Fp6c/n3dXMB92MUQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A713B606A31E
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 12:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A713B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214af2076so30678795e9.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793105935; x=1793710735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b2oJG/Cx+yrxp2tVulERESQsUaYqENiGI/N1hIw4DgY=;
        b=dCSBHlqJhbxGNxDS28So5RrVfZbL9zjwyxN0BnPVQzn6xBvQNqDzN8GcLoz9swLVXy
         KW+y+lNSZIKsl81mHaSzYspKq0V+gopGCvEfclPmjL1bC+JXRzy1LhZKgMysuIP1bUNF
         1zWrlVUj6iLBuWL6qS5CHZCLctqLx6E+u/nRJp9bT3jRYNWVj0N0dPsbXSjedTXUpuag
         Y+aEcVbY0czb5Dz5mRrmKXWnjUo5kPpKnxNk+aYYzYnfWl8FD+LNLItQMWQd1eG7E4sG
         LS+jDkeHD2jpfcLzzF87vvM1S9lQO9vpJl8N6TIJXRDdtIQui4rq1xQ7KuzG9HFysfyA
         AX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105935; x=1793710735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2oJG/Cx+yrxp2tVulERESQsUaYqENiGI/N1hIw4DgY=;
        b=XB/lHAuE03Dfhu255qJlQkpMyJJ1NrApz20iWvBjcHxuHQawGMerFbArzQL4neyIn7
         1LfyYHnWSn/ezma2nG4R56kMwOeS8w655oYun8aScZjXw4HvXSzB0m4SPkTPKMIg2g5j
         C4NBvBkvonK1DJd13taCVQXOSGVj+MGCQXAIMpQpbAXANrNtPqdXybc4JdfIX9Vrt0PI
         WAKQqr5qUJB7Mljg47x454HWNVRNZ+PywCYos3w9coEDLINbcqc5uPrbu33H06i+6qwM
         3AvdgmzLPFZUy6/7z/oDfM+kWhEWOWpG4Thkk1nqg+oCDayzyS2inH8WzGqj36s+cdL0
         JTXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsvT64krPu9pSyZfxX0YaJ6q0DxhPhfL8fROQTW0XJvzPNZXWiz57IukHUNy02mYePI3oMOBGBzuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEWH77WZXwDU+YvZCzEuZxiZTSCZEMts91GgAmKPUzaESu/esq
	fYvzuz/E3pY3++cRnmiYuy1taQXSl2i/DuhLHVXFIih8SLi6hmbm3sKeYjWURSYMFu0=
X-Gm-Gg: AYBFou2WMfGmtMH8kF6RBqSM+aA0/tPxciPoLCnluVI65hEeTYBIlbJm94F62Lu6aV8
	2BKyfdJ6E9OPi/qI59K0D8oh69XVjI8K6pAvlbXApnrUWQ7xaWBxaULjOLuDTF8zA38N0WWdwUV
	TNbdOwu0xnBWfgTD0U039pifen3pz6XG+yVR+pO1CCyZcp1OCn8EcFJdztfT8W6Gr5Xfjn0iFEo
	EdeXhouv5e2GlIU8Dt3z6YvFqiS5S0TmH4BBaRctFzDlDGwa4Gm9NLgPnZSvup1FnTazC+k+Mky
	dvB5LfHFobIfjyo+GRyPSytWlEfRXzlfg+mvdy4rPFmgmlXcNBGRdBFqsl67rQBaUX5+vBaIsQq
	WfHm0EWsyKplKbTC9wB3i7KgVTmeM7xbSko/iDwpL1c42CkCisizExW+BVimhAfJlcqvpXxNGn5
	I6h+EN1vB+gPLUBmd25wzS2Ocyz5RQU0w1WupNWpuop3fc6b3F/gbr0eakgoo4vuiF3tYvjnZe/
	3fedZ7Eiaxau6wcc9VZ7jE5vpJCJigMY6Ul9REOV+avZTpBodPIyN5r6w==
X-Received: by 2002:a05:600c:621b:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4a35ac95a53mr181284635e9.14.1793105934989;
        Tue, 27 Oct 2026 05:58:54 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d9280sm262504675e9.13.2026.10.27.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:58:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:58:52 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>, chris@chrisdown.name,
	Sam Crossley <samuelcrossley@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Message-ID: <auCgDAzkio4RVfWK@pathway.suse.cz>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
 <87fqxskdpl.fsf@jogness.linutronix.de>
 <at84qygscue8crQi@gmail.com>
 <87a4o0k3qa.fsf@jogness.linutronix.de>
 <at9qgBucVm-QHnye@pathway.suse.cz>
 <87zew0ifpp.fsf@jogness.linutronix.de>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zew0ifpp.fsf@jogness.linutronix.de>

On Mon 2026-10-26 17:39:54, John Ogness wrote:
> On 2026-10-26, Petr Mladek <pmladek@suse.com> wrote:
> > The "replay" approach looks like a big hammer. Many messages might get
> > duplicated, especially when the outage was small.
> >
> > A better solution might be to do not increment con->nbcon_seq
> > when the transmission failed. And try it later again.
> 
> Note that there was a time during the rework that we used to allow the
> console to return failure but decided it was too complicated [0].

> [0] https://lore.kernel.org/lkml/ZdTCZqhZww8_WgSU@alley

It seems that the main problem was how to handle the nbcon ownership
when the callback returned an error. But I think that has been later
solved because we needed to re-acquire the ownership for the clean up.

Honestly, I am not completely sure what worms could jump from this
can. But I think that adding the error handling should be doable.
Well, I am not sure that it is worth the effort for this use-case.

> The kthreads are setup to stay in their printing loop until the backlog
> is clear. Having a nice=-20 task busy-loop would be bad.

My idea was to put the kthread into in interruptible sleep. It could
be woken again by a timer and by the next printk() call.

> > con->write_thread() currently does not return anything. I believe that
> > it is partly a historical limit. Two problems come to my mind:
> >
> >    1. There used to be a global "console_seq" counter which was common
> >       for all console drivers. But we have a per-console counter since
> >       the commit a699449bb13b70b8bd1 ("printk: refactor and rework
> >       printing logic").
> >
> >    2. There has never been a try-later logic. But is should be easier
> >       to add it now. We have the kthreads. And even the legacy loop
> >       is able to break when there is not progress.
> 
> I suppose for only the write_thread() callback we could implement some
> sort of throttled retry if the console driver reports failure. But this
> is assuming console drivers can even detect if it successfully sent or
> not. The netconsole certainly has no method to _know_ if the UDP packet
> was received. And UARTs (asside from flow-control) also have no way to
> confirm that the other side received the data.

Good point. We could detect problems only on the sender side
which might need not be enough.

> Breno and Sam simply want the user to trigger a replay of the full
> log. Essentially a sysrq-R but per-console. I think that is a reasonable
> request and certainly much easier than attempting some sort of
> transmission guarantee.

Yes. I am not against the interface. I just thought about a better
solution.

Best Regards,
Petr
