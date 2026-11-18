Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795038587;
	b=F49Fl6WklckIluUgd6gtQVmUNpgeBBjeItk2VfoOgOhWbXLAVTKU/HRm6Uf2K6ecgyOk
	 7RKpddquH4YiMK9+taHFFRl5J4V81WcpqzPhW5uvsuMKYTtXMPJroFF5qZ7+8GtwISkCW
	 xwCJz397KL6fgTY2C+UFXHbosdnb/aen83r3BlyS/ckKua3QEsmnb+ijYxTpC2/IwX/Lb
	 Oe+PLL9UHEPVpDN7NSGyQRn5izGTmgMFke2FplhTO+sNRectaebLWLKGIW9kk2jL+1yL2
	 wNhUtXnFkXDhf/zvH+0braJE9LNj70WLxQPcRw+fJHY9Zbuz5Y2HI0OCiqDfQMOR3HA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
	b=BU/g7n0XfDqUJNs6gPLtMwfLojBavQBVXk3mIQW50Szjc4LIOtWRQf4kgHh/BbzDQC9C
	 vLMhsUcQo6/33+ZzU1BLpU8qhgktYxFiArF3Wa9oBaeZWvXgHqSrq7ZhD0TDrbjNtdhgP
	 jT6IQcGQ5KaTdSnYL+BtLjNVXm9zGIS1IOoBJB2hh8r9pth1UgwdDdp54XlKzUVbykYbL
	 FnA0jS7ZMH0bcsjpDzefmKZ1ThTbUJqSG1Lf6IC5NN15grnq7oDrtcnHUUegZSdrDY+n6
	 Xp6I8+/WJJsSZvWrSq9L/wyFFmSZAty3G3roJRjaKUUf6DkvI4B4vmmCDVmB8mgtD6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KaciEEIF;
	arc=fail smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB84606A332
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB84606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KaciEEIF
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso300462e87.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795038585; cv=none;
        d=google.com; s=arc-20260327;
        b=jcg/sk+VNtRoX/8Uh2S2lgmavpcvqgjERrJX0k64S8tyt90w/eVg1k860zZFrOOf5y
         UrnmiFU/uDu7LnHyRXhB6Nrfux0Lk4pmS8DxONkhy5lpJBec3SnEbWstz5ElfKVLFDC9
         woj2xbeBtSsv8/mTrtAS6EXl1NWWzwP2jwpTLMDFQC1Gahar0sIM7a/W+jySN3vMVmh2
         My0xTJB3HRbDIn9+RE3LRWGB/q+D2PdeHJJFm33UtZy8r0oqaDGt/824eLzFG/0KcSFJ
         CXcqWIb4hkBlzqsul3whkZFOSyffZZXpgQxo8GVs+UxaTYuYhiCxYBRSzTrSjC4MbQrX
         fPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        fh=lMOv1cZ45KgCcSWmarcFWTKKaBZfKyZIIW08EdZgij8=;
        b=IFJ88j9lUmkonaFf7ZElzGPnD+18QGr2k3VpZEsC4WjoaNc03idbgv4WwyLEC3hlWS
         rLA9q6LaIDyt6ZgnGxM9ibmuTBADjJWxnQTxrZRKYZIs1Yxu8VtotwZePA0vdLb1CRac
         EHe7OguNnrtByY+eVRp89O8AC+7dZJwOwa9GM2Y8iPBH67NTct7qQOhhvuftcAJDsoJX
         8mr/NseWqRZEklpN9UbGgSnI0Vk2Y6FukP/Hu1m0wtVYrBE4x8w9ssYPgaGjE8XWK+dQ
         DCZhcQ21rLxyYkXR4AJaTdF/0R3QryaTxu6SWr7DxcZe6fOLN4E/huw8d2jV67jR68ow
         RLJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1795038585; x=1795643385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        b=KaciEEIFbL/YwiIDScNJOJE/ZISkK9Hm5quErzyii+lNT1WfC7kXZg/3FpRZhArF36
         Ad6xuGX4OWHMMcj6Uv+Z0P3xjYKr4xdoCcBZYBSZ40V+hyh+sFba/6f/Byhy6/IHBYV0
         /krtJ2/zrzEeNc29BPoEzTEoutLnweqJEraHWGz4Xdqq1myp231uUNQJfdNikDffJxU0
         OhrtcSpB956rNGC7WaELPyoRadGtF0ROnUwsxD71d4jKhm42p47rbfwAaCyy31Ekzp8c
         eLl8tZDuFmJ51rjZGikkRD11SztUd+7xg3bdsx6y/sDvmlwM86hcs70DaEGgQFzFJe8W
         wh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038585; x=1795643385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZPHqjEKi2vg5bpASOGDI+kJVhoG5JNXko8FEV4Oxfg=;
        b=u5q230iPPJjtmG4Snlvb+ue/VP+P3K+txWvtYzWp+aijG+4qtn+f7GABPVl81EFFdb
         WXfYWrRmNs4bXbHvkRvEpDq/KyEa+Huf6SPmwnwNBdGbsCHFQWnpSYzjxWkrP83fA+HC
         kJNhHPZNuqHXs3MuwV4Vo5HNqe5oIFaFT6F0m4NLtWf4elCBfGt4/hE6ourmR7nMNo6u
         XNPPehBmMsDfYkxWV9HqZNl5AKzaJYJGEPR3DOi72M4MGH4fgTemSAfUOD229/WQNwMc
         HFYNQTodHtsIBC/IcRzSaOytXk97rlnbaTu9QmK2VjM6uzsamRBDaGu3HfBHGJjitWmV
         F6Eg==
