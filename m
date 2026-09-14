Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55F547CC99
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395420; cv=pass; b=Zjtyl0ixn5ih+Xs+JwKhd/TWluNYXZIP2yB9wYN8fTmrrg5CI+WrrK5UBgAPUkrh4CsWLvpiZoLMeERIqy76ylkVUDm2RkAoP7GzjsF1d5PUDVTr21KWA7uh8aBWPTmQZrCNJCU3v4JDgy7qkK+XoEd5wtyBXqoqXhvi412GT3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395420; c=relaxed/simple;
	bh=CpAMjQAXkhZAhSQaDcxi40ms3MRJ4Y0fZlOO6i/E3kU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJ5WFV0rJlr5b377d+V+aSgndDjXmfvuS9rmo+HQ8U7XxxxVHE7MjYoPqt6x246rCmu1osgWMDKAq3sjaV5E7VHVrqGbM5QIs3fu3p3J5hEvMNxC/N/ff+W37MVP2g5pFhECjdIj6Pg5LKcQnoof2P7ZQade3YI/MiaZheZCd9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LM70+v/p; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM70+v/p"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so1899336d50.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 07:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789395417; cv=none;
        d=google.com; s=arc-20260327;
        b=Uwbd5FHUDic6tC4zeq0BcgxHCB2rkmawWwnb45h/lTY6n9EG0ZL/ENZqSSb3qSvePA
         SCIBYcAEZcLc42Tz78Vb5vTPV1q1mddPKT85zaWpwVHIrHp3kjiTz/WjEX37SLcAfev1
         BHE0lgO6n5EVB3iNc0i2yW3vXcA6vvP7Zb2YgX5KCniImD5TMbGbEOHQV1R1bCwEYp/6
         5ZTI/ZFX2wHpy8El/3B4yRGnqkTEliJQg1N593knSQqgrvNVQURQBrl9nUxoDfM3Ww2O
         lJCHgONrn+lwtQv/wrrqLwB4pi3/B3vMRndKNFcQQpxbvgGxQqRu54iLQdyBRrP278+V
         lZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CpAMjQAXkhZAhSQaDcxi40ms3MRJ4Y0fZlOO6i/E3kU=;
        fh=Lbyo3kcc4GAv1Nw6zv/xEBp3MsxFu1XYjDXY1QR2tsI=;
        b=l+Uqdmj53Y1qSvyvvX2W1pdC07JFhfszfndWXASTnCSHVy6bIjFsMsPvY62ayvl0BN
         GUkby+pHyqzewUp63y4FILcSSNou0hyZoNrvdFXSiwPZTeZBNbyXJtBqquJsTjvvrrfi
         W5fXQcx7AL9Hv9EghCvQhtlvwFU7n7X98Xy4b34D8XgD6a4kBVrs+CS7wHWI1xXDbk6K
         8nekq6BTvjX5TyHMYTN/VMTYD5528WIIV08z19hg3jyZ8PERfcNcsVBSTie7zJRIY0Ii
         VlahQeKLj5JLZTBcGegStkwBizkcG+YrgDVKUXcmo75SQjm/VcOq6ToHA9nvBq8t8ofh
         X3jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395417; x=1790000217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CpAMjQAXkhZAhSQaDcxi40ms3MRJ4Y0fZlOO6i/E3kU=;
        b=LM70+v/pAsy9qhNt1h0+4caCKUGB/xelD5jeXixLTYQEd7nmeOhasRZojsHeuglVDd
         72R108bdurdsui8wvyP6VL2TP3JNr6J6qmIfo1+VrhienAxVEG0wgUMgaJgFT0eZmruQ
         SUelzQgIUXvKDfeQ26f2FPTzzqaMjnV4IZkFydp4EcbJ+qesKc50yny3U6zF9vXOylos
         NL4Oh3vCwwV0iMTzl0xlIL6h4L11mLQr0xwX1jg4mvKOTbbecqer45jiA/Rd1wMXPG0M
         gEvIZUm+38cr30AdnPbBrrzjozFT1fRjodAUwR09lHi0Xeto6N4vxwsCQhz8729k8KvX
         0O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395417; x=1790000217;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpAMjQAXkhZAhSQaDcxi40ms3MRJ4Y0fZlOO6i/E3kU=;
        b=qYneVLwhHxRF21ahvKJuISWRhkDyOVLHShVBIiBM0yFYz9R1qXtsZcAd/cNYHx1Vgu
         DUA4qp07VrSMngsWIsoT0ud1asGmKIp4ibweuvV+/Iqt58gP3eC+lEysfweX4e8UGQfI
         bO+vdHkT6mGUzTSv+95/KF7I9OOCf61BvUUpj8rNOqYM8h0zeloWBxD9ymeyh9ryxcjD
         rmDhcrG6wqeuGMI0V7EBvUyw9iFRGngDYiyXVaW6R1iYDSuHCqUVxW9T8FC+fxeoZTdc
         8Y2trerC517s6TqJyK6glX9aDwD7HodvJcyHjhWdjuwqOLr+2YH1e4bSZGijSjMqAfHp
         TcCw==
