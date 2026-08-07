Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44F43F0B1
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 05:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082346; cv=pass; b=E7kAf6SY4OcoiQ3eIwdbeZEXAzt2MUHemXukI98ZZ3SHuPstxWxFqd97/+A5f0/O9632cb349uw3r5wej/3BKypaHPVkhEVZuFCs5oJWtPrIqEID67AQThje8lGpdyyI+rQOJdcZY7FoSezgWAq3iweQaVeevVyTzkYlH4uBHCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082346; c=relaxed/simple;
	bh=WmOSV8mUeOq5rA6yigJmNY64cljSgeFC4BJ6hWQ8hS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JR5iUxsCogbuNO43hIUF8iYdjXNYaE/UjAajL4maALzqoxnrVws6dwA/ruVtPwpriYMIAHIHr22O0+Zre6dTP+/jNninDzBpsqLLD+JUppe5+sJJSkhtMN0VU7lp6F90+9f8vuvXgdpX3mHobnPeWUcn9ckKlccpAKN29QYcbVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQBCik/I; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQBCik/I"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0190a62beso372977e87.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 22:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786082343; cv=none;
        d=google.com; s=arc-20260327;
        b=AyLB3O2ZW5RaZ5+pWmp/VlFJAjLAgmUf2pCsGNYbENxHACMsb7vyujjMGQlOaR6rHv
         KbeZLQDqlKSHY4EcE7c7LseDxJ2jDlB3/8mYWMEnJMN9gBdJS0dlDi2nLkAImxiSlgoj
         MjD4aBN1R8SzCf/9Rg9P6NaQlIYpGDn5X6UbiTZwz0p6KLlzB2LYOMEAYwohuY87n1ZO
         BVZkB06nhO5Tpy0jVf9ZOEPa4PZ2rHFa3Z7MmTN050RS/wj9YoajAqpJf8WyL+FLNXB7
         waAY6ZowJvfhvTRBN57KDZJU4mUKIMz8zRs7zDb8jDSXEoN2o3NsFlyw/yhVx3GaXLQn
         NXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WmOSV8mUeOq5rA6yigJmNY64cljSgeFC4BJ6hWQ8hS4=;
        fh=FdGPG9ntiicFmUxeSt9M0CDBZfytIpv7XcwFNcd6yOg=;
        b=X4MsJiwWLoUZexYPf3VdnYSYozxLb62FoiwAekaL3YZznYqKguVH8IujMlXWPEjP7q
         OnzXy9NytvfHFn1qAeHZxBxJ2Sg5xmOJMuE8z9XQmJOcQerqAOBZQbf//RQ3rFpsfugt
         Tn1bZeCbgYD3TA9O7jUwR9amERhBQDoO/B2EHSRkRJBnyc/KbOuh+M6MRSgsBX1G10vw
         4OREV1QyHyz6sOhMWVWTQRv0ITnq50oo2U3yoKh0XS1ldMXmPExnREZdVACuVJVjTZgR
         hCeRdPHo7n8hAnw+5zYTdBhA/tdws+nSOMU6p/bLGfEwyHAkGBc8IxKFppkSy3lhxCzM
         f4DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786082343; x=1786687143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmOSV8mUeOq5rA6yigJmNY64cljSgeFC4BJ6hWQ8hS4=;
        b=VQBCik/I8DsnDQwjWK8BhJJc80ekTA4MIv5EEw5GNr20+kvHkrC3ro4c5mU7sDjpck
         Jj9yCUNHfb3xOiGDw7SSxeqqrVW+fOvM5is+MRaAIc1rj3d486tn8/IZB3wd58N6/bwP
         q8nudI5R9dNXnIF1JAhqzaRCN8H8G6K/FlTAk+Lfvt1jNIJm2dMsNPr4xbWWVTGb6K8c
         znu1lAiw+xw0T83gBg3kddp/rQHqkMDKKIr4gy9Ofy0+17PfwdN66HPZqpIytc4gJHic
         MnVqyxO8GWkRT2S5nHXv5a5JUoSSWOmhBiL8XDGo3XhRkb9HvsTOhCldPQY2HQ4TXzeK
         St0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786082343; x=1786687143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmOSV8mUeOq5rA6yigJmNY64cljSgeFC4BJ6hWQ8hS4=;
        b=gRVCaT3ATsVTD8Zvak4qXs7Zr0XWjT28IpTbvlZtu5gNDvqizHOQZWw5xvHXZfpg05
         yeq6J6+zcH+ZAcDkopiny8Te5uu5QBEupUB3jR+O4Z5cDjCZuyXwrgwTcZfoNOm5BUE9
         ngorr8ed6RwMbvoH2z3dg/YwhTwvbkd4h9BDaWb90GdG+ss8mafdUcmVThlQn4c4ECvi
         /qlpSaUDnWkQdNtjNVftrhZovaMAoQaKsj3+pwAzLZTt75tTYM9j/0+vJk5DLTQGdqBN
         F5fhx1RmsAWGyt3LRthrVgxrs/PkBEvLZbnPvKappelhmFkIn0Jp1yHCzVF38LkdfY18
         Ew2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoXIdfcACGhiM7sB4Jcnobq8T5IJiCf7XYEzV3Ifhz/UzhdsjAIuxo/KRBTf0saVzjOskitYA+SyiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGhJAdWq6zSt4tJfewKobNotHVf/566Zi/c4xW2v/jGwiVf8+
	bm38v4lYpd664YbCJtWaF3W/0V/qJI1wP+AJgwabtSSTt7tWLX1dgiTe4AAHVqx2TUuyJdvXXN8
	nIH+ZNK3f0jO17i4qDc3HryS3xm68y8hu9nD7
