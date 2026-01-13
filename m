Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD84267B89
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 01:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268862; cv=none; b=QgH0DDw+Phd3b6FMgBpnjHB3H/M5AwSIn3U89KzMmRmN177FXT4CCbB10hJhipm1ivw6elr2Kj2dmffPtj6TOIqin28aloftXpxFeMSf2YphFuys8xOxdtKT8JYCEEqqwzNvVoAdQvR1LLfrNVS04BjGbmHAFMWhD21tp+hTqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268862; c=relaxed/simple;
	bh=ad32iXyTi4EbZ1XO99xfmDWdXhUVYTE5uI1F/YJLopw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJLNIlVEyiFcQXI3pbZPVvIiBhxBs7+FTvroV+kTlaDHBUaKcEMFmmy8lQaLiZ7iMUyrCfk36pKNIVPMKzYgt5HctOZ/FVB9ZGdqjKIDzZp01ZGt/isGd/73Ui90WrVGvQuT41ELsV9oEcCN0Z/uvaz8TPSOyGH99HM24nLIjjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGY93orx; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGY93orx"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5eeaae0289bso3038440137.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 17:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768268856; x=1768873656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/HecYQMpzSx+pKogOGD9AgS/QaSSY95HkqZjIA46rM=;
        b=UGY93orxyww8SaDXOIhFKxUVnOQHhKpOCYsW6KSauR2wX/dGdXmxyZNEmSdvD4054U
         qxJQF+mbklobXr/TJArPwmFZDO1rXPZquOgz/lJ9T3TfCAvKtyfR0eopehhluWFnjzk4
         x4AX4W7/XOEJ8Jz9Ca+BywVfXQBPk/jj4qmK1nQxNpWze8cKa9qJM9zhVyzAA/GN6CGJ
         OKGA8CSAU6H+DsxZ9dCTw3nmGay+qiOgaeW6RsxGxxf+ZcvpUYARMdQrT23ED6IYZ2na
         kYXCXJ6+AG6A71QjGnNfF37CvxMHyhMVz4xJZUZ1c7B8CfU05Cq4DRnZCjqZEYe8nnbz
         +Qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268856; x=1768873656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/HecYQMpzSx+pKogOGD9AgS/QaSSY95HkqZjIA46rM=;
        b=q+L5fKtgqH2eTXd8zZKwY5HLSpNaFNDuqRgm690KtyB4c1Ija/fHIscgz5jSLifVeh
         QSf1O2EP5x29T8BVmxH9iSX5/c8UTxEwXmX19lcKJqXQjlMxomyPyfn43mYRkk0d3n6B
         4DIE30PqRKoYNVxUpD4dZ8ts6bJyFei14x2OXhGCDGQOOoU6DP98x/WzNOCXLmZhvnH1
         NUw6as4bqnI6YsSGyaCGM/owlb6YLPhzJVdVRHN5fIi8KW9OJJ8Oak7Qc0szGpwQ//sb
         EqC60ISfEvVjsFcZoJjA3PHHIT2jm8WlKqBWqorfziXp6yAnlvgKkPL2HBTsQM/7vvL+
         7GpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZpsFtnugLiy5X42ytaHaf7UPJipaOu7lVgJ/ds2HcPn7q70M6Deo84w3Ssvuu6FnZXBBaSiJ9epA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvkVAwgtQcXyBZL+UgRjFldU1VZqHa2Q5tyba76341u5TYHkmE
	7dKZYknGxkXWCZa62XpNVoVgAhWEgRAjsudv0G8qkX/3O49GABFhYpojKUv0IQ==
X-Gm-Gg: AY/fxX4Gdmio68yvaIkYTg8DvvFVetSBuAstp+6vgY0szEZbBmRotS462037Z+irX5f
	UjagSFzCkePFpQcxqw47NEByif9L7XoWZ+/X/s0C2NpoLWgmsqW27C09PaRyQPhJf/doMaVEJw0
	Q/cxOGCtm1OhAG6VwWZpgaya1+Z9bA17CWCshRUxTivN9Wbl36U3HCPIbV+dFboH4zGj04ZeiE/
	DZJ4xBqYnshjDy5z1YpNlJIPQmWUtRrX2/I7xhJjJoAgt8s8I/ZYyOuU3e2T0ytT+O6JEaQWfCf
	NeOV/yi1JAuAlfAdaNPu1EebcepNagvIYh1qmA+O5WC8QDNF/PsVakKd8sPT1K9ly222fGJjK0Q
	IDINzBnwtN5npIuQa8MvFbLU9rfJmktKNI+0WKIqhatD0GR2ZO6nAxYyEK/9VGLQLJHumnXjCWf
	ZQF0GquQAHRM+agDCOV8D79QDc
X-Google-Smtp-Source: AGHT+IGq7SH/P29EOxwJv+i4U56r7yzSOhU39ES1wZYIBI+ODZJsWgoNszRhwOG326pCJxzPcgjgSw==
X-Received: by 2002:a05:693c:4151:10b0:2a4:8576:abf5 with SMTP id 5a478bee46e88-2b17d2b0af0mr12747919eec.23.1768262565381;
        Mon, 12 Jan 2026 16:02:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b0b2bsm16475727eec.23.2026.01.12.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:02:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 16:02:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	kylon <3252255+kylon@users.noreply.github.com>
Subject: Re: [PATCH] hwmon: (gpd-fan) add support for Micro PC 2
Message-ID: <2892cfa4-f033-41b3-bc8d-b849dcbd1a07@roeck-us.net>
References: <20251222-mpc2-v1-1-695d8d351cc1@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-mpc2-v1-1-695d8d351cc1@uniontech.com>

On Mon, Dec 22, 2025 at 06:51:39PM +0800, Cryolitia PukNgae wrote:
> From: Cryolitia PukNgae <cryolitia@uniontech.com>
> 
> GPD Micro PC 2 is a mobile productivity device with 7-inch screen and
> abundant ports.[1]
> 
> Link: https://www.gpd.hk/gpdmicropc2345345345 #1
> Co-developed-by: kylon <3252255+kylon@users.noreply.github.com>
> Signed-off-by: kylon <3252255+kylon@users.noreply.github.com>
> Tested-by: kylon <3252255+kylon@users.noreply.github.com>
> Link: https://github.com/Cryolitia/gpd-fan-driver/pull/23
> Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
> ---

Applied.

Thanks,
Guenter
