Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867F30DEB9
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767693644; cv=none; b=gCiP1ohWa5kFUePoheev9XoQgdQO7lHPWLjWoJZ+yyqCVvu2PT0ojGhOmgS8bOdmUHxi+VKTGg3Ts/9aQJ3KfQmXwLfQAJlLHCdaKa79CQ7Rm4QVVr1dwHaX3WcXUM9vmBBXwucENeImHHtngOmj091nTEZa3s8hrM85uqEzCrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767693644; c=relaxed/simple;
	bh=OV029VvtzwenK2Ly9pZj4XbmmuOkWSnirncC/J2DEPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjI8R5dgZe3R+8kCCRtJmlBXPwvk/2A5QJNhHigwacIyJKXAjweLRIr5F+VHee2X+LB8BV3FjfEUxy0ERCdIzDIjaPbwI4UopzNBYGIn1AjAO5z/ArJQAcRTbh1CFvVySTP+Z4xGf1H4QqbmL+iMU//e2DC6FKxby9X9IbAEVLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/GK7H7F; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/GK7H7F"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so165657166b.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 02:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767693641; x=1768298441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95EIx7FPWdKOzYWlR4mc8qP1EVSqo+qRiR/GKIGkIO8=;
        b=H/GK7H7FH/58vEZr8erh2iQjhvU4SxD5vIlwpvOxMgH7smsfFxfdGG+aM8SUN45UtA
         EcYqtwOUBAl2i75lBdv7VfkMczphTtn2RlOvR0hjKooOMPMesONfNZ5UEGffMNZ8mMAL
         dyKuNqnXi3Y0vqBoTygufZJ6k/R4AC3hc9DsBSe8RrFpJCyHvCawbROFqp3ukndMd3pb
         VN7xtbhPjvK0B1usT90miT/DBt3tVmJHTnuyRQ4X85Ejw+uA6lPn9oo9KyC+x8B5v6mw
         hL89IylRWoj66YtoFQGKXh4+d29jOwqUdHzNhopK0kP7S7Oob4lNGOdeD9w5vMvmWLGz
         sPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767693641; x=1768298441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=95EIx7FPWdKOzYWlR4mc8qP1EVSqo+qRiR/GKIGkIO8=;
        b=eyXRNdsxfQzfPELmP8o7oW21MEjjBf7nzmkpTJdtdFHju/KTo2Lzokf3o97JckTszc
         CQR7SzRDDmwPtStIaUo6dKXhhpdKgs/mJzOTtesQZ1DHHqhC08Aw1AFYEARcvWiNA0EM
         MHJ4PXlW+fgCAJPHKieWnYxLBTm9j4RA8WBzryXqhfh97gkUPhRXdmQ7/Y7STZcRfuMw
         dwO2M8gKbhOVw11d5pWe/0Sm0u8QvYHxcoguGxhbKHrM5rtm+xnBU8pR9NXbFeqJvM99
         y06NIQ2MvD61RqWeHa6M9y7QXPWsEuysiqn+BYkN7f5ZgDQ2ZKWUtTzQv58rgunpKuzy
         7H6g==
X-Forwarded-Encrypted: i=1; AJvYcCVLo82gYv4oR0IF23hVzR3LX4gnW4VgP8RLQBGfYc8yW6vKar6wpL9lTeFFOrh5bOK8D+fAUr+VwlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybjTNDm/jpstgrVVoFSKH4RWeFLNOS144/KdRSs5ntir37xz1p
	Mo5gIWatjSjXb6OYuMSP6JSDEjxU51fBqV82L9037L3YrS4XSYQ2U7WvlY6wlf/Oc+GEfSAUTtX
	why/dh2PTxKve0kV/ze0dpjsY53su2vI=
X-Gm-Gg: AY/fxX7YsKw/PaitU+5Ej7ZnRDQ/1Q1jVynhfb7B9Nk1eEfitRZy9bakw+7zApd4deS
	V7LFIF+4Z1phV/IZhmjnSsWcl/iO39pfF6JcYKaJy1crIa1eIJtBNgjdBl7JmfCBYA+4Ycx3o5Q
	enfBqYGsQloK41i0kPKlsDLqZxF5IBU7vUdwJKl3ev8hywFdgQ14+TKlEYgbFF86gxDEeNzIl6E
	/0h6Xb4UpbCXcTIIdlyKBXZet7zlzSzP45cscQfR8f5ctWMpQ/Bzyc0CcsnR0hbIgnowac=
X-Google-Smtp-Source: AGHT+IGnEhBwtL7o99LDF3BZRneSMXjC+uePbbR7SnLCe9X0mAWxOwEKON+G+k4g0dpynrWrgF45RQr9oNCpMP1opMc=
X-Received: by 2002:a17:907:3c8b:b0:b79:f734:4d66 with SMTP id
 a640c23a62f3a-b8426a68039mr292054666b.18.1767693639272; Tue, 06 Jan 2026
 02:00:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
In-Reply-To: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
From: Sotir Danailov <sndanailov@gmail.com>
Date: Tue, 6 Jan 2026 11:00:27 +0100
X-Gm-Features: AQt7F2rnSHtYO0W0XhlnJjqq7gkdw9dzDeIoQAzJuhrOv-qksWnMB-W4P_3Lv9E
Message-ID: <CACYkWJ5btoFoP0vL-1QxuU45CfZEyK65vK6Wyo1QNXRmw79nqQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: process: email-client: add Thunderbird "Toggle
 Line Wrap" extension
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, 
	Paul McQuade <paulmcquad@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 12:47=E2=80=AFAM Vincent Mailhol <mailhol@kernel.or=
g> wrote:
>
> [1] man git-format-patch -- =C2=A7Thunderbird
> Link: https://git-scm.com/docs/git-format-patch#_thunderbird
>
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changes in v2:
>
>   - Use the international URL (remove "fr/")
>
> Link to v1: https://lore.kernel.org/r/20251225-docs_thunderbird-toggle-li=
ne-wrap-v1-1-24794afa4abf@kernel.org
> ---
>  Documentation/process/email-clients.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/process/email-clients.rst b/Documentation/proc=
ess/email-clients.rst
> index 84a2450bb6ec..b5377630a648 100644
> --- a/Documentation/process/email-clients.rst
> +++ b/Documentation/process/email-clients.rst
> @@ -324,7 +324,14 @@ To beat some sense out of the internal editor, do th=
is:
>
>    - Set ``mailnews.send_plaintext_flowed`` to ``false``
>
> -  - Set ``mailnews.wraplength`` from ``72`` to ``0``
> +  - Set ``mailnews.wraplength`` from ``72`` to ``0`` **or** install the
> +    "Toggle Line Wrap" extension
> +
> +    https://github.com/jan-kiszka/togglelinewrap
> +
> +    https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
> +
> +    to control this registry on the fly.
>
>  - Don't write HTML messages! Go to the main window
>    :menuselection:`Main Menu-->Account Settings-->youracc@server.somethin=
g-->Composition & Addressing`!
>
> ---
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251225-docs_thunderbird-toggle-line-wrap-dbe39bcb650b

It's a practical alternative, I see no issue.

Acked-by: Sotir Danailov <sndanailov@gmail.com>  # As past commit author
