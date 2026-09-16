Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6BB5581E8
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 23:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602840; cv=pass; b=SuuLe7Bu1oIaFDaeXAG/b9OMzPw1nG2EbJH/DwNkOdjgrzVPu+9Om0cwMa1CtCRmNvVpCYBbmHXDbZ9jg5hZj++Qfdc7Fjqb/C7o14eI/rEuQXJyiYguk2mjWD0DEWlksnetCuxr+ZAPATsVohYRRT5jXgAGThCOelWahy9mj1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602840; c=relaxed/simple;
	bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfwpqrqCIMjn9iuoVoBZYYOkGwlvKkI6pSFZwRx+xHNIB8E8fsjnPK9JA54rOAK3wAOv5UA0yA500F3CwCuL7KWMuAMN1dPpy/V0H7iRajbxjbbYGCIpRsgaT+nEeOluALxDLlXL1nvCfC4fNAPhl4FguwPk7MvawmCG32ADxyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArOkzrg8; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArOkzrg8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91064d2d54fso2390456d6.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 16:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602837; cv=none;
        d=google.com; s=arc-20260327;
        b=qyxyWlyGvjX6Gdoc/tctM8C3lZM/KKbOlSjjxtRrdMZ+Zy1Ev7oAaVn3mzbi/7Za+0
         bHEC7IejYz7cBo3GYahjG8mOy+zLXycYP7XN5KgDxwp+BNdjCikB0lbAdc1CMbaa4Q+K
         j6IvRvTVPfuA/NTxKH6hK8eLI+wHrB5VeyjCzJCZRwCfxRf+XEcdHgVoBfCeSREjnEi9
         ObN2mtrp+biZ45Ug0L5zOyahGh9MpPqhTaS1Em5RrCkXON9rRyRTAapGZYXr7+1eHILc
         d14yPFdCXZ+jQ23ZcLgpzbLDhlshpBRVUi32UUzXlGPtmNc4CmUh0JpQnwKXerGZHb9p
         RusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        fh=vAbnsmwhibcgVcK5aCvN7YFifEhYjKHJsWQW7qYQ9m0=;
        b=ScF1y9Vl+TVvkI3pW6fILEAhaOInDQU4dwyO1176sEX32nTYyP5E534D91SVahSapn
         Qkk8IRO0Ll3m+MHhYem0nfP1FsYeJAWThOpiPez3GW7Dh6gGDXuXq2EeMi+NGvngrk9i
         a0kjy9qD8ZTtD2q5hn5llP0l02wBpX7DdsdQ5/ItubKdY1LGZmc/yI8X9boKqo4D2UVM
         70FAONNLyj0mRnisp/XBSz7HTapLpwrcm7gYPfRB954ehoZwCykON+jy8SThSz+qQGNk
         UQ+k0pxrO+HrhTUzxQmlYWUCr8pETIlrzsqIIo4iWeTj7zhNRYQV0fJmGMG+Feoo4tPX
         4ahQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602837; x=1790207637; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=ArOkzrg826arSO0VE1NlwbWu/vL5x0ReoqjRP8VxbLlXBDnsEsuU+pXazae/taCubh
         X5LqWj8yiH5a2WMQDp0lsLoarEtA1B50vqLDtT9LJ5D6RHafupLw6/8yEMNj1XD5B4Rw
         vXpGOsHrYHjj9zo0PGYT3hd2DcjLRnfCpWNzn5AYb2q+wdVKUaLnyNk+JTcgqb/tnQdH
         PgH8IqL5q8MXU8QJ8NJGK9bwSfaKLzLWUBLx/7UXOWiJpG/R8gPKUJGvXiTHIDSugIFT
         uvBHT6KqjBuqCp+qpri2oO5K+rmPhLLdhcMGcRGE2pj2aFwA7i8T/QBZj09J7bkjEEg+
         VRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602837; x=1790207637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=KwxyoVnAnxlmqYwmZRiVeHDV/w5rZm188OwUvHgyV0QAEnjxfbF1J58afmMgcWOg4Y
         Cz0Up5Rg8dQCRcw+oV+JMplh95ERI+JbT3xkuI8sMwarOmQXtwOw58kGVxjhBwsA9PgJ
         mdq2Tc4De/6s/9EwBRXo64KePuBw4jbf8/BqOc2ah0eyb9ZIxknp+ic1RwCDWl6rnB/b
         uWU1ofxLrQupU3DTmw6Nhl/tjPJYF/pcLY4RKd8Vfzlvu6PhTej9s32ROUEO9fCFv8O3
         INVhyWZo47Pf/DP0NrfGx/jGfFwqEyC6Y5dxrUXIUcvXDsczlhVa8bbvGAbG6SeTmTbM
         QTeA==
X-Forwarded-Encrypted: i=1; AKwUvByt3fZnrjFX5M1oTvf0/cVGqzKOFaaGb+BfBZ1c3juRgGdFbs1CR4C+/M5sYQP9kYeMbCOqyF7ZsD0=@vger.kernel.org
X-Gm-Message-State: AFuF++nK69LFfJWEGlGxJCANxUqghgE5uf97p+5khcNnOWo0TY5E1nSM
	Xq6nfjm894vsNSdJ7eIQB0K8z4SeCL6byBFjFHkJbY2VA3F7sQdY8BSlAHQ9ClY8sl1WaWJbYqZ
	tyWTffFlVQWIiMGB8b9Ok5byD4iw0r1Y=
X-Gm-Gg: AYBFou07ReG/lz3nqvr2nSaJoEVlSYSvXIOLdA60aE6/xTreNpj/vORlIQxfoWjA7fz
	//2zaTzxgJPmqDrZniC+UNjYSlYGUa6oWI0nBVulmLGB6o9Q6P80qK1mxKqPOL6uqNzxlPVNUrb
	4EnAirQtG9nFYUa4pJ+HG87wxyXQceiTFizZXpjRm89j4olfiEZiGd4JKptVa1AqbJZ7HsO9Gtc
	FjIk1PXZghu7sAaWYzOvnEC1CATLtqOLqlXjHqp49ruN3JMkOFoFhW6pyy3ZkEfBfY9jxq2vHuK
	8LmkyZiCDBy1mX0CXdyDQ9wonwUjt5hRqb0xePW+lyVsbPMgrsTp+pS9LK/W/9OqCw==
X-Received: by 2002:a05:6214:cce:b0:910:94c6:2ea1 with SMTP id
 6a1803df08f44-9123d7318a0mr91642006d6.12.1789602836616; Wed, 16 Sep 2026
 16:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901083001.8044-1-ansuelsmth@gmail.com> <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
In-Reply-To: <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 17 Sep 2026 01:53:44 +0200
X-Gm-Features: AcwNN1XEi8i0bR0p6V2XML1oNL1EMS0XGZ-YJo8qlzp3ByfRA3buomyIp2Ok6rc
Message-ID: <CA+_ehUw0KK8mHDmaH7UBKxq-By7CvXCaWDUg9NvoMPzSe5cgHw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Il giorno mer 16 set 2026 alle ore 18:20 Maxime Chevallier
<maxime.chevallier@bootlin.com> ha scritto:
>
> Hi Christian,
>
> On 9/1/26 10:29, Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
>
> I tried to re-rerun the mvpp2 prototype conversion, but it looks like the
> series doesn't apply cleanly on net-next anymore :(
>

Hi Maxime,

yes the conflict was caused by LRO patch on the airoha ethernet driver.
I just sent v16 with the series rebased.

Also Andrew had something to say for the mvpp2 patch so maybe we
can discuss how to improve that.
