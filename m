Received: from smtp1.cs.Stanford.EDU (smtp1.cs.stanford.edu [171.64.64.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73C4D9911
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 20:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=171.64.64.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504955; cv=none; b=u0i0vVUxUVBGd7gc5/5xo+0KErsSWXnRlwu/ZzX+0VLrY5ze32VhOBdj2Z+CrqQS3zVT+EXAt4B33LKdZnMYnpVzFa1y7fgblgBAs2vNwzn/mt1Fapbvzmm2yeG8LJRQcoRwH2hg2HIsgHTGM05+JpAI7CFfNPgeCRgXDijn5F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504955; c=relaxed/simple;
	bh=u7FDXWmnNDm49g7TPgHmEvv/bk6vlPCVL5GgQXLAVUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jH4slG2vbInkVyzj4bZJbQetmhzXFcE/nInpmrGLg6uBo4Z2/Xgsaa9R74BLC08ueFqtq+YXE74VvaYN/BAK3jus8YP/qlwQfs+7N5YzAYGtL542J9g9yxMWmxa9W+x+3mXiIFHbkAU8fBlXcTUhcyyZkzV6bHQAP90O7TawlpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.stanford.edu; spf=pass smtp.mailfrom=cs.stanford.edu; dkim=pass (2048-bit key) header.d=cs.stanford.edu header.i=@cs.stanford.edu header.b=r/QQ5Vnp; arc=none smtp.client-ip=171.64.64.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.stanford.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.stanford.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.stanford.edu header.i=@cs.stanford.edu header.b="r/QQ5Vnp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cs.stanford.edu; s=cs2308; h=Content-Transfer-Encoding:Content-Type:Cc:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Pj8eddDYSCvJtz7Uw4MAcyZwqXmAJ5FKe6DPoEprKSI=; t=1789504953; x=1790368953; 
	b=r/QQ5Vnp7/tfaOW1SX2TnrIe+X0B2ZsNzSuW6PAPtOxE7CgAS4qjqiXvXG+PmOGnCZEknq15BYn
	Pur2PL9Ge6vUh5ziNNEecjxjd6/NUOaMED7RaXf60HqECkbVNVPTfDQiYwzGWzr8VS+d7mpHCRSGp
	gvqKinKwFsbfX4zELaEHjDsy1qtMrD+ZIXeJHxoSw8H1ZoDQrlPgUdHjIorrYdlIGIK6SJwAEj8/9
	vQ7wv2LPReeAU7SVeEprTEdhDOYWMPs9dpvRfMnTR8GdEr7RHRj8kJVT7Y38h/zXy63xXvw/qXPUG
	gZlV3cLlah/otcoCxFVtrcjtbnoEM1Hrigkg==;
Received: from mail-yx2-f43.google.com ([74.125.224.171]:33311)
	by smtp1.cs.Stanford.EDU with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <ouster@cs.stanford.edu>)
	id 1x6Zz3-00016q-Qs
	for linux-doc@vger.kernel.org; Tue, 15 Sep 2026 13:42:31 -0700
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66f7f72a284so267974d50.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 13:42:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjiVPd1iBywtUC260iM2uq6vIrNE/6JJ0yDXhshJg7gNXWw/j0DzImaoBo58ppVN6DIzAeMekCR4o=@vger.kernel.org
X-Gm-Message-State: AFuF++kt+5bhpVYqK4wD1TWvx8Ktjf06GaF33ZCXQPWdLOaEVuRNVWTi
	g55EYa5j7o6MpLUYAesMoCAUWHzwB9JjBwY6JN163j1ViH1fBmKVJf51Hgs9qpFJlge8ds3y3iM
	d63i3az1RNcTreUBmQYoOxDvCKvGpE84=
X-Received: by 2002:a05:690e:bcf:b0:670:f743:6eb6 with SMTP id
 956f58d0204a3-671632908b7mr65549d50.51.1789504949147; Tue, 15 Sep 2026
 13:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914230517.1190-1-ouster@cs.stanford.edu> <0b3aa22e-8939-489c-a3dd-c7f9552714d7@infradead.org>
In-Reply-To: <0b3aa22e-8939-489c-a3dd-c7f9552714d7@infradead.org>
From: John Ousterhout <ouster@cs.stanford.edu>
Date: Tue, 15 Sep 2026 13:41:53 -0700
X-Gmail-Original-Message-ID: <CAGXJAmzj2KgJ+G5LU_t5XOU5a1t0D9WnGxVi_Wh64=XBwy2Q5A@mail.gmail.com>
X-Gm-Features: AcwNN1W9wZds5d_F9sMlHMUJvdKbr-fWWhDJVfzeKQXflDMQezvVz_O5mepmVGE
Message-ID: <CAGXJAmzj2KgJ+G5LU_t5XOU5a1t0D9WnGxVi_Wh64=XBwy2Q5A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 00/15] Begin upstreaming Homa transport protocol
To: Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, skhan@linuxfoundation.org, 
	bagasdotme@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0
X-Scan-Signature: b65b8f26ca423de213f14dca1c6ea011

On Mon, Sep 14, 2026 at 4:35=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> In a (mostly) x86_64 defconfig, where CONFIG_MEMCG is not set:
>
> ../net/homa/homa_rpc.c: In function =E2=80=98homa_rpc_alloc_server=E2=80=
=99:
> ../net/homa/homa_rpc.c:133:22: error: =E2=80=98struct sock=E2=80=99 has n=
o member named =E2=80=98sk_memcg=E2=80=99
>   133 |         if (hsk->sock.sk_memcg) {
>       |                      ^
> ../net/homa/homa_rpc.c:134:68: error: =E2=80=98struct sock=E2=80=99 has n=
o member named =E2=80=98sk_memcg=E2=80=99
>   134 |                 struct mem_cgroup *old =3D set_active_memcg(hsk->=
sock.sk_memcg);
>       |

Oops, I will conditionalize this code properly. Thanks for reporting.

-John-
