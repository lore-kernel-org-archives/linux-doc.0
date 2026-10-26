Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044056;
	b=ssL3XQYvz8g5OqV1D+Ci85146di+9heroK8drjcxHbLCy7TNsya9i8m7tLSPnxJ5RoGo
	 CDiKp//cRIyn8hq4EMbcmaIf6O7bjpDwC+r7YNxCffIrVknCKi5hENyHs4e/XntnXMZrh
	 Lo7f2eJTpuZlrWcDneapU41UEUeUsaVRcj9ukfxdVfYwWiGuWNPGOL0HMWnASjUruYxat
	 oX7IKS4ONolJvUyrsIdhQRc6yuJHk0rONT9oznoYOIwH7qLKEEhzJnnUoLfeT1uANZQsN
	 Psi4GtwhCW1eiS/0NXuvw5M/Hm96Ky0iEbGfBhENzc5FWFYvBb3Qih3tThLmHnw2lPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
	b=484Gx65S4nPPZ7aLPje0koYYxMVRxlRx40b2AGlmy0iCVoRrVUT83ZXJfRTzSsXogJMd
	 3sA6OGI3FIT6IKH7M/cMD2IYefZeUN/y0jxdjgNOojwfylWFy3ppxlqpLgnWoj+SxBeUt
	 NsSTjMsIUrj0NANA6zPTy/F8QQDSpzEdGXJDC4CTG0ZmsRSLvtbVONBh1nLE+mByETdjm
	 otFeVCyu9xL9DpYuaYghLkRN/Z3FmAkvDqxXQRKJz0s51UNsEkezfZDqh399bfi8y3Yfb
	 Z2sx+5t1+ut3i8DfNRmxRiIwQuKUWN9CuIg/FHym9rITsnOvC6tvVGOAhJUyFc6xlpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IKuwIsGm;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE44606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 19:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE44606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=IKuwIsGm
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso2376955e87.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 12:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793044053; x=1793648853; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
        b=IKuwIsGmawZRNNcIyNBWDbH0N9tYcDswJK6e8GE0QJNRdd3PNCgvXG/kpV4ET5VHvf
         59sbEBMwkXLuFN4lVAutca2Z0TNNSYhzVe6upuUd7AzR0vmyiuVo/+1GDUx6c0q8q55M
         LW9RVoOLS9pMehMkVYKCOu+IlSSGJa1pXyHwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044053; x=1793648853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7lTB3tjbs9LTHpXb2LjFz9J4Bg4PVtZvOGRQvHQqQn8=;
        b=BI4dYrkKZ5+HB+QwbpIwfbTGUBluIviw9JxeD8pDoTmWav4it4VeafyjMZHvjjIaJK
         gaWlICJReIUi6rvJLCsDKNj5DwFJGJFeW9HfC/nNRplVNmmD7Cxd3NCflr14V+WCdJa4
         lz10Ak8pxKWLnCLAupxoDuKPiZUFxdqQrx8WGnneYegiCIxiUhDnKCIpelMQccpImYZZ
         obAxnJEClxNg2GaUNmALxFHT6bl/YLAruksAq5YpBPnLBYjK4ckjDTf02QjMn6cD6vcH
         2/5138Sj4mxdLJw6xZ1dsFSv9SlIbsgGzUvEzI/VVTP3Cb5xqrGITfR8X9C0uRmofXhn
         viNw==
X-Forwarded-Encrypted: i=1; AKwUvBzRFulmYEKYb4y8kQx2vpYo2LuxBt9D/hNdS/2jUJSychxCwj7q6kUfYWrk6OapGpFJyfY/nZnng/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDolm0nDIJ/J9jbpbxVr3ehP9pVoGT7J44MySfIcd29777hlcb
	jo/021wmPKV31O83GBllx7jU6553rEe0PJbeiuoK6eulx3hNJUkVAoxdR+VpRZ+7mHko8LtEX5T
	8qlmH8SWXxw==
