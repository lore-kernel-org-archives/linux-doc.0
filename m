Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27047CC73
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987580; cv=none; b=RvPUh/RF3GVEiQBSf8OoIdOQSW5vtRujw/1HQtrO98FB4aM7dNT8QQomkHzU1jUSp9+5oNc0CoOA5ZTzEtUhhsCu8OOxZMMeP6O5xwSgqZD3PLk9EIgSXHveMvjWxyAk4DTcVu1uELk8eVN/p4R7OfyLY74GV2s7b5XzZNT/Ef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987580; c=relaxed/simple;
	bh=ZZwNq+wr7LXkUoAz46IsntNYNE3ueRkej0LZKGGZ5Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXuoiLA+EjF1UlUTWvojoI5GGK0jBxiHRpKDrCRup6S4IYFuqyBIV+gprlugJrAOOzF6v1nweSI8HxpNlNHx0+5myHlXvXReXUdF0RN56OBbTMfNK1ATJ+uzWQlp2tuMDmeweQwGk/iA2QrYKE6GYyhzykYsbfaInbNz18aHIBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAd6OBK5; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAd6OBK5"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1309f4ee97fso1845868c88.1
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987578; x=1778592378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWP1Ul2I7IaqBuvNIePLmtG+c9HtWNTN6BXKfRyYleo=;
        b=sAd6OBK5To9RiPzh2WCzCtx7BCm/5C+ZcRAItgj1QILHuQ7RmjW1w8QXYW/8okWX9t
         HeyyBBZ5Ajrnn7lOCqzd/4E89MvOitHVohyqCCQ23PRmpzbA6qMIoWInRorl3z9S04A8
         nXcfDdUeBkMxAMv16vUAB2QVN8HFXATYEoIKJWx2tipsVXCD3Ue8dZE2LVqlNYQKUel0
         fhj1aF9VZAvk0EeV8Gco+GmqH1SRXhpYpewnk54bMUiQA1ytQepzvU7+a6U9bQsCU6qa
         IWPa8YbsV2Sq8ZblwH/mD+85Oa+40LGjp1l6fZk42nZ511FUODJE1eLjk9Yk3GYmEI/n
         9PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987579; x=1778592379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oWP1Ul2I7IaqBuvNIePLmtG+c9HtWNTN6BXKfRyYleo=;
        b=OOrEi9167SZCrb2JtqdIlz84rxlbNf3DqiAXj8C4r7Y5PjutgTMUywryg9R9N9PNIJ
         1FuRRVO9Syh8CfDrHclYPXp4reZabDNA5zAjgO58jAOR9G81b180ap1srE3FHHfM3NHW
         NaRmJjPVzjxRYu/IZcWcNzpkAx28esz8r9sqXNZikPDytxzp+3Nc6awcSP8tXrMlOoYh
         7PRYyP/cxxyyl5pXEJoBv+p6lMELWH1+iqCJu8TNsO+c2EOHUDI8HipqAo3C/eoG5juA
         hZRSIeieGv95yNFnHuGi0jY5CbRrZU3DO3uREUgEzCWdHnQpRDm8ecwHumQAvSiHssa8
         WeGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hwO00m6xunHSNrM0SCoolGzl8OefKEwDv10DicSauYw2g3CHmUrfAmyGNCo5RW1Y6NcxAY1qdeCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/QA+ArEgyC/f4GQ/1YZ3bvsasL4qe0fOk47dHIBqDDAnta9TY
	0wlu0VOBFdPzH96j7HLZ8yIayKk1E4+m+UjMACtO7Z1W6zL6FKmYKrV6
X-Gm-Gg: AeBDiesVxdhPRYjhGCmkeXrDGx86pQMp+xHFkNibB1j3G9wWm38oiruVGPh97QvuSFQ
	QizolLN6eT3u/a+AyDBkxpWysfElKlK0rp1ikU22r8rxnz2YwVRuvFlACZXGMBAutjwlgmTBrZC
	okVMzjxSs54O5lwNWnFKjAeCv7S/KqIPVyM6B6qdR+vVxSfeTI8GGWs2UopbsQcXmQ4JFBVOLBe
	GIA37UrcF8OPj9NIKnAb7Lc6jXMEufSBq8WVrVpL+fjTfqt+Zt23hiAtR0T9EO8blaOQjUpKA8c
	i/EOiq6KcHN7l7wrkpPbsRwVW2W9h+w8GK7NmA8wpf61UpwLtCspRNmSWb3JxCzSs+2kJOsFnTu
	w/3BXTwyNppC9dsd/l8AWiR/dLIPYI96Mi2smd7vyvJJQd1Wx5dAVyU2+F7UBrancTeeQ+cCUym
	IuPBaP2sXZ8p1/HsRHlqUy7/LMW5K9uYH5bsdehA4V/XBV7BU=
X-Received: by 2002:a05:7022:224:b0:119:e56b:98a4 with SMTP id a92af1059eb24-12dfd7ba4cfmr6710036c88.11.1777987578502;
        Tue, 05 May 2026 06:26:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8452edesm21207224c88.14.2026.05.05.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:26:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:26:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: add max20830
Message-ID: <0b4f90cd-e6e4-49bb-ab23-04bd8d8cbdd4@roeck-us.net>
References: <20260505-dev_max20830-v4-0-4343dcbfd7d7@analog.com>
 <20260505-dev_max20830-v4-1-4343dcbfd7d7@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-dev_max20830-v4-1-4343dcbfd7d7@analog.com>

On Tue, May 05, 2026 at 05:25:05PM +0800, Alexis Czezar Torreno wrote:
> Add device tree documentation for MAX20830 step-down DC-DC switching
> regulator with PMBus interface.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
