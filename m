Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B29202F61
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 19:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736366210; cv=none; b=Hln9UrOiLX7tyEOe0AUWDoOkwYNFQsL4MLjICFQLBSJUmrNGpwms3YRYSG/0w5bQRkF6yrpVXCyC3eEKyJBNg3I+HE57KQKiRGR1U4oaKzi8kVfckP9HpC5P3l8eu/GPF7L7dt2TNJSpv63pUg1bcytDilCnshO5jwA5AltPRHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736366210; c=relaxed/simple;
	bh=fWkq2Ry7gq/nExb7Ac4tXYG5/DUfjevhsswBM8svATE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=phiKO+yyHtsk5ObHiib3dIxZe+bDhQYGeOYXcliQafVbok4t2J/Z4uCnwhjzPv8y2PZcjiMZAe6Df1XRzTr5KXNsUkJEQSEqM0uFpojqMqxV6WRUDRnwqn9wD+3aG9Dlzyk3uy0rV50AZKnNiNTF3N+rU2CEbHeL7pDkG141JKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TmnHBpFl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TmnHBpFl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso871991fa.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 11:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736366206; x=1736971006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2EYNaFMuEi7gJG6lM4v49TAeFTWkkV0YaEiWcbQBDw=;
        b=TmnHBpFl7xx0DnlpNguOh1bRB6puGX34oZa0SfaDr8M1V0NQD26RgUKPjEvl4MEUMj
         IAFa+e8KzNN9JwTuvdrF2C0UvEfQA7Rx8aUGf/7r4mc54MAwM38nKm2q1qjby+wLTUa0
         Lgj/38QJw62+SWB85sH+3zdKTMFZp+pCyV1ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736366206; x=1736971006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2EYNaFMuEi7gJG6lM4v49TAeFTWkkV0YaEiWcbQBDw=;
        b=O9dAZOk8WTi0azMjO1h8l3gZQkAaCKL1ooGWFVDNPl/rGbLd1FXR0umJHtGvDKOSz2
         Zj1U3f3LZuF+QcVyBo5TlVNPstu4W0wQYkw2+wbwgK+7QiKX6CI8Fp02JOWXqt9BhXMi
         w6L4TjBjIKHCV7H0thrGx2MJAaR4MwWnZ9oZyfMPYM4PdlJd/bHzhEtqKRvJpvZp2Zmr
         oFPIHQawq2NfPCvv6y51RrzW6e903FgT7jeirsegxm0uVX2VPX1nDQuPcnvabkLONYaP
         wo1jez0Qc/V+AdgenkCnfFsQx53QxUF6fWolUAqJJYYpnFm5ox3Dm7mAIcaTARxj9/mA
         QwNw==
X-Forwarded-Encrypted: i=1; AJvYcCUIisokBvnDoeRD8rFyjpua9mZLqIrwSi/at/KznEzQQC0W+wghYkLGQ7yaL7/b7ZAUZhkCW/cPJp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYeqBn9YP4QmttYhuN9vfnpTnGzh/jecT/bHozcqK4ENQWWbx0
	Hph/WqDVzFQG2PL0dhdYPO4sAoyfi1WEf8/yy663pnmbKtY5oeSWk3UtFYNf0eMoLxigEAgL684
	aaGL1IIveSWIa7RO5CizA+QIij24q2a3FByDA
X-Gm-Gg: ASbGncs8oiKqVe8ZEsNMqfvMjgLK8Q2MVb8y4iqrZ0Rpk1M2dsTQp6r9QZBckw+/khP
	QCZV1IvrhrXrlFDEyyhEgzA36LPyQTwq0YRM5FA==
X-Google-Smtp-Source: AGHT+IFNJGm9HfHOfxxUk2mG33MjpwnqogwU+ysbnjaVFZYxCfbIpp9yJNnmCoOlQAXGf7JUvw70Ig5f0D4owNk+WNM=
X-Received: by 2002:a05:651c:e02:b0:302:3ff6:c8db with SMTP id
 38308e7fff4ca-305f45b8cffmr8397761fa.24.1736366206348; Wed, 08 Jan 2025
 11:56:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218203740.4081865-1-dualli@chromium.org> <20241218203740.4081865-3-dualli@chromium.org>
 <Z32cpF4tkP5hUbgv@google.com> <Z32fhN6yq673YwmO@google.com>
 <CANBPYPi6O827JiJjEhL_QUztNXHSZA9iVSyzuXPNNgZdOzGk=Q@mail.gmail.com> <Z37NALuyABWOYJUj@google.com>
