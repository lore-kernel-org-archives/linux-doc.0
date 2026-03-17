Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F061C30EF7C
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773741802; cv=none; b=bjkvphKWsjfBOuDF7jXSyCAT4zUyE+fU72iiD0fifZ+0RDL1rX015ezk7B7nmDK5HD9h0eGdu7BfOx3PW0/KXwCwQzkU21/SaLu1x257msBv/S3NyjwNI5DIqfSVAYDQnTRVIQa87dNa8McKI86a6X00kzITBZn5kjtXeKPyrbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773741802; c=relaxed/simple;
	bh=8fV85trx/R47h5vifBybTf4+W6z3VyyEvYi8IAwoEbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEjYwn8jugrCKfAYGu/RAMl3xEbR7kl2TBjMynTLmIbVFuR7f8lF0C14MAab1PXWPFWhPMVDWjeYJUnmslT6rX0tlGh6JZPS12gt/G/1TvvrK13Plz2jQvTLiuNukWEfluNkWJwowYkdHUbqckyd5jCDAKSB5ZAoQEsvKEIPhAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rUbADpQk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rUbADpQk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so64748845e9.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773741799; x=1774346599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MZ5u5gAltLh5uEgFrUNUWe9cgVa4WC5hN8ka5M2ffvk=;
        b=rUbADpQkuiiBeXzifch61iUj/UQN8yFJYfMG7eI8mujtU8DoJFPex5YmujwzyVVfP4
         31PNCh7y1ViR1VIxCVgCy7+rghs38AMrw55WfPVjwWh2ZTkmqAb/NAuT+TUiNtBb55kR
         5w7QQXIIRDWlkrEjaqAvX82ps0ewx6Ffa7iE+rwPrl+UotT6f0LehGdjcZwg7Rk7XgZU
         Lh2XGOu6Vw21D1xvzOqI+ILc1bgbyJ0dhKdkSmQ0f8tjXvYXd0dYAUUuJNaeOQgB3+XZ
         JOcOCXvd6SRn+0tU+qZdYwZg7A/VGzBsIuxYraLz3ZZIeDCnpeJVLaiG5RLoQED8zcYy
         aEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773741799; x=1774346599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZ5u5gAltLh5uEgFrUNUWe9cgVa4WC5hN8ka5M2ffvk=;
        b=hJxzPOeV7Lhp9uLOINBfc437cyTlB4uSjlzkDd6mFi0codQ5BAmWkqJJjRf33D5NKn
         s6K9k4S4ayM4H33YCbtphZ012/NNXAvMVI0B6n1TCoG6Pkg1IbaYqbfIRrA5gK5XBuxY
         BHEtD9brJ126s2inC7j8AEPV0LQEvVlSE4g6FD8abphU6CJltv7oSvmMvtQNhJLGwwjC
         /pd3Sc8H60ppg3hF1uxhit6STKqfp8XxLh9kdGTKRlFhvqTKG87ORQCFSnxBgKpili0X
         1iK5CT0ZcwV1u1ZDr2HCOaJkH9LHGxA9kAWRH/0IMkm2uoShcMG1pRiZ7hPGqi+kWb0K
         HHZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqW9kjUmYU9iU2gw1kP6e0pu0FtU8kI8rXlR11Uz7HadsZtfIA6v33Njlly2okovixE0Cr8HbPsbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ1HtMX+byWfkPIu7Qw4IdiQksssCCo7d1Je61E6cDED6Z+e+i
	v/Ur1U4VaZ15o8PltrcNwY0RG3ZcuTM1gucd+A2Xr/rMW2Fd1IBKGujwt9Y0h4hmmtw=
X-Gm-Gg: ATEYQzzemlab5cYz89manZ2K11vbYrtlOtEYDVUhHmV/lbnCrXXBKeiDpGHBA+Da6Oe
	VGEO52sZTRqBxGNeM7l1jhGUVqGpslqooBKTbiq5pPP8zLBnW0vPLWtNhsrf3rIjQptwXNwreCX
	aO1TtpbIC3fUuffgpFC+Q+RYEyJQu4vsiHGS5HBG0pQGTTglMUA1lRo9deWXHtLLdT35WarWknk
	DuGWkhXUq1fZNnAxSu+ASccarhgRhsanr1UEi3Dy7xmTttitLBl/4v3716/3MDidz4Pcj6psrEW
	TT18NkoK1qMMbdHCWd+v0WBxv+SQ3YzVc9Iwudx1rpFeULWZraztalD67iug0hEyzgH7yT5sW4G
	KZvYszMnPzYHK5BiTQjmMlKOBTk5LJXLfcXhfENBz3J6jJx7pCqv2cZOIrEGLRdOzBP1GNnsHyY
	/P47YB7AmgjU2fwvH+pDSdhBoABkKf
X-Received: by 2002:a05:600c:c4ac:b0:485:33ad:3c9f with SMTP id 5b1f17b1804b1-4855670c164mr271097835e9.25.1773741799028;
        Tue, 17 Mar 2026 03:03:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaa3b66sm63481085e9.11.2026.03.17.03.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:03:18 -0700 (PDT)
Date: Tue, 17 Mar 2026 13:03:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v6 0/5] kunit: Add support for suppressing warning
 backtraces
Message-ID: <abkm46TIIBBbuuC_@stanley.mountain>
References: <20260317-kunit_add_support-v6-0-dd22aeb3fe5d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-kunit_add_support-v6-0-dd22aeb3fe5d@redhat.com>

I think this is great to suppress some warnings, and I already ACKed
this patchset.  But we're still going to have some warnings where the
warning is the whole point of the test.

It would be great if marked these somehow:
1) At minimum we should mark them so people seeing the warning know it's
intentional.  "Intentional Stack Trace".  I've sent at least one patch
to add that printk before the stack trace but it was ignored.  We could
do this piecemeal.

2) It would be nice if the print was standardized enough so CI systems
could automatically filter it out.

regards,
dan carpenter

