Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A32309BE
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736834474; cv=none; b=pJ4K+K6H3UU5dbbxGqsmOUwI1AJUe05Lt3lUNZiOLIoa3jKPdJEzTcuBDSEKDEFc9oVawxP06kZsu0ST/bfI3lFdzuojRCIYIM1eQY8Jf3NNtCRfMZTaqr+yYh3jwJsuR3+6sib3Dxm1GtgwR5rM+CN8y5OnQS4NejI3kV4BVtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736834474; c=relaxed/simple;
	bh=y26zlK6dNzwovEdSf+ZSnOhAFh0FQbkgFGnLA01McT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGbOPlmPKZKbmzr3Vwuv6G3Nrch836V8NYnmqGZg+Zt4F1a38ArCYJbMCUbbv+CC3KibJ9Mk0z8TWpfQn5f4sySZnY+HEssO859qww9Tr3tnx2SVVLQf/zVsH8KHIYrFSQK07sComV3//MtPIel2CyqTfm52rCzUgZiFp4vVsd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jhgVqgG8; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jhgVqgG8"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso4924978e87.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 22:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736834471; x=1737439271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+MfpBzkqBtq1KQBkE1rEnF0uU157WsksIfsGtGfs8U=;
        b=jhgVqgG8ZOBhCGDcI4fNXHU53dHXSU30AiY4IMHgwXb/15i88a+aaB3OuZK2yTaPGu
         CNqU9YviNmbtnKHEF/4Ww/cDTETGayL/N3x+lch1N9yaNUVxKtCBJgoNJ0Tx94WnQjns
         POhUdhSj+Z5+mU3lOLksny/iQCx7fO2p4xUlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736834471; x=1737439271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+MfpBzkqBtq1KQBkE1rEnF0uU157WsksIfsGtGfs8U=;
        b=cQZ5S8M4QGM4YbaOVA/yvlenWKqNkQoA0Ol5v8MWYTXplELo7HhGn4ynDzxA56aow7
         AKLsnH6wKasjvtItaz7Q3HFSOpp5yZrWf38VYXKLXTsy7glIiTrLHs//MSMZ4vI2YiHk
         DgUTbElLBDdmHq/4TcFvTUvsWQ4Yf3A2SFHpVZ2Y/Kp6kU7RA9fYUBTf9BKHchMatccc
         xzBy/rq8gdCszea9pbsm1G7vKMCWEjqvSWvdqowUqwLwPgiZnO041z68ADqo/91ZY+oQ
         X+kWGDLyy7a+/tI+SEwMh7IFqEbuL0Fq8FSmm0DDBsYkGiMoI7Zr3H62ovCInPxQYc/c
         49pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFwh57oT/rF6GUxSjp0mR/a1wEDLaPA3hQ0tQ8VBlRmpJP4pd6huGmuY9wYzVVlb99pDyVRgdc5Hg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwvqv5hFR1YsA7tiP17i4sE+IEvkjLDwFZHbkmiU2Vs7TMJy/C
	sjYYaSFZQF+ZTDjOuJyqsMHimOpR107upnUOq+Cp+DGZLfOSksd0UuYIHQ95VxLGvph/ekLYQze
	PspcYxFit2xFDm1L0QEYzifGzvqG3mKyVG38V
X-Gm-Gg: ASbGncvoMRXQh4eAK/E5pVRe2wIlXqPYAEg6qoxbI2EFnNEN0Ml6ibOnaonL73nh7kR
	RZnNGDC14z6xIahbeJt+7kb5VO/6c8TDWeTbMgadugH8UoiByDhzzbQIY/et0PVxS5fd0dY+S
X-Google-Smtp-Source: AGHT+IHr1JtErWlVHX79qMcQvFhXOJNWZJaYIxYaJjGhk3eQUSkF4wLTbtJA86OIldXc8lrBhWsRsctkDWylkh+sNtI=
X-Received: by 2002:a05:6512:110e:b0:540:1f7d:8b9c with SMTP id
 2adb3069b0e04-542845b5963mr7654743e87.45.1736834471079; Mon, 13 Jan 2025
 22:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218203740.4081865-1-dualli@chromium.org> <20241218203740.4081865-3-dualli@chromium.org>
 <Z32cpF4tkP5hUbgv@google.com> <Z32fhN6yq673YwmO@google.com>
 <CANBPYPi6O827JiJjEhL_QUztNXHSZA9iVSyzuXPNNgZdOzGk=Q@mail.gmail.com>
 <Z4Aaz4F_oS-rJ4ij@google.com> <Z4Aj6KqkQGHXAQLK@google.com>
 <CANBPYPjvFuhi7Pwn_CLArn-iOp=bLjPHKN0sJv+5uoUrDTZHag@mail.gmail.com>
 <20250109121300.2fc13a94@kernel.org> <Z4BZjHjfanPi5h9W@google.com> <20250109161825.62b31b18@kernel.org>
