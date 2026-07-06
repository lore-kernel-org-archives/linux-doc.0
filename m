Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79C0313267
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345986; cv=none; b=kLAwDllgwqi060xEn+kHEIjDGXrwFy27NnoKq+ah4ZZ0LTgclTEHPZqLHSQNrHkxpJXRBAuWX9Ma8NFRSnakEVG9GIY5vQujqMMcqbL75DEfPDCZRTaPjlNfqep2l+xIdZdo8lamOPgzzrBxK6XipsomenGR+U7oqeszKmA498w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345986; c=relaxed/simple;
	bh=4hYqJ3Qe+MnZYGOcb4FpjhjR0eE+Boo935vFoc6wSBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMPOpTCNVHSmrotgUv5ec1vnPFhEcmBtKje7rBOtTVkeDURVFuMrCTUewFwQBkxNnz0J45qbXAinwltFwfc2ZjMNwneAfMZ9ZPoNY9GGzGpMTD7Ij21ERtXYGcscG+f22FcXJfnpLwG1XM+iBOCzyYpsC5IArVnRttSuZ9jnjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rk8cdrcu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rk8cdrcu"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8478fe07f65so3104962b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345984; x=1783950784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHBgfjBFTj4C/n35etUmmhpLGl9jUrDg3QkdSTay+Ho=;
        b=Rk8cdrcuZWv+8iZPcd5PZ93wP0JOZtuh8opYNYQOofPnEDM0gAlDGEP9wWg0Zhyzev
         quJgeeVkp4VaEZgB7aFTI5S6+QIP/f5PVwcNBFaXMldpaB2Zw9xlwim1d2+2pdYGLTgO
         9yNhf2H0wtM0qniH0oNEdTBmnZATUdyvTf2nIFGQAgL+3ALIw+x2q/srJxgw7Q9IHfrt
         heFYU38Rv1sjswFK+oX7tg+1K5gNkkwz/zZ0mIT9WyqrKExoVtbNNRmHgHFAhuaRlL/G
         eB4PQqcgCeB4erQ9p+3SjuXLUM7EYlud9P7QlEZ5WCXGmiWtePzpscUBF2nUAW71LLZN
         gIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345984; x=1783950784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHBgfjBFTj4C/n35etUmmhpLGl9jUrDg3QkdSTay+Ho=;
        b=VUQEHfpNZ49y2xQryR/4jmvRZuNZxnYpJaVd/f9c8YX0uCxNJX1iCFHGh1mrCXwWOy
         i2o+u6SW0XQcu57lBnZXg3lQjnYonrXObB24rbcq18ORjAFFkA+4cX3KZesTuiQW6B6H
         9QgTYdf602aOTWlaOlpBG0ALF8c2BhsBIl4o/3EXRr3rgP4ukB+f+Qqn6K/hhbXtzE6N
         4mRQVRMDqzQv7uv/W9EL5DHS6JkhR86htH1mf1J4mQUm0hQtHtl6rXBjmM9b5NmdrG49
         b7F27kFtCo7cl6XPxcU4dLoiXiC5tDfwwL45B9fbpCfikEiOv+Vcnxst+ioeoMs5y5Fq
         DAVg==
X-Forwarded-Encrypted: i=1; AHgh+RoFGep8yNw0shSnqyRw7qzGQFobC/notZ6MpxaqKU+n7oiWnQ+NtOMtH2crkv8XoSvwHX8HOXHmizY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAs6wB2RmnJsj13F/P6gnzrHzyTNGXQz3OUA38dI03htLxVSP
	yn1HXc0EUbrjLFzVFBRqPGTT3Fcj9revcaxFeVeUN/tGy3OmLC4Rp9xg
X-Gm-Gg: AfdE7cmKQSolVR1/AqCuWNC/0z9jggtyRf1k3LUj4yYv0mcAmkWFXfuDpcFnIwXqYvZ
	GICLDlAcRL6lzgBiJKzSCro4kMv22UdmFU+ojg9ktgG5xrZJ9ycH6awqUZV+zDnGV9CaamDT62h
	GLLxng4dXMRFsHYdsEo896qyVzldHStLcTOoHMjtQV1XVskF7NbGf/xuCXFbqegZjomQ5t+RKyi
	RwhWQB2upwNXaPepdpSfi7+Gr4A7UpUh0eCfRXcK/paGmmXjSo5gP8SjsTEOs0zf/mdPL4wHR4G
	Wx+uN6XnN6owvC1yTrZho/AexEDAMEzmrV523z2mS+Quu8mkNlbO42saxZOAxz9sxbugIikwMBt
	+WKnqHIW/xJEBwn4+kSJlHcdQ9vThW4KdSBK3uEA0orerpQ8TdMq2yvxdNO6ML+nP6Xv5zp9/H7
	HwW4Fqh15uC+RRXVZ5imNJc7dcqw==
X-Received: by 2002:a05:6a00:4b13:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-84826c30d0cmr675757b3a.23.1783345984102;
        Mon, 06 Jul 2026 06:53:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d85bd9sm3688462b3a.51.2026.07.06.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:53:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jul 2026 06:53:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Miska =?iso-8859-1?Q?H=E4m=E4l=E4inen?= <miska.hamalainen@hotmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E HERO
Message-ID: <2f0af6df-ed24-49be-bcb4-6c30b7e68cb1@roeck-us.net>
References: <20260705113246.812500-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705113246.812500-1-eugene.shalygin@gmail.com>

On Sun, Jul 05, 2026 at 01:32:36PM +0200, Eugene Shalygin wrote:
> From: Miska Hämäläinen <miska.hamalainen@hotmail.com>
> 
> Add support for ROG CROSSHAIR X870E HERO
> 
> Signed-off-by: Miska Hämäläinen <miska.hamalainen@hotmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
