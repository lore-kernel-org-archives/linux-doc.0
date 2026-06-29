Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8E426EB3
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748690; cv=none; b=bRka339jwR0MRwY7rH8CkFdtXmBI2987grh/TcBkI+grsKW/4UTtS3pjGOcjUZpdPjTA8e+rlmP9l13a9nt1449PJZ3eqMdOw9Ddc0vxNCfKF/CeBttM+aD/xqN6bqMd4Xj12qUKHcdnfv9pORFPa9q4B/x5HdGfq3HiB2IntAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748690; c=relaxed/simple;
	bh=FKTz7rXC3TYNqt1upKOS5ukYPGh9Vp3yClY8vEtWRJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbK5gOzjfN3aszrrZe0raYNePbg00+2DBBR31iY0wUqmOv1J/0TmK0rVV0WkZqBVUEHTNOJ3DZvrs3XWsatfJ68rO3dlunBwbRh+26fXnEWAMOwChh0wP3fWd3ogWV4+LpoJpzeZ99wTCdL4ZzAbma5HnP46+gRXK02I8x2gI/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwjwjcsG; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwjwjcsG"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-137335bc3caso7138062c88.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748688; x=1783353488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgF+6GMrNePcWbid/ZswI6mC5nsFo7xxmyhTSXIk+kQ=;
        b=UwjwjcsGczXK2KhC/LRZROmM7hsBS27qWrxC0mMGThhEQR0U6mSIA3k+iXyMLLobFq
         FFqMrw2SGofD4WuN495NzNVQFj2RISzdna/H7lvZnbG7AyQdvo7dZreQr0a5J2Zgtuqg
         GyHJ/s+pfd3g5WRTbLTA4kWVx1i2NvsqO94nXb3NXEESrqXyzyye9TJPS+yaLdXtSNHD
         yz6AKlttjBeHra9VTZDJnQCXBI4pRwaAWSexaHhCUVqed6Xxhy+GjKEy8xr0vBwkMq3l
         LM7se+88xgrGulyxMfvWzPPtWIiZDMWNedxnf5AFXWO07kcdQjSFgtexykw34M1I2uZm
         8Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748688; x=1783353488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NgF+6GMrNePcWbid/ZswI6mC5nsFo7xxmyhTSXIk+kQ=;
        b=artulEZII0TG8kt+kCVZnYaEGtuklOhrgA1gSgO0EKZ8q5GGBDCbGaAXvOcjZ1XE42
         CYTdooRhDDFFEhqmqA8gmekECv5lQ8HNk/E9sUGlyfHBuquods16YeytyvRDsgonWZdB
         FwrCJwrM+od8x+jAIJtv7YYEMMWk0nSTttkhyl2NPQj7vPByw3eIwIYBlzjxU2whXro0
         sijyiB7B/sgWpF4C3yJQSjHnQkEJOq0DQe7+CMUQn0E9SuF8X3L+ho4lz25WQPOeWGpe
         c6eCvtqyCCUvZ6scbTR41fSq613eZPZWiPJ05Qthau5+aY8rOO0J+A6os6NnUGKKrSQY
         Tl5A==
X-Forwarded-Encrypted: i=1; AFNElJ9q7wMrGQ+8UxdKxHn7nXsqII03XFIbINA2skXOnnL1+fFykIdC4YQ44MeKYw0was4wl39oeX8MILc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPto6jGGYrFrbf9WeOa8aVW2VfbhEqMIMYPSEI4n13FRRK5+cS
	4dQk8hUQs2DgCNToWghq/+nLOfUVI8NFsfGsfpKS8DIOjCtTYeTM8px6
X-Gm-Gg: AfdE7ckYpfP/cOTpqmcUlW5mWxErTZSUBcTNqZqe0FP9WWXMsSlP+wgl5BBuV2ScfU+
	DVTCyKLLbmfvAgTQeEYdfeRGeNUihAxu8nS1dTGyIL2anJiWbC/3UfqfrLYfJy28/MtVm3KEG6/
	XnE4lSK/3H+h/9bUS0/zjzjWHTvDVIaW7jUZ7exwYZhybF5UV9Ip3pHGBThQWgRDBniZzu8MB+y
	BPm65uCOeOMqZu5fVsf4jNdhCPnTaRc7gXdycyoprbu+zBMikIxqOs2njYjUcVfS3/5UPfJjqQg
	RmSN6wYkQimYBjab0sxnPTSjNJXJ0HKWXR7m3KxGEkY953pBCecike6Jw2gHYzcnmwpWHy9D7ZJ
	mSrOAsI0URqffAxWGgW3paFHVR8/WilDHq+xmEYXz9ZZT7p2jRbHpyOh0s17ji1ao+m7KjwyIut
	ALDmo+raxYPPuMKM/Or3hAffhISw==
X-Received: by 2002:a05:7022:6707:b0:139:7f71:9ce8 with SMTP id a92af1059eb24-13b2a099976mr65961c88.0.1782748688437;
        Mon, 29 Jun 2026 08:58:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm80459643c88.15.2026.06.29.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:58:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 08:58:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: chipcap2: Add label property
Message-ID: <7d9466c3-1cca-4bfb-8c15-b67812c9bb12@roeck-us.net>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625160423.17882-1-flaviu.nistor@gmail.com>

On Thu, Jun 25, 2026 at 07:04:22PM +0300, Flaviu Nistor wrote:
> Add support for an optional label property similar to other hwmon devices.
> This allows, in case of boards with multiple CHIPCAP2 sensors, to assign
> distinct names to each instance.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
