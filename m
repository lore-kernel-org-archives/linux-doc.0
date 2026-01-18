Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6033212F98
	for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768752662; cv=pass; b=iiGjdcEUbZz9y/ec8LXeFOoXHF/3vcLEJXmxoIVXz78vqP4wpwh67t2wyurYYzI6iMtthlfCnmodKHFUkarNWo4e9mkMlIk+Y4GVCjigO7SwpekvHksRa9E7p+2VjrbFxTMtYeI5JJwIGBIDwAOXjfQQgheFQXUOJpT6xYrcpaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768752662; c=relaxed/simple;
	bh=0JEpv1u8AAklgZXOaUjF/uve3gSlITzDcBypad/O0O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2fIhadTKQRSA7mZFRdf/0kQdLKMxzxoWWrE5/ZprubLAtCBzcI8nmUlg1/mqU7hAmo/FjciHQPloqctx5L+0NpSWA6zwEMRWKTl9vmNgnkn8Ia3buK0Vnmxt3BimaDwkFhbug9lpL+QPSpXGc3rym1RBhGXFLj7GJa/8gW3nBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o6XaMVfe; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o6XaMVfe"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50299648ae9so539371cf.1
        for <linux-doc@vger.kernel.org>; Sun, 18 Jan 2026 08:11:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768752660; cv=none;
        d=google.com; s=arc-20240605;
        b=CyubhG1w/8P5YAL9n86T7Oiw1t6Bru24zqp3pJkvvVDBYyAk3U1EU2L7xjyWnKcIbq
         KG0Sq5iOHGTqzvEEW6xtg2/h2M0yoDeAxmptuKEfWCHoMmKhTb0u+g0Vbpex+CeBVFxe
         z+DUNMq5ZC4kLqvYJpwx2XdlbkaJiODVUJhC64WZoYWa4lzrqW/RtzHDVgmVxgArTcxp
         8gM2Y7rVTrqmIzN2lxlG2h7HRt+LeXissJj5YM+vKw0dVmGIrsDGwO1lA/wasM0O9v1k
         hTZ8JzAifnMyh6wH0nA0f785A2BMmsjVlb4iN90nDxTOMsDCmzJCnOTlb5KM0K//yFL1
         0Wlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uOQOX9EFLjUIlu2BazfXCgVYe+lL7//UbrC4sKaqc4w=;
        fh=uUet8x3RdKu4eLFiLTtCkjsVBV3xWZGVWYTRhqVxkpA=;
        b=lkXTL4V+obk/z4u/2mSJ49alROi+WnRgLzBPDSFBmymwudFjSLxj/ZtluLRKl5Y+dK
         yjpNaOeKDwSnKEjkFuHHdzdQotXMtUCLsFsRHtRtHze71yXwh5xMXHqBKypcAeWupK9P
         CJ0O6gjWPxOG7D/WUyXPc6FBoVffD528YuEYRW4dfDhw/PP42pjaIoVMvFGiCPzp9dFd
         DEDjCOhVwGUl+Cd6WndokJHEjwv6zG1/HpBxHlH/rkHQGT2CUqcEKVbeysk35UQUVDyV
         O/ulgInZw6MoHqYa53ryBPjyzhoBet5p+skY/DU2eR3jjs02Ia2QyoMv3qiSVgWKxqx6
         cAtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768752660; x=1769357460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOQOX9EFLjUIlu2BazfXCgVYe+lL7//UbrC4sKaqc4w=;
        b=o6XaMVfeClkjpRcSgzZz6ylPmhY4DzRtt9TKBZgcXgb9UBFd4eGSJy3wouiKYeoxFZ
         +dS00Qq+oyGb1YwCrkvooeHOr0y5bV/hGVGwIrhbmVGkcVH7PJJE01wr4anVeqSzQobf
         66NZEO7pbzaQftNGzUWh5O3JtHyWCC902akFDKCQpxLgyZ6/jUTmUbQZh7C3HUevO5TP
         3337NTE9Mu43ev+xQsctB1vLMjQUe4Lp4pAsQvhCUNp2qJNn5Sh9fDkSfXpcKoCJMUhP
         vTjHYNT/7aXvP+tzo0d6oAVG6NGcAwRdBd4I9+waz5sVmzsYBPC+suwxJvrX4W3lIf6Z
         LO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768752660; x=1769357460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uOQOX9EFLjUIlu2BazfXCgVYe+lL7//UbrC4sKaqc4w=;
        b=elF5oYu/jQm8PrxA2jnEn5H+fcWW0UUPr6neegoa0aEZf3G88+DYIhgbnBojJj08sa
         CR34tczW/dacAnYre8+CgCENerbGr/ydSAq0W7JzJ+hsPGMXuKr959+riSdkyboY6Q/q
         mG8xM00J/t9r+twPkJPD2EqgQRcWvlG+AmaAkml2P37n3wbHaI7EyoeA+REwaY8NyW5f
         2cMLdseEBNA572Ve46EWReVU97yaO6Tx9lTB3ezRiIHgbIWq6Rzm4o5hmSEi2dolnHHi
         A5a1Kgv9DPd3KnWXIJ/Q7EOaik62p0uBBrEzOXX0juucJgwpJdsGykq8Uvwff7jBT2DH
         HytQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzIhMhai3kSBtbPjd4XFDb1xIYGxuJB5OypDM3cShrPLXbHunXoVBfiwbg6VIHt1szv+vLmyPH9So=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQv5ngHK+e21pK/1LcQA7XCzgMJ/hxGBMaWzVUgX8xFDn+VFvx
	GdRQ3v4zibycnBXSkdDgV87j0eFliWSW+dnKlQJyZ/6wuplj/FmYsqfrJIXf3Ru9fre+r/uU/xq
	d2zp7NAbVV+iC4rORD6+GNGNPxC33JD8r584KJy1E
