Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750C19ABBF
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 04:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728533441; cv=none; b=m4QRsjg64t9bELF0YHBh8cSm4IYoZkY32cXDRSZLrUmBBtRQWPFhGKTfqYQ717dK9GlbSnnsaphfIa+2w/7cEnfMyF99gO5oF5Co2/gfyodlGXuyy4zJFZhrHMKF2JDbiwI896GZzHsByVBJzBFI778PHPnWFVm2H0nOxp0dYlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728533441; c=relaxed/simple;
	bh=p/npfda4+uZ+eoFTnpXPziV2yWyvJSD8J0L6jcrQTWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8rmfNCy18MZav/g9coXo+joyH1oRJghZWHK/SmzWUHAko0hbemXnPlQntjNMsgwwlMYvGcyALyI91UcttHrkRTUmf5J84F6vQ1CPwql0XVKWZwKbfRBx5NeSbaqdvWT9WrzXbLA3l+ajVNwICkDZdG5U8bjkCn7UpgzgDgQF6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0gcoErzJ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0gcoErzJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c89f3f28b6so548951a12.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Oct 2024 21:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728533438; x=1729138238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/npfda4+uZ+eoFTnpXPziV2yWyvJSD8J0L6jcrQTWw=;
        b=0gcoErzJTaRx/2zH0mJ200zJZxKvqKrTAIEO8pZT4jJtb5LJwL/p0/tUBxmhn79bgw
         ssJLfSwAiS02Er2q/3sLZQYzGRRzU8ei6pd2NxqyEcHMF0jrbzvLqf1kdPQTu3H/Ol80
         uNe0UyCuGMI6329xN77V8MNqfddBnQ9gb2aJSWsDmMmzVDJQxQUMrud8dy9cYnm9Ckbe
         /zoPIH6MsSOeubzQCq+3S7XfnVMgEJA6i82zb4qrtx1MDeF9CVZA4IoZuiCTfydWinoe
         bD8CoL8ZreQ07YulnwkEwHVVfqyKwl5mYNOAqScT2vEWI/JC8PMVf0kHRRAepGuuywk4
         QWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728533438; x=1729138238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/npfda4+uZ+eoFTnpXPziV2yWyvJSD8J0L6jcrQTWw=;
        b=D3vgKZao1tjvStO2CzdFsTnLzKlBtQJt6TACykI+fB4MCEgKzVkphG+RkKTtH+YqAQ
         JKKftleKyPcH1ZUdXNhCRo9G/n9ObjAcBJUOjXSK4z3RudsBfjVI7KH+zyiOj7AQ4wK/
         ej7SfspvBwAJv8pmhNyrffauLVdNtbBUJm+wMt0CiXpZpoy7DFm4bvIX5SfyTMmbYMBx
         OwrVe/k4pboqj0BDJc+6YILvfMMiSuDnCXv+cm8caCiIGK9lLx9G8jnJUd5QwObqp4nO
         4TiRYqNMGvBdJB76dWwht2Ap1Lr8sqfGoy8mIZyiiYa+F8EUtzPrrMRp8jEkS2AftCjg
         zvdA==
X-Forwarded-Encrypted: i=1; AJvYcCXRpTBZaZYZ1dT9im6WlUocmFg5CQeF1MdAJs/VhFZNxLyBR/VuRN1oonc2quqpKUQL4clGC6SfGUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRn2M8olNbhmW0d8nxyRfN47urFPpu6ZAhgaP8/5owHYbX18TC
	eMu+2639amA66fkQFfrYeZlCx/UkCrw4ZclOA8+sHfI1f1+yzkn8A8wfuu8poFxDyAqX1nla33Y
	MSFm7cCK9i2rQpW5JibdmxOObcqvQA5twn3Hb
X-Google-Smtp-Source: AGHT+IG/RkJ2ip5TWITEkWDE7GCfRYmWjtsrdI7s7O3yMXKJbAkmwnTBP8gXo5UcKJQO0FLzl/ylTPlWpyTAdX57idY=
X-Received: by 2002:a05:6402:1e8f:b0:5c9:36c4:ceaf with SMTP id
 4fb4d7f45d1cf-5c936c4d33cmr400018a12.26.1728533438158; Wed, 09 Oct 2024
 21:10:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009005525.13651-1-jdamato@fastly.com> <20241009005525.13651-2-jdamato@fastly.com>
In-Reply-To: <20241009005525.13651-2-jdamato@fastly.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 10 Oct 2024 06:10:26 +0200
Message-ID: <CANn89i+-pzFiw0CZSn-unerhqroU_hqKUrjV0c1ucT9WAT+FLA@mail.gmail.com>
Subject: Re: [net-next v5 1/9] net: napi: Make napi_defer_hard_irqs per-NAPI
To: Joe Damato <jdamato@fastly.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, skhawaja@google.com, 
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com, 
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, Breno Leitao <leitao@debian.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:55=E2=80=AFAM Joe Damato <jdamato@fastly.com> wrot=
e:
>
> Add defer_hard_irqs to napi_struct in preparation for per-NAPI
> settings.
>
> The existing sysfs parameter is respected; writes to sysfs will write to
> all NAPI structs for the device and the net_device defer_hard_irq field.
> Reads from sysfs show the net_device field.
>
> The ability to set defer_hard_irqs on specific NAPI instances will be
> added in a later commit, via netdev-genl.
>
> Signed-off-by: Joe Damato <jdamato@fastly.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
