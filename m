Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897971;
	b=4NomzbOauZ5a1+6Rnp9x/ByOnXul+GB4/T9/0hZbakDYeH7J5ZXjNwdlVisILU8/Gaz3
	 pkZNMGiiz40cIkTcceNVOM9SDa1jvzqFiG6nPr46QY8yOHhq0bZzihEsImrKGpBXst5U2
	 ByrFyvsxGTIdoeznYfUU1LrpwEre25UGsoWe6bTyZmHM/TXh7ETvNBY1nb3SbRtSS/XKe
	 pNYvMXHY5MmS105KkVUfuozTYiADtuM9TTaY0sHT171olW6PaAsp5yEzgsUQH3su74kLs
	 k+BqCH9nun0aOicu57GfBzkGluLF8u2T0PbKRrB91+pShJY9A6yOBVS93ASmf8x+zrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ENTWrgdqNOnhBXm7Ydoc9z3n/Zlmn8Dt6MNiq3/7nzs=;
	b=JMi6hLbytepElA6LG9OfxJ6ZMe5wvmQVv9pSFXZOZVNzlSXG5O1aHEVISuruXvPEBn7r
	 1bu+GHzt4vzoWmV+cOX0EWDrTLioyYSSiZMWnfGMiY6SUNvUUsq9/KT/WAJPkchBP4HdI
	 59WRcnlz/Tn7ORagekjEMpAxrKWGGaX0PRgQC9XB6U2/Xz6zpBW/Xi1NdIV69WomlpdVX
	 oFu42ZSZylqlzwF6IIYgwGOBlPImwmBSZWtWM9wyXD7Qe+DeqKoF5oV4ii3LhHT3KJnnl
	 X+EsAyDRBzZtCwEGPO8mvLhEJQ8plsqmUIj1PNEmbd9rcenTGzzxg4sJjFk3rSlesVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M4rBHBr6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D02606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 16:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D02606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M4rBHBr6
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso1334377e87.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 08:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793897969; cv=none;
        d=google.com; s=arc-20260327;
        b=lvpJ9LWBQw+EfWaoiJM86E4TefNaD3xj3gpg5GKqOyiq5eDMMfcY9fZps7Tx/9q0zS
         QX5IK5kADwz0i4QtMrDek1XJq7AqBeAS+31yyLEhVqEraxN5OLflVxhzxRlXckx4pXBm
         2Hrgwjkl2X1qtR80apixFJEC/+ES6MUWIgocl0IFX6ZT7MRbEL8acWf0/VvsX3m0q6eX
         GnC5CqfWATf7107VNN7DkSKVzC5t2jibglrnDqws3UE41uQsS781FWkvTbiWpymbmATq
         7xnjlYCyHgwTXjER4mefkRhQ//b/VxKXuXLklp6ZyilPOdiFLhS22GAcXCAJ6wFt2CxS
         keTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ENTWrgdqNOnhBXm7Ydoc9z3n/Zlmn8Dt6MNiq3/7nzs=;
        fh=t3n3naYho3v/Y2VC1vBW0rVtOM46FvL4GJAEIC/PQHE=;
        b=h6ZjhEVLvmuidIZyd0RG3/BB+sfGjehbEDdu+hO5Xd+ZaP6F1JZrenZgnuI/WZsYiE
         Bl4mLy0Da5vdaN7Os5U3utz9cYe5qpJNPvEQ9kZPHw2YivMBJw6OYgKT3Qe9+st7YXNS
         CaCw8Avbon6mlEYKCww0NxrOlWP4odKtSe2YjQnLWRrXfHMbv1KfxQNBlncaUaPdY0fK
         zRi6U4OxJnmPqNzP5TJgsYSTETbxboVtb0THf88kHw4REfLDQfUGd5HbByVDIuf1jRLR
         BZokJFk+faHzZr3xPWjsfTD8/uU+Er2S/3vRo0IV46+vJOwYuBzJOQ1GQYsNYIuAjvFb
         xccQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793897969; x=1794502769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENTWrgdqNOnhBXm7Ydoc9z3n/Zlmn8Dt6MNiq3/7nzs=;
        b=M4rBHBr63W/SAVwNNbCQfErkFQNKWB1qkv3HtqteP54rOiV/HHnDMbtUKJCArIzFu4
         mYj0S1RcIb0q9pNYYwzfkrgcW/4hpcfT9cokBuN88bZN0gEMLrtAd9p4+/Q1wKWLERCs
         DrW00xbJ3OukwQpHPe/em0QG+3GlYH+g3IYsga7TvOEBXsyzoIivcIrFXjcPfBtQMsJx
         dhhKFMCZQePt2r/MCoc/hvcGaP1eaY7HE+KfNY0jNPytwrHw0Re5wyWLV4CIYYEeqBaz
         M8PdhqQP2K58xdjOL5tlAIrLEOG/UBLGLNET3to0NrS8A3suRDOPofJdLYHDtzflD6hB
         0Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897969; x=1794502769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENTWrgdqNOnhBXm7Ydoc9z3n/Zlmn8Dt6MNiq3/7nzs=;
        b=wABvh7jnPzq6cr3HFGsRBsuHgjiP0wQewkD9nUXV1BG4u/Jm6YWm5IU2mLDGSgf0yC
         wHzTvy7WgPm4fvlGHKAILIoGfHcp9MdM5O400u/xHi2y9bTRUYSIeihguSPkd3NTjPXc
         ryGQDHPi5t1HLCYpIDiYI9P21/iMD3kpcMW0po1TTIsX3Kzi/fixyAIDdajPsX/Rd9sb
         0kj3OxTDXNEz2kR9m3rXZzKpBF07PKMa/DwApbLTu5L0rbRDH8K+gTWQJ7fTpMje6sC5
         k903aPvKuEbZw/QiK8FQyvA76/k98XjElLmy/wVUUXxLXAF4zuQKDlJfB/d5RMydin8+
         QvBg==