In-Reply-To: <Z37NALuyABWOYJUj@google.com>
From: Li Li <dualli@chromium.org>
Date: Wed, 8 Jan 2025 11:56:35 -0800
X-Gm-Features: AbW1kvakBnClUlcgk4uS_9GFWwaQ6OEmfl-h6IqXJUGhnMaRbsWLcXbmu_4LXgQ
Message-ID: <CANBPYPhEKuxZobTVTGj-BOpKEK+XXv-_C-BuekJDB2CerUn3LA@mail.gmail.com>
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

On Wed, Jan 8, 2025 at 11:07=E2=80=AFAM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> On Tue, Jan 07, 2025 at 04:00:39PM -0800, Li Li wrote:
> > On Tue, Jan 7, 2025 at 1:41=E2=80=AFPM Carlos Llamas <cmllamas@google.c=
om> wrote:
> > >
> > > On Tue, Jan 07, 2025 at 09:29:08PM +0000, Carlos Llamas wrote:
> > > > On Wed, Dec 18, 2024 at 12:37:40PM -0800, Li Li wrote:
> > > > > From: Li Li <dualli@google.com>
> > > >
> > > > > @@ -6137,6 +6264,11 @@ static int binder_release(struct inode *no=
dp, struct file *filp)
> > > > >
> > > > >     binder_defer_work(proc, BINDER_DEFERRED_RELEASE);
> > > > >
> > > > > +   if (proc->pid =3D=3D proc->context->report_portid) {
> > > > > +           proc->context->report_portid =3D 0;
> > > > > +           proc->context->report_flags =3D 0;
> > > >
> > > > Isn't ->portid the pid from the netlink report manager? How is this=
 ever
> > > > going to match a certain proc->pid here? Is this manager supposed t=
o
> > > > _also_ open a regular binder fd?
> > > >
> > > > It seems we are tying the cleanup of the netlink interface to the e=
xit
> > > > of the regular binder device, correct? This seems unfortunate as us=
ing
> > > > the netlink interface should be independent.
> > > >
> > > > I was playing around with this patch with my own PoC and now I'm st=
uck:
> > > >   root@debian:~# ./binder-netlink
> > > >   ./binder-netlink: nlmsgerr No permission to set flags from 1301: =
Unknown error -1
> > > >
> > > > Is there a different way to reset the protid?
> > > >
> > >
> > > Furthermore, this seems to be a problem when the report manager exits
> > > without a binder instance, we still think the report is enabled:
> > >
> > > [  202.821346] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.821421] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.821304] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.821306] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.821387] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.821464] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.821467] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.821344] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.822513] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.822152] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.822683] binder: Failed to send binder netlink message to 597: =
-111
> > > [  202.822629] binder: Failed to send binder netlink message to 597: =
-111
> >
> > As the file path (linux/drivers/android/binder.c) suggested,
> > binder driver is designed to work as the essential IPC in the
> > Android OS, where binder is used by all system and user apps.
> >
> > So the binder netlink is designed to be used with binder IPC.
>
> Ok, I assume this decision was made because no better alternative was
> found. Otherwise it would be best to avoid the dependency. This could
> become an issue e.g. if the admin process was to be split in the future
> or some other restructuring happens.
>
> That's why I ask of there is a way to cleanup the netlink info without
> relying on the binder fd closing. Something cleaner, there might be some
> callback we can install on the netlink infra? I could look later into
> this.
>
> > The manager service also uses the binder interface to communicate
> > to all other processes. When it exits, the binder file is closed,
> > where the netlink interface is reset.
>
> Again, communicating with other processes via binder and setting up a
> transaction report should be separate functionalities that don't rely on
> eachother.
>
> Also, it seems the admin process would have to initially bind() to all
> binder contexts preventing other from doing so? Sound like this should
> be restricted to certain capability or maybe via selinux (if possible)
> instead of relying on the portid. Thoughts?

This is a valid concern. Adding GENL_ADMIN_PERM should be enough to solve i=
t.

>
> --
> Carlos Llamas
