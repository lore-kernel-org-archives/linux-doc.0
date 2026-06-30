Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484593DB338
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839449; cv=pass; b=meB5WiMsiuwO+TjfWf0Ab8QKFMxBDC8MlDGnlHPf7eRg+urCZ3dpMmlJZStFIFaFoJQ//fna2GarSYR8SsphJeGhgNrPiKOSaDK5uZZxqmgsIVZwzsjt0ibJPTo7HTFbphF3I+qxrGzgEM0TU62bjOzIV16Jp9bWtBn3bETJ0Hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839449; c=relaxed/simple;
	bh=Q+NKeElSU3Mey9uyDYNttOsH+dbdUz4bwovoPjDwSTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMX2scsTgR0tylcjZRECY6zLp2ABtNlyxl+6FSm3pGbqo5kF2i2frMv4Ol4odUu0ZhPLl8MQKacPuP1d5IyIPrGO1cSBXxLbHtvh80QT90+oVrqVhhRoOrV/GeLxpKfSHYNPH+49JSjlAMeYG2gOii9AqrmCYq1BD8Jn0yzmzoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aD0UN9K0; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aD0UN9K0"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c124c3c876aso517216666b.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 10:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782839446; cv=none;
        d=google.com; s=arc-20260327;
        b=andZv5T6ebIIYNkx2TRNjO5OsOD8QPJcqvgWwasm3QKROEN08C5rMsraE8I2V04ZGV
         sQU+/rJAnKxbl8C8GsIPaox1vYy3XAY7o6jsJs206trGBoIwLGrL3bv/Ab7tiobbm3gi
         g7mehF90dFbBzhKDi0+2CjNZ2CGHPVQXP3iXdJCrn165kjxRR9B/j6VItIfPeqAbFds+
         k2UkqPD/FzSB+P5g6XeYYmJ53+5YDSQDZQMTd2/3mt1tRnYXoSLKS53MmALpeWkJZSIW
         BXQl0rkB+DGmeONqI53QmTFz8fzP3xmmf+mv33kCJoGvs2kugdPQUqfODcNqnigJXZD+
         4wJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=64A1s13t8IpGGSBhMh8O8eYrTFpABwP1rR+WIQ9DsoI=;
        fh=JfcuYBLwM3NOS2Nuow0Zfu8paZyxXMFFaWPM8Oi8DKg=;
        b=D0XcOjVbpI3jc6UbZo9V1F8+MbsQxnSvoB+2HEoiCxWgcO802+hPO6uFg1BdlK98nN
         VnyVhfBKj3i3lGZ0emGyktgTNyj2y8bWCl8HlMdKDIYPdBUeFGUg98/s+R0Ccxr6nxOI
         UEbs2ipVkJU6aePpeoKeucJtc6T9d4mz3ry0++4K+JVhAP6qqAl5t9KluDsrxvgcbe5o
         7PnEOdnR4ZbAttWlOHEUtHdHjE292agm/BvQgllDPJkva0PB6cM84pP9w8ypi+rkdqQK
         1wiI4fMWKvSfQkmP/ZZdAXxzBFMCflA8ncHCJ6ZZWpImzJM/D36IIjTrrAMwI1euSthL
         NhTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782839446; x=1783444246; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=64A1s13t8IpGGSBhMh8O8eYrTFpABwP1rR+WIQ9DsoI=;
        b=aD0UN9K0I2je6VboJYEwgYK/1RyEHdtZCobpZKj1h227f+0T94gqS5Uu2Z6SxTLT/s
         PFX1n5ScwuxOhL0q5YiTfGIy4PjNbSi9lZr348jFAwbRvO/KMTTe6v7VVTYV1YUbm9UG
         Lj1gnmQyJjV2zBkY2fbKjQg6ZDVv3KA6l/fukd/sHKRYMV/Kn9yXshmkW9JgiYpb2+/i
         ZlA3uU/nxcw7IDniepvYdidEtkgqB1m5UNzSZ9uN7hYKpuccCybt0uRnSSMUdf6iTlHE
         sOrbJLR3YtoaZNa/jBiDHXnf8Mw1x9VumT1EU+4EofBM+/J9/kDQt3PDhtgvHDr2KAiA
         m2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839446; x=1783444246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64A1s13t8IpGGSBhMh8O8eYrTFpABwP1rR+WIQ9DsoI=;
        b=owTF+i7LbOPfobJFDp1egWo9Vzzh6hZ/oMkcSbf3xvjRS7eZfeshPQKa1r1CE9uV3D
         5cEw7C/BN8Hq0z0rUuZBbxvZicgzs9KTquAIWuyWi3tnJea7yRki1HKLa7VzUQP2LpT1
         YsfWV5HdQET805VHloYGMw8+FuPh7ZJUwZjCw38tIze2CIpMOwzxYIaoJuoboNSysAiv
         pMJUy2e9Ccp5GmbTWTK1J1Bp07S1z4vYXiNNbWMIurCD2+FJRym8h7DIeOWbXo9jeEZj
         E03SXZQ5M/84x3uuwIP/jV/1MWnkW8Z7UZjdaNYxWAG80D/fc2idReRWLxa9wPFo0cZt
         Zz5A==
