Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E53A381D
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 06:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777788066; cv=pass; b=pCzkSqAzGB7/e2Z4C7C9xoZ43afE+mrMc6gZ5eEZfAGE2K4BOJoeMqhFnO/mTdELLBEvvO/708pi1gdCfTb8XMsb70/Ir8MitWyHXH5f0jCtNVEkzagOGB9X/lil7KduhXihu84uZ+GYOoGhtdRba5dlaLYdnpjl+rbbhW6zvv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777788066; c=relaxed/simple;
	bh=wCfwMR9ECj9hefOAeQDZqg7OdsjiS2RBtQZxyfoYZM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gd15u7ZeaSZvpySVtUDXCrFeBawU9tLBFRpgRcw873PwyZI0jAu3Q2Bef6z+zEtWEg++09ehayzlJ+4pSTBk+LoNx4uXoA6intcq7djw6VRpT9Tr9wl5+LEt4mvIBofh5YNg0BPByi4c2KZUdFmvuxYw2LHvdPE176zykqBHfjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/3DsIfx; arc=pass smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/3DsIfx"
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-506362ac5f7so23445931cf.1
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 23:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777788064; cv=none;
        d=google.com; s=arc-20240605;
        b=EkWjrcNJMeJFjZ3w6N5CRLSMbsCydwubH1WdTDHBCYmYSoYmTfTpxQh+1lg96uOoGC
         lwvBJRnvtye4ZtjqF5nx3WvkZNrHBa4P3e7sxcuyopQ7FYx++s9ITjVWhicdkt+hfLuY
         LoJi1vOIc2HTXJ0xJ+1i41tDzJPQbrchU1qsYa8GFQYQ4o0m/kitkxqS5k2BCnaUZBgp
         OGlxMacTIwPync4ZFF4mkXRYVAE/xf0oMPMsbuwAAmj6d42PU6jdLilF9mmdhDt7rvCK
         D1BJmenf9dVn/BDB4a8SMdVioEa8chfhXgZefgz/iUlLSi2iPjvDxhkPqgwNSxyTchuW
         wofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X9ULHTRkNyp7KStodIgdtfu2PjfPsaT5zkV+m42qZQw=;
        fh=BYoN3ls+64DkCoFHZ+OSoBrWkGwoKlQ9jbpzsbm3QQg=;
        b=Sc6zSDMalP1vmavNhJjfABwsxfNIqkcaCYirTV8yIU1Ccw9XJ6Bmd7/06H8qQV2BOu
         zgvDD+Phx99rQs0WVgytt4gISPUsn70s0Xst8OuTCKqRYXYE1rAMJChOsrcSeRjWyZB7
         TuJvaCnrAjp69OuwAvZIB5YDwM8+ya5UbZnGrYjyxXQUGEcOtmQqiGOk3BR7SuUm/LrE
         lFH6dM4WR40WOpVyIR9FKkJZqsqaLoxY5TBQU6gBA90ht/ewLpTW9jbFxKKj5zY5hMMN
         V6h3tyHiShr0gWLNGpwPwb66HkMP7pRBU10Mb8D8QUnkTHQV7BrwDqJZNitiqdJUiunV
         1kcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777788064; x=1778392864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9ULHTRkNyp7KStodIgdtfu2PjfPsaT5zkV+m42qZQw=;
        b=k/3DsIfx0DaTYgMKQaSS/5GQ3AU3dIybvTV0+1T0l0wlv6aTQc5tZ9dx6QdzO9g1cU
         w8SX60PLp28apvhZK06HOEs/H65j73RZ/Z6jG0J0XejDWb4fjK7dJpMkL8UdfdAXHJkn
         +ArLpjxlRsnHdsRDNCnLb2k4TPhZnyerLAmRuMlb/FSeS0/84vki1xmVu93Avz+kaWXD
         ArxMuBw0p0I8SafnqDskAqla3GnlHewVWj+axIr0HL/rgJZTgq4aT1cfRRb1OAgHeEXm
         8izpG1RTNuw7OjBdarP89OUFeBrl7pwd0tyQDgZWgwjuGF5SsewBFxb4L+nvsqsmDDAs
         NqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777788064; x=1778392864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X9ULHTRkNyp7KStodIgdtfu2PjfPsaT5zkV+m42qZQw=;
        b=b7L074vrghXjiiudfyhHNRfKAYau/rAKk0maIZM8MAtaw/3uOy4lw8hV0xzAFOz4Tu
         D6CPkgoFzB86TJqhqMOzGyjMMEDsLWgU+UGE6uwXUScjzp8TAO5t+1I3jqEZV6jR1ivc
         x30BmsTlh6xLtqI7T6OfDQhuzFuTX8vl44zCca93jz0IsnDfS7vOmL4OZZTREH5By3c2
         NCwkGDs49aT639HX3UthZDru5VK2PqUM3pvr8Qppm06ZzZTwZzRHdCDlhY0B9FYqr7aY
         zAqInbFbIR41af4kC3laKni8W1m+/Bt2Flx1twDOj3Ivr7C2JY5vDw1DXIOY/567z3jW
         vv5Q==
