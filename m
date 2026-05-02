Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFB83803C8
	for <linux-doc@vger.kernel.org>; Sat,  2 May 2026 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745968; cv=pass; b=C3bhjhZSc9tgWinrjc6tO603KkM1hkHX1PSFLhYRWD3JwHZVsuxAcx8EClDTQ64+6eHh6l8yk7W3hGNM7IDAKHdq9uzJo8uLugXP+h5AHK7Z8IJ11pmD1LKuKSx3dyNGfIydMeRTcJv7NqH8j56/JitVtWeNG0Tary6ABsF3qQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745968; c=relaxed/simple;
	bh=+K+CjYCLdUh18W1ttxDZMpkeYOxlU1L6bgpkpRddnEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDeTRm9iMQh5tsuSJLKdsWlcGah9qpqp2ey0gdxzaQ4Q0MP1j96WDB+TvSw6CdzTk/hSV4mqAKzhOTHfGPUKfMVXx3e1uaf+vPd0U7p9pdHp4mvXDw6GoZoOvPSRSpGGZKkRiPfO9gWQKQpmAWESAiFWhSqQjOHazQ+AqzLO4ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F7SNdw4l; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ckKLqlAN; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F7SNdw4l";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ckKLqlAN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777745964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+K+CjYCLdUh18W1ttxDZMpkeYOxlU1L6bgpkpRddnEY=;
	b=F7SNdw4lZWksyZ9yeDyATB0qnA1i5+2DhORmE3aamCRK/1afzte5z+rsNbDNFwUfmwZB9Y
	zwbV0uuYAYKPBDgMtrF/Ct1cUWJz9iFahGhnx23uGuowSG8eSfMeOCaZM0jJ71tS96gXAB
	dTqNSuc+WSoAANvti6sW2XIBlBta53I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-QuWknHziM9uymwp4nJkJ1A-1; Sat, 02 May 2026 14:19:23 -0400
X-MC-Unique: QuWknHziM9uymwp4nJkJ1A-1
X-Mimecast-MFC-AGG-ID: QuWknHziM9uymwp4nJkJ1A_1777745962
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-678ad5bfc8cso2713794a12.2
        for <linux-doc@vger.kernel.org>; Sat, 02 May 2026 11:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777745962; cv=none;
        d=google.com; s=arc-20240605;
        b=Vs8BOD6ir3+gJoBMnClpu+uBKU2ACNkTy6pIVVMejd0WtFSwCpCgmwGQeEHWP2CZTC
         5Qs67HTGFjQL4G/26EaypEcwKliyq8Gv7ULMiJmBrp2OKs3GVHtQr5npgvDw4eo85i1S
         Q+DCYlpvC7fntt0UDkGr4FNrA5SIQeMY8LiDypICzJCOq/8g7VaohgjdW1LsMGwIJuMn
         HOXmB+NyieiSlo+eLbrV+AnopDiyt1izAgPmSVqdlV0OHuEfGEn//OSIOKWzQetaagf+
         iw/NWlTg0RB+nuTmqS30FU4r2mvgAK7dGPXX4xc//cPhz1mQLh8NHb3sP2/LN2AGue3G
         7BpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+K+CjYCLdUh18W1ttxDZMpkeYOxlU1L6bgpkpRddnEY=;
        fh=7eHsdZVndDYZf5Na2KnEHDs6DgE+RVaOcHiIcnn8zxE=;
        b=kfQMUWL66jmNDHkXUXCDR9pA7KanlXCwQ1z8g/ejQ4HrTtWWuqaztppSh4RSol5fvr
         bfW+4Onvb/5gr2hY5H5q33toWqCCLPVnp1c8jKPaJTW08XVKYSTzErWf6pzLBorM7Zso
         SBHpa5x7FMpM1IHt2WFaGdB+z/NnQUI5JfEFGR+m1vqhaMnxrmZW6x/ZEZOGxS3LCIxR
         Sl5q0OiioHkBPwTb+KNlf7nCd3NaHPL1VEeWK20fvr2cO7w1bcFvjvD4PyE0SHhm3O9w
         /56lrVI5224lM/4VBZnrGCVFND7xRZWys7/Sz+2aGxUYuQqC2XzLlEb0OHVgKIJvmEQB
         gjLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777745962; x=1778350762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+K+CjYCLdUh18W1ttxDZMpkeYOxlU1L6bgpkpRddnEY=;
        b=ckKLqlANI0ig3X21b9Z5m07rqZlV0K6sgXjgCwiPT15Rx4qYcWG7JzSSm7UftPHfy1
         rWbcbfryVBGXyzEUY9uM66vFAHcbzhL78NVQP6BlTo0g3PVAf24bS2+kP8QwJayS9nCf
         pCY2y01Gde4uy8Udje14CXCZ58MS9zbGWNC2WLrzpm+QGtP1iScxJBH+sSU2Ep/ykezf
         cAoN0xeehcICFREXGw6pASMeQ7TX3S+xio7WgdOIyvJS2vLTK5qXFhj7LGKR6B3s4HxK
         l88VcCBNxfUVC2TmxvJb23VtvW9u4becbT7VNaGYN+pWAW7qZRqsqj0o+Mpdz1swV/8M
         DEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777745962; x=1778350762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K+CjYCLdUh18W1ttxDZMpkeYOxlU1L6bgpkpRddnEY=;
        b=MOrlZ6japj3pP5+q1+FJOy0kaARzf42NChn2BRQ9xGc1tsKhyat6bTnOK8n8SUmDVA
         9QWFpTZ3gkf8+Oop0375YcFeb9TjYQIG7vDndBMJiG6HnSANRL1Il9sLxStVO/r8gQEO
         +BJsOVl/07X66XCzKQQfrjfUZVck9YIfThEMt7hO4RGdgvMMLafmLtlly0sqeam0RSEf
         2GFf5aUSOTaXfINwC1T9Mms1R/L64knK/t7z79KwOkWQUAO7SgrTaB/1fZmO18x1rSO1
         9fnfg4ASC6bqNs8bxdg/BD1kizGNmKhYYGkhoWr3kQePZe+3YCN2LbxpPGZnefu5sqNQ
         3UTw==
