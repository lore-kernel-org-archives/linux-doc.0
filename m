Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15C2236F0
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772997389; cv=pass; b=bdbtsXs6HK3c/JPD93idvOTXD6xUqMMw7SVlHkbXxMlJmwfLRBOfway0CanDqcH3FyPw9Mz1yeD3vEkL3kOcKpdowYJ3h5S5QUqdRODr6mb4oaltiHS1Vn6aapGmw5AsGBs0KUjp+e2oSndp6ND4FkF+GRRLtrF8ITA6OLJdeXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772997389; c=relaxed/simple;
	bh=OoM/WBxM1I8Ed2nQOe/ethQEmYCVMbXjh/MzJXB7iOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fzbn/qxG6glu5qqCP+JpQlspl4w5raoLX4NEIhWgcCmRBTObW6GSulbrCht2LqJ/qLGCRLlSRIi8Hg40cUHNOA8lV2B9Jzvp7tq7zkSAKwlprP52t+jIiSVUY0AvMI3zZKq36UXz+vs0a5u9co7SgECLz+E5k0Eq8Mzr+8KWx4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkN1DAhO; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkN1DAhO"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124b07e5fe4so497683c88.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 12:16:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772997387; cv=none;
        d=google.com; s=arc-20240605;
        b=TzBE+Wfmj19QOaq8cspOFMk0aOVHjQ6GNwKaLsjRc8tD2b0ODMNY7/u5qAsFl2CIz0
         QKLb8Lgp++0OVYYmUDteCBzBmlOX3VDs9KibZcoh0hXfRq7MUBLpkOoGMlXlNQx9vxb5
         Fw8sFj7GGT2QLe7hdg2oSmNBwrbndabtk/hAXqTyC+i+BXlPOjJ72HSHD7/yTwihZ77n
         IVnqgVGuBYUJWV3KY4hF5nyKQEM0Ctpd5iQPQUqzI9W5WOBb7ebJQg8a/UMsarX7l5NW
         ODhOzDevJXM0degh1I8Z6IPH9YyG1Qnz2EjhuAW3Wl8jWeaAXk7U9zwtoUJm2TObZ8pp
         McrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OoM/WBxM1I8Ed2nQOe/ethQEmYCVMbXjh/MzJXB7iOA=;
        fh=EpSu0XwzIZWuNgAHHevNSU6sThsTMoiunh6Hr5HLde8=;
        b=hunmg91DuuzKfAO+m4L5+FE+fe7O/9DBnkAC0vEUJnJ1HIHUD9x/XTa5AWIE7OnHld
         afBwCf9m9TEcMCAYJow6JLN71+vMEGlYLWXxXbs8IQAvrH0pCLCDS7A9mmfLLa4GiLKW
         6EPQp2k9w13ocUJHV6vxSo28qtE3dXDUoiJ3wPiix8J2wrVTMmW7mr2DDujbcke4Y4Wn
         Q0DGitG2KtFJYzKRlw9ozbBKav6iO/cz8DbiY2sLgf8fxWqWUUC+KzpQvVYjcD0wBzL/
         03H55v2omp8cIpZR8Lp0Kf5AHHn9arGlSL+WtlTlIxaep/1rqHFdbDb8YLFE2VBzFR3a
         24rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772997387; x=1773602187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoM/WBxM1I8Ed2nQOe/ethQEmYCVMbXjh/MzJXB7iOA=;
        b=WkN1DAhOAklPngTa5C8A7Q0b1cURPD5QylwfWolGOBa1XhPuYVlo3/0juKEuKLi1/N
         44YlRsZ2IxaLdY7Kav7WtOReNdcVOOsr+OuM0ykXWJSpGMHtz/I5brGwS0/PpBNW2PQa
         In8tlKcFwj0yCZfYs7NIPPuexAV3XCjekv53s+9XVMTYPvoW7hMcv/vBgvmlBOxu2R3D
         u2inTRIx5IWlVrOIn07GH9ImMTDRZTF1kQkOzaRwkbzkg1BrEC8GhZ1MKzJ5BbzjGypr
         Bz97hSagdS3622NpND/eTodsWzTlUZcoyYsmgLOVg1qmiJLb5px4w3Ab1pmxffSSXJK0
         4sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772997387; x=1773602187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OoM/WBxM1I8Ed2nQOe/ethQEmYCVMbXjh/MzJXB7iOA=;
        b=CGkM1DzBVZ9IS4sx7JyRQj93zqrRgKm+izU2TTB02uM3XBXXUisIBW3xdqwBnRwBc+
         fzKiX2gcMjMXDUd+iYGCp+38x6bXLlIVvDC+/hTrA6oqQqyoFoAp2ilY/kVNjyf9MdT1
         TvZ5xw7j71fo8cNdujC8ZULefNq0tZprli2iZ2Synf4qSak8iY2NbsjaollB/OIQrgeF
         Jixcrqb8RTg1OxtvTa2LiBU3QQTlMbbrZcQb5wE8QPgDcCSY1938BTegu4WUxN8mTunD
         Gr7KEGC+dlZtXy6NRw/d7bPdMWjcKhbCSY+KhRqIY/PUcvhazCu1CqnTVLgS1yP3r7Cg
         LH3g==
