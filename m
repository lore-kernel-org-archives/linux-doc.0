Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="VndMP9Rq"
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E87D5
	for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 00:11:36 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a1915034144so554596166b.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 00:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1702282295; x=1702887095; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=qcJzdfqObNDmtw7E9OrdNF6CpUIv0YRzgPXgPrIHK7o=;
        b=VndMP9Rqnng4v4Sd3w9eRoLvN0kibuwPDQMdKcLOkKE5tKwpEhsO9CkgEDDEwf2s2Z
         bS/0oKUdp3/jobvstS8VZgmvh4jNv+F2q1Ixu1sXD8cN6J8/3wgotZZRwjx7vtkKU6ah
         txq//rzHw5kaFVqN2lTkTINYXHFXCEpRX9f7zUmhVhZpAsqBEQz5ezIkdj3l2eSSGmoh
         TuNmfWgAi8p4rsHy5Wai/eldjDBPon3mp5usyOCLWZrinHJGUev9KgZczEVAJ1d5Taqe
         7ll9J5LGC8aT4on1MzpSnyiTH1+42+gjuwcVI5UcKXBcFsJGEhDyzePPBAR0lYR3kARW
         YISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702282295; x=1702887095;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcJzdfqObNDmtw7E9OrdNF6CpUIv0YRzgPXgPrIHK7o=;
        b=CDRuNr8E99rJxuAyDdSzg/6Wnwsr7R5zQ72hND0FqGrtUT28c8r9rzNwjzDi6bt/JI
         4cmWM0rlnzJLYkEDP9E+i9v5U4pI7OCCCfOUaMyLrvT2shVvmZQ3ZxvswfUOn8CDSAkH
         LE9qekVJbErU0pxUkGQpNnGK1/nr1xsttNID8J8AxVwI6bha21Okb+qvHb6o9raESGdI
         jwFuFjVtFsXvCeFvKCtSTegtfz2jx0H+Xrl0NzH1C7JyTwxzBglGO1G0qXlNcdegZN0P
         8u6ats/HHjDkue35nvOsAabAHWvu7ZjavNh5lS7ctz31s1hHD131TOr+A8T/6MF+uRcT
         2vzQ==
X-Gm-Message-State: AOJu0Yxrm1qbIPDaxbyjlu/RwsD3ZtPbKgM93hqvHW64F2caSC9FRPPq
	usFCousjFmV7uAfCgqpRYDpQAg==
X-Google-Smtp-Source: AGHT+IEWPPXjJlNrj3NjX+wLy7GNr35ypGKtIG66b5BUVBjQy06MhULrNT8Tm43Kdd2wfuFP7zdwAw==
X-Received: by 2002:a17:907:8688:b0:a1d:5b0d:1c42 with SMTP id qa8-20020a170907868800b00a1d5b0d1c42mr2695236ejc.35.1702282295196;
        Mon, 11 Dec 2023 00:11:35 -0800 (PST)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm4425472eja.217.2023.12.11.00.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:11:34 -0800 (PST)
References: <bf0d4ff21bc25d1ba3a31e49a32bde06dcaf6e44.1702030679.git.viresh.kumar@linaro.org>
 <4738ad1c-eb54-4ad6-98c8-3852de3e8fc3@proton.me>
 <20231211064742.63l4cmvxe4uso5us@vireshk-i7>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <benno.lossin@proton.me>,
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Alice Ryhl
 <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>, Vincent Guittot
 <vincent.guittot@linaro.org>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: rust: Clarify that 'rustup override' applies to
 build directory
Date: Mon, 11 Dec 2023 09:09:22 +0100
In-reply-to: <20231211064742.63l4cmvxe4uso5us@vireshk-i7>
Message-ID: <87h6kpf9am.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Thanks for fixing this Viresh!

Viresh Kumar <viresh.kumar@linaro.org> writes:

> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
> index f382914f4191..dee787f92d26 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -33,14 +33,17 @@ A particular version of the Rust compiler is required. Newer versions may or
>  may not work because, for the moment, the kernel depends on some unstable
>  Rust features.
>
> -If ``rustup`` is being used, enter the checked out source code directory
> -and run::
> +If ``rustup`` is being used, enter the kernel build directory and run::
>
>         rustup override set $(scripts/min-tool-version.sh rustc)

How about just specifying the path here:

         rustup override set --path=<build-dir> $(scripts/min-tool-version.sh rustc)

Best regards,
Andreas

