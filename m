Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B85B3B0592
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789284513; cv=pass; b=LtIyEvbHJ8oI4k8XlIer01fXW0tGfG+nmzaGcInlYZ/1wEvpho7tZYXQ9QUW9fAwmauL5/3l5pshEln5ZG2h3qK04Hr4WFNvU5jgw4NSrcGMQ18nvilNrnmLNjVzeIigjy5bHgSrvIxRRL2XNwaNHjKhVdMpNjpSqX/5PJugmn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789284513; c=relaxed/simple;
	bh=p2soD2Rf2OOF+LUQb8CpDj5kTsG2MF+pujWfnBktrnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjTQODH7V68uFP3cy3NV2yq2XeukX01E787+H9P6DhK7UNaT25wlLhvl6aVIVaxtB2dc3tt31F8GziDNoZVbKcQl0Kr0g4HjZlkVrR0GOt2nzyHvdM7u4/R4qdeyI/JOsAzuWPriyiCJSAZwpYd/e4Zw64dEGNZ4j5PkETKf76o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViQrhRB0; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViQrhRB0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398e9698a70so2370411a91.0
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 00:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789284512; cv=none;
        d=google.com; s=arc-20260327;
        b=YmgawPC0oJe0uFynpafJB2tH//qx+ZgVhXRxxJxMfXKm/jv2SGyJr+AqTAi3Kb78nA
         7v+mzN8rjHw+GZgMAmjI9plpKrsaN5McO4/eZudpkHpQIC/0HKTpu06pPnoPyAwX9aJj
         q8eh/g4pXvBto8QApBAhIUepp2oIzugfRKAzClwnUYKdozbZvr1BUdJtmhl3Jup1XeZI
         JIABZXBKOA21bi61KoKzUK1h2Dk1R6O1dzlA0CN8arIhbbXyoX8vsYjbB65evEw04cf0
         Qka8xjK2T/vCQBusDBrfv9/qlbBvYIZvZWgzJ+I7n89a6s57bL6TBl7qM/Y1fFsehQry
         RMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        fh=NxS8KP96pzBYOr7qQsj3WtkonQLFMwr9PHEl/qkZrRw=;
        b=TRhD53Tmu8to2cNteOElJ0OIekFegFTAoTz19xoYnFC9MgGJnJ/LWbDyS7sR7mlIMW
         2oesUeFDDQ8rOqov5AaRe1zx6ex28CMDN0/NcYPcZRW9/iKeCB5HzbAjjuDuGIlzOqlM
         H9NvvQzCGoTL7fdCGtY6DDXoZz0bAuCDKu7d1+m9leBYtCGA617Re5B2iOso72PhOX1w
         Hh0+NrdU7rqChvA7LO+uWPnZ3tu7dG4BKgPqaDgtJLSYhNvPViY4eR9ensW+/3pN+DrH
         SiHNJPPzUH2UtC/aYj0ZkwTS7P9KEIIslqs17Do0f4Wooyjvfg0nHekHqiTzaJdbGHML
         LjPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789284512; x=1789889312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        b=ViQrhRB02slxwxYgNDAivKcv2CGHVX5NwhyNfHNuK4rIMbqZEcylply6gVS5WXYPkW
         JCPbxKryRJ/IrIvlsyLxjx/oMPvEqfdUluAk/nZLX93uVI8Ck7fbte21VrNlIiMCSc7W
         7DJvqjg1H2/TA0O5aVwPnJGSQorvde/mMqwaDI5TmyLWCB5yBnsKXMegom3T1dpS8QsB
         n3tz8pC/Omy4h3lUTbH+syAOIZcjbN8FRikv5N1BmfcKTwTwLmYG+s3g9wYY0X9gHBv/
         +Dd5GZssyieK0QmlIvlTSb7LX+B0UktdIfNNtOT1TFRI3E5dHHPlAzlgtR3xxKQ1fwRz
         +S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789284512; x=1789889312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        b=RsUwxRFxil4+bINT3QVJnKp0oEGRiaa2MRM76/AevX+fbi9ZWPvQxvivMFgv7A2G9h
         DkNrSeT+DAsTbHn/3osDTvMTbLA0/xrHH4NFyLvdUP/8yOckfC+W691xxeK4ntLxwtli
         1jrFXN4wLrd9cL3Cuc+tbhkiSa5SIjYSo8CH/3MBC/gI0pe0TJo+J5lgdMOEvhmIjCbF
         on1hCZVE5xXxioq3BU9HpdSykFLNqJL8LSXkoBSgsaxx5DavGwQyqR468/rJbA0OZ2hh
         +lsjNv4lwtYJXWDxOsxWsWcpn312vhsojUsoTBaNjzNNLnq2uQiM2WzpAKWzW/Rl6Vig
         Qskw==
