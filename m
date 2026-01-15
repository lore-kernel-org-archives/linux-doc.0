Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037FD3A35A4
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496739; cv=pass; b=ZNFrOke7s4GpGf3CmbnDfVMjcFb5onBt8+FYSeKde+uR/UJCe06ZhQyR3TVmFV6Bs39QAOeu/aqzkXMEaPxpbJFKr25d9omK7Ala0GAzUIUniWbfbsug81BkDZ6wAZCCPenmgQUQDNKxJuznDrpzqDfR1HV0UpbjvoOb/vwDsF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496739; c=relaxed/simple;
	bh=pPXLxJMYfVMaHXQyHAeqgHOdmMjU1dVPx+zj6HAusMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4jSIZRAjEx9xbRqlj8ILseV6Ehb9Zn1UvuXufboU3uvPFiUajo+/5kip7f5oRNRWI5RBSkwikz7DYZaNKxhhQeDbUtiAaYoo8RjaNnrCU3forbMAmWRez5pPSSrYizjuZ+rXrj48jdBQbUV4qtmFsOTrWzMm+sC/VacnOYaVmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TfsPcnhr; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TfsPcnhr"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50299648ae9so432051cf.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:05:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768496737; cv=none;
        d=google.com; s=arc-20240605;
        b=hldQbraH7Tk/7fv2NDDw2jyQi8oIN7zPJGZuTVaNI3KIYNuwFE7LYtCMiYHA/SchdN
         XM1ZOG/2v1XyP2N1E6Sa2fOYuQhByi1WZUWhXCD3YTcSC4f3maBaFwgcptfgtk2GgiXj
         cwa8b/JyaiWxT2g1vK5EZjjTZxw7uBDSYb02G9BUoRBa4KfEk+LDOJF73Etz5nbzZtdz
         hpw1iTlYW6lUFMW+Vrc6WvPgHsQsPb3i3/xV+8DDckPhq2DXnf8LkJP1NTb8Kvu+z1s3
         7dvihp0ErIw5FE3p20MJHNSP1K1EidYHL040nE9mlUivFTktlB6344cZD4o/MjhD6WOG
         RoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=54li8Nl2hua4YlG/5pe5hANT9Dk06MGWYeEoawn3DKE=;
        fh=rhDlUEjnwbwcZ4GCn8+7TZxl4Wx0uv96Vx6EzyJE5Ms=;
        b=LfkFyfAKCtm4GIg1kkr7nHE3SBy2T+Z/LSOXiaHyUoVsOwmwC9vUBbVWISKYrrK3O3
         ds9OgcZuSNXYhWTcjzIZ94mXtyvhUUISUzJiDMXO9y/0A9Qznla88zEhA6IQ+nEK1rf6
         sHwI9ogABHnQK4oBF6LuN90EGQvyC55UdbRs/f40Wgc2DBFlUnqpVioKYwdzT21QiOlq
         afTrcfeMbCXvaJSsrDW8GRIClvrNWveNZyWxEAEAAKW4gpIXuhTCvKbE/BeJkFZXz561
         WzNUHf/R87uJGnLzaMLVu8rpnviIgYht7YaaJwNQhAS6D3yhcBrexy8C8fU6ty84QqLR
         2ktg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768496737; x=1769101537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54li8Nl2hua4YlG/5pe5hANT9Dk06MGWYeEoawn3DKE=;
        b=TfsPcnhrrmhvZcBjPSro0GVDZZzXXZ2gUEzR961AAmOXn3ULUis4ZRSRmkeZDvzRZl
         ZBzGrJQW5Fb84/QEAaX01ltbuWGsOuY6EFcZ/7g6mSBxdxp7DJo1X819fFRkBncckdxq
         bBIAI45eyER0POtVdp7UCRYdyV3+ZPdyMk3mTs8QsRMPlXzDx6wFF8DeB4yisY7eDZcK
         tN+dbGwbECaeo2sfqpr0ixHVyo3D0owcapiFFBytIlH17qsEeses/6bkpQdU2VGV/DBj
         8NudcB+EpjLPwRnmfNM4doqs5OQ/lU3EMkhhNTOZEiLqQi1EdpyRCI9uc8MDoiD8Qyyg
         g0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496737; x=1769101537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54li8Nl2hua4YlG/5pe5hANT9Dk06MGWYeEoawn3DKE=;
        b=lpPHUIZMAiFrDD92j8/FC3cXZ9VBJD+FDxYRCZHz0NQO7Y6BeT3BwS+xBW+RKmAM4J
         6FIOs7al5m2JrTBZ+2+2FLgT6J4GlbZ/v94rYSlklqZ/AH9hr1ggky+lz5rty4K/ANn/
         XgCUwLSWEDk8ouavEh2TE1XZPjY4nbWqhY6PF4vBZYo0R7OtYShy6/8FBy9OkhiLoHOA
         E2exMQm0mrh2/w7AM/KkOirQoDBeAs9V1RoamIgzJTZxZI5shDh8q80cZuOkM5PAhCDR
         nBZFGclpkCmgM5KgG2Lbj1YYhgq6ulS3/Nj0KOPCXjgOFeaqgtytsUYUFUsdOJMrN/Xj
         S/2A==
