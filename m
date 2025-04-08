Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78F21C3C18
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121814; cv=none; b=Qs8BnqViyDMxhIZ4VjYrt9rPOaPLEtpatrXl6jaJ9okYVoVre7Uu4DKJqHRa0W2662zH+y5KaxN/xY/7g2BFsFYAaDePcj6FiFWI13h1HaLsS7TJSMi0YC3qWlNzy9eu1EDPnRSVNY+Ehpf6enARHzvPgUe9Wrrjnbp2bd9ThOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121814; c=relaxed/simple;
	bh=LPJ5DC/qJdNwC6BaugmZeWV0dPB1/Q4W000XRyMqt98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RI8bmJ+ax71DQL+qdTN7JAaLpAmFdaMnF2bBt3eSZqCdng+mB+xmUS88GDdmPFe2/B4CoNCGkqusFOSniQEPiXPcZzs3UHYuoW6HwGM+GmODKN7E5jGZt3nma+g8L3+WvTJk8WdZQxWua0vq/VBUiDXH0gJgC9YJYfYCzzuBpkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aP+dfGPS; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aP+dfGPS"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4775ce8a4b0so100180211cf.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744121811; x=1744726611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPJ5DC/qJdNwC6BaugmZeWV0dPB1/Q4W000XRyMqt98=;
        b=aP+dfGPSKmirZPV8tjGdr3KDeDyNcXmfHJs1Aip61R5A5tf+2prq/TK02tGnfLn0TT
         +fgVZvYgflJyv+wh2El/jm1zMoHTH1lCNd2h6dHcqWSm5NM8/QK9c8yPLJIa75esu0q2
         y1N6SD8saKUtGGfNgHt29N7ph6ahbQhbNBwPZwmfRz88Nx6DeERpcgc5Gu1xhY7tyFd1
         jADaiI6cebEcthFF3zrfYDgZP8VvKOT3D+e3gio9pXCeKvbB6LiEI55g3YZvy89C7X+h
         QKfsavgYPxJuLmlImr4m2WsK7VFdxuHJgVXwVsdSAHmRAdrTQmqV9zue7y52ZeBcq0f/
         GFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121811; x=1744726611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPJ5DC/qJdNwC6BaugmZeWV0dPB1/Q4W000XRyMqt98=;
        b=CQSIU2PVbwVTw+7tJyBqi5LKxEYZbJ8QZBCnamIs+CQxqaKLLIuRyIcf8fsi71XTph
         Uh5TkhkYEGMAmfjB1ly6RYfqiTFAQczoFMM9SVfyJODYbApvYIRAzifk/cjxFzHixFWx
         v3z12IJrUmiLVxwOZQhX2LvUrp8jVFfiLHZd93T8rGBlVy+/dCmEfo+oyKgqo5Z82giu
         tGTm7pnhZj8cTkl+4Kff+gTnCQYpUAqDQX38lLT7FiSw9x5EGzu67mFu81VwdeN+rf0H
         Mp59CNS7A1cJT/wOvoNsw1/Jn9XFomxPctR/iBwTLL2M6DtzOBi2PXljyfqo2XCNt2lV
         yeKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXUwhmSAxy/BYShm7qC9WAx2pdXH31eb1kIS0tr1IyfRzUjL2jAKxo5KiBlVotQbEp2HeI6hNHjOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywQW5HPZMuHoBpXty2NSx0qUFvxyf2Avs0oFHZ/wA4J6gKka+h
	6KtQiwjoOVwtzGY55LXb3dDtbY/B2tSa+RpIHptuM27mYbz4tfNaB1F0nhmbNlJv4zW8EYCHKsl
	aYPrluaIqcHxpzHuDWcr4Z0DUOQ4YCMEu5Xsr
X-Gm-Gg: ASbGncvS8otgJmrPVXJ1RJEPzglDRCHK/Rd52W4wKpTICTRjoKcbJE+sQRc4CGSmIYH
	vnYBH/GK2XDfj2YwzvIpTtqvnVoePBTE/LfmzorRWEidMjBAZBW7KOAYeLCzVqJCJdYK7NUY7U4
	XUflr9vm55KmhalKZoWVh10PoYXuk=
X-Google-Smtp-Source: AGHT+IHUjVyFD7izpuiUpvmNnf+FDUH75moOoGezgMNusboh88UNsivDmQCcYc+G4RahQGt7lDjXkGMaNSEWhyim3Q0=
X-Received: by 2002:a05:622a:20b:b0:476:7199:4da1 with SMTP id
 d75a77b69052e-479249bd49dmr285747491cf.46.1744121810231; Tue, 08 Apr 2025
 07:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407140001.13886-1-jiayuan.chen@linux.dev> <20250407140001.13886-2-jiayuan.chen@linux.dev>
In-Reply-To: <20250407140001.13886-2-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 8 Apr 2025 16:16:39 +0200
X-Gm-Features: ATxdqUGjCQjPmmLIhcLV4VA-4isczJrM0_7BiR56nk0Heb7yBGKhT8w790UEEEE
Message-ID: <CANn89i+a2tbuEJgzQ-yvSt-jqXq6S5y6=C90jNB4QXGseg0mDw@mail.gmail.com>
Subject: Re: [PATCH RESEND net-next v3 1/2] tcp: add TCP_RFC7323_TW_PAWS drop reason
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, mrpre@163.com, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Antony Antony <antony.antony@secunet.com>, Christian Hopps <chopps@labn.net>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 4:00=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> PAWS is a long-standing issue, especially when there are upstream network
> devices, making it more prone to occur.

This sentence is quite confusing. I do not think PAWS is an issue at all.

>
> Currently, packet loss statistics for PAWS can only be viewed through MIB=
,
> which is a global metric and cannot be precisely obtained through tracing
> to get the specific 4-tuple of the dropped packet. In the past, we had to
> use kprobe ret to retrieve relevant skb information from
> tcp_timewait_state_process().

>
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@google.com>
