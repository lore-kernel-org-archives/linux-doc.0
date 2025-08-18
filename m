Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825D258ECF
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531083; cv=none; b=OdfSccHxjVvOTmxyQb5hbAg8AH6bDT9dzNHJoPgUtMAJLl1dhFnxz5P8PXRXudQ/LW28d9oxOIIJaqy0oqYJMrnFG97QLoj0XfKI57r3XxiQ8M0Wno3uQm5YUJGPQeIKJgYoq+KQ+TL+rkzqak9GlE8z4ZHLhs7fL2mTGGYzon4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531083; c=relaxed/simple;
	bh=+6VqLVKyv05yN0VjgFO41/0HRC8AqQkg4NrOglzZNEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKT5KEwqqCL3jPyUSc6nlJeHiEgJQD/x1g+NwBzFncMD9QSxufWUzYjQEUF6OCcQcrM1gVTU1xfcg0VVwOLYgYKaV4RybFADHZ9PK2jV7tFCSwx19SscEM7UFjX/bR8u1479WMNZxCRgsf/2ow1PdaWGjV371Bz20TCE49ttAug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HDj51jWc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HDj51jWc"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55ce5097638so4421213e87.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755531080; x=1756135880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KCWYcyoQfVDDPCaibHrt6HfGNhIf9FB+HrFqr1TEMY=;
        b=HDj51jWcZPySdCrZLpQgNeKs3PgI7cCfT+Q8XVFWMlCT82eycYZC6JqgrQ3GORQYE+
         MZZfZjnHQJAg3YzNRJfbfH6mROVdretcL1R8qkx3PYKtnNplPERcU8spdTIdhFSIxKKD
         /iyoCm7i4H05gF8c8d4ZTXVaABuhB6nR3T0t+UDb0NhtFusyD1mYAvWbZEXx6mc4OG6R
         ENlyXoUnTpikkrJQIizYBqr+6OaKC1wLiPMhtMZ9/BhUhOL6vb+ENn2Aywp7r0rPSOID
         8xgU2QGpGOH28pDKSxg+LtPm3YPO/0aTbcYRtK5OvtkPg9qRRbnXCiO6sFv+5VuGdEp0
         75aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531080; x=1756135880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KCWYcyoQfVDDPCaibHrt6HfGNhIf9FB+HrFqr1TEMY=;
        b=ZSh4FwjzSTbJQHts+X+14CUnv6+y1SRJfgBh/ydDIATHepDNFMkjXbz/17pOhi5/ah
         yHuqPkgGIlr87QNoFBgHKqQFSXU4mwxsAvsNHvn9KBNJOBhbdvWHbwr1I/kVxspm0/st
         N93NU8tsxKvtTweXFXmeBSftxWsjcoMJGnb0oPFw8p15p4EVNYWx+9gSmgWvruj/St/3
         mUiak9Z+C3y8Sh7kFAWGfXF7Jdqw1/GM2VfkDRrk1vhZYyd1COI1iNvGytzo1sJFqKb0
         4cX8KMOxxWvkzgsSowZV5spOySx1V14GZjnQrwCi7bzsxzcvilVVXXuTQ/HpG4LaV5fi
         lrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbaKm59limUwllpcIi5vKeaeiGgrVWkK9i8U/WveNqQXr6wr1FaQOFR1opTNfoOTRRoGSfPIP6Jc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxMUzqYNPwu6kPRUUdJykK4U9cjJNX4l8Phqio2ey3Jgfp/nZZ
	GfoTxnc4tFDuSNtsWowJ+q98MivEMfU7cvi08kTNC4RoCxpVMqdqMOFEFBiHZCWjPqb303pCsgZ
	fX90+KvQmU/WhSMGlgWF9Owuul7uciqDeSxFLovgiKQ==
X-Gm-Gg: ASbGncvSk2jN/MdaSwj2gu42EjbLtoYi7Ci8JxCRISxZWj7WxhQ7Lje0Co2uNOvC8n/
	z0rK9BcoYk+0RMtc27x1k2rnMLBMChFaH/ZT0pAQxgH+SkW3qNu6EO52GQLPnpcJogzouiJ4kiz
	5dFTzUUpqOnOZxEZ3wJnuoNzQ2o2nRvSgfAisk3sn9+yunF35HxSoYAAdJtPPe5Ena3et9tpIVF
	ADH1JmZu7Eu
X-Google-Smtp-Source: AGHT+IELpJnaXx7GhevpidzXIkKTwIAXCmVMgW9kYcw7FaocEXBHltXdb8h9Lt/Brd2z5aHr05TbcwdYLSE7e6xBYFY=
X-Received: by 2002:a05:6512:31cb:b0:55c:cb6d:a45a with SMTP id
 2adb3069b0e04-55ceeb2d2f8mr3584495e87.26.1755531079971; Mon, 18 Aug 2025
 08:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813081139.93201-1-christian.bruel@foss.st.com> <20250813081139.93201-3-christian.bruel@foss.st.com>
In-Reply-To: <20250813081139.93201-3-christian.bruel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:31:08 +0200
X-Gm-Features: Ac12FXxa8EDDTp4GkHqlafMLuMBYVjtHPVlM15dMmsTqEHuJ1r-eg9GR22h9qAU
Message-ID: <CACRpkdafM9-0DYumrwuZZ5S2_CbabdP6joK1bGiAvm897Ng89Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: Add pinctrl_pm_select_init_state helper function
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: corbet@lwn.net, bhelgaas@google.com, mani@kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 10:13=E2=80=AFAM Christian Bruel
<christian.bruel@foss.st.com> wrote:

> If a platformm requires an initial pinctrl state during probing, this
> helper function provides the client with access to the same initial
> state.
>
> eg:
>  xxx_suspend_noirq
>     ...
>     pinctrl_pm_select_sleep_state
>
>  xxx resume_noirq
>     pinctrl_pm_select_init_state
>     ...
>     pinctrl_pm_select_default_state
>
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bj=C3=B6rn, just apply this with the other patch so all works fine
in your tree, I don't think it will conflict anything.

Yours,
Linus Walleij
