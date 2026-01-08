Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A12A48AE34
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 14:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881421; cv=none; b=Uvnu3H/nzQqd2UavnJSA31KmXfnEwldbdiJk3JY8F6O+n0iGrjX/PngqRE1Grnv93O91O+DTw0oAcV/5OGYsyCgmhD05upXf7gi5pT6/0H4VywTrUA6Y/H1gw7lK4ZAobh9gJr7/hJuPae7eet15ZJHlvIUKFLzpPcaohKqzAIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881421; c=relaxed/simple;
	bh=j3o37ljvU8WW3JLmg4pFonRiNxJi7xTRwgos4PfkORA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FOSts2gdJy1BKyq4h4VRQfV0g7aGnM+vZu67dkT4L/XBAH2/C4ewwnLqBfJsE1jIYcynk1s2BTLzqVpDMQAUdDP0J2vjiqFpuZBVp7USJXxh5YY+0z9Y7QzZB2VSL5JU1qvzXHIVov3eTbRrLx4eOBwZx/i0RAGy1m4pM9+4zqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpeA1Jns; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpeA1Jns"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-122008e73c7so54096c88.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 06:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767881419; x=1768486219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7jDvUFCjfFtmadOVjljTYdbYZqDf8COd2PlPO/Cyo0=;
        b=cpeA1JnsKQUknZFaVdON2sr7SjXjkEBc7nMnIArN5iF1m/flAOnokYI68BAfjrDe2Y
         6ngLp1c92vrcFBrWycvdpYDEA2DYQqHuRg7CY2BUdrb0lcDkRt0Ac9CLJZgdkR0kjlN8
         +Ww6zafbb9eVrvuMUmWN6Cd/liR0cGMoQlbE6ZlnG4SQLoDIgL1x/oF7XJINpZccoNfR
         RJgWlBaUVTcHiGmjQWvfLtaNNZTx5pySrf6UB/XowLYxeVbmTr+Dpuf35piJ0Gikvgk8
         EtUWd09e7jFlEp9UaMZJ5O+f1zjvfZrqZAjBf0ru85glge9ESAVOtsy3yAucgIxnFL/4
         WTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881419; x=1768486219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f7jDvUFCjfFtmadOVjljTYdbYZqDf8COd2PlPO/Cyo0=;
        b=dlILL7XJ9TSoU+zwLQHYotj0OwIhR1kGollUNaG0hSp0L5T3EWSgPhfQ3GPVxdE5j/
         WWMuMv24wuklnf1k7sZFV0FxlfgYlgVAXUHuUGyVXjEKz57RkBQdJRw+8unW2U3xK7k2
         EvM0LVV22qRSaoSjVF3vQmYN/Ga+ZAXjP0Ih0sp6k3lScXWRR2ItJbYMneYdANRo8LG6
         JlkBqnFcEwSl6XQmAmF5or7H9QV6bZQ4WCjTNUodZkgaOZZuepVPJZfiDPISxUQIkVnp
         BLukaRnLbRzFoUc4lrESAHgt6Wa2Lwk0WI0dnz3K+26pQZbW2K6NrhhJAouUx7j80McM
         ymcg==
X-Forwarded-Encrypted: i=1; AJvYcCXSj6PDHdpn9gDI1NL2jhti0WX+ETXDMnhbOyFaXOE3U9GYh8FOeQrL9i3S0LoMEwgAMeZEH3fuiDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRRR3D/YIZ5BoR7peRW8K84HmvAtPzLs2SmEPShF+ocgVSfAZ0
	r6WsokwdvhCw9XG9qVyNiLQwGMEvAejZ6GQrSq2yfFWbqy4TQVHqdRKw9VGclc8rdc7uPs1V/k8
	MbFXK9FlxaJEm8Q2gYwMM810KdiuI3hM=
X-Gm-Gg: AY/fxX5eqkGakqUIMTIMr9ScYq6wtf+KgdE+NnqpabHBFGtvD6lJnyC7xz5+3v/PDDg
	8GgeiD6V8HEaDvbs+ydsHROoYAo2nro8RvAEECnYny7zs7lFjkO3n5LReUY/5YBHe9Wesf9oeRf
	nXaS4T3cwDIP+wxnmSa0GJaBRGkCkyX/2Akqf4rLZicIum7wEVuBfw0KSSp2hg6GG0rvjd9cb8K
	jPOXKNe1KdbRSHIPOXqFq3XgPFNVkicWTmpievQ2Nfb8d7qAJivTHmzL5VEKdPhBeiCwj1k+bWJ
	hFCajRZSRQNLwdcVWOJhPZWGxOxapNm07HZqM7gpfT7PfCSAuprDQcD5axEX/kZ0J9/E54pnWRx
	A1SVaL8eGAAfb
X-Google-Smtp-Source: AGHT+IHNeMjlzueJHkJLbN74lNQFyQb0gOywPBPdlNCJT8fAFTRMjn3wgKYlbOnJAnxGIEInLPyC5bkUa1Vxsxwj5dc=
X-Received: by 2002:a05:7300:dd0c:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b17d30fd2fmr1936203eec.5.1767881419200; Thu, 08 Jan 2026
 06:10:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70@gmail.com>
In-Reply-To: <20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 15:10:06 +0100
X-Gm-Features: AQt7F2q2cgHdJNNgrL6_JC_APYg1zxqroIvS3FffCSeaIG9gIAOBm2Oruoyww_Y
Message-ID: <CANiq72k7_Vys-UxF=34eouu=CquaTXcb=jMiTwVb8mhP=SGEYw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/kbuild: Document gendwarfksyms build dependencies
To: linjh22s@gmail.com
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 9:45=E2=80=AFAM Jihan LIN via B4 Relay
<devnull+linjh22s.gmail.com@kernel.org> wrote:
>
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")

Not sure if this is meant to be a fix or not; but if it is, then Cc:
stable should be considered since that commit is in an LTS and a
Stable kernel.

> +Dependencies
> +-----

Shouldn't this be the full length?

> +    sudo pacman --needed -S zlib libelf

I think these are supposed to be a tab (at least this file uses that)..

Also, Cc'ing linux-modules@vger.kernel.org as per the "GENDWARFKSYMS"
entry in `MAINTAINERS`.

I hope that helps!

Cheers,
Miguel