X-Forwarded-Encrypted: i=1; AL+hErGs+MBSxtXVvuEDCn9sFQ0WzrQuqKNmeeOV4stPXkd4hSNtZrCrg7/2VY4vMCkmvBfYlThrvQ2az4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z87KVrityw/evUD2ccDQN1Bx+qqlR1igdNzBFQCVbI4/ugw5Ud0
	nX8cqmggRd/XwIaD2GnIlYoGRBbfLBIRwCngvFmzHuVVbV019dbBlhDxrip8XcMQTEC89ziVKYU
	A32EKcuryb2JvebQCmVPx9zdOHjbNyLSvvETn00jR
X-Gm-Gg: AYBFou3bobXk+ETnsihglTSYIImCJB9mW16iPCZp3u2h+qJ4KlYgNHYd32FteIdSC4j
	vUtlLzrKUkG099VYZzVeu5csWxF2Tjcr8/zvcRW5hdOdOCy1S3m+dj/jbzF1mU6jKbRUiT91gNq
	fNAkCqYEnYwX0to/5z66/1yseQTYKtAEfq7dhlKCXHD/1wiYt8rMD+RW1jGuRC9+1r+eodaYHZ1
	28YYEIavJqU96OgT9bmjbfdyeFQtlp1BUCeT3L812y+5A53/uMBLVNPgBmv90AxTodowkejZXU8
	G+fVIc1MZKU2Tz1k3o/U8/mrPGJsTof1z0s2Js42aMJMWIjxdkBxeH+H6jguNvJ7hH+rzeHEsHK
	DbRk1yq+5kvxrtL/hdGJ9HzmDPFiPHjpQ+A==
