Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBF736D4E1
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608547; cv=pass; b=HMxmgcMMci7fAF+sdLBQNi0xjGNQWKSKKcPCzDDyVwShA4RuybJknUVRtmpice5e013QNFgwp93+nFGlYI4tjbyQI9pQvxo38MvsYwgF4KpNv47q6BWl6wXuPgvrjwMYG0IFxmNdKa9qPFaOZWkTpATEMg09S3qbbx5h5IOgpT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608547; c=relaxed/simple;
	bh=Sk6RankvhH5IPrjCp/mMpqfpvlNX0Holpo+rbRThvlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdfbtBdv/8zRwJ9oyQV+kCTkjoCu9gzX6WqHu4iEFILbUfzUS8mW6p+CX5A9FeFNohPT+zZC8+oRyyJq/OgoLfe5+0hricz72fbPzJ7GpTHxmzdJvYvfOh475B05cchbuS82L3fVCgucoJ4YmomV6La72psCHHrSpBe52y+Snkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=IBk94JbQ; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="IBk94JbQ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9ed64d490so977572a34.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 07:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783608545; cv=none;
        d=google.com; s=arc-20260327;
        b=iWe8ujp6mM9JqX6wpm0fzFpMKVb+U+UhV9lMWHAI0fTCXCoN+rJEwymIavEf6QmW/4
         A7F9wnEzpUEbop0ikuxJhHAANzv51JaEmkewWKEV9L7UCzuKSMkT8AiqX/FQ1Vf8hnpE
         CRtwqinL9c6gGyGWhRnvPGmi3rXL/tf+X+c4uLkNtQ0KvDIENYrVl4NZ7+TaVD00ItUW
         63GHj6fqHkzhUEXCtW6aAvXpz+3xGVVKSKO6hnlDXllnW/BqDrRZc+7x5o0FDAb28kf4
         O74NU2RT07vLRpGHIPM1meXAde2kNqzmZLV9DlqqTooMAMQYsaYEPH19cK1J/Fq/MxJq
         quKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MYS2uTBqKgSrer77DXZbILY3qQ1j4rYV+efL09YAvE4=;
        fh=rwsx5ckUtcY4p19pdu4WPqHpldkMvxR95ei9pxTdsb8=;
        b=SIFghEtPOhWFUzAi6hCA8Y3vhV9eORaFdv+UjfC/tPhhy41WMnQRvXD76sZ2AiJx/b
         K+8tnFEZ5sLZBloy6YSe/6YhfZZFEYyhH5P2ziPMU6SuBjtD/HZK2iVh5Ot1axCfJkbt
         /kcXgYuZgZ7NozAeIAxqIPbR+2VRxAB32yaz0RXqNN5oEgP41EMJD3ooiM1+P0hukr/T
         /ezVIWYg8sCoGhpGP3mC516R5VOOPhtLNNPtnu6gQxDy9lplh56baJYXkA9tt9B4aAfK
         3txJoCi+uEFEz9B809NEVQJv5jQjbYHex8k5CrMtgmAy1bCncP0wZq8zTP4b6EQjS9xx
         LaHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783608545; x=1784213345; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYS2uTBqKgSrer77DXZbILY3qQ1j4rYV+efL09YAvE4=;
        b=IBk94JbQMU5HzUHVOv/QNHNwVS47FxT06lqdY6hc4qrNjXs+3UIbCUPDDriWZ8gsBD
         JM6Dd0oWuUG2tlmYHqY8T7rimx8LOF8ny3e1A3sRyTPM4PT6TEGwFEG1lYzc/FFwnGJQ
         CcKlhOmZtNaSNBPL3HazDAPHyKDxLt3lajGetUh/g2V7VtcDodMggjIRmHK8JsnuW6Aj
         /JdJbfT5wTPGDd68bzEEqeral3mXYEbaJYgASruI57FTKrozGOp9fo1hZgVr0+NkpIS9
         EQL8ea+kDK1gRnvJ3D+J/c9Uqi4gyx64lwR1JMCRQ6Z38jzzRbqQSGZCJGJ1E4SUTuqF
         HRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608545; x=1784213345;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MYS2uTBqKgSrer77DXZbILY3qQ1j4rYV+efL09YAvE4=;
        b=igUsugn+qXQtVLLi7fVFKz1Uh17wQs3hn6SKLNd9Ei7Cqb28jWK/CHKzWL70d9rXoC
         Tt7PrT3gPsNt6x7u+MSh8ZkX1zVNts3iGIjzt/Gduv0GYwHZOobMTyO8MZnV60a2Bogr
         TJRS83p2HSG5jDhdQGpe+BkuC8nqcrhXuC9XR9kshdAVr8y+QJ6JIqJIG20vChFA9B4T
         LKfIuEern+Lu6GAj88wDqFq/Bq/SVgNE2UDAvplJjy8EO+2obF0nMGxKFU0AbP16uEVM
         +Smo6GPekhbI/1Js3u3PVIrcbYLgw7xDpkL0PHQFlm1XReL/fyN/wk6580K7Gxfxmli7
         kfsg==
