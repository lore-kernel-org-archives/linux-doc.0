Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704312;
	b=dkflVgQ4dv6rXi81fi6OoSBEY7Kj4Ssc+MqKQbcD02X+mREteyTds7+lYlP5arhuS1DE
	 3ovGLkpRcdhxmH5T8Iq06IVOgHjn+Nira28ce0i5Ci3rYQJxj/GE2X2dlNbHwoLgMUqAQ
	 E11kSkZ5qYUb/HSWyxftCdjfxJ1jrtqJDsU5yLKG2mLnovkUQZhQJLGj5WwG0ufSnWRtj
	 ByJXwo0xj9sYTQeAXnxrlkZWKPKCbFXPv+y3p28VGPAi1NBmWq7EKJDkkMwginOqOxaw1
	 jsEYWq6wtzfF9PTRzpVStHvLdmg3b5ViF06kAlLbDj/oTsffPEMeQ8MkbxIagY8NzeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DRSP5dNsS3mHl0mDMeYY/G8SJ9kad2UxpOHnBXBI684=;
	b=uw/AxYcO5yuWhCMKsPrwb+fwUpNfOuilBcR6y+Tr8cEjkVWL4h1xHe84TvEjQ+YttUdf
	 lqpu5Y4iyALift8fGjfAZPI/rbmKVTtsJd5TAhnoFQ+eLQAgPBsbN8wL2RUkkImUY2p4m
	 LbxZpEjOJtpMIl12Ia/ol+hUj9RcKNLoKteeYoi0zy0yYY31NU22cmkMnImGli0yO+lG0
	 9rtp3vzqukw1v4yYBZqXyEivi7A/0HTiq4i7+nb8R0XeQoCyHZP7smVIfoa99orlV0VWm
	 W9Kw3J1Mc31sjOHSg8uN3RPZ8Axs5T0c0yeLhlLBB9UmDF3mwAaanDEQNOaG0QC0LDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VoneIZrI;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B42606BFA0
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 11:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B42606BFA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VoneIZrI
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2817393f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793704310; x=1794309110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DRSP5dNsS3mHl0mDMeYY/G8SJ9kad2UxpOHnBXBI684=;
        b=VoneIZrIjqDgDNQeYh6sNuFncCLUEz4sf+KffVyKU9JPgoaAuPHSaQJ09adwOf//iX
         dvPKugxOP47c6kXcmwY5r0qNnfa1PcceKJqRdFG1U9/xtwkoanCLczpPiq9NZhE899qm
         nMxXQHZGzkH1p2y4RHJoqNYuTsnWSndOXkBTdPwCT5qg39EMRe8IZPdo3kzQwBQJCDcA
         3LfpVp6B5Ua4Z11wn3xESWu+CQgFscxaE1qWW/TT7qqd6/6bjqPDKYplAQ4kv4h1lv0R
         mJAd5YRbV2vczxRExpaYmpDM8Xf1A63Sezd1/uA8XBs0oWDOVh9UDqn/mwXh6NR8xiUZ
         2+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704310; x=1794309110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRSP5dNsS3mHl0mDMeYY/G8SJ9kad2UxpOHnBXBI684=;
        b=YCbmvwOCVpuyy7s/VNVcJnMvk4l/GgZOgFQU8+nOoR7UTvlIjPfUY2NClw503gtCw4
         ywYXlzNe62WvOgFa5yQQexV8NKv/3snRvX6r0F5yLXlX6txq9a2Prne4FQyWWxWCPIJH
         giL1p0VD07Q8tYX0XXYogb6+eSV/7e9G9/XnRAGkxHEZo+er6el+kRPJ5eXCkslkkh2K
         p+oPxrhyk9aVEi6t6nOniqJPee8+aoWzl6/xM/mjTjverE4NAYzpB9kN0Xeo4aFu6vzf
         kW8/DzZC7Oqad6TYSoOaQQqFJs9ByGv00vvTKk8wOVqTQ/cBAG813kyx2b73UuAzIoPh
         SvBA==
X-Forwarded-Encrypted: i=1; AKwUvByS3D716IC3K//YjXD2dX0eEErymH2gO3W3AH6d6UC8664KLJjYJWS13ADFZcIDv9It5p9CTkZ51SY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q687sGgdxTxvzRhHxmkIg+/uqrRze4r7M/T5frgaQsXJ4dUVg
	v/g1aEDR8kC9bqMFCZ3VGUYHj79NNKTrWO2gaKpBp8Bmn8fRCZ7B/9qaO/ADcIJPpQA=
