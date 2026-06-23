Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD437C92B
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241742; cv=pass; b=mM6xSTvPe1n6ux17m0ic4MkcfriWxhsPf3+LExFgoDUAYtgebJ24pMZGBtpwaPQh6CetABiAtRWsbd3adFnGh4GX3CS8/gGp3nCkVqFHN6mHSjPtG6wEUzE0mDnCsS4GOrciboc13i2zXUM1Ft4BKZDWaZDX4U7Gy4DXqRIwHqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241742; c=relaxed/simple;
	bh=LdofAR8e/Kti/WYvRJh0sJk3FrQJ4xmAUqnttCZI140=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T80krBVM9AwZ8Y77TeoLkiyz84FVG1vQ/y5d712lnd2zKqDFyeETOBpDWVr/GuBmnGhHPrr/oPKcr+wijffxx3ao4dhlklfdBBpa6hNI2k52+kEcGxB4D/QhbDm2wLLd7fKzdTk3WEOUkcRSS1wwVrD8CnUFWcqBXTgs81gBtzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZ4kgKvs; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZ4kgKvs"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c03a466c96aso31970166b.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 12:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782241739; cv=none;
        d=google.com; s=arc-20240605;
        b=IMp/dL0xOpMYrUHZzDge3TaWHb1AQGl8ufct6KM4cJs1cJdhTkETHgNvaNIif+cDvO
         m6wyFxhaHTrBkICp+0YP9f2YMQZLqqljXIH9PJugJODaqTkzTZtdeED5TNPffdN3oYAZ
         5IH+WqlJ7wlaw+M2I1lboLbjiXOY4vdpgJnRJr+NAIwBhlz3HbvqD72AnClT4nRX7tMy
         efZ5GJ2x5dqvpYFMHPMj5j9Q80mniZX0eGfqDVIcZbaCIGvQyOpKOBhsGwh6m1pZLOb+
         s36OuI3r/7ThbKhTHWIotVnXDhu6cSGh6nnkfEtNX1RB+wqxC+xG3W23JA6ch5inOwGZ
         4uDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LdofAR8e/Kti/WYvRJh0sJk3FrQJ4xmAUqnttCZI140=;
        fh=9v+vwM7fJnZvvDze6sHe4vpY21cIPioFytLGWvUvG5Y=;
        b=VzmCXZGo55eZYnHywtZVhsjnrNdc2bCCFEizLhHK3qYptiIncKAMrARw3of9uKCmY2
         oXL3Dm5VA3nOzn6pJmfWz5wh5bvB66YbsW4odAxQgE45C9p9yrZOrDv7waigz4nJja1k
         iNF6qP+oIzYPos2GxdHSMpOxDItoCNLmX2hc/SVf5MEpzPkZITPZUxbQDxFvMuMw1sos
         nIbTq/9i4g/u8OGkE9FXvLY0Yqqfqq+HAADEeb5O9UF08sdX4jsmljA46j7kskEF2Zqf
         hrcekywnV/esCvmTSTM241NsZM8KGtSoRNcMGEWLfys7N7jh2fcsbeZR7lOVlfgwFi25
         N02w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782241739; x=1782846539; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LdofAR8e/Kti/WYvRJh0sJk3FrQJ4xmAUqnttCZI140=;
        b=pZ4kgKvsl8ZfHTMIog2LZaBW7h+HJS3C+m7ai9cn7I9ykrq1XixVJa+svUpkAZe6z0
         6w8Na8Z1HFLbAO7rqFFjKTYugQBoPk3LXkFCNYShEw5QVmcqATfaPzFAjj1vss3wjE6X
         +ENhVhpuv0pcPZUyMoFwGqw2mzujiCWxx/aRYwYqPxi0Nx6xmhOnZPJ6J5uyso92Vq9d
         VTstEXYWkMy9J83N7rxDSDDwsXy1h35SosuiskqCtLAwmdfdaBDVxLoYFaERZ48IxU5L
         0oIdGKVbjD3cBHWuls2UUkpyYuUM/m+FGjU2DWdN9w/DhxDQboLEm8lNwJylxPYLsm5E
         i9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782241739; x=1782846539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdofAR8e/Kti/WYvRJh0sJk3FrQJ4xmAUqnttCZI140=;
        b=Mc2H4Ep1M5DIA5T/rpfNN6gHHvCYfRtENslCkb4Eb0Kfo6pDqa5hBM1JZLK53y5/KQ
         dij87SKy3fkof4Nb2IBI7SWB3PUhHRbrhWjjrJcKDXyH81A+kirgmGNTA7sYKr/FzrlQ
         BkVUPMFaqxLpj4Slo9z/DCMNr49vXb9h8kfT9UjYFr6fHB6DE0tJdWQD/gsjOQQF7D0I
         ZyX7TkxaYy6sxUkMnSJNrAUxAtR8ue3mTRigucatTfPNfCUVHDZBP8cePqEUhguruHjr
         XQuxct5T2m8qekdrMuDX06q2LsOap8eWF7KcMzHtDhAL54iDExmVqr5NRYwqqQuvshRd
         HOuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wkGTEUy5KnvNx8Z04jSwd/C5QL8IWMGw4/evPiDMKbnsYlnwl0lx6WPdypVfmfTDDfdU6OUAPkCk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1g2KjEQlzVcgBKHEREDPfrALvr31ZQ5hEneLNcYPnImiujoAn
	p2CHIjBbt2MncWfOD0GmET9jP+vuGZV+0ZJ0BGdwCCZESr7WGmXNALVvWHnrByvZ3MGuEYCYB9q
	CPaofEJ4+VU0KA7pqq5+piT8iVFM/GCk=
X-Gm-Gg: AfdE7clhm/uBd4XFqbpseOLbZeV6pJxlJ/RpPtwDLA6XGhJOpPPtdLs6wp4Ba+tgWh0
	iIxX1AT0Sz5eKoXngvjfT1bJe084TA7qY3WHZ0Ej595/lR4IifpQFKgzcbGxj2m0TWuv/07mfFD
	zqBkT0PV0T6zY5y51wDq1aeHAVyJyPcu6l+ZObJmAn7bxdFXEiDgVKainnOTO6XtHs0wPtmeExy
	7YPAf8pvoJ+xO1IBQ7wTcqFLO/v8zNMl90+YC9ROLgo9b7jEGj2oFVdvNZDnIvw/iOVLwNbX1bu
	DKUOdzF8j3ETZisvm50oYx/IMyrzUw==
X-Received: by 2002:a17:907:9c07:b0:c04:93d7:3c12 with SMTP id
 a640c23a62f3a-c0c65adebc1mr95587766b.25.1782241739297; Tue, 23 Jun 2026
 12:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com> <75822857-473d-4067-a378-aae2cdab4176@infradead.org>
In-Reply-To: <75822857-473d-4067-a378-aae2cdab4176@infradead.org>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Wed, 24 Jun 2026 00:38:45 +0530
X-Gm-Features: AVVi8Cc1hD2hPk4FFMnKSCHccCyNZqCcEpbtGZZJrz-Ggm9d9Z4FkIbejjM89WE
Message-ID: <CAFgddhKDafzUTCsbYXpWPcN66hetu9aJOygpsb_eLwsU30ADrQ@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, 
	michal.pecio@gmail.com, stable@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> add ending '.'
>
> For all lines added here, use tabs instead of spaces for indentation.

Done! Waiting for any other changes before submitting v3