X-Forwarded-Encrypted: i=1; AJvYcCU/B6nLkIbc3lHV7lYVbG7nBvWz/qn+a7QEc6xNpiQGWattTJI0u6HrbpCRvuizBnSdK7tAV+Qyup8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC0G0EYOHW2kGYRsigHCbhcXe7VA4blwjHOQgZRTKpKfveKSrV
	UjxdoqFEG+BVJB3R+qfCg9U9OtGLVW2AyHqBQkMlhXhHZu0DxSJW3LGPxcPJnXjNLwycsQqiuTH
	9dWXALvi+RLzGaz9RXeayrImjg06lMlQ/YPpmbW3q
X-Gm-Gg: AY/fxX7s1cBlZG2OXQNsStVscvKsvWrv/HnUIfHxgI3VkS/OLwKiXK9xQYlL4EmwfRg
	NhxQr2sMj83sBiBnf2I1lNpGKNflBoWXoysvWJM+EXAA+Frer+Ok+yxh480Xhz/J7utgeu9LXyN
	rPWzJ7VzKAFDPyspIPCb126HMVW//kFupZM7S5qV/QZXeLt95kT+BDkMK37SKph2kXdCqpCIYap
	CyH0ACH6vF7pps9i/O/Eaihpj88qkaK6COnipJcqEQB3Jfhrc925TQiLvLK0/biBN/EC9KNMU4E
	MPYwIszkSNNjpjxQYpckb2okFw==
X-Received: by 2002:ac8:7d44:0:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-501eab81d32mr11968081cf.8.1768496736612; Thu, 15 Jan 2026
 09:05:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115054557.2127777-1-surenb@google.com> <aWiBv4A4QGJ1pr1l@casper.infradead.org>
In-Reply-To: <aWiBv4A4QGJ1pr1l@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 15 Jan 2026 09:05:25 -0800
X-Gm-Features: AZwV_QjrzboZ9bNCbx-dGc7Nl_6nQsBcpSB2Pv5eAnsjMWYU5mH2P1l-S49q7HY
Message-ID: <CAJuCfpEQZMVCz0WUQ9SOP6TBKxaT3ajpHi24Aqdd73RCsmi8rg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Docs/mm/allocation-profiling: describe sysctrl
 limitations in debug mode
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net, 
	ranxiaokai627@163.com, ran.xiaokai@zte.com.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 9:57=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 14, 2026 at 09:45:57PM -0800, Suren Baghdasaryan wrote:
> > +  warnings produces by allocations made while profiling is disabled an=
d freed
>
> "produced"

Thanks! I'll wait for a day and if there are no other objections, I
will post a fixed version.
