Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8541D22F
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814123; cv=none; b=o70HJJvVEeIvI+lenZgw1H9zrO7F9hkKNOJDU2IcsGg3mcFeND4/KTDh+GT4y83OLpdm1ocIO2HrmuPRB58IhPEO5ZiXWEOOlPaZgFaQPXitCiMUn2cnsueWKwl6x2LRKUebXSi+MgdCeDLjTz99eW/rf0RotEIb3uJjfDawInQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814123; c=relaxed/simple;
	bh=BUvio0nFXwJTZGYcHXtC2iqnTAhItefzjqHXEQ3i7Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYnSSLjsmOxFkvrPH4LyfwEZaHPu8KbHc4uO7lqePqETpJ7d+FkTvDw+gC+lncZq11gdDdRuq827+Z4v/A0W+UAEhips6FcDmYWSVpheT0QEF2wZDa/k5HxG7/VdIOzaxdKdeXzOYjKSXSsdS1lqbvynOYO+nUxgazz+hcia3TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=a3eDqMyI; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="a3eDqMyI"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e67555e24so45611685a.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784814119; x=1785418919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I/4mwEccc62tzF2sjEuH89YWQVzfuPzmAUNTsnnGbOQ=;
        b=a3eDqMyIL/QSkCL/xlSqJWLUWESz/4KtXplk/fIxxNauuHUqu+taXSmILRvwrytPoG
         I1TCZNXan9PXDw4047N0/uby1PPuSxQGsr2q80zdsSeUfFInIEclWN3Rf8VX4wIz3zC9
         qCNlYt5rRxZGw2n/RG+k7BEcsDm7xq4+E9IjabNwaseIzptvMdY6ZOVlm5j5d0lBQwls
         9IV+GYrOlizqgGAe4h/iKzoi9hY+kuCsiktuzDJz95i4iTOLPouUXODWY0oLLrzB9JzQ
         3NqL25wvDoLHI6HSITe5lPQHJgnBCZ+TROqEN4AUSJurGCHnC5bjmfWCuoj15H+x2m3S
         1WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784814119; x=1785418919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/4mwEccc62tzF2sjEuH89YWQVzfuPzmAUNTsnnGbOQ=;
        b=j709AEUeb0nGSA9sYHoF0JfmRi3BU8YiZ2vRb39OV1P8rmkP88Ggowu9BB2ZhVJLKF
         8E/G8EYgqTw/wAEfzRmM9aNREIclxW3b0S1kjquaJglNOZp1kvbGQ7v7ht1otIT7eOw6
         4Fsj/sQyBTfPNfnsch22n6KEnQgdPG2t02yOVgqwDP5l1vl3Bkt9BPTzNM457G4xnPGB
         07XyVSYJNzQkXo/me3UW93fiq18CbkYqKTLiklRrkh5nMfY/9bIz05v+Cs5i0p673em9
         SnEGjJMFQY4RvnFULNW9xufyscrF/TWy1I6pEf6van0dXE8OFH4/rzJe4E2TEx8kaz0F
         kJ3Q==
X-Forwarded-Encrypted: i=1; AHgh+RojEcYZUoxQYojFwn/GdV1irsGJanoMh7Op2i//xKsdMxRmpcxZscTxBVDkXuYacx6ahmyCiTT5wp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNs5qEesge+bHw3HDKzUlqBHttYF4NlzJ4gCpLtK9/q/slZjkY
	aVIxYkMuRuYHCSLoBccKxy3X72CzqZQKxOkE2rVDgzEfW6nV4O5AsXU0oKCNplSvfEE=
X-Gm-Gg: AR+sD10MPHdji8OzUqGHlFksme7YJSaBnf9yTHeWP4TM3fyhcUEC9hsiuQeMbVYfewm
	5G93ONfT5YAdanWYfzNL7VWtG/JdOG9+3wSG6sOz1UhefZICm6yEtUSNlir1+1whMleEWrOHmnj
	3KJbVSpIdbA7Pv9Ofp1DEn8B96IqatCD6A8sVc6xgXrHfB62i7v6+0fsw5t4fkJMTXzDpE+ECJH
	In6QiebIXV7ICq9z/deoBYZ5phAL+wSN2aXpIUMAGSPUF1+O9gbyODh8JFP3MzF9cS88eLY24bC
	51+XZtYcgajlW20Iu4jIaP5z14HgfH+2aJLaZaxlvh54OUkzMVlCzVQ4g0erHFMpl2jU4h+Ht8Y
	WKTXOOgmvu7d9PIP6lD8EcfBnQdOhdcgQME0AhJj76LaSuJKUatcyB1I2wlC1HGk3D9f1QUmoT9
	eU+T7PoB9Tur0=
X-Received: by 2002:a05:620a:4107:b0:92e:eff7:34a4 with SMTP id af79cd13be357-931038ecb5amr310272385a.43.1784814119100;
        Thu, 23 Jul 2026 06:41:59 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a9ffafsm415804985a.45.2026.07.23.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 06:41:58 -0700 (PDT)
Date: Thu, 23 Jul 2026 09:41:57 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Tao Cui <cui.tao@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, Tao Cui <cuitao@kylinos.cn>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: accounting/psi: document /proc/pressure/irq and
 irq.pressure
Message-ID: <amIaJddflNFoIdUx@cmpxchg.org>
References: <20260723123654.456504-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723123654.456504-1-cui.tao@linux.dev>

On Thu, Jul 23, 2026 at 08:36:54PM +0800, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> psi.rst lists only cpu, memory and io, omitting the IRQ/SOFTIRQ pressure
> exposed as /proc/pressure/irq (and irq.pressure per cgroup) under
> CONFIG_IRQ_TIME_ACCOUNTING. admin-guide/cgroup-v2.rst already documents
> irq.pressure; bring psi.rst in line.
> 
> IRQ pressure is tracked only for the "full" state: there is no "some"
> line, and writing a "some" trigger returns EINVAL.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>

Looks good, thank you.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
