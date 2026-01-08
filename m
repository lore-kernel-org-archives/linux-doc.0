Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F45A2877ED
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 22:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767912430; cv=pass; b=c+eWEKNuc5Ai2yDHU9mDDwv0An/SKB+Fh+A0mgPLVcC01L7h+Q9jpJXaog2loZmIhmMh8HADvqQlKdQJszUAkbZecCS90urUPg6L52Nj4k9kjj7E2YkecUsKa1mennGNSPTK7XahVDxbrRPjzaHQC0ImTkiBw7yDLlMySlV5iFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767912430; c=relaxed/simple;
	bh=05M7G+yD5bg2zpxfBRZSfkHw88GfIvX7aX3Dn7f4FHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgVeQcsBPH2Zj+rIiXZOMsqziOwvK7KPUyYEjiONOnUwQChfDCEexoMm/sDyBTiAgSGrjEzM+KSjGBw5bKGy0UNYqoLzzdL7orgeGGduxH2VaIU91CbOt8HIem9VmpkZm19j/sIQdqJAEgDs1Fq0kdA2wD+uuvowiXr964qPOYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NGQejxtf; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NGQejxtf"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4edb8d6e98aso180201cf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 14:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767912427; cv=none;
        d=google.com; s=arc-20240605;
        b=ayUpM6pTrLdzOSi9hB7SHiB2UecuIgJF4uSYSKgPYOPyd56nb/buBzxDuX2TTs5Td2
         f/hs1x0IS2VT2BBqDpfwg8+fgFAzZIJbtTu+hgG5xrND3btjH+Dz34s72VVmrAgPOhMz
         JfW4y/KNF+sSnjqKoiRAIEIN0nkPgbhZoJbX+dzDbvg4y4TqxC2x4QEu60zi9GzfcyRV
         zG+lIdQZfN2FZX/pbK7VvzqxjY1NUjRHtHEzl7+jMfRELkRd0pALc3pjlBZo2rQSMaeU
         rKxaOhmYR7fnTOmu0ASsakt/igy1YaRiLJC3spjXyYo7b55dahxrWOHIGDulQjmQgzfB
         7V9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05M7G+yD5bg2zpxfBRZSfkHw88GfIvX7aX3Dn7f4FHo=;
        fh=PkzNvgQBPJze9zuQU62EVFnyuBv5Hv2OwkuHb1ALz5Y=;
        b=h/4F6+ajR3qxzx4FfJ2qEQuKLscpw7lVF1YvCMPFPBqLXQZxshNuJJeFf/yHAmbOxK
         VjYzGbaTVlHQ1QCHHaGiOBHXudXHv4csSoD8n8jcFAXtY4SG/Fz36ocln+3perqOcrFF
         wDsYtHzCm1RweAQTk7Ap/hZx5dltsUPj7HhdlliHmpoRHZHfwf5oAt+oNfkJ8rkUIiwE
         TG0O7V7fCuowdXZ7m/NFk4FvCB8f3KjRiyyN2IZP3+dldQhrGdPEepxNbux922xVLs9C
         ctqSFK+S68KrgVTpnnU5Txs4fresKCp7WPCZJa9ElmKjG+gU05o5TrlFPR/1qOCn7O/2
         Gmyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767912427; x=1768517227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05M7G+yD5bg2zpxfBRZSfkHw88GfIvX7aX3Dn7f4FHo=;
        b=NGQejxtf2Jaa+RGslgJRJN+JXurmKYzqnYxfVp8GPq3Zay9NOOR7eoF3Zscb/0kT6J
         BRXM3Koq5aNwJG6Xs9rIRhTbWIS1/1hmL4glbb95HoB6mT9RiMEOHNw6wIc1rTBTILlQ
         HwEosyqJ9ExuavMPnseG6vxblXkOSut6IYTp95WMS6rKmy+V0pF3ZDuR6+RlfSJf+XRg
         hUmJu81DWN5mH9KtOy99zamcPFbKZf+e4BVQIa3fw50k7Kazafz5+mfgGrzwZ+uMJwdU
         rsi1333NfXMsMETzrVe+4gUN7q86gY2CLx3o3Yzo5e/opPEzxJi1AQzEnFwZNeYNTgcs
         yE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767912427; x=1768517227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05M7G+yD5bg2zpxfBRZSfkHw88GfIvX7aX3Dn7f4FHo=;
        b=uyrMaa4VM7H4N40rde6dmeT280nDVtHP7Lu06nnA/JdXUpeLVRjSSjs3ObRvwOOYng
         ugoESFDIRfX5fhvReIih4KS8GQhR1wFvqgkRA6eT5pvOvF+fZFVZpQMRgKC8UZsa0FPe
         aA9xD0t2qKb3PwseF1N5wVHe/wuHA4qUNrOtBGxGcJRcOiGOzYbqp54U3Q4U9cjvqqCh
         /lPZ/O9e1XDwR0CqZqD4DX9OGxkGsm2on1DZtVKPZuv3a8MSvSWqD/DEBHI30WeddDO3
         Oqf6Bk23bXidILYcWkD0ztUPBHh3Hsf33yqiieW8iB6JzB7xkSKihMwy/obMPEW+g3e0
         Zj5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkrIjfdmApFaJ0TO/CX8HQtfY6oNcD8ZDs9+0YodWY+mHLD69/PF+Gb/Dh3X1R1RizzggcWSYqSSI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+SLWN7mSMxKgcNrzMKsc/LsXSba9u4dIQngdaWt1gea93oHYJ
	nU7fmYcIFB8R8LwV6J40FYVBDX5ydzFgE/DlU/ywOK8Q6oBy1yu3UpuzEiSYKDrjtL6Gf86tiE9
	67/n58K1wd+vhRNhQh8cdUtzv+Sr5vg69kdLw4C+o
