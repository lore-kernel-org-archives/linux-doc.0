Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152F1B07AE
	for <linux-doc@vger.kernel.org>; Mon,  2 Dec 2024 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160854; cv=none; b=oiA2/tFHc86Dv3qNxX4RsZNdlU27IrBPRtVKUCOtg18dPW6lmwHb/s0C3Zar7cYybgIolJ1Am772LjYoU5vKxYxwxr/I7bolGXPeXpcDy97F46URgIVzju/7lss8cioMltB7KVcfiGizQ2YM+92rXIFXAWgRBurYMWeQlUzZgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160854; c=relaxed/simple;
	bh=ZcWhmQeTdhzEQEyezGlnWtKSJ1aRtj36eMfuAb5qXpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUALboRcWC6GBhllYj2Gk9TsbZVUvsvJNxLYye+XRvDxXChbpIRepsfaHgIi5c8RVyhgfK4JZPp0CXmV/nJ+McqB20D7r9ZbjwEEXbRuqoGOGA7fhJvUbgu8yfb/igFadtyzwyP30vzBx9mP7mVSiOjwc2j8L7tC0IIB1yImiTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=LXxoGrUy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="LXxoGrUy"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-724f1ce1732so3531844b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2024 09:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1733160853; x=1733765653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/KBVkQ9WDET0JwE7JbXDlQw4ch/b8XOKIUlHGNDkFw=;
        b=LXxoGrUyVYux4eRfCJPVkd9n9MDdCmUyo/RtxN2bMmr+E2mm70sKBPJ4BHiUMYDiYS
         d/5+SM9usrJyH/4YWn+rruVhNhvvuMWD5B6pDskt1rxBJ1CRvRXyA6CvTwecI9F5/Mft
         vBXvwsVYAtlAS02Zv9DkxEfGKEcU7g3iHWB8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160853; x=1733765653;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/KBVkQ9WDET0JwE7JbXDlQw4ch/b8XOKIUlHGNDkFw=;
        b=dVOb69cOEvZHR01x2KQ3cLbVNTuMLACmmb3Z2FSTkVUzoBlbDaHAGCnmfUC8j/XAYX
         APky49eTfUVzCuSuPKK8Tu7rWqSDiEcD/7Jw1kupdtxWErWpA0aYlmhuYLJ3DrYqc+kS
         eDo6SplLmaET095GtRcUb5913hVDSy27acon2MB2wH8Cp7WImXZwrMVtpkg+A0McA5Pq
         h7HHp1HwP3QtHFShlaaGpXWGCVXOlXRQM5lOBi/tsW1eHVuQqoOyJO4idjgnP1Qo2p6b
         5Qvbk5w6C24tHnqKuK/BgAf7FAacuN/RUqyvM0pgj64LQFPlgMW32SVCO6+3+fUEw9QI
         sQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7llP/zEHoMh2O6ztRLn+fSFwE3JgaTnzPdiTqvSiTS0IjMnE4UKaqyS1OSBUMA6ZgGOqJcfd5dLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP+gIzDaAhFqRmcRVrN00vtGrC4DMzvf7L5eUf5rSNASHj2seo
	cRz8PT8fpUn2iz0s7qdvr8itJrTzrakUDjQ0XNk0lTbcjWPyqeK9juCvupMCb5w=
X-Gm-Gg: ASbGncvOVg581MK/Ykt7owGGunSjnad8O/jCWcR8e051RIHCAqut5TGQiUCJ6f+u6br
	izA6e247KNy1yFZVPfGMlYEf1fIMx44/40LMbBD4qxpLltx5ZCMlYJGlOdkLSa1cbPz6T0nHa3M
	RbOKAXPrc9+BYFkNRlbIeeV1IhnzJlKvdyvMNQrvWzOxkl7rKcdrgKnqWqwPMuFBjsbsNEscLBz
	TN0izBRqgBmnlSqzq1p3vZob+KR3LGkM++CBkQWgxvL3cZAqp0lS7wa3Cgtq6ao07sUT3rUiDbd
	9fM8LIrCGWg8caLM
X-Google-Smtp-Source: AGHT+IGdA7xHbfKmPdaYXg5efPm8iMgRtys8b0yolqaF3S0/bsz6LSFec8vyOdG86Jxh0+jRfA07Mg==
X-Received: by 2002:a05:6a00:1390:b0:725:1d37:ebff with SMTP id d2e1a72fcca58-72530141196mr32222598b3a.22.1733160852632;
        Mon, 02 Dec 2024 09:34:12 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c31164asm7042249a12.42.2024.12.02.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 09:34:12 -0800 (PST)
Date: Mon, 2 Dec 2024 09:34:08 -0800
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	edumazet@google.com, "David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, pcnet32@frontier.com
Subject: Re: [net-next v6 5/9] net: napi: Add napi_config
Message-ID: <Z03vkLXa-wajZZ8T@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	edumazet@google.com, "David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, pcnet32@frontier.com
References: <20241011184527.16393-1-jdamato@fastly.com>
 <20241011184527.16393-6-jdamato@fastly.com>
 <85dd4590-ea6b-427d-876a-1d8559c7ad82@roeck-us.net>
 <Z0dqJNnlcIrvLuV6@LQ3V64L9R2>
 <Z0d6QlrRUig5eD_I@LQ3V64L9R2>
 <20241130124501.38b98030@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241130124501.38b98030@kernel.org>

On Sat, Nov 30, 2024 at 12:45:01PM -0800, Jakub Kicinski wrote:
> On Wed, 27 Nov 2024 12:00:02 -0800 Joe Damato wrote:
> > CPU 0:
> > pcnet32_open
> >    lock(lp->lock)
> >      napi_enable
> >        napi_hash_add <- before this executes, CPU 1 proceeds
> >          lock(napi_hash_lock)
> > CPU 1:
> >   pcnet32_close
> >     napi_disable
> >       napi_hash_del
> >         lock(napi_hash_lock)
> >          < INTERRUPT >
> 
> How about making napi_hash_lock irq-safe ?
> It's a control path lock, it should be fine to disable irqs.

Ah, right. That should fix it.

I'll write a fixes against net and change the napi_hash_lock to use
spin_lock_irqsave and spin_lock_irqrestore and send shortly.

> >             pcnet32_interrupt
> >               lock(lp->lock)
> 
