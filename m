Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792671545;
	b=1kYBzXNAtVBVJizSv0i8W8sgqFNPCuRtyfRAEksuCkb7WI9QbR68CgDcTC9rRkQ8+QAI
	 Dmi5eKlExxllVIQpvxu1v4N1K2SWZwI8m8zM9u9oZUaSIsKzdJkU60dq0dMVSKUquqgtx
	 fzYCvy8vbGVP2cweIdR3PW1R+10Szjz8zQ1smEB44z+KkdKDzf4klSpHY1TO9kb52/Osg
	 U6Q7ltf5ZMi41OlfVE3XPWcVgIOwT/xoNs2cK7ZaKhcglN9Yk79T3VcYWsewG4jx7DQKN
	 84Ab2+8+5ex73FkCCqpfQXTIgyU1OXtSCdbeON7glWgj34QgA43x39D9NgxwKjVtRsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O7MzFnbIsObJkz1l1H1RrtjwBzWrndW2u4bvc7jCYf8=;
	b=HJhkOtmqlj3WITzgGtxVNcjhI1+Qd8mqiT7Eflf0mJS7KZZPjI+t25ffM7Nuq/7nYZJ9
	 NeMzpUCWzHQIBgnpGvVr3EOiiCZ+L8wYE6pxgjFffWjWwdLbo8KXOlAZEvffSSPE8KV1L
	 3/MA+AYu/rX9KZiC3XumzShWf1QFTUZcRldIBe0v2ew0C6MfdB3TkclTYtAvCh+owI1+N
	 QgJYauiEBIPbXJ5YPLz7B2S4F/5N0dlrDPDgzarqTn+aN5WwTMKDI6w5CpxxNoz9z8Qud
	 dTZah6qBrD1s5xrcyoN8u1jumxi9fQY5xBEb/O+eWTq0UK8/EaGK52oUM3R5RgqNstA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20251104.gappssmtp.com header.i=@armoriq-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=YLUPMQVJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BB5606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00BB5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=armoriq-io.20251104.gappssmtp.com header.i=@armoriq-io.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=YLUPMQVJ
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-825b40f8a26so980799a34.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792671539; cv=none;
        d=google.com; s=arc-20260327;
        b=nm1GMzwwXmqTofsNddTgy+6fkOF5aEmdkifp8UKugjKp53JvVqE4Hkp+PqLZHqm07O
         L3Xqe1rmtV/ZPaQxQvi+tLP81OK3jVV66GDFQ08I+2RSWu4dEQTSjJh4g/g+Aq3LUbSR
         TSJ4kVI+vdKMlNEqPsVgSJIPb01ZKUjkmeC9KoILM2Mn2iSYTjYXJ0JeQtNSAg/42MKr
         qw6GajMAK9H+nABkC/nb4YLrlbclQbnN/xOjy/MGm19Qnjj2u7NHyOfypfu+zZ3Y8VAh
         JDri2dBb4/HXgsu2MxCPaiYHvR7s4eDuIQWX+YYhag2OutmZvJ+GxMOUNmpuUVfwDxAL
         ThCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7MzFnbIsObJkz1l1H1RrtjwBzWrndW2u4bvc7jCYf8=;
        fh=J64SOqCo7n1EQFvyGBm3F/w1O877nmaVgzMhguZFWDg=;
        b=DwM0+qiS/f0ix8xkB43XTS1gqvDcA34fPt38Dg7KrtWeKaRNsQbK3VynHcls8+ARTO
         fwnpQ4uUrYxhgLnZfeeZp+MEFOGeTmsrc0So8NdH1gaRXUC/QjTTDVXfN+6wzGznAPff
         K6jcyH7O05QfC72x3MNtwvkPt0VrgcFXtkRBH09k6cUuq+nBVl1uHssd3FkrVvZo5039
         WIlpfmw5k9CjUHTFpYB+q9fTXC9sgzf+YfpXFFkvCmuflHkZjeH1FjiDhvmVE/8eHrJ7
         qf122pNFpmPIF+ndC+b7bFcPQVIUwDHRfY8rXAklRNVfw0yZw7/VwYMUKjsUQJVmQCXu
         b7hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20251104.gappssmtp.com; s=20251104; t=1792671539; x=1793276339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7MzFnbIsObJkz1l1H1RrtjwBzWrndW2u4bvc7jCYf8=;
        b=YLUPMQVJF8HRVC8z0/+XrEs6ev066K/XYVa52+Bkail+lf49nY6jJTtmqI88eqqqsS
         JyqLtxXkZBgpqap7OKLLgfKTDdkw7sXaj2F0wki4fj815GI8j0FU3WPvBZrpoPt010jG
         a2eKGzf31l4WZyISy7N2Q9j+tM9WRaZCyHibHUXQ7x2AV10lfY5j4oXlH6Lm0KDXNPTg
         u4ey+rSbQxYeOt+0Z8HBA+BXKpNpfApwmejs/QWWkARyoKd/k0ifAy3jIR5OPv85JDDu
         3sVPwOid7UjGYaFQBECFXSA4rQLg1L8OKtRadkaLUwkT+FuuEXmEPh3CQJ3uW1kN25Et
         daYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671539; x=1793276339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7MzFnbIsObJkz1l1H1RrtjwBzWrndW2u4bvc7jCYf8=;
        b=v/MslTnlo2Dmoyontt60MOP3g1uS5okWrnl7h8DgnInY2giwVm/wSdPTnv5UnnOiQJ
         xWUg3mE4Lb7g8mi1Clq9G2PfM4vAIY++Vpy+FjpvO3bHNy9UcL97ER+AiTGEQjIkqENN
         N4owNZovmBvSzYCH3OKPs/+ISDJ+Xeg1kXs7Fciz/dTf7f3CV35UW2nRp4uzceV1p6D+
         OyG5OWWvHNubS0HIKD+qZ9a8FYDu5oJJSQzY/bZy+09b5vmZEKMSUvpjIF5spUoDzJwY
         8d6PLbKvRPTF7Ddwx01dWwF+LmtFuEwgNKpHdXE5mnxi6nypru2ROz3UUA/YRF8GiT2p
         0e+g==
