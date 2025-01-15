Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F31C22DF89
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 03:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736910551; cv=none; b=W8XpPEL28TXfTa4JwR9YLenYaaZkVogrEqHsxfTps7N7uI5K/offje7VSGZWBE8zRJwg1Dr7Qe8tlWBMdG1JvVjv1zv176gxjJFOYpOi+50T72glbf4WvT3KiuOb+sSKpW0gS138vcwt9pwfWGmOGpE/AzlIKto4CR4mocTWIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736910551; c=relaxed/simple;
	bh=5kXnqaN05Gx+G5mrSgm1FNljuWyhodnTn7WQpqwoW0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHgpB5kfvmaY88lYqn1FC+/JfOW4UhivIttgWf/nZyHHwFSQLT+M5fU9HD+vSLy0qDHvqHV4Kn8Ggok7e7N6RVwIgDBVapktYQh9/v9RtacpCF77+JecvH0viZptm0PQSlXr62Bj00eIVQAZcp035KQlS+NoItnIUcOY0yKdHvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=beGQqIrU; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="beGQqIrU"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e46ebe19489so9161096276.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 19:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736910547; x=1737515347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1IQCioIJZdt95dxpgE4NwCVWx3a08Eavw6vrFcdz6k=;
        b=beGQqIrUAuVIxtyMStq+UnnekNbh5uL0VLiZQeOeW4y3KPhoDn0CsdaNf+ZwemIWqg
         zqF4li91dbtJbYEzVu/cf++N38yN3dRQqoc1BejOt47drLn3mvp2Lx8PUk+euA4WyTjR
         eRObDaDCP/89fPzL7sbeVYKjrb/yeiLk+TIanry2gOaQBbyP1+YIKzEphBnT8cOCJk2y
         DSSNw7qhPE48Bv3S1Fn41vF4bF8bhtBSqh4lAwWP0EO8PWpytuqHr+FWiisaoF2GvAPG
         JQqQVrz4anKmlSt+061XzzVX177XUg9V37Vu8uywLpMtg8x7OEUEH6xYi9F5OOMSXdXv
         UXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736910547; x=1737515347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1IQCioIJZdt95dxpgE4NwCVWx3a08Eavw6vrFcdz6k=;
        b=TXvwXAwIowcZ6ZzrDOvAYQIb4m/o4XR3u6xBiXEoLDt0mhBaNk4/DegfEFxAb/XaNx
         zbBMbcLejySQ+Ow7Y93hFRhX/akntpDEEa0l26qAHiBiRkzbeVZ4HJ5PccUFTLxyxpZ5
         lunMyysgPLC4Vgxjxy4OzeYd7R9ekdUITEEcX+roy9JCAki8kOKn+HsxxcHpD/HY2I+L
         BJaEMThb3GcHnLAEQQRgUwOc2zW1yUtNjUGBCvp0p4U6Y7jjVqInOVVqwNdV2qaatb52
         LTp4ySw28n8osqoCO9zVXfv/BnPgcRAhlEJ2VoEyrvtSatT1MdMjx+ACcoydeo1G+XPp
         DQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWxfR4VL3+YUiIgJIgthK+uVWld3X9ftFJ5URpGM3aXjf6scbZvHxM6T6gcgRLFkGfVjiyfw8oA/fU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQMic6IsKqQuV2Ht4TTF91HkXvenByyqS2/B4g5obzKVW9yH6i
	6PTVYG/nmRTbd8OnYvWPstR3NTx56lZ+Bk2FQg1zS0mVrrLyOhcoUvTPW/fg3xfV8oflftxKLRQ
	ic42xmmZSmNtp0WAEwSVMMm0gKECq4EXxztoP
X-Gm-Gg: ASbGnctnIsI0/la/H0TQBDehabsvOiqo7NVA2PBU4Ll68pjW115DfgqQY1FsSdq+LmZ
	PJhpC6R/6GGqkQ5ryJZY/Ij7zPWlmqjRQkOu5
X-Google-Smtp-Source: AGHT+IG09HKhlu7VKZkvMW0s1tVFf4WCafJy3ySpQ3RqzLbVn5RB6lhPwlxPbVSBFb4Xg5Njr+wYh4Fur6x7sBcwMRQ=
X-Received: by 2002:a05:6902:15c2:b0:e57:3c46:fc88 with SMTP id
 3f1490d57ef6-e573c46fd79mr10918078276.17.1736910547658; Tue, 14 Jan 2025
 19:09:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114225156.10458-1-rdunlap@infradead.org> <1b4275ad-a07b-4647-9d2b-48af08cdbebe@I-love.SAKURA.ne.jp>
 <07909d9b-7ec1-4eae-a20e-38a8a15dbc31@infradead.org>
