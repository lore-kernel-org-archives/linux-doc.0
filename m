Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7D11D6193
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 22:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770677432; cv=none; b=qA69NfosoaFA1E6QfxvkCkLF/N1O8q7neFbmsf0ZdyJajV5/5rZINsVPlQb4i7Lma0jzms1D33LxfYXgvB8WXnPayBBkbrncCjp6B3NdyxdnUmw/RyWWmYt1e1UjLW5diYFyQXEfWG9w/YE3MjXtfO9ui4L2Fk2gww/mExABUeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770677432; c=relaxed/simple;
	bh=R9MKdhFtpSULQjsDpvbhBccI+DmenJD+Gpy8FqQR0p4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxyDxNSycyLpvOMkQELlkIZGSQbHmhWAqomPCi5PHc7Eju3sCo6CDUXHKq6LxnjYmGTYKR6DFhmjK0KCAoGfCvIRR2CL3p7D8J2+2wSUQ4egCujd2D3l/yLWyHJWqUgQQiMrmsoeqx1HG0uW3Jja9Onnanu0RCeXu4WL8+7nr/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxrNPhhu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxrNPhhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E229C116C6
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770677432;
	bh=R9MKdhFtpSULQjsDpvbhBccI+DmenJD+Gpy8FqQR0p4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qxrNPhhuAu5eF1PoOhG8dUedHlgPNoW4PUCNrobCBqS5NTmc7hX7yljaDxBrcQ6Lx
	 UYaPnzz4ZBm/n/mvsgQzN44ATdJWC3D1c9t8oOud1K9mOAmO2SeTUlNstBCAPSHmeN
	 yq+KHTUik68qouxxHFNv7u7d+uJWVfLim/jkTEO7gkaGQZCt6Xr4+W6z2UKVYihmYy
	 ec2Ugfd5R7t1jytnUxBZ3KgaWFYJbv4z9rBOHTXcYTGWOoubfafIjVi0Y7d7WPqnHk
	 hFeQHCyE1QNLVSM1Z+9zy5gkBf+4OLrIJXha8x0cPCdAK4eteNDSwBUvnwOD52DuL3
	 GzD9QIDyNJwNw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64aea64bf15so258278d50.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 14:50:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCiNtew2HXSJTQJQ6gsCfGgvauYsG2KDHFe8LlpbZ11eUy2k35N5vL7lVrzW1JhFrtIhBMTicPMTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzotA6Af/dmJJMmSyfgcX0uhUlqHqOk/qR10gRZofXQleZsO4nh
	dJUuPJParLm/Z+FyImyJ2f2O7PNYu5sfWgPnwGs79mG6QFPk2JWqvjFPXT+9Ty8ptoUTNGiUV2/
	+YC6XRqDwLXUsqbwYMN+LsHL4Cp3sMjA=
X-Received: by 2002:a05:690c:9b01:b0:794:71b7:2adb with SMTP id
 00721157ae682-7952ab24f48mr245741577b3.38.1770677431642; Mon, 09 Feb 2026
 14:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209145603.96664-1-chmh0624@gmail.com>
In-Reply-To: <20260209145603.96664-1-chmh0624@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Feb 2026 23:50:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLmrjE1nybNxEKq7V8_qKTBMSVGzpSj09H=ZtWdgaShRHg@mail.gmail.com>
X-Gm-Features: AZwV_QiO2NIubg8cGJdgLEZDlv2-SClkZ8UoxzwH3YBxo3o0_74mGBqwpMzKsBo
Message-ID: <CAD++jLmrjE1nybNxEKq7V8_qKTBMSVGzpSj09H=ZtWdgaShRHg@mail.gmail.com>
Subject: Re: [PATCH v2] Docs/mm: fix typos and grammar in page_tables.rst
To: Min-Hsun Chang <chmh0624@gmail.com>
Cc: corbet@lwn.net, akpm@linux-foundation.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 3:56=E2=80=AFPM Min-Hsun Chang <chmh0624@gmail.com> =
wrote:

> Correct several spelling and grammatical errors in the page tables
> documentation. This includes:
> - Fixing "a address" to "an address"
> - Fixing "pfs" to "pfns"
> - Correcting the possessive "Torvald's" to "Torvalds's"
> - Fixing "instruction that want" to "instruction that wants"
> - Fixing "code path" to "code paths"
>
> Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
