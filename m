Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2865E39DBE0
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668177; cv=pass; b=Nh9VHga6HJe/2SQ7e4UfypYKqcBXQcfCIrF4Iy1wmg1joEpv4s2WOsgX9QtqH6ONolC6MNgpOv+GorJ/+dQQ6VJqpyLf085p93JCePEzkXaQ7wS4ywkf7RLJ5ALOhPDBFhbuZQnGUlheWalPzNQVoTsMgwIcHGAaTsqfrNx3GZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668177; c=relaxed/simple;
	bh=D2TFnJmKvvtQlbeDc8mrtDEMlzuK3isyxrxCu0xrBKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+8B4HScR2qaU0ZdpiU6UWy9Gte9oq/7PCXw+V9o62Mo0S2LsAAmetLwBiCZyiRIcaDClSVlbluq1AMaC5wHLSjpmjUiaXNywnVNvk+b30B5nwOEFMaG3M/sjJuz/swNBoZ49IcUrUWxhTP8+UK5rTHcGG0Qdb3CTS/NyFVrsk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDHIIwhL; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDHIIwhL"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2f1b00a75ffso468712eec.3
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 03:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778668175; cv=none;
        d=google.com; s=arc-20240605;
        b=gcZZ+EvLSLZQrRGiJhNJGXHTd3kMt48lt/FVURlos/eXeds17EHUbkPK6VGXDRnxPz
         anVIXgpGO8Ev++pc7c2Zl9SQbM6muBe2XNRPJcbI6hoNMPBCuThp7n2kDLJLYVx+OzNG
         YlGjjUtB+dLXWN2WFt05iTTP3vw+sMRi7sTn4nCfMOZtANpswmOVBzGLJ8BdhiR4iOy4
         2F/WcS8mY5nCEEy+9NgSyTAXwi2gR9KNw36irTPZAuhOxikP+7bWC9zOFPMterZ5iaCR
         MKdkW3s5DgQYsbk7RyDZXtjaIwFK0UO6wBK54gjkYvjVTR6JSiQp/pt8Oi2aDg07+VbG
         kPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pfRguAexMO15Y7WK5/7K6aHCr8ttDBgEp8v4v0BLc8g=;
        fh=4IQyTqG4UnBJ2vMAz/1FVhrcBdSKOXgcnHZf4It8REo=;
        b=OIscAw4HcWC23s0P1WnUobsCQP8syuqNvT7m5+Aukf8lOPlsLZZ/v/HtoCWPnLA8E0
         0Yuy1fp3h1j3Qdud6euF+px/J20qLtR+O9lVHLGE7VZD41LLGNGxksYIb5OZbJJtXMa+
         Zre6kfZ6pxkWjuQG0BMhG88shIqw5hc2t0yV37exJTFHlPmvxIue007ZO8YPvIVoqmcf
         OgXJ8rQgnq4NMk96XVcIGppHN1stwtHeBXwAYPiZo3O7razQNrCpGWMAIsC//s6GQljG
         aXwRSokyfVp/ROCcDsJMizh8eXkpGKYL7uT9fWEmMuoX4OGX7E2trXNhn7lYqvsf5ior
         vaDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778668175; x=1779272975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfRguAexMO15Y7WK5/7K6aHCr8ttDBgEp8v4v0BLc8g=;
        b=UDHIIwhLsnRsbSmF+G4ioL3rYwyLMp54rS9TcDTIgQxlz1zNaotrsM3Mt7DfjSWUnh
         kocTTZGITCIauO4DSp+tllNb/RIUpnHV272gXUwwcjLle3KXOOy2jF7rcJQSGSjyg/mN
         h3hzHEGK5XXivRNPbYMyIM5d/Ly47IGK3P3Zmc2T1Wnf5q6oce2VxyBvc+Ezo8w6KeV4
         +GwIF81Qy/q/VltYwepqHFYdXKPBcCIrgpHfmS4oQ9DkWjErV+5990aRTbvvTGqeVojt
         UkrSVXICCKB921QGnx2DVWHR0rqhfYqYKivjVhZTJ5UJLFZ5LeOgyi0M5Zsoh8ONFheC
         iZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668175; x=1779272975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pfRguAexMO15Y7WK5/7K6aHCr8ttDBgEp8v4v0BLc8g=;
        b=X+dBDsLet8YHt8E971SD4Zvqzp4m6Hc2oguRnKLy6oJfIM9M11JbiaaXrFqqnO7MSp
         RknKHFMVZswxzVF5GYPZO7m8FoIS4EGyQWEvsgEZCedHrR165lmDki+lm8vVulXunEbn
         iJ80FjkYJZ1bwlo2c08d8PNK99dcvs/fWJFqVVwMTtMFwD8mgirX4wbuYVwuKOM+wBxK
         kBKoxwob2jtqH5YGzsnob9+XFh2VxiHco+1IHdjGr+y8Vnm3z0UL1402ppahVzQDzmJB
         egtPinO+F10awSYxdG/TWZZEascsjo2K1ybMfp2JMI6Kgsggx/xmVOVK4S9dWlzybsIz
         iSUg==
