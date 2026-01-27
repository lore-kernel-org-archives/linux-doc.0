Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E1366826
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769541126; cv=none; b=ur9wfRtYQgxQQum+GUd8yre6uoYicyqRh7zpeS0aiVGcAAmZ5ujzEu8m0Zi+9qAljS2N++/Vd5EcvQumbSeM5yBUzdLDYehhp0m6aWi/lQLt5itM5Z/hsEh+vTBFD6W9T0/xbjbdelrITjJ3ot7fFw5Ky+pVvI7zYb3NNSWzb+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769541126; c=relaxed/simple;
	bh=XwkACK+iKw7oI/5o/Gv8sfELgLAgj1JR8qRdX4LMvYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFY4WPXR8udEBVUqAZCQ7y7kTi9UCWZPSt1ZX3J5bLUa2KV1ONC9BDwnJcxXF3JPhXSiUzZTVhPbobY733tEQlFZE9IyghzkI6JnFoIHQpWqh9578JXB4hYnFgmoS+khFNNVwwfU9DybgkUdusAjAwkvntS1jcBocfVhHGs4Ylo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCMr9i09; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCMr9i09"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45c715116dbso3970888b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 11:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541119; x=1770145919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZfqLGIvRpFE/gnKzE3sUmBILX80gzyy9OqTW4jmzZU=;
        b=WCMr9i09ggZMRal/3mNs2uXPZHE6g/OHCNOXiuG/1jIjblcMJqQiyjgg2Uz4SWPBTp
         PiUPPmCSDv7lXkmpollwjJD+dhUj1Q6KVxqqcRoQyjBgmtLw+XHbpsIBNsOCPzN0kOzI
         purzzQK2NMIsKmuehL3gY/asV2h+BewhCfh253FZLSKYjPfeu46WAHwElK9dYfnk/7KB
         QyU5KOfFqH5BUyrtBhuETMuT13NHXGt+hrjeBZJURSNDDxHsxIq1gKHl79Nd+6A1QA42
         Nj2k+8CF5WaCgx5KOlJnMBw4S9rGzVU7pr0QMBVh0bpBZhNVLYsYKqDahTwEEmJwlgdk
         ULFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541119; x=1770145919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ZfqLGIvRpFE/gnKzE3sUmBILX80gzyy9OqTW4jmzZU=;
        b=TlXINZPywlYplly/RPQapHxgRmKSkSvftgIKFmE/Wr1Bku/Ih0BnAdtpaiQGbbkWhN
         OGZaEyUKNXgCrUevxvUDU0jWl/iHBeMsP7wd64VbOXTPICacAtM39H83FfbJ9ZcDPzia
         +kx8wf6acri+tLnUoc0mLHtWzTz5qIHNrp3ujVlu9f4kAIr1gqrF2fztU2l08h6p4/Lm
         uktOrFzd/hY7jn+/UO9YZfM99VNipVdhPFH2W534rBMIP+bmi46XQpZwUZHgEt5MVfjy
         pCkqTvkTUcSxUIYZiEIBNJ1fFOoechi/AX6mItjJ2zdi/lIGcfk3aawj3JBqSxlbigfI
         Eyug==
X-Forwarded-Encrypted: i=1; AJvYcCWr/zg52NV0TzsW/9TI7BVbg+s+TvcGweNaJGR3+32fSKMWxLWbyUiQPW0EJ5tUJtJKKuUANzGfeq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKYW4CW5XejPUSxj0wyk/nLhffcZLxcO3redR2oC8ZtXO8D0vE
	exx/qRnDaBqUq83VJCqvsr1/m6SgU33xJBOtSNxOvSOCRllYiUSEbLco2DbibK2y
X-Gm-Gg: AZuq6aJJ+FbbnIwSjRSNfH6ot8ws59nG1XAQjPH2z4JwJ7C2Cj7GnodcG3OQzjrkxAD
	yrlPPtJxkWKPlWUCjSzcRa2ti+nu9HTKiYYT3Zg4yE+GxuegXY9lJ+CuXHOXNn2lMoVFpywVpUu
	6cIVlaspUUlVgTkVAnHmnJhXOogy+i/ct5p7gC7BXhwQFvPsa0ay2nhIwc7boCHmE7pqxVhNtsI
	M0HRO+/DKZZy/tnGoupn9CK2fHhhpPaqigvmsPerHNbduhUm8L7fchyoeCd4DQMdNpEE26l0PeH
	9zxqMFyqvsX0VxZvZaOlaksfxxE/br2FatQ/1VKDqWxuuNjjU2shLh78/ttNZaUEGCkuGS2LHHP
	2UK02metQ1lHGMX96JyhTZ8aLaI9RGlpj+4KT6SYv7oKPX0cEhE82euKBXJldb+XhP+Mo1ztV0T
	w9ENSqpZgDCVsndAconipHlUbg
X-Received: by 2002:a05:7300:2382:b0:2b0:4f34:eed6 with SMTP id 5a478bee46e88-2b78d9d75acmr1505750eec.26.1769533958980;
        Tue, 27 Jan 2026 09:12:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79c3aa364sm33692eec.11.2026.01.27.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:12:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 09:12:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Almog Ben Shaul <almogbs@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	itamark@amazon.com, talel@amazon.com, farbere@amazon.com,
	ayalstei@amazon.com, dwmw@amazon.com
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add jedec,pmic50x0
Message-ID: <13b492a0-db2e-4e44-b145-cf99f1975fd8@roeck-us.net>
References: <20260121151947.37719-1-almogbs@amazon.com>
 <20260121151947.37719-2-almogbs@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121151947.37719-2-almogbs@amazon.com>

On Wed, Jan 21, 2026 at 03:19:46PM +0000, Almog Ben Shaul wrote:
> Add devicetree binding for JEDEC PMIC50x0 compliant I2C DDR5 PMICs.
> https://www.jedec.org/standards-documents/docs/jesd301-1a03
> 
> Signed-off-by: Almog Ben Shaul <almogbs@amazon.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index d0f7dbf15d6f..fb16bd91c76c 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -171,6 +171,8 @@ properties:
>            - isil,isl76682
>              # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
>            - jedec,spd5118
> +            # JEDEC PMIC50X0 DDR5 Power Management ICs
> +          - jedec,pmic50x0

This should probably refer to the standard (JEDEC JESD301). Also, I am not
sure if pmic50x0 is appropriate, since the standard refers to pmic5000 and
pmic5010, but does not cover pmic50[2-9]0.

Guenter

>              # Linear Technology LTC2488
>            - lineartechnology,ltc2488
>              # 5 Bit Programmable, Pulse-Width Modulator
