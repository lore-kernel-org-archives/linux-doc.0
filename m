Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BB722D792
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777579852; cv=pass; b=PafLqlS9BetimKWVdNfGvY8tcHLuYblVG21Tt2Cqvwd1aoXyrrp8KJtQl2dWIuovyqgMHm8o0X9OaWcKQwnkT187tcHRy06XDB5oqPHBMwKja12orSRW/eznJRRpDT08e98vSRdM6IYpK2R70SUMUoNtEHZj7RlZwo8YM8DPnLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777579852; c=relaxed/simple;
	bh=WOA03rQ5vALbNG/D8xiyTMlNsTPXkNIixn1aoUnOjIM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VCFeHGNS1vEG3qpnm3cQ389tLQO/kX3L004udN+lHA8JcZsiBZWvMrgrg92aKLS7f/LKfXXJawtAhbFf5g5joP0e4T/nJOtgeYxxruXSH0iKLL/zIWP1ULaI27pSeT+lH6p41TyoCT4/qBQcL4V0JfgRO1wuBDo1h3hGA6H7hzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxvOs/Qt; arc=pass smtp.client-ip=209.85.219.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxvOs/Qt"
Received: by mail-qv1-f65.google.com with SMTP id 6a1803df08f44-8ac9ef74131so21716496d6.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 13:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777579850; cv=none;
        d=google.com; s=arc-20240605;
        b=TJpFVCoB8FwK9OrHISGsSxC0RVUe0ryCM07z4VZe2S1cCcUSmB9/g0QD51ofhlIpjG
         lj3g7fG0FVwh802VlawKPzcpk2P95QAOZkqKAJvKAJlKDzWfnAFaNLVLPD2FHHnO/3An
         daJVNpNk1/3l1shJn9Io9z8nbQKtmr/YgWNTOJOkECYyiodUcgXS+nw4zV9pxBldYqP7
         iQZmUk42qJwrWXjaRdnWLaujUgyJfLKrNgNRiPQmc7yGZYrJGwgMKyZmj8rNHxbttq3D
         0Q7x5z7fceU1nonoRF3x86/kXja2IwCs39CnvKXxfY26ILJnhYpVLnGuj+wVCaiZoyKL
         igWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WOA03rQ5vALbNG/D8xiyTMlNsTPXkNIixn1aoUnOjIM=;
        fh=ZbonjbzJJsFV/lWPP+WlMJ1nkxs7eEVT2jwfomzjfAY=;
        b=WXUjAAnoW112Xt5HYFFcdCzKBPDN7IWCiI29O3cOXZcV1RQP9Aoc2m/dGDMePy8hvF
         dAd86RI/2RrIwcYq2yeLDydy9zFNugVtmqctNvG2FUmYx6PWgRgTn3Uojc/Z6aoH2u/B
         wQIzuVHIRN2HDmC9NpS69N6vD0QaD54uBXpYbTphi2Os+L6wtutdzFAnx4913kmSZwts
         BSY+aERnlmJ0e0GptPgNO85Vwgqvd3bZMtdofcDqOdfMMWMYtOSpbn0jHlIT/suxi/sB
         vD+Jki10/ryY4pIxAk3+utKG4F/YmNFwN6kuCkuckN3M8k2f08iJ0uzOYyHRGDMmYZ5E
         4/zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777579850; x=1778184650; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WOA03rQ5vALbNG/D8xiyTMlNsTPXkNIixn1aoUnOjIM=;
        b=JxvOs/Qtg5d7Hplwful5t8uO6hGLizvXxSI1vMabGKQKZO3MekOqA4YKsScCw5all0
         e0Cm85JoYHvt/dxE4jrjVah0XJG0aAoxzl6NYMutX6mQVu291YsvQoumir8Di95/4Dya
         6NwgGke9Tiey7uaViCBKCg2pP+YA6bJvXu7lJYQwLifWQbslxa/7D6m9ei2lx92ltcK6
         THDAj5ysoMCppM7Tx8iNbqqmC2SlwWyP57Al7mYWiBNSm3WwcJIiORr+UyCunoF+YKiS
         Xz5DtVg93XGF8WT2/9/0ht/6SRNucZJO65RVPILmD1juvTLdrCC8ytHIKf5C7jYqj+Ro
         Z/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777579850; x=1778184650;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOA03rQ5vALbNG/D8xiyTMlNsTPXkNIixn1aoUnOjIM=;
        b=ZHN6eNWUPwTo73Vn9KCV2nn2WQ+mpYJ6ysG8XBykpBeG6Hy27KUs0FC6nxxSBC5PCQ
         xoIouU8HM67JZKBnFOROZBHdkYUJcnvQr2nOT4vjouzAOGj8MZHX7Fk60fzEI0KhzxAX
         542u6UQe5SBBJztHUMfQIgQ2fhclsBN7kSMs3VAnHbbOGeNHes5oLWiRtDQjDMXcoq7W
         c3GfXJB2EhUYqr93Lg6P9Ae5eKwCUdx9qKQQ4vdC0bhJtVvwuKEFxDoLSsOJi2qJXYW9
         aQSZM1UrhBOlau0kbSTLtEnjKApQXOpQvGF/NmeMhqEtMTweKIVjFp0ZCPd+NyIJavxs
         hp8w==
