Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCD72EAD18
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796291; cv=none; b=J78lXrXfF4BLG1IThm8T/voOSiquIxo3dk7BieqfeTTAjMoX0fKdVy2fM2v+bxWmp4pPOtQMEOoa80+FN7Hh0xsZlOLoHakHEvtHudXf/FcXXcF4319ES5Cki7klGjvKsNVe94CT8+E4Unl/ZvfZ6n9bK6Cl1M2ygSRqwKF5R1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796291; c=relaxed/simple;
	bh=fQAAEa0IEdGGZklTEH1aa3BIFmCLu/CkQamKj+rGm1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJhjBwhwcp/jxv9tRLb8Tbdk3zlXwNUAp/hJHh57JMFuqHcYDIeqhRxstbAQ5VPEoNKR+zN0HyCAV04gXURZXwUe3/Wm9UChp25ulQ+6lVD4t+sOud+Y3KaAn0hvMDeS97Bz1Qy1dChcWXCGenXbn3NgE5CZGrhslwizZ3Vjlyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CsiyItoE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CsiyItoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758796288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fQAAEa0IEdGGZklTEH1aa3BIFmCLu/CkQamKj+rGm1g=;
	b=CsiyItoEUbzA/bQtZfvzedZZz1TdD1F4XaLaWIBDUxczPrkhLkRERZpOzvauNCoqlRRa74
	txyiPfKxvUeSPgBedjFvLYcl0gmIFCRazmoFT++X6FGlDys78tz1rvW3x/wr9m1PSfQTbL
	36K95ehm20DN3rb85VpwNrnA10Su9ao=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-4M48lsFtOfCesWl93sNO6Q-1; Thu, 25 Sep 2025 06:31:27 -0400
X-MC-Unique: 4M48lsFtOfCesWl93sNO6Q-1
X-Mimecast-MFC-AGG-ID: 4M48lsFtOfCesWl93sNO6Q_1758796286
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dbd8484abbso3066881cf.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 03:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796286; x=1759401086;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQAAEa0IEdGGZklTEH1aa3BIFmCLu/CkQamKj+rGm1g=;
        b=I/T8xbcfRq6pY/1feO/GfA9tIn2fjIQ5Zx3qYID1HtRIlwPP7hTIEUgMgu4gR53ysi
         TGOplrDt14+FkIlwsUxdFx/M1o4Dc6iuB+Ml3IrN20bUP+6OlLgfDBosbpghpGFDfJlQ
         9c/AWFUlKKDabotE2IpkBF/rk0E0W+Nf43ZuFrdZkuunkBQUe05SIO9Ef6Gi9JgL3Edy
         567ikF33LRYyPHQuff6ye+JkXZ6mN4OVsQ5CkRv9JruXCVPi7IDP2zOvKiPmZqZC+/fN
         3HkqUFHKaax7lcNReSXpbmLlugamjgm9VM5MgXDne2kASJkoQ/8IZ0RFwwqybxgL4gor
         7/fA==
X-Forwarded-Encrypted: i=1; AJvYcCXAT0+U78wuS4wZIkR2P92KEO1QBikPJcQqsNc6Lx9fLhwDxOaJvWS51inGCpH8hrmTzl1ZgB+f50Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YztGzT2Veou7vFHaNuMd3T1yt+yGqYaqjBQjFdv1TjPf+s3C4yT
	Ax0DdrA9N6f7EN8oCQquLp3FK8zxkmngUqXS0GUTQaHReo8xxRzaWNF6IUBYmf3K4nyc7C2ziDW
	LHHXbjdkF0gdEJdvKzbOXeS3DdUuyHLp1XKWRm1vgX4TUL/+5rEnGbu5lyv1byg==
X-Gm-Gg: ASbGncuTpkgMyep79Ivqww8x+KsKSS44Vy/cOktuDvi76pao7p8rUYP/rmvZNVKo2ds
	V13j3QuuDWah84niH8smUYPJTfrNJIouwEHQwzvaDWoxaJZ56BzDfiwxcmVc09Ros+Le2I0Rsur
	jt8k75iOVSK4CgjNikUQocRtzq6oNOLjDoUDJHqKteVXnUo3l1EabusWQnFNU+vhimCHfn6Ur7z
	8qN/j7jaNzxd6BZjVdb0PcI8hMDN+CWnE2cpr5NFrlsWHjYlNX2/ZfCwLyxbZ/AlrWr95M2gGgt
	RDgId2DmPMYMv9lweCgOmtzt84a4pA1ZQBt4S0OAqQ5iuWSXjt9KDAref2Oecjj2Unq2X7IRSWh
	W13adzgEZgNG9pHgWkQzW/hBDXLTbgAI=
X-Received: by 2002:ac8:5987:0:b0:4ce:497b:73c5 with SMTP id d75a77b69052e-4da488a66eamr33623221cf.32.1758796286451;
        Thu, 25 Sep 2025 03:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdd4mLS42QGKg3aD+HeSL+9y036a9Bge78MNLawf+XLw4VnS4GelLpXVjg/ksNKMa8zAcU+w==
X-Received: by 2002:ac8:5987:0:b0:4ce:497b:73c5 with SMTP id d75a77b69052e-4da488a66eamr33622951cf.32.1758796286037;
        Thu, 25 Sep 2025 03:31:26 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c34ac3a81sm86618585a.67.2025.09.25.03.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:31:25 -0700 (PDT)
Date: Thu, 25 Sep 2025 06:31:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <aNUZ-9wJkhsJXi_n@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Sep 23, 2025 at 10:39:19AM -0400, Brian Masney wrote:
> I marked this as a RFC since Stephen asked me in a video call to not
> add a new member to struct clk_core, however I don't see how to do this
> any other way.

Correction: Stephen asked me to not add a new member to struct clk_ops.

Brian