X-Forwarded-Encrypted: i=1; AKwUvBx1vXlCqA5p2ztCcH2FP7DfTBbke+/YhNBfwdlZ/ZsqI/72HcO96xDojeD3pbCNWONzWF8DYAs0fy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJi0fIOGat2kxQRxh5kNo860YS8huYgevmFqFN3J4enLXDuMiqk
	JU5ZlkpIFMPAV3mdXUdj8g9eCRQq4oCXl2O2Ab5pkmc0imJUkazu6GSEF9b3xg9fofIvwFfMXCT
	tfrgijr6K5tzAgp+I087BL7oRPDf2Rz6Q5LbK8qth+P0=
X-Gm-Gg: AYBFou2KY1hjVUG4z+UXV9UoTcbzSoGlYPjZspjAPc/F9H7HHZHJ1B564ooIY8Ux2XU
	PpGF292fDN7UF7xT67WgjY7i/jYHlZdHrp4BalDas6yao+PgpMvGDvWy0dRHileDf9Kx3G6UQg7
	TRzlOjiTyGlGLvrPUNVsnRUgVmTy0jpzVUyEAwh37ZJh/y5rxtx2CxIeg/CKiamXPYBN0ijhPtv
	L53N3/Aav/iOXVa259VKibBB1PI/VAH+uXfJcKBDoBmFFJyUdtc8CNyYZ1B6ub8P3LgBP6Ojo2f
	9Kre919iWE0I0VePCv4KdeivJyzZU7IIZI9vyC9/UuXzX83tF/TXQNSXVYc3bAG19lCIr9sq+PQ
	UmIyH/ZMTm6gbzkdIOBAIe8yxVlYWSprFCjcEZSuCkmTt3W5WC+SOa4k5tiSqV0XWQW/je18HOn
	+kiQt1669mrX3GCSX8cPfooiGoRa6L8Kl0jHaYaEWyJtiTdAZ42w7mYl4=
X-Received: by 2002:a05:6830:6f85:b0:81c:ebf4:9ff8 with SMTP id
 46e09a7af769-84d09218548mr4176798a34.30.1792671538755; Thu, 22 Oct 2026
 05:18:58 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021165748.19304-1-ketan@armoriq.io> <db4e46a6-1788-44a3-a3ab-4fded03591d7@infradead.org>
In-Reply-To: <db4e46a6-1788-44a3-a3ab-4fded03591d7@infradead.org>
From: Harihara Sudhan <harisudhan@armoriq.io>
Date: Thu, 22 Oct 2026 17:48:48 +0530
X-Gm-Features: AclHuK9VMJQ9vVvn-lB4Iuv5LF_25cVG0XxJiOkPXcZoQJDfSKiJzf7VWJduKT4
Message-ID: <CAGhg=-NJjXPqeAFMnYVRnbZWQwoGiPqhyhxH_c7zhL-=Jc+qzw@mail.gmail.com>
Subject: Re: [RFC PATCH] docs: security: Describe the Kernel Assurance Plane design
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Ketan Bhardwaj <ketan@armoriq.io>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, 
	linux-security-module@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:11=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> I wondered what this index entry was for and then running
> 'make htmldocs' complained:
>
> Documentation/admin-guide/LSM/index.rst:48: WARNING: toctree contains ref=
erence to nonexisting document 'admin-guide/LSM/kap' [toc.not_readable]

Thanks Randy. That entry should not be there: the document lives only
under Documentation/security and there is no admin-guide page for KAP.
We'll drop the admin-guide/LSM/index.rst hunk in v2.

Thanks,
Hari
