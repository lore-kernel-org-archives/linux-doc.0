Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5303A535D9
	for <linux-doc@vger.kernel.org>; Tue,  2 Apr 2024 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712047856; cv=none; b=C6Ig/6N7BLGu/PKMh8TxQy9AjRJlsD0orJ3cKef/Bko5GGSxxwiRtR3IhSSuqBLWuYXJgYhRsrACux67iErFTt2EVS37VATbzCZrCc/hdEkeTjxOjKtvzfw16yl7asvExngu0yAM+eohby7p0VrWMWQgay/bZib+UlxTxUuaty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712047856; c=relaxed/simple;
	bh=d56KSz8sH4cc/CJcFH4xN0gZ6zRS/QTrszJ0H2z6WYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkMYqntmR/xXKrDsYofab8npI/LQLxsjKzLALJaLt6v9nDohvPbXxmU0MJ5rBHJZtRrRgnoKkf9AU3IiifZHhKaOamhdFDyuIFT0ew9IK6vG/BjJ90J0MdR2wZGywi1iZsmPqQ0a9zr6me9cmk19Rb3rK/2o43QMKzyzmhdT3gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fZ+Mu4f8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fZ+Mu4f8"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-515c50dc2afso5340961e87.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Apr 2024 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712047853; x=1712652653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv6+xX61JtxGpKWZ45wliW2pFq+S5fBIUaTwceo8xO4=;
        b=fZ+Mu4f8Zv0Se3wyF76ZSUh2LSawVq9Xlnx6CMHyso6UY0M6IxFizcenlEQoi/eqq9
         oTpmzdbIVXFSJFjgwRp261n9N8+sasNx2AK0z66AVin8RRUIhD98g9qtN+OmQv+HwXcR
         VUzA42gllfP6CaraHvKbs1K2eiGKGQ2TVAGokFvuZpHUz6bOlFrUWj+64db1+mqu1O1h
         UD/q8qfv1SUkEKn1wTHpbadrh6X6JFi7Rx+f6Ya/sVTTadcDcp0QlG9JfY8rylpOiB8F
         3Wiq6T+nVEuqo2qcnNg3UUbps4Do1iLUQ4vhL9sD2Fszzv9FNadkDJ6bAjkLJHYm5E9I
         p3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712047853; x=1712652653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv6+xX61JtxGpKWZ45wliW2pFq+S5fBIUaTwceo8xO4=;
        b=jvTEkGiOdaO4qhIyuAnQEraXk1XotFcesg57/D887HMXuFoKwByW8BpiVHKfjQVvs4
         SjDtQVPqQBSic1ev+dzIKII4KO0sZfY4u9M+NzwTgEwmMW2hjaq/1VdqFZ2Gf1MpxQGw
         0wX4kouJWKycxrB13E+WFpwxlLLTl7kydKAw+23+dHWkZ3XCRord/zL1kLwQIinowWNl
         /+vrBAaAu2mU4xHt+xjzWVSfWjjEshbFU7+w+gKFB63MbehWXGbXQqY4ZBg3TLfvw/Ak
         CM7M5YaK87Z8yjrz21u7bBwamKA/SNobSUa3FUNSgmrlkQxgflrLWLXMoNc/239x86mF
         muSw==
X-Forwarded-Encrypted: i=1; AJvYcCXUiJF+NsHFDUISNF2/UNIQZDctorkIOUfj8Nyfek+B6cyBB3YPr942LPQmSlRNUspBvIbBLXgOq/NmpkL2rpZmTnG+KnneK1Yz
X-Gm-Message-State: AOJu0Yx0A2qbDCDYA0CHFOLnfCDvy2JILdxOWNlyK5ECE6J+G4UPfPlR
	x1cI0TNzwZkT3uh3zQ4R8B1asnqDxO0T3WBOhYonvaEpXDG5NoYH5cUw8RzvfsudB1KBvxhqgQk
	QseRr5Tld0G4cbmdP/LzzBYIQrBD+0yiUuSVx8A==
X-Google-Smtp-Source: AGHT+IGduSNxIydN/eNgINSn+xOiMxlwqSzSVthVPSafiIs8o0sXpk5/cAWBdV4gf12hs+oVvORpHioikkxS0Cer+n0=
X-Received: by 2002:a2e:a7c3:0:b0:2d4:3e82:117e with SMTP id
 x3-20020a2ea7c3000000b002d43e82117emr9024835ljp.32.1712047853624; Tue, 02 Apr
 2024 01:50:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329144318.376939-1-dlechner@baylibre.com>
In-Reply-To: <20240329144318.376939-1-dlechner@baylibre.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Apr 2024 10:50:42 +0200
Message-ID: <CAMRc=MfUQ5+Tq3M8=gABA_t+bumWs8=5RZ8gVJXxFLg0cvcMpA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: fix typo
To: David Lechner <dlechner@baylibre.com>
Cc: Kent Gibson <warthog618@gmail.com>, Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 3:43=E2=80=AFPM David Lechner <dlechner@baylibre.co=
m> wrote:
>
> EOPNOTSUPP has two 'P's.
>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst =
b/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
> index 56b975801b6a..6615d6ced755 100644
> --- a/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
> +++ b/Documentation/userspace-api/gpio/gpio-v2-get-line-ioctl.rst
> @@ -81,7 +81,7 @@ Only one event clock flag, ``GPIO_V2_LINE_FLAG_EVENT_CL=
OCK_xxx``, may be set.
>  If none are set then the event clock defaults to ``CLOCK_MONOTONIC``.
>  The ``GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE`` flag requires supporting hardw=
are
>  and a kernel with ``CONFIG_HTE`` set.  Requesting HTE from a device that
> -doesn't support it is an error (**EOPNOTSUP**).
> +doesn't support it is an error (**EOPNOTSUPP**).
>
>  The :c:type:`debounce_period_us<gpio_v2_line_attribute>` attribute may o=
nly
>  be applied to lines with ``GPIO_V2_LINE_FLAG_INPUT`` set. When set, debo=
unce
> --
> 2.43.2
>

Applied, thanks!

Bart
