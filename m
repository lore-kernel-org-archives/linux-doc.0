Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44049CF46
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193983; cv=pass; b=TKX7f0/AQee0lei7vx5Y7I+R70Z1b8raCgGmN0ZJvXSmcZhzh0kNUZppOLddHmSEhGkhHrj66siQ7n3FjuJXPnSYBYmSQJvTsn2GYOBEGEGkO1+5fCX8Exq1ix5IBRa9OShSyjjNq7c5ttihCY6PbftPyebTfh6BAJhuK1Z9E3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193983; c=relaxed/simple;
	bh=WAb2HioeKt8yQ4+e2mWpoQ1jc7oIFNQVMnrcZ1VNVk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/CAcnW9ceMApQDT2W3nBAdbr2c/zpiia6q74hO/VUBRRMLNts97W1e4u6LOVDVmH+bTmxfxUdE0fvCFdUNSOOHGx/NMvv8VZGgJP0ZKXoslVI246jhI/ZioYbW+F/FzTrz4s1A5WELxwVT558+kduyvpPCcyVreQQpXDQ+gI9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=refBrwGZ; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="refBrwGZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d906cf83b2so2114945ad.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 09:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788193981; cv=none;
        d=google.com; s=arc-20260327;
        b=BQtjnKhHZ6EyxEsJjKJjgnI/+UkE73LKgWv1Ah2wSGlAGjj5XuAkSy0KEy4HsSc6xg
         7YQyoQYPZwbOxleYAjiaB8pgyQzYtuBj1AxEmAtGD9IRWcWofUCS0F8ZpwsdpM4keXFb
         /YCrJI0m6JTqRHrJpZJUR3x61/e86Mc9Y3sUaBdtpGvJ0p0loqdLyI/fIsNo+xqFgyW0
         m6sd4lZgNTiaC41t7SpZfG/kZMMGfJ+uqJfeGDxQGSPvYyVYlGQqFBc2itLLRdDgTF54
         /ZSk+8/RNMCXPXAnIP920fk369NOhTY7SyjaVRCfXDDDTPiwQ0qetX1bCiRVIRGDHWFa
         aDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        fh=LR3jIo4fX/DYgGJlW5qcucIykf1m+pLeUjsc8Mh0Ntg=;
        b=VmK6YBOl04AzdU2XVu8iM35cWoHgS2mkQEWeh6zGfgScvkPzNk7pBIunzX6vRN/SrF
         b0kteQ7iB8ociE0XdGzpbMQQe0NUGjjF/TLILZMZ9jghGnIn66bRsvEETGRQBhfgPyoW
         X1X/Hev9fa/CxwNBHmEhlwiyFfai5yGEv7EeDhNqp7IrgUdyZJmFKBxkFyprG6YabErc
         NIhUTfh7AL05qvw1iogtobO9Q8SsAOcDrNYISP2Vy+P9htaaA5/Lqs5XAeOmJOMll6zf
         1kQv+4DX3z3ROloqCZkO8a/BN1RS1qm+L83wavvY8ha8YeLoKOXUDfFWSBMw0rjlATW4
         UQYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788193981; x=1788798781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=refBrwGZujpvTpihy/NZH9EfEJJVQmjGZhkmcPyHkrJnQJ4uxgMRAQ9qdfAmyXc03L
         LstKISwlWnno/B83pwbIRnUCpigRdbTki/T8o4RL0DdE1mBNwkYNrwXIWkrQZ+S9+hCB
         UNdkFis7VHdX0p4bOSIFoIhPK0E8qrTrv30nvRPTzN1A4fJSUlvLDQzUWVojRbyj4oV1
         Mste31TatK15L0BlxNuCEGPhA8sNxxbmaTrjPTdJBAMEKpm1ncqMeMjRg8oCVYtHZrC6
         qGn/Zx3v/TECkieM3oZCrNErFrlwDqzajUw7EmZPLT4TMWHiJYlTF69pnx9q6XmOqawM
         Zn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193981; x=1788798781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=FainbBe82alkvUALuwU9i9/DqQYtSKiR7VwqoRbtdLS6TmsYvT7z70gY9kRR06cPK9
         UzQZ1MyJ77HP5fMc6FMHUSq3ouJ1j8av8aWihMw4qu5wzzWvTyjiOyxtHhW0/Nxmanf1
         I3fuQ8ARe9qsMop2ibmHFhrL0C3QHj2V0UfbI9lgnoXxqrDOuD1Zbl7M90ch7IFrEu3V
         35m3R82wCz49WpnVu+ivL6Ce2KEPhcV6OM1SUs1cqUyUAXuKYb8Ph51yvzskUtuPI4GI
         K8ltdZvW1XOVsxZ9zMlX/1D+ALblfhK0CbCNV8GVdnj5A8qcLQRHePJCnE4QE2xt3Vll
         b7xA==
