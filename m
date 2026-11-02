Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630769;
	b=r2GWz4KlRTklGq0rqLdUiH73Luk417brqbhwUs86aHzRY6T/0qFkjAQlL3927c0nn6Vs
	 nGilkzDlZRT/qgp77pRLXEPsLkRmW+O9wX0HG8sFOfgJpOKG7qA/3Dp2kBmEz3wbHAQyL
	 gxnKbBbiyAq+Z89y3zVRlJ/T2r4bL410+lJq209xIWVaU8Hinm4jbKHWTnfBB4a9HhHug
	 CbtmmSgyED0ax7fv3+ImCzhbQ38Jt3B7XuadjOUcgoFN6GqHzAl37W/sK84KMy6TAKwyA
	 SCazSAMLWiRkwL9s2BaxzwqZfzAfl/S5SnDdFGl3chXKn17FPHysAJlgWQIrF2gNdUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630769;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SUKxhHcSVcF0g92qt6uBuNHlVjf71GSFnQ9iirM2x5Q=;
	b=gYBeooRktuD+tBOJ6AP8t9QgSwP1A36/mqD8pTWVC1yZF9oQU+/5QxtlFU7KWo4ZAcLZ
	 qtmkdwcTY8XyTDmyNwgWeIeiY96w2BUpU7B3GSjyvfTtw2TzTInk00p1dBUKu4CVpYT8t
	 kUQB1ovt4KteqckTudrHYnjZvg7837lTms9hwqeCeF1asRm/i8q+z1aDLNNoDUaLp7HRv
	 jlbQyDd6A5Ki5Q6iBqKp0yMgwYgzCfUs2yB3icEUFpwn+6cY58qR7Rvpvz4nJvgMwE7Tx
	 e4EaIjtJ1FJK8mXq1cHvx1SjbgH0GcdoQWDVxbtE2BExpHa1jNJC82BcX3ZDfbH9d1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZH61THMA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99421606C57F
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZH61THMA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441B21F00A22
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 14:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630769;
	bh=SUKxhHcSVcF0g92qt6uBuNHlVjf71GSFnQ9iirM2x5Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZH61THMAGUXDu4yNcWSIC6RXVP711+HJOphOcC6zME1sWsnql6apWcnNMNESI44DR
	 DTgoDb6d3LtMnkb/LSr0e42/GLWM9Fm7e0n9EMjLibjIVLLJPdi4p7/VMU/1l0pTpr
	 uuj2LOxPkcquO9JnDzfqm/irAvwTSb6QREdTwKrnoX/U3zLMY7pMsXEFFsv+z0wEme
	 kq3yhpC6Ere9OecvB+oSM2dVXuPwFXEqknOiUxZpE5RjBK2CBZMqeXLZKF1drW9GjF
	 EKBurmF8XdoaDGeu7KuY8zvL7YYV7xOSF2xfJCYefukZOAwdJ3S3QNhfacHdRSJq15
	 R0qFgRk9oDs0A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bccecba199so2805371e87.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 06:46:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzwj9vO0e8p2/Uqmx78aiqvk6vcLiLZR969MeNl1wDEbUEZ5aOJ8qEeJbN82k4VnlZJ8K7fTGs8IAo=@vger.kernel.org
X-Gm-Message-State: APuU4Z83DHFQdlX7oaXACVt7fU98oqgMoD5Vlv7i1kjFrTirrnIyu7o2
	HDc1uQEuxU8pdixEzc/7Est4Rf87NDxMhAvxHdHQkzACo8cvB855+JtUoSo9p6uS74rDfWIy4V0
	7hTv9ECsuxe1jld02o+yew54hkwgeBz8=
X-Received: by 2002:a05:6512:2206:b0:5b4:c00d:23f3 with SMTP id
 2adb3069b0e04-5bfd9562fa0mr3369285e87.14.1793630767656; Mon, 02 Nov 2026
 06:46:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin> <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com> <87a4nrfgjm.fsf@trenco.lwn.net>
In-Reply-To: <87a4nrfgjm.fsf@trenco.lwn.net>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 2 Nov 2026 15:45:55 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hDHcN9RN743sGhhDNESz0zwVDfBOJYvfTDwQv_STq4rA@mail.gmail.com>
X-Gm-Features: AclHuK_yfyriuHj9mVCt3qFKAYV5VZ3-f7R0reYuNNLW34rpCvUM-R2wVykBLK8
Message-ID: <CAJZ5v0hDHcN9RN743sGhhDNESz0zwVDfBOJYvfTDwQv_STq4rA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Joe Perches <joe@perches.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:34=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wro=
te:
>
> "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
>
> > So it occurred to me that it might be actually better to stop sending
> > messages directly to LKML subscribers and only make it available for
> > download somewhere and as a Lore archive.
> >
> > Is there really anyone depending on receiving all of the LKML traffic e=
very day?
>
> * raises hand
>
> Some of us crazy people really do depend on it, yes.

Exceptions would be straightforward to make though I suppose.

So really my question would be how many people there are who depend on
receiving all of the LKML traffic every day via SMTP.  And I honestly
think that not everybody subscribed to it.  Probably not even 10% of
those people.

Rafael
