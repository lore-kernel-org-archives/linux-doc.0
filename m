Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A11758D
	for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712849142; cv=none; b=KtCPRUaJ7kCMnlILE8ZlEELXCCWPT3KVLNeP6dey6MNy+TH3oKbHi8XLMzPIPSLWAjLxRucXAnPy44q8s+UcOSr5naV5TqSjphLI/20fo13eyXyksZ5krIG+Wpem3Gv/JK86CwEoRkIMCESxohBu6yTftgZ3R2Kgu5gQ40BPY04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712849142; c=relaxed/simple;
	bh=S0tSkli8JleHY8iE9O2afY6bV3mjLC/eVHPCMEho8Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fsk8dbQetVKEZBqNSFDZFsL+Gt03+iASl0FOywurA2Q9YqqIyJN0YtvnW4OBe6k5Rc5EHAmIxjR+P11an5li0ZD1eu3KWmhvNcf1LpOY9/DWY6/1/sTSqmgvxkMoXuyACWxym+ujcVM/UjI1pDwa7CXIq1qxI4CSLqY+ldHH09g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U5YRkVIs; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U5YRkVIs"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so5435400a12.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Apr 2024 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712849138; x=1713453938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CABfqMACNUngHNLxS+WM0hHJ1yaxWLelGbJxYjHioD0=;
        b=U5YRkVIsfjsdxYrqviqFldW3aGgJpxI95Xx9WtuZtRE4oGNUou/5vryJRC9Fm9mbWI
         0oW0BHPWPWBNjOdKKZtlJlPuSTA7JCxqdpogQMFdoBWF1OD3kPk3rs7hdHqbvgvZDg0g
         FPiIFMNvhw/PbASOX8xkWBMy8iKmqHbZbXdnniQgC1etonGUdgwPRRGtUD4z+eu6vlgb
         Hnq5Ee+6VznM1khG44NboOAIt8kYqj5Q2zDb+onyXfL4pNnVpUZMlB7sfzDCSNFLZ1Ss
         C8s8Fb2FJ1eVCLip9agNb+b1Vd0rUZFWc6akd2nrOheBpdsw0oUWp/Fy5ElLUlEqV/k0
         LcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712849138; x=1713453938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CABfqMACNUngHNLxS+WM0hHJ1yaxWLelGbJxYjHioD0=;
        b=T91chvdLQuj+nwp+5uhFL9DG3nI4rfF1mFBrjaZ8IODc6UtvrZ+oaA+/OjGo7+dJD3
         TxBz9DLK3OosLZCKZPEPaoHMlhegDBgJekFfczPDri2jyBp5w0ZuJR/DMcHE2/GPgSRr
         8cNkZk0ZKHvaUNvZ8DA6N+t1JMLM0UnOSVX2lxEgVV0XAqi3IKFiQSuBk4raDJgDyy1s
         Cek8oLVd2jA321HkzGGCy39vcrBYqRophtDm8PaXYzzz2cJPpPld/0aV3Id9JUa/hyun
         VWRGkTUkaysJbgFRbwkBXXHX5NWzgZnHZola0lI1dsQsdO9FR3vLN6dKymXXCwg1Ou4q
         8S/A==
X-Forwarded-Encrypted: i=1; AJvYcCWN5dK3CW8YHp9EPkjLH79zEq/fkVk/Y97wkyetOxr3z9zAy8EhiyYoxJZtUZznqfeZ0ay0xqG9WAdptV8+jHHP9AJogfjUm2hf
X-Gm-Message-State: AOJu0YxAHxGQ+0jmXvhTvA+W2Zn/oB+lbX++pvBYEe1pX4Vl7EQeN/uo
	GyYc4gaUpxha+cN45UiL/IlwRR1T1tNsh5xLqotHE3QqGkkuvQPyou3OyZ4QsP3elvKQsNqHcv0
	B
X-Google-Smtp-Source: AGHT+IEEewk7llSPmgrxe/7mA2rySV/OUDonUpYE2d0l2M0z39pI2HKiyjdOd8AbAw/PCbmxmW//Bg==
X-Received: by 2002:a17:906:4f06:b0:a52:3d1:6769 with SMTP id t6-20020a1709064f0600b00a5203d16769mr44591eju.14.1712849137563;
        Thu, 11 Apr 2024 08:25:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r3-20020a170906350300b00a522c69f28asm225076eja.216.2024.04.11.08.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 08:25:36 -0700 (PDT)
Date: Thu, 11 Apr 2024 18:25:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	speakup@linux-speakup.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-afs@lists.infradead.org, ecryptfs@vger.kernel.org,
	netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org, linux-arch@vger.kernel.org,
	io-uring@vger.kernel.org, cocci@inria.fr,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
Message-ID: <0bd7ccc2-4d8c-455b-a6c2-972ebe1fcb08@moroto.mountain>
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411150437.496153-4-thorsten.blum@toblux.com>

On Thu, Apr 11, 2024 at 05:04:40PM +0200, Thorsten Blum wrote:
> Use `find . -type f -exec sed -i 's/\<the the\>/the/g' {} +` to find all
> occurrences of "the the" and replace them with a single "the".
> 
> Changes only comments and documentation - no code changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---

It's tricky to know which tree a patch like this would go through.  We
used to have a trivial tree for this stuff but I guess that didn't work.
It's possible that it could go through linux-doc, but probably it has to
go as a set of patches through each of the trees in the CC list.

regards,
dan carpenter

