Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A7B27A900
	for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791866; cv=none; b=WhjD0KcPdKiUr/LxNsfBfwS/aIdViP8ggbBY5bJVWi2WvUgpQAho5hsqoqpRUHO6+PqsqSyVz22ZW6fEcZpjIsWFN0bJFnFb7XCjE8EQwiGGqh1ZKqwJkpHNFvSYUc0XQL8Q1jLUw8Nyvs43sgEMizEsP44nXj0FqXhD0/+GoYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791866; c=relaxed/simple;
	bh=V0ieA2RnANTRzHxRShpkIoitBOjKt+gysoH7B0foc4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbeqyvNHDaz5466HpiE1Fp5bqMn2oW4pHfOu/AKyPAgb1R77Z+YJpcLGvB2jPWeP/MqQL+NXG+fTpU8W/1PiFBtHbWhfsaYNxRFfRjB65rMT7Fc0Zm4jQRwKlCQtT9cpMt3AtFEUlx9FxvvkhPxtILX5NwJ+6QFHvOlwhwad6ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuvH1QPM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuvH1QPM"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27eceb38eb1so30485185ad.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 05:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791864; x=1761396664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vexsKddPKfSOzGf6IKpuorb0FSpK13m//qSzSr6o0Qo=;
        b=HuvH1QPMGhHX0xbDbQ8i4BNDkZKnK5KqQqQnc2cErr/QpeYi4JzgaE04MEy11fcHId
         NTFwTCqG3kVTOGv4gzKPBLwTOIpsZ7uDehCgNEIF5FH3Ee8bHNXUbWUrrGrUZlIoZMXt
         8k95xRu0ysJCX86tzd3diN8b27En8vbu6pl4vgEQgivespG/VsTSOfb4itZ+q3paeVr6
         g3SmEItZ/YkeKIIrJwZTbySmTrRKWQ3ZF7wr8miAD7gOsKw+LiKcqmyFkOfUzMLlVryK
         gw5NXQJnuTfjAcE4SNUbuXR6Y3jzPOkRFX+w4l3TTZwd1BhAsHsA3leEbxZUaeq2ayKZ
         BhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791864; x=1761396664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vexsKddPKfSOzGf6IKpuorb0FSpK13m//qSzSr6o0Qo=;
        b=XrzQJ20toOGt6+60RF0pm9FppHtEElElosgzyu/6uQBTKq/yLrPHZb64oWFgzZzQfN
         QHclQbStm18VoL86ZU2dWuPhTOMc2+5s8nunzOJJj/OjH5wj+Q08Fj4UCf+ZOlXdd4St
         jBBoAq6mVcfgKV37grk8ZOtwgMzsPFezJi6D8PCSsj0QgL9WikaRZTVyYJ59wB9Lxk7L
         xTKVmrafDXwKE8iNhV/kf29Ts3ViGUUO0q1a8dzkIKgH6BSxx5VP+3YQLd6K6hc9iTMU
         fy3W3/BkY/dgIE0xhupGKgMGAB7d6e1HAyb+IdtjGWnW4vywm56Aa5d88zUh+egKre9n
         Yu7w==
X-Forwarded-Encrypted: i=1; AJvYcCWE78adqSJq6hhKtjL79W/TJCmAx4frG/DUlfuMMQUWCOUb+RUu9CxBbGTXHHSJ1lH0GvLm26GUarw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwBMm97hWbIZjDpK6I3q/mG8jUBjxomJmbzVidyOeqpo4BJ8tq
	pH/vzE1auXsXDpYf+gHO6tAWSnjORCHDlWpJdrnHDp+KyPXZPcxhQdYB
X-Gm-Gg: ASbGncsDeRQf8erz4gz9Zge75U0ZivFtWWSLpqt9z1AOt7S1jBjKMlMaGC77lweJC0A
	W5dQe4Hu3k9S5vhZWexfLm2bfR6vMECQa/WkzzXgm0AJbevvEDj/aq5oLHJysDuFkWnET/ZzOve
	1fQCMNCDvNk0KK18K30FXIp7GHzCB12r6YjRL21uJ8zidLei9bRUR+R4vxWVntJ31aePldb2fMo
	NYAK3bKy5K3zV91ZADHqynWSa8mIm94tM+xwpEk38pduiW3izXaJVD/FyHx+FsWLNuEO1ioMfO6
	yMaX+rHNKP57EzZjKoTFh+4HVsIJHkDDmGSPZiiy47RPFYs8/Po9hApYJi7c5CdRLjwe8zEc5gI
	nAtFvggdJFB7l5vDYtOsBSh8W+PzHnixHCzB5PeUssujqcZLQH82HXjH5sWdsShNebwfZMYVBx6
	98BlEeO/Zo3DlkvaZ7CNk8Gcg=
X-Google-Smtp-Source: AGHT+IGSMaPLmNa5+i+Ae8ZNz30JQlwuaKA6ceTbDUL3cL8yRFO4+dERw6BWu9+r+C/GQRQnRay3tw==
X-Received: by 2002:a17:902:f70b:b0:283:c950:a76f with SMTP id d9443c01a7336-290cc2f91d2mr93086815ad.43.1760791864324;
        Sat, 18 Oct 2025 05:51:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fed21sm25570345ad.80.2025.10.18.05.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:51:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:51:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/3] Update maxim-ic.com links to analog.com
Message-ID: <245e439a-7077-45b0-bd34-78ed0a573a07@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017163501.11285-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017163501.11285-1-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 10:04:31PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Update maxim-ic.com & maximintegrated.com links to analog.com links.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