X-Forwarded-Encrypted: i=1; AKwUvBy0Xm05dodxbFg+I8sI16ljuxUhJtUenLzIpsV3kEIAyU3DVAr8Hha5okbjoa46GptaSvzD4Kd2f2M=@vger.kernel.org
X-Gm-Message-State: AFuF++kfkD3XoUB5J6qgkirIoTlLUL9XOy4ItodYz9MXMLoDjZKVE5MH
	iJx+l1V4hfQmf3wly6jyX/0qK0/0gt0GVvoDTArk4Ioy2ZUvZInnF/x/QYv7cOfPkdv91ElyqvA
	WzDeXFMbIOXHM3GrJPjuT7ubxCqYcHqc=
X-Gm-Gg: AYBFou3JnxgCTLWEGpPBPLATlOw8SUzXBScmVUKWEK3iy8KHnCxyO/ZNPjvtThtQfmv
	GNmqVgaFxfbwfgJs7ab5e/h1hIeVaItjQrHfsi5fAlHoZAwqKNSQwoyWcKGLTF4GtdTKn5PsVmj
	g2DjtuKK5mJ+RZDdrPS/tF/ix46m/VJjtfhUg9d7kWt1Jw0+henZToWQ6Gb0LfLviS0l/BZDcmO
	hDkFZDQhgTOeqepxiGbPLG+Ul0dkvROmivSSSUI1nxeegHEx1vsDR2Tjc4zpsZh4mGkonUJKE/c
	aLntIQi/FO2eB+u4gjKc1LL3ktLurxLV7sfni08uPATJJyGP2cOsMSpMfNGq+TQCSkUlVCH32hw
	y0xMat1yRgpjuMaq5j21gcZB6S4Bujye8Y/QDoVYrU+l88ge2Qi6zG0uvXTAQ
X-Received: by 2002:a17:902:c94e:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d74ce5e476mr224272585ad.0.1788193980913; Mon, 31 Aug 2026
 09:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org> <20260831152523.638881-1-manuelebnerli@mailbox.org>
In-Reply-To: <20260831152523.638881-1-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 18:32:46 +0200
X-Gm-Features: AcwNN1WxT2qUEpoESa1nnOxcvqd-4guXTylAIIzIEvrVEhydUWRkwim0NkJ623s
Message-ID: <CANiq72=TYcLdj0t2DbboS31L4BNrSg-0bRmHZe4SDnbRLeoy9g@mail.gmail.com>
Subject: Re: [PATCH] v2 Docs: changes.rst: introduce optional column
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Guillaume Tucker <gtucker@gtucker.io>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:25=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> +bindgen                0.71.1           generate Rust bindings

Should this simply say `CONFIG_RUST=3Dy` too?

> +Clang/LLVM             17.0.1           alternative to GNU C (gcc)

Should we add an equivalent one to GNU C?

> +gtags (optional)       6.6.5

It seems the patch missed this one?

> +Sphinx\ [#f1]_         3.4.3

Should the footnote be moved into the new column?

> xfsprogs               2.6.0

Is this always required? There may be others that are actually optional too=
.

Cc'ing Guillaume and Nicolas -- we were discussing Python in this thread:

  https://lore.kernel.org/all/apG3hwaPA8f7SJeI@levanger/

Thanks!

Cheers,
Miguel
