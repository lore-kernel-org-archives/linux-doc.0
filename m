Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9FC37269B
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573114; cv=none; b=Nuc6Er9jhMtyQJJ7u0zuzUWJbIXb42wjbFLO+JcbXjZVNDwcG8uC22L3K4tlorL0RMz4cNQ9DFegsQaKeMXuiQ5YIwJVylTPNj0hEfOes3WDegaocad8YhxiAXcELLg5oV+jKTfSKvQC8Ty/D0u4UNYvJLztCF5+aYa7Wl27Luw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573114; c=relaxed/simple;
	bh=r1xldGkskM1LoWG/eSEiuRbHYKyqMWnb+9qvWV8vW+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RROMRGwbZmftrUJibf7wqy7Z3DH3YhWc8Q3Q9MSV7c3ZgwoYINxDaGAFm7cSBxfMWfubQcP9BZalfRlkzIXn/RiCM4RsLFE4wUtnNCNk1uiNrCDjkMEcRtILa9Rnzm27Cox3GuEfjN6Y2AqpQ/sZisN3Nn29EJRsKcfmSJ7Iv1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV3/8xfo; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV3/8xfo"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso870015b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777573113; x=1778177913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKm1ZdQlx5hjZVefyBU7lA6ZzR4xQCcmrN+zV7mG1fg=;
        b=JV3/8xfoTgec5Wt52gaGXCR0bNLsZVLmAckC+6/gFM6lWXuruFnwajK0CBJ0Hm4xlb
         +pA1CnZX0gAWSv/9O7uLOeNIytKzFFCjSQIquHw1gJRJ2qEWf3JDPIHCyH6lJBUkr0zi
         DZPmAi1R502fNr3V0Nn5Wzk3cZlhV2C1lKiwAzYeiCsPzbdE60o3P4FxLuUB2ZrdTV9i
         ROPELSSK2fxcXvmOhxmH7SqxhiKJ7/lWwSU3+mXmHJRTfq0XhLbwDBaeh6IuwMbNVPGw
         cnWoLtcBuK/pCDL5yvaZiof3SttPSqQUhhR5P9KZ4VbbF3HndX0z8pRjGq9HSipyzLCO
         7Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777573113; x=1778177913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SKm1ZdQlx5hjZVefyBU7lA6ZzR4xQCcmrN+zV7mG1fg=;
        b=Nb6QxojIhWkXe2vzB0oflpwju2Z9/YWszmpjEbugZX5jaINwPFYAf6Is0Uea/MxuA2
         P0sDpRUxD5yd8IVCPA8iqwjrLsbMzSuC0ajTZiqo0D3kXTL3TEFzJBTEFOC8EoM0hAgF
         wrYuBKkKVjlrH+yz06RUuG6I/BBZTqJl/+DPolMqVjbB9/fTq8NDTeOFdjDuBwlbHhU2
         ByUlKzFf3LKqs/ML1NdqtljpE6QYCPK28tKH+wLy5IP9A0oYgVOapMRYgqHoOu2IGnja
         0R4IgXkc4ii2po8nFLrVaC83UTPToC4bqvHpC1EtzO1sYJb8PmsYD5KnsCFgfFbHrYQZ
         pHww==
X-Forwarded-Encrypted: i=1; AFNElJ/WcXGTLxo+oWrJEWvlJLdkbpF7uOvSaU/CI5LX5zLNwEQbfzJboJ+7jWGFhBmSh0lgz/qhd7g28rs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6z+FKem0uq6pmToZSj67hTcSPBhNzNCx4BQP34L429+eBNdIy
	CzsdoYZuzv2phBWrDSPW+j5SAIiVm65/EnPh6vWpT7jJsqN6MaHVPDDa
X-Gm-Gg: AeBDieutyN4Yx0c2IIrynLbNL4Y7m5+3sod7rdDiyrTet4WmDIFgzHU4uQEgdzxjQt6
	Xo3fALfxt9nWKngs3JWb5PVmfjzMtzPe14IttUVSJ+6jMk+6f9NDx80H7Wme6q8DrZHQ6ly2vKE
	GIYUBpB91DmrLiD1Py9n3a2q2GyBD1gdGMBHfiOzk75sfFm/1e49THDQocx6y+erOhFlRcNczYx
	6mnsDQtQE5JrpppCWJx9WW9UH9BQRF6miHq5G8FjYDMsQlo6U+W9imSmTvIcb8uXxoN5/BLjq6V
	c6iMX4q2ilVQ3zFK2zkBr6aOT8Dgz1987BFohxMnxZcm5eaXD2XWLOC2WMHOKc//TmbouUbOdZn
	MIFhq1hDJeOqCvejwxAmIcTLOwHWFMiCWMyokxDTvoPncvvvhYK1ceGdPUK7CuQCi7rBa3EjdAo
	O7R000q6QTr4LLLwigziN6q7r5Kx0wI2yN4VdWiMFLpmwXMp8=
X-Received: by 2002:a05:6a00:28c5:b0:82c:70a8:faee with SMTP id d2e1a72fcca58-834fdadf50amr5266501b3a.6.1777573112943;
        Thu, 30 Apr 2026 11:18:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158aa1ffsm311794b3a.22.2026.04.30.11.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:18:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 11:18:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Chiang <chiang.brian@inventec.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/lx1308) Add support for LX1308
Message-ID: <136527f6-5bcb-4cd1-b60c-ce7c80fd149b@roeck-us.net>
References: <20260428-add-support-lx1308-v2-0-90f115954143@inventec.com>
 <20260428-add-support-lx1308-v2-2-90f115954143@inventec.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-add-support-lx1308-v2-2-90f115954143@inventec.com>

On Tue, Apr 28, 2026 at 12:19:29PM +0000, Brian Chiang wrote:
> Add support for the Luxshare LX1308, a high-efficiency 12V 860W
> DC/DC power module. The module operates from 40-60V input voltage.
> 
> Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

Applied.

Thanks,
Guenter