X-Forwarded-Encrypted: i=1; AFNElJ/R7pgo4nahUmP2wJDxfaVsZBis1pc/Z2U8kHFIXUctSNDFq1D9GSZF/NrQlK/F/VCWwBW8dxUUypM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9WXcqRdc/P74+up5NmVMhu3Z2UpuZiCxDnReR79lYdjennqn
	SsUNDUnGtJ+W9OIumgLegjhwMBZsVnq6/8M/V/O5S/EklwjFR0dQvUOizwwVLGiIGqRIX42R8v3
	Ozh4tED9Vc0jWaV37IwWQVjn04Z/FO6Yt+N7DeirVIAXZUWGrtvIVS2WqyOBS9S3yXfQfAjLVHD
	IhmLFbD6MqsbRQxYdszaMs4Irot0L+72U01dm8
X-Gm-Gg: AeBDieu4MlfuTB/aiworEeTb1ucdI9RQPkSRBfX85OS2/psBSQro4u0rP79bm/ITbt5
	n4UaPVFhQnpHiGdPLEfayrSFwEJKLD90uLwlffLDseToksWH6TQgW+6FxkE12V63tbyyAlZOmev
	TbzXh+GXd+1VboIcGVUNojtIbmLDgrG/wa1mSpqhLDAr7gokzBYwWUmuqF6fnr2uKjKrYK4lSxS
	KvWE+RtyxRbZnm8ZcA9m2x8FzfcNzSJRuMn5XHEx53vA9frzA==
X-Received: by 2002:a05:6402:1f85:b0:678:7da5:2346 with SMTP id 4fb4d7f45d1cf-67c1b3b2919mr1382854a12.25.1777745961912;
        Sat, 02 May 2026 11:19:21 -0700 (PDT)
X-Received: by 2002:a05:6402:1f85:b0:678:7da5:2346 with SMTP id
 4fb4d7f45d1cf-67c1b3b2919mr1382845a12.25.1777745961505; Sat, 02 May 2026
 11:19:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502120206.1289126-1-costa.shul@redhat.com> <70322b63-be09-457d-a73a-2fd2612b71b7@infradead.org>
In-Reply-To: <70322b63-be09-457d-a73a-2fd2612b71b7@infradead.org>
From: Costa Shulyupin <costa.shul@redhat.com>
Date: Sat, 2 May 2026 21:18:45 +0300
X-Gm-Features: AVHnY4I9gEQfZV0bbCNaReME1JN6i6hFWjXpQ24JaRPg9W8Yo28DWhtygV5Djq4
Message-ID: <CADDUTFw1iD_1P=Ooyv97DzWOQ0Bc0a9GbGSJpossSEXOuw3y5Q@mail.gmail.com>
Subject: Re: [PATCH v2] docs: Remove stale ISDN parameters
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 19:35, Randy Dunlap <rdunlap@infradead.org> wrote:
> I'm curious: how and why did Claude assist you in this?

I've asked Claude to find and fix outdated content in the documentation.

Thanks
Costa

