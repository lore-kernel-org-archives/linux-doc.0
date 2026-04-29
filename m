Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCCA1E9B3D
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 00:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777423150; cv=pass; b=UQ0eOfmcAc2WrE78A/c5/vTVYBqrmJ9HXiy2HJh11JdbDXkpg04P4+j7xMJoRi2LZS9wGNxl0N86iJJB0Xg0Lvu1ar1eGQalpt43+j7nCr/Cg5VS1WAXZGigrfnc4+SSJDPdZqMIJvAS7EbLK/G5bUps9tBH7Uiiaw6TUxf/6H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777423150; c=relaxed/simple;
	bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ho6oRF+aCpuGwJ2imoo8lQa4GUgHZrh9iAzxbU2kPBdl499O7E+limi3H+o/XCdBsLpStBOTX+mUEo2osvO7XnoPgfok+M6kYccRLdeMtF4Jhm+7MKOzgXhHqCV5TNI/uWvqiBnGN3t5mdxLoBa6ifYofJil0+kPArNCXf7mA2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ligiHFGm; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ligiHFGm"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2daaab98000so679681eec.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 17:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777423149; cv=none;
        d=google.com; s=arc-20240605;
        b=OJ6H65f8NN8mRd9g5KijqhFfTIwVx8QvOQJZDb536FihjPqhdwHyQuxE6Zhn0ytnJg
         Sfjl/51s5I+f7rP8So2nQXsCawup1pw+CsB22ZYhGI3Kv6ghGHduINeNOdVn/eeeQnra
         S/WDN+5OTqZDZ6dyIqoXmZc1oPMsQ2XVyxChKih/OR0mmdaI8/puJkQoio0+nFZ0DiUq
         tolr3mV7BeNSjKA22UpXPUSL1ZZd/gpoX+V1bWelWE938eHHoAZDj4vUvAmu9DO7XgaL
         DYFtz4lEDHZXrdN8AyLAZMPdgpSnHKuAuHPajzHdgPmXnWORBrmLdqz+KEoNMD/SZsuo
         a3ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        fh=iRSHdVdQ//BBuJH8T2wmxPKQL8LP24ExXKUj52wcdZg=;
        b=MMIu3n7SPRABV7qTCPKWpTWHNoCIrme4Sl+cXCkJ8/Z6Aen4vpNcFW6PtBD5U1CMaP
         gFl6Z7sETGu/13DlGEmBK9gSTSE+uHQ9Ig75iyycySliUv8/Tny+uOuPR2WPgAWNFark
         SVJjFm0xGnoi4JoW3YM1kC2Gv5WvZ92LENb7YiBsE+5P1JbKQ4cB5C5iIBqbad01jIyv
         4SApQ58l2MxkrULqtGgs+d6CjBLhpH2sSia78YtDJIft2kq/QODw+TdObqqrF7Gf0HVo
         HorDJpaCHKAt47VHB4xoinCDZGgGst1VnAJg7Y91FH9QwStRaTBD6Om0viYx5q/bQfws
         t72g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777423149; x=1778027949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        b=ligiHFGmoEzy02s+aQEWyPs8/vVgGjhf+LWOxkCgUvFlz8wHcDJQJI/jPWqJgTlg7Q
         Qzo7GkcBSJjFK1ScFqM8GxGMlaYfGeIzywTunlJUgFErhjGkfzuGFrwxjzXVQcmoRcAj
         o6WU0tJU+2C4zb+cxC/NTzvXvCDQ2qGesvZPeV4g2JQcb6nRBTGV8E+zksy/y9kq8jgY
         oNLgPrsKYgwJD4EPedYqyP/7Ssd+DRcFRTo3l4l8+35LzQC25zeb6tq1XwXF4pCUFkDW
         0JqvW3aL2WmFPW75E4IU157ILtX+ZZsm16rCgo/XywiM/wi9hEWfItgE7fY+EsP8y1VR
         C/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777423149; x=1778027949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lnq+RzcTqQApY6vrzuon4NmVdC+fOyrYiS6n6xe3zDE=;
        b=JBu/JnpEBw/6aF8uApMcQKbIAX2UrndGkMuZY5TVVUkck8t/E670ss+HcNHVVhPsoy
         kSkJ8WP86EcvpehI/P+6tWdhuGWlqS9wZyVTyd94sL936vtmhBfGms6HHPDrmpHedBwL
         ffnVjoKP9WLkeZxtTfMUfY1Q5eZXpB6OOkCWhcPI8LQwFQdHPif8TjHhfoM/5xbM8mXD
         XoS9WAgcnkUBgJbaqpaUOuFlIekmuZokL+xWYFWrGlCV5lDnno/ysrUNJ1jLlX4qQxLR
         JBoRYHY8rXzTXoBSRVByxcwjyHSJBL2N+6qed34hZ9J86U7uyXxscZOfkMMyr7vbKcMO
         dn5g==
