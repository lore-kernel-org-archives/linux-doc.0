Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0720C33CEA8
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096298; cv=none; b=JroR1szt+gIc5aAU2sFNIm4IF70+CNnYm/+/kAPggCXEHGuVyTCNOoj8uw16xqu0DCkHceJxKFkB6eO8k1BFxw9aw8hEZsUcmAfF2zHVtagKtPFuytIz/NGK7FgOT3vE5vrh47x5w7TkZ5cSF19mBMlio91rR3y+PoutuK+vYuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096298; c=relaxed/simple;
	bh=JvVGIAW5ni3Xc1kJeyoHi4C0Xeo9QBavCmEIrdZjNk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/MNV50aE/x/oYuS9Ppt3Ar390i+PG079VEMT3459rOlaEGA/cVfpOM2sqAoX5Ly/fV8nGvillmVaC8R0K+/dwSTr3O/aCBTSt3nj/PNMWtqL9O2jTzBZw2Y0QGTvPT+TXBamme7FYfWbK2cRFRg2/WryPnBtOzgrP5HkeURA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GULZNdFi; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GULZNdFi"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbedf318752so240429a12.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 16:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096296; x=1787701096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PQRDXp2z74RjQBsbJ19hTerd/5ta04pnNNJl+vajzDE=;
        b=GULZNdFiGSIKs0BywXdM5DR8k686vtGmH/hc1tgAEjr6ICz3GlUG0qaGLoINevP/nV
         g/mhSsCm0mhH79vCd2pwst80XgHohS3kP8BuCl8SwZUnTvwePgkuAWfICWQqk0bGgNTk
         HaYjhXcniDLPTe7Yt0aRQDY2t8g0nm9qebqN38PVFO8ZrJXSbh/znADTK2IwsrvCgzPo
         zslYh4TJU2rMty/AxN1yJbcmg2p9COGIf2kcX7q7pK6DYMS6tkP22Lo1h3IrGb4hasro
         sPfeZ1QZhpl7/Hf+BuyikMUGL/EwywWKUb64hhl7VGiODgLi9q2SOwoEoO4tX8SuUOur
         R0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096296; x=1787701096;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQRDXp2z74RjQBsbJ19hTerd/5ta04pnNNJl+vajzDE=;
        b=YVT6eLWxYvnkkjdKOWyb8Ooi5z8vkpY6DlT+ez+wAd3FMiRwXtM+ryQi6IuCXgApRM
         z/aOR+Gdx1ig6wnRA04n/xTsbqtiAp7CzJxRuJfHJFfAo7Px/dlSPJbYaRPJpvgvnR5W
         gc3pKIwa6SP9rvYbgBC1N18S47JiaScrtEvtATZ2v6RPLQ9nHj4WCX/BRk0EalO7lXvb
         FOZJwbe0FoRBPFvTSg3SiWLq93B/VfRKX0Uvk63Zc7RKq7JmGgIP3V6f0gIy3E3L2Xue
         r4E0SK7u/qnKWJiboq7W8vTEVRpMcQa2y7agAUp1Xvqwt4kjjatSgCrTgQ6eovD7s1an
         K9IA==
X-Forwarded-Encrypted: i=1; AHgh+Rox3OcLGR+TZsySvc3nxFzIxpcmdFqpIQhEH+6OoFwz/CAve3sDvO9NE1N/+Dm1kQ1xJ0WM0MPmrPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc6euMKwaZbsrZDqxVvXSzaWHUnLVxc6s3mCyjX62W0O8xV4w0
	jPYvV62iW5hqF09rufRJ+HvrOvV9Zfr9EPoAEKZ6c9Wo8cB8YlrTZ15T
X-Gm-Gg: AR+sD10jaPLopmh3vw5eQsU9KMXDtr+zuJOaw42ICK8hpM7dLH8y6OKtyPrrro2byot
	qXIqmlVpTtItYHf7Fr3LH/TzhKvjwgysX1fyGlseiwoOu+ibaoHeMPL43+8HaO2/n2j3Ti5dL9c
	qovbNAzs/b5HS0bpiP4Hg3jPwwoz33P3krYXP1SdASkMpEzQGUMJcDnQrhBxrbMOKnq0K/kT7Jt
	9MjLe2CSViJG4zOWHhMbMr5N9FNNn6YGG309nlOFZwU0MLcucgLQLQOxboMHLYJ/lWTLi4V4P8t
	IKmns5+X6+U85gZXWcx4ETFZU2wtX61Szv8mG6Wi4rJaDMFV3hDjO/y60drHnXukRj8/5rYTTvo
	ITrlqyR2ogEQLJCVJLtqERZvchZwvwYNz5mzbYSxCbSXe5iF/i4bopKVDPtG4stkjk30r6nPrLu
	DX00/ljQzhxrjy1jI3BfmswwWBe2Mk6ck1nOoRvDZcvLvNtqUkHUkq/7uMqPWdI88Jl5UTZePlj
	A==
X-Received: by 2002:a05:6a20:72a3:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3cd011a39famr1020421637.16.1787096296030;
        Tue, 18 Aug 2026 16:38:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm522227eec.25.2026.08.18.16.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:38:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:38:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: jbrunet@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Message-ID: <5095200a-51a1-4e68-9e78-36e8165cd29a@roeck-us.net>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-4-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817101455.3526260-4-sbogdanov@baylibre.com>

On Mon, Aug 17, 2026 at 01:14:45PM +0300, Stoyan Bogdanov wrote:
> Extend the existing TPS25990 driver to support the TPS1689 eFuse,
> as both devices share the same command interface and functionality.
> 
> Update the documentation to include TPS1689 support.
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Queued for 7.4.

Thanks,
Guenter
