Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236805240
	for <linux-doc@vger.kernel.org>; Sat, 14 Oct 2023 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Exx1S0w0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C14C433CB;
	Sat, 14 Oct 2023 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697274143;
	bh=q3aIQAuGvEalvJHYNryE3fePayWggV6Dn+qBeFX+34s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Exx1S0w0PeoIpe/84fDYaVqKop1vQLJ2EaJFIBQLpyxL7mgHxSMTP3C+m11eghqg3
	 TUORXEG9dLnXoFfKsP67ypqtX6RXv2Ps80ICQCQcp5Z0vThHIjK9k65TC42ijalPuV
	 9ryvYIG415hvZTwV1XeMiBLL8Qu9MUPItpwLeNfzWVft3ftaJ6yAUjHh0G7e9SoCsC
	 wVtQfM+uEUBuVw6KB8n9S7bgBRQUdQ4636uwjbA+NfQmKmPF1DclMHTUbZF9iRAZ8o
	 RsXft9S2BOJAhdmkJZOjxZR1LhzUI0ZScs7Fi2ObH2PXUUni0k8MeG29UpI8tpuxmS
	 WcPoN6LQemDvQ==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1e9a757e04eso1642492fac.0;
        Sat, 14 Oct 2023 02:02:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YwJnWzPkcNUNO5o7L/YBK5kMWLtb4iogcOHXN6djNSOtsvALKbt
	6Cp1Q6I/qp+xgXiMgYACsTjFKwZi5mfr9bJMp/E=
X-Google-Smtp-Source: AGHT+IHqWtE8o7PhfqWEFTDLju6aH2tyNyhvJWyLTtp4uE/cubOMSAd8e6I4cAdTjpAJSKQxpxsIPgdtzLoUTdjg4sQ=
X-Received: by 2002:a05:6870:c081:b0:1dc:dcf9:18d8 with SMTP id
 c1-20020a056870c08100b001dcdcf918d8mr1423504oad.24.1697274142906; Sat, 14 Oct
 2023 02:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231012105420.16779-2-ricardo@marliere.net>
In-Reply-To: <20231012105420.16779-2-ricardo@marliere.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 14 Oct 2023 18:01:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgyPVNk=5mq9D_4Hg3GTesDEwB=XKDUVXdjUintwWenA@mail.gmail.com>
Message-ID: <CAK7LNATgyPVNk=5mq9D_4Hg3GTesDEwB=XKDUVXdjUintwWenA@mail.gmail.com>
Subject: Re: [PATCH] docs: kbuild: add INSTALL_DTBS_PATH
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 7:56=E2=80=AFPM Ricardo B. Marliere
<ricardo@marliere.net> wrote:
>
> The documentation for kbuild and makefiles is missing an explanation of
> a variable important for some architectures.
>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---

Applied to linux-kbuild.
Thanks.


>  Documentation/kbuild/kbuild.rst    | 6 ++++++
>  Documentation/kbuild/makefiles.rst | 7 +++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuil=
d.rst
> index bd906407e307..9c8d1d046ea5 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -243,6 +243,12 @@ The output directory is often set using "O=3D..." on=
 the commandline.
>
>  The value can be overridden in which case the default value is ignored.
>
> +INSTALL_DTBS_PATH
> +-----------------
> +INSTALL_DTBS_PATH specifies where to install device tree blobs for
> +relocations required by build roots.  This is not defined in the
> +makefile but the argument can be passed to make if needed.
> +
>  KBUILD_ABS_SRCTREE
>  --------------------------------------------------
>  Kbuild uses a relative path to point to the tree when possible. For inst=
ance,
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/ma=
kefiles.rst
> index e67eb261c9b0..d88d4f0f4f89 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1623,6 +1623,13 @@ INSTALL_MOD_STRIP
>    INSTALL_MOD_STRIP value will be used as the option(s) to the strip
>    command.
>
> +INSTALL_DTBS_PATH
> +  This variable specifies a prefix for relocations required by build
> +  roots. It defines a place for installing the device tree blobs. Like
> +  INSTALL_MOD_PATH, it isn't defined in the Makefile, but can be passed
> +  by the user if desired. Otherwise it defaults to the kernel install
> +  path.
> +
>  Makefile language
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> 2.42.0
>


--=20
Best Regards
Masahiro Yamada