X-Gm-Gg: AY/fxX518FJk/+bTr34uok+e0KkTGFw1l0SiExHBQ6Iq0/HO6Zo41TNQMkwK4v/YkXP
	Y7jlThSRrpHJe4bn6g7wGs2HTa956dfBFji+ZCnzuh8uO9Sc49FPRtwji6nIRPO8pM7IU7NIWHk
	dK0AfqvvKHzcr0lbrnbUjh7vNsmnNKDiP0ZAhNyOHvEmL93Ly8uZpoJdCwPrCMB5QkZE5MlZ8q4
	+s263Es+whYM9RgcN76PNzyX/grOrap9BpDGcL7Zt8TvEHHvBWdAxSBrNseBLuuoQJgihBwacwW
	efmVGHUDVOruUUhnqztgGNe311+Sfs4gltbK1ryWIkdppETbGTu/bFzsudlZVg0rO3DMlw==
X-Received: by 2002:ac8:5782:0:b0:4f3:7b37:81b with SMTP id
 d75a77b69052e-4ffca3ad29bmr3817721cf.18.1767912426910; Thu, 08 Jan 2026
 14:47:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108155816.36001-1-chia-yu.chang@nokia-bell-labs.com> <20260108155816.36001-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260108155816.36001-2-chia-yu.chang@nokia-bell-labs.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 8 Jan 2026 17:46:47 -0500
X-Gm-Features: AQt7F2ovG-v9G1YvqpyTasF2O1QIEJ_BUtc_E8UKj2kCrrVV8U2__Yy5KoIU4r0
Message-ID: <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com>
Subject: Re: [PATCH net-next 1/1] selftests/net: Add packetdrill packetdrill cases
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, edumazet@google.com, parav@nvidia.com, 
	linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 10:58=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Linux Accurate ECN test sets using ACE counters and AccECN options to
> cover several scenarios: Connection teardown, different ACK conditions,
> counter wrapping, SACK space grabbing, fallback schemes, negotiation
> retransmission/reorder/loss, AccECN option drop/loss, different
> handshake reflectors, data with marking, and different sysctl values.
>
> Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Co-developed-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Neal Cardwell <ncardwell@google.com>
> ---

Chia-Yu, thank you for posting the packetdrill tests.

A couple thoughts:

(1) These tests are using the experimental AccECN packetdrill support
that is not in mainline packetdrill yet. Can you please share the
github URL for the version of packetdrill you used? I will work on
merging the appropriate experimental AccECN packetdrill support into
the Google packetdrill mainline branch.

(2) The last I heard, the tools/testing/selftests/net/packetdrill/
infrastructure does not run tests in subdirectories of that
packetdrill/ directory, and that is why all the tests in
tools/testing/selftests/net/packetdrill/ are in a single directory.
When you run these tests, do all the tests actually get run? Just
wanted to check this. :-)

Thanks!
neal
