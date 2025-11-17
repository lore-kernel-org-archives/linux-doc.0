Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099432692A
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371260; cv=none; b=OzDinsOWpxTRPor06wl1GIGmtuvaNgllGNTYY/7o6dvtfm/8xkLDplKCj5ZYkaVVU6D3UGMWYwlTWzSnkW7wfajJT/k8UQeNGNefs5RJ/g9U4gpBrBUXT6xocJlrwJgYJygTvF/ZduGmcG5WCIK4htsmkP4eV+RYSYDp4FRYUfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371260; c=relaxed/simple;
	bh=9WleBwX2QRmI4M/SGs0iFUGLuTeERCsCRIqc2x/WgCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3If+dJYq9+I9gglDDll6SAaja/ATp5Ibdv9tDZYOS3kMT6Cd0kkYAjNVEOcCX4WeVtOuWepd8T9cQSigUfJsAV8gSUvnejbbQVf2RL/YLQNW7NUJuQP3KnmMeXsFVadCJyV64H7+lKgiaQe6tdji+unQD5VXQ6QEymaMrl57cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQdGI2pD; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQdGI2pD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29800ac4ef3so10928585ad.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 01:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763371258; x=1763976058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WleBwX2QRmI4M/SGs0iFUGLuTeERCsCRIqc2x/WgCQ=;
        b=jQdGI2pDCgV8tHEzZEkTs4HipKX0J1nuW9c0W3UyXagQ0jRTluHRPbl/5YK4v+nwAH
         kz3H5Zmb3mpe33XZRYyuyJI4mnyLa8GQ/QiuBJ0jUHnX7WixubzWLA8udcVfdYdu/nUo
         RQTf1F4FrO3EwQONZr2HEx6II2T8r36NTOeKGR1Dn6wZTEl1zGJpwAVuOKEhuhcf3Qyp
         Eo80eqPYGUu/rHhZmw7M3bEnw+Q0xayxoME3bZP9uXTj8LKDH53RWzg7TK+wABgbTOmL
         FbkBqfZ1AgsgGOUVNMz/ifl1b3jpSH4fN04/2kZTvPeUSk3aK27q0lI4+IY6m8g2V1kj
         lFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371258; x=1763976058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9WleBwX2QRmI4M/SGs0iFUGLuTeERCsCRIqc2x/WgCQ=;
        b=CTnhyjL+gOtGxb3GbGpRZV/LgEYmBjhhbVwCV0qqDULMCG7+fUK4xkTa/VwDFWyKtD
         y9Q0NpLg4OP3U9RdUoqJexauf3Q8vBW13pa8iRHziGVbWrJcSLsZxWDYd4AGmDxZFqTO
         hgPTKkRy6wcULyApTawORDCwQw+nz+kS0VfwdhytOzRqyyS+3o+b5ArHtjSzVamGKZ2p
         cRAtC1AieFTlDhJ5pllATcrWOvIudmdu9O6Ik1GHeEPmfAdDeUQy22Ko32VDdbIvqj0i
         s8v30kMNfigBSPWMid1+AgZp20//iS+lGnvM8ctKyKAl53h31OiOXqfkiBk8f3IhInz/
         h1rQ==
X-Gm-Message-State: AOJu0YyEfeF8B0VVkwJuAAn+ePY2wVvgq8gV84QbmZBuHi4swwZe9r+z
	0EyjmssRJWceUcGc82mzWEuPbTsC7LGhoFtDdYu51LGlmx2S7Q4FkBJ0mwqeoizoXAmV6Xm+4Az
	f6Ofk8G7sfb/ovDQXCsbVNhfElOHPy5Y=
X-Gm-Gg: ASbGnctIE5473GnsX6f/AKVMpGD9vTkMxrEwa00twjxk6mxki9Cut8uS0zicvx1O6jR
	AvkZ+RGa3tyU0kSdcLnEs0caOK8TW9Nfw888rH/AWadMrqCfop/OG7zaoadITNJcRxflLRD8NK4
	uUIK90VtK2OJUb7vz2MnZQ8Dk8PENno1RXZAKR7hBkSJN22QV6DuxVtCM65cVUk+EBQs0bttebV
	v4903xd/z1TWr5Ff7y2mABgc01FKFrbg2J6B0G+tL9ahSNo7f+UwYfq/aclBAR3sigdf6PDeRAG
	zK9XPMr5eYqYIqdCz3Jk1GMOCZ7e3STpp87WZGwGKDu0zSYAtNKQCOcUKZ11XAg58nvZY08dWto
	p09o=
X-Google-Smtp-Source: AGHT+IGfFrgm622FOc29wvAAHNzvVoGxN2/E4IwtlUsCpeegW0zJbzdx8cPGIxEiroiCX7oWF2z7Z5G/nH4AC44Bv+U=
X-Received: by 2002:a05:693c:6319:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a4add16638mr4250072eec.2.1763371258172; Mon, 17 Nov 2025
 01:20:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org> <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
In-Reply-To: <a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 10:20:46 +0100
X-Gm-Features: AWmQ_bkMBtoGpBgvSAmXP8HMTS4lIYkuaUXdKJO_5GS6BNFKAoBNWrknMzILw2Q
Message-ID: <CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build wrapper
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 10:13=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The makefile logic to detect if rust is enabled is not working
> the way it was expected. Move it to be inside the wrapper
> script.

Hmm... Could the commit explain a bit why this didn't work and why now it d=
oes?

Thanks!

Cheers,
Miguel
