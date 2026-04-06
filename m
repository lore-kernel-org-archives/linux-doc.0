Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA54A07
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 00:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775434455; cv=pass; b=W0JwiyuKKVyfnWaGujbz1bl2mVu/Xbpi9CWOkK+s4i25Z6xbgXDH44wtP3YcCZkGAi+JRlfFhZQEKYJLurZCVtlg8CxUARi2GOjgwOq/9ZZHTImwKr3WW1rCvFmeYxjdM8jmpzpr1aM4uIBP7IXdc5tO8A40QVmV7Wfz39KitWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775434455; c=relaxed/simple;
	bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A37B4uG9wdDnUx+wGhGO9XUF7ebhmqoMc0CyHlZ9KAulMRvmWmHqO0Mzw1Os9IV/R+sqp1vi7QkvuihBYZcFuZtKhb+XzUHg3DPpjXsDsLePmdEMYt1J++Gptnr30hQOM0vtDnieF3Z1G08oGoWdSZBMyrjQnsO2HqlaSpZvk0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2EL+ypO; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2EL+ypO"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2cb19ddda43so255422eec.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Apr 2026 17:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775434453; cv=none;
        d=google.com; s=arc-20240605;
        b=kJlNgXYEdj7VMPd0GeBm3Z36VSlJgYO1RGHwUWxV1YM4OYQYXS3jcwjKJI6AjVR3bS
         5bbW7TE7hvFA7ChU8amD/bBn/kg14pMABqXJPP2iLpIVKyWlhKd9CuQpPF1IkAdqfqbz
         6ylEQpOyLGh/TW0AIA2+zRT3Ai2d9NNjxSPHp1sqFn5tegZmXw4Ufsb1myF05l/h7l2z
         mU+GEf8tdNWZ0Ef/NkDC4lFPifdcRtHrCGYn01HgN+ud9SeJH4nioShm1ewgWsxKprRd
         ojT2t4AeKp5Nq2xeKTa4wD/SLE+ozFYKdxka+LBg9DNqKIT0aSbmkoExsLEUzA/Z47Th
         QsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        fh=5eBchD21TPWpwGRV4W4D326/mGLxBtqF3zawZ3o3CCw=;
        b=FL474MIfvL6oHpzCp99N15bpY56MMvh0adAUAPK0EM0388ytWiMVBPRYSj9tFY5TV+
         hXA5rDGDM1UFtKZ5YQMGh5piOIQz785lZyXUTanDjPumV7ixFbi/Z0FLCE8I9tjMQ3jd
         5E4OwmSkg+Vixs1Lpr0U3pcN7C3yDJmEe17hKty+UwkGf/j5OGgOVPX3vtrZ0qPJsYZ+
         AyWCbr8sxbyrr28IqzmlPvBowbi4kX9BEB3Q53awmkoM2NrWGJnqMqax/H5GahnaYE5y
         RQOe32m/Bfs+TD91Y4t30aFDUFo/htFGIIzRqB/bLLucxokZ8drQpMxrzwh4TCpmjnFG
         o3lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775434453; x=1776039253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=W2EL+ypOcsaqQ4DoOhrFDh+b+1lAXR2+PfuzgePaD3QyLeW9tXTGFiV3lS1LJThAeX
         NaxY/oEFMFD0Y3i01XsEDpIhm8gOXMv0koKcxOIKicMgMti/P335kHExMP467YZP+Yn4
         Yy6jC3XqkJvOPhp1FwbNbESJ2OFvctUAgwlzHRAqS/JEy5mUEC2TIcLLwoRD8IU5BXHI
         EyvU+eQL2oMhpSEi0gKa3v2+Yk9nWVoOpuiLpMemSm6bu1MU8SModMlqUbijJ15Z0Jjq
         EcINdtOvxyfb50KcfPS/u3a17tCbzMlIBmnJAh2YlYTp2SQTFwIRZOigAmxIK6ERVnZn
         bqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775434453; x=1776039253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=rn4ftifCY9Iov8BiyT6isPiShe7MG+LQYPspJHqp3/kslYbd+WkwWfc+nzmPgrQryY
         4yybNpz8vxU5/2qwnkS/SB5QslRKNpz8mKLOUjL8RzyJKGyy2XZcRNhTYfFkH9BmH8+G
         QlDAI4Npr4P8WXpFPPn1vDt4lTW5L/4KPb45KiKCe/41ZpJ1K55UoeGtRErP8s99Uhcl
         6dyDdLU9CUiM6FV6KsNaA4qixPqERdycBiqe29UgGjzIibMBwr2S5psZI1QkT0TDl+XW
         dFmQJCjEmtCP01sEOR7BAbb3LeRV9aTrt+A5C1HF1fF5VhxLH1wSQbyvGwYvjaKgGzr7
         E+Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU9e4h1O/H9kYL46gSbEDlKK4DDvky5m8uB81I/VZBzagVfJ1ClvjY7PBHj5F+HgLKeReCLgwepuzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLFkC3ah2Tavh9daHxzik62YtGH04ltZazXogucjLPZ7TnDv+l
	GRX2U96aBoXPkBTdVeGN7qBeXV07bKOJIJHDuGKXg5C6wz1qDNoy1sBk7qUXu/cErNhSrqaXD0r
	V83oA/TDAk7mSVFzN7LcYiBlu0k09jQI=
X-Gm-Gg: AeBDieuPdBHMD+gR/2gB3itjyj0al8BLQRwi+PsbmtGtR2apKBUbHb5zi5BfDfc5SL+
	Hl96Ggt28xCfGwcDEKDLLvmquzyFGr8nqqgvjVEEz3pPkVWm1goUF3YcPmfB9LQzKo+yUbHqLiH
	F/9SrgXXClJWoNsD2jGf5omnxPINQEM2PoGZ/qgsF4Qp9cgcykX8wkUCLDQdf4N3epncSHIPj96
	nroVXMFCKGDMxbZ3vSBrRpUzWnwFsXExIx+/flMcs/s76jAkrydn/gF1hIU/7So69b6+PDV4mdc
	BM+nbT4ldEjsVdrZ+9JavodDsqvsLc9Pl3oGX8aF01qF9tg2IFpggkQbHbbx3PmgH8DxyYTewnF
	tnfaJLzj6ZMMYtmQEWwEJ9d4=
X-Received: by 2002:a05:7301:6784:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2cbfbc7dc06mr2181016eec.4.1775434453241; Sun, 05 Apr 2026
 17:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4> <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
 <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
In-Reply-To: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 02:14:00 +0200
X-Gm-Features: AQROBzC0xKqhkvjW35MYEt1fkyhl47XKSCgdBG6b_PFaPBKsGPkzdO2Dex1iVhA
Message-ID: <CANiq72nPjz4FiYUDDV5Xw1=ychH0DrhVN88hjygBnawLf7oamw@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Gary Guo <gary@garyguo.net>, Fiona Behrens <me@kloenk.dev>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
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

On Mon, Apr 6, 2026 at 2:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It's still required.

Thanks for confirming!

> Perhaps having a repo in rust-for-linux GitHub org (or somewhere else in
> kernel.org SCM) where we can point people to?

...and for all these details :)

I agree that it doesn't fit perfectly within the kernel, but an update
every kernel cycle or so should be fine, I think, if you think that is
enough.

Otherwise, regarding the repository, that sounds great to me -- we
already had an old https://github.com/Rust-for-Linux/nix and
https://github.com/Rust-for-Linux/nixpkgs. Not sure if Fiona (Cc'd)
wants them, but perhaps you could reuse them (otherwise we should
archive them).

Cheers,
Miguel
