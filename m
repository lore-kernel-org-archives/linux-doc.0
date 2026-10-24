Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837685;
	b=ndkClq6XgUcdlWLuFKr4mvuINPqgaq6lM+8nbT1oGgi0VuGxLOHGxHAn141G2pkr1+1C
	 6mDjUxSzqh19A5M8K2TJMNarngKiWY+QHMv5KCHVMhXw7q4u1KnoT016rLQ/sa6xHn+r0
	 62glvHqQZHgwcsUSKFMjzPos5fs8J35gcATTm3U6khEmf3OY0NWumexvRDzfN9qaQlhVr
	 9DQ7FAU0cAyTE01WMZYV1J8hUnVfWRxYg0GZzb5PYZbIBPrueJEkpwMjoUcfgMVFRbUGc
	 TdNbVKUgOCgwC9UpL0Km2mB8Nlu8rM7vKT6X5rPsRWawUkAKhocn4uHaF6vEbTKVOlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zw9evio7WIEnyHMe5y/JwH40NK3MTc6qnKbAntWHX5w=;
	b=C8wD6JHuJ1R3sc4a8J9pqeBcwy7kNJgFma7KjUQJEg+U+/mVJV0ppFdVC161gGlzQWyW
	 0KiZFcdcJL0LAJfzPqo+Ekp+JcWRrBE+Wm4bsneqtNiOCanINzvdYUhWoRthTTcyCx87x
	 Kcbm/32gqe2gPDJVXSQI9v9W3vQEeVdG+5Wmj5bhu4RO+qzEn8ixvj4EM/qFAhzOKpKvg
	 GzXeB5EjcCLtQzMZ401DZfuFF9eiZGGjcQpgH99cf2S3/cZSUxV/sKwfit0ZeA9efJjsT
	 RhdcoirrKLDyKvlLGi6+3S9rkPSVG3HuouY8tBRbTGwHA+lde33h+roqaK8NW2m4WNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V6qybNv7;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752E3606A31B
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 10:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V6qybNv7
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1379659f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792837684; x=1793442484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zw9evio7WIEnyHMe5y/JwH40NK3MTc6qnKbAntWHX5w=;
        b=V6qybNv7xo0fC7ai3ZiY835zdKjAQDhIU7NdoTyXea2t7zlKgfDV4x2XB7n0pnam3F
         Ni7k89DraHY3DpkpWSecWSop9BPvuPLTGKdHb1+SfRqbrSeOngxyZP90iaq96bou6V+8
         MIoD1H7gvTvBiS/I+eAZwFLiZwzWV0yRUxrHGxqdxOv+e5zWpldyIW1jRUw05Cjv6qe1
         6IyEy7FkFuHnKtHb+5nYhR1t1hkssKbbMpWur1VObrDOtKVGhVSI+IrT2IcSX5UQQLOj
         USczm0QIvEKKCisyCIbIvNeR26YWY5JO8H4CoIfSIkrOsZcRecDBKUE1ZeEK/tUL1QVu
         g9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837684; x=1793442484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zw9evio7WIEnyHMe5y/JwH40NK3MTc6qnKbAntWHX5w=;
        b=1Gf3+3Lb6k0iW/ODAdRQz9shfC5xpbyraszZYz0+vRCdVkAtq5pd7TM4ITphTu4Bed
         qHhAsLbyX1TqBD/0EjzCvp6S85NJ9sixnM2VtQt1Z2y1zYA4imkHuw4EVf+KmMd+v3Dw
         Qze+Z+h75JMERbLI/XqHlh1veb5ovS3g0KBAKO2PSvqwJAGi4c/H/zzU1r4of8L1WjR0
         JuJRI8GGnzWZCPloSWalU/XUWW3PjQGwnBm/l4kDkBvMCy6QcsEEBhxB+vS/yWEc2IrU
         ZKX59GCwSszYJ3U2NP/TQz7M2iR5kOcYqCPTPmLfy+L7Ci5YXTc0ZTIiBjYuaQyMpnEf
         wH8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEBmkpKxlfjaS6JZxOdPbjYC6dybpZS8cGSNpbi2TaOYi5DkfJO9dI+0QT1/GTsxh9PwUBbjLtJ2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLst7f20T5z2e1d29dpZ/o2jL6v/tXoSsmiQ3NTrFdiePC/GB/W
	pO8yHfweiKBf0YFdiyo4A7DQ7stpWwzHraqtauzb6co07R1EzuZ2hVqB
