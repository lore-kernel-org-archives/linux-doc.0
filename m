Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624C73EAC6D
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138217; cv=none; b=YrcDqWfvfQ054xXh1mHgc8pQ+0p14A2NjHeS01sRELh6iXrRu/ppeLm+G3lxelTLSWz6FjmcDWlMv10gvxSaTCX7tUFZjijCbNQYRn8MXDN51nKaso7NtGRDALAY8Z5+14ekc3bEhNk7MPVjPGdEel/2bmG4GnI7r0baUm/IdpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138217; c=relaxed/simple;
	bh=qat2wW/S5sFfMSSYogUhfOa5HM/fpcWvQmY3H0cHrvw=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=SwOwqKJjEg2DrwqVYcpIHg1d1xlnFdG4iTfwlwO6iC/YSdXZSdSL+A1nBIqEpgY8xFhWYZ9cyc0SblX9KWIs7924u/NIujQuAlUyoZbciz7FKyqItbLS+UjXf9xJ21/Q3HN1IfJ005t5taNwjrKx+Knxg+Fx2bAY4qqSJapePG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b=k4LrZ9CK; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20251104.gappssmtp.com header.i=@amacapital-net.20251104.gappssmtp.com header.b="k4LrZ9CK"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81f36179d72so27519407b3.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 00:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20251104.gappssmtp.com; s=20251104; t=1785138215; x=1785743015; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRtQsepgOz3Ez2KnqaflKAVM3t8o2/GIA2QttRFCrNQ=;
        b=k4LrZ9CK/RNNcTiT1HMgqlsksX6bTsKa6a7d24DQY+T2y3cGfvkrwYvmmsirSZkr6f
         uRWYAxFxo2R3XwgfWuF5YP+39oHwTVJspshvMHtDTppSRWxuSyQ7X6eyGf0PcrOE60Bo
         YMDEQ6X5w8/ibRK81p8SfaeF8dVq/lPI14jvEqZNIvi9Wh1bJc+ygOU6kbhB7TTwXiSQ
         cOTUv3tdz9St78lFpBljK7G9f7jq9Iza/Xp2WbskxsQtlK5eVq+9T1c87kFysbfw44JG
         JkM6Cu4DXdQGy509QratwAGOJ9sE3JFv2/uC97Ol2mPKXDZjELhNxVPeZ9O1g+0nMwt/
         snfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138215; x=1785743015;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRtQsepgOz3Ez2KnqaflKAVM3t8o2/GIA2QttRFCrNQ=;
        b=jvmI1+EwBEs43gSBQS/nt88ooIB9f8p08ncwuRZmPVdnX5pay0L3Tq2iJm6w+M2Hmr
         EN+B/exoQxwFiMzZh1CO5xoNjMzINXozzxMfqR2duKbIOnH++pcWOezegIT21swlRU+K
         UW0MpHjqk0s9GKTeBGv2xShXPZNWuPa6ETcT3DU/Icc6T2sEv+/pDySCa8OJ5jLfJCup
         xFMOgt84sdj+u5fyunN05zekgqQsVji5cJQwGaR0lejiniDWwt6h/iRVvGWwLfOLAa2J
         HU4XYciFkISkMKh6bwG+M8hZ3XpKv8dci28oSbI+MWtjEAhXiD+5Ra6Xdjhgt4816NbL
         H2eA==
X-Forwarded-Encrypted: i=1; AHgh+RomaxFpcBsK4nuaAMKVkQtfeixYRg25U0d3Cmwi9yJ5o1l31TUWGuKmyrsHyOEErcEGRUzbFT07bPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6wUabWE5YlgfgD/baH7TRVKtZZKk1tTrJRank2B0LpTzCvoLy
	QuXy38U1lv6LWVBjBF0vicY+wLHLMkhl7llJE9f9xkuNBV8f/Gw+zXD/L5TM5BDmdg==
