Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A632EC09B
	for <linux-doc@vger.kernel.org>; Sun,  5 Apr 2026 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417496; cv=pass; b=Fqav0i41MerW/GC+gFEJ3F2V/2G64NrP8r7SGoe6ItcJAm6NO1K3WxG5tWMLv0gYT/SOd7XMwqL4hQgq4lPY0qpuROxCzj1wUQKKYIbAK7RgmpwR9mxLpUNgHn9yAJAVeRAbrb9LaUggZPfHmMbgs1WU8tavQ2B937DJ9uQAH8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417496; c=relaxed/simple;
	bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHa1jc3KXbXCVu5JIKhbKvDuo2/luW33/j8SQSDeG4+ZLetJBJWM3V1gcvp3ZBmwgNvsC+qlLWBaKKtiacRv6IAyiTCY/jSVDND0BvWVUBRhiDiHkABlba0UGpaz600JyjIOdvcZ1gCnI+qQavNp1g55KtiL5+QuUQKZ/1N2RWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVCEwxRe; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVCEwxRe"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bd5658b901so219888eec.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Apr 2026 12:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417495; cv=none;
        d=google.com; s=arc-20240605;
        b=b2AsHJ27q057dNlN3HMSy/Gb0/CwGq2KJreDAXcItoPdKtvGQ/285z5xt8PKdIsq2s
         rSfCDXjI9pq6mLX9LQUtvFRyarCYjY737kXJzGxKyaNmOhdTqwV412SG1HhHBlMzgZJU
         yGXXn8+FKfpfVCHCdQWl++FKRm+l93uwcXlEHCeHVo8+Rjpjwn/OzHS9/xtepWpl4GBu
         ATgTYKr4q09MqgL914nZyXGH7+kUmuSCVwqiaQCUwHhqU889ffPviVToZSUCtn9BZdaY
         giTZ923Epcpql7Kj4q06xTwATF64UlFJfuV/4K/N+T1zrGM4250whWDCv83fVKKD9udF
         G0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        fh=D16tYtOUroBHkCaCQHcu4hNdUnQ3pG6W9J7FJLNnab4=;
        b=QVQomTo7El0MwTB1kRH1tYeb2+uplnM+IKGvlhbmXiE760F9WOieRTm1Iu92Fb6l8C
         ND84J4pNVagW7dCV3RHpeYkz4M4WCIvAtkks+iIAxhmDMdH/rDduYZ7/8hBlpPrSY7a4
         65uXLZcrLtZ9r3XoURmVqE79oheBGI9B/aYxPfSCI+3Fti++JXEP6RtYt17ERKPqokJs
         ONE4nkP+11IU5LZW1dBeuMl8YZctpQPJR6uaWij+yrXSlp97bljdUVogxJEQJRFgbU1s
         ZWMXZ5M9IE726bBpJiqAyBhZqn3iVGxcRhCYD4KknpZgs3DXPxa6LhaVFkmWUbi63BYa
         GODg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417495; x=1776022295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=lVCEwxReXi9mN7cmASayUr5PgOSdAvJhNeYBKcnYoLBzpIgT0TuwJ/Jk3k0JnGksn9
         LPLA3K3hqKAwZ1+Gu0W8fbUQE7/Wf/eIofzPngWRiYCxfRQ15HFeQRREpXcs19Fk93cS
         AtImrKZrFpPYme34oYo9XVkw75r/UkbvOYlYg1wBNtM3FO5qvq/+NCimsomC8oVNMQhG
         HJ4hnag0EWFRXm2UKFVOIWvh0vo0JDsJ36HGzINS6PP6/p0hnFvfoxrEyp/yKoUdQ2S1
         2aCnEvsZed/qapAswjf3R0CCMMgGqiQy+yh4skj1F+RIiBGvxzcCT1hKH5CAfAiCX/cX
         XvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417495; x=1776022295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=Y6BSIogcYJi+5QAqJBb9mGmXume1eRocMtib1BpVACYAdQlrXLpBAbTX6bSgWDDaQo
         TMl3tLmagKxzsd8Psn77AE18auXL2Cz/buxyx3mCYOmd1NlK2WZdIHBEaoBmF9QURTgq
         M5V3oQjEFBS3Wl33izQdfN6j9slAzKOc5hCyXjXLpkOGo1MtpvmvzhipNyB/kfaayjC/
         bx4c5gRA9wxVOwtM9ojotayY7s2pZEEGaZ53m3zc1nfS797LQXeCYjgDk1ykGpm2SabL
         4C4DwJl3//jnm9IT0Yt0+SSyINca2uf0HXi6dniDvjkkaeD2nqTmIIlDFrJQWXWaDu95
         J/mw==
X-Forwarded-Encrypted: i=1; AJvYcCXhHb308FRIUJvD7HJRir3iWiIftALk1W2W95FNYUPVvwBOT9ulPBSr2sp6Vd73IO2jkEuOG8KObSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUNjuKRsuCoXi+96dHZVMyMEp1BX0fwstmg1wnQ5PUXp32Yczt
	UqhWkHZuQQtIuNx3DeeKis2uisPBc5cZRXCJMZQjc+XXhKFWVf2Oq7FFQzthZ/BghYVq8BzEfLI
	h06e0JVONXqrTrBfQOJUQQHV3XdT0yqc=
X-Gm-Gg: AeBDietvM3GrGjWD3pOF0jjnTaX7tvSqrAXwMX38nWnD5q7pQ8BYZuBdVXUWeBOrw68
	LQx/DqxenojHBSfXE8fXwTl95GRAPMuNL/LfB6gA8558rEePkz9NgCvGau7gVw+hkvOVrRmezT6
	D5SctX5wAB4NxyDtUMi6AVfx9Ma18+nMqROK5m++dofBE9yzmuH6FPD7V6rKle/rLizTvNFA0dG
	OEDJchD2rbg9wUZfjSQKhbw+6RQZmSzIBUMBScX1xD1bE/u01I6SSgd8VpZW4CdcswJCWsfZwn3
	0Iry9moQaad+R1sijgMyypPFYweaHEITXe8mdc3ihOfGUnumh83WSbD8q8Tk3U0QnlHiiY18GRj
	h+wYlVBJn6Fd86z81gAExHqI=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr2476120eec.7.1775417494698; Sun, 05 Apr 2026
 12:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-12-ojeda@kernel.org>
 <177508434445.73816.7873322235592463050.b4-review@b4>
In-Reply-To: <177508434445.73816.7873322235592463050.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:22 +0200
X-Gm-Features: AQROBzAFcfOg6EKctMXZNeC0mwP27xs6Xk4PYTGLQOlXdHdfwi1d9GtE-fAbfxA
Message-ID: <CANiq72k1U0JacHf9rEVhOMmeZ4szCPBhbfLxC1K_0a0cQPw6HA@mail.gmail.com>
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
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

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> This description is inconsistent with the previous one which had
> citations for both the feature (function in this case) and the feature
> in which it became stable (available in this case). I don't prefer
> either style in particular, just that things are consistent.

Sure, I added a couple references. I think it is good to be consistent
(well, at least within a patch series, but I wouldn't say no to more
information even if it is inconsistent sometimes, especially across
different patch series, since everyone writes messages a bit
differently...).

Cheers,
Miguel