X-Gm-Message-State: AOJu0YwomJ8DVZMkldMAF/78Us1OvbObI1jsTyzxcNUOs9MGq6q3U7+K
	WuPIqbyzIqqnb2c762ppuETEZh/cMZH3JEsZhdPOg9fiH95JavF7QZCVt3znDxOswO1b7lfp2ns
	4P6kjnO0verKRu3n7mIYIj92EDFBm6dOTZOYg
X-Gm-Gg: AeBDiesi4bsuZBP3iTuUSviZCPELb6NBoapIdASGJml1kJ/aMt5KLxgHoLghqIE4EgX
	nAV+F7KhghjomICZSyQvtYiiwUKBCrjTaQO0A3Om51Yl9e4wOU4snSzfHnAJYVdIlrgzdJBkL1u
	3MWon1LVkZJiicdEn0H5k1CEu1Yq9R73H1G1SZRBIhpHNffF+nrR9uhMOOhBFFsOPvRZMh/zKYD
	pkQwburZEzA+rEmM6pdbkspESUBjvcqG8/WTI2Wvzc3KkmDVBqSziEZjWmNZySdF3MtfPleAO+1
	m9ZTsCnPG2BdBlu8omlmH9FWCNhDO0bN0oio2UbcAXITRmTgqVLEjHnzT344UCCyvfw6DAVbp3T
	iekAzi+VRNZaERLpuXerLD+nW/wj69A==
X-Received: by 2002:a05:6214:2402:b0:89a:14ef:8eab with SMTP id
 6a1803df08f44-8b3fef072e4mr65844056d6.41.1777579850336; Thu, 30 Apr 2026
 13:10:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dewey <thawentha4@gmail.com>
Date: Thu, 30 Apr 2026 22:10:39 +0200
X-Gm-Features: AVHnY4IuN1R3JeiYzJvFX0OgB061mIoHBlXnbxCoLgwPowoKXyL-suhZnLZrSII
Message-ID: <CADWiQPK3kC5ymXsdYT6tc7qH47THfY=LpBSW3=dcGNO2Fi_p_A@mail.gmail.com>
Subject: [RFC] Interest in contributing to Linux Kernel documentation (French translation)
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello everyone,
My name is Dewey, I am a software enthusiast with an interest in the
Linux kernel. I am reaching out to the list to see if there is any
interest or an established process for improving the documentation by
adding or maintaining translations, specifically for French.
I understand that the official documentation is maintained in English
and that keeping translations in sync is a significant challenge.
However, I would like to offer my time to help, whether it involves
translating specific sections or helping with the automation of
documentation generation.
Could you let me know if there are any current initiatives regarding
translations, or if there is a preferred way to contribute in this
area?
Thank you for your time and guidance.
Best regards,
Dewey
