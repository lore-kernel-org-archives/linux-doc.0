Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DE42556E
	for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791761; cv=none; b=QY4spq9tJB/PnDf1wN5W645us1nxLNvAyW1U29p1nqpCaFD6YdRiDr2m5u7fzDGQsVEEScejUz/nIsLQw7i3NM65AX6q8kYWIorAfCVuTzVs/d5TnyRn/zTaTHWLekEh0A844biOzSGRpTtOsy0vZZWyzPa1q4wP/yNuj2Hi5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791761; c=relaxed/simple;
	bh=4MTBUHheRoqjhOd7BBqxKj4o02h2M7yKv1+pjK7zjNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsocve03ANnR8qQzmZFR8Xxvdp0V3CJ6fUKVXsvRCbD0/lTP/9kn1ROQDWIKAp8FAGYYMJpCMvAZzs8JTpg77dQvzg28Aw/tRKVjwBYAG4OWNyPAnMvtIw5B7bFMV4aYkp+fffW8UqYvMgMuryw/Tp+rvCVuULgiI4Wmn1fQSus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDKbV9bK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDKbV9bK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2907948c1d2so30971535ad.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791759; x=1761396559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNAClAvOnKjWB7HSzhh0yIx7GLLOVFoEN9nJoFbnxAc=;
        b=IDKbV9bKO+f04b0GOzAeXWpCiGQBfkLUB8Hqb8eG3fFSVZev9NVYb7bHrYIYfajgzW
         RZjapFS3TVokfOPaaW7bVxMucyiyRpENAgVGFHdxjx53fM/H5dZ0JStAlvqIA5vWF9oD
         HDK4pohPAQ4SGSDUOcndlLvcopheovBSnteYuQl7+tuVDMZ5czlr/YHpze0yzeDTCykn
         lTxeTktgFtp/bNVKehYMCcmZPMHWfxPmPgwuQaCrwBePoOE1MzgXBpIRB1OVjY6Br8vg
         tzAw6I5Z7cXdqjOmUY7PBdUs55rVo+xGSmnYObz1f3r4DbYA6ICn9vf/lCNgUBeZBt0q
         gjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791759; x=1761396559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNAClAvOnKjWB7HSzhh0yIx7GLLOVFoEN9nJoFbnxAc=;
        b=Kc3lyLOFj+fF9RpfyFOhmLvb4zNWZ1zfBTxA1aJuP07he6P7TOmu/2S6qTNVglFXRO
         H3jAcE1MHtMnkMw8WUENn2SC9iT/Xq8OHg1UpUjXqlNboRqYmkjN1CgAI1WMbyZ+oEoA
         I6ceKPB9KEL5hc7NS3Nz57TerigIiX+bV9Ab03LewDcm/HAVGGI5klWcKw+WmGlv5eiW
         0kyvuw5U5Nxna9OfIY/VANOgKp+aa3U4ggE5gl51X5Cp/QA+nP2YUWnmaASUU3bLOWFh
         gLqNgSZT63qCa1JAFjycELmMPE7rQ+ITEO5RLQB1/Ol/tfPQHCRbISA7y9oIe8pnEVpl
         eTyw==
X-Forwarded-Encrypted: i=1; AJvYcCXqR8X8kvfXpNXD4cc3sb4DT7vzdUCFnKJxY12U2Kfn+wHeOMeGnnP6xas07EJd2YQINCbfZRWDK44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl+kTuRMRXTjOp8N9eHK+1aTsJLm4/ogqiKvSAIuVepHr9RVD+
	Z4vUioiBrcl2eIahHUbZavxxQamBFG+DCkKeZxOcEiE8w3a+J0jpeKcu
X-Gm-Gg: ASbGncsThsMdiIUi67gkWFklag9f/7Tb41Whd6b7xedp6V/fODN3/hbKT0phqtX9MNX
	F3YUErbwBiG0E6FapdGu7pFy/acMM/hPc9FZHYuxlFLDuDH8L/eDZMk9dGmhL3n3xuJxvA6Lxlm
	PNF3FTbdbwyYY0utnhVSEi31T4ZNVqBvJZw+3jEkZDl5WUVE1v2caiErTGcqgWawWbigeuAXGXu
	Q93OVxyUhDdMGQ3mmEHPFnPNlUA7ET2Ihl8BcPrQZipImBDCz5K3Qns/+MSP4Kx9gXYisZNXvwt
	kU1d8pTNLOBcIrhR0K+P3bWh2kgmCacG2uAA+keTCQyZ8TXs38DSxi9r31VH0JqXw4JxMkMhvjl
	4ujWSlnwkKbY88INFNbRtcWXEKMWXqtRSh9TH4ICldaCWSspL1meTNEtCrj4A+p/HBUYWIusXrP
	pbX4t1aVmDb9SH5GORpIJBZMg=
X-Google-Smtp-Source: AGHT+IGwvhlN1brRCS1BniG2CAvahGot/00JMhfB9nXhMtLgvouUhBqkuQKg7h/T0YyFAsClGr+64A==
X-Received: by 2002:a17:902:f551:b0:290:dc5d:c0d0 with SMTP id d9443c01a7336-290dc5dc3d6mr85320885ad.49.1760791758880;
        Sat, 18 Oct 2025 05:49:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df5c142sm2564379a91.14.2025.10.18.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:49:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:49:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	khalid@kernel.org, david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 1/3] Fix broken maxim-ic.com links to analog.com
Message-ID: <4cf1dfdd-6df1-43e8-a396-eb705e46aae7@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017154755.32105-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017154755.32105-1-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 09:17:47PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Broken redirects fixed to their proper analog.com links.
> Fixes warnings in 'make linkcheckdocs'.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
