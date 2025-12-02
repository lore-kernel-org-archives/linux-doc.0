Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F563101BC
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764676637; cv=none; b=tatEDnHOGVdAfieGxkvs++sonisdmW8KHg7LuAb8eblXCYxud5Jm9Co9PB6bHqX7HBj3sSEor3EEJnfcZyRvLPwND6Khhj6lWnYkqJi53SHrnS25JCfQBkJD6zMjsBwUeMav6Tfju8MXLrF8J+pfs0QphcaVvJNPxd/9Y6VtdwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764676637; c=relaxed/simple;
	bh=1ieJ+iA2XEYM6T6VjL6NCidq3TwSrt/W9/D1MpXduNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/qSNQIkqkyDwonvINSD8KZOlP5dJuM+TdM1CvgLTe01GY8hsv0599HcuY+HNsL3qfKNOclfcAJx4UuZA/DR8R2ifN/1j7Bnj1VkY2107pSEVeNgjELaLoyw+uPeOOh7AATmw9iNB2pQRtd1npFTQ88RVWXDLK3NNTRU74Sv7Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=lJ7HkMUL; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="lJ7HkMUL"
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 44BEA3F79C
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764676633;
	bh=1ieJ+iA2XEYM6T6VjL6NCidq3TwSrt/W9/D1MpXduNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=lJ7HkMULxfrzNmhHVC/rD7DsCjCwmAFlEdfVtp6XxC4kqHFQoks5cqh8J/MRVvvog
	 aVUZ6okXmXsHDK81O2cI/i+qUXdfaQM5ppg9d6xmPbHgQlP4jfIxYrGf0AgFILMu6j
	 T8rQm3uoBjHPG2y3Oek5VKU/nprU+sfBYuRjhjcz3xSKUDK5k0VpesHtzJcUgAYWIP
	 lagaAHcHgPxx3tPpKQCyWlI4YoGzldDfUl6ORMuy6j/1crF1zTRHEx5TijwpWcUYDG
	 aJGBanFLGoiXbFnjKXQoJ8A97RJjI8Ro3ww9vD9MgUZql9UDnT5wbm58V4S1fw3w6c
	 V7K71FATtc+xddpPlvSS5e+X5/OH/zR0I8ClfTFFakHYshW7zv9zcJcCkx9M+Av6uP
	 ie6sJ0wM3/TlJg6Q45GpSbVJizobF75X/MetDaDYF27Vj9d2XltYmsvLOo5uNTC/sQ
	 yFBqMwurVxEPZE+1XQ9ghFFh1NEcIDOBYpRwjiyRjLuiceqtwb/+5cprl0vfE19qaW
	 gkZrV0nwKaSTqOSMTtrVHtuCFbYs3VDLx9WybcQY5ABlE8dy54oVT7Oh276apbwj5y
	 XOrm7XgXYt9cp5iEiwJBhYjvqoHWzp+NTJBNofZLztdbIz6YpppXqiHgdFNdQWP72o
	 hvmKRwEJ0HBjmXQm1PiYDLyo=
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9371f7571d6so6298543241.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 03:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676632; x=1765281432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1ieJ+iA2XEYM6T6VjL6NCidq3TwSrt/W9/D1MpXduNk=;
        b=L0AAk6tHhJ9uXoU743XLGc2w04EzEVz1LYWofkzDllZ3NPAkadkgePAeU+l6WcfAFa
         2equJeaA82L+HRylP2D1Ra/103fXQF4xn9Sasb83hUbJ3+s5dnP+ecmdKHwaQ40nSNci
         wLNWubdnhlFpNsDkViZEtzhy7i2IuGq2Q7kYmlMGzFBHpfF70qmHjDac8s5C04522gmZ
         Tx0qRPp9M0pFhiN9NWsGQq6IFWAOBVjLd+Dbd+ctalTe1XW5SCWQBnXieMU3ok0LCpgi
         1mNilZHcZspOP+/q7dnfgk6Zkt3mZESugiCjYf82tYwjXf5XKyBl9S2pkA72boD996M4
         rHcg==
X-Forwarded-Encrypted: i=1; AJvYcCVSX83FZmXQo4ys2mzpCEbOlmlJH1NJx6G1srFyr8KTTgXeR2zUPi/lFBrAlvq8CaR2bM4qKDFkG5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxNWP+M7SIMFpWvaKR+nX/DTVxjMfdoaJteRGCKlkYUBhwnmuS
	5bB79nJ+rZzepLtCSSbxY100pz1W6RBj8xreyM5Fmy84fQZ51lPv7lrfex4xUwHbJqIpZbvW8mk
	jv9UDCW3VsH8H3MC2+PB2Ab/VOLrrIabDz1FBZ8Kf0WLWoTNEBKV+C7v3MR9YBeWJNvCVBGF8OM
	iS/pTlGQ1/YkE2L9RkG0jweG7dPEdgN1oBSnt9CHYFWXcRB25zPhpI
X-Gm-Gg: ASbGnctfqu1E5VNfXmB3vaMmf1oWzdYZ0a45yFqP8FrFjWbpC+Un/7bZkjQHsvFjE36
	bOvITQNuaP1WyRMdmLH6ZSj0KvJrzif1aHBxKpbdtAWfOASfWJrlZSy1mCz5IuQdlNbKX7IiA8W
	aKHAo0xZtoWNvp1uKLiekrAOywPjbFJ29UsPdTAEoirRMSwotJWa/owxzahU0VQjvKKraW8K09n
	71dYCe1GgKdzRTmHv+aM4Ge
X-Received: by 2002:a05:6102:2ac1:b0:51c:77b:297c with SMTP id ada2fe7eead31-5e1de272e7fmr17960292137.27.1764676631937;
        Tue, 02 Dec 2025 03:57:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6oFbglzklHeJriOP6xAgzytJ/gfJT0mG9mV3X9Lq3s/v2j/dfueEoiFj4I5mrlRMhRx9Ft68J+iG+P7rYSoA=
X-Received: by 2002:a05:6102:2ac1:b0:51c:77b:297c with SMTP id
 ada2fe7eead31-5e1de272e7fmr17960279137.27.1764676631540; Tue, 02 Dec 2025
 03:57:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com>
 <20251201122406.105045-2-aleksandr.mikhalitsyn@canonical.com> <aS2j7aaHH9quDDDL@tycho.pizza>
In-Reply-To: <aS2j7aaHH9quDDDL@tycho.pizza>
From: Aleksandr Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Date: Tue, 2 Dec 2025 12:56:59 +0100
X-Gm-Features: AWmQ_bl5oD1IEMcd-f4KwQjazSiynx5eIWIIoXNOLAcSDM5dzETVLk10ap1SwWw
Message-ID: <CAEivzxdjJRCDkBX4r8Nx4Gr1pHmt65JsrcWVpjurP3j3gOPqyQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] seccomp: remove unused argument from seccomp_do_user_notification
To: Tycho Andersen <tycho@kernel.org>
Cc: kees@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Andrei Vagin <avagin@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, =?UTF-8?Q?St=C3=A9phane_Graber?= <stgraber@stgraber.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 3:19=E2=80=AFPM Tycho Andersen <tycho@kernel.org> wr=
ote:
>
> On Mon, Dec 01, 2025 at 01:23:58PM +0100, Alexander Mikhalitsyn wrote:
> > Remove unused this_syscall argument from seccomp_do_user_notification()
> > and add kdoc for it.
>
> heh, looks like this was unused since the original commit, whoops.
>
> Reviewed-by: Tycho Andersen (AMD) <tycho@kernel.org>

Added in v2. Thanks, Tycho! ;-)
