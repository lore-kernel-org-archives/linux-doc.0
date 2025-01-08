Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8434638DE3
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 00:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736294459; cv=none; b=DTxGw8a/qZ6SDL/iD+Bw+po/sdvJyRAXRpD13amuEV4/D+c76ffmIWW2BzvUrP9NQbouookMvw1gjewNi9CDkXSfNPYeX6kViBAHhDZfhWhdv9kaFWojWcdN4LL69y3qzUx7xWNnsC/6hQW908Fw6JCx0pI6X4MjqyPU+Wbq0ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736294459; c=relaxed/simple;
	bh=efeb6IKA6CWFmplhQRqI1GLfqgWUAOJHHG/zTYrSz4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRgKDLr4p6VDACMtboTPugNbh2zK0YAsAkIFnkC2jMTKtUWpI/WJBJUDAjjdl1TQfvrMWXChXqfBhwBYEaL31d/tC5MSIfQfRZ36osTUbCTcZ3hvzYIVHl92tRrdFPPu1WnbAquX2YcnhdFqcec1LP/iDfgtSkz3ErczppkutT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ty5yIueI; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ty5yIueI"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso213426551fa.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 16:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736294451; x=1736899251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gs5r7qruNqdlPjkv1LKSj9EfkEYQzhLuEJDyGwUeSNc=;
        b=Ty5yIueI2DOc4uvVTHhjzNlu0MQPUswzqNiZGn9CgmlkzcrOBjTDsA2HUJjhfa/vZw
         64H6/7DQtxvzS5GXIhO7ZuKyDoQagrkv50/GRUiFXa9EACZXMqgEnpZv47WqQ4+VQFH3
         5fmT0XT0gdtA2wmbGHuci3KRs4OazB4gHnBtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736294451; x=1736899251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gs5r7qruNqdlPjkv1LKSj9EfkEYQzhLuEJDyGwUeSNc=;
        b=cHoJ3RKnDIygTJbDrMT6CHS7CA2a6yZ9DiPe5uWv0WY9Rdt9Owrebm7lWkRm6k4Ccs
         E+8xAI22TonJsmc4vC3YRGM04SAD77tIyVffc3dDmZAHhQnbaFrkJAxFRgII0w31irlG
         V7g1EkiVVYOj/ii770XSq/hkPkMR0q+UhZw35mmM/NnA8glMMpiPXs11z51dC9Tlt6Lt
         SebCtqb+Yi3weRdCNpznBG+S4w/IhUqdWdK4kq/FiAUktUK0+cALY1cS+1uZPQA3o5xl
         sshjiMWvLEuWu2Woy/2GR8QRVbqbLeDoaH1qYKrzqqzdYpFHBangPjfxyNBOoXKQuSC2
         vqLw==
X-Forwarded-Encrypted: i=1; AJvYcCWWVxuIL7F30hwTK8qW6SFa6t+a5o0D95JIj9JEUWk4KrqEp7u2MGqpexKjZyygizp513ZrV19dYQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbK5kyKtXQlScNSPRE4x8zF24CFilS1iLL6V8NARy5hd9ngrjG
	3CV/f8YYO1Ua1B76m/VlE6IiMb3pZiEyBOiv1Sz9O9bKYJglY8CtOE+OrWN4EjKVXAwa3GEDvpc
	Hmjd/ttOhaN0qAZWPzzB2J6ZMGhfmweC9u/zu
X-Gm-Gg: ASbGncvXNp4NbmLmKMjNhUmwiP5+dcpchUnU0WKijcjqIyDww2kMJEYOO3Bpy4tiW8/
	72OrLyv+Uvof6vhzHcvJI+UaVtr55bjXTGlemJQ==
