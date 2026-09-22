Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2831C5304A1
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071992; cv=pass; b=tu0xlteF6agx4ZkWtfzIACbfghMQ5l58TpQUEKomwNkSjCF+bnt9zC+pZ0jRGw8NAL4Ymj/fVnDDTeYDYOX+MXcy3+RSWYkGs5qTmPdPQO2rYxmXd62p4DuDjK59/j6YbYBb/xeiJgqhsM0+9SLkEBeHw4c0xQ3/gJFk74T2l+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071992; c=relaxed/simple;
	bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iBb37jbVhl7jOmHhjZFE8Onhzm9Pspa3QWtX0a5jVf28/86YhK2RxtRWpu1CF2t9PeK4KBD/uh2sYz0iHlQU2rrBmRf7nBuWpk+/hXz5xBksrhXjnlyNez/unu0CiWs0Mp/l1ilIGabfBjsDJC7drfxL/gv/zo/XeMglNUrGuL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIsGQHnE; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIsGQHnE"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c985f055b9so861808e0c.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 03:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790071989; cv=none;
        d=google.com; s=arc-20260327;
        b=WjCfFNK2h6x9zNQc4jKZqmgx9T39F5H/6CkEnNHktRArmlLEQ5CvYofeS4NY2O0Och
         igxVArm6UyXYWpfimfz1INCNiVQHkR8vfz0jZPjgxCfucwS+ukR47TRvBSzH6mEFHuNQ
         I9rQfYhG9OiSuOLYwg7CoSX2nKpadw3/9hG/ZjiyOKtXebDIe9e1NRf2g8WJZBN9C+B9
         eIhFIN8QHkngFC5DixSSG9ZpcgZxUrUkl3GOM91QhiqTKJO9AFzhXtTN8ssdYHRiFRrm
         w9xRPAUWUyOR+KR7E73C81bwLWjrhuSIwi0j49N5v7vYs43/PnzofKXPrwDADllcbPXx
         L9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        fh=REkBiVhDgtUI5lSiCE95rOhEGBZBjI9OF2oiMCdM5GA=;
        b=ePaiIvRWMQCbARSp1Aiah1n4YfA/vPb7jaPEsgzFn1zBFQg59VN/4l+CsDbbYTEVua
         v/3cAYP/1vShXZ3gMH0GvAym1uz1F4/4THwKkM8i1JtD9VtfGiMALjhlj+gPF6zCcTKv
         +QdwlILeB7HRnQ2Mhb8Tq8q+BmtXAo7ei51f+udgGavT//+jOk9gC7/PAdkMeOH+Rpd4
         QeaUJYKoxOtDaWHEDfMe37f2Ev6oL4Pm7ilAmacLrfZFBOe7951O9R4CxoNtWXF0ZdV/
         Ny+x+iibb4xg/uDUex0FtA7c6rYzE9ZsDOsXcUyT4PJEL7qdglEfSWSZQsK1LXRQi/0d
         hDNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071989; x=1790676789; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=XIsGQHnE1pPlKZKqZgo4ilQtUMe4Cj3c5voawIYa1Z8Bh3WzEN1H8/7GoChObEaZVW
         G4RZsHUbNEH+/yAoJ7SB1VFNsbEl7hplQzwO7i9tjnKmCTWCkXOsYksFfyyQCD/H4koF
         w8utch5ZpXHMzcSx7/UDCPTrouFxQenf5hPqXLJKYjNyhbG3NQv06eHCSM9klgCX2oY+
         21WnEIAk9gzxld6HlD24HeKtJaShfpUtWoIrT1JiOWZE/mIulzWtk9Kxc/sg2/ThOs6k
         J2H/HmSbyhu8QUlqqZrhwM/opShTb785AFnOI0kiOp1Ko+gc4+J/nvtin+4EgKnZ2Ayb
         fdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071989; x=1790676789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWyw6GenqzB0Wv/KjUzt8dv4Hf93e69h31+KA7jwNuM=;
        b=ra4C/twaNGIotfGLGANRLe8AjRC0uX8yWMgJuczAa8DW+8t0IXX+Za9Mz4mq7h4eOQ
         kYcqoTKIYJYQ2iVOYAXm8ojEeO+YUQC1hYBDRuLVJUmelYhM1lYLA1N/yaFt0g5NUczs
         5VmDvJC6P127FRwsJs+WxDE+WR56+WSKLe5XTQFQGMrYva//EJqmnNMiZhnfcB6IrHIu
         F48iImGoDyg2byWd/aW7yufIxhTwLmFw0OcIprxDxiJBZSAjJ8mGze6g8igZRB+s1TKt
         h8KHxeYGA1pdvEzCKXQlIJ7L7S1ko4aeXSa8D2zzPZsmVgqhVci0okKaJJe3l2cayeju
         jtlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs3Ywn9hZnhSYgwfcoYE2T6ukeqmYDsHrKbwczgdexD8IejR2fPDwNewN+J5TvWVp+lfOMwE31+YQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nJsloB0VlhOXqZY1audbDvdX0H423hnzTbRGTizWKaV8T4e6VH
	R7KWpB63aK51sCf4u7TH2xE5+ADQJIfVfvJ2NfhaJnuAxjG8FwnKw7AWnH/T3Q3PSzCvfrjBeuy
	TqsqwqHjYGb3b3v6X2aBNYDIELeK+Nho=
