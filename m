Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADE13A7F50
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 20:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766586; cv=none; b=Xg5UNQR0pJrIgh789NTgXfNAA+hzIUZr8wrwkQ9TKGbs29jf2SG3x6Kah1KF7Wu2m/lIN7/ZMXAGovc8nX+GMXN7sFfIx69Vurz2f7kxvWrvRiJ05oDlTdC9EVAN2ZSMxHYCzK8BOZ0hHc73hZ/LporIFlYHCkhcaH26yl6uJ4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766586; c=relaxed/simple;
	bh=hOjA7jyxnCOr2nR/iV5EM553jiCr0R6uUQ7dUhFldgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpYR55zKUeULjW1LH837Y06issrcDpqgARNZbJtzK/cqJuCOB7VyUSQ08LOu2Ins3jeUz4DxARz9blUDlJEWy3v/6RKzGDVL6fJnOIuUUkWAK2s8fcToutfJIydzN2vPhSmeaQm1GfrEWMMra3y10f6CPx4WLrSiKn85RE1rBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCyy0+Ek; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCyy0+Ek"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-13b2b08a553so264493c88.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 13:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782766582; x=1783371382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUIpMiKwcHQA8nQw5M6D2Ujl90hrTvX4L+5YziVwAGA=;
        b=tCyy0+EkYc4eYY1TlhVukkRRUYhzDE6rf0LeSGOStApRRiChrbISOIM7LY/8yh0c7C
         0v/th3IJXs1ovn+OuYJjUCKmOGJzKXpyndQzFMd0K8ukdCJ+41em1RxZFd2OZiJQvjtA
         mZXrh22ZX78xgnKMjoeOyNdsxTUy+nRZuk+jOMFF8IowbpwEr6lC/kpKcCuPL6Q05MoE
         dAK3fA6pZakp0C7zx4176ISguU1WhAPneVCSpz8tO0rzPGfjtgXtTsSG6IQAHuZL2h7K
         vGxwgMqxs/uWVYQw7kUOPkwawM8aPgNe4RLXvVhmROt10mK9+0xBDgAq1S1n3WDd4B3U
         CEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782766582; x=1783371382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUIpMiKwcHQA8nQw5M6D2Ujl90hrTvX4L+5YziVwAGA=;
        b=iXy+oqgWEiQfNe2kXShSnUccAW+eqBP66rCNgmRlhRkILxSCes0pmH5s3hod453HGh
         9TWcOxG9YnPbmzp4E1M3/9+pLHwWUtoZvhNMeLP+MHy6TxrVWbzlzRdaWfIHbgWfgd4E
         Jjb8/196czm7ta6DbYbuzG45n4YS2kf5lOqQOByN+nBAAnO89Evs/G2hFr5wAGtezXz4
         7Skm7mr10PQ29v05Qpsgddia4KrovSTACHRmCosXN4ZcsaG/mWg31Lbu4AbsjOXBnAOv
         Kg3am382fmWVWCvw2Q58LMwe76Z9csMNpvnUCdIEHKKbHc3ZElcq2AP6Qn+D3ylsx75d
         tnpQ==
X-Forwarded-Encrypted: i=1; AHgh+RogMfBYkgA0b5DOh/BvolKM9Q01BrxfnNNtDVDb83+B5mdPX+tbZh5Mi2RFrls1yjBmOuxaTite+c4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO5tXMgVLfJxgvBou5TP57RdnKSihBhFVRw7bRFU/E4PKsy7/G
	YzdjVTy47bpW0aXjPCXAbd+gjVx4/qck0PS9BwrduyjKW1Sc7Zx7UmLE
X-Gm-Gg: AfdE7cm5SR9dtIEspYZS9iv7CB7xXa4UjRd3ztNwIwUHNIGNzMcjDPR/cgYoXyZx5cg
	gbajY9uhdCSIikJbek+zfIKXj57azsIdMOVkaBobHwEQFdYixZKGzFte5Cn8S6f8qzEFWhKQ2DF
	hJCda3I3jJIZgquuL4AIJRJ1Ib+hjui4Q10mDvZ+nizHJphX/6E6baHUINXFvE9JUg/1laTkWkV
	9wyS20k2Q5/V4rz/rAX3O3iFPDJrq/de69q0L4wriRS/RvEDRxHpNg1r56rlMJq3GkaLb8o8dVu
	8aecqdk3+pgOFgPpxBgHCb/7iuJ00I8sTp0zGLctvx9eDDvC7y0Ysr+XCuZJ+tSFrUfF3Y8TLzV
	jxspE4QUV4Nfqi7zuhRZxaPdhPPS0wOqMiqajbAVcffk3heI103ooAJ0+2RhcIR7FwdXjAYS+Y3
	va+vWygrzZ195VCtqgHMngqHzBLQ==
X-Received: by 2002:a05:693c:25c1:b0:30c:ab97:d7ac with SMTP id 5a478bee46e88-30ee13e74a1mr681617eec.38.1782766581779;
        Mon, 29 Jun 2026 13:56:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm1083869eec.15.2026.06.29.13.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:56:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:56:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wensheng Wang <wenswang@yeah.net>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Robert Coulson <robert.coulson@ericsson.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 8/9] doc: adm1275: Add ROHM BD12790
Message-ID: <819714dc-0193-4667-9885-67f30b4b0bff@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bafcfe37190b5a3925e8dcfa3b59f8d240234ba.1782458224.git.mazziesaccount@gmail.com>

On Fri, Jun 26, 2026 at 10:25:33AM +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add the ROHM BD12790 to the list of the ICs supported by the adm1275
> driver.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Applied.

Thanks,
Guenter
