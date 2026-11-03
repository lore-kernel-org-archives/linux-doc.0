Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793731088;
	b=BXefw8qTc8XuZYxMy+75ln1Gqcv/T/BYFLIpZfVGmzSefvhbnuA72h3kGEPWXjSfdUH2
	 ktCH8yGdAvx19Da9WYyrgh+hFLphxhMb7G6hsZSRHDl0voz7oLQEd/Rr1li2avpCJdT90
	 b0CP6wzDYhKk7cd6gQM6K84VjsTOu1VAseDx3NL30PXSGv+2WZCORJ+i9N14+iLSdyeqH
	 ZiHr7DkKLK/syI6vLQBDt4xyyr+8AHluTFAgJm5P1aNxKHeKeIFHsCgYKA366zvOGl0fF
	 qN3av2MmNGvdePqLPQ3OBaTOgzqYRltBjE2eYnFGmQhfn8G+uNQf2ejQMH9j8iUie+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
	b=UbjMXDhCCYeJlP2vv3nGg8NEm8SEOuJin3qk7/RC7t8ulUbsPwF2SPupvItEgxNrZEMh
	 nYX8vtkuRP0nIUfztQDnJW8Aam44fdEQil+azunVsM1U14jKGYgFDXIj0HUOSSJouUSv3
	 aDji1wsR5RlL/zIyCE/lKEaYp2s0S8r+BPomfcBVs/OZyzrPtOI0MnvBnNJTOf97xypaS
	 +HxBMhkmj1f1atEVqThm2hbo+87tbrZFiMuhVvXbRWUQFvRXFWGFQPlkVmeOWGQESfOIE
	 QO+zUXmsRm5rBe/Tsl0zKnWTCAdgc8j5GfMnG6ZhiFvNfLb+y33hV3I6faNORHHc9/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nVCsNw0y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FCF606A32E
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 18:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7FCF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nVCsNw0y
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so23428871fa.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 10:38:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793731081; cv=none;
        d=google.com; s=arc-20260327;
        b=OaBNi94n3NNrTsXrxWOo+SIk75a/kMNBGH+Vipy40yz1hoM+mKRLw/sR6c5nHoLiSf
         ILl1BwmDiSfPLWdf1+EpNA0reX+l40GDpdZAVXB725Dz97FXiRkekwVenivpUUZZPYld
         lyLpZLkXaiX55ViyMCacZ7r6fGbdn7FbJvLqC0ZCTRUMjCrC3zw+DlXfmY3mz/ugArVQ
         IO58Luq10mmQWN/wjHU8vjZEySjlZ36Ug2YwiKQbnRRjKcipSnu/4bMiILCkrjgGBdXC
         UZJ0zPawRviWVDDwH2FFRsxxueoArn5LqqtezxFpQ8PXGOCjx4Cqv9I2OxHmrL2fYY+N
         wF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        fh=9LV2hnemACJHJj5rvyKt51AgznRTOhpmegmvP1mAwDw=;
        b=e16c6fTKp5qv9DBXwOLJoNBNjkFnrwOH1stcun3QsaPcn6WPpBOst81bshCCdsa2oS
         m5AgEoC2gLjWq6mCALuqqE0CCMuw4QRRD+GuBrx0kUY6FCQ63sz/M7I2VsgvIOm3Mr6q
         JKd5PLrRNT+UmSNbHE42A1ubNMWEYQbl2xQD0pUWRy5zqoQAPGP70THGD1fHKks189Lj
         1CsuFIFm7djPfpGFeZrwzIAxV3wI8AeoRM3+d6Hc3LTNqaE+z/ga3HqvjLwVO4cplg76
         qGz5SKdGr7+8lobj+F43e9Jz5RhMt1CPKWn02Xp1cOIGcExBmd8euHb8K77zuL6EkwHu
         DvyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793731081; x=1794335881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        b=nVCsNw0y6hskrENSBv8EU3amWuYztT8dLT5p7AwDRfBEJgh5KCH4wcnDy1+4F8oz26
         mugE2B8LWKKCR0Y9k2Z98xSLZ5eNvcfR272i+te/45lnsb9AWyAtGJcy3D9bL7ir+f71
         qQpNmsSv7T5esoFkU7QTr7zF74lmigXGg9dzQbwmAGy2M5yd+bQ/6ZIx3r0WugxBJ5RO
         hJm/oKDuQExrJP3FUtAD2VCpRZdYySsqRCW8MbRDOe9JChKA+5WjiMn7EutjmI1dtjC9
         TX6PAuZUUq43suQ5ErDcrLsoaFbkM/WfFXDhbG1erayEtyXYdgmMQ2TL7MALbarBBDH6
         21vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731081; x=1794335881;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fviwjroG//qntBAn39plNVA6JSIngXI7akYS02td+eA=;
        b=wELS7CB8vnKQqDQ81H/IvN7pH4mNcJbN9tSUTCSPzp+o+ihkP/bqCy4SsJPPQw4rJj
         K2ywJD6UGZ3MrRqdA8fzEnurza8WTBh3cXacJmCikz9hPelUMh+mdbehmulg0NP7NgQ5
         6kvCaG8RboJpM1mC1TSahOfB0KDumg5nJdRpgTWcgmAZfe6i/y48zyVeOxnAJLHWtC99
         r0XfClebUr9tw5r7UgmnhQZQ8cp9SV1YJCWw0cn2xy3QDF8n+eKRNefgxkSw0y7GB05e
         W2r4VudGPtGXvOp+JUwwuHs8lMsk1MKLjKpg5xjXzvl2w40hjVTLZ+GZzcPLh9jwEp0Z
         NWKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaFpeKwjK1DP4lYn/sp8bZ+BD2gr6smvrM8p2wM14HNrh870xh9VnJtKRYiVk1CJPYEEzvGdYlIfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6qVM5AbljOR1WxPFmUnYG0kt7mY4VW8cY8tIIOihCXDQ0+I/s
	4MnRn4qk5vR3UUTmnKSZgbf3uupyvkJMKXgvMpf4nUEOk7/n/CCz1PStc4/kEDdpArZGVMjQv/p
	WKLdPTiJgJbaaH5GUTuPft6ZbSTBtXQPR0xHQTs6L
