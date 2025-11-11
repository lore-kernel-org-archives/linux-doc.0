Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C79C347BBF
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762824318; cv=none; b=iWgVpmC4cYQoPMCSNTv9CQ+Y4I6pYukmIVnawuAPXTYQ9DyktdWs5SaToD/mf0kuoNChNiKfOkMjDv4avwTzIRVUzsKs0ldHW+43uuJmOK900t/LdJaUPrZqIW0fd5lhAUnYHgTO5rUl0sLdMrKBY5BJDXdON8Ae4U6zjfBMRHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762824318; c=relaxed/simple;
	bh=VG7yr5KtTWb6ZDQWVOimL1t5IglsNmLB3eZ+0cKlMec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jq1byqeo1EyNQmfsOnfRc0iudtG6uQeOxRyRg34UPAy5GpCoClwgxcou7QjkBCwn8i+HwtBUjkcIfgauhDUDzKQbm6y3j/5V0dIydFTo+1B1k9sqYyVOCTCtgZzC2DcBCAp+oS0bflVoQzSuMlJH//KGKohSsO/mBE+EOD2Xn8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=AhAlgsxo; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="AhAlgsxo"
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-44ffed84cccso651144b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 17:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1762824316; x=1763429116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su1UwbZ4Pt+1NiFLASvdJqDu/6MFhpiYOP6WJzJr3rs=;
        b=AhAlgsxoCCzGlp4XNFihxJ+PrLMWNxhT57XNbvUKhytbZ9N1L6dHdDQNvX1b5NUAwz
         nNgDYBzBbk/JXudt++cH7gUR+7dlQSNilx9IezCjbRzwL2CUWwHj54cnZUYznB3BaPpZ
         k0eK+9zSqojhCtnwKj2SCvF1gY9ZdElB0kyxfR5lsueL3z04SxNgjbPGjEFwMSHmnTt5
         onbI0CQN5Wp/payRFye+nY5Hv9SQtiBhiqeUE+2AGrQNEpKEqaGSdo8z1ZNmTh3I2oWv
         08DsW434IMwrVhdj5pp093CH93HZQmKAGit0G0TKgMSs4Zuq+cpAJl+k4+VERYs2PqKz
         49Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762824316; x=1763429116;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=su1UwbZ4Pt+1NiFLASvdJqDu/6MFhpiYOP6WJzJr3rs=;
        b=F/bd+Imz79kkL4unWS+dVXfdLlxc4eIwdz7qFnYRsSVJhCfsJPHnzE7qnvsAAqsDi5
         6dUHHdnFpW8l55g4zwbox+lAhoSZqQaa8dnzQyP9284zF1ZGVJ6faVjShn87UD2AyKCh
         9u5OOlHMabyDrAADRK694SjYKDBQ4wrf73AYIEIutAFlVy96iiQBYWklrtYOoIhKv4ez
         LltELDibvin0ONysJ66D2CjZAfw0HdGyB1siCFPYBT+Qy0RTT3Bs05x/VRVif3Cp2XAf
         F/3TmgpDXIGUe/qWiJTo/szNlImZf247PiYbwim/0/28Tx7nv7RLwAovgQuhv/0WGh03
         O9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBcGTxIr8cfbzXzXaf+trTEAZe0cSdUMH4IaxNPPzB/SRYAiAAEVvSCBAQpb5KrlcKM/npQ1NOOoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjF3rLxl0Cc1HS7PVM65HhQH5IN3uv0QcsD7XjR8kM8ti+VcKa
	qK5cf7iJLozT2r2XN2htHQMwqwrBkhYYTf0nHGJPP1T9esTM+RJ/VSdkN5XIeg8XIi8=