X-Forwarded-Encrypted: i=1; AFNElJ/yIuGoyoKfZNT8U7rmObV0Nb0FH3zunMvxwYJVy6kCHDobBpBGJmyazppVnly7YKwd8h5xNsGDlOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6I07MzqD21Zue+couB8E3dUfeRCv2nsdUfpS9QdHsurh6/FYL
	dl1cEBmg82NWYl+DHGYi5kVoj/JMEVTM9/VKStuk4ftv5iuLJyn5FcPg0+5EiovBF79GNiWqCiC
	Zjdw5ZM72Ja8UWkMpr4oAlZyoWjM7e/0=
X-Gm-Gg: AeBDievnYaq5p9bxWQQBN29pW/fkXzUfinD4GHuQbaDb8w8qzh2pjLQmbCUVmZtH0aa
	JjC2jRMjt0s/KD/+T4kPGU0PDCzt/1T0QQVtbPuordxe75nkFKBzTulX6TNcE7axbPUuSOla0Ls
	88HIS3qQEZIgvKNWcKwJlf8Cm1CStx+5BbpH4uy6RPBnprtjlKQgpFbQ+A28ANYg4FmeKJMevzA
	4CNfDAItjlmvPeVbVPHstsSdJmGJofgb0hskEGN7yv8Z/UXW37pFSse6/fxGgZ2aSKxht4BgvmJ
	G04yPDFXurYmcgJrjaBXao3Eo8Z7udXuIKbEhC8B+QHinr39eHY+EU+Z33kSidyUC0QDN1mttgf
	6bsgxy1pDx2ch2EaoGP+aUNh5pSwdi5h+0g==
X-Received: by 2002:a05:7301:fa0a:b0:2e5:5bf4:886c with SMTP id
 5a478bee46e88-2ed09bc6856mr1151978eec.5.1777423148670; Tue, 28 Apr 2026
 17:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com> <CANiq72=nCw+zWYhvPMJiG8oOT3zpaD8eGVUgaK5rnSzAiGGjPw@mail.gmail.com>
 <607be3b2-11bc-4074-a396-39da73089b74@app.fastmail.com> <CANiq72mEgpe-UGMQ_YWb8SKsY96Oc0b4sQ_MKvhMDVkNC9WvQA@mail.gmail.com>
 <20260428184511.GB3304253@ax162>
In-Reply-To: <20260428184511.GB3304253@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Apr 2026 02:38:55 +0200
X-Gm-Features: AVHnY4Jhkf1YJCEOdRRUOwzbTzh7X94i3-EvhUl39GdPP65emmpf3WcLQ5yzpF4
Message-ID: <CANiq72mToO-jvEqE7VyqU6u1GK=bO-U+FD4Ei0c9HOgyzM+53Q@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Julian Braha <julianbraha@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ljs@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 8:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I agree with the sentiment that more host tools may want to be written
> in Rust. The Rust build in the kernel does not use cargo altogether, do
> we want the same restriction for host programs? Would these tools be
> able to share the Rust build rules so that we could have a simple
> hostprogs syntax for tools integrating with Kbuild to use? Obviously, it
> might be harder for some programs not to use some of the nice third
> party libraries available but it seems like it would eliminate the build
> system considerations from the discussion at that point.

Yeah, we have already 3 hostprogs in the tree, which just call the
compiler, but it would be nice to have a way to use ecosystem crates
for those and userprogs etc., even if just a particular vetted set.

Otherwise, it is quite painful sometimes to use Rust, and one may
prefer something like Python instead (like we did for
`scripts/generate_rust_analyzer.py`). Python works great for many
tasks thanks to its standard library, but we lose the advantages of
something like Rust. On the other hand, Rust without a few crates to
support certain common things isn't great.

I wouldn't say it is a rush, but it would be nice to agree on an
initial vetted set and try to set something up so that eventually it
is easy to write scripts/tools/hostprogs in Rust going forward.

We could also consider an earlier MSRV for those, i.e. lower than the
kernel image one, if that would allow us to use it in more places,
like for hostprogs without assuming `CONFIG_RUST=3Dy`. Say, Debian
Oldstable instead of Stable.

Cheers,
Miguel
