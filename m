Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ksud81eI"
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6BB2102
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 02:32:32 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7cab6e2f79aso89296241.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 02:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702031552; x=1702636352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnvM9UPay+TWsNcwFyjBL5jOimK9gNCNxA7H2kn5h2o=;
        b=ksud81eILSXwCWXVAE37lJK7fBuSUT6v+PExFGYkBrbYme2WUSHM/0HVn/vHYlw4NV
         V51q6EkdEUE5iigYrzcyH+ga/JiC/nHrazQmMkPn6TJwTpy9M/8HWr3dmzTEaipL7c19
         F2DAXycXOOHgjsvt93Z2Llev/0GSql5adCtClIreZA8qGgkz2dJaYVJ6i2d8uhtDU6J1
         hQgZBwD06zLyBi0H743ClRYgTVE1OkhK7Yi2Z7A7fJiIbtnNd/yyNpmTWmYs0CHCzKr7
         FJYi9Fcd4aEvfnJcsBiX+oN0aTqOwTIZpSlDIT/T/AFmeHmby/+eEpDlHL6yZ9upaKIi
         zGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702031552; x=1702636352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnvM9UPay+TWsNcwFyjBL5jOimK9gNCNxA7H2kn5h2o=;
        b=hNn1rRnvJcLsCgZhHqW+JClZFbN9dDBU+FNTNwhXmO2ykJql0brPLzOrOe/x6pWGbF
         6vi9p4BtPGVsvFiJeA9jRE4OromJLngk2W4Z2i3zYdrGsv+kDl13qHZVDuaan6RE9HLW
         wwcXrhQKaIp4bN8gH24mVB9AbK492EVquTNV3tllms283Gt9vIeMdeEOtVTxWt11OPTA
         d4T4NvRT5Ivd42h2MCCH1JgaOzwg0I86l/6EfU9tpwtY0Jshxh6C2Hs0t87rXfNhObpb
         aqmM35o0KzhOfge/ftjL9mTwaoBOcn03rVs5lzgeDmDBLKpnDuq5Tsve3glAwSDx/2d9
         oOiw==
X-Gm-Message-State: AOJu0YxlBZefK8Q95T6PjVkVTvPQUXRkXdfIkDPrOQll5o2oG7SEllFo
	1I99vRbyR4t8nmv14OqNr9ZsvgZ/B42+KmO5fK9IGA==
X-Google-Smtp-Source: AGHT+IFG5wfI7dO2maOsIJsX/n4bsVO+E2Ku1qwKyiajAw6j6p6fJzIra0OgEwMTf7hlFjr5oeYt41iqmDzUDBKXC+0=
X-Received: by 2002:a05:6102:86:b0:464:9b1f:c718 with SMTP id
 t6-20020a056102008600b004649b1fc718mr4280794vsp.33.1702031551819; Fri, 08 Dec
 2023 02:32:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bf0d4ff21bc25d1ba3a31e49a32bde06dcaf6e44.1702030679.git.viresh.kumar@linaro.org>
In-Reply-To: <bf0d4ff21bc25d1ba3a31e49a32bde06dcaf6e44.1702030679.git.viresh.kumar@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Dec 2023 11:32:20 +0100
Message-ID: <CAH5fLghkMXfND9Kbg51JZf+Ry+pCvGLGSHtpqOdWK5gHkfU7-g@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: Clarify that 'rustup override' applies to
 build directory
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vincent Guittot <vincent.guittot@linaro.org>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 11:18=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Rustup override is required to be set for the build directory and not
> necessarily the kernel source tree (unless the build directory is its
> subdir).
>
> Clarify the same in quick-start guide.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
