Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D14A1FDE31
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 01:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088425; cv=none; b=S3CgcYyxJBRD74dwBErbFmIBZ3bjLPaSIBD5K/yEH6y/TyIYOcVaChMLanqCMBCUNpZFZtAV7z0xXkzwhZ6pxt9zbkXgCgOGAXwhrTcFvFxuwmjv3g1TTP6a8qOhWzxCJsWjH01Cu2VEdtpARg2QOCMVjQBEUF8xVXPGfkuzqOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088425; c=relaxed/simple;
	bh=OqXFjvnETKnZkgSEP93LpkxnK50xsFmFRYWcS7eArz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKiJ/YqM+q4N9SqzBgx8LUmRxM/Y+3OJ/iZ95DcGY694xMQzTzDN8nMFLdFDRPXItjmr0i4najeUo/rgiyh+Ne3C8iJsbKmQIZTnW05kfuHFAr+B5/t7DtPxnKjOPiAuZpMhxSw1lC5EjfKUr8YJtTZWda0Pj8Y0ey843hIw9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDR+44zX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDR+44zX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso4187925ad.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 18:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088423; x=1789693223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OwtI7CWlRkyrPnrz2sqZ6vjS+KPfHfly5lWTKQf1EFk=;
        b=mDR+44zXbEz+pnRJXyLZJVyXW1WU4s6WPpjv1wimVKFRZEZnLNOUMZcXshU4+wYogc
         s18EEfu+9t3xjQCgH0CsA4nT8NsY8m0J9m9d2cDDoc9Ffz1RYInJU+MUBGpfK5sYv3W8
         MfUSdUc9sjUDURJquKpFhJyhVpkhHnCHiJ3Pn2VUE9NO59orkO1MYUL5JybphNp5k9uR
         SIYl+QUqrDhbI6wZzy02IQipq+FWKOD8CZe6fAmNJxNXZoJzbJTyCP6oCUdCT4JLvwrZ
         Nt4lLOKx7kNI905ZbBKMwO3mjSSZBR0FniSO3cJEzHQPzvmmxiAqCWQmlvPdRUDqnC6b
         ywFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088423; x=1789693223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwtI7CWlRkyrPnrz2sqZ6vjS+KPfHfly5lWTKQf1EFk=;
        b=DgLOgQVdbIMBAZll8eW+9EzvnpBgHlQ4XRWP4izC1sIgEHQYI85kh3GXkTCouCSp/N
         iH7JKn6zr8fZeEG8BkaQxRHyEMoRf4Ixl78iLdlJa4kDK0cadAdwHBaARY0rYs4M9pml
         Wpv7yzShXxH8ydJsaFq9c0ypFYXhUpTtQGNV36w8Ci9vN7k6GToKUpCtO3zAzLzs9829
         Kx4USR5ej1dylGh7CbvLFvF82/A+GctsQ9eo9w1orCSp0313/yeedy2BKH3CqtoZweQh
         WcG9eHNGGuZ3rQisjnHRJChytaPpQA8Fv1AQalNzX8M94Z2JkFb4ZSPsXuk0Ess9MSBw
         TcxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWu3jmLloMZOjBHqqCwTWPbw6kzHFmKNuDWmWSSF9U1At9VNEJIcfg97Wal2JCXYl0mxP2BPTgiSs=@vger.kernel.org
X-Gm-Message-State: AFuF++mVcmG7cq3gsepwO/8ifQ6pikPms/zRSSviThHYzZJz4GH7pm/K
	Keq/Ja2hrWJVo6zZsMFaAICQOf5iMH6w+2FLdTNCH77Bn/e5z4JaL9gF
X-Gm-Gg: AYBFou335f4k6xaTCbGSdFAfcapjZkrwuifTWZyZ+wkTGkwWXixT1fqvZbRv7HBM25+
	4Npcnl1rnOYZ4Cemub9wpIgFlVAREUg7Vo+nRdCVXBMHVZxA0vM/5kMmAAQwtBbGC86/3Wy/Fr6
	LRw5juEggdnnzg08Xqhhg5shmO3ycjyN/NeAMJGjCwLUsF8QQVV3Qu5s1f/CeXUJ04xdl4HFZO8
	DuaEetH9XWPryM1KdKyIH65e3c7vInv9NzVw2xNDvT8qTZE1mI4IsBzUf3z1E+IYcGLGcf5VHoV
	fOdZbkQvY0CjTub5H7W5BtHCNZcxjaOs33rZFUxTzfy71OQp0foXmP7vbEhThOVlFOGi9qmNoAM
	5foTwz+ZYl5RPhXLkpbGhZaN8g5CLtLAhp3PGAlovQICnSq0KVJ51/kV4K+/fCLfxqdquPb+d4n
	krL7z0AKjE93YqLKSA2+1EBFB6o1liByxVOq2SQZl3/YogmtRxb9WdWTC23hoTCY8K1UtZyPI/e
	eqF1jhCAstTPdQ6AuVp71U=
X-Received: by 2002:a17:90b:1f8e:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39d9bd987a6mr2334224a91.6.1789088423257;
        Thu, 10 Sep 2026 18:00:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm2130555c88.6.2026.09.10.18.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 18:00:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 18:00:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Message-ID: <528d6e7d-dcad-4257-9aec-92a46c7fba81@roeck-us.net>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
 <20260910-bootlin-hwmon-nct6126-v2-1-ee629ab35e49@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-1-ee629ab35e49@bootlin.com>

On Thu, Sep 10, 2026 at 09:02:38AM +0200, Paul Louvel wrote:
> The NCT6112D/NCT6114D/NCT6116D family has been supported by the driver
> since commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model
> nct6116"), but was never added to the list of supported chips in the
> driver documentation.
> 
> Also add the NCT6122D/NCT6126D.
> 
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Applied.

Thanks,
Guenter