X-Forwarded-Encrypted: i=1; AKwUvBwC8Sf1vnVprsXLq0qAFSg+u02vWpLs4xS33bcWGXp+211gXSC8csvmQMpmfN6PMA65fdgx6t5bmGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J9W3R3JeS8NUpUPc3WAeMKm3QFAivHyaX8joYKvQi3SUEZjQq
	BSF/oilkFwmACqPuCTNCRXHDA+Ngw5IZsYqkWZbJ0yEs8t8kY23NgIFzXCiNQB7KbNICUXzhUNw
	rTwIaOX1t3hOdItAC5CyT3QKQg9AKKagclu/CghQv
X-Gm-Gg: AYBFou3khpQIpelHmziBivxrgn4TRQs8ftjWtGVCQBk52wXO2Ta2sWrHwGHHEj263Rl
	u0NzsE1+Y5ovKOY7a9lZuIsoe7uAFcMH/ANi1ErtTpUwyovkYPVAlDHdgVk5fXlHfAZLD4MYpnb
	65FpLeqlMDwV96NGzmGt0i4u3vjNUyb/7TI3hZILM4OoKdk+kJTMo3cCFtdJNjc48ouHEpszQra
	dH3d1Cdsve2XzeZGqp5Zmy1zVJcGV/00cu/lVOssEL1BHRA1KnJW6zu8fPiRPaGkz7qavXMpo0z
	gTSalSpnoeCqnLx8TxIM3gOARf4vdczYvmMlt5P1QXqkrIsILWh01pQ826/A96gE0eQO8jgmVyC
	dEPkZM0QuiFHs0mYo8ApkUA6Pm2hXspOnDQ==
X-Received: by 2002:a05:6512:3e1c:b0:5b8:f97f:7a22 with SMTP id
 2adb3069b0e04-5bfd957683fmr6945728e87.54.1793897969539; Thu, 05 Nov 2026
 08:59:29 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <aunVmg42/S2uUDWR@hallyn.com>
 <auyink594bxptAPN@google.com>
