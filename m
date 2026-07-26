Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E9317170;
	Sun, 26 Jul 2026 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785058916; cv=none; b=LmzGsEZaJeboAosauGmDhPWO3nPSf7l+t19YmPO78kNq19soEmb4XRUfvp1D77+Jegigs0fei5pu/C9ZATJNPKEDaWnTW7bq1ow4weVwWo19JHvfA9YIx2MpScQHnQRDL3wD+f2XC65mhFZJWJPQJVCA1XLNxt4ogaioo8f+FTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785058916; c=relaxed/simple;
	bh=uahim3CQnD+tbPNVcHXBOfufSRkOtMrCPp34U+c3E8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z3L8WF8jfhmg8yzltA3KcxsEeJ5d1lKaiH9Pr/D1cOd6L4HDF6vfyBgAS5G/R9d1TrFTrsvpvDwQImC3OtCZznZTBcPyQdJLLkcyDxr0RTJ2/qCvjVGkOnkxsdo5DIpDT8FaeZLETQQ0vPwUV01pO3hUjDtxIMl0aKrEDcrvXMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=LLlx9zQ7; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=Y6huujOJ; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="LLlx9zQ7";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="Y6huujOJ"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id B9E8F26F7658;
	Sun, 26 Jul 2026 18:41:52 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1785058913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AqDrvcQJYU6JHJR5xgYj4Qek2KouIIM8zPknxTg7/w=;
	b=LLlx9zQ7PlmFqWJJogjoHvNwxCfYSmNH/4cgtYFa8L9T6ZFJiZhcn7V4QVdZaQ0SUTpmoL
	mO4ni3EsaG/ThXdsktDok9zNWwbCkq6m2si3v/9X+XK+Hnz65jLSivzrU5MeU+G5edjxEH
	WDJPD6HJUWXs49zq0KnnKcem5rMNx0QBNSzPksDIxs8kOEwM4E2d49rZmtWuWiOv08pkFt
	ZcdT+bdZC/Na5glMMWd2gE9plV9KRLGNMzAyqSBP4IhYHQN/Zy4pzNCsA4kx0UdRAYJ3m/
	BN7gFr+l9I6iGhw9voLsfII2JhFgTXKjJ8KIXOacyjKsX4bu5w1FDMDWrAeYIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1785058913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5AqDrvcQJYU6JHJR5xgYj4Qek2KouIIM8zPknxTg7/w=;
	b=Y6huujOJHTsJeQ4zDQjXPaTOzvgBvTrVuBSTxnc448OBwRj57VxRyaS8cG/9odiboZlcVW
	fyKbzc1mtoy6VBCg==
Received: from devron.myhome.or.jp (devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (Postfix) with ESMTPS id 4BC63E00A8B;
	Sun, 26 Jul 2026 18:41:52 +0900 (JST)
Received: by devron.myhome.or.jp (Postfix, from userid 1000)
	id 4319A2200086; Sun, 26 Jul 2026 18:41:52 +0900 (JST)
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: shaikh kamaluddin <shaikhkamal2012@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: filesystems: vfat: fix 'whic' spelling
In-Reply-To: <amXU4Kkcj7tjh8Jl@acer-nitro-anv15-41>
References: <20260726064948.20557-1-shaikhkamal2012@gmail.com>
	<87qzkqgnj5.fsf@mail.parknet.co.jp>
	<amXU4Kkcj7tjh8Jl@acer-nitro-anv15-41>
Date: Sun, 26 Jul 2026 18:41:52 +0900
Message-ID: <87v7a284v3.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

shaikh kamaluddin <shaikhkamal2012@gmail.com> writes:

>> > diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesy=
stems/vfat.rst
>> > index b289c4449cd0..f408699ce50f 100644
>> > --- a/Documentation/filesystems/vfat.rst
>> > +++ b/Documentation/filesystems/vfat.rst
>> > @@ -361,7 +361,7 @@ the following:
>> >=20=20
>> >                  <proceeding files...>
>> >                  <slot #3, id =3D 0x43, characters =3D "h is long">
>> > -                <slot #2, id =3D 0x02, characters =3D "xtension whic">
>> > +                <slot #2, id =3D 0x02, characters =3D "xtension which=
">
>> >                  <slot #1, id =3D 0x01, characters =3D "My Big File.E">
>> >                  <directory entry, name =3D "MYBIGFIL.EXT">
>>=20
>> --=20
>> OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
>
> Hi,
>
> Please drop this patch =E2=80=94 I got it wrong. The "whic" here is
> intentional: each LFN slot holds 13 characters, and the word
> "which" is deliberately split across slot #2 ("xtension whic")
> and slot #3 ("h is long"). The concatenated name is
> "My Big File.Extension which is long".
>
> My change makes slot #2 fourteen characters and would render the
> example incorrect. Sorry for the noise, and thanks for the ack =E2=80=94
> but it shouldn't be applied.

Thanks for telling.
--=20
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