X-Forwarded-Encrypted: i=1; AHgh+RpU4+Bi4NbpMTr5hXH+QGPkiKPZGIOW/W54QrCbgqm0A+Om1mR8vgo5INmyMDuF5zUgkiZZSRys4k0=@vger.kernel.org
X-Gm-Message-State: AOJu0YycBhxV4FUv0TZEaEwjUVLyzrnZHJaxe0Y9sjp37s7Q4WMBtT0g
	gXAHffJOgCndIyjT8Ky19yRM+sTctLU6HAEsfWxOHkQ+trjDhPLFtoo7rBgi74w2giGZUvRfrS3
	Z+92C7jQt5yeNukHoSw8uTJ7C4BIRLsQ=
X-Gm-Gg: AfdE7ck+uJl73y4XDam1hHYuJFh1chDlC4hwADXn1hAnvVyBGlaJEnzh+XdrP4fl9es
	oPCPNCxUcJAMZ9BYNaV/+vqUXTf9nYRPceI2lXOSM3EZ7Iw+crb8zDcV/JByy6gXMHd9bk6038g
	ja4tx415azonKXx73RBPFfTRD6dzwrTur16D4GoV1b8O7XwY5s3Y33ImLgmF+b61MOyjKCDO1Dt
	b251iodqwIExsfG6ILJNdHAIz0aeRWnCulJcjjNI80RN4uBdpVErrcFPB1IDQ4UqgMxOLotx7e1
	rFTDf5gUFaVJcmi0ifxbN9IY+sBqbEs=
X-Received: by 2002:a17:906:6a84:b0:c12:8296:1a76 with SMTP id
 a640c23a62f3a-c12872d6ec8mr174161766b.33.1782839445331; Tue, 30 Jun 2026
 10:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623161035.5792-1-nikhilsolanke5@gmail.com>
 <20260628231634.6752f74d.michal.pecio@gmail.com> <CAFgddh+AUNH9Ji-Qd=BKEDZWJrzPMWN20-g-htQDPSdSehZStQ@mail.gmail.com>
 <e7d49127-0215-4b29-9a2a-e1dc0d889b70@rowland.harvard.edu>
In-Reply-To: <e7d49127-0215-4b29-9a2a-e1dc0d889b70@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Tue, 30 Jun 2026 22:40:33 +0530
X-Gm-Features: AVVi8CfKnnvidb5guFAdpaAe6CVJqAOJJ5DDmKL1Krrb-F8QVvOrevg30QCfF0c
Message-ID: <CAFgddhLeQ1cJv-E4mYWR8cs7T2USkrEd5i=uxqkNCH2UWaQ5=g@mail.gmail.com>
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> There's nothing wrong with trusting the caller to do the right thing.
> Besides, if a segfault does occur then it will be pretty obvious that
> the caller needs to be fixed.
>
> What would you do if buf is NULL?  Return an error code?  That won't
> help anyone locate the bug.  Put an error message in the log?  Segfaults
> are much more visible.

Understood. I guess my coding style is a little "too paranoid" and
"check everything and report errors". I understood now why this may
not always be the best approach in low level programming like kernel
development.

Anyways, I have done all the requested changes. Here's a short summary:
- put strings in a single line
- copy bytes from desc to bigbuffer instead of pointer aliasing. (so
no krealloc too)
- change tabs to spaces in documentation
- reworded some comments
- drop USB_CONFIG_WINDOWS_REQ_SIZE macro
- revert USB_DELAY_INIT to original behavior. no delay before 1st request.

Let me know if I missed any changes mentioned in previous discussions
(or misunderstood and made unnecessary changes :') ).

> I wonder if it wouldn't make sense to split announce_device() so that
> the first line is printed as soon as usb_new_device() starts, before
> enumeration is attempted and possibly fails.

The current patch still logs device ids upon failure in
usb_enumerate_device(). Do you want me to implement that suggestion?

Thanks,
Nikhil Solanke
