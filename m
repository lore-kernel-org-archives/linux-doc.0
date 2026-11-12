Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524660;
	b=gaSAw70lcxyHgBjEn+NllRn/APAh5XE4hJ9s2cS84X+n1hDjueJbNLuZxF6pu7e1Th4u
	 Oj7G+nH4MlfFKjt1CwJzYVtU99uHAaKfj1L+q1haM+bTEtLwYAzV5479rsCyM6o13OBq8
	 APdVwpNCE+fnGReKy6H60PQVpvY7hYGS5NfUKjUD/yHfV4oZDp2ccFmTFUcFUqXS9SHW4
	 ecTsHftZN9RKMQLt5/iiw5MNAZemYahZhDgzKBz6fga1gFR1Ej9+PWz579PEL/Mn3ecSQ
	 tLIz7+dp8pVC0RVOcRjhsSr7uGp3B+rbw0yhvcwz8MX7JsktIRHKOuyhEnaJfAPbIUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=08MDudRooDplOYZuxvUS0XwmDlBnmweFEYBeZu/K8vU=;
	b=fC9EZI87KmF2xJuLoO2/BAKkY9j9JeYn3h46DhhwXU/UVQlvRiklMddwWokuS7zUTDKx
	 XT3vcedb74a1VyJ3teVYP9TElEozZa2dJbL/NI3yjH7/EiXboLDvLmS6uprkkmbW9ENQ0
	 37xAyuULkDurbtgJecOAPz4AEx3dmmHKfTMwJ8J5YDdBItBKkQ2o9te48RQ1XZcxcJmO5
	 Q8MNQQWL1Pvg4zhQ7ncPyeIinotAKPBuFPRWVDOg1RGp0hIPvdJJTL72xmN2zBq3+7dmY
	 1OBY/3l6NnaeBWVkYHO0wc9CKrUCxq9XN0yXF+Js60l6XvRh6nCr3Q++FIrHQCY/e8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=YEuX+fX5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B34606A32D
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 23:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B34606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=YEuX+fX5
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso438634e0c.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 15:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524658; cv=none;
        d=google.com; s=arc-20260327;
        b=rMFuPybF+wKwk/xNPBtbsHJNdtR2peVWthZtCTGnOSEUMwccE7N/bOYxksUJwJ7gZW
         /V6LCeblDq/QXzlPFaPrcn1E0reUEtPkWe2ivHRbRXfSzsStmqmSxGC+ZsrFc6wPeh/4
         Cq4pBwRtadj/bweVFz/qmouP8kncW9IQBi5Jf7K0l+YHrOHPqgpF6wht7WDudRkZongA
         m5NdKv+Uoc83y8V5tn2tfI8URvAxivlaxxOHBq+wrbnL/o/u2MaFGGvQvqNg16CttaUZ
         /ldfuqoWwQ/QXz7Lo0B5zNWJsEEef3+7sbcXO2rW2naCNg0Cig7uipPzGGw4q3CpmxKu
         WDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=08MDudRooDplOYZuxvUS0XwmDlBnmweFEYBeZu/K8vU=;
        fh=T9RGmEzKQvCWxEeJ5AGl8ysRjD6BlW4GZ1+7Wfo0DIs=;
        b=DvlM9qwBYeLrRtJcN1Mv3gKnXulocfxkQW3xMqIabyrtF/+w4LU70UrF8bAYjHcMiN
         tmq1UX8xt+42nPo0SjsbFwbcmYtN4HWw/zdiTx2RTEJ2i/nWWXXjG9mIHnSCOnJY8yZk
         aKaRk56mcnbFOOHSI03ygNbiyEQ6z3hlvBqZSorMWvFXYp2inJI/rLtiRP9tJWT/dPci
         W8guqVK6XChFPHNCFTpfsuDfhShQdpwZoTq/A+C4VG1ewhv0ljyd8J85b3pAVczFQrts
         mBfP9QdHrWFw22Wnc33nQH2m2DuuY77YUhrZaST5KA599z8thX/wrYqbkupXNcr4Uihx
         aYhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794524658; x=1795129458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08MDudRooDplOYZuxvUS0XwmDlBnmweFEYBeZu/K8vU=;
        b=YEuX+fX5PVk+ImDaWF906WZy8L87NhbtVg9P43fmC2fewvrznUnbo63wuRLcy59skh
         GnRGKrbyGMz2w/B9lWL9UatD76ON/1KxM2SwCDMcioMTi6MNw5Eb2Wc9v8T/z6fgrIB1
         dvi3Ze6/Q1bIbPMCoQp3ukySEtx7HwxWZsI+gHk9izaRgjvZQvfYAunAsM3L1neAFMuK
         DQ2XXlgNRvgp5N8UaJZk6uUhqBlL2qb2CoOPPXZq6dEj4MQlo4VDdBqosBvbVEfV/GQD
         Y7LbTvm5kcgeC1iQCyQ9Lxlr7GOvxUouAI/iSUf52rUG7Q0W/y6AO1r+iSC93n+cvcoQ
         gcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524658; x=1795129458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08MDudRooDplOYZuxvUS0XwmDlBnmweFEYBeZu/K8vU=;
        b=hA67F88pYZsFBATccdgBQ6UI89it0SN+Y29nq7WH2V9eJoapZuPb4f69YR//AXT5hu
         PihQgaiMNtvAALECGVTpB0CeAgVQ3aSCeI6PAYmcYkjToaAMBmZLUK0kaaz6MU0RkuBn
         OT0DBa77LkgTKnypzEhRIifZNRvjg6HAYfkUnYJI6MHglGF2W4iv61jVwYvK1mz4fHlO
         Zh2vc9Fb5DbIHlbijIJM96gno9xC/RKyuVY1HmHMjndhLZLHuSz1C1WdatRgm5VwZAdo
         C4z3HODmqkPSfKej0Wj1vKAK3De95BnEF3fT4c0QS7Z2yk+sNyx+B1GFK+pQMuTb3wGk
         Ydcg==
