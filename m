Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B404B3368A0
	for <linux-doc@vger.kernel.org>; Sun,  5 Apr 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417762; cv=pass; b=BynIBgDSshx92ntBLqIQhxL3wJZ4SPuMqy3UziTRtE9dmrHxl3vLXDHmBkJDPdv5EfeJbvZC6QgrU6mU8JrOIvpUlvrPHbUVvCX1A+rafOLK4CjiLcmUSBiMQXlYRnMONN+3iQ0oKDcZDBTk8iMLNB2r5Iqr3vcPs2L/SB+TSw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417762; c=relaxed/simple;
	bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qme9zDZltm6sH4Ane3jCeD7sp/J2+iZUZwL2BOSvG6NMh524ZaXg2gB2H7b4kvOfZK6aRgIHXyjVfDX1TFGIYYcsKyoKDzAhyGrdI1dM+InFXR+l9Qc+GZ90/uuGD5xmhqi66HrPDsNIv0TMmL+yyjXPVqcPz+b1ciJzxsxpPMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkjwnYb5; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkjwnYb5"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2cad171900dso193622eec.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Apr 2026 12:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417758; cv=none;
        d=google.com; s=arc-20240605;
        b=ZEnS4CKSPKDTpaDtuXRHQ9TaMzg6Z/VYWbAvNtIdHlT5FrHuBtGIWljcqUDqkkXiMc
         htCUf5eStshrdxj2PXI+M+oD2eP5PJq6CR9nwSIIGNM3uBAmKsjanZBJMdG8zbnFpuNd
         7ZyjBXcdFnqBRuwWwVpPAH9bOALD8dZg3aF/6Zuy533/T5lOLJM8IUjQP/4Dq4fjKYhy
         ifAMP4EOn4549GK0MWBO/z5SMp/8e750hFrmnjrOGCeLsvNR2jsc6fgoYYr6yJHN8yrw
         MSDQjpMK24eBwpeWu7K06J4XuDmliR3v+6/PiRqSBnZh4t+o+VS6LRZbdg+cNCTwZQ9o
         /HhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        fh=khXCX9zL6EnElDZB2Oa1/2lIHY2gqkUv9lvJuZDXYtk=;
        b=SKKX4jnnm045bkd3Hprrv4PutjHyKzqEvEg7vyBzSqiPEkSxIxgdLsKCE7HheoUW29
         hDbB8REsVMKBtaBvgAn49FJME9HrJhYssZ087z36wFdmwNlG9GCLZaZUzHS2xKEERxnJ
         +MaJ67PSXW6TcSkG7auW02cDWObPSQOpeJ8SaTy4utDJAI2KEb/b6AwAxxeIK3wExPNb
         oG2CY8yqk9moEORtNLmKubhfgASpvm1QG3Tw+8Q3uh938aQdFy7Ata7gTQ1Hi/ZE2Aar
         RoY7kuIBQssMH5HvjUkgvDjx0hXqQEPCEEUgG+cCNv5gxc1J1TFD5bSmOATRzFNLUHU7
         dRhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417758; x=1776022558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=dkjwnYb5y4irn3yDwTic9/zkksmlrGlrcEaDqFrgrrBW2e5KW968xLIRMImwXpMYQR
         ecd1jPK97TvMf6XLAIWhx//UcshQ+msJ11OhHDADc70LU0IvyPC4EIhswfxfuUEFj7qI
         hWDiTqqbU8wBneTz9NyHY1zo75vOqRbvAE/x7Of1tht2oUpm13uX0Oscy9CumKxtRD/9
         u/o04DvH05qA169PQZzzB8juPZXRVgfukM9JTCUj9f2+wlsXYVP7ceiu/B6ANv6bW1tU
         KzL0BCX4ELXxYzoT7TXNvopypQdjHof5W6W3JgDpUBUqBwpEhhcENd/OGF2CaddI+TWR
         HrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417758; x=1776022558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=nt+MrV8+cUHzuGA0VW4yrvtPAUlhmQB/Iotxa/vzQARlBOsN/y5lqjzmR3W9JlUx7t
         //Y/1KRE9W6KvvHgXdf6G04T6xkp3GmPmuh4vA/17yPlxOluOKqWW8OQX/boQXUEIHj3
         S59U1ynvQgKhMU+VhIbkWvp7KSUWpq5+elpziBfQanuJYtRCJCwTNxvLXntOgOA7iQS+
         6r79AWGyx56vk2dBlAJ+oIIt0SEVAkc9CsUbmHnQx9IQGo+d2BIlymlekPh6lTz3ClXp
         6oHzhGniZMzjNoWDKwgFRVSDduJH7EyLm7BOAnbI0SyGrEUENbyaH6AmE+hldcxgNXgF
         cblA==
X-Forwarded-Encrypted: i=1; AJvYcCWoL9tEWcNK65I1S72CMCCl5EcafKkL+VhYXY67o+P+0T0OvRWOTNF95nI6wF6Kscu1y2L5dK99C8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YydZIpDn0KqjVYLZOox+wMUSAvnczQB3Efgn7pr/W6gaQy6VOh8
	TBpTr3gkPysZ5u1MomcDdZ8Pw7WUs3Mx4MGumOiGp0QC6fp6AsGv76E+k2EF+C/qkmLjhZ8RCfy
	5Aa4aQWDtYM7KWEyUbRYAEW+AIWBYAVY=
X-Gm-Gg: AeBDietmH5W63KGggqCEfEiUbOUjA0+1sEfGV9hNk2gt4HhK4eN9z4idyYc9bu5upWn
	jBSHAl7rluOP0if7iyh6GtUaLQoH9fEAg06uAsyelCcRORJVMYmb7LsBz7XgydAF06y0xn52rY+
	VON8lGWKcuyxIhLte6K3VgNjE6LXJobe9YhtK57z/Mdl8euBLEydLoV+DZRpCQ7BQIlLZVZ7PKr
	iUtinuiQ74FPZewL1puY4wn0VNUeT/IMtQWfJpOjT8nxXpkUd5LwxThdDGv6tvcTrpGPTMGAH0I
	DKQENDT9/c2ezw2jY/i2ehA8ZuN7kbevJ6qyWcFWY2s+V1J4AYGtevS3Vf5sO/FXlHNtH/AYopx
	EurtIEEb3+EuEx4DU7snVzuE=
X-Received: by 2002:a05:7300:dc88:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2cbf9afb2abmr2166610eec.2.1775417758303; Sun, 05 Apr 2026
 12:35:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
In-Reply-To: <177508434465.73816.4492182082440539007.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:35:45 +0200
X-Gm-Features: AQROBzAMmQ2fYtLyUeAFSvUDsVE_iEOg6GKNUQ48f6LlPWNoSXcMUKGWx0A_W0I
Message-ID: <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
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
> RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
> still needed there?

Yeah, that would be nice to know.

I tried on my own, and it does seem still required (at least with
those packages mentioned in the example). But perhaps a Nix user knows
of a better way to do it, anyway.

So I kept it.

By the way, I think it would be nice to have a "standard",
well-maintained `shell.nix` (or a flake or whatever is best nowadays)
in the kernel tree somewhere, i.e. one that is known to work, that
covers most tooling used in the kernel, etc.

Cheers,
Miguel