X-Gm-Gg: AR+sD12fkdjAJR2ooa6x2fqVoQTtXNOCBF30lQfKvxLgMsQmzI+kBxH1KfMzLb9ki5N
	j9HRzd3XPF4w8MK/tH35elBBXw+33cgs34tVILDk2x7pFty7a7JDqLxFlWore3uKJkAVugLRtK0
	RGV7pH3z5XHXI9e+BMGAkNe4dsO43vbiVUhfQhuYv+lX2Niioqgr0TixdD1qpA7obNl2WfhKr2v
	I/LGOqYIcIH6iPcb7+Luf7SueiIeuYycqgM2XoiFnkaWrMEmBuGKM0Z4HkwOje8cmFoFCFDT3lm
	WTaYRJW24TOV/7FecOHoO6qfh/TFNaO8FW3Yx1EkOiro6u3cYFIjKysZjEDEEAwjUaqMHvqjHJE
	4+ttHFUS4V8Y1HvkYfan50O97Lxm0f7v2DVzZc6FZt+jRZf6HKXvKkGAhBb14LaJU0xsRoklTwK
	vZIK5xKXoJ7SEQExkZ8ZRv
X-Received: by 2002:a05:690c:6704:b0:81d:5155:213b with SMTP id 00721157ae682-81f69cd5a48mr24289417b3.14.1785138215197;
        Mon, 27 Jul 2026 00:43:35 -0700 (PDT)
Received: from smtpclient.apple ([150.228.3.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657bfddcsm28229997b3.18.2026.07.27.00.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:43:33 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RFC 4/7] fs: support FD_FAILFS_ROOT in fchroot()
Date: Mon, 27 Jul 2026 09:42:25 +0200
Message-Id: <ABB3CF80-5F05-4279-8E0F-73A21E6B9DDA@amacapital.net>
References: <09b4735f-c04e-40f3-a7f5-254b7918fbfd@app.fastmail.com>
Cc: Andy Lutomirski <luto@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jann Horn <jannh@google.com>, linux-api <linux-api@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>,
 Farid Zakaria <farid.m.zakaria@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc <linux-doc@vger.kernel.org>
In-Reply-To: <09b4735f-c04e-40f3-a7f5-254b7918fbfd@app.fastmail.com>
To: John Ericson <mail@johnericson.me>
X-Mailer: iPhone Mail (23F77)



> On Jul 27, 2026, at 5:30=E2=80=AFAM, John Ericson <mail@johnericson.me> wr=
ote:
>=20
> =EF=BB=BFVery happy to see this patch series appear; thanks Christian!
>=20
> Also happy with where this specific thread is going. I will just add
> that an additional flag in fs_struct to force RESOLVE_BENEATH in *all* pat=
h
> lookup would also be nice. The combination of:
>=20
> root =3D pwd =3D failfs;
> chroot_locked =3D false;
> always_resolve_beneath =3D true;
>=20
> goes along way to getting Capsicum's "capability mode".

One thing I dislike about this is that it=E2=80=99s (approximately) a task m=
ode. Why should an fd representing a capability represent one capability (a s=
ubtree) to one task but a different capability (dotdot) in a different task?=
  Do we need to prevent unsharing a userns if this bit is set?   Do we want t=
o have to worry about any task that could potentially SCM_RIGHTS and fd to a=
 task without that bit set? I prefer beneathness being an OFD property.

Note that the obvious giant holes in capsicum-without-a-mode (root and cwd) a=
nd their respective dotdots are fixed, quite cleanly, by this current patch s=
et.

I also think it=E2=80=99s a bit of an ancient mistake that paths like /.. wo=
rk at all instead of generating errors. Maybe a future beneath-only fd could=
 also disallow trying to dotdot past the root, even for symlinks that contai=
n dotdots.  This isn=E2=80=99t just an aesthetic thing - if I have ~/foo/bar=
 being a symlink to ../bar, I think it would be a mistake for a beneath-only=
 OFD to ~/foo to have =E2=80=9Cbar=E2=80=9D resolve successfully to the wron=
g place.

> Then we just
> need to figure out things like more capabilities for directory file
> descriptors per Andy's brainstorming thread thread (which I ought to get
> to replying to).
>=20
> John
>=20
