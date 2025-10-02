Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3472C21DE
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 20:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438467; cv=none; b=upt0Q3ivjEHK+R84vdx4JFYTuY2ffxBC8AZn0tYKs0Fh3Vb8g4ZC6KZoJCTn1ktC3H00L7o5bHf8bINecSZaPj2rFqXNdkkV4FZu9s84kqMP5b7gxYpvFWhrrtpfbn9eIB9/nJwuipM6R7+pPv73soUKTh4fEOizD8cGx82wMZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438467; c=relaxed/simple;
	bh=CMLY035keOpu6fjvgp4q742qgsi3l+0VCoZ7cJkByO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTgmVtWGWELT6Owz9FcaHTAFUvA2eWQgqSYOVp9Z1sYmY3UaeGi6824/3gESqrot8//s2ZUNAwqemtRKTmKDMSEcGg/yQee6Y9QkJiRLBN9ZXF/HkQvxPjq1wGT8SItjnnVTHAgB1gk66GNDC7zhU5Zu5WOoQ8zmEkh7BYA1+/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXrHVqtp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXrHVqtp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so1143516a12.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759438465; x=1760043265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8aA8eYQbOy4enGJKPbNIIg5fF5qMbQf/5jHtVJ5nvc=;
        b=NXrHVqtpynEKEJtRLn3ibfwDo0wiI74vYMTMCrXilA0Q2GOUn3FEhKArWtalnN7R5t
         WlgLPEFzz0HUvEKdlg9jmd34Z7yOPI5JUMDdduoxfc8KQc1M1zVbi4B5MRM3snlv0d/Q
         viKoZBsftnzUZjL9jbZEiXr4ct7IiIt5cdf7SWZmAF5Uc4TdrAs7ulQgmthFxBRq10X6
         zfXg+yWxw25E61TYruyO+bkkvvadLdDSSC7FTOFT8d9SIzJSDF2cC931iQ4wU0eMsshq
         FdJB07Ga14vEhGV7T4yxpxqekzIC767EE3B3flKxFGNWIiy+GF05ITyjLEMJ5fVxmu+s
         nRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438465; x=1760043265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8aA8eYQbOy4enGJKPbNIIg5fF5qMbQf/5jHtVJ5nvc=;
        b=Axj7XsdvbgJEb5VcmmZz9GKdCuDC5gZXlEftLskvqo+wsdUTCQnIYP0D4OikBi+wX2
         AKdztEA2k4y7mIxjRGzUJISKA+YXUNGqnzQ5EQfKzrkNMsLXsHm5Nh2hYjBUqsngSzKG
         z5djdpfnLeL51bEPqxN4sa2+fSrr+rzB8ty42YSw0dxDWkqdRAi8utstbPe/7pSrH+W9
         gXYbzT9YbLHeeUBRRqnesSjc96P42+/e8DwRwfnvN2qwji0tHRSA02GfVZ2HyMP6Bo5D
         lsACtg5gsWZfJLJLefUv+qcy46XUECMzO24e7Q61pyvqYv9N/xekoDXj6Ynk0iveWwnC
         ZMWw==
X-Forwarded-Encrypted: i=1; AJvYcCXHg2L1TgTIU0Bd9mYREtyIKWi5jlv3ogrljPBrCetL/4Ct6uOqrOeXspF4048UP2yOc+at3jMyZSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMggxgreFrwJpf57dy9NeZnkGqIxef7pVU2XW11Xr3zgL1CP/X
	TmNTHKXHlZkPNQU/1pzQNn6ZXJMUyBLi66HGi2F/NFMdL7e0A+NX+9h6
X-Gm-Gg: ASbGncvmpaT2wgRnlQBgV7nUPIx5Lg8epEADFwdgTjtJJ7e81SsNj752DjNCE6Aabro
	59LmDJ9j998Tb9rrDqj6CCKfPROfEud2KjCBHvGAgfSVtEIApBBq6kGCy4QpgIkBDtwceuKUwXC
	0BOXkBv000PoKhgaMR94K6ac6fs/eAIbbBXqaCpS694RTL4yokmEyHQt/Z9yyXj+GB7dYIMfbIT
	Gsr2HppYD+DyJ7LTYVeInDI9cNzrwW95/SEN6mDg22ITh7rBN5maYmXrPi4DoySCqLTs1mSBjbb
	wHI+S3LlEmaFpf9j2gt+eS3NEhbWg3K3+l7AF5iiSJfEjXuY4LNm/G/4K7xayv8M8tAp+kGzqx/
	YNNoFIX9gEjHZef8bXr2PzGcKSmvkv+Cq9YnHq1pU8msqg5wbMVGxSTw5GTg=
X-Google-Smtp-Source: AGHT+IGiu9l09JdJ6ZfjgQrIh+h+Pm7NXkpaxqUj8z/G296jIby1wJ/+5YRLY8gYxUFOm0nbWSBUhw==
X-Received: by 2002:a17:903:11ce:b0:269:6052:3536 with SMTP id d9443c01a7336-28e9a67bf21mr7065045ad.45.1759438465299;
        Thu, 02 Oct 2025 13:54:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1108b8sm29533565ad.26.2025.10.02.13.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:54:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 13:54:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add MP2925 and MP2929 driver
Message-ID: <bd28f637-bae6-4d9e-a94a-019b4104ee09@roeck-us.net>
References: <20250928092655.1394429-1-wenswang@yeah.net>
 <20250928092845.1394718-1-wenswang@yeah.net>
 <20250928092845.1394718-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928092845.1394718-2-wenswang@yeah.net>

On Sun, Sep 28, 2025 at 05:28:45PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS VR mp2925 and mp2929 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied to hwmon-next.

Guenter