X-Gm-Gg: AY/fxX72L3gOydQJG2sKeLBnhjq8ekW1QGtV4fsGe6PpFClEMBjEW5l6MyF9LbPhR5H
	+Xbdu6coTzHXfhoNIBCx0CmxWzSsDbQSWOhu426unS+vLZK/s8eMJL4NGeEVkLwA45IuCYuLRcc
	Tw494SZ5iQBB8xGiKPWXQnJQ/g49euXLTpeWL1XRf7W7GNAaSDXjpBMR8Y5NAdePwrHYHkHhHS/
	duEvofIQPGix/PIJBlLB91sf5hCcFIJQxip3jdgHi8cRlHTmCSl4yeC08Xx8uMMNwLZN1+85IkQ
	kdm6ReRmlkhS0I5i3s2BKhOnFoSDFRwVtG/6NAUrauRAy4v/2tze0SPVP8ok
X-Received: by 2002:a05:622a:1342:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-502b0673b32mr11255181cf.3.1768752659324; Sun, 18 Jan 2026
 08:10:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108155816.36001-1-chia-yu.chang@nokia-bell-labs.com>
 <20260108155816.36001-2-chia-yu.chang@nokia-bell-labs.com> <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com>
In-Reply-To: <CADVnQykTJWJf7kjxWrdYMYaeamo20JDbd_SijTejLj1ES37j7Q@mail.gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sun, 18 Jan 2026 11:10:42 -0500
X-Gm-Features: AZwV_QiOr26zAWiUyzYVGxtB4uUNxYcdhHaXiVDyCTcYKsivAZl7luiVeGFtNPs
Message-ID: <CADVnQynBnqkND3nTS==f6MGy_9yUPBFb3RgBPnEuJ446Hkb-7g@mail.gmail.com>
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

On Thu, Jan 8, 2026 at 5:46=E2=80=AFPM Neal Cardwell <ncardwell@google.com>=
 wrote:
>
> On Thu, Jan 8, 2026 at 10:58=E2=80=AFAM <chia-yu.chang@nokia-bell-labs.co=
m> wrote:
> >
> > From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >
> > Linux Accurate ECN test sets using ACE counters and AccECN options to
> > cover several scenarios: Connection teardown, different ACK conditions,
> > counter wrapping, SACK space grabbing, fallback schemes, negotiation
> > retransmission/reorder/loss, AccECN option drop/loss, different
> > handshake reflectors, data with marking, and different sysctl values.
> >
> > Co-developed-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> > Co-developed-by: Neal Cardwell <ncardwell@google.com>
> > Signed-off-by: Neal Cardwell <ncardwell@google.com>
> > ---
>
> Chia-Yu, thank you for posting the packetdrill tests.
>
> A couple thoughts:
>
> (1) These tests are using the experimental AccECN packetdrill support
> that is not in mainline packetdrill yet. Can you please share the
> github URL for the version of packetdrill you used? I will work on
> merging the appropriate experimental AccECN packetdrill support into
> the Google packetdrill mainline branch.

An update on the 3 patches at:

https://github.com/google/packetdrill/pull/96

(1) I have merged the following patch into the google packetdrill repo
to facilitate testing of the AccECN patch series:

"net-test: packetdrill: add Accurate ECN (AccECN) option support"
https://github.com/google/packetdrill/pull/96/changes/f6861f888bc7f1e08026d=
e4825519a95504d1047

(2) The following patch I did not yet merge, because it proposes to
add an odd number of u32 fields to tcp_info, so AFAICT leaves a 4-byte
padding hole at the end of tcp_info:

  net-test: packetdrill: Support AccECN counters through tcpi
  https://github.com/google/packetdrill/pull/96/changes/f43649c87a2aa79a33a=
78111d3d7e5f027d13a7f

I think we'll need to tweak the AccECN kernel patch series so that it
does not leave a 4-byte padding hole at the end of tcp_info, then
update this packetdrill patch to match the kernel patch.

Let's come up with another useful u32 field we can add to the tcp_info
struct, so that the kernel patch doesn't add a padding hole at the end
of tcp_info.

One idea would be to add another field to represent newer options and
connection features that are enabled. AFAICT all 8 bits of the
tcpi_options field have been used, so we can't use more bits in that
field. I'd suggest we add a u32 tcpi_more_options field before the
tcpi_received_ce field, so we can encode other useful info, like:

+ 1 bit to indicate whether AccECN was negotiated (this can go in a
separate patch)

+ 1 bit to indicate whether TCP_NODELAY was set (since forgetting to
use TCP_NODELAY is a classic cause of performance problems; again this
can go in a separate patch)

(And there will be future bits of info we want to add...)

Also, regarding the comment in this line:
  __u32   tcpi_received_ce;    /* # of CE marks received */

That comment is ambiguous, since it doesn't indicate whether it's
counting (potentially LRO/GRO) skbs or TCP segments. I would suggest
clarifying that this is counting segments:

__u32   tcpi_received_ce;    /* # of CE marked segments received */

(3) The following patch I did not merge, because I'd like to migrate
to having all packetdrill tests for the Linux kernel reside in one
place, in the Linux kernel source tree (not the Google packetdrill
repo):

  net-test: add TCP Accurate ECN cases
  https://github.com/google/packetdrill/pull/96/changes/fe4c7293ea640a4c811=
78b6c88744d7a5d209fd6

Thanks!
neal
