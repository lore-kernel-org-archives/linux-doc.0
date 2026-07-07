Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807163A5E6C
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451449; cv=none; b=gKgmDbAiDGOfvkijuQY874fCG7CLvp7R8OyScV19vrmDhgtC/+WRe1EHpjKK4PB8fVBfavavzkwtT10txKmFMZOmIoryPiAQ9VuCPPQ3VC3vYa7VvxZpD+dly7/rH8T5/gnUFlx6o8rOKeZG1vN9wBSgiEZ39nZk8hp+2SdNFA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451449; c=relaxed/simple;
	bh=9e9qjg8FjE4LIAcZ8mjOkqL/o0d4wmhbdAuKcnOX1/Y=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=IOh7P05gqiCgRCLUhWknIhh5jSapbYeL60l1lYMjLqi1zDHNbDOFmQX9mXH7XKQMKRRZCOiPBoG+DDDcm9uEYNh00jsCXK3WKEX04Fzv0xb82VL8FkKjmVtYZbymf1kEHeLXJU1+YbKazHJuui+89XSbv2ZiWuTLN/OPn1egYPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EQxitSu4; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EQxitSu4"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so31561946d6.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 12:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1783451447; x=1784056247; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBSYWCX0Xl0nrH7KuyJZql2xgbujaGVevFK59n9qnxQ=;
        b=EQxitSu4R1D7XwJ2ijwuyXMLO4lNwZa6kMMfoi5eV9WaDx4ELjcZFnB0IG3ZfdWmnM
         GHdtwcsAGgMxpJOuYVy+ItS8Y3lyy6i+FicFIcqMaLIuMB/Y7rlk632Y0g8hz64N8S26
         S+02vS/e3//ux0QMLNxr9aKJIz/GTMWuNI6hXxA5VlDTvzYZbux5KicDEBNTM0FTSdZO
         aNA5sbY4X/jJWDZ+z4Ep7i7Xx0IUj+IXR3VMYr5r/xPqqF+ET1O0Kby6+yqZ4CJ2P/jC
         J14ra/5leABskcW+AEF3o7Laey8f6Pa8msJQQ0yGgY/+XSN1tSUhqs5nsBipfB/5Mso4
         BjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783451447; x=1784056247;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBSYWCX0Xl0nrH7KuyJZql2xgbujaGVevFK59n9qnxQ=;
        b=YQ0NnH7iHoWwJAyW8DJR92g5eQ3vJ9S2WD6nX23JgJdCPGjU8H2/nYNkqniO1e26XR
         IbDyQrrkSb1Rex5Q2uin9amYCof7lH/Jxr6TWpWJ/uZ0YwzpmT6qo2Nf1iYF/k4zHcRx
         9Wj9xr+pUmv4fGAgyL6VO9ZHJsywracmrAbOU/uUkZBoWcWnwoO4nS8/9BLJh6BMZQaX
         4ltk5Sm4GnZTXw0n9KP7RbAIATkSstvpQiuUC4oRdfsvG2Ydv1a3Mc6UpON4baWo+dJD
         CXPF7IT00IBIABj09wRhCpwqXh3DiYTNwdw2IbnN4oOvx4q5GjPqQlBLTiXtHsAEYGWm
         km+A==
X-Forwarded-Encrypted: i=1; AHgh+RqDvU/pI+wYZHTsEch9IaDhi7GAdaSf2Z/4BWTIx+JS/NtN+LWTY9kx9UVoS6Fpmx1B5Gks1KMsb8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0yMSoY4PRlQuUPfGsdh1h7ihDUpjkhPG8/YOfx0F5Qn10DCoc
	4LjJEI5KtoIIQgB2CRZAblFDncsi3zdP1mfkVoHWtn2sMq/owNVvL7vL9gslloNyBw==
X-Gm-Gg: AfdE7cnyd5c5iC+A8U/v0CLbz+dEaUJcuZGomg4jYDnP6iTy4KsGyxlK3KFz7q1GQum
	LUrbJsGTn9V4x0ABgM2bp414W/sM1zArq/ffbrNGkZwwP7NonLWpbALikiJGgP3JjIrvvXkELaZ
	Vwl6NQu8ej0lLkjY+zFGY/13CaZVZmR40tT0bLnSZMHyQHQRgfGdf/bl1/zcLWSqKHsJE88TeFL
	y3b3f8OZScZsoQzeELuXvUdRptISCRn2itmDiYkfUiQMMcAyVRpk5nmyekv0xID2xeuMdtPCULX
	Wf7vkcP0hYkI0ZynwngYeRLtjn0tmzAbpdq4Qe/lBLfwzc9rXixzODTp6a8cuPMat6MqwsdxEbe
	meOxnBcQCiPtidyIHcx09EFMXh5JQQyR/DdEFajRjtTScpjzStoIJeizW4FYDvML0vBs5oQavrO
	eacv/txV9mdaNoBwloBgMRr9DSb1g1yLiNnAbiNYuavIMDG+tSqZKVtWs6v4QtXWuapyRD
X-Received: by 2002:ad4:5d4a:0:b0:8eb:24e8:8d28 with SMTP id 6a1803df08f44-8fcb4904bd7mr89056376d6.46.1783451447567;
        Tue, 07 Jul 2026 12:10:47 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f30c04fsm178016696d6.22.2026.07.07.12.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:10:46 -0700 (PDT)
Date: Tue, 07 Jul 2026 15:10:45 -0400
Message-ID: <054bead629039656c730231393b4418f@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260707_1504/pstg-lib:20260707_1258/pstg-pwork:20260707_1504
From: Paul Moore <paul@paul-moore.com>
To: Alice Ryhl <aliceryhl@google.com>, Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, "=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v5 2/2] cred: delete task_euid()
References: <20260703-remove-task-euid-v5-2-c90c7e2ddf54@google.com>
In-Reply-To: <20260703-remove-task-euid-v5-2-c90c7e2ddf54@google.com>

On Jul  3, 2026 Alice Ryhl <aliceryhl@google.com> wrote:
> 
> task_euid() is a very weird operation. You can see how weird it is by
> grepping for task_euid() - binder is its only user. task_euid() obtains
> the objective effective UID - it looks at the credentials of the task
> for purposes of acting on it as an object, but then accesses the
> effective UID (which the credentials.7 man page describes as "[...] used
> by the kernel to determine the permissions that the process will have
> when accessing shared resources [...]").
> 
> Since usage in Binder has now been removed, get rid of the resulting
> dead code.
> 
> Changes to the zh_CN translation was carried out with the help of
> Gemini and Google Translate, and since adjusted as per Alex Shi's
> feedback.
> 
> Suggested-by: Jann Horn <jannh@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Documentation/security/credentials.rst                    |  6 ++----
>  Documentation/translations/zh_CN/security/credentials.rst |  4 +---
>  include/linux/cred.h                                      |  1 -
>  rust/helpers/task.c                                       |  5 -----
>  rust/kernel/task.rs                                       | 10 ----------
>  5 files changed, 3 insertions(+), 23 deletions(-)

Merged into lsm/dev, thanks!

--
paul-moore.com
