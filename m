Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793712982;
	b=a4s4TAgjklTkLU/ZLqUXsQ2hwgO9HMdZothCcatBAsndr446ZQqDZ9N81MaDUFsvr6sz
	 Nr+1EaGH0l4NWI9Zl7VIppmFypCkku1mHzQBd80pPiiOUjSQmOoQcYJpibAXz4Uf+8DPw
	 pDEIGZvqPgzZVDpNjEGzh9aagEH1vEvJOABqJvdRC2IRaEsw44mn7b64OPChTMb0ERSYk
	 WXqkeVILj3ZUh0nGc1B0p5+jOa7qFOnFz4sh5NANvoGPfX7zqb4zhQyiJlf0OrAob9xNV
	 bbxU5/VA6tt8JyjnLSTUluYuvY3Z8i8Z4SEgVkhoUrQltbz9xq/eOaAsWuFi9Asfx3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
	b=VrK8i6jYnuhQkYflC2lNkmZBsKXDQYDcLPmTpJ8/Oq2yQBhL25R8ElwE7SvG1e70LFCh
	 KtmurykrCuuRkSsnBAoWLsNqfi5f3L0Ng/I/TcQyjtA2vFLh6gz49TEicGt+ODDzhFbFB
	 jEQ6R9Sm2qG5PSH/Rajsp7/8sDdDGnYUGNAujzmS+NufgL7rk331sELHuWRAjKabKfF6c
	 gGK0c/CsnS5ycV26IvTlR/SFz8yaPcoAr/bY2MoYYMf1FvohzIv/efpd0fMfyLnfk3Euh
	 ds5OQCOmtbw4mYyJmLfR7kwKgCsbOCM7MRXdJXMPryqzoOePFAjHfIVVB/0y73cnA+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTiqMTLG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF59606A330
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 13:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF59606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mTiqMTLG
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c162febb9so48662236d6.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 05:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793712980; cv=none;
        d=google.com; s=arc-20260327;
        b=rTT3KTJZPGbM+d0LNsSTCS/1UvPU7ZWoWUrCsw+jpDMAbL53fhjlnW+f6noAkuCj3h
         Ay0EC5ZsZisRXkrE4HQzizzKkYVii2bvXVbF4ttw0wP1DkxEFxnehVZSabkTFqCB2TJW
         hjS9CgrXDBPaiGUGFRyk+hhmzzOg9fCce2MJcC+AMa+jE3X2l89M7ICcWJWiyazVAjYX
         jbUdInimXJA/yePqz+WClm0WHwCZlkstvMR9ErfmbOc7ZrzCtoXSllsZ2UVqwkMxkA10
         xfVd3BjESEXVuq+y6fmcUIKuOmnIgSGdd9jOGvvBKC+mTi27wd1WSffRrcaR2M5jrFfR
         bPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        fh=vBdxiDmn9alPwPRglZV7F+59IY9VLF60dufalr8YLb8=;
        b=de99Ysjzp2iaucQ6EmFOjBE65QI57woximJfUSvCJRLDi1KWXp9awDC6bqGTc3o996
         Vp6o89f2qmaihcY9e0swGQqyy0Y6vSUr0VFiBIZv4H7rAmwz4zoeihOkV7nRr/Is7zX5
         +iiP5KATXFtciVJ5ppAXV3DQL6IBdJVE4OUPZwaSRqkNpxUOe5dWurayvtq5MX10gGPH
         /Xvu64CxQJL+gvkcZMsN8zB6FHSTkt8r/JhR6hIWY1+qWxyCQfEpIXNuM4nV5W8gHc5B
         6L/OwlPVeJX/2dGlE82z4ROpZCLyGgv06JGsrBRWOenc63j0yFPuXdTEJBRil+o2uSBz
         JYUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712980; x=1794317780; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        b=mTiqMTLGajkWWb+Lh90vdyb22P9zGDoS9RIl2x3eEIc2oxpQiO23S4a/09qDHuRwJC
         juy2fNpkC6uqd0BnNYrLeFxirqbBRZ1Cvg4xk7zZw8vE/ESCCvJWA5f0qD5MytDxiCJS
         I34jlBPhNYRlCzz2V+Ua5UenSvr+w5JBxV809qOwXk2X+WivVoF5Kamf/LdkNCOoCzza
         C+TmmByNYKrqCeEIhKRYZGnPi0SLgcEmFRYzQjh5u8BXM33aN3e9aV9vEuBgILrOIRlV
         8mjGwfpWBiuOaCKIRlbkjVhhuokuQb07aIiBqr8XaU3bAEpt8gJhjxIRpbitlHFFQVM5
         WRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712980; x=1794317780;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ikJEpPagqLDcSvl56L4kMDPutR5qorTqhJ9vg9tYiGk=;
        b=BQH7QVgPL4pxQ2gUkroBGdViURMdUMSLsfs99jJEERL2outaZz0dyIzlJ7koSuCrz9
         Pu9I0Cri3KqqnrQWqfTa5iN9T5OQRbDsmjppaJKRemIp4mrVr+FXLqnTD/jwhR6fvA2N
         JeOdU3Wqp0Y/WX8ZtrlgBjwPoMIKFqSsQply3yiYsxKjhaMHEjhdsFwdGUnC6w3w6IxX
         abIrXXgba0iv5YU7IA/iTQfCSQqg7dSmYBfgBSD9mabRbnRoq3t0hmgFxcrAXftVkFf8
         gaoXkDaDDQV1DTR4jdjd5+b4viShNcnq8e6M6C9Okp/AnvRhdk0k7KQlQHLvXyBP2Xyl
         Hgxw==
