Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB78D403E8E
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508316; cv=none; b=oVQkHITcNmDQjdafPAkykuH9dmf8lce2Qe735hveta2n2DOTT7+tUecfiNsKKnt6FbEsobsHw+V1e2dNTr466qy1kgGzEd9XXi5eueB9n4ygC1+atbvtDr0p//CE+HVzOVqz2yhLiEsz7OK7zB8H1wDWR5t5F0xUx+man+60FR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508316; c=relaxed/simple;
	bh=l9fwqzHxeMnBKlvaOPLHoKvNOlfOY6llkdvXG3LCTf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/6OQjS7wUQNHuQDKtqom6dt6dxKJbuylExhA1z/aN18TeSDx29DYtpnEmcEM/HMjkZp/pmxnzzcDC52zOBcOe1dHskMOvXzXcWy5/3Fg6TeIsqe3C/AM/Iq6FQJ29bc5Wiha6Zm7cgG9TU6B5rZs6ACoXu78Kocug9rgBKPb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWA9cIfp; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWA9cIfp"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceb096e675so12209085ad.0
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508313; x=1786113113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCV7rUk4XsmSK/bBAvmYQSxoopJ6iff6FRBs63f8X+o=;
        b=QWA9cIfpnby4d1/84sLFxJK9JV8nt+TRDZomsA7ycxz7l+dpWy3QQT+lvbf56t1z6b
         LAYvy7SGmuA8rYkAarHg4nC5nQBGMZOlvrNlF1ywz6edbiKhSjkEhSrXBmOfWuysu6aM
         dr+UUMi85z208OYSLNN+S/yfWtga+mXw30x7Irnz+mFW+WBfB7ogXsHeFtL5jeONHj0t
         54KZcTvBLxdKo+fUC1DuojcU7/6dTlxNG3IhiIgPm3QTGGNMrJnxTPmZiIPC9Y4zpi2D
         NZf79/UUSdVKIDcW8IFLRZG21KdnBPHs6dLP8wtOq3/DwLvTXQX9+Z4MLQMFretrH6bg
         bhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508313; x=1786113113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCV7rUk4XsmSK/bBAvmYQSxoopJ6iff6FRBs63f8X+o=;
        b=ZhtIlJyIQ4lleqVhDHybPCyGyp/5qMViQKDyxc9R6LU/CuPG4Av/PPPGXUYrhLYEhD
         ANaNYWFqu30D71WzQO8knoiPqvAVuwOz4nkE+OucI+pACVrZjFEMLPxQSQP4ICAij59a
         3YLRmUPf4xNerv8zwD+vdPo9fDgAadjahZBVA7Ysrpsq0OHmQFqfrmlz1+1edz7+s5Aw
         wC50CtAGtJ0lA1Q/swzCBT7PBGgXsuSDYcGCHO6RK+w610CsgkDa37kgJOX9L0BxiK+I
         vup8Gz3T91XpX2U88F+P33V+Vp4Zitzqj/U0eBN4+9oNy+NTXTVjInxIXHSKwsWs5XCT
         aXXw==
X-Forwarded-Encrypted: i=1; AHgh+RpoX4J5ITIsiNOWqaYjlUBA/F4Uh4ShrrZRC2Ed+vLMUmxiTCBO4MKxHwcowAASE+KIh9MgS6rn910=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3IGkGMocxDL+QvFzx+Gyh7BLJe8+KKwzHALufPPGH+UJR2t4r
	NI+hEpS2Frx2HFBIph6A9ieEIrz/bddlQv96Ocbcmf9AaXL/1AazWEJgBXS3uw==
X-Gm-Gg: AR+sD10v4A5WOIcmEEfSyt4vINS0gDReqf4bErtgnKHRh+20+Vj43LUWkY6rJNSwhv7
	+nfIdXnBLrdYuxSdN901tDWMNt3IH4+BNd+QjxxcPR3CmRn9wADCuTA2a5FbNr6ijHDo8Qt2D6n
	ZVQfWDxJ+rb0uGx6cZuvWLcqqp1kNhlqtk001D2Cd9qsKj/Dno2ApwzrDYMbcXQCuzHdYysXpbY
	rLOPPhZCQ7/B6TvR9+RZkKreF94pZWxSxZgf409N8SViADbaX56DLaghCHnnZsI9Dqz/YWU35+h
	OlTEyg4c1ZJmTiEq3qTXUhSVb4TwTkt2u8d7kUuDl+7aXekkm8Bo/hsywF9bMb0D/xCt6BvXb+Q
	Y1GYqSMVr34dYqCDFuqSJz6CBNS7d7jkLPf+9bRqPIoliw1WxJQWilcEXBt71Hu0pmvv7hq2kJZ
	FQ6L70dHwwz1dsGIAFveMGEQwZW/awscAJ6ZA7BE5OHz+qnW1CeRIEIEHUPdSc5pu1TXIk0LQ5C
	w==
X-Received: by 2002:a17:902:e5cd:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2d05229a2a8mr2499625ad.25.1785508312949;
        Fri, 31 Jul 2026 07:31:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb7c3sm6097115ad.54.2026.07.31.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:31:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jul 2026 07:31:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 4/4] hwmon: pmbus: mpq8646: gate the writes
Message-ID: <179a2f2f-b932-4a27-ab6c-cb70f821cdc1@roeck-us.net>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-4-e7c7ad768d5d@free.fr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-mpq8646_v0-v7-4-e7c7ad768d5d@free.fr>

On Thu, Jul 30, 2026 at 05:44:02PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The write cases of debugfs entries are provisioning and bench
> helpers. By designs the MPQ8646 powers the CPU core rail,
> so a wrong write can brown out the board or persist a bad
> setpoint into finite-cycle NVM.
> Said differently: some wrong register writes can and likely
> will physically damage or destroy the chip and/or the board.
> 
> To be safe, it is disabled by default behind a
> CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE and we print an explicit warning
> banner at probe time when they are built in.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