X-Gm-Gg: ASbGncvTcrqifz+CjDP1hnnThoSsOH+6w8dRas2KOKVy3HebK0aW9jzXiv/5mXrl8dw
	vQu/y3nPavRhqKGFzUzHKDeQTVDBwe5S0pf6uHWMiCwV86l+DykUmJhRhctvUeQGXbzzT45AIqv
	QjYRPRxk0HDZ5LVmvXDjrV1JQyQYNI21fOza6VZeUkm0espZS8IPnRIE3k3ovn9EeJ5On93I2T5
	8dRdNxQ1OUZnUJnw2iZzp4KIvyoRMLeQiKKxaRK9ySzewigcI6GjYXpl4v5VldhdGvE2mn+yuKz
	O8qQwq17t8+skTTFt4e7TtWWEXgUfa4fYE8md9uk/8qGgEp0FJ9Jmga7QEqq5r7REf+Dv3TOurU
	VS/ZCbi2PfCVpdOsAKl0aSmOZIpyCeWV+jdB3eFe92y5RtoiNf9yNWpJRpXKMxUnLtUX7q5u5+M
	GwQcRCVM3oclMFkQ==
X-Google-Smtp-Source: AGHT+IE/jcIXzBpJuV8eEIsm7iQuqvWqvxk9u55a2Tz3m20gqxvO+0WNmYzTYKtJLoO18byZ0z0hSw==
X-Received: by 2002:a05:6808:4497:b0:450:10b:a533 with SMTP id 5614622812f47-4502a36c9edmr4842796b6e.61.1762824316148;
        Mon, 10 Nov 2025 17:25:16 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b4e9:19a3:cdaf:7174])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45002752ca9sm6359729b6e.14.2025.11.10.17.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 17:25:15 -0800 (PST)
Date: Mon, 10 Nov 2025 19:25:10 -0600
From: Corey Minyard <corey@minyard.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	openipmi-developer@lists.sourceforge.net,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] Documentation: ipmb: Indent boot time loading steps
Message-ID: <aRKQdoTzacYn4skG@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20251105125449.45643-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105125449.45643-1-bagasdotme@gmail.com>

On Wed, Nov 05, 2025 at 07:54:49PM +0700, Bagas Sanjaya wrote:
> Steps for loading IPMB driver at boot time, written as enumerated
> sublist, is indented instead on the same level as its parent list.
> Indent them as appropriate.

I'd like to get the review of the original author, now on the CC list.

-corey

> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/driver-api/ipmb.rst | 48 +++++++++++++++----------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/driver-api/ipmb.rst b/Documentation/driver-api/ipmb.rst
> index 209c49e051163f..dd99d034272b7e 100644
> --- a/Documentation/driver-api/ipmb.rst
> +++ b/Documentation/driver-api/ipmb.rst
> @@ -48,35 +48,35 @@ CONFIG_IPMB_DEVICE_INTERFACE=y
>  
>  1) If you want the driver to be loaded at boot time:
>  
> -a) Add this entry to your ACPI table, under the appropriate SMBus::
> +   a) Add this entry to your ACPI table, under the appropriate SMBus::
>  
> -     Device (SMB0) // Example SMBus host controller
> -     {
> -     Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
> -     Name (_UID, 0) // Unique ID of particular host controller
> -     :
> -     :
> -       Device (IPMB)
> -       {
> -         Name (_HID, "IPMB0001") // IPMB device interface
> -         Name (_UID, 0) // Unique device identifier
> -       }
> -     }
> +        Device (SMB0) // Example SMBus host controller
> +        {
> +        Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
> +        Name (_UID, 0) // Unique ID of particular host controller
> +        :
> +        :
> +          Device (IPMB)
> +          {
> +            Name (_HID, "IPMB0001") // IPMB device interface
> +            Name (_UID, 0) // Unique device identifier
> +          }
> +        }
>  
> -b) Example for device tree::
> +   b) Example for device tree::
>  
> -     &i2c2 {
> -            status = "okay";
> +        &i2c2 {
> +               status = "okay";
>  
> -            ipmb@10 {
> -                    compatible = "ipmb-dev";
> -                    reg = <0x10>;
> -                    i2c-protocol;
> -            };
> -     };
> +               ipmb@10 {
> +                       compatible = "ipmb-dev";
> +                       reg = <0x10>;
> +                       i2c-protocol;
> +               };
> +        };
>  
> -If xmit of data to be done using raw i2c block vs smbus
> -then "i2c-protocol" needs to be defined as above.
> +   If xmit of data to be done using raw i2c block vs smbus
> +   then "i2c-protocol" needs to be defined as above.
>  
>  2) Manually from Linux::
>  
> 
> base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
> -- 
> An old man doll... just what I always wanted! - Clara
> 
