Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0143678A4
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839384; cv=none; b=pJE7JsOJoy1OfQdVA7BCUnpsZwg7bSTbxlMX/TUoARI9cKsMUGOWrRi7GfIXsQLbsZTRyo1AyZOFW8rEGQlbm6hJlbsuUr+zobI6FmQBGy8+SBtioNjQ9sw5SG2zG2k67Y5R61HsH4Ae6TxgZ4aIvhgYMkFGXqWR5GsfcYw7AZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839384; c=relaxed/simple;
	bh=qGJQXIzENVKhzZXFqgus/jpi9cePk9wkQ5UhmV1zcwI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=oi2n+RHt5e/aGoyidBJu4vsqWvJXDaGRVuuX6x7swBtQYbSxetDiJtW4Y/vWQsJqvgQgOv/i2wI5xjyGUcdRWyeuJKEpuGWF3eUUL+OCo62ryKfOLcJVZnCcIsf3piTT96nuBDkbBPdFIPPVE97k40F5NzeuVuHXPZ2jAuBNG2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h8GiGi7a; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8GiGi7a"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47113dfdd20so4447145e9.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761839381; x=1762444181; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZFzmAs0SnwZHTyxiCQhAISrQWOnEHGBMPb9o7XdacY=;
        b=h8GiGi7ayUhzt7wVgE/LBAp8dylPUZCZaWNGMBNIdHmCnJr6FHh3AAMs8z+ULMqWxT
         eHlfz0jhKE0wybUi3ghRRaIuD/actUDHfjcEKELJEMw9XzvfUvpRV+KzQvBSvqFN8qML
         X0cPuZw4v65Yz3CDNhFVS4+glMEcWG3x435SzuCht9vkaeUZF0iVeiiLP3tAmVWMhRWZ
         jh4bHRZFu8mPdb6Dsfz2/XNzwZW4WNn6zrMb/nUQ+m9Sextay517Z4wOxdiMoYw/ysdA
         IwrozR0iLeEbqXksF4JLo2CqPBqrcTJDnJiz38YkEjnGrXwpMoV6q8ZyhsTtlSDEl3zf
         SczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761839381; x=1762444181;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZFzmAs0SnwZHTyxiCQhAISrQWOnEHGBMPb9o7XdacY=;
        b=uQkumUKH3xQs1F7HmhpO/CEKf6l+XZ8GUnKDL0QB/8J9JgPt4GnfJqLjPnFH8mnG1O
         GLd9KNHTMy4ZvUe/hF+Y7g3JvjZnZHlZHSUAiwhYXXWlxGGBxm97qjQN2S4BsWucYxSS
         IgHM0qTllMMJI8MoRFCJCpeRldYDPZ/J3JcyIAsEfWEFgtQWiSElP6XI0coy3x+qh6c8
         S7VBHB5NoyYY4j5PGEt2T1RnYnYOadP+svmvPFHHmJIROqQoZu3anno+Ya9uAP6Rs3EX
         hb3Ti3nsdOOiy4iDVA7+34WdyJuiuy0keMoqgiAclYcJOWpy9jZqlaPG78UzgAU2DEQr
         m0hA==
X-Forwarded-Encrypted: i=1; AJvYcCWcdemwLXjZmVItwYpD1zf+ub+JSTHZWQRdVuS7eT7I/wmxOwJBbRFI/5j+s2n5ctsQnBDDL8IxXOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUrlK94+k4X0MNW+EXgoTWRFmsGIWa2mFM+QHFlhdggnhZHcm
	sdjblFw7nxEFVlwxgzD9Ekh9gAD+6bl82bQNf4F7UeKKZ/9MeGun60G0gj/m7U1X7K/4mlSfSVG
	Zon+E0B5WAWTeEA==
X-Google-Smtp-Source: AGHT+IGBA2lpZUSLCjfeKNqH37XEkgRmaFO7ZPXyGAUePy8kb9MXP5eNENudc2tbx+F3YPjQ8UIPJq3fcamnSg==
X-Received: from wmbgx15.prod.google.com ([2002:a05:600c:858f:b0:477:e0a:f99e])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e06:b0:475:dc58:39e5 with SMTP id 5b1f17b1804b1-4773089b541mr1846735e9.27.1761839381266;
 Thu, 30 Oct 2025 08:49:41 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:49:40 +0000
In-Reply-To: <20251030-b4-prctl-docs-2-v1-1-396645cb8d61@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030-b4-prctl-docs-2-v1-1-396645cb8d61@google.com>
X-Mailer: aerc 0.21.0
Message-ID: <DDVRXPUAWTK6.2658AGIB03073@google.com>
Subject: Re: [PATCH] Documentation/x86: Fix PR_SET_SPECULATION_CTRL error codes
From: Brendan Jackman <jackmanb@google.com>
To: Brendan Jackman <jackmanb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Balbir Singh <sblbir@amazon.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<aesa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu Oct 30, 2025 at 1:59 PM UTC, Brendan Jackman wrote:
> -ENXIO   Control of the selected speculation misfeature is not possible.
> -        See PR_GET_SPECULATION_CTRL.
> +ENXIO   For PR_SPEC_STORE_BYPASS: control of the selected speculation misfeature
> +        is not possible via prctl, because of the system's boot configuration.
> +
> +EPERM   Speculation was disabled with PR_SPEC_FORCE_DISABLE and caller tried to
> +        enable it again.
> +
> +EPERM   For PR_SPEC_STORE_BYPASS and PR_SPEC_INDIRECT_BRANCH: control of the
Ugh,           ^^^^^^^^^^^^^^^^^^^^ that should be PR_SPEC_L1D_FLUSH

I will wait a day or two before v2 in case anyone else spots other
mistakes or has other comments.