X-Gm-Message-State: AOJu0YzeDTkrJZHBEjtm6JCCZSeg/Lgxr1mvWOzR8HuixK3nXrnUAWm5
	ynpHELy2mqxYrl4GIP3fUTcRydwZQLbJfEZ3qmD8zlOxrkJ4/R/YgsfAIl/eYls6dJBuZWII/Q5
	uc2YZ01PPf036BLwqbediVbPOkLpE1LA=
X-Gm-Gg: AeBDietuTfIHeJKPyGwDmFiB0erbUHn9NF8oxBV0BmdmnNMQjZKFCr3/a6WVjHWqaBl
	Aj2qjRo/v6vffdELbQV6greqRrU8G9Im8U9K+tgylCab1WhWNtmK4esxJQ3MIyNS54MU+cdo2/U
	GTu2kmOce4Fm6yu9Swif9+MXgThXI4sREfy34lHki8fn3qWx8tMMFvBHESNMyPbTghqvslPeYRA
	M9AV/ChevNQkOlUxO5Q4TdhZRguL53m033S8ff+F7j/jwn8Rqf7DLwEcn6L+EOtoWUaUSDc+qWD
	V9ZXnYH+kZE+/5tTP4SNzXuVvbcnVduxgwuqBQNs3J0bhHAYPsv7uu1Tee29Cjzq+5WosNE7FC/
	t/Kp/
X-Received: by 2002:a05:622a:587:b0:50d:8b23:4948 with SMTP id
 d75a77b69052e-5104bf71ec5mr80525351cf.46.1777788063794; Sat, 02 May 2026
 23:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503030801.14080-1-enelsonmoore@gmail.com> <2026050340-kilogram-prissy-a833@gregkh>
In-Reply-To: <2026050340-kilogram-prissy-a833@gregkh>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 2 May 2026 23:00:53 -0700
X-Gm-Features: AVHnY4Lgk75zXObx5AKxwFVNfKeHDu-2UsHM6uymzVhpbBAn4tV8BBUVB7TAHRk
Message-ID: <CADkSEUgPtjkKC684O3qB=koKDPwJoUj-qU_4Z_18NAU_+bBqkw@mail.gmail.com>
Subject: Re: [PATCH v2] tty: synclink_gt: remove broken driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-serial@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Haren Myneni <haren@linux.ibm.com>, Eric Biggers <ebiggers@kernel.org>, 
	Qingfang Deng <qingfang.deng@linux.dev>, Julian Braha <julianbraha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Greg,

On Sat, May 2, 2026 at 10:44=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Then that means someone uses it somewhere.  Don't generate bindings for
> something that will break because it is no longer in the tree :(
That project generates bindings for every UAPI header automatically,
but has a hardcoded lost of them, so its presence there doesn't mean
anyone is using it.

> If no one does use it, then please get that project to fix their code so
> that we don't break their build.
They have had to remove headers from their list that got removed from
the kernel before. I will send them a pull request to remove this
header and then resend this patch with the UAPI header removal
restored. Does that sound good to you?

Ethan