X-Gm-Gg: AYBFou2RsHwWR94gdjxlMfb8clFidfnHYcj4jNZDqMaatU7lZtRA1XFihbIPryZluNC
	SpyUA8NpONlTTj4YtjKs/OuVKi8l7aJCvzOQRK0M4h6pQDSmBdjX/Df5C7ObYtPXb0gEKEW8zMr
	732QtfYbrBFNigolsYVWyq14SCYB7lfdGhpPySWIB1PVodkbaXy+vmXJG6WnXiHlHt2XU818gVP
	fE0/xhT6JmGYueF6KFDzOqTohUVqyHtoV9mh7qMUBTNw2W88A/YeYUNWhc/k7flWfPGN+yDbj7x
	PM5nprtjVYu759V+8CHybKjRniLezPlP87/gNgv9oCPVkJzn4aGctgGnKp7iBaYMSamfCnQ4QUK
	3e0p0dgDDVY+Zrs3QOGRlj7GST6a1MGShXm4ywh9r8KBj0pa2jQ8sNS9T1fdSKAdgZhu9o2dfqh
	ZxBUYFQ1SM4aMYZLFG3g1T2zV22QlocuwQ9losSpzoMeQ8n8Pb3LBEX7fIWiXbR50RF9u3j8cIA
	jtNGCwY7RWhcfENtGh3BtGGy1TcZmAtYEb6x3yYveEeJHmvMhB/9HIRglaH8p/9Xil9orW6LeU8
	uLx0nqr3RQvNrYKlN5NI+JnaPM4KXgoa7ifIS4sqHcQJMlbU+nM=
X-Received: by 2002:a05:6000:22c8:b0:48e:2c2f:59eb with SMTP id ffacd0b85a97d-48e6e303c74mr28712071f8f.12.1793704310107;
        Tue, 03 Nov 2026 03:11:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm24062838f8f.25.2026.11.03.03.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:11:49 -0800 (PST)
Date: Tue, 3 Nov 2026 12:11:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>, Naveen N Rao <naveen@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] probes: Use trace_printk() in probe handlers
Message-ID: <aunBcxXXNhXDd-U5@pathway.suse.cz>
References: <179360345418.115681.193455787480210412.stgit@devnote2>
 <20261102123408.0fb950bf@gandalf.local.home>
 <871p9251ve.fsf@jogness.linutronix.de>
 <undine-1793671566795563056-fb7169cffcc7ac3c@undined.local>
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
In-Reply-To: <undine-1793671566795563056-fb7169cffcc7ac3c@undined.local>

On Tue 2026-11-03 11:06:06, Masami Hiramatsu (Google) wrote:
> On Mon, 02 Nov 2026 23:07:41 +0106, John Ogness <john.ogness@linutronix.de> wrote:
> > [ Cc'ing Petr Mladek ]
> > 
> > On 2026-11-02, Steven Rostedt <rostedt@goodmis.org> wrote:
> > > [ Cc'ing John Ogness ]
> > 
> > Thanks.
> > 
> > >
> > > On Mon,  2 Nov 2026 16:10:54 +0900
> > > "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> > >> Here are patches to update the probe sample code to use trace_printk
> > >> instead of normal printk. Since the fprobe and kprobe/kretprobe handlers
> > >> can be called from somewhere where console is locked, using printk() is
> > >> basically unsafe. Only the unoptimized kprobe on x86 is safe because it
> > >> is ran with NMI context (in this case, the kernel uses printk_deferred()
> > >> automatically), but optimized kprobe/kretprobe/fprobe are not.
> > >
> > > I don't think printk() is unsafe in these situations anymore.
> > 
> > Since we still support legacy consoles, it is true that printk() is not
> > safe in these contexts when a legacy console is registered.
> > 
> > However, the printk_deferred() variant _is_ safe from any context. Once
> > we convert the legacy consoles (including boot consoles) to nbcon,
> > printk_deferred() can become printk() and still be safe from any
> > context.
> 
> Got it. But since printk_deferred() is not exposed to modules,
> these sample modules can not use it. (printk_deferred_enter/exit()
> are also not exposed.)

We could export it if it would be useful for kprobes...

> > It is misfortunate to add documentation saying printk() is not safe,
> > since the problem is converting the remaining legacy consoles. But we
> > can cleanup all such documentation later once the legacy consoles are
> > gone.
> 
> So, until it is done, this series is valid. Please let me know it.
> After that version, I can revert these.

I do not have strong opinion here.

It just looks to me that using trace_printk() everywhere is an
overkill. It is true that printk() is not safe when probing some
locations, e.g. where a console is locked. But these are locations
where you could not use printk() even in the probed code.

I believe that trace_printk() has a similar problem. You could
not use it inside the code used by trace_printk() because
it might cause an unbound recursion.

I agree that the scope of the code used by trace_printk() is
smaller than the code used by console drivers. Also it is better
located. And maybe, the recursion can be even detected and handled.

But still, the point is that even trace_printk() is not a 100%
safe cure. So, maybe, instead of proposing trace_printk() everywhere,
it might be enough to propose it only for probing the printk/console
related code. Well, I know that it involves also some less obvious
areas, for example, irq_work, some timer and scheduler code.

That said, I do not want to block this patchset. It is solving
some real problems...

Best Regards,
Petr