X-Gm-Gg: AYBFou1LJjCxWelTbQuTsNlIDmksZyRAoEHJ3YuIaQDIpd1uF7zaMLGpDcsEq33JUYS
	P4xIl+Tnw8ITpKdD7k5+JPsqxbmKYxw1CuwGfv33I6uNpkJ4AMWcv4Ni4aJB/qv9hnS8hcwvtof
	eiMfWo6EJIqhoDf7i41/x6Wi0j1Abh4QMX7dBGRSINYv+4vUw0SRN9BfVmvAcMDsyOTGTgTKbTd
	ig0R6Y5eY1gDW4bR3E7g6gXE3HjF0LUESW1GCb5btwRSvlr/A+uZ5TQtYQSm0cOjARuBOrK05IO
	JT9osCt66ItIZ2k3qo0jDmFFTWbQxvnr+El6+y07keJ0X+K/SQ4Bxyo3CcxBLSb4GjNrkIyuMZi
	rTEng0o37uEhmeHQUyEYO2dh8Y8v5VLvzYuqEp0ND+8l1FTFR5x+0cYVP2EvCIPzFZID3cUGL+P
	xwOujEaUWRH/l466uPjLm5eXDiky0+cSUD87fvke4FgYqW6kPXcek5cIRH35rpBEPdgG4ON9LjH
	4esYWGaXguL/A3kUlqDXUT0sDtsGC8mw1d3csFw6/ygl/gG+gFvTa2YVsk6lifPCQr8C9AXcEC4
	gS7q07Xs/SKno8YBAUIoBRSC/Mz9CA==
X-Received: by 2002:a05:6512:39d5:b0:5be:5225:ef2c with SMTP id 2adb3069b0e04-5bfb71d726emr2406885e87.29.1793044053438;
        Mon, 26 Oct 2026 12:47:33 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a75a79sm1824003e87.39.2026.10.26.12.47.32
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:47:32 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso2376942e87.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 12:47:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/cHxywf8APnfKoBemjzvH7j4FV2w41EPWWoN3mp/s57/d/2bcNdiMLICeXBUNi4o92HO22wEATcQ=@vger.kernel.org
X-Received: by 2002:a17:907:868c:b0:c2d:c98f:4824 with SMTP id
 a640c23a62f3a-c46bdd91e31mr838852466b.30.1793043609404; Mon, 26 Oct 2026
 12:40:09 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009083137.3-1-sashal@kernel.org> <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
 <asz9AeFe3CutP73z@gremlin> <20261013123132.GC4214@killaraus.ideasonboard.com>
 <as4pAEnLd4H68W4W@gremlin> <20261013131243.GM56180@killaraus.ideasonboard.com>
 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu> <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
 <atjjQ0oupQ4pmKHB@false> <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
In-Reply-To: <00636bea8791e75b3b16afef2dc5ee7f2cb8bc0d.camel@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 09:39:52 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
X-Gm-Features: AclHuK8CltFtaxoX082v5F7FHYz_r6xWqul5HdmUaOSix11A_HqM4exVwrrtVNw
Message-ID: <CAHk-=wgm4tZBd68PxaQiGeComxa9Us-SC5P2s6UG1Dwu8n_38Q@mail.gmail.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
To: lyude@redhat.com
Cc: Troy Benjegerdes <hozer@hozed.org>, Theodore Tso <tytso@mit.edu>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, federico.vaga@vaga.pv.it, 
	apw@canonical.com, joe@perches.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Justin Stitt <justinstitt@google.com>, 
	Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Brian Foster <bfoster@redhat.com>, Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, 
	Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Christian Brauner (Amutable)" <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 09:04, <lyude@redhat.com> wrote:
>
> On Wed, 2026-10-21 at 16:07 +0000, Troy Benjegerdes wrote:
> >
> > It *is* possible to make a deterministic LLM, and this is why I think
> > it
> > is critical to my personal future to have an LLM that can actually be
> > understood by a human instead of a random number generator casino
> > that
> > sometimes puts "4" in your private key.
>
> I hate to break it to you but that is literally not how large language
> models work.

More importantly than that - the whole "deterministic" part is a total
red herring.

We shouldn't even reply to that idiotic argument.

Why? Nobody is arguing that we should stop take human patches because
"they aren't deterministic".

So anybody who thinks we shouldn't use LLM as tools because of that
reason is just being dishonest. It's just a disguise for "I don't like
AI". It's not an argument, it's a complete strawman.

We have had non-deterministic tools in the past. One trivial example
of that is just different compiler versions that have slightly
different instruction weights or just different rules. Even when they
are individually deterministic the end result is effectively that
different people will get different results.

And not all tools have even been individually deterministic - actual
real non-deterministic behavior exists in non-LLM tools either becasue
they have timing issues or are explicitly using random numbers as a
way to get their results: Monte Carlo simulations is a very real
thing.

And yes, non-determinism adds a wrinkle to things and it's something
that needs to be taken into account (and people often add things like
explicit seeds to avoid it when they need explicit determinism from
otherwise non-deterministic algorithms). So non-determinism is
something that should be weighed as a factor against what else the
tools brings you.

But it's not actually an argument against LLM's.

              Linus
