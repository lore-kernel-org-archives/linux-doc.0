Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22D33F390
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783451449; cv=none; b=YoW23hE1oC3nb+ichjEFd/5qY0xznTfYPngBX7VkeZhWpXhTdPmvtCnxr/KnGhotQugYUo7X+X4uBo+P3k+bWfQZGBY7hqu3bjvv+5vkKsDfYRadV79VECDUgj4f7aJdZwA+/iXoxv7kfK7pJM4FRuQ+FaAyyqyKs2QMhhY10zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783451449; c=relaxed/simple;
	bh=6QIPcqi/hr9Q5Mw00FYk5D293PSOJwYSWX9mfItRy44=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=JOarM0bWwWtQyKCNAAdXD0m849Bfr2+G9QCHuOKqK1gAAYnQtiO4RTHFbxu6SpDmQrV01vBlKdjIyqk6YNMBAEf6UmRZn+3wJaZx4LX9UYYPAKdxMenbXq3+eiVZgcvVP5k6FQFlLLI+g/zpSckEHMmj93iwhzNxGURGSRsLl+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=c+BA9des; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="c+BA9des"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso7957296d6.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1783451446; x=1784056246; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LUpyADyWOfmSP2Gd0K/OIW0oeVkcwDMQQoPjYwT+FQ=;
        b=c+BA9des1e1uFnmqACzRnsVP+9gsL0iFDlEeHo5Ts1RVfRBQDtDTENqR8mqNBFQjtb
         BjW9KVwtSLpakQSpiJ8C3+zMwD35VIFTdTDJyoGxalj2MswXSjTG6WnKquZTUS+bR59R
         Emtjkol631c5jbD0JWshZ84dOnr8UN2RdPSrKFnUbBj3snPZvFNrw9zfzgE7XFhiHZ17
         CVLmIZauLKJo7Gic5PSOzGE+urEF9a8p/Yk/ZePgyP4Y3cyiGqL/ZZJPGAzWMJsGlBHr
         Kt6UmOpaPZBC3qc0PCdxWBlaAzfyAVwPVtLZNOxrdhDZVy1QW3CVR6xypPXyQSxetDMv
         NN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783451446; x=1784056246;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LUpyADyWOfmSP2Gd0K/OIW0oeVkcwDMQQoPjYwT+FQ=;
        b=dSpmgrQ6BgzOic5ZEk3hyZE+7TsgpCicZseCEWTlOvLtEPpDmiwSqOKqqCsjhl2YyX
         toDVCQu7kq5JnVEjfBnvV069r48DvmWv/OkLuo1HtE3TC1nN7lBd5heXJjDj4JzeccEz
         56em76ptlanxOlhg1JLAPKH38l8gBUoFEcmSm+Cn0OD/yo5ITdcq48PWdW1XXnW8SHOb
         id95BP0wECRf6haoq5plWXdxM8V4brTE/DEnNllkUOrSyLzy8lhfeZZ2kJ9otMfojrBd
         nVAMDqsKBvbS3EsfrMtVMp3lswK09S4cG3qXNCaT/TrJadYOYBbuwLSSv6zKNIf+1hIA
         AKzg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2Fwya9985HOcUHnoy3Csx4DjFQKR9LLCFPJxjS5REhu0nM6Ao+tdSwA8jjNR3i0oe+3S+68zNeT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Ta061nd0mojx9t+rciLGI9h4/CsRkaXweoFqmOSPX8UXv7Aj
	XVpei0ni0D8pwhZUnzWmc/HmmFQAjB861+jl+UW6UMlYr8cD5mMDdQ0cEwEpVi0stixiljncEhs
	LS/X5Hfk2
X-Gm-Gg: AfdE7cl/HjV3EzkgP18bK2Lxj6DaJK5sYuq2p8dxi7UlWSMDRZWyq6cBNqqAak7L4Z0
	mvC8kJRdjYWe6aiMYVyf2+CwCowj+0BisaDxU++bBlv9sZ4tOi8GY8qRgEAdPGYYDP+ZyXfUEZE
	ofodqRgkRT5/8BEXXX2nTA7IUCyg2RUDY/DDoFmcPtNv7NDYfJkfo1+npBSA3BpY5brBQZhY/9Y
	5zziDMoVXdjnyHp962zc2RYzIIw2zopwbj4yWe1n/xWGiKNKq0AKpIGW6FK7v/S4F6GveWMzBwC
	li2eG855kB38WozJsfnTT0tL3J7dGBPJJdfcOsdTqgyeVYw2qyPGQLfqi2Kst2GgoQUldqN8rDx
	3l4L1MNTHcpc8xgn1UyjgYmUOy6/Kx13JeP4kFVS3Dv0y+miz3DVWqflIR7rOjonuBtQlusNtZ6
	l4/mckLgO+XmwwJlOzh90AVBXV0IJrTXEGBk1y/QnpaMFU5R4uyQ2hbNSmaikaPLGnzaGo
X-Received: by 2002:ad4:5dec:0:b0:8f1:4bff:24dd with SMTP id 6a1803df08f44-8fd71be1e1cmr41525216d6.5.1783451445824;
        Tue, 07 Jul 2026 12:10:45 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4724ba6fesm165735406d6.41.2026.07.07.12.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:10:44 -0700 (PDT)
Date: Tue, 07 Jul 2026 15:10:43 -0400
Message-ID: <c49545c6c69225bbc7e93cac58d58cd3@paul-moore.com>
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
Subject: Re: [PATCH v5 1/2] rust: task: clarify comments on task UID accessors
References: <20260703-remove-task-euid-v5-1-c90c7e2ddf54@google.com>
In-Reply-To: <20260703-remove-task-euid-v5-1-c90c7e2ddf54@google.com>

On Jul  3, 2026 Alice Ryhl <aliceryhl@google.com> wrote:
> 
> Linux has separate subjective and objective task credentials, see the
> comment above `struct cred`. Clarify which accessor functions operate on
> which set of credentials.
> 
> Also document that Task::euid() is a very weird operation. You can see how
> weird it is by grepping for task_euid() in the history - binder was its
> only user. Task::euid() obtains the objective effective UID - it looks
> at the credentials of the task for purposes of acting on it as an
> object, but then accesses the effective UID (which the credentials.7 man
> page describes as "[...] used by the kernel to determine the permissions
> that the process will have when accessing shared resources [...]").
> 
> For context:
> Arguably, binder's use of task_euid() is a theoretical security problem,
> which only has no impact on Android because Android has no setuid binaries
> executable by apps.
> commit 29bc22ac5e5b ("binder: use euid from cred instead of using task")
> originally fixed that by removing that only user of task_euid(), but the
> fix got reverted in commit c21a80ca0684 ("binder: fix test regression
> due to sender_euid change") because some Android test started failing.
> It was since fixed again by commit 65b672152289 ("binder: use
> current_euid() for transaction sender identity"), which uses
> current_euid() instead.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Originally sent as:
> https://lore.kernel.org/r/20260212-rust-uid-v1-1-deff4214c766@google.com
> ---
>  rust/kernel/task.rs | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Merged into lsm/dev, thanks!

--
paul-moore.com
