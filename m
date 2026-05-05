Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628A14657E3
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 13:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986674; cv=none; b=hqR9uL13ZJKgMTJeYSXaPvjGQ3rTPG6cETRzRgdgxJuhnbclkdEBgxgjeuU1jkvfFJLq5bZI15p8GLlM4W6vMCEY7+uK5vruYBMOAitSJnVSlwTshKEN5eTmR3Rl+N/E/VT1kq823aVV+/fFOETbHbgtNert+PzHfT8BWNnIIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986674; c=relaxed/simple;
	bh=aDkjiAgjC1tB06M+E3a8vQxAEb7sGjtBon/0/A7o9Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZNmUlbVO/I9DkWhPpQ4GpfQ1GAQPnt22UJQ/0/rQLjZc6NBAxBSR7Ct1FT1bda7pxdMWKd22jXid2KnX+XipBhH6Es18OqR35mfqE4WgzZYuBi93AcCApIgf0PXby2v/PVuQplNl9HHYNz8ShnszWvNuS3U/r+B4I8QuQ1LN/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iR7qgDC4; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iR7qgDC4"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so3346777eec.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986672; x=1778591472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3ALUZ/czN6amkQ30G5HPUMrNnDCq1VL6As5DCz6Ts4=;
        b=iR7qgDC4As0YjylGJt5kxXm0LH0LUiXWjADZyu98af/bmk3qytI07xLj0iu3ftWSjf
         ubWSijbklrOAXGgCHuctI/n7+IqcPAo+hdCqoQ4QNYeCZfzPpNi5m2Idr+wPhGsTbCch
         dF48BlF7k7LPIRoBm+ZK5vssk9efoifamXkWrUmUcGo5fK9DYFP4wv2ekh3WGoti6NVL
         HExZTy2CtaYHExSXmdRYql0HDMnUm0uY2lo1rt245HHFbb4hZ5QsfvQMHGOdP73o+8Ep
         AWYG8yrq/mwBL4DKg56AOUiX3DO1mqm3OS1I/H8iFtLrWI1yNheQTBq1uEO8ZMwdPWB/
         baZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986672; x=1778591472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e3ALUZ/czN6amkQ30G5HPUMrNnDCq1VL6As5DCz6Ts4=;
        b=fK5S4Fogz/zb3+PXwcg6j8wO/d64qXROamVHm9TYtRLxRBhYnmAVtswx1j+elEP78Q
         qEiwDvq+HkmsyC9rrTJ4cSK3ugL6vkb4ZWNQKsQpWogmlXMPby20VNmiO/o9TXHMDKn5
         NhdwB/sIkWWSgkRbsZL10KVX0P0T7qf+bDAEaDgCyOiS+fgxeiCqLRsuJTCZAcIdURjQ
         NJrxCPf8gvII9BDeNYtDTqpXd2yo0UFEuSVWVQZpsTL0uEgor/J/YEwBd/31i2QuMqhN
         vDOVTBiqYVjgvEqoDS2YY7EP6RIMDhBwa7jWpWOpYa13N6I9XmjBCrBnZLk9xpdzD6Sb
         t3Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/N02Z/lpeALys18zuZvtljloTDNhTE1pG3zwY8kA4Tu0VmDmkeuoQk+6gg9JHNgv2ojpOCexM8K5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxufBLhVrBEYOWRA8xT//sCMhqBhzske3CivhI7WsxE0861b8MZ
	OvEtgB9+rT4qHORkTCDUOAsDk0avGDtroSMtQKwnMTquPHbZxYSYk9en
X-Gm-Gg: AeBDievpwuG7wnhbImI+UdmA8X2MlN3BVMh7JzPxhI5YvacO1Gh2tMWSAZsOn2i9dl1
	jn20hUOJc5SOpohaSYK9epnD5qOjtgQ5sRj/19RuRjwcii1unpT5RO0Cuqxa1Qk0mLJEIXyiyo2
	acRF+C4jVGjxw5Klp4uCLewtHO8D/+s+gFbDAaMOtFP6xOI1JBLeM2Hh7gwNIHznXrDY8P0g281
	gTb27PY/CHmnCnBHpWUYvYV80BH+9Y08a5kKj1fNRGIgJFhBqE04SBgUeSLRJZiL8ZKNxfWN1vT
	AHF5/DLIsDQM94gW29HvT7Ua0vyqKCXivQR0wGaTqM1FdEO72BqZ6rsjynhyWFubFRc2VWpa7JB
	I6QWm5hGwOOA1zxLILJDGcNL2ihRfLANuKmfG1eKe6LGatl+w+rEqzOFUURRwF2CpkR2GIWDFwH
	nsMKAlaL03V7eGoTEB+HV+r5p3T6ciV7uPKR9u2lD4xvxZ4iQ=
X-Received: by 2002:a05:7300:6c9e:b0:2ed:e15:c923 with SMTP id 5a478bee46e88-2f409e9a9e8mr1339042eec.31.1777986672291;
        Tue, 05 May 2026 06:11:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d611sm26652407eec.1.2026.05.05.06.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:11:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:11:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Philipp Hahn <p.hahn@avm.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Hahn <phahn-oss@avm.de>, linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] watchdog: Separate kind of documentation
Message-ID: <5236855c-2142-470c-b112-4d12e58727e1@roeck-us.net>
References: <cover.1777972790.git.phahn-oss@avm.de>
 <7d1b722205bab83603832e66750f7b5f1f73eaa5.1777972790.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d1b722205bab83603832e66750f7b5f1f73eaa5.1777972790.git.phahn-oss@avm.de>

On Tue, May 05, 2026 at 11:26:15AM +0200, Philipp Hahn wrote:
> From: Philipp Hahn <phahn-oss@avm.de>
> 
> Currently there are several (sub-)documents for "Generic kernel
> infrastructure API" and several "driver specific" documents. Put each
> one into its own sub-section.
> 
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Applied to my watchdog-next branch

Thanks,
Guenter
