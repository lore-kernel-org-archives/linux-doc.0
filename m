Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C814717583
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730701559; cv=none; b=DwNPUuE2IRNqWWc8NIpSEsvGRaL855CG0yd47h+Z5xzAuJf4EK1vU8KRe5pBlqdycqwLBoN8AW2LtYHr6gxZaThUm8bcH2Fm8HIL0tIhl7i7/vMTdx4O+2AiMuS/rSDeUvYUU46UoG9hJXzTU/959lG5xs2IS0AacvTi+wYTYyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730701559; c=relaxed/simple;
	bh=XsTtsn3hdBEJWqJwOlBbKqxovqNHWidcaWmpZlyJYXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M29to7XDBWZHNUdTBIYCxE9FPdXceLY6jnWBto1X1RDiLHWUgY26dbdIa5h8tXRH1emyiHcc38EZeXFyis+uoR5DXiMaiHmz2D6srTlstQVCPqGMWQYQUA34Ych6vFsAjUr2J1LduPilqFFsbfbtAOejbI29v5QOK1XlLsh5oKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YQEN1ezd; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YQEN1ezd"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so44498081fa.1
        for <linux-doc@vger.kernel.org>; Sun, 03 Nov 2024 22:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730701556; x=1731306356; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FBzR4qyMN91FRimR7/U3Er005yyZVpanRcq4msuzFs4=;
        b=YQEN1ezd+lEPFR7QAL2P9cH8te1agw+Q4tEl70b4T7YUKjy+VM8lDjhJgjmQYdwgJ+
         8g5YWXHb02Fts6669jMqwX4EcPpOrRHHZHWIYSBvjiLVkLvkC2KRkJgI1Uh3Das1wO4p
         uGXCgC+JhN4UnOTcKlpb99JBF5Anh7RJUFkAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730701556; x=1731306356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBzR4qyMN91FRimR7/U3Er005yyZVpanRcq4msuzFs4=;
        b=adRqjK34liFCzCqNliSum92ievRfMX1jc1KJNq1mjSye5Y8vGAgB2i5ifHtqSTIJU5
         t3HSBeAwAXYKNoCJZDAJqbBQWx3TiwgvQvtk0jINmwiemPYGp0DKBwLZ1EGjh7iakJur
         iEf2mwJUhJOJSZU2E1rJ8A2agEgbprD0V4jwRgBCx2TWhe+QjIhXhGp3SUQ/ZOaEoKVZ
         6RVeGRuF9Nn8TsrW/ICv6U2959fDclC7MM84o0KTw/iMpXtN6tZN1ONd3ciSHh7+1RcS
         9YcsIlt8hVvyzNIT/IF++YyFS6YES+xdB17eRAp0SCar9f9kZCbM1oBW4DuvqA9oj9Nd
         +QQA==
X-Forwarded-Encrypted: i=1; AJvYcCUObhu/MvM86NMztlCOI8vRskuPiZbMC6ZPz3L+f8TOo3jCNkYhXczmHOGrom5DgTvf1YiNQ7CQm/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhNObsCm71lBm+TjMQOVouOJA33J/YHDB14oX06iPX7cAokR8n
	c5RZw5h7j2rBbDR2s1Jy28EazDTQSe60AQFLhPcpMJdQ14Qvmy/JFiqBDWBZJ2PCx2Abi2xcMsB
	S0XQvZIYQW+AnpYXszHLgBmPvqWUD8c/Kf/FM
X-Google-Smtp-Source: AGHT+IHM+UnWnkbIWhA6LBG4BcD2vaEnPjcAIjqDv+LZBwE3AybzTpIkqH75u0xdv1cI+K2hsUNbLgWJnPZq/NPTjjA=
X-Received: by 2002:a2e:a54c:0:b0:2f7:6371:6c5a with SMTP id
 38308e7fff4ca-2fdef2a14e5mr42956221fa.16.1730701555834; Sun, 03 Nov 2024
 22:25:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031092504.840708-1-dualli@chromium.org> <20241031092504.840708-3-dualli@chromium.org>
 <20241103151554.5fc79ce1@kernel.org>
In-Reply-To: <20241103151554.5fc79ce1@kernel.org>
From: Li Li <dualli@chromium.org>
Date: Sun, 3 Nov 2024 22:25:44 -0800
Message-ID: <CANBPYPj4VCYuhOTxPSHBGNtpRyG5wRzuMxRB49eSDXXjrxb7TA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 2/2] binder: report txn errors via generic netlink
To: Jakub Kicinski <kuba@kernel.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, donald.hunter@gmail.com, 
	gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, 
	maco@android.com, joel@joelfernandes.org, brauner@kernel.org, 
	cmllamas@google.com, surenb@google.com, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

> > +/**
> > + * binder_genl_init() - initialize binder generic netlink
> > + * @family:  the generic netlink family
> > + * @name:    the binder device name
> > + *
> > + * Registers the binder generic netlink family.
> > + */
> > +int binder_genl_init(struct genl_family *family, const char *name)
> > +{
> > +     int ret;
> > +
> > +     memcpy(family, &binder_genl_nl_family, sizeof(*family));
> > +     strscpy(family->name, name, GENL_NAMSIZ);
>
> You're trying to register multiple families with different names?
> The family defines the language / protocol. If you have multiple
> entities to multiplex you should do that based on attributes inside
> the messages.
>

My initial plan was to use a single "binder" family, which was more
straightforward and cleaner. As Android uses multiple binder contexts
to isolate system framework and vendor domains[1], Grek KH suggested
the netlink messages from different binder contexts should also be
isolated for security reason[2]. Personally I'm fine with either
approach. Please kindly advice which implementation is better.

And I'll fix other issues you mentioned above.

[1]
https://source.android.com/docs/core/architecture/hidl/binder-ipc

[2]
https://lore.kernel.org/lkml/2024081350-establish-direness-38ee@gregkh/

> > +     ret = genl_register_family(family);
> > +     if (ret) {
> > +             pr_err("Failed to register binder genl: %s\n", name);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
>
