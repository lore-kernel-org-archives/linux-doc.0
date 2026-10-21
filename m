Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792615085;
	b=J6soCYj3bdfrkhm6/7wILDYUFC9mJp9YYZIR01MZwkWS3duVqfiZa0yd8w0wr9eXcEVx
	 cDkjz/g59mIGkDYwhjWLtlaYQe2kXgMgEXWjuyVcJDWpbpItbM7YBNk2wsr3HOcwE9UZD
	 nvFb1+NiReA8VM9rUkgYekq7MTxtCnIULuHCekK5c9N/d8FWy8EAF/GgshSGa2utvL025
	 W1pDr86529HaVv1Z084Lct+PXj3Ww2FsLmLfCnFh1M8lTDchKgbXnUzYlV8HgEOqYNoKx
	 kOhhYYwYiKfER1fEP6EuBeezmHtk9io/9l1E9fDPteNSHqNZngReGquARQnYwl8vWKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sm/ucVIs/IML1ifexi9A6kIUGzt7C9TWX0mG8agamnA=;
	b=BSfsR/5FZzlIMX0cqpoxPRJepJCxxK6L4FKN+Y+WRDFT6oJYiOeQaDdW3rPhBbH79Z0Q
	 iYp6G8VIG6h7X+u6XPozPZh3VCNLLg8j834t7vciKS52Q4/bpYhkXpaQsapZd3rhiFrmO
	 LXGL5TME4WTaRjIhBrx8O68tcoAZ4r4eiv2viFuGGK7FpKDIt74zXUPyfbw7a4qAOg7L0
	 +Wj4jHmHiMfMNZAalV65rdFEHwIkCZp7d23a1AMVsHYZZUj6y7vLBmEWQ4KaUFhpRbcE7
	 b8UFTw25AQWLpJUrx/h8/07R7hFpj3LrTZXGKcBeeSo/QgzY5gvzy5vkS1NsyrsanwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=P9B7WV3t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB2606A326
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 20:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18AB2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=P9B7WV3t
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso788974e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 13:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792615084; cv=none;
        d=google.com; s=arc-20260327;
        b=gKN5S9iu7kqD1iYaawjyXhSwubOi5pxxp4M6U3PIsfrr4tj79YWECKXVKAO1+Ci4Md
         i/niMWR68ZrA7JofYZ5FKAFEpjomHRBi16qfPouwwir3qPtNdpEM8JhufmgxYeDUhPBv
         PJC/94CBd0XLLYdH+J7R/OCeGeCRmitephzuYgeFZS0MsAlEeD6kqOwPsJNTyLmlTtKf
         tVIBOxyqfViwYKopdiUjzBZSADqA3bnORYbwQ/m95ZJPrPjHnlcKUR7GQ7lGSyeveONv
         yhgQHR/ySQmUKQdt4oj7akv362Zzrf5kWYwy/L/2+OM6bnuvc1453b8XVFRsSzaARvz2
         kLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sm/ucVIs/IML1ifexi9A6kIUGzt7C9TWX0mG8agamnA=;
        fh=KCWAmzkRwOxKR6e4igAZoqs2jJrUxl8slAhZM03DTFc=;
        b=lUVOIA8hzhghoXjFCGgb6k5JifHMa85bMkeDZQMKkEPQ099mTgOS51ro/f/h8kbdgB
         IbCIZv0CCrQv/GRGTaoEcTdk20jcBvzvHiKAjA/6yyug/cewR/QOGjTuMvPPkbwdovB9
         2GIiTm17ohBmmd/DKHr72plScEbTklkmYkVzVhQnIjB6pyNSIDuTBCc99RaCt/G3glSZ
         xGvsk4XosWzv1JaRmyedAg9wzAk37KC/NecH8waRTpoKNS8EogcfMO6zE3vuZKcNfP3a
         DhDZmfig2Ss483zuxmtKCs+XUtP0CpzH4M5dbgya23vRAj8G6QanFWjNCAF+kxXl5q1l
         Bl7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1792615084; x=1793219884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sm/ucVIs/IML1ifexi9A6kIUGzt7C9TWX0mG8agamnA=;
        b=P9B7WV3tW+qvrq5niXivgO31cu4Owz6HdP3qvP+Iwr/St9Zhpihd1UVKv+q2HbFj1o
         2KWmaSXK0QaAHoNdAwIIRsPz4An2G9/nDSg2IlVf5cQZAmw7TfFudNyeJNrf6CtXqC7B
         Kr0JszlArIOVBLh844PiJshSg6I+azbo6+0CuT9pAbeb6+KWyCsGhbAhGhXRi3AiGtYZ
         bQzc5pHMLExJ6B4wz+rEIoOOdAmR15HAlt+ng57ZsbQPn1iNOX5QlzfOIYJwhR+v0ojU
         7sGH1pIpj1N+7+iJhZOY+cwnIDbFU/ImANQcJyfrv5tfuEQJ6KOHc7LithudHDZayozG
         7AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615084; x=1793219884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sm/ucVIs/IML1ifexi9A6kIUGzt7C9TWX0mG8agamnA=;
        b=X7pvIDlh8xBemBT3IdhBlQs9tvE/YUYpbgOSO0ae6RmXrj9rkNqgwR6hfIlaQttmD1
         dLFKN6qOdC1Jv2VDGBRDu9WeKyJmGQF3FbEyuWmCqBQDPuTn1+9iGPaabEwBD4nW8MVT
         84E0rlo8EK6tmWm3PidtvJbQQDk4gSlWOH5rVr91IXCJlTXP5Iv6DYzmOFKH/wE24k4N
         GhqvOZOToSTYWvpDGU50HXVO5GZNiyF1gr1uXFM5W+eBfHIFfDdYxbI2MHfL2VCG12TG
         zkx/sIuoUdEed6rxk7qnRooxoytU4niI7YLgyVWBh1NUw6GslAaJmrEVsSHJncvht01v
         cvmg==
