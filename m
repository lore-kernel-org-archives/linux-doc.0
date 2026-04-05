Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7716C3002B6
	for <linux-doc@vger.kernel.org>; Sun,  5 Apr 2026 19:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417532; cv=pass; b=d6RLXzmfwI+W+aP50zSA0518yfQi2Hsrd4+rB9n2pbagDvfOtCLqY+/esM1gL7YzROfXeK/ixtSiSnqVScTVlrYHIPwfz/uJkh+19meaiDZMcv2jJN++yFUcwy9h6N9rGRCFSC33hTeKHlShWwPZn3SHvh+hEPh2dVwsYE+ojS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417532; c=relaxed/simple;
	bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibJi6wG2biVLBi/aO1FzsJALsiF9EocS9+tEXzxLMx37TMt0VjYuXS9L38H7LwfZphv1Kj1JjGgGIvAV0c5/Pt/x26cHADHP89aXKqWvI9g+KpHGgu7vThooC6C21pJ6t9qce6Uo64AQkm/U5HROErxwGnozEzw/3L++ufAdInY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jM4E3kMD; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jM4E3kMD"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b8095668ebso238005eec.2
        for <linux-doc@vger.kernel.org>; Sun, 05 Apr 2026 12:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417530; cv=none;
        d=google.com; s=arc-20240605;
        b=b0REn1APNNJrl3EjTFCoTJK5et5CgDOT7vfKAaIwB6csQgTvRk1fk+YE2Fc7UM0dAL
         Ee23rVYAQWJEqM/H5KJ24+lbLeWxB9s0O0/srtzSjXTOPKUbebnDU1b5I3JOa9IcsYAG
         xt30eTM9Qh4uZ19iYHPcNgmeWWhCDj3QylTPY6x3zxA3l/3tyNVTH/m3jk2Z2UrIwKWz
         R/kZv7RF6zySsB8cdsv/XsLP0dDXeLLnyBPrEDjXwv9Fx2eeuy7qjIGh0gu5BXBSrLL2
         +anAAhW73vZIP57zY2ACog9e7U5nEq1VQVyHSIFuxL9klPrlnvBUtuClMethfFou3SFA
         2SEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        fh=6kzk0Goz03yVfWXow2OuCTDlMvSH9sv5twYRRADG8nE=;
        b=AH+nY96mNHsW5ZfsBOeIteDs0a1xBJdQ37mAJrJweMkRqQm9+21CaRyTW4MMOt/Dd4
         N7C8E7JXHSKBIg8/z7JYIQnlqE9kz+JehGjJl6F6NHWVT6fmZByasDLgMs50D7qtu1PT
         RC4rgD73CF3f17pJp8qVNiZ3pzRJbNFvZUK2y4fBhPjor/D9xdvRRuQsP8Md/jrPCEen
         AGjcXlJO3TOFlLNgqrd/J9QSQah5WoYrOwlzZVgejVvQw/2I2cH0YrmDxlRWlBc/ek32
         hzfWchlXhMlJHntGCisamqy813FKhmiNYsNrQlOX011IDgspGNfXbjlsX3Ux60C3oCop
         o80Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417530; x=1776022330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=jM4E3kMDqms8VNJHv8kbVSfyTEZTTKjtGooGApmTiF9/nl06mKbaW4l5qIrYswnwpT
         Kh+4uqPBEQCls44ciwK6q97c6RKkdhRDyH18GzzB3vo2S/H+Keo9XO7noiMkDp0chNkY
         oVvPX4x6uk8b0yagBZvRgeuVx38qA85crjHfPf+OpMXap5ch23Cu2O9SIacAvShK4RSI
         v/5nvGmWcIZ9XLN9XSXX/rtp3Z/xvyPg/yADjrkoUeFg7nDBaSirxtRcasaRJz6mxvND
         Zu5NAABnzR6ScrYjUxhifSEHfR1D8AOj53N9+osYsUGSSV8LyJ8h58n2OY765I7uh+ho
         g+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417530; x=1776022330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=JqrbEqqFiJxDYOEieush4bETGRMBgDNPDNyCvORzgLxZAai8Dxp7hYeA359VY/jHnz
         3WwaA0u20rx/jD0iAkWTCiI7MRBw7r9ypQkIhUjYQ5eVOZ2NzDcNg5rJuFOCB0x2IgRE
         alHVP7j54uTrxY1KszVQHleKyjVEAbEAmhL8qlc4PbvFtNvJnVgPO3uf54hiAE2tkqLo
         aNujRbpUtJgYA0c/XYH9v4aFgLLPeSU3Tm3X17UAYtWt+XqOnftyHv2RIs4q+jCHzcDQ
         0+uXrpt6nyhJkbWlFXV5vkkK/zBFC3g/EH62LkB5AHmjERmBVOzI30T86yN1fEj7KOqO
         xt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUm6wtybKR6mZPufUXqdFBoR5f8uAbxJIky8DvDDMXzmoshAPBuyBGwuz73T/dmgvADa/00b1O0ZqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFymFUNm+SYo771e5oA9OLCnCd0P1Cslk3L8U7wJBLJkVwGP65
	vJTXFQDcyzFJKgxJFUj3g4WL5KnMnJ7qU9rryD23sb3vv+CUnTA9jGV8lSEbofBRt8kKfbhq4I6
	5Kz22Jmt9CSZLRWF5QrwZPxkzvdoB6hQ=
X-Gm-Gg: AeBDietphjSnzZtMbORiF+AUhsYz+UdU22v+rpSdujq+DSQnX7d1uISt2+24h+kAG1E
	1hwv8/xuF22Xv5aHyi0f30V/2NoBG0KJ463RkxKF6al5EZtgOfQJSQkV5SQtGU40iNmOabYVSAv
	Y+UJM3RE3NzjEjbOrVH8t8A6GOJar0okii/nW+9FelvtL51a45DmkuqOgUzem3KY1DLd5RoksO9
	wBiyfzrD7B+VEo7Uk1tbvXUqkJS7Fl43Ozmt3fRlPh0khlcLR2JJ2+yGw0Fc0Iu86rSBThCRq+Q
	418kUuT18ErLeaA9Khzbdok/mxFk74lfESSzPawPStTXyfdeWsW8VLFDyR9g1dUyiZ0CSczHHgD
	jki3yNDjV23sYSenJ1AiE9O8=
X-Received: by 2002:a05:7300:cd86:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2cbfc768bbdmr2210515eec.5.1775417529556; Sun, 05 Apr 2026
 12:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-21-ojeda@kernel.org>
 <177508434460.73816.4231801886718165891.b4-review@b4>
In-Reply-To: <177508434460.73816.4231801886718165891.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:57 +0200
X-Gm-Features: AQROBzDsQvgh2EDKUg3LiGNTUf-8TUQBnEeLR3UEGt8KzpEPnOxtdZC7xsmuU3c
Message-ID: <CANiq72m9bsXZnMJv2w9eszV5DGUG1Cq0NCEUqv60=4Op__Uong@mail.gmail.com>
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> How about ordering this, the previous patch, and the next patch ahead of
> the version bump to avoid the need to mention it here?

That is reasonable, yeah.

Cheers,
Miguel