In-Reply-To: <20250109161825.62b31b18@kernel.org>
From: Li Li <dualli@chromium.org>
Date: Mon, 13 Jan 2025 22:01:00 -0800
X-Gm-Features: AbW1kvZGO2dnKh9EFLmOMykm0k2dAxwLsXw0Sg0rIQW27PvNSHzYNz4ekKKY8e0
Message-ID: <CANBPYPjQVqmzZ4J=rVQX87a9iuwmaetULwbK_5_3YWk2eGzkaA@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] binder: report txn errors via generic netlink
To: Jakub Kicinski <kuba@kernel.org>
Cc: Carlos Llamas <cmllamas@google.com>, dualli@google.com, corbet@lwn.net, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, surenb@google.com, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, horms@kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 4:18=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Thu, 9 Jan 2025 23:19:40 +0000 Carlos Llamas wrote:
> > On Thu, Jan 09, 2025 at 12:13:00PM -0800, Jakub Kicinski wrote:
> > > On Thu, 9 Jan 2025 11:48:24 -0800 Li Li wrote:
> > > > Cleaning up in the NETLINK_URELEASE notifier is better since we
> > > > register the process with the netlink socket. I'll change the code
> > > > accordingly.
> > >
> > > Hm. Thought I already told you this. Maybe I'm mixing up submissions.
> > >
> > > Please the unbind callback or possibly the sock priv infra
> > > (genl_sk_priv_get, sock_priv_destroy etc).
> >
> > Sorry, it was me that suggested NETLINK_URELEASE. BTW, I did try those
> > genl_family callbacks first but I couldn't get them to work right away
> > so I moved on. I'll have a closer look now to figure out what I did
> > wrong. Thanks for the suggestion Jakub!
>
> Hm, that's probably because there is no real multicast group here :(
> genl_sk_priv_get() and co. may work better in that case.
> your suggestion of NETLINK_URELEASE may work too, tho, I think it's
> the most error prone

sock_priv_destroy works with genl_sk_priv_get().

But, I have to manually modify the generated netlink header file to satisfy=
 CFI.

-void binder_nl_sock_priv_init(struct my_struct *priv);
-void binder_nl_sock_priv_destroy(struct my_struct *priv);
+void binder_nl_sock_priv_init(void *priv);
+void binder_nl_sock_priv_destroy(void *priv);

The reason is that these 2 callback functions are defined in
include/net/genetlink.h as below
void (*sock_priv_init)(void *priv);
void (*sock_priv_destroy)(void *priv);

Otherwise, kernel panic when CFI is enabled.

CFI failure at genl_sk_priv_get+0x60/0x138 (target:
binder_nl_sock_priv_init+0x0/0x34; expected type: 0x0ef81b7d)

Jakub, we probably need this patch. Please let me know if you have a
better idea. Thanks!

diff --git a/tools/net/ynl/ynl-gen-c.py b/tools/net/ynl/ynl-gen-c.py
index 8155ff6d2a38..84033938a75f 100755
--- a/tools/net/ynl/ynl-gen-c.py
+++ b/tools/net/ynl/ynl-gen-c.py
@@ -2352,8 +2352,8 @@ def print_kernel_family_struct_hdr(family, cw):
     cw.p(f"extern struct genl_family {family.c_name}_nl_family;")
     cw.nl()
     if 'sock-priv' in family.kernel_family:
-        cw.p(f'void
{family.c_name}_nl_sock_priv_init({family.kernel_family["sock-priv"]}
*priv);')
-        cw.p(f'void
{family.c_name}_nl_sock_priv_destroy({family.kernel_family["sock-priv"]}
*priv);')
+        cw.p(f'void {family.c_name}_nl_sock_priv_init(void *priv);')
+        cw.p(f'void {family.c_name}_nl_sock_priv_destroy(void *priv);')
         cw.nl()
