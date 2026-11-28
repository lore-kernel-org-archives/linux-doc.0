Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795830680;
	b=v7wFs8iq7bSwmLvPeBoJsSaEi8O24MlOi69aTFofNRsKK+iSrCW1j7wqFhmI5ykbdMoH
	 bEnMS2tQgQIh/z8fyblfHW41KLjzeO/SzZDOKp/ioIZQG96gH9+2FS4/80x1+fYFJrLOG
	 O/N/zLYuzv7o1u70lN8R2205uwOpvsvAsvusLvAa9JFMfs32dVuDn+pPxd6IXvMuCNCts
	 9IYmS1VRSKukvtqvAN9X6JPHWR5BsLQXwmMJTeyUWThJZy8L4B8VYttKmSeGgJvEFjZme
	 8mop5+OzS86CWC6Hc+4OtQtqXLEhXmAZaO94NP5JMIocetO5gbB44bxWl7Qtjl6eCrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
	b=OWF42pxx2Nc/r0OL8NQQQlcKOLj1VftmROLCobQc5EsGXRh/IpneBgiFqKS/sdjFnIJJ
	 h0YHjCNHr46f+Hs/ev5I81G56DIDajb5kLdVfplnzVImjwTlvfQFgSCkQqxDM4GGJNXAo
	 K1wVrh3z1kwpUHGDJTzPdkmNP3LcfRNE0ZSvEFFO9ZJuObtZwe5055yjbjQYdmy+C5TVP
	 vccNEpEgWox7uZlV+GSbKbPdjBrmEIcxomwDtfIhBVtjXZiouIs4KqDQ4byZC4IKovRJH
	 BRZYujfvQuWJjtivqn27gkXiLCi7v+7hRKG2186mONyhuKYgn1ptzaW+GDCoC+ZQWmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLosXPN4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1E5606A31F
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 01:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1E5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XLosXPN4
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5198302d38so704098966b.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 17:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795830679; cv=none;
        d=google.com; s=arc-20260327;
        b=oayOnUsKMG2o8Gb2ql0Tbv39TJaqPBsrDKx7m//UU58Lo2NXbCOq8mE6Y/8C8D0DSr
         TOtR9Y/hVIAUm7WSiLOa4R2RsL5zMIL2SCxjIKhcBvSJrVW+mwVLuFkvgDNqJpbDgDi1
         mv2XUx8bk/sCazK3oYmdKGbHqYgsw6luL4mguij8G9EllLWlzlB+Rn1D14LyjXGpNrdZ
         9vOoaqfzZ9KXe/14hL+liUOD3xak9dTlHf16PiMrsaVWn2pXJT3W/4/wi/3AMktRbCSJ
         cFGj+tp0Le9+++yBkwecZwTCkZwi1ztvoxPXOgsRtSIdZqLrUxIpsAB1kHHDfcXCTr2w
         Ja3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        fh=P8c1exeDpMVewMn8ZGIJXquCViVSn5oF4htEsZYhsaA=;
        b=PeYYR2OW7r79duA+jcuuuTZwaMdnnI1RMl0/UYnV8bxFKcJVBUkqke/TgcBZcgD4lU
         reweqXiOfObNYrrkXWd8IsCHY0MAf9OX5/qgochzzx3NCrOLLenZqcAgenG84LMsbr3J
         oAcjLex6MIsQl6mfWZIbwVR8cbTdLEH7mZcUtRzdmF/5E48UI1j6/Qq/F8rIDIg8Mwr9
         ml10vluOr9O6C8myAj0wYd76DBpI6DhkNTBF4JHpJ9kb0vpBPH4w6rnbyRmHNr1Y6wgg
         KnAKfPSr/Y/1QtaooEou93ZDa2aMV5in94XcjfFTWKJKAqTK83fBbNK7k2kebaYwog1S
         Byng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795830679; x=1796435479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        b=XLosXPN4XY1X7SNdxkqBL+OmW6RyoS3KUKiJGN6VkhP3L0yhHIWAe9gfCGB7c23JLd
         lHNLLgTgGaPV+ANwny7auVJWhylTPy7tn8Qbd1QmlxO7gDNExEWgSGEhy30NAozJQ+8+
         +xKv07hbVc2PMmC0nQwONM+Snu/fB4CVx2Zu1RVG2ABrNV3bydSS40OT+TsJEZK+JELi
         MFuPTs18dGi6k3X7RKL9C6rS6PY4lyASR9cQGoX1ApSJvF/sCt8fWc54v5qN8Mgd+424
         mRGAbRe9QyqlYYy8UZHrD36MAiba/qdVjAz2hG+uSVag6rBQPtZrBpUV+D6X33j1iq7k
         51pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795830679; x=1796435479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+kv6M/MroHXNub3A7PdHe23Ap2KXe5JLqM78W2xjvU=;
        b=wrlUAACxXPI/Pp79tJd6dkysJJPfvr3zBaaRqql3gZvGneRIgEOb4O5FRSqePcSZAz
         afTQKehV67mnkUYS0y2mfvMpzgQ5+mXKpEDAc4ohhG1SG3fZoNpuVVxlm6escQj1twhX
         26cRfOIemtaaTOty4fK36bpRURP3q1+qVAGdceQaFa8kKV+QvrrA4/4xAskMnNAZbKBG
         axN85aQhs7DKoU3WRusW8anf+fTu4MVpZGGF7Wgd7I6kxbKSEutK9mx6xaUplTEBIYTO
         qF1WqyKc+ATCHF8UHbm2D1wRPrd1d8f80r8PsA0ZUbxivtVU9xT+6he+07NyixtYRV6Z
         kdrA==