X-Forwarded-Encrypted: i=1; AFNElJ+ye9fxZ5iscSLzvnblBWm1EaBukNfrqZZLCZtgoWzeeIRMcK4oNYwn0P4InO/KZpq4lbEJ8NnoWVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyipBa+XDmLWte3uQ2F/i5XfAxN6iouzucqqAmkTL8iIHhCd5/E
	GPfnM2ZhIQgJ1Wf55mOxQALsQy07P3PrqrC7I2JZQgTT8AYZ4Fcx4Qym9Bh0KDSICZuZygOq+A2
	ic2+tjzNhDf7njGUT0BeTL1PxXZ7oggI=
X-Gm-Gg: Acq92OFJNb1I36sjiai8vN8a6/A4L7A4DtvxynZnudTWSla868eMPYVqHoPXpJup8Fj
	LE9xs13mXvlunWeebv6Tcm2q9T4H4QS3Dpo71IbFWSn4cLcOzgYry0lk+iF/zM5WJdOrQl6HsdN
	Y4FhfzA0rO93tTAxEp6SzwKLrwGI51hg5DfF4SrxU5x1pLFRJ/wTyFI87E/Wf0Z2LgSLpj3+zzb
	nJy2E23FCM+M/Ab0/jVjrL2fh1PArcnLghR10l+qxkveVfWelU09Q6W7MT6tlPLHvrhnwRKXXK1
	z5ylXQUZnsIiz+wB/WH2qlWkgVgY9HVYuYVz4lNCfCUfWiHk/iM21soVh5hw3A2+szwZPtQX5+F
	ngxuDkgVdcOt/YyYmtze5qUs=
X-Received: by 2002:a05:7300:1351:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-3011a16acbbmr740963eec.8.1778668175217; Wed, 13 May 2026
 03:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513092017.265269-1-work@onurozkan.dev>
In-Reply-To: <20260513092017.265269-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 May 2026 12:29:22 +0200
X-Gm-Features: AVHnY4JRfZeS5M4PkB0i1HHGCnrslk-pdRETB9bqF9W78tWIU-eAfHuzIz68pYk
Message-ID: <CANiq72ni8VwqEnBNWFivsHR-P-wmfjMBVfh4XTDBTAURB8zo=w@mail.gmail.com>
Subject: Re: [PATCH] docs: update rust-analyzer command
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, alexs@kernel.org, 
	si.yanteng@linux.dev, dzm91@hust.edu.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 11:20=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.de=
v> wrote:
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quic=
k-start.rst
> index a6ec3fa94d33..df5b54b51deb 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -314,7 +314,7 @@ definition, and other features.
>  ``rust-analyzer`` needs a configuration file, ``rust-project.json``, whi=
ch
>  can be generated by the ``rust-analyzer`` Make target::
>
> -       make LLVM=3D1 rust-analyzer
> +       make LLVM=3D1 prepare rust-analyzer

Perhaps we should add a brief sentence after this code block
explaining why the `prepare` is there, e.g. adapted from the commit
message:

    For the best experience, it is recommended to make ``prepare``
    together with the ``rust-analyzer`` target so that all generated
    files (e.g. proc macros) are available.

Cc'ing Tamir and Jesung.

Cheers,
Miguel
