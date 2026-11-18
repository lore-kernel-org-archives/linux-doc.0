Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795027156;
	b=HQa11dlddbWMyzIU1XRgvS/naR3bzVRJsqeTsfT/WvBv/NXMTtdVSygv2nV9r10zRJ24
	 TTN+w/XCVnR4Gl7kxvs/33c4apLk6XP0yiJq34dVhpHKaw/vJX3dG1unSUOCx12v8cu80
	 ysHeCJ0f8cBMH7j3Xa2Oeq5lknavjSIo+hSbtCON0jomB4HL91rRUYXu1uuJbHq6gvmzP
	 8KZvHtnqmJwqr5lj1HvJUpgQNLtDvX52DO3ZVdHFihUtRHlpgm/5WOIc7ZUnRh70BjWJb
	 INah90lCAu78RaUnCZ3GPYwrNSXL9FJUMIMyQJIsk2ImTGjJ2C8oUyuCpQOKiD1zeUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
	b=ap+lGkpgTBeNbakCVXKKcGKPE7cUMfGZwXV+Ft7zH693HsqlWSivyoZAuBnUYecM8iq2
	 73CsCYtOv3MDwXSYqztCGZVW/62hzgVT7XqzBiDpN0YxmXXYulnUPOOFMRLva+4vgxUwT
	 bUiYWTyLLs9+bOeoxoQSQqkEYLGNQ4EgkJql4hXBN7oczxjnu2cy7mVfqWPfQpulvsAU9
	 3lqSlhipEvKZkhl27lRBsZ9CSgzEXpdGH64FDw3qE8hf3Il/6y76ji9kzV2tjBtcPiMRE
	 olyIZ2aKTKlt+wkOUO5/QplXADmq0//Vu1gIF4VWt+1Kj57GdKA5kkCzUqHtBRcrlhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaEvO25;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DF2606A325
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 18:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DF2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZAaEvO25
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-194d0c31715so928c88.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 10:39:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795027155; cv=none;
        d=google.com; s=arc-20260327;
        b=knSWXjI5fFIIo8+HC0/iNjsS/gkjfonmTp+HlkIDnUQvnd/e6LH+Uc3x6SgmGbabza
         +ZjxVjF/RSJcbBXCXiTwbYKMBuD6UTBT0BntzNCvKgzDsd7mQdffW/jdXPQD/Yf8Y9Ha
         +A/FpAvYjTdLz8BHrXkuQ6sD7AItV2WQ37j6w+SHYRBsEy7o7NdZt9LW6ZXKGFuUgi7G
         xFnCXmFviPv2QqXeEhjzb6pcU6I9YXZcbMtm5qMpl0MSbA9LWDW5yW8oBsaB9SBHQG5z
         xJMzwEfmsb6jsVvgVRBeLNegzx3lLp7+7yEa4LlUJPBt679Rd8BkL53CVhAszZV5u6Uy
         rpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        fh=B9Nhxr4OgVY6iDBSJjjYVdKVyF7ur3giTP6bvsHLSVk=;
        b=c0NcCOViVMuf5jAbE/L0H9n/xhsREyhyhpIxdcihX6WuN41O7ZPA/J673McL92U4wb
         qxUSd/IWhfyJL/2W/+LuMmP99O1ZtYYkQjQeWjSJgbusl7Ig3JF0tEW4KiilGvegfX1q
         HSGgQcWDUikbO4S0RN/pfWiEzQ50r15R8O01RIKXcsqRVZ27cisqClqIo69U50pQHXdV
         e41cXbF9tTVVjLtpw/VSz/L40xwOZfhQSv6Q7EV84vDmBGkmtzsjZGJsaHHfqPzhqdqw
         yiZpJ2VQXLH4R0mT3+G6O0FWq9sxYKptVsmRP41Ndz0SYov68iJ6R5eZ6Idb7hnwlFn/
         e+Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795027155; x=1795631955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        b=ZAaEvO25CR3taVZcmnXF68wjTJix97rTrAGQ68xEM0GZSJjDB9dTmNdrvjcsjM5DAx
         MrRb8zbkzIWx50PjRSz6yorIDv8ibAviTnCQVVMSFzRQKVfZDiU6XyQs5w4HPAs5tqzD
         BsgtAY1SsuWj6nr/2cFRjkySkht8K0EsTj4DWsoLRj1zxwUM6IWMeKjUq982hpNC3ZCr
         n50I+m3FYF/WfSGc04kSTIoD5lGEfobfZQ7rtJZe77/acKLaeQOrTfCWkvAi/480aW/m
         P5BBg38eh0luesS4uP/AuaPUW5Iqh2v7QaTFsq7xfoAid8Nn8HgUQTCNX+xUS9WiQBDn
         UYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027155; x=1795631955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOk5XMLKV41q7GLzoLXIV7TkndqjJrVZPK5114ekmS8=;
        b=x2/+flHHvs3mBfhQJfMM1cwekUcZHtj+MwPfc0xIt0Vm0OIpxcp+oOpYgYJj4eIh5e
         973IxDa1sNC0JD8RDMUk+4vPQ+w7JyXmPyioFYLf3YCHNaFgKqAUZllBp1wjkwmcSvMu
         qW4Di9+oHiKNR/Zgyq3ywXm/tUyuCMPoUiMYk+OkxB8ipM7w7c7vPDtqUjmmxVfZLRet
         hWyFKHsGxtrHbSO9tnDsJQZ5nFKkOCR+NLHA/cd4NZTgEloubloAvVGCavdroT3Ls2bT
         8+4LlQ9dk+QPdkkK3hlAbowU+wWg98aggPZWAJYiOSubc7Mozzg5h3CFDwuNWMKtDpKm
         3XQg==
