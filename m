Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53393358CA
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 07:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774509216; cv=pass; b=AOqG96PC4vV0oQ0t46uP3zO+V/XfP0C4ROca/3aRXg2XNTGrxOwHwCBfiZ31OFxiuzJU4VyzdhWCPtH8Wl8VH4/1dMJ5aehh+MHAd0OJ4NM2zZLwQH0izer5SkjSArdErl6OPi88NT5PK/zMq2tkWfW5YL0cdo02+YOgMpT15jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774509216; c=relaxed/simple;
	bh=/CB4TmTiZlpMhk7HNXh/AlPzX8UvAaqW5s/OKUIlyDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWQrD6+UaMhfwswSngccTCr2VWTtTyHRzDMNHpycL0BDlo56hMKcyJLbDpHOgPPa/d6bI/fyz3FngB+Fuul8pCCX6sIjmBHNdK+Gdrpt6T6UCijBcMBhgXfKQdzUBmW0H30K+ANFv+gnJ2creWG4CUoUbcyzPR3Cx/QGjqc/PQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rB1SMZCG; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rB1SMZCG"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso86901666b.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 00:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774509213; cv=none;
        d=google.com; s=arc-20240605;
        b=aRgqV86Gt9Ig0DAd8OBUyjwIgoeuDslGB2/3eUextSbcONeODbMaJh/W1GNW+/PEDn
         LkxmPUJBqcyCBvxvIUJKy8t6eX3NO5QfJWbRknXBHnP2U4uZ5OqQIOVO9cIJxOoEXn1+
         HuLUB+uFHDDabYkL/KZHwkRBc5utwjAG8875rKJxKasawZcXuVAJsKTX08UcNP8YPdfq
         4uIY0rIxgxRXwMtGAE8U+M9j8fqMfhIUK4gZg2PIp7MmpoSG22/rLx4HUMOu/rhuohJR
         x/BtKZAEf3jQdpVBMn9yekYeDwQrHpTuNHS2/+eO8gUGqElP/fviwEn0cZAM1m9vDKpO
         xumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/CB4TmTiZlpMhk7HNXh/AlPzX8UvAaqW5s/OKUIlyDQ=;
        fh=YLeLFn/kQV04NVfA0ciZ9TVh3R18EZI2d7IE9VVj3bM=;
        b=j6h/+RfZJPNdWF9K7BujPogRkwu+El+sjBNVQtDR2SvbZtHIy5bw5zZx7WkfQJ4wOR
         vFOF7W9CgfQv0khsV9sHRAIlbmv7qgczKVoMYvZjmvviwwKnRAMopxG37zaj58/jfGSu
         A91yicguRUTKX7YE0nnl/AD9fKAXKKMXt5RSqK6PmKdI4vkNUYT14IVcFjaUAitp1RSx
         8+WHLhx3tnOZrrFat8WcJwzCZ1rq5vyLdPpDDWaN/BNI6qmLqwTiw7WGt2FhmjQlaeNc
         lA2LGF60H/H+ZtnOXm9p4odpr2JG+k957sDa2nGdQT92PVf9414+617U/yj224vc9XND
         cvcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774509213; x=1775114013; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/CB4TmTiZlpMhk7HNXh/AlPzX8UvAaqW5s/OKUIlyDQ=;
        b=rB1SMZCGITq1tVKsatq/yryA3vGnuekSTZBTQuM4ftYlJk58yRKxZxMpEt4wtz63ui
         jEdk+hSwekxZB+5Z2Gjv2rFDNwxo2OekHJP17yrSm1fhXIbT1WaXiY434P1bbutwlGuE
         LNyX4GE07fsIrZjeA6mU8Cq48ckYAQ4UEKhRNIG87xSS4yXpXZzexrBScl+unBs1Q06w
         vI+Qfu7TQt2WuttLPbRVfYpwguxouRVs9BY6LgkJUw1kHcNuuI5lKXMMZ6kMt1VIE69N
         IsaSbIQNCT1HNI0kAaXWMDWXuk8DRPvYd46UFLzjINMdqru480X2Ini0WlrI49ENByLQ
         i4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774509213; x=1775114013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CB4TmTiZlpMhk7HNXh/AlPzX8UvAaqW5s/OKUIlyDQ=;
        b=QxTS7NZq1SBVV7IiTYfITcKMnqiBgbmudAGSYuPT6SHnuChWf1IBxlq7EohOrKO0sS
         j9ajmOGOq3yNAz3NEb6f/y3bMXiU0EEoC2bwzg8+fyx/cHsJ/MwAxMZ8JJGKLuRwcW86
         aCGnSz6Iiy7rE0Xk3ngsiLL6cVCwmil6Hu0e13qrbwUl1APWP/+ve6k1PShn3MYd68Ey
         HXTdjns8RWi7xTJqBCt5VFqBd9I7l07ym4qTpo4oIXCVmSxK9p/GAlxOdIPhrOJl35UQ
         oE/c2zyiLNK/TARKdEu2jaxSiJQS7I6q1JkG9ZdtoABN+8z5kk27BCNMt5Mi4C6eg3iQ
         7A/w==
X-Forwarded-Encrypted: i=1; AJvYcCV03O403+ZiXDyqQtwy/mkvrswa9rUb7a4ol2kOMOoxf6zXZ7IPEgNECzpyksKt/hCZTaDIl22sieA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPIbaAEkYUJuYouwyfnxJY58eziO6MJ99vscS8cxuxn12HwV0n
	kUyzb2xuh5G0glizkNOsxZD0TPrgab06ZijJSN+bOV1goohaYXv3pLUekvwsuiHOzwVncJQ3acF
	W4ZwGKU3/minLjoL+0wACpANfHOTggL4=
X-Gm-Gg: ATEYQzw8ajDMHeOakP/3nfapaxo6v4kb6/3h08ExYzB8tW9D1METC96GqMEKXUzk28B
	gZopSMuakFzX989Hetw10HhXcU3QbglRZ5I0lUUKYuS3J8FXs4kz6fRd8LmrsswEvK19iPj7inW
	2sKuik8RZpezZvj1PZlYBqGhvanWv+JNPocjYNVuCrwIGC1st0T9Fm/ppmtioZx1uj1/5kR6zwl
	FM/sFgrtAVK6Yyhl39v8Foec+3QQEL5UTzvO3cblNL3nALxfD1Yfm8uUrIQTsGdG8z6AEXr1PqH
	Z8Malyy5UuIybg/e
X-Received: by 2002:a17:907:198c:b0:b94:1d92:7eb with SMTP id
 a640c23a62f3a-b9a3f1919eemr458328466b.18.1774509212875; Thu, 26 Mar 2026
 00:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1774403912-210670-1-git-send-email-shawn.lin@rock-chips.com> <1774403912-210670-2-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1774403912-210670-2-git-send-email-shawn.lin@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Mar 2026 12:43:15 +0530
X-Gm-Features: AQROBzDzOlAx1sUd2S5bjE5iJHmFf32DolWrjZ8MKJ0g213qpmInERjK8VvyQ5w
Message-ID: <CANAwSgQMy2q18Pkg7caunY2L0MwuFjugX6T4A4egSk38x3+FCQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] PCI: trace: Add PCI controller LTSSM transition tracepoint
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"

Hi Shawn,

On Wed, 25 Mar 2026 at 07:28, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> Some platforms may provide LTSSM trace functionality, recording historical
> LTSSM state transition information. This is very useful for debugging, such
> as when certain devices cannot be recognized or link broken during test.
> Implement the pci controller tracepoint for recording LTSSM and rate.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