X-Forwarded-Encrypted: i=1; AKwUvBz+wvaKh6kB+CLgDXBBc9gnvc1+QfbqcaSQvMavtI1RgyjSuvHVAa54DbTvcKFQd8lNOQ1x6F5sVtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQM0JJzHqoPMPMaxzsmj6rEkcjGXiq0EoFydTgONWdaoJme92Y
	nGEqfKI5063WukZASJjbZda2Ep8bGugo2xgM1iqBtkMIHz0wQDb1vLn7VWSV0dnWYVImA4ZLi7q
	yTnNoup1uhN1s0RCQN/pkWSck9bCXReet4mjbbH9zsQ==
X-Gm-Gg: AYBFou1G3kmY8R4VbIGoW9IXeabUytGO1E8NxbcSZRZeZwg7qNd0tbkPsn06gOKMeWQ
	0/q6sqIViB86w4Vg3/yVM0GH5ptwqI5idafIq6AIgE5xGoujubNNwWVi45fcoSmOAdTEUHFo1qz
	dmMOQ4V+rJnfq0PR1yb8whnDAQWRhkj/6ABv1Xn7jgq7B2GqGoLf9oR5zlmOVz+/DoVbBqrkPAg
	dFusXymmcx8hmJ2EUu7OZ5ffcCZtsnap9U2oxIkaZQlrTDEQpt5qP+j7B6H517qUE3mlDStA/cW
	IHJoW3zgwpd5kpcraEWu2BuuhDfUAGs0oTLZaNDTiQ7+aIOZ33JTCGsl/yQ0GS2+ay0Nq5Hx5K9
	CFkvEP5V0joAc2rOEUV0NpEP5KTS4px8DwQeT/Xcn89uvezw3wLG+y80+O0YPszVwpMclEImisb
	CEWnF0fNFVt9dRyQC62cH2RZjekQFyVHaDNqAgdtqMcpKK1v1COOVlfk7noNVXDf57C8DXSDVFr
	dJX152dPbfs+Ai+zgZ4KA3sCQ==
X-Received: by 2002:a05:6102:850f:20b0:7cc:3eb0:6ea0 with SMTP id
 ada2fe7eead31-7cc93ac38e4mr702006137.22.1792615083930; Wed, 21 Oct 2026
 13:38:03 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020214500.972308-1-rjethwani@purestorage.com> <179253294887.3290.487147499123330924@kernel.org>
In-Reply-To: <179253294887.3290.487147499123330924@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Wed, 21 Oct 2026 13:37:52 -0700
X-Gm-Features: AclHuK-ZhRkgIdv5yYGGMnFPJ0d_TUAMLJF9EVSU41qM5LLHoLsovdDN6fqrV4g
Message-ID: <CAKaoeS3iWOm6Oy7V9VZChyQuOBYB33EzbQLgt50E3jj-tMzCbQ@mail.gmail.com>
Subject: Re: [PATCH net v2] tls: keep TX and RX hardware offload on the same device
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Boris Pismenny <borisp@mellanox.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:49=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

This issue was discovered during code review and subsequently
reproduced on hardware using mlx5 and TLS 1.2 AES-GCM-128.

Changing the route between TX and RX setup installed the second
direction on a different device. Driver traces showed successful adds
on both devices, but both deletes at socket close targeted the first
device, leaving an orphaned context on the second. Both setup orders
reproduced the leak, even though all current core TLS context counters
returned to zero. No crash was observed.

With the fix, the same tests correctly fall back to software for the
second direction and leave no orphaned hardware context.
