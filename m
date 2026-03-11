Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC73D3CED
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773226062; cv=none; b=O6dc86nk/+l5JeI7DAfLxXlKvQIgYJY8WbzeXN6Y7uukFNKP7SP39XIyVYpK8HQUolCFqUgdqrdACjhG4lgSAMsOgxpaaUB/nfr7St0ZINqdMhbxnS1fFGJtoEM+znmhirA0XGk1o0S0rY0KUdqt9X0pGuJZivciK996puXK/VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773226062; c=relaxed/simple;
	bh=zRCIOZXGAulewyBbqGE0TlQlTPqeFeIDTbPGyy24MV0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M/Kvey38hxllltljXfUMcc0Q0tWF+/5PyKrN9phktKQxGWnHkG3ATtbdm6KS0CpsAme7GrSDTLiT9fBCVdIL57ALELxUEsO1pj0IgxmWrCUGRlRMNdO7Et2C3DSFDYEl0Y2ARDIs2wdfyOtsmkSOaIdm1vxK5oWecDvWPZ648R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+NfnaGG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+NfnaGG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-485345e1013so6526435e9.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773226059; x=1773830859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us9WYwCiTBLLsk5cVeG22xmuXfkRkjPu0Kbcd1njBZs=;
        b=l+NfnaGGhGE/Qag8NAZKtowOcVY2wLQCbEgf8MnpvieTQKfxTgLXG7gVpu41GQE3Cp
         lhcuSJ3ojhuoA+XvMW4ZK8DqWwguSBIQJdzHM+m0gGn1i58Im+PG8aw4GSSmMwNkHayu
         W9J2Et5BO3MOuAYEpSQbP4o8f9J9gsDj/OANzpqDRda1qkC6GXeo6tLR1/FbLVhhy7Cf
         MUxhHc5jx0lvSaHnxQ6WahuluHX1XzGqARVN8PyVe1PrQbU+agAKtUfEmOiyxhtTA+gY
         BR6kn5ugraDiB91Rov4L/mant481Z758KVbs1s66hkgz+KSI4U1uv3Da1yI4gGWMgZ4d
         Uvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226059; x=1773830859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=us9WYwCiTBLLsk5cVeG22xmuXfkRkjPu0Kbcd1njBZs=;
        b=Og1g0AjbN+cOTiGois6fjfeTDjpPS5f585nxpdkXf3YDHSj+BBv1dWSvblfVJHHK0/
         f27aRnEXUfSUHv+fhlYKyn0qS0PVdfEafxP+Ha4fr3qobFB24ACNP2mKgojdQOv8lb5i
         sEISHiYhzgD34Abk89bgBztQskypIeVjkwe9YRd6rwuaLUrn1n9KgJJi2A5hliwf2bLD
         bUhgKakGHsN6t2oKHXO3g3rh5HKGJcsCOH8nHwF7K5yeUK4D+2svr8WoC/NHSy4ezm4O
         v8kDUWA5nthjWCp58kzrCLDcjzZfigwPjD6cjVogIRYT74jRvE5qoazWDw1+RXbKLJd+
         FHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3EYYzXJLnV+gWNe7zYBeBZ64MJqJkm0jv2m0A3X5ucW1eJqlxY9B3cGcswnKP78pQl1LPHpMGL9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjpcw4ZDvidkCa/uE/hjnxTD7R4cCD8pRTBtW3hfz9uysvFW+y
	k0nW3/QKIqbmC12+mj3E5D87Bp+lg152Q50xiC1n7A6Udx3PlobdFRnb00hCqD58
X-Gm-Gg: ATEYQzyPA2d0aFzZX9VKnfGaKncBw4b4xMWdMs35Mh16zJfWb1eF1UUrpiHSrYTwh8u
	XpznYk665eP9MvKmixYvR4A7PVcjcN49dWuh0mNULqJH6IgK04Ph2pybRIWXCmFGSMNrADsiEU2
	B/xusa4GQWNLi+3zGWTCaiTh8XbKOtDcIeq0zvrkPlNlzOjhJt8dlhtzs4XvbqSJAyJaYQL2hbe
	4OqTOjKh8AZuGwcYJYClQjaKhj+6SliiOLy1d2TvvRaZoiYFmO9wxQb5OIZgR3xL9hsEggRUNcc
	e+6YeyZzMl+qeFq627DWGHOnkn2Ddlzou3BVuqapWJo6Ct0Imw4eM9QNEqWvYNX/qUz8zINwILI
	nyk3ekLo5+XvJcDIuJ9wQQBCReKUwKsifecMHbOYCVcnH3DMIIX3DqVBMsSOCfGfefD/1nqIudJ
	o2QEstNTZEKBqz2O/7P1BgRcFBdG6lg2mAIBo1Uki93Cr0ecqyOaVZU6XotBOIBoHjcnH2zgG3c
	g8=
X-Received: by 2002:a05:600c:5298:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-4854b291dc2mr30148705e9.15.1773226058755;
        Wed, 11 Mar 2026 03:47:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f820a2f1sm5725154f8f.30.2026.03.11.03.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:47:38 -0700 (PDT)
Date: Wed, 11 Mar 2026 10:47:36 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-nfs@vger.kernel.org, bpf@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-doc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 netfs@lists.linux.dev, io-uring@vger.kernel.org, audit@vger.kernel.org,
 rcu@vger.kernel.org, kvm@vger.kernel.org, virtualization@lists.linux.dev,
 netdev@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, Christian Loehle
 <christian.loehle@arm.com>, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] kthread: remove kthread_exit()
Message-ID: <20260311104736.51b53405@pumpkin>
In-Reply-To: <20260310-work-kernel-exit-v2-1-30711759d87b@kernel.org>
References: <20260310-work-kernel-exit-v2-0-30711759d87b@kernel.org>
	<20260310-work-kernel-exit-v2-1-30711759d87b@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2026 15:56:09 +0100
Christian Brauner <brauner@kernel.org> wrote:

> In 28aaa9c39945 ("kthread: consolidate kthread exit paths to prevent use-after-free")
> we folded kthread_exit() into do_exit() when we fixed a nasty UAF bug.
> We left kthread_exit() around as an alias to do_exit(). Remove it
> completely.
...
> -#define module_put_and_kthread_exit(code) kthread_exit(code)
> +#define module_put_and_kthread_exit(code) do_exit(code)

I'm intrigued...
How does that actually know to do the module_put()?
(I know it does one - otherwise my driver wouldn't unload.)

The corresponding try_module_get(THIS_MODULE) is done before the
kthread_run() (and has to be 'put' if that fails).
So there is an explicit 'get' but an implicit 'put'.

While a loadable module that creates a kthread usually needs to give
the kthread a reference to its module and then have that reference
released as the kthread exits, I can imagine cases where that isn't true.
(Or broken code that just hopes the module won't be unloaded just
as the kthread exits.)

It actually makes me think that module_put_and_exit() ought to have
a 'module' parameter.
Or, perhaps, kthread_create() should have the module parameter and
hold a reference to that module until it exits.

	David
