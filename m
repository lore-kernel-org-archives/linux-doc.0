Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67D52139D7
	for <linux-doc@vger.kernel.org>; Tue,  5 Nov 2024 21:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840423; cv=none; b=tngsTqeIz5imh2u8KMmRlNhxCbh3XtE4XLxPXGPK0UOieAyjNRKmdYc44HpyeZtX+bzKRWmAR4ufqYwAZu23HxkvLcLWkwSCIZb4nZ/ZkZkJ+Qx0rizniSZijWVmzvjx7bMZxp9WPZRFrgX9HIU5sdS09xkJgFXqEYZUgX50dkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840423; c=relaxed/simple;
	bh=MN2ruZ0VOrI2i0kohnHZRuWwCeg2TRdQb6aoQx1dOs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBIXwN8CH4ZbxZgQsbYHtr8FiG9ODBrzFfuALhHgHR1QywTuS5an0NB/NlziV4Hbk+RHrTQw+k7KqkItj7dPm+uQFy4W326j9WaDUNY8zUwIPwKZzm8YFyhhYiHfMqHKjZRN5TiBT+gvlCpcJKe/bn/nlTdU07Ny8HTczSq8PsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=facS9XCx; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="facS9XCx"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso55093211fa.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 13:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730840420; x=1731445220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MN2ruZ0VOrI2i0kohnHZRuWwCeg2TRdQb6aoQx1dOs4=;
        b=facS9XCxnU62Ysu2QFAsSRYccKrjd8e0okW9XyP+sC5akqAG9LK1ykI6/F0DJOW2S3
         yS4H7AxwG9qMgkYDReZ01pnf+k4I1f70IRh3RJtyjBmDB+7V2qSdip3lkyuii7560l/4
         mn1cf29AiiUbuFqXTe9RyrGdQEX3okrtYvQ3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840420; x=1731445220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MN2ruZ0VOrI2i0kohnHZRuWwCeg2TRdQb6aoQx1dOs4=;
        b=Tgb7w99+lVz6TDYLhQagz1o9HmYhFclj7Q4WcqamtuWZ6Lf0IYg/QCFUQDRb1dfOuk
         OwPzWFrnJK/TSMDWYPEdWRR+kRNs9ZAYkMKz7jJep2BtYM4qcNn1zPgC2wQ+idil1nDP
         73ZVQS3X81mMDj/KkwImSQe0McZA1V3j7wau3836wgyetSVZN0lOuZtbH2UZtYaZ70OK
         QeyraW0zwG68jn3M+FFF7jMztR8ba6BOsI9qFRrXPDQWS54byVdBybXNB2KyhmbyNbkO
         2JAPl4wEk26RSvF0njJIbG9QHAocfqgBKL/A64s5gzBZHtGB2OQMf4l9J4rH6PFdneY1
         34jw==
X-Forwarded-Encrypted: i=1; AJvYcCW34Z096OgaLpjv1Z5olBPryF8YnZ/g4re533UiAKdJ0VRc4BxaDlVE/b2WT3808WC9vRwgN35wxe0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmp8WXGT8zRvEhD/viyXqjBxFU4mUKA0CtEbzIt80Z+t/Z+Lfv
	ezpqt7nuYGh+jMhY/evVLpaz9to48Yfn7eV6qogN9HuvMPRojY2CwuFVka5a6rECyFJKKYhGpmj
	iLwR2BpRcoWFw5zU6NyTa2S74e/33sTR885cr
X-Google-Smtp-Source: AGHT+IEwGFHiCBaTGoA+RhTutEqPmNN7Op7UcTLhRMCVmMlUY3axoyobc/qPEt3uOSIq9yaCFJ6R9bssTX2h26huqb4=
X-Received: by 2002:a05:651c:98d:b0:2f7:53b8:ca57 with SMTP id
 38308e7fff4ca-2fedb790772mr88326231fa.19.1730840419827; Tue, 05 Nov 2024
 13:00:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031092504.840708-1-dualli@chromium.org> <20241031092504.840708-3-dualli@chromium.org>
 <20241103151554.5fc79ce1@kernel.org> <CANBPYPj4VCYuhOTxPSHBGNtpRyG5wRzuMxRB49eSDXXjrxb7TA@mail.gmail.com>
 <20241104081928.7e383c93@kernel.org> <CANBPYPjo0KKm3JbPk=E8Nuv05i=EeR93PHWjSU8fcH-GVWV94w@mail.gmail.com>
 <20241104184139.3eb03c69@kernel.org>
In-Reply-To: <20241104184139.3eb03c69@kernel.org>
From: Li Li <dualli@chromium.org>
Date: Tue, 5 Nov 2024 13:00:08 -0800
Message-ID: <CANBPYPjq5BC3t-kF2Kcbs4tdCd=Zzd4Qk3mzRg-qyda3tEE3sA@mail.gmail.com>
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

On Mon, Nov 4, 2024 at 6:41=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Mon, 4 Nov 2024 09:12:37 -0800 Li Li wrote:
> > That's why binder genl uses unicast instead of multicast. The administr=
ation
> > process of the OS (Android in this case) always runs before any other u=
ser
> > applications, which registers itself to the kernel binder driver and us=
es it
> > exclusively. With a unified family name, the same userspace admin proce=
ss
> > has access to all binder contexts. With separate family names, each dom=
ain
> > admin process can register itself to the corresponding binder context.
>
> Side note - it'd be useful for my understanding to know what the binder
> families would be. You register them in binderfs_binder_device_create(),
> what creates the devices and how many do we expect?

There are 2 ways to create a new binder device.
1. Provide a list of devices (as strings) in boot cmd;
2. Call an API provided by binderfs in the system init process.

There are 3 domains as mentioned at
https://source.android.com/docs/core/architecture/hidl/binder-ipc#ipc

>
> Back to answering - I don't know why the same process would have to bind
> to all domains. You record which portid is bound to the context, the port=
id
> identifies the socket.
>
> BTW portids can get reused, do you need to do something when the admin
> process dies? To prevent normal user from binding to the same portid?

When the admin process dies, the kernel driver automatically releases the
binder fd and resets the netlink. So a normal user won't be able to bind
to the same portid. The admin process will respawn itself and re-initialize
everything.

>
> > So, do you think the current implementation of registering multiple fam=
ilies
> > with different names acceptable? Or is there a better way to do it? Tha=
nk
> > you very much!
>
> I don't see what having the separate families buys you.
> The genl family ID is added to the netlink message in nlmsg_type.
> That's it, it doesn't do anything else.
> You can add an attribute to the message to carry context->name
> and you'll be able to demux the messages.

You're right. Even though my userspace code uses different sockets to talk
to different binder genl families, the generic netlink socket doesn't enfor=
ce
this. Other apps can still use one socket to talk to different families.

I'll add a new attribute to demux the message, which should be able to achi=
eve
the same functionality.
