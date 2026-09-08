Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C95559CBC
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883513; cv=none; b=JfmWpPx6i0awftBePZxCUtv4i1//ffopzWjeUTZQZmrzY39YpStAY42/MgQkCcCCzRmh9sBpyYYAJjHhqNb+HdYizSx5eYA/iEvk6gea2GL/mKeZ80Or7hZpIl5yp4fWVlSRsB0evReVx1WTAidbKKszwXaqAcfLo/UZv88agkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883513; c=relaxed/simple;
	bh=fSR0OKhaAXzCGXCd+vmXfghPnZaUrM4xUQPA8J2O/tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lk4HWil5p713CMcEZKdM9xz5FL+6c6qkF/ZcYbTsjW50E2QEkFsC1dXSRgD2GKjGKisoxkSn0JRgJeCgUrvG4HrrmAsTnkzQ8b3QrYvC/ne5t75PDXHywBt+FvIKr5YSwUqEdmsgTgEU5nkkqSMuofFhVcyt0OQkqt2JviIQL+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwMeheS6; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwMeheS6"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-398a5aad413so3715723a91.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883510; x=1789488310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHrvMGywSx2AdPNWfAoWeJA674yVmyK7qs5cNnAxFf4=;
        b=LwMeheS65Ii/bw9/FGePjWy0hPF1cn2mr3aNuT2JIALFOsgBuOxpIwzHBJE05jQMAZ
         uPbX+JX+xjl7zjxbBN+lWMgq2Ezmk7rPlCR8yjAslXrOVtrGEy/cm2f/bWh88BTACczt
         44SDYKWvOKEorn8g2qZXUeWQgft6583Lyr93QQL0sKxHTMvQeufYTsy25457/MF6z3pB
         PXnxZV+J2jvCwKFd0mDsbpK9qftVQPuDMCR8OWOzKeqM54Pd+C3zZ25pOhVerFLIppT7
         tGuoVLgEiaB5Uh6uSm4SncE+vGqLAIxFns/GPpK5TrdSOPN+Y1YvXL4F4zeStlMaB1Ys
         8yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883510; x=1789488310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHrvMGywSx2AdPNWfAoWeJA674yVmyK7qs5cNnAxFf4=;
        b=aV5Uba1c569cS22zgYewqelDP9VpoZ+7szaFj8Kp+YqJNN1FirgjZSVu1bZq4sBQoW
         vIlQuabzOQyf1S9vTAnyfS45au2d6HYPv5PZUmhmXq4kF+xlSKEoK3kQcT6CmutOBsgM
         Vk3iFNWcy9BIm4OBON5crS97WgeZHC+LY4KWMuNCslCqHwPjxcFF7RIuiMtFaw32QmYi
         xVbgEVsXNL8bFi5HXTUKgEcRMJOl7N8dSZC4prEtllMEuWE4rNYAVIQ1ua0dQU+eKLrl
         l1ysLUY2u9WhZ1EABYthbitFWZ1VXWRYNPziSAUJ2A/4+5IyCNbth1ZRFQlQgUl6IIJq
         W9kw==
X-Forwarded-Encrypted: i=1; AKwUvBzihwrp4v/rHuGGbmcNtCUqgym1ab9+L5c69zmcSAz01fvYro9vDo1f1EquFF7QXfSdC0Gdky+DBqg=@vger.kernel.org
X-Gm-Message-State: AFuF++nJnokU9ZNtUz4aGVIfdaBtKE2CgKwFYZm11mMzJrjS2dQdR57R
	DfNQxXVeIBOkEVWxN3Nq7wdZ0sydav8DL/hof3wZbAxaryXxUUBRPHWp
X-Gm-Gg: AYBFou1YAr6UwbRYzQXkC2uSHeeqsPMFpAXq9QTArCzzsvi2A81bYgJrr0ox0AjFsut
	YrSagc59xFOxTKBV0enNJb1c/KWn/3MkOUVoAZzmYaW6/wOnJL2gDVtwHB3aXymyCL3eN1bWhhv
	hi8I86C+DyHsg6ltnb9ZHt3OBIHtgeVDtukeXirTYRoxCQr27CT/BlVOyrA5Oh6D8K24El0BnkM
	eakAUOWVa6OKcSiT97iDT7zJRzXe+9K6CYBEb0wg6bQ+HeXQnWahXq0+iQ7FhIgi2Rl8anXITmL
	sfLv3SQf7NFutpsPhbFb+nxYnIR5cdH1EidVNXQY6JwT4sTF53IeZA6iusPVtGj8nOcKSj854rT
	UZqApfMtwm4PszFvi11AwpmIFqKyzL8C0x8cijSQ6cop5AIViNIg3OdMBw8fuGppK3k4Y6L4w/U
	dgy5BdrBoFgDvnLuwETLssey7UyPqUJBPztwVYbGNA9WdRLv6ljXdu8J4hh8NuDjIdsRSAItTMa
	A==
X-Received: by 2002:a17:90b:2884:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39b262ab44emr42903754a91.20.1788883510286;
        Tue, 08 Sep 2026 09:05:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcd243sm34225571a91.5.2026.09.08.09.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:05:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:05:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: sysfs-interface: Fix bracket
Message-ID: <897ec778-ed51-4698-80e4-25326d7828ad@roeck-us.net>
References: <20260903161204.735276-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903161204.735276-2-manuelebnerli@mailbox.org>

On Thu, Sep 03, 2026 at 06:12:03PM +0200, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
