Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658AB33B6D6
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 17:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565483; cv=none; b=cpN8s99xvS8lykVPNxIrYibfeT90AaHf6TtnwJafrf2wYmff8dAjnBFq5Xq9ICoXME3d9aYi+FZGvqBfVE4oWt5f8hCqd333KyHqP9QXaD6f9Y6qQvnbKkcA6OsTQVbp2aZffuMO9IUEKnWfCDV/RSAabp4/dd3EhOLBRFWN+qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565483; c=relaxed/simple;
	bh=TPMxjHFy6NAhtBScqVVzIjOVVdFD4MHNL/+9nutj5ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/VwmGl44TUBxPTiLub5TsBMYUnIVm9qaXzjOnih7++ODHSSMyjnxGOUeUOMWCSngtzjQ4sHOth9oFpH252aNVOXi8t0IIpsc+GWbuwPXeftV5ETFL/KnCtGBsRo64VTmoRE522xydG/OFkyuCJncWKlxugRDljvfdW+q82tsxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpApobz7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpApobz7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16c399641so749695e9.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565481; x=1792170281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LrMC70e9+PTh4RX8wSyKvGIWWB/E2Z8AYGozH2Gp3A4=;
        b=IpApobz7oEYPOFXQQOFL6XNDduMUo6DtWoId0MOwl4Wvt0fl8dwd+nnkKFN4iyb/uG
         RL1gd4Ztv/Lmx+oQowvcNarJPW49S1i5l6sVrM4cqAxbAhB2p7JQ7fFF9fCv99UZllza
         eVgQwuy+BhrW2UiklSq5nSVErLyzmXuLb5cbwGhQmGscyFgzrxxeHMeVV1B8WZGBL11O
         dtllavpcPP1pLmJk/uAlHm1aKK0f+OLrIm8YhRJnMzdPypx3Ffz+nq38s4yHbogJ+7pH
         +pJnRQG9ikXgoKlyTrVKkE90z2bB8uYBStnDQF3gicC2Gx1T3S4tTYVQJSZWLSIeUEiK
         y6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565481; x=1792170281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrMC70e9+PTh4RX8wSyKvGIWWB/E2Z8AYGozH2Gp3A4=;
        b=LguFe/+KCh4HYn9ts961drvHI1G+NXH2HJT97oX2iFDS0MQ9jiGnHNMoIyPuXm/iwz
         UF8UVUfTWiU0SBvRWOOJS1LX3qVqYqgpMr6Z6o49YbDy8itkMIx2jtnzNpWpsNimri8g
         UtLC/Hp1l2hlpNKr/srDHiuSCCkZPEvs+eOByIbdeHARrgRnR/t4+0PNB5ik6sFFjbjD
         xc+s1oiw4Y0LnlMlHhr5c8p5FCXn50FD7LusBFFzVMFQRZLd+yggfpgjQiFPDd1yufXA
         fHZFJ+uj0Ka1ecLbqR+NgkKWklmuxJPuYeedA43AcIaXhA36mw8IbBq2lddqIwqmGTZ7
         LlJA==
X-Forwarded-Encrypted: i=1; AKwUvBzDgHEk24AMzmYMb75JpRpEILSj/LzvjZ1QDqVtCf4J01f8tM7BRSE6KR39YXW1IjzZ0EHgNh3eWBs=@vger.kernel.org
X-Gm-Message-State: AFuF++nEGtvJrI1+jt+hEzY17oFvru+xm22yibRsqAZAwltfzCGUhpKM
	Y8FZKvq49s3SdhFARhUYrrPyTeBs4J+s8Ttr9uWhT4rYnMJPnyXIc/DG
