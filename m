Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1555A26FD97
	for <linux-doc@vger.kernel.org>; Sun, 14 Dec 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734831; cv=none; b=avGMoPVDfT/V6GREgrW2p5cdpHhjy5iz0iYGHRT/07ucH+ajQto8M+/EyJzpHXaJmGSw03c6OJqnZ6VH+AjSOSwNcTrlMu/FM+6VGa5GSRphswQgjDVMAVZPOPYE17yrOqbcgIjqMSDjbKHJJXdi5KmQXHkvM/TKJhn6sH4Z9cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734831; c=relaxed/simple;
	bh=c50Gd8v5QKCleNqJ7l+SThxze1JZQeMJtMpn2/iBFfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9Zv6xbhjWhGN6LdTay1ycwlEvGRhciGCP2wINUzWSnkr0bUEStBMsleWA03cBbEAqZq2uTI3ZVZ2Eo2XZEePI/nfs7xwFeg5Z3FgFEQ5vDkIRkv0mGefdJEgDgPqAa4EIlO+7s/33c4elYaKW7y3FhQ5yFecHmLxRaIWmjb85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU9xvOb2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU9xvOb2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29efd139227so32821885ad.1
        for <linux-doc@vger.kernel.org>; Sun, 14 Dec 2025 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734829; x=1766339629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KGukLpWYjLHBHtod0Ho5IwZFfjbtDeXI6ktOuv10K4=;
        b=VU9xvOb2CqVxrGKZPcf8v7hGBmKafq4lBH/3HCTtE4MMv7UoVrBN7vq/HtUN1ZAUMQ
         4KDfvqOS+HHj0GyGMS7qE68y932MUwZIByJNB1cJLZTShYLj4cBfwlEssKNk7e9D27kk
         PNZC3owTBXkzi3iJC564D0twl1J6JKWLpumatUEpKwDiR2vFmnmlO8qzvRNcw5cJ7faH
         khl3ZM21k2OsH6jygZ7p/xRgTfF7n1DmjxvKGvc6wyJK1QdaYCR0EOLG0W+DT/m42wuO
         NaZImg8UpOw2MWwbupfx4YdL/AShS0BRB+0LxF2H4XglkF2aCMcYeFXzs7j4jueT8oE4
         zEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734829; x=1766339629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8KGukLpWYjLHBHtod0Ho5IwZFfjbtDeXI6ktOuv10K4=;
        b=wC0L9HgDB1r0x5TQqR5EghlRO3dgm7VOXkiecvNT536Fu2VjoHXIzrQcUrIKiJC8WV
         eVan32kbQD+7PyvEzwQfe1YYIVI5J2Sv+BZYHZRTmsU73g0495UUOIaPxnjO06E5/UWz
         AD2gM9pbpGKKD+evsFCjpc4rO0ALG/+BzK1Wht1D4MnBl+pOXtVQqJyvkboEe/eV1lRe
         WKm9/PHEncbNkHDcKWjbZ2wuGdapJ8SyWuVkSot7Carf+DUl9VIVWyHHVTHjzgYIJSDn
         qYgplyx0RiMXjLjgsdWqJx6Uyqp80sj8P/gKYA9xdjIOvAgDpWXOGT12RTA9oVBCg0AR
         3ZNg==
X-Forwarded-Encrypted: i=1; AJvYcCVjY6USQGQK+r7Lt78Zn/DcE1svgnTRPSAH6EFYjueUq7XlDl4cKRKrt2vKkg37iabrpnwloZFgZok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtMgLdMQqGGhdbqeoIoCLvrFHRUTKzeyXGwj9Rqd3Mx5nBcCJS
	W/NIgZpjgKa5hp8OMkSB8rCf0BUYquotL1xzNP5DBeiQJQ5HdQa2p/ap
X-Gm-Gg: AY/fxX4TAUTFZOt24vPJAwgnpg+HLCTba4QadR+3GGjXRd1gU3ShGq5TQeQgCruPKK8
	IHa6TgxlVmOuQSEelP1FkxW8kZ72sbnoKpK74xZj7e5Ja7uhnU3MjHxdeWC8Jm0NQ9lXYo4JEE3
	5RMMTqH1OzymrKy6O/lu4ifGUlKcaXw313zNOUxKVqGb7HQ4xfUo7hSfWonz7Z9VCZqSOksI5q1
	F4MJOODiXKTx8BXz2o7jT9/zKYwsYvwrHd1413klPTrG905Q13n6a9k1rvtVH6SjqlB11B8tDL1
	6eodVXr/UKFqLlMduqYc+vTFst102JZ0GcxIK2CL1op4ELRpB2Hq7SqJrTQ+Vtb8BDWLfRDyJoP
	+4EPY4EnquNUscC2mpeweBHLoyfzJp9N84bVT2j1S5sflSrg3CQRddYORK/UF/r21PtLsxn+csp
	pErO4LmSGFypSeumTzx2XLXtpTscU13i4wJw==
X-Google-Smtp-Source: AGHT+IHAviQf4ia0p6NyC3wVjqMp7nMUItVjAglj8tQZv6P9vbwiRKK9MnU1FsFZkb9HCmdBsCIiKQ==
X-Received: by 2002:a05:7022:e997:b0:11a:3a1c:6c5c with SMTP id a92af1059eb24-11f349a48c3mr7341124c88.3.1765734829334;
        Sun, 14 Dec 2025 09:53:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm36744795c88.5.2025.12.14.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:53:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:53:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Reis Holmes <reisholmes@pm.me>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add ROG MAXIMUS X HERO
Message-ID: <e739db0f-1de2-427d-b719-73b5efd57f71@roeck-us.net>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
 <20251213200531.259435-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213200531.259435-3-eugene.shalygin@gmail.com>

On Sat, Dec 13, 2025 at 09:03:42PM +0100, Eugene Shalygin wrote:
> From: Reis Holmes <reisholmes@pm.me>
> 
> Add support for ROG MAXIMUS X HERO. The support is incomplete because
> the second EC, which provides part of the data, is inaccessible via the
> kernel ec module.
> 
> Signed-off-by: Reis Holmes <reisholmes@pm.me>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
