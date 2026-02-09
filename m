Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE0349AEE
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637961; cv=pass; b=I7mFGAohD1dOXCRdNfz7q+s6jaQZ/Rc6tcxKF73+9gmgVyqiFEjwOBXBSsEdOt4iLATM2NrawlZyDW2NZzHY+XPxEu2ata97KkXJpbAtcROejOB/rqRbzH78RF0BGlOvyS9qU+O/hKjirwV2I8ECBzoS5YMCGDrt3JOtc7dueoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637961; c=relaxed/simple;
	bh=Zzq7Vs681aqPWze8v3VJWnqjtVrKWx8sUWRtzAo7pl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxwGX8ixdYpRxg9e2ymHkgsqUTr+x2z6IsirLdcYSoi73rpFZBEkJzNvA/Z8FdsR3aDB65ZWrfBqkgtiOthZxiPPZ6cVtAX4jmqDiSN4L+n7U+XDofqkXNppQpXiHbDQmfRa+qTolTjTmrZaK8ErtkaEKb20nRab4GI8dtYcw1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTVPfV8c; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTVPfV8c"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba7eb6022eso21482eec.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 03:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770637960; cv=none;
        d=google.com; s=arc-20240605;
        b=TDWxp+0+ykvBrS6m12NNzFceFsI+R/6ToZg3HF7Su4xBngal2nlfTvA0lPGRu09Yc0
         6VHyYD+J/AxTnqxKytIahqdT7KTeyMINChpxs2Ys4w7t/HjtJZGe+iTFEXf+EiK68aEN
         hJsinNfxi/TmnmJnXRfTLpco/yGWXmqfStJ27WQIMS/vGrIyngMFi1ED47wY+tG0WrdJ
         w0DDAj54eDYXGir18K8s2vggPc66/s06s0ZYdO0OxvqHmPOaToBfcMOUC8vblFWdeEB+
         H3utwJaDTvNCdPDE2aB4N8oE9TS67thFUI76jY0JdA1THO7JrEJdC5JvkV2wi2Mh1ky4
         pcPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TY6n6lWqMAjZ459keizyTELNtiM7fikiKNyHcAG5eMA=;
        fh=UH611dj7GO34rRzc+ldxWNSg3/y8MtNYcGti3zmb2dA=;
        b=ImjIcolR1HIGhRnKcmklB6Wz4L5YJSA0D7VmrVfvdwTqKlu8iRfqIklXE/rwn7ude0
         CjxmdzUA0DnGh4zu/J0srcERGwcVRcrAHzJgpMsxsES15IObn5OCrGzJ6U6Qz2f9YnJ6
         p/mFBZ8GoPtknQOk8Q2pnmhvobG7gFMbbX7dbgmAjBOEVdbWjd3Y0EmO79MTOi9DIG3x
         7f9S1r4PHovh2n7nFTPNa7/xfk9/IbZ5MJPcPAJX9JsnNksJXnlpNTiv/9TpqD/I+nLo
         mFzUCSEOzzDWlzjgIZUcFRc3l/1eEFkXAr91F5DfsZBdZUvHOEDRfBmUisA7jvdFCOay
         cHig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637960; x=1771242760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY6n6lWqMAjZ459keizyTELNtiM7fikiKNyHcAG5eMA=;
        b=lTVPfV8cJ4pBf0kouP2OSkraq/sqGY/u4ZhZ2xIqWNEH5053iCNzWuChrAIlcOgjOt
         pKEeUAlTqwxbFOdqLLJru/LsHSU3xytRZDO/CqoJyRIt89wjn4ib5FXEamdvTW7U9Nyv
         KCkfhiJHeC8veWZxpWwnDwAqyLoRjPnPhmC1ViFI6joZARYBxgmGwHawDrNQe5D6rOU5
         v1FKidRUcjkk0dXy8XcK+QkMTeDVbkamNk47Nf/SNz8T6HdB7NACv1CjIGnQVgQpSnvn
         7xCoIatKH2oTFPH8kXmNFemhBOpI5ZJ+fhRwO5Mc0M35TH4sbNVYHWvY6dIHa9AgA4uH
         lG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637960; x=1771242760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TY6n6lWqMAjZ459keizyTELNtiM7fikiKNyHcAG5eMA=;
        b=BE5j5xTUpIkWiuTCqlNNHDhaOyo/hcDjFhXAWvVGpfh6L7jJT9fWp7+naJCF2MJEnk
         7zqPc3V6xwBEhiSbiXGNIqqpexZTQ66+vHsuS6C2PQp/lUpOcAQAjVldCAz0l6U0eSIG
         orQf97YbEsvd9e6hLswULmAK2bpoX0bINKhU7mg/NtQikrOsGVXGeMeuGveC1mnbzTjb
         qvMSw6TNdCwHxDGvJz9Y1LIcTxX7ZJ6NLvoIZdGwX54TQ1z7P0Zs5ZNE6jaoONbO+hMM
         yF5VfUglmeQvIAY0q2YUiZxP/YaXSEmpqMvETOkZtHG/2EjXXNY/LTiesLBEXNI/e0Lz
         V68g==
