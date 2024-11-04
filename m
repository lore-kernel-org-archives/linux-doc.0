Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C991C4A01
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730740371; cv=none; b=WsLhYIO264BXgA4yWJKuOnwSX6QZB0vDJ7UNG1q+8CELHrRHzYD9zA/J0LhEvhbIxVFb1blaAH24Fd5SUIIwaqUbXbH2vWFYPJiQJ03ir99BXRWlaLZJ/tlO1gjEYdGbaPvMO6NgMUv8BfWaEoYUoRQOoDQJ7u1byba7rYO/Nzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730740371; c=relaxed/simple;
	bh=2yDeCwWeanhRfjDcg3QZSEc/Uy0EkHEvsV/TrF/rvl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O42Xne+JZqyhHzTq4KZgyaZ56C44d2i07oZZy4I/LQa2hYpkWPV/EQKozN6dL6PbDq63CMiJTV4AfYOJhedzD/kq7OUUJYKLOuXpdu66rgLrqXLeJry8IiLKvibyqQDEfKimZKLZqmDVeArsDYa9AZBGpb51hpb0iBE4wMj1Sxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hz7n0cAM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hz7n0cAM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53a007743e7so4870793e87.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730740368; x=1731345168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yDeCwWeanhRfjDcg3QZSEc/Uy0EkHEvsV/TrF/rvl4=;
        b=hz7n0cAMJzvaCd5LAUAMmtMAoJFN6Qwse0QIK++5Rcuv/RVLV2QqyIKi/bnn/i2tWp
         LuHqf4BY9CHJYIhnIKacRIBcDTpV4mu6Gs6euajF7OEVnpUEWaGSfBXZSMbrIdABsw/W
         vW0PyKsCtuwzp46wuAmhWklMGghFc5h4cNwxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730740368; x=1731345168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yDeCwWeanhRfjDcg3QZSEc/Uy0EkHEvsV/TrF/rvl4=;
        b=m6hPs57ww8VaVT25egcMPhrf68AKOZDICexK4nkT8MGa61kEvavq9cqoU95Ld03egJ
         3j+ZKdARXWfWmEL1TWKQgjNtHzSW+HswQE8s0OeJFHvEFwcZ3TU/8+FAwga4iRsmZiH6
         /SekZf0iNdKFB3mGvr/ww/5Jx9wEfeIl3x/+JCAr5FlIXdWwg/ckJ/GXrD5+oDczh2bw
         hl8jfzgL8nR1jgwmAP4UcxdBGCMKX8LQfww1a1nzyFtBf07zzy59A2ud34wkVb/Yo/J4
         d/J4OjzSrzJr19M8xNoZBblFV8QP7BMvA72EfqhTNrnk2O0PGPJchq5aeWWqGgCUKvD2
         l2MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrn6M1CH23SoqrMSe3tKhkz7A0ncubgRuZgUIcYFmHEscRaAEHDB2TDgRavRKy0YhdyooRoJpXOMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzULHA4399Qq78Ue/Bl2WY8nnWnfGu4eWUDSduTFfr1gV7o6QRN
	Cp7xeE+MES5JwM2mHs95JNn84/iSnRcDc+8KO2IzV13pd0ZdNigf4LvssxPVv824jEY8qfBvUmN
	8WPm7XVaUdPBc6wKLYqfJlTrXWczAkxwCkO0j
X-Google-Smtp-Source: AGHT+IEjX0KYihsg5M12Yt94xgwDXRaw8vbt/BnR8UnvYMxv/mjOptO88w2Qrs4232astMC3NZm9KHekpOYU9jnJJKs=
X-Received: by 2002:a05:6512:239a:b0:533:4b70:8722 with SMTP id
 2adb3069b0e04-53c79e2fa52mr7351705e87.15.1730740368184; Mon, 04 Nov 2024
 09:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031092504.840708-1-dualli@chromium.org> <20241031092504.840708-3-dualli@chromium.org>
 <20241103151554.5fc79ce1@kernel.org> <CANBPYPj4VCYuhOTxPSHBGNtpRyG5wRzuMxRB49eSDXXjrxb7TA@mail.gmail.com>
 <20241104081928.7e383c93@kernel.org>
In-Reply-To: <20241104081928.7e383c93@kernel.org>
From: Li Li <dualli@chromium.org>
Date: Mon, 4 Nov 2024 09:12:37 -0800
Message-ID: <CANBPYPjo0KKm3JbPk=E8Nuv05i=EeR93PHWjSU8fcH-GVWV94w@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 8:19=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Sun, 3 Nov 2024 22:25:44 -0800 Li Li wrote:
> > > You're trying to register multiple families with different names?
> > > The family defines the language / protocol. If you have multiple
> > > entities to multiplex you should do that based on attributes inside
> > > the messages.
> >
> > My initial plan was to use a single "binder" family, which was more
> > straightforward and cleaner. As Android uses multiple binder contexts
> > to isolate system framework and vendor domains[1], Grek KH suggested
> > the netlink messages from different binder contexts should also be
> > isolated for security reason[2]. Personally I'm fine with either
> > approach. Please kindly advice which implementation is better.
> >
> > And I'll fix other issues you mentioned above.
>
> Greg is obviously right, but using different family names will not help
> you in any way. There is no action of "opening" a socket for a generic
> netlink family, one generic netlink socket can talk to all families.
> The only built in checking netlink provides is that you can declare
> an operation as requiring admin privileges, or network capability
> (namespaced or global).
>
> Unless those are good enough for you - I think you should do all
> the security isolation within your code, manually.

That's why binder genl uses unicast instead of multicast. The administratio=
n
process of the OS (Android in this case) always runs before any other user
applications, which registers itself to the kernel binder driver and uses i=
t
exclusively. With a unified family name, the same userspace admin process
has access to all binder contexts. With separate family names, each domain
admin process can register itself to the corresponding binder context.

So, do you think the current implementation of registering multiple familie=
s
with different names acceptable? Or is there a better way to do it? Thank
you very much!