X-Forwarded-Encrypted: i=1; AL+hErF1+L3vuzIeRpk/6WSdG50SJp/LFHHcTQ19fzst5Zi3Fp7MrggwGbdF/7ClOCTSyABMNGkiLmIyAi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k4q5stTK0Yj0R1GsSE+b40myosDH0Za6LWweeGZz818m88z0f
	LfFJrZxVkUe3hhQ+CdvzR4CYTOu6zg0qcTQ0fA09ibd0+pBwXyuJ3GPgegWrYLZXbqkqPGxU1KA
	AFnLoEGgcKAL2hQ8RhjpGEIfx/IAphavsscamLsWRjQ/3DCMk6TKE4K7XSw==
X-Gm-Gg: AYBFou0DqNkYZI2rA9GjC3Qzts2S7FgGp9jnA+F/EcKJ+ZhxZ+MkWSMikeYZG2KXKvr
	2zudf2PxVLUTMt7qaJfBH05Hs8DbvK6pmZeOfHqAluAsBxQQzKrBStvnswtpxkE9d7N1Tmv0gKS
	axxEk1XwaW+JHdUowLTdvDLp6e1yXBh0bRX6TrJhlCeH3OIfAnyleD42A7GHh8SRDFGXRlKgSrk
	P6lmbKVC4AGUKM13CGEjWXIMKFouPtnFTvTIxoa4+maKJll8m26y9BKORSLdT4K4H6gh7T7O/cX
	CqJWQEog+QmT5hyYgmC3l4vDUi8jmImXKrQWAS2va49wHZLTIlPmFZJoU1MKFsbLS6AUlGm+Pt3
	plByZ9NKBB351A2CasMXlaeDy3zttdfcup9ZnTIJmL2J5CeYJER1TmBLfb30QO6sYCSbPnA683l
	hKFjXx1lwvqSWgeXdWyUU+ch48evZCISjRh91nn0JB+XVL/XJYl294Blqq3IlNLMHxYliX4Wztk
	bjgwH57pPDbCkPTqInw0mOwYVtCNZfBhSt7MHcL5RMC7GM=
X-Received: by 2002:a05:6122:6849:20b0:5ed:c029:411d with SMTP id
 71dfb90a1353d-5ee274efedcmr1175996e0c.19.1794524658165; Thu, 12 Nov 2026
 15:04:18 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104183442.617519-1-rjethwani@purestorage.com> <20261110131222.7e228d44@kernel.org>
In-Reply-To: <20261110131222.7e228d44@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Thu, 12 Nov 2026 15:04:06 -0800
X-Gm-Features: AclHuK9qUUhccz7x5a5PPsAmZt6NNNYClixwKS7-w6C5DGK3uR7rry1APfVSnPE
Message-ID: <CAKaoeS0KoGs9mZZZngwh97+8VgphrRxnHdGr-XmKUzmVp4AK6w@mail.gmail.com>
Subject: Re: [PATCH net v6] kcm: reject attaching sockets with a ULP, and TLS
 on KCM sockets
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, syzbot@syzkaller.appspotmail.com, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Hannes Reinecke <hare@suse.de>, Sagi Grimberg <sagi@grimberg.me>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:12=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed,  4 Nov 2026 11:34:42 -0700 Rishikesh Jethwani wrote:
> > Holding a ULP also has visible side effects: getsockopt(TCP_ULP)
>
> This part does not feel right to me. It's not a real ULP yet we will
> start announcing it via all the ULP uAPI.
>
> If you repost please try to trim the commit message and the
> documentation slop.

Agreed. I'll replace the dummy ULP with a bool in struct tcp_sock
under IS_ENABLED(CONFIG_AF_KCM).
KCM sets it on attach and clears it on detach; tls_init() checks it
under the same socket lock.
KCM still rejects an existing ULP, without appearing in the ULP UAPI.

I'll also trim the commit message and documentation.

> --
> pw-bot: cr