In-Reply-To: <auyink594bxptAPN@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 5 Nov 2026 08:59:17 -0800
X-Gm-Features: AclHuK99RUxjga4Yt7Cih1iKUoXn780fqABuH5tRHwVrGa5--KTUob_Z762ltig
Message-ID: <CALCETrWaFf-X-mD0moxqaqEDWOV+85geK2B2Rs3ArixKd=Ntfw@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 7:48=E2=80=AFAM Hallgrimur H. Gunnarsson <halg@googl=
e.com> wrote:
>
> On Tue, Nov 03, 2026 at 06:37:46AM -0600, Serge E. Hallyn wrote:
> > Generally, if I, or some users I support, need to use unprivileged cont=
ainers
> > or user namespaces, then when an 0day comes along, I can hopefully trus=
t them
> > not to exploit it.  The biggest danger comes from the fact that, right =
now, if
> > they can use them, anyone can.  So if someone can trigger some other co=
de running
> > as user nginx or something, that can become a root vector.
> >
> > So what if we had a built-in feature or LSM which implemented a credent=
ial based
> > whitelist, entered at firstboot?  Something like
> >
> > ```
> > # Default deny
> > uid =3D=3D 1000  # approved
> > 1005 < uid < 1010  # approved
> > gid =3D=3D 1005
> > security_label =3D lxc_user_t  # Not sure how far we want to go with th=
is
> > tty # must have a session
> > ```
> >
> > Now, if you want to use user namespaces for generic sandboxes for all
> > users, e.g. to confine browser activity or nginx modules, then this mod=
el
> > may not fit.  Or rather, it might need a few tweaks.
>
> Thanks for taking a look and sharing the credential-based allowlist.
>
> The latter scenario (generic sandboxes for all users) is actually the
> primary use case that I'm targeting. I want to allow unprivileged users t=
o
> create user namespaces, e.g. for sandboxing, but without granting them
> security-sensitive network capabilities (CAP_NET_ADMIN/CAP_NET_RAW) when
> they are not strictly needed, given the historically high risk of local
> privilege escalation associated with them.
>
> The two approaches target complementary layers of the problem. A credenti=
al
> allowlist at creation time controls who can create a user namespace, whil=
e
> this patch series controls what capabilities are available inside that
> namespace (and its descendants) once it is created.
>
> Gating creation works well when there is a clear boundary between trusted
> and untrusted users. However, in a multi-tenant environment (like a large
> container fleet), we generally treat workloads as untrusted by default.
> Because we still want to allow these untrusted workloads to use unprivile=
ged
> user namespaces for sandboxing, it is essential to keep the attack surfac=
e
> small and follow the principle of least privilege whenever possible.
>
> More specifically, this patch series enables that model of safe sandboxin=
g
> across three key use cases:
>
> 1. Configurable capability stripping: Administrators can enable unprivile=
ged
>    user namespaces for all users to support sandboxing, but configure the
>    system to strip CAP_NET_ADMIN and CAP_NET_RAW by default in new user
>    namespaces created by unprivileged users. Basic sandboxing rarely need=
s
>    these (except to bring up loopback, which Patch 1 addresses via
>    CLONE_NEWNET_LOOPBACK).
>
>    The per-namespace bounding set can enforce this either globally via th=
e
>    sysctl, or explicitly via clone3() at the container manager level. Thi=
s
>    restriction is monotonic and persists down the namespace hierarchy.
>
> 2. Selectively granting CAP_NET_ADMIN: Some containerized workloads
>    legitimately need CAP_NET_ADMIN to configure advanced networking for
>    sub-containers. Because an unprivileged creator's child namespace is
>    bounded by:
>
>      parent_bset & (sysctl_ceiling | creator_effective)

Right after sending my last email, I had the following thought of a
variant of the model.  Permission to gain CAP_NET_ADMIN via creating a
userns is kind of like a capability itself, right?  We could get
pretty close to nice semantics if we allocated a capability bit for
this (CAP_USERNS_NET_ADMIN perhaps?) and, by default, giving it to all
users.  Unfortunately, the latter part is tricky because even sticking
it in the ambient set won't keep it from being dropped by setuid.

Perhaps we could have an extra capability mask that is for default-on
capabilities.

The intuition for this is that permission to gain capabilities in a
userns is a mess if it's a sysctl (as sysctls are global and there is
no clean way to say that a particular unprivileged task may
nonetheless create namespaces with CAP_NET_ADMIN) and it's a mess if
it's a securebit (still has the latter problem), but it's much tidier
if it's tied to a task.