X-Gm-Gg: AYBFou2PI7z2FmGXq0HXYKfM5RhGYOG5dDwzZMbijY/uGZbih+uNTqAWHD+uivGy1dX
	INceW/el5iJbsy4UV5YZO3v6np3UtQIEWFblNOajXhzEVBJh5K/VwXcFSvnax7hDuX7samI9lPe
	79nEJPjnNFE6GYCdweFoDdGlbV1qJZIRK8JKGN9yP6+pS4uiZBpHxYn2sWQWLiurYSknTqOYxB1
	+ypEHz6EAUoUgdGRYuh0VRzo91fYVTGiAtzaUZ8/YV2BodIOG9+Z45QxxprtjCpvay0anzEBjXT
	kR/NNnb45RbmN7Sr8KvyG/M6g2rJuWsKLavrUiLL7nwb11JOm3uktw==
X-Received: by 2002:a05:6122:2b8a:b0:5c9:9f03:cb07 with SMTP id
 71dfb90a1353d-5c9e343983fmr1483343e0c.2.1790071988975; Tue, 22 Sep 2026
 03:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
In-Reply-To: <20260921135933.7e8857ba@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:12:56 +0200
X-Gm-Features: AcwNN1XO-IQtQQeBFy8m7z0RqgCFyAn_vcQf_nLSSDZxar5hmkBbTIMafTrhl4Q
Message-ID: <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 21 set 2026 alle ore 22:59 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Thu, 17 Sep 2026 01:51:26 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> >
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
>
> Looks like the review for one of the patches failed so it won't be
> emailed out:
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260916235200.20712-2-ansuelsmth@gmail.com
>
> Are all of the issues invalid?

Only one is relevant, but expected.

The remark on the fwnode patch are invalid. The driver is expected
to return those error as probe defer is not supported.
(a notifier and late attach/detach is used to align to phylink logic)

For the specific Airoha PCS driver it's really speculation from the AI
but HW doesn't work as described by AI.

The only real comment that is valid is about the alternative way
to give supported interface with the .get_capabilites OP.

This is currently not supported as there isn't any user and it will
be implemented as soon as there will be one. It's really to limit
the patch delta of this change and to progress further.

Maybe FIXME might be suitable?

>
> Once the AI review is cleared, some human will have to review this
> and vouch for you as a maintainer. Better still be your co-maintainer.

I think some revision ago there was Andrew that reviewed some code.
Anyway thank a lot for checking this once in a while, I feel it's a pretty
important change but I understand it's complex to handle as it does
introduce a whole new subsystem.