X-Forwarded-Encrypted: i=1; AKwUvByuZpzsHslkUKy7w/OWPFzTXrzBfVscslH9rV4/l4w95P3bUtrQD7IKkh7YlApMOTe0wMf4p2IOXuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nLrg2OPzP+E/VLmXwMPTq9G9QMoyyGmdJNAj2kf+OTZWal8gG
	6pD+ycj7g7/RFnOkU2qXDgKrH2pFBmPx76ttkTisuwg56eZe1IO01QvcXOp2LDxyjBucb6pVCYJ
	yGzNWne0APwoP0SZqS/iRlWhjQDP/xwY=
X-Gm-Gg: AYBFou1hoiPNATqbDM4hhJv5qc1H1S4tlAdmUQ/LS+KB/6Y2W9cg8X/Lh70O/Xy+Xz5
	I3U2qGboYL/JEf0Sas6AnRqiZ3V+kAKR6bYBNVuFXVbUz0MSXMuhyKGcpz6fA9Ba9zIjf73lVQe
	8APtq2WTOva875nw7go3uqDDg+cLqeA5sJcJOiNkuWgVfU3FrF6ne6CfbKsMXPzwcz1Pz2WtxIM
	BOlbGoZRctPFC8bz1NYs2V5FlSahjnVq0AeG0CUPfE8mv5oQHQx2QbhTq2IHZnTLjUgwMPsrQid
	HwsDOPPK/+e7Ekth7waTHbf5ImitEDDH41A3ZE7gXVg5OKb8/9cyzrzWXMd/lZNxw3tIag8WZLt
	qFD8Zjbv30OZZiWlnB7bmyYMWiuSGdQ7F4GENIwP6iE7cLHTzt2Hq/rv4JbOhVaLnAadlkd5kOk
	hi/DrQg4xkuthfM3wtyLRMUCU5fggpA/mnyqZObu00Qn8xUxHt1JyC9P+0JhCkuQZFgGx0JxPiG
	AZxi2o+J3ohEy6z32mnOEQ=
X-Received: by 2002:a05:6214:2249:b0:91b:5d3a:f135 with SMTP id
 6a1803df08f44-91ca4b7fa7emr216830276d6.52.1793712980412; Tue, 03 Nov 2026
 05:36:20 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
In-Reply-To: <20261029180900.2912240-2-manuelebnerli@mailbox.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 10:36:09 -0300
X-Gm-Features: AclHuK-5QE5RUaf-W6zbQ7a-8WdeKO-KxqeRSBAxVd9f-wJkyCdpMx_t9-dgL3E
Message-ID: <CAMAsx6dX8rWtX=uCqpz+LR9NDScWYLQvopDHTs_0MRVu=1qBtg@mail.gmail.com>
Subject: Re: [PATCH] docs: changes.rst: Remove obsolete link
To: manuelebnerli@mailbox.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	unixbhaskar@gmail.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 29, 2026 03:09 PM, Manuel Ebner <manuelebnerli@mailbox.org> wrote:
> OProfile has been discontinued as of commit 24880bef417f ("oprofile-removal")


Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