X-Forwarded-Encrypted: i=1; AFNElJ+eW26hO8biQcn0Uf0MkEk1gnfBUct2WLIFLGw/wylyO6Syy6jpEW1NnNOqD1FN7FolQIs2SW41jKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnTyzEgg2a6ukf0HrsPpVOdGLc7QSQDQiP/r4iO0/qQpKEkUZ
	7aMNvHdkv54LLVLR306GPBD8hnXdYuVOdtM/pbf/5Pj9V1so2+ix0Zs+fuNh4h6NNJyTlesxoYf
	ePNpbmtcBUgNowETnyqOvDD2pc2LNc4dhexgxpL61eA==
X-Gm-Gg: AfdE7ckJaTGNhnNIeY4zDj2ItEOINYHr/EqzaFnDgq/T+1N4jPjtHsftYNnzxv82FTb
	qI8febZqc4YBYmmk0iOsbmxhtdUiznrRGXQP2Zuag7KJhB18dAClv6F73x69HBLMayjvJ6yunkg
	O7cmnvNnykfoirEls4jiBEpTBS3y4nNfet7hCtH/fg2tqFWp5OkP5OqvV3mRcBI/14CCZIj219g
	pSN+EzFAgBOEgTFohH/ldCb4V/d6SJTFLwH14QQh8P0RNjgfpiaOfy26w4EZerRvwypcpflQ7XR
	19gXnK4kl4xa8Y02o1QSK3uzIPU/BlKVZ2d3MiEaQVzlMBCcaVcPOReJfoxvTQ45JcfJVZrGmdv
	7tjkaREG7s17Vf1gvJoA2lhhFqWZ8
X-Received: by 2002:a05:6820:4b91:b0:6a1:87d1:402a with SMTP id
 006d021491bc7-6a36d8db604mr5711492eaf.20.1783608544960; Thu, 09 Jul 2026
 07:49:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
 <ak5mPxUdp2pzCMt5@pathway.suse.cz> <CALqELGxjTZAXEp1C1CNO2tLbUpUChZW3DHcNgyhEu4Ma-ct2ow@mail.gmail.com>
 <ak-vqrSr7NLCkGQw@pathway.suse.cz>
In-Reply-To: <ak-vqrSr7NLCkGQw@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 15:48:53 +0100
X-Gm-Features: AUfX_mwJgx6F5Vn2HOCATKNy1ql8ixFyCz9Yy1yVyKHgtQVtX5Yb7ZaDGdYvvFI
Message-ID: <CALqELGyd0UQu2T=odSG6eavnzZ6bmJVd4VKo3oAVTyRpkkSRQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] printk: deprecate boot_delay in favour of printk_delay
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

>
> I would change this to sizeof(unsigned int) as well.
>
> >                 .mode           = 0644,
> > -               .proc_handler   = proc_dointvec_minmax,
> > +               .proc_handler   = proc_douintvec_minmax,
> >                 .extra1         = SYSCTL_ZERO,
> >                 .extra2         = (void *)&ten_thousand,
> >         },

OK.


>
> Otherwise, it looks good to me.
>
> > This makes the cast explict, verifies the range before casting
>
> Yup.
>
> > (I guess a range of negative values could result in a postive value
> > within the 10,000 range) and also uses the correct proc_handler.
>
> IMHO, this should not happen. I have never seen int smaller than 4
> bytes. If I count it correctly, positive numbers should be up to 32767.
>
>
> > This has the side effect of not showing the following pr_debug for the
> > lpj calculation when a delay is not set. Though loops_per_msec is only
> > used during boot, so I don't think there is any loss here.
>
> I agree that it should not harm. But please mention this in
> the commit message.

Yes, sure.


>
> >         pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
> >                 "HZ: %d, loops_per_msec: %llu\n",
> >                 printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);
> >
> > Can I keep your Reviewed-By with these changes?
>
> Feel free to keep it. That said, please put at least the change
> of the ctl_table into a separate patch. I would rather put both new
> changes into separate file. It is never a good idea to hide
> such changes in a complex patch which mostly reshuffles an existing
> code.

Yes, that's a fair point.

Thanks,

Andrew Murray


>
> Best Regards,
> Petr
