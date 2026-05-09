Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8A12580E1
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778341104; cv=none; b=p/1rTHManQE1YG4QLbsqCwqhhTSuaKfv3s/rONzND5q07WLA1iEtHk/i9yxH4HZcOQ7We4PLCXtCpshWDYSdWKShVPHMs7HXsnwr5v+FOKTxkfN/yzqoyIg3x9Tm8ofyunjekuUmoRUc7c8TKFay85t15HrVMw+rdhV4Ul/qnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778341104; c=relaxed/simple;
	bh=gLKSdOShGg2uo9akYAxRNmgFpbWG+H/A9yxY41Cj1Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhB6wAktEI6IgVyTiiY27VmE5vPDXmS0rbnH5tvPGnUFC2InZ/iSVCQEQJfUW1AD+HQS1WQVuVxtnGngnot4H9dvMK+LX5T6OaUGWdlqwxt10MWovdi74I9YeTuYR5Q5vvWoOYcqkYejudUbNkVepydg8FN5GwzTpJaN9Vw/Iic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzYYw0tm; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzYYw0tm"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-132830d8281so3478985c88.1
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778341101; x=1778945901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjmP2EjAZo0hE7GjYBWYjrfK9ueJxklnVjumEmxItLM=;
        b=NzYYw0tmj8AKhcs2nzO4Q8L54dGP9P4u4luMqhJ6ROPPv2HllgtB05ILwNRiqHaMBO
         yJ2miicFqOHtg99vsrYQiTHcKnKTIJ5KGEtlQBm+IDOjb+/6fpNfoFE7Qe1nYcNTWaw4
         vEyT0r7q7V3fHFeBKT8ZA028cy/zse8N+islCm15CiWniqSuNnHiN9zLNyy0OpCbuG+Q
         7v8nv/XTTnUnrwwA0D7ipwF6R51EvbrnP78JwFGDQ1YgsRplf4c+/jnkGMioUPNPJEWc
         rMgY3Q4CcP1ogpAq6AVpN9yUK59jDz3x4XLpdc4QB5LoMoELX1ZUEvrYcJcti3RBQM2H
         /2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778341101; x=1778945901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KjmP2EjAZo0hE7GjYBWYjrfK9ueJxklnVjumEmxItLM=;
        b=FH1KGS0Nafsla6U90m8QjVQI+XAdRZptduohSlDTH8GtNjPd7MPKCpcJ3sbYGSMevu
         bQfzDvIpT7g9Uy/uwarQt4fYl6Huqrc3zHNBoboNioDZRJRwHgPpbRytFP7o5S+vPq1g
         /vOc4GjahVCpMfLyTP/+hvEvT1bb30WipB3qAeuBTjauSLRMd5ZBvRLu1RFK8TLXIUEU
         GblQYJSFx393tyDKO1IDDJYQoFL60CrFrBqbxNQEt3zVHX5zm5W9SGwlnD/HFYZnnE1+
         rSmHl7rZqubbjh3izS9aYUhVwOWrvLKRlYjjDolUAGIQ8YNxBkmrDiXt2Nn//CfBXotf
         Zmog==
X-Forwarded-Encrypted: i=1; AFNElJ+Zly+je5xdZchECeVjqF7WPtwDCVzjBX4brRlf67avlNNMB82YyYqrZlSEinXa+IItmsVq4AW/v7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/MZVXHiat66vngC2dToWxzf1qTBPvWtmvmD9MF2+x8Wod+0LQ
	XpvejahJdP+1YKMfA8WRnXtm0atgfiFMUvVBoGNgSA/OqcxwYm5x7eGq
X-Gm-Gg: Acq92OELbOxClfh1YjDL1m1IE0u9zy40GUKLN1J1Cd82TbObD5a1NHuEEA4OZyqMOvI
	OCBnEAsTeGUF9ZyB7r39+vwIxGUzEfxvf2N/EyeGGEmDTNj1IeECWAX8/u7R0K7chRGE3rFpsfr
	E5DBYZDgkgzopi1uhp1Pqys+yBLRlvNI6cl8+kn94QcNJHUIRF2H5cvmk1KaeTgWnAF/N+wKs36
	e4hcqKAl3pkJTH9vufE0sxPHjWchrvLeCnKJ+MknL+NZC7DaWK/IyNbWYNKruzOFgF7vV8Y5RWh
	uyjsl87tCkaG2ci/XSkkLwajEkLHUmNzjgiFDBWfTz8z1amw2q3xgZiayUggkRecqEH7lLjIbdg
	+liy2rBoDvi79YfbUOe23lMRum/zwARc/eLKwufofPmmOC5yYXe4GoFXBWbhbG34b9UPZpZGo3e
	Pp5Bsk7pEL0noqr0Rqjo7K1AIDPhCAN7AcMh5j
X-Received: by 2002:a05:693c:2b15:b0:2d9:6373:ad22 with SMTP id 5a478bee46e88-2f85c07f8bfmr3256312eec.12.1778341101337;
        Sat, 09 May 2026 08:38:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88924af95sm6551514eec.30.2026.05.09.08.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 08:38:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 9 May 2026 08:38:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Chang <kevin.chang2@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: trivial-devices: Add Delta E50SN12051
Message-ID: <cede86e8-8bee-4bb4-b6de-e9bc399d316b@roeck-us.net>
References: <20260508-add-e50sn12051-v5-0-abebdcc29665@gmail.com>
 <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-add-e50sn12051-v5-1-abebdcc29665@gmail.com>

On Fri, May 08, 2026 at 05:44:28PM +0800, Colin Huang wrote:
> From: Colin Huang <u8813345@gmail.com>
> 
> Add 600W Non-isolated 1/8th Brick DC/DC Power Modules, E50SN12051.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied, after swapping the inserted lines below.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 23fd4513933a..0f10368a1386 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -100,6 +100,8 @@ properties:
>              # Delta Electronics DPS920AB 920W 54V Power Supply
>            - delta,dps920ab
>              # 1/4 Brick DC/DC Regulated Power Module
> +          - delta,e50sn12051
> +            # 600W Non-isolated 1/8th Brick DC/DC Power Modules
>            - delta,q54sj108a2
>              # 1300W 1/4 Brick DC/DC Regulated Power Module
>            - delta,q54sn120a1