X-Gm-Gg: AYBFou2XNUSQQr0KGRsO/1ZmQmjldbHfMdxd5Bjjp1pVzlWRiSI9zQUN9VbUXpBETb8
	gjlsDxBVxqus/W9pv7XB93v1VzkRs/aLb2uK5yoXDIh7Kmj1pcBulqEYrd21x+t15v06AhKE7xr
	xwZhP/+iEF/it+qkXUnbSCneVxT5duP4gd1w75ixRXuxbSw1h6Y2YAB7Dop41g9ZKjWNinCh/n4
	uooP3+jYIW5GJORG6nv3gvbalwo5eVc1ZjiR+wHkJMs0sDDGUaG4124o1TLLigzK19r8ZIwz/j6
	7lNubTgZzZKN9kOrC80kxqLKJJICSPc8UuwbPLifjv6zZnEtpf6OM8s16ZrEW1scH/H0ttun+ky
	N55g6j2/heljJ7UoMFv4Jgh8lMy1fCIakZw==
X-Received: by 2002:a05:6512:3ca7:b0:5bc:e8b0:5652 with SMTP id
 2adb3069b0e04-5bfd9589099mr5147409e87.63.1793731080985; Tue, 03 Nov 2026
 10:38:00 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <auM32mOlBLu6ZUlt@google.com>
In-Reply-To: <auM32mOlBLu6ZUlt@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Tue, 3 Nov 2026 10:37:48 -0800
X-Gm-Features: AclHuK_sfbKF658HbwyCTsOToNn9cXs0qzXn8uaPUG4vxi_nXA5hXmjvbt4jwHQ
Message-ID: <CALCETrUD4vh_iSHV7G0bprUFU8=c+ECo701-tXcbQ3UXBWC1ig@mail.gmail.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
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

On Thu, Oct 29, 2026 at 5:11=E2=80=AFAM Hallgrimur H. Gunnarsson
<halg@google.com> wrote:
>
> On Wed, Oct 28, 2026 at 03:56:11PM -0700, Andy Lutomirski wrote:

> >
> > Why should the task's cap masks affect this?  *Maybe* cap_bset makes
> > sense, but I'm struggling a bit to see why cap_permitted and
> > cap_effective should matter.
>
> Sorry, the phrasing here may have been misleading. Just to clarify:
> none of the creating task's capability sets (cap_bset, cap_permitted
> or cap_effective) are used to restrict the new user namespace.
>
> When I wrote "reusing the existing task cap_bset, cap_permitted and
> cap_effective sets on namespace entry", I was contrasting this with
> the prior series from 2024 [1], which proposed adding a 6th per-thread
> capability set to struct cred.
>
> In this series, when a task creates or enters a user namespace, we
> simply initialize its new cred->cap_{bset,permitted,effective} in
> that namespace to user_ns->cap_bset instead of CAP_FULL_SET.
>

Okay, this makes *more* sense, but I think it's too weak.

I have a sort-of goal of having the creation of unprivileged
namespaces be allowed in most contexts by default, *even in Docker*
(which would involve the Docker team changing their default seccomp
rules, but that bridge can be crossed later).  (In furtherance of this
goal, I fixed an ancient bug in newuidmap that gets us quite a bit
closer a couple weeks ago.)

But tying this mitigation to a parent userns means that it's
completely unusable in the single-deep case.

I do have a question about this whole scheme, though: are we talking
*just* about CAP_NET_ADMIN?  That is, is there any other bit that has
anywhere near enough security relevance to make this kind of thing
worthwhile?  Because if it's really just a single bit control, maybe
we can come up with a nicer scheme.

--=20
Andy Lutomirski
AMA Capital Management, LLC