X-Forwarded-Encrypted: i=1; AL+hErHWfIfK/ZC2deVGyvdqQakpl3Q6LB8JWAYNH16MyiXWhukMc7bI9GwGQqRmJ/iVHws05sHp5MZmkGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XfG0avUVpglQfE8869ki8s0IQ0Lmi64Sm3o6+hSqENhRSicEO
	3GMC1dNolXF86EcS7pwEhC6WfKehflYNUjhL1XU1icSFsmecalmlK1iXoWubRY/8UiKGxGDWXiu
	UMZj/j0M/KnBdI+9sv4uVShuLH6uop//G0aPgFQHE
X-Gm-Gg: AYBFou3oDAqYMJzbQPiOAqR+cY2P5sgB7uNIE0bOyqvu3SNHvBxyMv3Qm0Py/4Ibs+1
	j94S+u4JmAKhChBhetvBQAix1iD926KSRMUd1bcyQqxtMxpOfbltrNwf/c6SYuB6J8FYEf4k9hj
	0/PsOGS4AajM3WVUA7wndD+H9X/jrdzTQcS5EGdwweGdLcxlCH19VvwKVSFaka6dV5rsaJFjNVI
	X8hJYEePyVvHQi9lJqW5fDnEBQpbcFHPHUeoFQ/Hy79VM2DCswaNKXHhxzew8HrVPcnwJZHn6GQ
	0Zvuq1vn5OQRgPdb9XF44fcfOVHCD2APwN6CJAIDGRziwGKqGLszJbh5VA64m5HihTK47INZdLX
	GJbvaHbHoBpzdolbaq8OWuBoDX3sS+Xb+IIFugg==
X-Received: by 2002:a05:701b:2903:b0:133:12e0:aab7 with SMTP id
 a92af1059eb24-1b54d350911mr22039c88.11.1795027154537; Wed, 18 Nov 2026
 10:39:14 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-2-bjorn@kernel.org>
 <20261115131314.2d3ab96f@kernel.org> <87wlqcg85c.fsf@all.your.base.are.belong.to.us>
 <20261117163258.446a0c45@kernel.org>
In-Reply-To: <20261117163258.446a0c45@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 18 Nov 2026 10:39:00 -0800
X-Gm-Features: AclHuK8UJH3E_Epp2jjC1wv6_uDQD4oZqE2pXj-5wMybSCyzlV0cK1dXGLNdYt8
Message-ID: <CAHS8izNe7w5gcTrVW_gMue0-2HBbRkTpiqtUUcRGHZnPwiLp4g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 01/11] net: Get skb fragment addresses through netmem
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:33=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 16 Nov 2026 15:31:27 +0100 Bj=C3=B6rn T=C3=B6pel wrote:
> > > IIRC netmem is supposed to be used for frags and memory CPU never nee=
ds
> > > to access.
> >
> > netmem covers pages too, and netmem.rst already allows readable net_iov=
s
> > ("Decouple net_iov from unreadability"); the in-tree ones just happen t=
o
> > be unreadable.
>
> Ugh, slop got in :/ I really don't think "the in-tree ones just happen
> to be unreadable." I seem to recall being involved in that design.

Oh, that was an intentional, I didn't think there was any reason
readable net_iovs couldn't exist in the future. Actually even dmabuf
net_iovs can be made readable sometimes, as some dmabufs support
dma_buf_vmap, and in theory the net_iov could hold a virtual address
derived from the return value of dma_buf_vmap that the kernel can
access.

Do you think there is a reason net_iovs can never be extended to
readable memory?

Do you want that point from netmem.rst reverted?

--=20
Thanks,
Mina