In-Reply-To: <07909d9b-7ec1-4eae-a20e-38a8a15dbc31@infradead.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 Jan 2025 22:08:57 -0500
X-Gm-Features: AbW1kvY73F7jG2KVpkzwFVAt_-QepSdc85FjMw_4oDLeHPwT3AX4huTxzJBofYg
Message-ID: <CAHC9VhR23zCUsb5hnH4KzL2KbKHVZ=yJ+AvXVNP3369Y_aCa8g@mail.gmail.com>
Subject: Re: [PATCH] Docs/security: update cmdline keyword usage
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-doc@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <sergeh@kernel.org>, linux-security-module@vger.kernel.org, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, John Johansen <john.johansen@canonical.com>, 
	John Johansen <john@apparmor.net>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 6:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> On 1/14/25 2:59 PM, Tetsuo Handa wrote:
> > On 2025/01/15 7:51, Randy Dunlap wrote:
> >> Use "lsm=3Dname,..." instead "security=3Dname,..." since the latter is
> >> deprecated.
> >
> > Sorry, but security=3D is for specifying only one of exclusive LSM modu=
les
> > whereas lsm=3D is for specifying both one of exclusive LSM modules and
> > all of non-exclusive LSM modules. That is, you can't deprecate
> > security=3D using s/security=3D/lsm=3D/g .
> >
>
> OK, thanks for the feedback.
>
> I am still confused by this part though, in Documentation/doc-guide/kerne=
l-parameters.txt:
>
>         security=3D       [SECURITY] Choose a legacy "major" security mod=
ule to
>                         enable at boot. This has been deprecated by the
>                         "lsm=3D" parameter.

That wording is correct, look at the ordered_lsm_init() and
ordered_lsm_parse() functions in security/security.c.  The legacy
"security=3D" parameter is from a point in time where we didn't support
running multiple major LSMs and for various reasons when we did add
support for multiple LSMs we moved to the "lsm=3D" parameter, with
continuing support for the "security=3D" parameter for backwards
compatibility with existing installs.  If present, the "lsm=3D"
parameter overrides "security=3D".

Looking at Randy's patch and Tetsuo's comment, I think there was a
minor misunderstanding which has led to some confusion.  Tetsuo made
the comment that you can't simply do a search and replace on the
kernel command line substituting "lsm=3D" for "security=3D" as the
"security=3D" parameter will ensure that only one major LSM is activated
while "lsm=3D" would permit multiple major LSMs if they were configured
at kernel build time.

Looking at Randy's original patch, I've got a couple of comments ...

On Tue, Jan 14, 2025 at 5:52=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Use "lsm=3Dname,..." instead "security=3Dname,..." since the latter is
> deprecated.

The "security=3D" parameter only supports a single LSM name, not a comma
delimited list like the "lsm=3D" parameter.

> Fixes: 89a9684ea158 ("LSM: Ignore "security=3D" when "lsm=3D" is specifie=
d")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Kees Cook <kees@kernel.org>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <sergeh@kernel.org>
> Cc: linux-security-module@vger.kernel.org
> Cc: Kentaro Takeda <takedakn@nttdata.co.jp>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: John Johansen <john@apparmor.net>
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/admin-guide/LSM/apparmor.rst |    4 ++--
>  Documentation/admin-guide/LSM/index.rst    |    2 +-
>  Documentation/admin-guide/LSM/tomoyo.rst   |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> --- linux-next-20250113.orig/Documentation/admin-guide/LSM/apparmor.rst
> +++ linux-next-20250113/Documentation/admin-guide/LSM/apparmor.rst
> @@ -27,10 +27,10 @@ in the list.
>  Build the kernel
>
>  If AppArmor is not the default security module it can be enabled by pass=
ing
> -``security=3Dapparmor`` on the kernel's command line.
> +``lsm=3Dapparmor`` on the kernel's command line.
>
>  If AppArmor is the default security module it can be disabled by passing
> -``apparmor=3D0, security=3DXXXX`` (where ``XXXX`` is valid security modu=
le), on the
> +``apparmor=3D0, lsm=3DXXXX`` (where ``XXXX`` is valid security module), =
on the
>  kernel's command line.

The problem with the /security=3D/lsm=3D/ conversion that you've done
here, and elsewhere in the patch, is that when you use the "security=3D"
parameter the non-major LSMs that are built into the kernel (see the
CONFIG_LSM Kconfig knob) are still enabled whereas if you use the
"lsm=3D" parameter you must explicitly list *all* of the LSMs you want
to enable.  As an example, "security=3Dapparmor" might enable both
AppArmor and Yama, where "lsm=3Dapparmor" only enabled AppArmor, leaving
Yama disabled.

--=20
paul-moore.com
