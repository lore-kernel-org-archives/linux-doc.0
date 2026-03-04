Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25713B284
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661591; cv=none; b=hFvklPQ5Y+uKQUQw4H8Js8zrrTAICb4Zkjz0yuoK9/qI1GhT3dFcJXV6EHJfjsB1ibBbLGnJ5jBar2Oli6TQI59ecwbXEnjPamu5kNQMtcDoG37NUUmODpFkqNYXH2VptF15KNM1HfTSOiXVoHbWUDjIYUEYP3QiLuVrggcaOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661591; c=relaxed/simple;
	bh=vJH1V6u85lju1D2ht4Tr6oMc86eTR0Y62dS17bcaRDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeS0a0qq4edGMRgOePQx7Z8r9goL8yjbKMJvtjwL1rCZf1mQKXzLHJEl19U1rY4DoZHUkKesvJBLhYr+kElCGTBwdvSfXoYW0SyaA8rfZTZzRt6XPcUiEhtqMaGgbANtyOo0wx8+DpWA3NmxKUcTWJyIAPJWBkiMrjktik1WaD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBZVL396; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBZVL396"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1301817a12.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 13:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661590; x=1773266390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYJ27uup4OixsS7eF7/w7BH01G/LyWR+RSEXoULjw5M=;
        b=aBZVL396rqGAdh0Jne6zlQoY94UpNimaHXmhYbnweX6xpOFNlaDtH/CxeKLDycqqUy
         ijIFAHzxYhgxNK4xBqTTEiG2mAuA2B+XeHWITUgdHmTzjybD5UYO9uNBB/uJTOaPsCEv
         Ov7fjXTxDczzxCmqc3Ef1MwP1mWO1vReUt8k9zotd4RhxiqiA+nH91GTEOvTiiEkBjNl
         CuLwd6G3aMQCiAnduuFC+pO/O0vPEqFIB17zZQs+PF3zly6GMSYEUyxgMxD78/CB/U6o
         op4hRbina87S+G6YbYG4mpU5fDXCoKsRaFWif5+xCKnZipRYZ/d7YIuUkjoSbyEqTP9Q
         Tcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661590; x=1773266390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYJ27uup4OixsS7eF7/w7BH01G/LyWR+RSEXoULjw5M=;
        b=CYe4c+yt3Ljej6vmLWjXk5xQPkuceCkYu2/rh7ijX9yJYl8tWlaGHEPfG4t2sLaFYu
         kg1DCmWoX5plaDRfDIol+1Jc1ywBUxRASfzS6HwUxfuEUtZdslUguInkHmvWUXWE0MRw
         zTgF6n/e5MntXA80iG3LgHZTndiVUamVYBnCHfHBBTydsg+hwHcx5gUYhFtG0IVxymNY
         fvvmEmdaHptqZXYCc+FIb6xxJBheOMYC++o+40wGYoCQTkGmVLKGQVkdZvDeT0haCrdp
         qXXb7y7tVZAk04s2tRmjZHc0jTgyaI0YEv+4pHkVh7Lm/Ly7mzCQDjdJmTDMa/mAmDlS
         MriA==
X-Forwarded-Encrypted: i=1; AJvYcCXICtlCDjcTnxzKKWls3hd7An7GOOYgT+zHEqSZe1Re81rrKFzposNQaiQn+ykgoat2GSlIwdHg8Cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfE1JdiDVJ9GEZEWjKq67A2Hr2t5u8BuaSAzaJ5G4EQbLVKiXM
	jjaPM500N5oKJXDNYIHlmzaldDZ3h1NPZ/nG84KDHzmCgvE72ecqb9Ek
X-Gm-Gg: ATEYQzzpodbclzdnmyiMZusADQlf2p6iE8GWwf2Q5ADz/D57CNXTvDpG76rRaH6LEVK
	sEje77N8fXnXFWzlYL0Tzx/Y98CYjmqfUwob2AFNRVBuZN3dZGXVeUYHqvJ0ZeYcM5k4uGfvaL1
	H7pwoUJOyXVKH6bm0Bq9uoQXfAmTwoSepQF+mTO3i+woQ0tB6GoNydptjO0LaMtp6LyYGBXW5Mg
	G0JujIFyLyGdoKk0DCCkcG2BHebtSdkVZqIDzqsUrzbGqwSU2H5C80V2aqdoI5FyvD5wM7YChm0
	JcLsJkiT6XDx5RowMJKOdMCAGRMV2a0H25P1pkMvy32BQFtBQu2+N3bmvqvpMvVpiGvzG4xQ5h2
	SFjH5CdZzAiH02ZQ/fjNHtw2XnXisq/gXaxJaW5/au19IlRrMYl6SdL1JcmkF/HRTMWX6ltwa/p
	Vptk4355n4+4BMi+cqfSoD3gSuqPUFR7jdfAJGuknydYkNOk0=
X-Received: by 2002:a17:903:19c7:b0:2ae:670e:309f with SMTP id d9443c01a7336-2ae6aaf6261mr30302195ad.34.1772661590201;
        Wed, 04 Mar 2026 13:59:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4f50ee6fsm96593135ad.85.2026.03.04.13.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:59:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 13:59:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] docs: hwmon: ltc4282: Fix scanned addresses
Message-ID: <8d90bcba-e713-4c61-af9b-45e00008ba88@roeck-us.net>
References: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
 <20260304-hwmon-ltc4282-minor-improvs-v1-1-344622924d3a@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-hwmon-ltc4282-minor-improvs-v1-1-344622924d3a@analog.com>

On Wed, Mar 04, 2026 at 10:17:47AM +0000, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> The LTC4282 driver does not implement an I2C .detect() callback, meaning no
> I2C address scanning is performed. Update the documentation to
> reflect this by replacing the listed I2C address ranges with "-".
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
