Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23DF36683B
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 14:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163341; cv=none; b=P6JNREIxAV6zmH2RmSfvfikKxEZn9p2Q9eBqgBYTaVInEtCkQkQPAjmZbca5PUkpWXL4IKn9KwbWr9D0yZZyXK7BC1hABVolje/1PJV2aYeiHBzp/k0C93N/jMjfxMofzx9o80x6Jdfjav298WqOrh1iN59W5TOO6u8q6z+nUb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163341; c=relaxed/simple;
	bh=YD0UymCDWvCVhyHZgVslw0dtDn3zgJ0QSsp7pv1B+5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUl/HdrsDYE4G++w9dpQYvy+5GkpsGFDoL50om9e5/3HoXUjnmB3I47HmHfrmKw8tBMc4ASYn7GsaTvGJfsAxhgIeJTF5jTXikwCzkqeZwyt1RJaNb9SfHclao/8fVNpfGHN1kfa9sbCORmfwpKl8fhqIjLI7J6+wWhbEm+BoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMrmNSxs; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMrmNSxs"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2127602a91.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163339; x=1785768139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dQ8QD5HYV7j6QVAlE7qJa2eaoG8v8Hk5kMhrUWBN7qA=;
        b=dMrmNSxskvii+Xc1E2DKltI1lQlCGqzxeT9bRwN4VZdv5Ywv89QTg1FrQkwAbS+12i
         WzHa2+HSEW/9p81lr0FPgK3dImQvb5TOOMzPiU7ZF93MO13NOMqKVrX/cUsB8cIzTGkK
         a2V6WN8nUZUbczURXKw6gAOVtPp5Lc4GxwkEf8KbtXM8gKstTVbVOeLwMGnyQ5RHjBe7
         gt78jYhmJ3NY2/tBdb+Jf+Gz6W0a//M9dhTtZSWnHdfwV66TyJVMVu32kJ+VtlMR8l1Y
         CxADjHmcStU5oxtJPbOYr/FacNhoboVAbew/UfcEG1CVvFYqxq5tLYkH2AxeMucse0q4
         dx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163339; x=1785768139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ8QD5HYV7j6QVAlE7qJa2eaoG8v8Hk5kMhrUWBN7qA=;
        b=eTSHGwNGXKXlsBU3TVRWJx0oeGImyF+zW23FTSU/ZPoDxnn71nOmbq0G8wivUycSdx
         a2uLr7fb0YSQm06BNBesKsTVSd4M4c1sDC3BWvXps8CzmpCYaV2TBztZUP11+zNgGQe8
         DQeUfo9lGbU6i3gZ7mzARGL3DtT4Y4UPnfeFJDaoEjOCW+eIc7uyawS997c/UqDaI9xS
         B+kGfEkwDawd6fFQ4/UFDzV7F6oxyr+YnEdI4inaj2HRyukh2ynFn+dgyL6U2NweDE62
         ahyXyNMSEl2oxe9uP22j6wSDYZZqp5hivg6x6vI1UxbfN2PLYwmWV8OUs1BFQjl5IMHu
         m5HA==
X-Forwarded-Encrypted: i=1; AHgh+RqImIJ6bUP77f+Qjd2hEnAoX/8YXtjQPTfga3dBmEklp8CwgOizh9+cSHHbZp1LPGwB/q2+1QAgx2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5OU+HfSnxHfrOqj+FG1cv0qTpm4+lodTAaX+zbKIr072nK5mQ
	LLNbyrubebwcdz59VsZADyzrZVBr45z/beuLvyq9xNr0X3g3t71kEYp8
X-Gm-Gg: AR+sD11rMYMBSC+1YdHJ2TymH4y9bMXBPHTaKJfgwYlZjK8djTY3HlmjSkFJgsyHIXY
	kHSh54NLRv2Li34A67fc8I3PXZKQtstanUSM5UneFTA5e8pzqn25yoxSUHatxWjE9dGzxx1xKKA
	G9trg8QD7T5zHsBcwF5LvtH7NlQ6kYTnZFbDCMrVMhKGZ3HZwWux/90H+ESUwQKoqITyiqWGy9S
	QWHdhb5A0oxt3CMyye99RUF1MSWKH7yHPKCdVHISDItG0SJt8aZjNG0HhjNloLDOViKkr9hf+99
	ifjpd0fqdlOefzWEidgLmQuyqcBuUvP8MPQAn9N70WN5vwr4Dh3l3MML8OYav+nOqEWRvRX7VAu
	R4F0IwN5+tU/LIZB0mzYZepl1AbCNVvwdCbjgt7wCXeM267WOohWLOfAGgZXD0ubnvb/Nh/AAuH
	St6fXoWRmIy5LSJ8U=
X-Received: by 2002:a17:90b:48cf:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38f2960eb33mr8297161a91.27.1785163338620;
        Mon, 27 Jul 2026 07:42:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e52f0c6f2sm27211956c88.11.2026.07.27.07.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:42:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:42:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (kb9002) Add documentation
Message-ID: <6d235e17-c067-4cf1-ace6-dbce05280d8c@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:40PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
> driver.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Applied.

Thanks,
Guenter
