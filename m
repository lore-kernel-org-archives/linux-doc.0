Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE880C04
	for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713198403; cv=none; b=UUR9pBDEyupHCN7oEgiksiS04m8KmCTZhtz/8t74exCZHxzI/P1DcJ0rBkTNLEPpBzT2sXdGWMdUTRh43eOxOLQBuWEfVMv9/7XRb7aB/7PLIU9lsBZLuBP3ZXBnEc9279wySTqdtV1qpICeOp/7VnL6juhgG8HswGqm0yp6f6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713198403; c=relaxed/simple;
	bh=TPnCz2wIas6s6nm4zl4kHicnrqDlbc3QFZUPUtZbe4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8V4NNsOCQhfKUMQrNZU6grsHlGkJoW5F8Ru0MtgeKHZU2oCbfnZsadk8m0KjNtuQFBhgtriiR+Jgdh5uSwp1Twjw95Y1C04l5jYf7e2KlDg00YigfLb4Cw6kNsXz2uOZMfCdbtiwgY9tL+jhxebrpg0YBo7f1rJ4sT+/cOBTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nZ+gxhY1; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nZ+gxhY1"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5aa1fe2ad39so2456957eaf.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713198401; x=1713803201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QKHTfr0tvl13h4ZA+OR/lP9gzZF3Fnqy/imumDFRLcI=;
        b=nZ+gxhY1m3mhD3UrfIhn5CDg7S5qCFXvhWlgNO9Ckv8PPTkFmJCwMhQUx40+PyqJ56
         /uszDEHZoTFaJtOn2StgYoTtBaU84GPDXS1PwbKzM4weKqUPA66n2nGR+KzKmOtIEiCM
         v2O/sNCsCre+cgSsAvEnZBHZtcskEPOjTbzFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713198401; x=1713803201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKHTfr0tvl13h4ZA+OR/lP9gzZF3Fnqy/imumDFRLcI=;
        b=ge6afVoZxup2clvDIa3jjNOJyye5mb9yetTWA+Vivn/WNuacnpyyCZmt0gmPb7hrrl
         jC89ZeA3QLzb/rk4HtkzBCllmzDNOR8ZbExnhqkj/y0SReKtKmVCqyrUJyi1J4Kbglg5
         gCRFKokTM55owj4hkcAp6WEDpWHcFhAoTVSNL/G5pWHunM1af7R3o1FeMUP768ki/DZD
         G2SX2PO4gE0nfshJ7RJHg8vSbTjcyD0EcWOogQRPNnJqNFxutHdDYLKWhSqjbIojjmMu
         rmSJddWKJTTJsZu2cvhTDhmcaOsmvJhrXMgjg02krSCO+YghJblszsZCucUNiyGttlgJ
         IRUg==
X-Forwarded-Encrypted: i=1; AJvYcCWS8zUR2EuYXXe0E1c3rE0P1iuLXkSzgiRk7EmEUcH3dYgPWA5ox5FZENoS1kVprVKN1PB/VMxjO/y8HBVZ0tWOJ8n8YdaaSaJo
X-Gm-Message-State: AOJu0YwueYd8gkwqE10y+gTJEFHC6T5rwq19B/QtBAm2t7NXqwxMONw3
	7JJzZ48J8WiQIcn29qgmyhQuEulQ7atkO2vneFTPu1k9w9Vau0jlOcEDZWoGULmN4P4fEXMaRmE
	=
X-Google-Smtp-Source: AGHT+IG5foknaEEd3MkXk9+LN5r3/huMB4/LsTYhpQfavkLppvPRN0r2oC8b83xw/nAjf+NuBYciog==
X-Received: by 2002:a05:6358:c695:b0:183:e8d7:6f58 with SMTP id fe21-20020a056358c69500b00183e8d76f58mr7637642rwb.32.1713198401272;
        Mon, 15 Apr 2024 09:26:41 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x124-20020a636382000000b005bdbe9a597fsm7238801pgb.57.2024.04.15.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:26:40 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:26:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, Alex Elder <elder@linaro.org>,
	corbet@lwn.net, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-style: don't encourage WARN*()
Message-ID: <202404150919.042E6FF@keescook>
References: <20240414170850.148122-1-elder@linaro.org>
 <ZhzgTeEHFF19N3UZ@infradead.org>
 <2024041544-fester-undead-7949@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024041544-fester-undead-7949@gregkh>

On Mon, Apr 15, 2024 at 10:35:21AM +0200, Greg KH wrote:
> On Mon, Apr 15, 2024 at 01:07:41AM -0700, Christoph Hellwig wrote:
> > No, this advice is wronger than wrong.  If you set panic_on_warn you
> > get to keep the pieces.  
> > 
> 
> But don't add new WARN() calls please, just properly clean up and handle
> the error.  And any WARN() that userspace can trigger ends up triggering
> syzbot reports which also is a major pain, even if you don't have
> panic_on_warn enabled.

Here's what was more recently written on WARN:

https://docs.kernel.org/process/deprecated.html#bug-and-bug-on

Specifically:

- never use BUG*()
- WARN*() should only be used for "expected to be unreachable" situations

This, then, maps correctly to panic_on_warn: System owners may have set
the panic_on_warn sysctl, to make sure their systems do not continue
running in the face of "unreachable" conditions.

As in, userspace should _never_ be able to reach a WARN(). If it can,
either the logic leading to it needs to be fixed, or the WARN() needs to
be changed to a pr_warn().

-- 
Kees Cook