X-Forwarded-Encrypted: i=1; AJvYcCUFBUCzfCs20a/AY2uBbSk6BCBt7rBAemBP/Wo/ELVu2AHC81S83FSXGDY23JqbACsvZEwSfLHwDm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1of8lGxq1d+nPTQwDm9Hi/Vve7zaQx+p/1bR3cDL5a0uxkdM
	g45gavhETmRuATM09zEZXwdndbf9SnNMWC8CL2tGLlXF074g1cdLtju+mtEAgv/w9k1cDQ/+lqX
	DdhMjGayH3hqAIhr8GiaE4x+YwmMEdj8=
X-Gm-Gg: ATEYQzzyMxtBx5/atiJKpL3M7kK5K6JqK+stFxaRlz2XLnseboWfYwIeVWpcaiivBHA
	7Bbu683PtA2XZOeyGRvLqEvPnT73ZcqzI8Vsr8Dxt84rKglgsYLJi48VtxF2JPRGnqK/OpKMyzT
	llGfd4S74feXPuJrg13XqjQDEf+a2/SzaYDAWQGDNqzwlV5T2+9nQT5cuoaJidtczZj69RhibWY
	R5iHQtZmvuauRYVs27NDNZwEoayCZCI+6r+n3Wsu6ZLVJeft0QAG8P4HK/2qBpoAMOxzKsa+J0N
	2y65mawVMdSMmB12+mFSzuoFvMDb73fzrM8730CDmfzlJ0XTaSdm1g/FkgflTsU5N8AaGa0JJPP
	79O0Rto3StigdhefJ9C6HeQpo
X-Received: by 2002:a05:7300:724b:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2be4de7afc2mr1754785eec.2.1772997387328; Sun, 08 Mar 2026
 12:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com> <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
In-Reply-To: <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 8 Mar 2026 20:16:14 +0100
X-Gm-Features: AaiRm52rG8puc9hF8MHCGxtrNxjJwwn-iuvjSDLwS0_IZhQ2jcoi98z_O9DHNQY
Message-ID: <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 7:40=E2=80=AFPM Carlos Bilbao
<carlos.bilbao.osdev@gmail.com> wrote:
>
> In Rust, there's some keywords like # Examples, # Safety, # Panics, etc,
> that need to stay in English.

I don't know what the translations' policy is, but shouldn't all code
remain in English? i.e. not just section names, but comments and Rust
docs (i.e. `///`, `//!` and `//`).

From a quick look, at least I see another couple translations that
keeps them in English.

Thanks!

Cheers,
Miguel