X-Gm-Gg: AYBFou3R7ZIXtpfxLPSd/w6my+WxXOV9ly6VoUiKfVofSeGQUBDdI9xRhYmOzPqkbCd
	420yKvId/Qzu1q6C6+IvUAih15B+3Mu2PhcOKNztRNKlaQR5YKdthG5684gPcBw0w270zI73A8Z
	V5K9saxa4J7vp0vGTuBBQsjMafVUDvg3O7jtnLSCag6OGOifnT6n102RA/wXr4/HtItuBTRPLYl
	6vm8sqPNJDo6vejjIi83yK91UAhIm+8q9NHJbSmfXqQbI3VbVzpQSmZealUUXPCqT/o4LLURuXd
	iLDPV12hSX3MEeab679OFiUg9NOUOTsM4g95AhfdIQ+4TkymHt/sK0ygRtMHukbeCibfXIejFaA
	4sL/ZCU9mB0FoVmbMI3jkLA6cVg44z7FHODCyoL6veI3eFj8Ocnow6X6MEvlliszV4McwgOi/Hd
	09u4/vSwc8kIV9xM4S/+025odT+8CiQ5MHsr25JiPPKQa7rcskfJq1q+vDtDiyTd179X+Ra53VM
	5lDvNn1fdJh9PMDTAyZfLCdk2ZrYVBo4sfV+Xotv9D9cm/Bc3Vu8zxpf87w9sMPAMFZDkj5WQIn
	EIxChdQK2eu4Y4xK8l44OHskhh99jgvwTXhorBFjdwc/kWuFp9W4WzPKHyZQCFXKnI0TUZdQ5up
	SpiiPF0HEs6IFPwlixs3dUZdj9f687Z1RRL8pde6oBToXivF05tR38U4h
X-Received: by 2002:a5d:5d10:0:b0:48d:e62f:db70 with SMTP id ffacd0b85a97d-48e3eb9c239mr2514461f8f.48.1792837683543;
        Sat, 24 Oct 2026 03:28:03 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm3506285f8f.16.2026.10.24.03.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:28:02 -0700 (PDT)
Date: Sat, 24 Oct 2026 12:27:59 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-trace-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] rv: Verify generic IRQ context transitions
Message-ID: <atyGqz5lcvYQvCYp@gmail.com>
References: <20261022050712.75035-1-kmehltretter@gmail.com>
 <5b3ff014bf2f571b935f9519f422966a1c665c32.camel@redhat.com>
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
In-Reply-To: <5b3ff014bf2f571b935f9519f422966a1c665c32.camel@redhat.com>

On Fri, Oct 23, 2026 at 06:05:30PM +0100, Gabriele Monaco wrote:
> On Thu, 2026-10-22 at 07:07 +0200, Karl Mehltretter wrote:
> > This RFC adds events at the generic hardirq and serving-softirq
> > boundaries. The irqstate RV monitor checks their order and agreement with
> > live kernel state. irqexit follows the owner of a preempt_schedule_irq()
> > invocation across task switches and CPU migration.
> > 

> 
> Hi Karl,
> 
> thanks for your contribution!
> I'm probably not going to have much time to look at this soon as I have a few
> holidays planned and other series to review first. But it looks interesting.
> 
> What points my eyes is that you didn't include any schematic graph in the
> documentation.
> Some folks don't like RST, but I find having a textual representation of the
> model there easy to understand what you're trying to do without having to build
> the models.
> We use graph-easy for that (and adapt things if the model is too complex).
> 
> Do not send a V2 just for this, but please keep that in mind for next time.
> 

Hi Gabriele,

thanks for the encouragment! Yes I continue working on this RFC and use
it to check for my related early irq cleanup series. I will use your doc
suggestion.

I will wait for further input and liekly post a v2 in a week or two.

Any broad strategic direction for me and my LLM are always welcome.

Regards,
Karl