X-Forwarded-Encrypted: i=1; AKwUvBymDIMoQAcwoHL1wdyGVGSGb1KcAylgb8n1Z9k2mNEmH8ODCtTQDuswp6TgQtmAsZnW+hH0BkNLI/o=@vger.kernel.org
X-Gm-Message-State: AFuF++mrwV1THwb4T1u845InN630lg5G8eh91EVrb4gOfjmneAg5ADzB
	fL8VhCiMpUBZoX3lgxsu6BN7t27lu7QzQSp6NY4on1E4QkOBoitB/tT+2vI0zHZ57UsTpfkHrYg
	rGav0aC/U014rG1Au1XLev2cuZe4sgtM=
X-Gm-Gg: AYBFou2mYW81J4TM8KJ1H+qZzyMiSm/hJ5ye2zVlmzXHUwnUVPGTLBLs1cesLUry42P
	uYTv3DhU3DdwyMgwrN03hngRyxKrJk2OkSlqkd9C0ra3F96Y8qBOnKOovPJCV05qyY4QuV9Q9MD
	b9cL1JcgR3VdIKR1ARqX/GQ8VPVAKNJ9cglZm0ZHR6RIUCiCFvvUDvsk+h0VDCGwoE6vZCqQU5z
	hI2v0dK1kVNHbUISAvgeFaGfh0L7yKQujMoE3r7BggSFmmxNh2H8Vx6gCLJn562Hk6t7/ReAA32
	hPl2qjtZiBUq0QdHzMnBTQnk+CopaeygbC7/1BGL/zjAoLh0NIdRV930L8hKpjUh55iYY1aYMyM
	AS4NHWdFJi3GPctleh7ne+sIakj+gORCj076SyG76
X-Received: by 2002:a17:90b:3885:b0:398:c794:ca26 with SMTP id
 98e67ed59e1d1-39d9c3944aamr19707975a91.25.1789284511690; Sun, 13 Sep 2026
 00:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820050608.5440-1-kimjinseob88@gmail.com> <20260821033334.400af4d3@jic23-huawei>
In-Reply-To: <20260821033334.400af4d3@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 13 Sep 2026 16:28:19 +0900
X-Gm-Features: AcwNN1XcNBJwG8gWKMDEIRzhlwe-EM9NIJU5D9mnXUFN01Obu2gnIbb9GqvbVzc
Message-ID: <CALMSewLdDGApqiJZGdTjKdj7RqLKahf66kjrJ5nRHCpj5p+V5A@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] iio: add Open Sensor Fusion IIO driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, julianbraha@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, grondon@gmail.com, 
	devicetree@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan

> What this cover letter is missing is any info on maturity of the
> specification.  Is this at a stage where merging it to Linux
> makes sense, or are there still elements on the spec side that need
> to be resolved?

my intention is to preserve compatibility across firmware updates by
keeping existing message layouts, lengths and field meanings, including
units, unchanged. Incompatible changes would require a new protocol
major and corresponding driver support.

The remaining specification work is to reconcile the draft differences
on reserved fields, extensions and magnetometer units. I will document
the agreed rules and compatibility policy in a versioned specification
referenced by v10.

Thanks,

Jinseob

2026=EB=85=84 8=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 11:33, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, 20 Aug 2026 14:06:03 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Open Sensor Fusion (OSF) is a physical sensor board that reports
> > measurements over UART.  Add a serdev driver using the generic
> > "opensensorfusion,osf" compatible.
> >
> > The compatible is intentionally independent of a board model or firmwar=
e
> > revision.  A fixed wire header carries the protocol version, while a
> > capability report discovers the available sensors and channels at runti=
me.
> > Supported capabilities are exposed as four IIO devices: accelerometer,
> > gyroscope, magnetometer, and temperature.
> >
>
> Sashiko has one reasonable sounding comment
> https://sashiko.dev/#/patchset/20260820050608.5440-1-kimjinseob88%40gmail=
.com
>
> What this cover letter is missing is any info on maturity of the
> specification.  Is this at a stage where merging it to Linux
> makes sense, or are there still elements on the spec side that need
> to be resolved?
>
> I'll take a fresh look anyway given it has been a while since
> the last version, but others may make their decisions based on that
> statement of how mature things are.
>
> Jonathan