X-Forwarded-Encrypted: i=1; AL+hErFFlOJBIRl/3wl8aLAouKTUNkIpLzbbY+8m3a/cjFzWRCbBmI10vEFG0WMOYIqJhH5brxyYK7QbFX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Iz3e7/eCQ4IKI/2vhb5o7RT3dwOMwjLfh6Vvm8MePHxIHfzdt
	sjXoJViqfgwAN4UQf3V9xS2XMlCtw12Ueh33iFXJH3o+g5pEXtQZT1shXZzCOk3tSLAH+3ge7rY
	T8qNNHa+8ZeFShDELQ1BnBYdEzdRiBgM=
X-Gm-Gg: AZFdTZcW0c3o5qnwe9PzRkinEMjtViwfIrp94wY8zjR1eJys8ZXPAMD0JeDuD2pvU9Y
	o8Ti+WuFLB70OTH5lO1AbeLETwNSyoSfzRdzPucB/82mAv3Jqhs3Z1/yr0Yw3lebuFiFW1alVY3
	T1L5fGgmRkd1CjPYpp0coO+vEqL67C+ISrEwX88qvE3+I/gYspUpXer+SREuPAz5pMfcVWQnQ/0
	y0LDTPNlg3G30jLmd54g07nkctbKcQUw/BIrJMTFccNZiz4TBBB1doXwgBiACQFYmVSKdO7o9TF
	ZnGqBzG8r07DY7rfGfZ4BfvX1XfSqKPSl+xJkwxv4EMvQoN59n07MB9eo9QEe20hzBbYRnk2fNW
	qfAcGFbqqwHwr9k6oLmvCLcsZPPpNVSTE1Loh
X-Received: by 2002:a17:906:fa82:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c513a5eaea2mr1724212966b.15.1795830678877; Fri, 27 Nov 2026
 17:51:18 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awOQDOel_72Xwjm7@kernel.org> <20261127214103.542291-1-safinaskar@gmail.com>
 <awn-ioAuksHNV-Rc@kernel.org> <awn_Y7oI4ckfsjSv@kernel.org>
 <awoHex4LVst2JwkO@kernel.org> <awoO9R7YF_5_6dHA@kernel.org>
In-Reply-To: <awoO9R7YF_5_6dHA@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 28 Nov 2026 04:50:42 +0300
X-Gm-Features: Aa3M54pCi2p8qLdocdLXd3OCMkn8g_j_UUSVEEax8LAEOxwj1oFmxFAoHI8_4lc
Message-ID: <CAPnZJGBnFyrmr88OsYkMwtLiR93z4g0NAuoMurcnhcYFXz51jg@mail.gmail.com>
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: aleksa@amutable.com, alex@amutable.com, alexei.starovoitov@gmail.com, 
	arnd@arndb.de, bpf@vger.kernel.org, brauner@kernel.org, 
	containers@lists.linux.dev, corbet@lwn.net, dhowells@redhat.com, 
	ebiggers@kernel.org, giuseppe@scrivano.org, hughd@google.com, jack@suse.cz, 
	jlayton@kernel.org, josef@toxicpanda.com, kees@kernel.org, kpsingh@kernel.org, 
	lennart@poettering.net, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	luto@amacapital.net, neal@gompa.dev, oleg@redhat.com, paul@paul-moore.com, 
	ptikhomirov@virtuozzo.com, sergeh@kernel.org, skhan@linuxfoundation.org, 
	viro@zeniv.linux.org.uk, zygmunt.krynicki@canonical.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 2:15=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.org>=
 wrote:
> thinking more sequencing than data structures. I.e. I have a game where
> I need to end up to process creation without embryonic state, and add
> just enough weight to kernel to support that outcome, and that leads
> to ~2K'ish LOC of extra kernel complexity.

So you don't have embryonic state? I don't like this.

Let's assume the following situation. Userland's PID 1 is already running.
Our container manager attempts to spawn yet another process into userland.
As well as I understand, it should do clone3 with CLONE_INTO_USERLAND,
and then execve.
This creates time hole when there is process, which already runs inside
userland (i. e. its PID namespace and other namespaces), but runs
container manager's binary and have container manager's mm.
This invites for bugs. Other processes, which already run inside userland,
may somehow take advantage of this.
For example, see section "CVE-2019-5736 Is a Very Very Very Bad
Privilege Escalation to Host Root"
of https://brauner.io/2019/02/12/privileged-containers.html .
So, here I like embryos.

--=20
Askar Safin
