Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E53E9F76
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762169; cv=none; b=r9DHNBv8oz9Tfg4vXWDzJSISDwY/LrT0m8SUMxSRPn3tK8sNjTzq7fwnifk6XNLxXd/VNVMbn8vFv7db9ePR7lCEiYI5d5vHFcDAq5Y7SUzVqQjCoYUTLWX9pKT0CmGcd6879NRKpcfwmYBTGMSFUseFLlhO1KEAAf8ucTGnupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762169; c=relaxed/simple;
	bh=YP9ftBgU40ZMDVr7uKljymEYVi3zFdcjpWVQapD9Goo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxkQRGjiSk/2aaKOQw/xUoKUZBUn33fB9sFYN4P183mmEmZju+gwcsUxrfIT9RZtEi3O53t78x52KNcCSEHM8NtWPdqw/G28sGGq333esKRMHWagCc+mDp+imTzz8kO4MpTf6oTLUDHDsq9t5ahniiZyQTRythHwTQMPQhS0Zmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxpYt0xw; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxpYt0xw"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-127380532eeso376843c88.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 08:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773762167; x=1774366967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPxQhHLsn9trqYK9Nkt3NTHTqHhfajnqZ3m8HUBGCaQ=;
        b=BxpYt0xwk4L9xgh/EwJJCqTvVNnHatgRrcbn9dIMhuudN0lGZ1QVGs1ykCl/RZgV6v
         L5/yHuzlE9Hk5fmY1rNmhJRKUNwZzExSVG5FRdOFkOSVCsRnpKzsvkooMkJjSiN40Azx
         NjcLgW4V/pBJlXjC1qnnYzJj14fK7his1MqEPgqVPo540I6h7S7Jzqyo2ovekSfSchb5
         2W0Btc0rZ6yiwOFJMrMB8s5PNq8T6WzRlWB8QAiviOvIFDm9UbC0Z+6mPoN25nzuuB5y
         GYwG90PnhSjtXAbp1yIYFCtXiiiNRNoYU3WiGqLxadb+ICQYA+krgqrW7FAmtHauL5uQ
         LEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773762167; x=1774366967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DPxQhHLsn9trqYK9Nkt3NTHTqHhfajnqZ3m8HUBGCaQ=;
        b=Sb+i/muQ7oEjXKZHyIaJej+tvUW/4mjDBRis2v91/vBuzhlnc5udArtUumY1d5Y2ey
         CNeFuCnNMAuGPAKOlBx6CGrtS6amKJAXG7NxZadlqtTnFrQ0AePKteOzI4odY7g4wzR/
         Px0tM0tZ5JuVgFfCG8ghqyPAfZdVIHAjz9h3J6xxwU6T5cIpQnDvcpcln4vcEgtRCMyy
         R03pfhdNpdawiyPFln0pLKim5IMZSH2916kt3H4Uo69FRbU+FE9bezFFwpn1ccIdPa8x
         XInkKPN2WLXQC0uZOuyeEioB9W+8ZO42OPnrl1JtHYYy8xQ/5X3TxL+Wp+OeW0FHzQMk
         2O+g==
X-Forwarded-Encrypted: i=1; AJvYcCX6IoyaONAKauda3OBPx0f+5W5A4ouKFcUXAamd1ytWtcf9m3O4kF+mUy/ozPsRtOVVZnjuxZ8OoC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9A+sblQch5zxs22cdJhGbI+iDCfQ4n2O0a8hV2NPxCppn/BT
	yVjeiKTf6nHx26SlCndr9a8945QzSezxMVhBhfVDCigV5/BCcv14XSIw
X-Gm-Gg: ATEYQzx0bQz1IMIjS9VntVeH2jfP/08T28jXu7KPRqvVRVtKfpAEkOcfc3kT5ADizuo
	iHyfVl3UVxcy0dXGL3l9IXltdzfdLQY8rMS712Yv3vhlUY4aNXHGzqC+GVBBsXMEVtKE704MZZP
	nbzsgDKsqcAVpA1lUaS0YDhPdsLXDiql4Mfj06ro+UgafP2ha28YEJuxy/zPHz4FS+lSg9/wfto
	rzabo6S2T2BsBUAMD6ecXpUBgvmzcxrcpvkjAoZIK8yHZQR/UflUkGnhnn84zsx4HI6ROBZXxkK
	o9z1mZUe/LzYnMMfSg/p/z/z2FmxdTUCLx5e/Fv8kin5Q9IOJz2YSli2DAsI22LnMnrYrHH8VqZ
	Wvv+r80ZhJavrqI7atnC2qmhY9lJcXu8YkumLZ5jKRAorZFPHtGOqsISYQiNEgIeboKutt/1Bhg
	gLgufJXq26o81AhEQFwMdLlVJlmDelhdXB6yGZ
X-Received: by 2002:a05:7022:458d:b0:127:5cda:fb7d with SMTP id a92af1059eb24-1299ba11a49mr4977c88.6.1773762167235;
        Tue, 17 Mar 2026 08:42:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f639d1e4sm15787042c88.13.2026.03.17.08.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:42:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 08:42:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Delta
 Q54SN120A1 and Q54SW120A7
Message-ID: <4b448eb4-73cc-4d42-84ea-7a0d9a0153d5@roeck-us.net>
References: <20260316-add-q54sn120a1-q54q54sw120a7-v2-0-60e6182cc4a7@gmail.com>
 <20260316-add-q54sn120a1-q54q54sw120a7-v2-1-60e6182cc4a7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-add-q54sn120a1-q54q54sw120a7-v2-1-60e6182cc4a7@gmail.com>

On Mon, Mar 16, 2026 at 04:39:33PM +0800, Colin Huang wrote:
> Add two additional Delta 1/4-brick DC/DC power modules,
> Q54SN120A1 and Q54SW120A7, to the trivial-devices list.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---

Applied.

Thanks,
Guenter
