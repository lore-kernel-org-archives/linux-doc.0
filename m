Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB2834B437
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783694219; cv=none; b=pezufYPseQ9gEyMas9FD/0ddsYDSRB2LDg96VybO3/lEV/D/JsdlTLXVVZ0CeAY0cyDs87kkqDmCAy9ivjBYn39BGt4+AJxRRirUWjynTWbSE0kYRAjN5igP2z6+2cpbMDfSTlm9Ua8CKe1gL1DWw0A5Dzdh/XkixmhnqiQJK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783694219; c=relaxed/simple;
	bh=N0TIROp2trl2RBha1xvvqYGNlJ8YuyPd8ww5wOB3aNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApgYO4zcoxfdNSX5q+gTGtVbIf3suKghrDoAs4ekDCSTGgjesYNpolhawoj0TiIhFaJ4e/GaK5S/4Y/msFLjJDpplGr4UdQXCGia5Uz811oHXvjyTJTXFYDVEmTI4qlKVfHRRx6qo6vRsTXD0oLfT+EYBwbMYMeLq86xiy1Y74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrQwKkxv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrQwKkxv"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so984411b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783694217; x=1784299017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6iu6OCaBtR+lMmPhSTRqqa1hHf/yoHoZhIbh3h+vUR0=;
        b=ZrQwKkxv43nH4UZT6PqdjcpcbdpQFPfiKiON1odHtHGsE+GtFo4JGtqZdYSxoz9BD6
         SUc/SqTvJjGQOlrs5/0vrPP965S5AnOt37K7nOAsVbrR+cvMN/RLeSK+1IN1w+zEWRj6
         6qdOvgaQmMd/8YIS5P62UDjdHX6IijjktC7hLVtkXrSOh0hx/oUlJneq58cpMdzHm+5n
         MQOFm8nEdIn8111Y3UcgeCa+iICCtlWOk7g7cwWzMh1YP1FgnCZEPDibRWPaAoCsjmc8
         aNx0HJWR6NXlDlk/UFlPXt6m1ek0SipzJN/MtuBOZuU55f+iX5wNsH2mwBRMjaTyM1SZ
         PjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783694217; x=1784299017;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iu6OCaBtR+lMmPhSTRqqa1hHf/yoHoZhIbh3h+vUR0=;
        b=iVYQ4/wyibr7EgWUgWYTcc9fBUM1C6URbZvI/SKZgwXC1zTSNVFL1ixL7wQAQDkUS9
         6FKrdql9YBnoJiit2Ih8iuuKrcQHV6d/tkbwB6qGcVFVawyaHVWBswyae70piltf36uN
         gXsWrsXHfaZ2t3Nh2Lhau23LfTwH3OcMGIaT+XbEjAFA8aMrYazk5JPUY5G1okvNkE7J
         vPY1P76EI3IcCGugtiGI6RnfbyyBKc2v39FXHfC0udH59AV+H7oWd+Gh6kUHQTbuVvbp
         ogM6ILE6n5DtOWj1HGWdzbE5gRNi1Nsr/HD/957tgMeEvusoxo/XfLE6ffVoGl/LADik
         113A==
X-Forwarded-Encrypted: i=1; AHgh+Rrbm86TilP8jkUNpXYRN/KwHlQsoCfcUv4D2Kac9vf7ddr++ew0i5WqrQEz5lHPDG8uAP2pFvniRJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwleAORS2NfQ5L1eIVmnZ6ANcTU0NR7qS3K7IXx14EMxoQ4Wmfh
	uT/hiXmEGVUZgJRTwnp2eAqSLmARjCkU+yPpw9S3hJaxZcG14YB2OPpH
X-Gm-Gg: AfdE7ckTiGhEgblihWS5FuvW+JoQWfh0JKTg97GljYcmx4WjTFFKrv+Kz7MqlM17NXQ
	gPSnnlUlpRI7GjR7ySQvbIO3H9/zvTemUiU1nVMgd9l3pTkszm3U8FPZPavpCxTuTdrc7s0oeLq
	UnYyHA56vIOGbl5kXwm3hiBwsa+B+ybfZLimxnxlKK+Gi1Fra1zTZtbtN5D+bHFb9B4RlxVx3qm
	uot7EzHZAwLwLPIfjuoVKTFDfKUDp9bGJSsJfHcZ6oe3vTSZrY1ql3ECwPZI1SkVHzLosPIldKx
	sgTSEUqmeaL+gD4X2/p72FyMP+PYue3zickpc+mQ5fgdG0LDjPDzTAZkPhhYmDAMYK6yiE3u8mt
	F3YJA5JoyemM7skT3YbxVMdDn/om65pNzpkY2f5uWysodaF7GhJIShjHUbKEzMWmcM4Py++KwGM
	PyG7SZnBb9IJeEG6MHKGHXx3fsUA==
X-Received: by 2002:a05:6a20:cd95:b0:3b2:a8cd:ef4e with SMTP id adf61e73a8af0-3c0bc9da64amr14293496637.28.1783694217401;
        Fri, 10 Jul 2026 07:36:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm41782795c88.3.2026.07.10.07.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:36:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Jul 2026 07:36:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E
 GAMING WIFI7 R2
Message-ID: <8d0a9350-ff37-4acf-88e5-7b4dfaad17d8@roeck-us.net>
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709204037.1998433-3-eugene.shalygin@gmail.com>

On Thu, Jul 09, 2026 at 10:38:35PM +0200, Eugene Shalygin wrote:
> From: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> 
> The board sensors is a copy of ROG STRIX X870E-E GAMING WIFI7, thus we
> simply reuse its board_info struct.
> 
> Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
