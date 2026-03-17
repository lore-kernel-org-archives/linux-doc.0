Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71C3E9F77
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759346; cv=none; b=Av0aORta/q8zDf2pzhGguIqAcxnPDoveyfYqYHvIm78ZEZmRVd8xWNKF+ld4B1O5SMbL9qHPGoLfsF0zLAy2Axr6t/ZD8Z8QA/69ujHf9pZNWzIkWOAEbpXUH4zgajjC1eHz9GGWPovfblOOXQ5RiGSinDoCITZYoqlB93E9pBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759346; c=relaxed/simple;
	bh=mS7Y1jpdA/X1D7xZfkc/V0FkKTQRR4fZUT6ywTlM0TE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyDpka+w0a4PsfznwgQFvQQeqQ6IRx/DKyFaCttkS6bCHFQIUdfAnnBeczIvb3nbNWhoPqtY6+5rRFY7FaZzT4MnaGdSAc0ptMUifqaFe1Tul8PNJVVMObKOATIA/D/xazeP4xQWkttnxMjhzvumGDTpI6vYkHiATBXu88nD5wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+KPHXSY; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+KPHXSY"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0cf039a45so2929333eec.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773759343; x=1774364143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0yNjjVCdiNMRDtTfhlm/yv6eYoMsY3Pqr7cf9Cuz7UA=;
        b=Y+KPHXSYVZW3dJiKRoNYvdeBllAvmkJD7NZMnAUnUGTO/KnPklt3RaBsObeO2Ou5oA
         ytqndF2lVGqm1F4PxWDVW57+U7P7RUdzZbdQ9oJT2bBCGT1QXLNPinAVvTBs/lMJwWTC
         LXDOtQ2MACsRNxosiHoRz5yvWwbJTcPmVHDculS9fKuQ9iAdVbiVuewcyxlvyEpflM1U
         olADvMUIN3CrdByyxsq3A/j3PL3kqdS4sXXF+Xyk3HhRWUo1R7ZCG51Vgn+zBUm5TbYP
         qQrYuQVf+pO3xBe+Db66bYVFCXqnFFqQPLfQ0rQaEIOHkgFU8Y/l4IqchWgpWmEvDuZp
         JV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759343; x=1774364143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yNjjVCdiNMRDtTfhlm/yv6eYoMsY3Pqr7cf9Cuz7UA=;
        b=J1Is5FJiM19F76hDE+3gGyupqTarRPgak7AsLWUu1rSnDxYrbXFtl19bm0rUuQvatn
         9n6aF1tJUZX77y/W8auQ3BeMguvuzRc6rkPXtjGSMwbmQzRm+sNwtdPvJzPqBIGlYpD2
         1bSY3n+XsPruh/eGYZfCB7AHmeDIy+6sRAcYrBRDtFsOm626FGT5n7o3tjJ1XPkcv1SS
         F7FpptjpwDxde6mraaT+2nliTCOcAy3svomk40z7vnii5UDMd+qwHkPEQgFsYOOFgckp
         j/G+OUVx9Bp1+NVFOhjBQyFNxjgMy8DUX5mWFSiRwzy78Wtt4dDriRF0+a0CtZxlYyNs
         UpYg==
X-Forwarded-Encrypted: i=1; AJvYcCUVdQnmb/P02KlLXKeSm4vCoJHPyseXsPldU+GfR66tA6BPEgWqyVo6BI503HQbUXMfXOsmy2DQUC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2IK1LPvvhPLp64rIYwEHM21jsnh6c3uVVRwB95099NS0/n7AM
	GUP1i7SAdHZ9K6mUnrSs2jLU8QozD7vngqtJI66B/jA4fhuhIsMZlSyM
X-Gm-Gg: ATEYQzwaQLYcR5q1aZrlEBYCMKTH8JmDP0GC0BWz12PKMKl/UV4X75BEFg1LVW/bS1b
	gJh1tCIkjRSWW61OGxnmf8qmDsvgOXm92OOHKIMG6Vwzxr22Kw50+Vtq5O70BciLqeZQEEdQaVS
	rPcnKY11JBqk6AJuPIugZr2H0HpY8WlqgyqwLHprYvfIlbtOiXh4s+Z16iZ613yAB91eY8AeLKe
	o1z9KMo95ZpebTepl6+m/YH19KlwhBbP49yLf29GDGeMuM5v8VihDC0kdtDd3bJaDgylEymWf1x
	erPFrahF3pVQ/h0cMaTacta7x1xpjqwF/VEtC7+sQwEgswm6ftkVQHurV02u/ZjW36D917MJFTc
	yfg3587EzDZJgpSdtyE2tmCF9rrzkp6KBYvyC6K1DFE5QOqDFvCT6T7biov4h9bomsSqjs8l6YY
	bnW1ZwApZkr024lLP8Z/+m5zA6a9MK70PV6P8yeykD0Zm5vQjpYQLZD5/KMR+AbPt8gXDiSHJa
X-Received: by 2002:a05:693c:809a:b0:2be:b00c:d083 with SMTP id 5a478bee46e88-2beb00cd876mr5757968eec.35.1773759343057;
        Tue, 17 Mar 2026 07:55:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3cd473sm18819411eec.8.2026.03.17.07.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 07:55:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <beec0d34-74e8-49f5-b1eb-071a1f25e44a@roeck-us.net>
Date: Tue, 17 Mar 2026 07:55:39 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] kunit: Add support for suppressing warning
 backtraces
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Albert Esteve <aesteve@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Alessandro Carminati <acarmina@redhat.com>,
 Kees Cook <kees@kernel.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20260317-kunit_add_support-v6-0-dd22aeb3fe5d@redhat.com>
 <abkm46TIIBBbuuC_@stanley.mountain>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <abkm46TIIBBbuuC_@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/26 03:03, Dan Carpenter wrote:
> I think this is great to suppress some warnings, and I already ACKed
> this patchset.  But we're still going to have some warnings where the
> warning is the whole point of the test.
> 

Maybe my memory defeats me, but if I recall correctly the original patch
set counted the skipped warnings. I don't see why a to-be-parsed message
would be necessary or add value over that.

Guenter

> It would be great if marked these somehow:
> 1) At minimum we should mark them so people seeing the warning know it's
> intentional.  "Intentional Stack Trace".  I've sent at least one patch
> to add that printk before the stack trace but it was ignored.  We could
> do this piecemeal.
> 
> 2) It would be nice if the print was standardized enough so CI systems
> could automatically filter it out.
> 
> regards,
> dan carpenter
> 

