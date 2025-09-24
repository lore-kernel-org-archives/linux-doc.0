Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B662ACA4E
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725295; cv=none; b=irq4H8FOqIbl705F4XPJJEaaaPzaleIXFFcHQHf4mn8cvfRLMXy2gZJYFB4FV/KVtxTgQPClwq/xlil7+m/lJ3V4b6bU0/B2ZirFNcpH89WE8L9QjC8ynlKDObP24mQmen4nK4q7iAV3QlHPrGQaWp1WGfqIOP759Z7kGa4Z+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725295; c=relaxed/simple;
	bh=wNl7jQLwEHKQRZX0SAXvXgHbGWSN5OECo77b/O6rRR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQFoAgWsUtqq42lAUtMb44F4xdgBSAeCXT7FR25/LwPnMLKI+MtakXyLdg+IokGauRbGvZ3tW9cahDqpZDZucReIRQuqzJg8kg95UOV1CRXzllaFsUPIn+NhHZpBgJH0I5LIRnGNoSpOAt08DEBqsSYjKOs0v4U8JkXEtdYiJZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDVhHvc2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDVhHvc2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-267facf9b58so50642925ad.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725293; x=1759330093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gCnQwG7cHEZFPgTmiyysVJ/gsyay5bIs1U65I8G5nbc=;
        b=bDVhHvc29lIH9XBjR3fW55NSUCb7UL71qB5s0om3Crh2XyJpCyayXwPakpk591Yiua
         F1w55xvZKZwpPuHSzC5dLjodto558nD1BeQ433LholI0i3fHbVyUuTpXEIiXG4Zd/TTM
         2aV0Td29kMy0EAW8SUienJM+pCkamJcwiQZrSZmWRHomh1yGQYZ48+d0qLMsfJzi3cvj
         FDWM7yMj4frM/kJA1GXebNQ1/4SSMdSES9vut2wbORtJ7vKkadCKBicX9OTaHZrkPV0L
         Bpm6fwwOXJG02AH7wagRlIB7LcNPdiVZ8UNHtZlChWoEoC9TrUP0yHLp9yFAm4w5XqLe
         4BvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725293; x=1759330093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCnQwG7cHEZFPgTmiyysVJ/gsyay5bIs1U65I8G5nbc=;
        b=IlYccGpM43UcI4reylvotbEDTGKrYuFioIHfDdIPT128MFch4tvkqvx/dHTZ6b6QY7
         cbcfvVfQT0FOy+djoGM1Hdkw53C4ppvcvVwLKaMnPmsI2wqdGBXqvI4JHXE0HH7Fot81
         yO01gJJFoqFIcLzjx4uvDXNYeH6AoOvfLc+/ml+RY7K0gT7rxcN84/aeR6kHPx7cW90q
         gvRT1afBiqEnQoV/G7jI/ODVNJ1beUekjDAqKVeR2ZFHamKob0+7mIA5cWCKP6HaFSJ8
         13AcdEfNTOhmjbvg6uAiww9OQFhqwCV+LSP7EfUY4COwXUHzic9jMk5igRaAwVNIlxko
         1ORw==
X-Forwarded-Encrypted: i=1; AJvYcCVZrIpDv17uYjEnO9d0EiFYYqGHnPuT4cs5QeaefXc7C1mfcOwufrH0Jn0genFg8LrH+toY5tmjeRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBdQyy1bo8qdgYbyrcpP0CqMujteQFC8sjpjyzto0WOoCAb2m8
	T7dc+U/Qk754VB9JSaPrkLBa6lmkxfr7IpeV7ZX9/E1l56OQfOuuzdJJ
X-Gm-Gg: ASbGncs8a9OlMTSkFU1CUhjjP5YTGgpSoE0lw6DFlb9jcPsOK5wYYdWqNdT3fHqq9Rv
	W3SdooBCZSG32GpRcLjDMykr36lIcOysGR7ox7LB56AWjmYiumvnPhJ/kref137vjML8Ho1asNI
	mkxehxpjp0B2V/4Ri8FBr6oNA8+JRIu/REcNVVPWCBSWbIXOYNAxuQMAZXILEmO3kjEocSmc0PZ
	mWP4ELCETiX66rPwF/jIKqO5KspEaiykeF8u3zwkYDiatUX4qXSpIDw0lihP3nKyrilQiCbXbtS
	ZrgBtD32ODLJhwLskMHiRbqzp1uyg6XLdqdwl78Q4SIgXm0K3zVQdINNSQSzOIZQncmLGZdTiKe
	jxgqVNPByVks+qwNEfGW83lMucsRafoz1fsogWdRQiZsvqg==
X-Google-Smtp-Source: AGHT+IF0Wc/aabCHtSWcbcm967HWZ+TJSB9RK+HGHmlKX6l01u9oA0TxcL2DvhecnXy93SqhEsB6PQ==
X-Received: by 2002:a17:903:4b46:b0:24c:bdf5:d74b with SMTP id d9443c01a7336-27cc27c217dmr79382925ad.19.1758725292956;
        Wed, 24 Sep 2025 07:48:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2752328629fsm105445555ad.106.2025.09.24.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:48:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:48:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add ROG STRIX X870E-E
 GAMING WIFI
Message-ID: <e2dac203-2edb-42b3-b75e-f9b119922250@roeck-us.net>
References: <20250923192935.11339-1-eugene.shalygin@gmail.com>
 <20250923192935.11339-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923192935.11339-2-eugene.shalygin@gmail.com>

On Tue, Sep 23, 2025 at 09:26:55PM +0200, Eugene Shalygin wrote:
> From: Ben Copeland <ben.copeland@linaro.org>
> 
> Add support for ROG STRIX X870E-E GAMING WIFI
> 
> This board uses the same sensor configuration as the
> ProArt X870E-CREATOR WIFI motherboard.
> 
> Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