X-Google-Smtp-Source: AGHT+IEzt4RO1hjklyS4P2xNYgMYFSv62RrtHXsH914HaAhXfGN8GKeW1sucVBIxF5pCXFzHcVV/aFcMZ3ILduo+RZk=
X-Received: by 2002:a2e:b8c9:0:b0:2fb:5f9d:c284 with SMTP id
 38308e7fff4ca-305f45746d2mr1777441fa.16.1736294450704; Tue, 07 Jan 2025
 16:00:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218203740.4081865-1-dualli@chromium.org> <20241218203740.4081865-3-dualli@chromium.org>
 <Z32cpF4tkP5hUbgv@google.com> <Z32fhN6yq673YwmO@google.com>
In-Reply-To: <Z32fhN6yq673YwmO@google.com>
From: Li Li <dualli@chromium.org>
Date: Tue, 7 Jan 2025 16:00:39 -0800
X-Gm-Features: AbW1kvaeaKJkuflGdQcFNu4DOYzONz1D1PKxkOmRi2aC1Rq57aObwWksP1EbGMA
Message-ID: <CANBPYPi6O827JiJjEhL_QUztNXHSZA9iVSyzuXPNNgZdOzGk=Q@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] binder: report txn errors via generic netlink
To: Carlos Llamas <cmllamas@google.com>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, surenb@google.com, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 1:41=E2=80=AFPM Carlos Llamas <cmllamas@google.com> =
wrote:
>
> On Tue, Jan 07, 2025 at 09:29:08PM +0000, Carlos Llamas wrote:
> > On Wed, Dec 18, 2024 at 12:37:40PM -0800, Li Li wrote:
> > > From: Li Li <dualli@google.com>
> >
> > > @@ -6137,6 +6264,11 @@ static int binder_release(struct inode *nodp, =
struct file *filp)
> > >
> > >     binder_defer_work(proc, BINDER_DEFERRED_RELEASE);
> > >
> > > +   if (proc->pid =3D=3D proc->context->report_portid) {
> > > +           proc->context->report_portid =3D 0;
> > > +           proc->context->report_flags =3D 0;
> >
> > Isn't ->portid the pid from the netlink report manager? How is this eve=
r
> > going to match a certain proc->pid here? Is this manager supposed to
> > _also_ open a regular binder fd?
> >
> > It seems we are tying the cleanup of the netlink interface to the exit
> > of the regular binder device, correct? This seems unfortunate as using
> > the netlink interface should be independent.
> >
> > I was playing around with this patch with my own PoC and now I'm stuck:
> >   root@debian:~# ./binder-netlink
> >   ./binder-netlink: nlmsgerr No permission to set flags from 1301: Unkn=
own error -1
> >
> > Is there a different way to reset the protid?
> >
>
> Furthermore, this seems to be a problem when the report manager exits
> without a binder instance, we still think the report is enabled:
>
> [  202.821346] binder: Failed to send binder netlink message to 597: -111
> [  202.821421] binder: Failed to send binder netlink message to 597: -111
> [  202.821304] binder: Failed to send binder netlink message to 597: -111
> [  202.821306] binder: Failed to send binder netlink message to 597: -111
> [  202.821387] binder: Failed to send binder netlink message to 597: -111
> [  202.821464] binder: Failed to send binder netlink message to 597: -111
> [  202.821467] binder: Failed to send binder netlink message to 597: -111
> [  202.821344] binder: Failed to send binder netlink message to 597: -111
> [  202.822513] binder: Failed to send binder netlink message to 597: -111
> [  202.822152] binder: Failed to send binder netlink message to 597: -111
> [  202.822683] binder: Failed to send binder netlink message to 597: -111
> [  202.822629] binder: Failed to send binder netlink message to 597: -111

As the file path (linux/drivers/android/binder.c) suggested,
binder driver is designed to work as the essential IPC in the
Android OS, where binder is used by all system and user apps.

So the binder netlink is designed to be used with binder IPC.

The manager service also uses the binder interface to communicate
to all other processes. When it exits, the binder file is closed,
where the netlink interface is reset.