X-Gm-Gg: AYBFou2DTci2QbqGEzMwloShJXdQIFk/Jhx5teNnh4XdQY8xJL2d89SRKfruPKDTbCf
	zw2XpE/s8onaYGJ+3IcR5BXjZGoAK/pOJwmZ6YNcHK4+eCmppvc+Ml6VYikb6RQzvEhyLiSqmhS
	Txh6RFqo5pW+s8VQN4WP7ISavoV6CAuahf8iVs8R3YgZ4BIx8VcA0Go7jKCYIq5eX7t5aaz7l+S
	ZHvwz3OQHegs3hXCFvQEs5N6+ayZj92HjgqVk8EGOkWXvhMOQRG7e38XHk6B2XUY0S1dl5siBlU
	G/5249S2TLcBOsu2k0ag4uC+sajV2HwImz8PyQKQxNj3nl4V/eHbk+ostwbSoClbr9WPwMmkXhB
	0hpueEE7oxgLYUeK069m9WMhrpawIBKT5Vvn+JeZcuBvVXsUh6xGZ8GBGoABlShoZlRXYgE4j17
	XLSXSK4nzShZyDoCr1Gc6QbY75wJjhZHeK7ho8GH5U71n1AOSlE91jw/SLCq9AwH1Y1vslcFcIq
	/T4NIBSGeDP4GH6BDVCzpVzMJjBWJzd2lQ2SebenKJpUUFKkMNOnPA+cXIhwk2YV5sGAyA03mPp
	Yqwzxl4aqbTGu6UTxrlp3fL4OBbGTeDZ/LbTPET7YenYq6PMe4PBB0RLTGVdc0TWKArxQ2B3qlA
	=
X-Received: by 2002:a05:600c:3e0a:b0:4a0:1c10:1372 with SMTP id 5b1f17b1804b1-4a18e4aa206mr51409345e9.27.1791565480423;
        Fri, 09 Oct 2026 10:04:40 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abce2fsm4945670f8f.33.2026.10.09.10.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:04:39 -0700 (PDT)
Date: Fri, 9 Oct 2026 19:04:38 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Bradley Morgan <brads@mainlining.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5] softirq: Preserve interrupt context during IRQ exit
Message-ID: <askelKsbreC8HLpa@gmail.com>
References: <20260930191432.62760-1-kmehltretter@gmail.com>
 <asTG09Me93-zP3aG@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asTG09Me93-zP3aG@localhost.localdomain>

Hi Frederic,

Thanks for the review!

On Tue, Oct 06, 2026 at 12:00:51PM +0200, Frederic Weisbecker wrote:
> > +static inline bool softirq_handle_begin(void)
> >  {
> > -   __local_bh_disable_ip(_RET_IP_, SOFTIRQ_OFFSET);
> > +   bool from_irq_exit = in_hardirq();
> > +
> > +   if (!from_irq_exit) {
>
> Is this variable necessary?

No. I'll drop it.

> > +   /*
> > +    * Wake the timer thread even if the interrupt hit a softirq or a
> > +    * section with BHs disabled. Only nested interrupts and NMIs are
> > +    * excluded.
> > +    */
> >     if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
> > -       local_timers_pending_force_th() && !(in_nmi() | in_hardirq()))
> > +       local_timers_pending_force_th() &&
> > +       (in_nmi() | hardirq_count()) == HARDIRQ_OFFSET)
>
> NMIs shouldn't ever take this path, right?

Good catch. I'll drop the in_nmi() test.

> > +   /*
> > +    * tick_irq_exit() relies on in_hardirq() being false for the
> > +    * outermost interrupt.
> > +    */
> > +   preempt_count_sub(HARDIRQ_OFFSET);
> >     tick_irq_exit();
>
> Can we also extend the HARDIRQ_OFFSET context coverage to tick_irq_exit() ?
> From a quick look I haven't found anything that would prevent from that. You just need
> to turn the "if (!in_hardirq())" test to "if hardirq_count()) == HARDIRQ_OFFSET"

Yes. I checked the rest of the tick-exit path and found no other
dependency on HARDIRQ_OFFSET being clear. I'll make that change.

Karl
