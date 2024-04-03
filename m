Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F94415688D
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712181599; cv=none; b=tly4hDjrG/W3CVFnUCaRgMQvBegHVvR6pSVAu89HJCpRQx30QO7ewwSD2Q7y0KS44Z/kc7TnQLGMoGn43HcYTBYKiS13QIViKwZRDjhp1IBZSNPPMzydkcgcxz6xLLOcy9XWxdegnR8Olzlucc3nU19OlDa2EmXoudGTCTgC4uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712181599; c=relaxed/simple;
	bh=J5cX4GqktbP0gID6yrJUxK/jCIdoAH/C/9xsI+yoDaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qB/LaJ8qOjdZpwYb4gvK2LMI14/A+43PezeRQzkWTRpDmE0XjYlUraB0iWR/l1aZs2OrU2Gh7qgIu8wrnUUDcw59J3FxOhqvkFYLOk71gXbc6wE9YfLzDUHLjDXf6leNn20eXGpGgoYCBlYFd4PBfKTJ2EWP2exAgGBEbRTSsZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1IVSAQ5V; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1IVSAQ5V"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56beb6e68aeso1658a12.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 14:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712181596; x=1712786396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTy7UZvOGfVzOyBfYCslewqivjbuSdMwhgF1qVbAn0c=;
        b=1IVSAQ5VFCMovnIRk+cGRDEWfEwK8iC+gQ7wq77X+DWJ0/O2F+rIzuAntdOROFV6/0
         HJpsjnAi48P5hBCYkokapjSLIfKYCWjnOXInpr9XMOdvfywFsmFTfGFD76Dn+UVJu/Mp
         N50VbviqV4I5DbiL85StfH0HJZSigFzPSTmOuEiGPo+9Hihzs+mV+p4FxoTrFwwAa5fM
         QKTseOEsSNws8Uyu7rYlHWAliAkPdRuYQHpxN3bRdsbzh7Sas3yu724Hf21HYGcDKg50
         vnABWme91nBIqMKfrb2vv+MEOu1YZpUmXU4v1CeFeJguRg/UyredijICSKOvoMJIXmI3
         pz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712181596; x=1712786396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTy7UZvOGfVzOyBfYCslewqivjbuSdMwhgF1qVbAn0c=;
        b=em4rTBgjBltILYbbwDURciV78lPeUxDQVySOtFu/dr01yLbniIjWXLlkIe/ioiqHss
         bzztK9ldg8+PnMvJvmILP8mQRnjqVzITU2dyBk+YtVUPhp39fF6XTIeuwAogop8+mLQI
         mulN89EA6E9BlY/B6EvtpXq8SESUcDX2Z/zSCgqz/Q7tWJSFsCK4Y/Q5NWQ8yyZts8kI
         ET1aSVnBmeq5ceQ8hz9u3g1rgmozv5FgNAhi1sgXLl7KR5OIPBs/RX8i/jb90gkQidzx
         0YyKiUPHeJTVsD0GemGvo5Ssrv42UPbYoqzTLwtiwmWCLzm7SccYNDzFnZLSPvQlvTN+
         ksIw==
X-Forwarded-Encrypted: i=1; AJvYcCXZefomCITSez3YJJ9PZlT35anLHcweHBsJE8v35ekyNGDDV7URyHz9G67jYwVMoqReoV8DBaTqKOOY6/y1KH6eg7a6GpOoW3g/
X-Gm-Message-State: AOJu0YxhZJxeaiKNNqM86NFs8U63SAVjjjKdKPZyk24ZyAtT1EYb5pTe
	XTooa66TfD2Z+EppKwgAh5OBr3da2m3dzbTbCS8LBP2IcA6HxA2uqswTMtDe0ETXBLOrGk20NS8
	4hEoDsRuGYka3RwMtqyKNUFIBz29fs9ZLX4EP
X-Google-Smtp-Source: AGHT+IHTInqBsj+mNZa49X8OvTOGw8WohoVAZbNq1Rfczn2ElBMyortTXet/IJD1sZ4waCx5tYiTp/gANpZfOjPunrg=
X-Received: by 2002:aa7:cfd7:0:b0:56c:522f:6799 with SMTP id
 r23-20020aa7cfd7000000b0056c522f6799mr278607edy.5.1712181595529; Wed, 03 Apr
 2024 14:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402125109.1251232-1-jackmanb@google.com>
In-Reply-To: <20240402125109.1251232-1-jackmanb@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 3 Apr 2024 14:59:43 -0700
Message-ID: <CAGS_qxpBmmafnQnDXYf5RftPzxghd+i8Ly4CK=EkcpidpCPP6g@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kunit: Clarify test filter format
To: Brendan Jackman <jackmanb@google.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, davidgow@google.com, rmoar@google.com, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 2, 2024 at 5:51=E2=80=AFAM Brendan Jackman <jackmanb@google.com=
> wrote:
>
> It seems obvious once you know, but at first I didn't realise that the
> suite name is part of this format. Document it and add some examples.
>
> Signed-off-by: Brendan Jackman <jackmanb@google.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

Thanks!

I agree with your comment on v1, I think the extra verbosity is fine.
It's still easy to read and this should hopefully eliminate the
ambiguity for most readers.

> ---
> v1->v2: Expanded to clarify that suite_glob and test_glob are two separat=
e
>         patterns. Also made some other trivial changes to formatting etc.

<snip>