X-Received: by 2002:a05:6512:3c8e:b0:5c1:ac5f:e596 with SMTP id
 2adb3069b0e04-5c1b40e9b72mr9362e87.23.1795038584801; Wed, 18 Nov 2026
 13:49:44 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-befreien-addieren-eislauf-e09212803534@brauner>
 <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
 <avM41a80aig2de-R@google.com> <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
 <CALCETrUjW=kXxyggDUvEN+Pxc-pE98eVbdW8XBU8JzfqXj_voA@mail.gmail.com>
 <20261117-rational-ohnehin-unbeugsam-e5c04759a156@brauner>
 <CALCETrWhuOnBy0N0KznmczD4S2XEK0fbr0C=1KFQqTnoTJbQbg@mail.gmail.com>
 <20261118-stapeln-eckpunkte-lesbar-ee73537f474d@brauner> <20261118-zufahrt-baubeginn-gutsbetrieb-c09004227e8f@brauner>
 <CALCETrUMNr=32ENT6VBKPzoyJDfaX6nzZsjMVxuz9O3z+6LRhw@mail.gmail.com> <20261118-professionell-kondition-kerzen-5dd23c1ee490@brauner>
In-Reply-To: <20261118-professionell-kondition-kerzen-5dd23c1ee490@brauner>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Nov 2026 13:49:32 -0800
X-Gm-Features: Aa3M54rEY9J5hVHcO1DPxjhsi7Vv-UveBjN-XrYjaJlUs9gt6QOZEnzJ-89YhLo
Message-ID: <CALCETrXAGpb=OZyGQ2=VfKmA6xeizAsusGZ_HmRtp_s99RpRJA@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: Christian Brauner <brauner@kernel.org>
Cc: lennart@poettering.net, Jann Horn <jannh@google.com>, 
	"Hallgrimur H. Gunnarsson" <halg@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Jonathan Calmels <jcalmels@3xx0.net>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:37=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Wed, Nov 18, 2026 at 01:12:45PM -0800, Andy Lutomirski wrote:

> > > > * deny privilege gain on exec in the initial user namespace and all=
ow it
> > > >   in nested ones. I mused about this in
> > > >   https://github.com/uapi-group/kernel-features/pull/38
> > > >
> > > > Also, since v7.1 there's CLONE_NNP to spawn a child without no_new_=
privs
> > > > set.
> > >
> > > Forgot:
> > >
> > > https://www.thkukuk.de/blog/no_new_privs/
> > >
> > > has an overview of where we're currently at.
> >
> > Nice!
> >
> > I commented in the uapi-group issue:
> >
> > I think there may be a rather more direct solution to this problem. I
> > seem to recall advocating for clearing no_new_privs when entering a
> > userns way back when, and IIRC I dropped this as part of the extensive
> > negotiation to get NNP into the kernel in the first place. (I think
> > dropping it was probably the right decision to keep the final patch
> > simple.)
> >
> > But I think I would still advocate for an option to let clone, unshare
> > and setns callers turn no_new_privs off. The logic is that, if you own
> > a userns, you already have all capabilities in it. If you enter it,
> > you get to keep those by having them raised in cap_permitted. Being
> > able to clear NNP and thus drop and subsequently regain them does not
> > let you do anything you couldn=E2=80=99t already do.
> >
> > An LSM hook for this would be needed because this argument does not
> > apply to non-namespace-scoped LSM-based privileges. But the LSM hook
> > would just be a "may this caller enter this userns and clear
> > no_new_privs while doing so" query. In the absence of LSMs, the
> > operation would be allowed.
> >
> > This would allow a fully no_new_privs host to run an ordinary
> > container that runs, in the ordinary way, without no_new_privs, and
> > without hitting any new LSM calls after it's started.
> >
> > The API could be as simple as a CLONE_CLEAR_NNP bit.
>
> I think that sounds ok. I worry a little it since it would somewhat
> alter the promise that NNP gives. What model do you envision?
> It seems that CLONE_CLEAR_NNP would only be allowed with CLONE_NEWUSER.
> I _think_ this safe even for privileged users that create a user
> namespace and map uid 0 to uid 0. So I think this could work.

Whoops.  I thought that and didn't type that.  Yes, I think you should
only be able to clear NNP with CLONE_NEWUSER.

(And if something like cells ever lands, presumably a task with NNP
set should be allowed to create a cell without NNP in the init task as
long as the same LSM hook says it's okay.)