X-Forwarded-Encrypted: i=1; AKwUvBzIUuA80DZWToHCT/B9s3ztMN7VMzebikJpX+81PPOwfWkcTqehmYzlhW0ZlHHmpyUNV8vONyVUZVE=@vger.kernel.org
X-Gm-Message-State: AFuF++kwv6ag1hixbKbRwoNlz3mhXsBJ7yFgVM/F9hqGqC/2g6US7XLl
	Sgmy/udE8XIK0VpQywP4YmImvIdoVL97FyVe+Njos5mtd+gNFz4wKezGe5SNN9QuJnIRXLQrRKR
	POw9uaVO0a5/ZwM0BR4UFuZN8gREQPQ0=
X-Gm-Gg: AYBFou0ck2aFxNcK7WxPTWxkaTa47St3PhDA2+3YloGkZ5aqBXDU1Ct2OQjMbmdwcCQ
	M8hagu8uxT5tDN4yuR8pYh2Xzqy6J4nN5QOXITeQGsd+0CjNkMsPNvaqbIH7oKxEMJ4h3dchoi8
	i8heM/EQFF9bXp8Houqy6lGIdhAxto2s+3QtCUZme1I8Tqc5g/sWQCvRYIvVeKTe38JGBFAdEG4
	md72N2lmD22INfBYqrEZ2qrlnFkQOODrYvvM7fk0eaeV6o/T03H8pIlCrEFqmIZywIwRuI5EOKk
	iqFdfTkZYG94439ePYZxkGJeHIajwZvaLsXvPTip7XvAPwpgjfK24lkRzImt1KoGzloD9axQquU
	IB5c/cBCVIsR5EI0Q2uHkEmpIxBT11hR0Any373O/aOp+abGcEtczIxQCGqSASaNZq1vQ0i7cmP
	tgaoq8C3RRp62eEVFs57RkRRZxgNFxbg==
X-Received: by 2002:a05:690e:4190:b0:671:1a19:9d89 with SMTP id
 956f58d0204a3-6714dfd2516mr664118d50.17.1789395413647; Mon, 14 Sep 2026
 07:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911103511.171722-1-chrismelnu@gmail.com>
In-Reply-To: <20260911103511.171722-1-chrismelnu@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 14 Sep 2026 16:16:41 +0200
X-Gm-Features: AcwNN1UkXKHgXuNmvAg9QFbsPvsNOPEuEr-x3_4WEtx0b2M_Yl9nWkPUROOSXi4
Message-ID: <CAOiHx=mJZKk9dT93am0o58Th+yPo2aGj6T4aFWkyeQphPwu4YA@mail.gmail.com>
Subject: Re: b53.rst: is the 5325/5365 "no tagging support" section still accurate?
To: Christian Melendez <chrismelnu@gmail.com>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Fri, Sep 11, 2026 at 12:35=E2=80=AFPM Christian Melendez
<chrismelnu@gmail.com> wrote:
>
> Hi =C3=81lvaro,
>
> Documentation/networking/dsa/b53.rst still lists 5325/5365 under

Huh, I wasn't aware of its existence.

> "Configuration without tagging support", saying they "support a
> different tag format that is not supported yet". But
> b53_get_tag_protocol() assigns them DSA_TAG_PROTO_BRCM_LEGACY_FCS,
> which seems to have an implementation in net/dsa/tag_brcm.c
> (brcm_leg_fcs_tag_xmit). This looks like it's been true since
> c3cf059a4d41.
>
> Separately, ds->untag_bridge_pvid (b53_common.c) is only set when
> tag_protocol =3D=3D DSA_TAG_PROTO_NONE -- which I guess no longer applies
> to 5325/5365 -- so the VLAN workaround described right after
> (removing the default VLAN 1) may not apply to them either anymore.
>
> Is the doc just stale on both counts, or is there a reason 5325/5365
> still belong in that section in practice? I don't have this hardware
> to test against. Happy to send a fix once I know which parts still
> hold.

That documentation is indeed stale. The required tagging is now
implemented, so VLAN 1 is now usable, so the switches should be usable
as far as their limited feature set allows (e.g. you can't disable
learning).

Also the configuration examples look horribly outdated. I don't think
neither creating the VLAN uppers for the conduit (eth0) nor adding ip
configuration nor adding them to the bridge is needed, or even
correct. You also don't need to up it anymore.

Finally, I noticed this file is missing from MAINTAINERS (which is why
I didn't know it exists), so if you do send a patch could you also add
one adding it there?

Best regards,
Jonas