X-Gm-Gg: AR+sD12P0J1uf5VmGc3N7sCWgtjiZzjJ3D5lzUwho55G5rlk13nfK+Dj/11BlSEsu7j
	umEROFz3Lp8CuVYkh8iA7nr05c6AeojwnUf3VjBP0jtOgS4UAwtyqNM9q/9gtTPJsk9esjNJjQ6
	UY3g4hrt8rUa/mdsyjwdUHa2Eh9eyVUxyhQmBDgF5sA+6PK8kxH+cQNoEDKYUChJPeU/K08gEew
	4Tr9DvzDSElnmFgxhY5lOl7pAqbTdX11JDRLAGnNWFlt0j4XhicyTcZxRs4q2SZxkVjL9LJr/k2
	1VgDke4x0Muurky2oFx+bBwa9YGUjLYiJFl/LBDg00WW8XJWB/o7pa7p1xlCnlae2jwaD/53nOE
	79SFBRqknuMwMxLzguHqlTOvDHlX2/XAX41KHrA==
X-Received: by 2002:a05:6512:668e:10b0:5b0:312:21ca with SMTP id
 2adb3069b0e04-5b2f4cccb96mr1483448e87.2.1786082342829; Thu, 06 Aug 2026
 22:59:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806181949.65648-1-chenyou910331@gmail.com> <de2ddee4-7907-42bc-bc2f-af9f6d5bb613@hust.edu.cn>
In-Reply-To: <de2ddee4-7907-42bc-bc2f-af9f6d5bb613@hust.edu.cn>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 7 Aug 2026 13:58:50 +0800
X-Gm-Features: AUfX_myLINl0xRXDkdC5-ZsK3GZV74G6QZW5HwqUZ7_CiC5EQdwNOAufy4Fl-NU
Message-ID: <CAKspUhJ-RFNVjUsjTE00BZ0K-GW9hdPSKU+Jp+wh7EVGhxKRxg@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] docs/zh_TW: localize terminology and sync
 process/ documents
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Weijie Yuan <wy@wyuan.org>, Hu Haowen <2023002089@link.tyut.edu.cn>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I hadn't noticed that=E2=80=94thanks for the heads-up.
It turns out I was indeed throttled for transferring too much
patch at once.
