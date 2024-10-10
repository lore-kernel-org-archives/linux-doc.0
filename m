Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A4A1CB311
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 15:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728575977; cv=none; b=jlXClo6GVyla1onIFd/A25dwUHAF3IcHde9y9RA2oYfxhqD8SnbfzID0TBp/K1XigwyHPTMpBGIaU3L76iSAypEerR2KWouRPd6QRl1tulfGhg9kU9Wds00yRaF1HW7j7DIU907UgSKvDw1fvLrvGQiEjgdm3zXUb4vZJpEn3q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728575977; c=relaxed/simple;
	bh=PfZeNcFw1bT/pN+WBxONE28O+RahXMikU7YuitEDd84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0Xf9eh3yKLrUNFNQv8UZm4tNn5NqA4EEUbEWLO8rzuj/aQorGNtt9FFZJPs4tGsJK/tfY8v2nB9MMiLXZ7loclL5IQfDu1QN+AS4fUUvlD0BktIYLDEn6YhHEOWh48RG7qP/iY0GzhLm8N7iy6UmYhi99nzoIIUV2FBXzBwRfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=AQ5s48re; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="AQ5s48re"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e03f8ecef8so626343b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1728575973; x=1729180773; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yeku9+EKhD0eyLZNLUrY1WzCvsvKi1BJ6gq9NUUHrtQ=;
        b=AQ5s48rekCCbw87iaHEPqcoXvyhDm9vluE6oNylcuF6w+wuBxJVKv56ryVuJkFKOa5
         ri9P2mcx05hSIH9qyyi92wKEmr6ZD21ffUSYSr+j0NtQhMirHt/IruIgViA8nYqTHJ6x
         32mpUl8ubnnI42uggIv3yr8QWFwAoYqcZGvmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728575973; x=1729180773;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeku9+EKhD0eyLZNLUrY1WzCvsvKi1BJ6gq9NUUHrtQ=;
        b=rh8GCp+dlSgaRBqQcKLDtwvhwtNSpVqbpicTEonkfhdWN5L6yX8u14/GOJJJUlpvc6
         Lgzl2GHfZ47BMA1EAU2RGAALbTEcuuRl6oZ2DamYbzV9uaZAkSu5/V0l88m4pwQBFfr7
         uIBE7COd2NMkUhSk7KJm9F40UlJkOTMBhraSMKaid9zs28tSODDGhzY5zdVw8PSwo9nU
         eIqRIFGlKA2QwTKro0I7pHQzLG4toekvTNOA4eDDAb45NT41BHovgw4Zjh9JE6A8Wl9r
         n0G3tiKGe03vSGUFyswS5AyFq4vIRDgHmE8GC1RZtS9PzXJUGFHeGFsfs6TsZBYlFYPm
         Q48g==
X-Forwarded-Encrypted: i=1; AJvYcCUvBKnnFMNe2MpHxGJU4WddaiLR609t7te8FA6hX8VtjNDbe624BKWdTOOSglLv/EN1Z2xkKTKfKZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDO5xETu1lvAYMJ1C3MUmcFRkPk1KMs0Ci7bCmFkFeKs5p22Q4
	u9PUvpHRO+wEcnWVCy8Dgn1gJCfA8V676HdZi3y7ttwfMBtFxl6kQuYUPYrWItw=
X-Google-Smtp-Source: AGHT+IEtL6WXGzPYuh+MnBkT5NJl2Cl0DdJhepAOU04VKXDoCawCLBlrMQZVO/pkGBZrqJMIhISK1A==
X-Received: by 2002:a05:6808:1918:b0:3d2:18c1:bf35 with SMTP id 5614622812f47-3e4d71beaddmr4147622b6e.33.1728575973406;
        Thu, 10 Oct 2024 08:59:33 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea4495d331sm1152526a12.60.2024.10.10.08.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 08:59:32 -0700 (PDT)
Date: Thu, 10 Oct 2024 08:59:29 -0700
From: Joe Damato <jdamato@fastly.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [net-next v5 5/9] net: napi: Add napi_config
Message-ID: <Zwf54UVvfyx830sk@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20241009005525.13651-1-jdamato@fastly.com>
 <20241009005525.13651-6-jdamato@fastly.com>
 <CANn89iKytfwyax_d+7U8Xw-Wvj5z1d7xoi4LNhmUQphDiborDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iKytfwyax_d+7U8Xw-Wvj5z1d7xoi4LNhmUQphDiborDQ@mail.gmail.com>

On Thu, Oct 10, 2024 at 06:20:57AM +0200, Eric Dumazet wrote:
> On Wed, Oct 9, 2024 at 2:56 AM Joe Damato <jdamato@fastly.com> wrote:

[...]

> > +
> > +static void napi_hash_add_with_id(struct napi_struct *napi,
> > +                                 unsigned int napi_id)
> > +{
> > +       spin_lock(&napi_hash_lock);
> > +       __napi_hash_add_with_id(napi, napi_id);
> 
> Hmmm... there is no check if 'napi_id' is already used and hashed.
> 
> I would add
> 
> WARN_ON_ONCE(napi_by_id(napi_id));

Thanks for the careful review, Eric.

I agree that adding this is a good idea and I will do so for the v6.

Jakub: I hope that it's OK if I retain your Reviewed-by tag as the
change Eric suggested is a minor one?

If you'd prefer I drop your Reviewed-by from this one, please let me
know.
