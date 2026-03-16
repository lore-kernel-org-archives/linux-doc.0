Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5134D382
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 07:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773644769; cv=pass; b=Nf+iZel+oFQelLtqDfaRQp8gy8IfUsdcscOG9bP/9svSd4PAam8MRA9bd5gC7o4mVrhHkraj+ZjrlXHmfYNvI3fr2r7KBoAL+GufhPCVHMsDdlTK0CXtLARKseqlxYnlzUULe9EcSidTpqfy2wgjmPs9Tdpet7RDgOep4d00zTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773644769; c=relaxed/simple;
	bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGxDwCfQnDggsFARzItD5A7X6ZUezKxEf/JE38rINShInrXpI/Y5Nz8AnbVmereSE4iofY94MmZGt1O6ooEFre3mG/NPiqNrrnhDDM7oCq5uGKLfBaY7Uw4HvUyJ3UjyNS7t2t92gZBhPxqt97YuIE3iUYYyjZhr3b1st5KvYqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrvNm/sp; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrvNm/sp"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso33992041fa.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 00:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773644766; cv=none;
        d=google.com; s=arc-20240605;
        b=YnxP0/mD+NpYjiVt8QX+c6Qa3p7y092h5hIL3TK5J+NoUAUYh4mQBfUK5eIivmz+El
         XRvWkGxYCuWgFqoewlTJaaj5hTy3JaEMEO1D0vuwuQIL/znqyUqpT4tbSPjPgSnz8yvh
         Y6reKlH3tPLrOL1azCQI2dSp/cIIsxHED0M8e6tAwaw+a/7bZJ6N7joOoiO1Ptbwq1Cl
         84l1+nyVMu3zi4UQNczOP99buHGkbl4ojxeqm4sbkC5LNmFWDsrtIh+Mi7Rv7Q+ncX5O
         h9qzJxy+ZbkgYv/gvYq7FuGeBZUeePIp3Z++9Xzgmhlur78vMTMSMIlJiPoQC7gqmNCB
         gGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        fh=ts4kkOvu/AA6KaV1nk38l/2GruMSZdrMpS0Ei7Zwbqk=;
        b=F+a/W876bjJY8VOX9jyn8C0a92pEyPG3JBbdZ/igces24pyR2/85vpXdw29qKAPqcc
         1OGIWpR4KeyVxDtk8v/FokJoxPn4B7lrK84es+S7j8EqEfn6mTYDnmFW7sgOeDSP+9G4
         P7IytgcBaOrvHg9K2TKAF1lFHPnKbbUm8CqSk479HTy5/nSoMnXFQSnyn0T2NseYg0C1
         VBqh4ELzH8IbQC1jZkhJxxwA06TgLux6walIs0x9e4UlqSuRx/trfwfVPObFJ/zy0syv
         J4hdFrIKPtrabfx1TPdPqBwPQ0H5AokuLwTvzDhDcd7DHvBQNL+JKn18sZUIl1zmYxbB
         CCTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773644766; x=1774249566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=rrvNm/sp0ejqtQpts4YJvKIZJai0U7h6SimZ1+626FCi7l4L6Dzs/D5AfC15pRBoWr
         kv/dIm7CfHnm9HMv/wH+hAenKg7VAAA/E7tVULHXPbxFq6YGS4qlbY3FPnHscS4jfzMo
         D3dH3ecOve/eQGzSnAb4Ojy44wq5Nw/0FFYtscPxcItm710bCdD1kjJ/hOB3448XZy8f
         K4xi4VdbUD1F+Vo4MhfBcbKbgnUdds5xx8LCHziC6xxbqHA6MvyjhOKbbiisyPVocwZ3
         KxoLuACxgOlrc3AY0BNPbelvSOBLVO9w1iQzbOC3uVjI5svhEljwS33qC/sFSOyzUjaG
         pJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773644766; x=1774249566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=egin0Wlevj7hypphXXRkSSO1VQifrhsFuAtJi4YMpzFVyQoU5meuWUJVLEyZw+hAsM
         fGR+0+dWMLkuXdBEZTRJvsiRbXGrYnnFWfHZAmNp0D/0GNv/i0PL7hc14tiDTZUw7WKa
         qTQYLsZx8ZFnk8t4Yebt9EJn4ieviFVKrqUhkrdU0B691CqbWt7fQ3pnm+xLt8G4z6Fk
         ZhdpOGkX7cGQ/BvZ7cKn7p0mMYfaieIDYZEHjuGJR+W1zivvDURxC5er2MPqTgiKx48h
         QAVbXGOhgAoflB2BMLCL/xZTh4pH1mnlw4ATcw5nGoj/HTmGNpZWL+83BjPjQe7gi7M2
         U8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6+xZNDr+cHKA9huw65wGzumVhf6qQpNVIIbTmG/ltPNrkY4waBALCsBv8TNOWG0c/A969mBOzHRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9eilm65s4IkdNN9MSFlnb88h3b+qi9Km8+PgPlcmTRvqMZosy
	0Q/UCvh5MyY3o7MNmbW4oBahI1g+dRDh6YjGAEwZRx8iTSLWqk4PMDnWNXTWsr7VpO+4wRDfVCv
	T4XjxD0gu2cj0LapZLSI0xm+5ZcFfHzMsMnZXCCtF
X-Gm-Gg: ATEYQzwcnp7E1x9dHIzQhbQR0t6Ei8Nd3TQKonsmMrGX3s45Q4F4YTwAqwjFplqY2M1
	v6ZLtyUnL6hbfvBwFqrqysiiXguO5mOz8RqtE0pZobIDr1atenfiZJvlWgmOoYlBXqfcPkfwvE6
	0qY12OCKTsKjQ4h9k5m62oo4ge/JYGCfRZtTGkY7APCPNYsj6AWlgI8O9UU2HeK2G/Wu/G5hLFh
	08VRu53e64YcMBOaXhScQNuQubkLnVD0BWiFOMiuqL38YH5h8ZnOs3rOf7KtgTHeIyxgnKgILdL
	UOg1Psq7PVGn/sqV7nyaont5yGLdkhjQttqzef2wia/z/r++arF2eODW4r8n/icLJ4d2wg==
X-Received: by 2002:a05:651c:4356:10b0:38a:2db9:eb72 with SMTP id
 38308e7fff4ca-38a8864c94amr30667511fa.16.1773644766146; Mon, 16 Mar 2026
 00:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 16 Mar 2026 08:05:53 +0100
X-Gm-Features: AaiRm53tuutFjpddzDm8MgJQk_X6I9zzb6Uz-8-_BFX3BICSXZm9HxgKcE0xoPQ
Message-ID: <CACT4Y+arWePyxnV3hWk5RanWZpoc7=ALQ6DV_2MCuQkNoTtJUw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Jakub Kicinski <kuba@kernel.org>, syzkaller <syzkaller@googlegroups.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni <gpaoloni@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Mar 2026 at 19:18, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.
>
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

I think our reasoning wrt syzkaller was that not all interfaces in all
relevant kernels are described with netlink yml descriptions, so we
need to continue using the extraction of interfaces from the source
code. And if we have that code, then using yml as an additional data
source only adds code/complexity. Additionally, we may extract some
extra constraints/info from code that are not present in yml.

Realistically system call descriptions may have the same problem for
us at this point, since we extract lots of info from the source code
already:
https://raw.githubusercontent.com/google/syzkaller/refs/heads/master/sys/linux/auto.txt
(and LLMs obviously can allow us to extract more)
