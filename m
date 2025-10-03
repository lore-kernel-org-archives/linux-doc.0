Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C96221F26
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759522584; cv=none; b=t8rk/57U3UyBIZf39gnu7yBVzKv3SCA05nYQd4b0CgxoiFJChX6EQzEmYGZDbpth0GzVg8zGv01i0IacySKgxHjL5xajTpkZT6tIZX4XogLvYSpzamLynJWRO3wigHIqxWAbiCKyGJe9310GbVUfBLdkM3QeQNIMGUHAmiGf0Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759522584; c=relaxed/simple;
	bh=H82ORd8hr/qh+IsbcypMsoZeBRi/Ei/EMP00ecr4XwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfdRCR848nkas4i5pQ/JpH8SvAXXX5bvwoLNKF0GQPDGlcYbvgvbaUS5JwSc9RgfAqTDSlPcqQeCsrcTEl9PozFty1eOol/wwEJk3Dg3diGd65f3Pir2kHzlBdapZ8sgsWWRz6sIQiqG4ZWKbnnvyxkdDL9Kw5D3DNxfeny4KX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miWdq48k; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miWdq48k"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so1852009a12.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759522582; x=1760127382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT0KFxIL7C7pHlludN9kedxbqFYyuMwiQOZio+aHSVY=;
        b=miWdq48kMvzPahxv/2I2hwS+3cXcV+SF+Bomf6a8gOlTD+zgu6ilEVfoNVCGVi2nD3
         2p2ZgO7ycjamOk5PXY7hdGQRdQtDP8Ofcu3vrDn51LwCpKrn7/o5Vb7n5KTdTnRj9kKx
         fej2jM2TV5r8Fa4D1aKoLtz/oJGsLIWZQXVJ9ykUXch674ynz45yINW4nCMSrt9/T10a
         P0M9vtsf7F/wQfeiTCaiZj420i0m8mboazidaWkNRo0bv9F7KLtpjraADtg35MQLdhYa
         To3OCEBOSKJ5IOJroEprQQqyMbZInCahZTM+vnIdI7Y4xFO7h9joYmLmA5ZECJFTWNOp
         IwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759522582; x=1760127382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VT0KFxIL7C7pHlludN9kedxbqFYyuMwiQOZio+aHSVY=;
        b=BYAVDuJ73NL+BMPnDTp4Creniw/lAs7TBZPyl3zvcp9Z7TB1lQedBUFdDBl0+VPe0n
         Eb9d5UbHkFlbHmgw9JXrq8yiWCDd8e5Tbo6RxYcSlu4ifHmAxJLVazpxDX0gQ93WeJO0
         1x8HjLV4q4F4i1K2gneeFVnPIRTZ29nRJct7YPKfWcuGlz6J4jhBzraBEzt2Z2rUGHkL
         9i7X7n6z2IAMbq63es8l7aZLufNzi5hgHMr87+CQgn3w/DmJil30ztLH7xEV/xOSXSO4
         vmZkEW8ow54tWAGYBLj+kz6erO5hHnlfkpHnv0iKh418LCNW84hByrM+jE+vZ0sdPseD
         /4fw==
X-Forwarded-Encrypted: i=1; AJvYcCVXA2v2Cr1UiSP/7/bIextg+ZvtlLsb4O+LQsFAnblYWgK3a4E8XCs9g0i5wcBp1L03u+DDcKukgKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNckf63cclAVagIjj36EJ0todiUkz9/i53o6Hzs4uLM253Yro
	+nnnNM/v1wyUEq5mJLqEAjaPBgrTaHbKWNmKYYeZ6/xxAePYgwKcD43J
X-Gm-Gg: ASbGncsVduuQm5QefOPa976X1xB5x2x3OlXdJhKPsO+JBjv+heI6hGHZ1sUBIEjl7qu
	4BXdGnlXJ1Ia9Hr3HJp2fWMupR7V804xIji5siT/47fPhgGMuRT9njxE5SlXCUEWiXmT/pu3QE0
	HFQP48TlO8+tKehQzR9Wvj8UXzdfV6L3D3H8QPJ67o2lrFjoUYB6o/S8icZ+2Q5LU3iy7/+9XMs
	uYhSI4Gu0+b3LrjrDRP1Ekol4wmH4vr+5cWO53bAusRJ3/m4Zsqe1eYQU1Mt+hGG8DNsmzWoIE7
	ezoJhUsnEmwRVjoE7/5Vc7LF7OjhV3r7fx4OMNWAMw9hIFpyms4RYvLqG0MAFI/rIWqDkS/KBMW
	wTGNnOF8Va6Lav5YhBJCopSaKr1t17KuAI5cBql9W3Ib1ph+HUBukqDU/IozPBHhaFuI78g==
X-Google-Smtp-Source: AGHT+IHlq2cs9sTsIIqnaPqXRQUWUxlWT7W2DP5KttS/b44KTLj0dCHGzWL4O7j4Y3l7/oRyurJF/w==
X-Received: by 2002:a17:902:f68c:b0:24a:d213:9e74 with SMTP id d9443c01a7336-28e9a634df9mr55325195ad.49.1759522581776;
        Fri, 03 Oct 2025 13:16:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110ceasm59027385ad.15.2025.10.03.13.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 13:16:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 3 Oct 2025 13:16:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Paul Heneghan <paul@networks-extra.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI
Message-ID: <7e34002d-4684-4eb8-9228-168f1b6987fd@roeck-us.net>
References: <20251003081002.1013313-1-eugene.shalygin@gmail.com>
 <20251003081002.1013313-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003081002.1013313-2-eugene.shalygin@gmail.com>

On Fri, Oct 03, 2025 at 10:07:56AM +0200, Eugene Shalygin wrote:
> From: Paul Heneghan <paul@networks-extra.com>
> 
> Added support for Pro WS TRX50-SAGE WIFI motherboard.
> 
> Signed-off-by: Paul Heneghan <paul@networks-extra.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