X-Forwarded-Encrypted: i=1; AJvYcCUXPnEWmZRi5ItsCSugH/SgejPyvuIl6zlSkmDIa41Yt0jldRMnHMPlD2kgrH6Ji1UJjZxNCNgcyLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sv10KvOgMZGNlaNKYl5nETl6YYBxcmzik8d964Q9Pqa/H3sQ
	ofvjcJgnkxTqP1h44EQ+66+kb9FgDL1Vvi0MbaCiwPbMWLLRFwyqfMg+xBK9f61CqouQ1SU+Uk1
	o/XlyjZuq+9I8oMSZYq6XIQBZAamDrZU=
X-Gm-Gg: AZuq6aJlIwnkq/X6G8W7KeRPo7gwlLXcIKwbutMOGnOA8MT5E/FpMfOYinw4Y4LqzCj
	2jynPvUXRyGJ3Au66MPFGtS0j+qUsXeD+mtCxK/2IH+mV564veudXwqA4mkLDrgJZXpxp4VcsGQ
	JY6dYyfBo+etRhFAgrIZ008pRQEtJSybHybe83wipn9vdv2Ja3z5QXey7qfl4lzfrUmQ6IxpkUT
	gkDB+oR9UhmM+ySRU3ub4RA0PgEtpO48ZwpAOrsGK1hfDDeeS8eoHRqFmOARR0fUk+jBm+bGPYi
	Z+W5usuOYI5Cxz8H42TMK+DJnHaarjeebuUk6JmYCLEbDMY66lgZh+FrjyrMLe8xpVwGk1BhWKg
	jO5X/6z0O4BqZ9fRjJElckoE=
X-Received: by 2002:a05:7300:caca:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2b856a4c911mr2268911eec.5.1770637959977; Mon, 09 Feb 2026
 03:52:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-4-mkchauras@gmail.com>
In-Reply-To: <20260209105456.1551677-4-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 12:52:26 +0100
X-Gm-Features: AZwV_QjceG8JgoEw5aRWMbymspplt_fvQ7_cjaWkDrX-7uHBvZ_bbKxcTrecCgA
Message-ID: <CANiq72=V4yyOwsxvWzGkXQAcMhoTaFZ8aNAe15Aa4BU9JtDGhA@mail.gmail.com>
Subject: Re: [PATCH V4 3/3] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 11:55=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> diff --git a/rust/Makefile b/rust/Makefile
> index ae22f2c5f0b3..14febe9c7643 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -392,7 +392,15 @@ BINDGEN_TARGET_x86 :=3D x86_64-linux-gnu
>  BINDGEN_TARGET_arm64   :=3D aarch64-linux-gnu
>  BINDGEN_TARGET_arm     :=3D arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch       :=3D loongarch64-linux-gnusf
> +
> +ifdef CONFIG_PPC64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +BINDGEN_TARGET_powerpc :=3D powerpc64le-linux-gnu
> +endif
> +else
>  BINDGEN_TARGET_powerpc :=3D powerpc-linux-gnu
> +endif
> +
>  BINDGEN_TARGET_um      :=3D $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET         :=3D $(BINDGEN_TARGET_$(SRCARCH))

This looks reasonable.

My only nit is that we could trigger an error in the nested if since
you wrote the if already. Otherwise, we could remove the nested one
until ppc64 is supported, or am I missing something?

Either way, for the Rust bits if powerpc maintainers are taking this:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
