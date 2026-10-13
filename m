Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BC3C4B63
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900822; cv=pass; b=FXSNGUZJ7kyXfuKur5wlVy+vij2kP9YYN7WLBS3mGbGZA9PzhRmsdtgARPRBd255pi30ec2LBcby95mfyUOkmMT/CL+wwG5zefqGfVa+osVGzabF/a6lNek0TrIdmHVNepODqJKrYbCx8mmkO3ZYZprq3+oXEdBbXtPQuw0MwVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900822; c=relaxed/simple;
	bh=LBo+gm3j3VM7myxDHJop+NPUR8ZxxSNcMEpSSvadFCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcb6Gd3IEz7359VA0fQNRlvpjxfu0vwN/zqv5RoRmeWrQOo+mLfUNoo3DqJ0Iwx4iDzY5g3D2UPexsdLOGsqbOlgIMFsdrF5tjPsbqt3qxSBk2crfvqk7KzrVgYAc5DA2aX87sS3/1kkD2g8GAoOZUpSYPxp/pod0tP3B4mxSsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j10WrLuk; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j10WrLuk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so6011385e9.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900819; cv=none;
        d=google.com; s=arc-20260327;
        b=hbP2kc7Hrwn2+WZ2avdJTsiLaFH+2DyTQVq8/7ZUGDl95RrWBIBYgS/176TbVvEx7i
         cNihM2jW1wYk9KfrKltl+Zd96/SWaa9g09P8bXkrLtJ0Slyqmnin5u2iaQz+2Gs7kTd4
         WBq75/VmFL1xLni3HFC4xlrR/G5q32bGfN5PbjU8EtVBuv2aNLFTIZMDWmPnxxhWPzqC
         EKbfzshEVe299pvk1pB6wU2TPrvJP8llWUHUc1WOXLD6p9Wf91ZWgTDz3dBPb+7wu+lo
         kox9zpADlD8TAs5kqLbQAEKC0bY4qpVhZVHs/tWVsyV25coB2uGiHgbjwGFqY0iU8wq9
         LpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        fh=F42VU1KdK6A0msiHpo+wJAwmXioWteReGKLzbEPSY2Q=;
        b=q3xPfBNUj06tLkX5Yfq2zncwXaX1xGZrRR3NsIN4ZxDCKrx2CB97rOtkRHyZroQhn+
         O9TQy2sV5yjenlU+VqfY3uBHz1OUbz7ihUrzOwItIsoU+lMcuSQzJfbuDJXqU/JnehDJ
         th+PMvE1bdND5qya1IhF4vfMvyaYBKSxehjv1VuXMCSjFuBR9vDW7CdAIXVX6xCaPLz0
         2wY02skpAx9OiytQZK4OuGFFqhqCPnZ0irevXycQhNICSVQu8tPlbQfn8WBquEbvOweE
         afNFDnHu8Q6m63v2v0+6indg7jLwKuDh0CfdZVdy4UgnhgvoTaIWZD/B1xb47x0GqxKN
         PS0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791900819; x=1792505619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        b=j10WrLukAMVmifdfiJMLd6LwM3DD1VoCKQ7lp1yihENW4WsK0PebFuRtrkl9BCJ/U7
         rQ4osOPQaj7i/YbZl6GbWPrBE7mMyCQe/0s9qtE2eyTy7OgI0Q87lO5Rg+B5+FRpSEmZ
         vDfUBqAVl2u+lHasDVXE+s85A+KFUSJX+H/hk62xjwWOLxbBUOXii0Q4gzi/AyrWXvXg
         0+dvdabwfx0vGhpD4cCc06dXXTqt5AeNkh5Nx4Fc2uOsLT7rNrcE98L5yjx4lUFCEKoZ
         635CXEZXOiI3pt3lz8fiMpNRJH2UF3bMA3XfTEmV9qupfLUve6zlJCsiE5U+cMiW6WBm
         Warw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900819; x=1792505619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        b=IUnA0t6oUZuR/2aiDvEs9bf/lThcmdkXKu65EjfCwjtqNjY+IOmp9Y8zAOvgpxdhXT
         +ek5Z0ee3utNLv1vayG24RPxN4elyMARRYLxKQjGZJc892CvIAJLL6azUaZkkFN5LX/l
         Eex77nv1bW4YBHjiILYxirq5Q1ZuT8RlKwW9tSLe/fwVx0L0ahMoRAX/IskaIQOpIi+V
         MeKdPVszAExNK4r0YvfycLuVOZjr6E1qfeL24W6AavWcEBMUe9n9zjlLuUllCjYPxSAD
         lM7QblUp1uyoJk94KjqpN+4ZbAyuiy5T14+916ugVlx6Wuf0ZkVy33GSjw4Osou4YJ+2
         ga5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGVbLWCfMpyg3e2NV9jXqYgxIlYFkIOfK4tlXIRQ8i3UUrOlRmIIkwQm4JyxMeWG5of+mXceQxHus=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvzQiVN7kciER0aIe5BW/ZignNoWpVucFedCcUUmx5FtRKRJP0
	Z9VqdWt3xBRsdyvDERzlR0KZGd2ui9rt3sYEePBp9fusmS0wPuJXt4R5OJIgChn3nPw55rKxjFC
	0iiU7Tw+XY6zL2P+HurCGqRxJFS9Osm9uj6lQcNiH
X-Gm-Gg: AYBFou1FLdA3w2M0EcbxhbXCiD9/50IXI3UcidkqWUaguxTopYDcz4T7UrJr0VOxYnF
	aSa5cYpJF/ZVkuFNqbCCUnJh9sR1yJT1cuy9MO5QtuzROWlIgSnOTwdydB+tHnPOXg1PrlqmUN3
	2Y4wKn3sBxtJhPuGW633MLrpQQO3kyZUeQJO6NC1eqAVnsvvHzTugMpyBaF9fbYYToRCHsLFMPB
	JScbtgYzN7s54b/vwNH+dYSmVQN46Reg6CS24u8A/WceoCQ5uhK6X+QOkZLYbpfneq8CYdRNHPu
	XcFCIFBv7Deb6vsRgLqWLxXigvMvcjDXxxmHfSRiD3D5XtO30tw1TSH8HCM8krUJsJCkAEkiRuu
	geTtcL0VY9K0j+z+fu+WIMmc=
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id
 5b1f17b1804b1-4a18e4f56bcmr259716625e9.33.1791900816884; Tue, 13 Oct 2026
 07:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com> <DM3RIG8CD89K.1HR52QEO55IU8@garyguo.net>
In-Reply-To: <DM3RIG8CD89K.1HR52QEO55IU8@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 16:13:24 +0200
X-Gm-Features: AclHuK87fvpdr3oX5HLfqNciClAH9QoGGC3hFM3xSlDtUMWAcOLzXqxC9G8ECqs
Message-ID: <CAH5fLghXHoy_2yYyjf+GZ16OVqek52XbF2L9Da+3qWgpf5Fy_w@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Gary Guo <gary@garyguo.net>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Oct 13, 2026 at 2:51 PM BST, Alice Ryhl wrote:
> > From: Danilo Krummrich <dakr@kernel.org>
> >
> > system_wq is deprecated and triggers a runtime warning:
> >
> >       [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
> >
> > Replace system() with system_percpu() and system_dfl(), to match the
> > previous behavior of the deprecated system() and convert doc examples
> > and tests to system_dfl().
>
> system_unbound() is also deprecated (replaced by system_dfl(). It appears=
 to
> have no users, so we should remove it in the same patch.

I will resend with that change tomorrow.

Alice
