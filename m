Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7850B4A441F
	for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792047839; cv=none; b=nTkkwusLU93CwY26e9rrC+Pu4fuiWTlM3Thk4UGMOO3cQLTYyuEwYAMuUEmhL3gfRZGz/7cHA7+o/x9lp77B6OK7qCvSE5EbS+cuQyPCxTh5S5uVCVRDG17GzQJpi3FzZzcq1gnF2iLm8+4jmGlD9GN+B71VWxACYy2DbmlFUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792047839; c=relaxed/simple;
	bh=YH+ljlbj+7YXt8V/106ea4EkaH6+7QTpER8ynX/uKVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBMEr2Uoy4BWZiUs7JHYYljw1++RrBZszPriChC5SepvD23blYuj85JscNX+f8WNxr15nw/yuaEVmJJJFSMkk0+EDnBV/KIa5sLQyWyBh3ULJ0HKKL/vL6+0Ksns7tNBOEqTutqLWyjpM+FJDHxqliv2U4axMgiy66kKj/YrFao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=spKdn0e0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spKdn0e0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d05d51553so11073065e9.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Oct 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792047829; x=1792652629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRc1d4pt3qQo/WdkDK7cDhZYT5ZdWLtpTnmXMIrJlP4=;
        b=spKdn0e0uG/N550Z4RIZg/YsgMqHf2RWuTc2FoZoJXOIQrdTW51uUzrXS6bQnqoK5r
         WXLOfB7Z1cRcvyI6q+QprmeTQ+wOhP59B7Fmspvcv8sk50ge4O4FlJbUIMbKZgVZClQ0
         bTTDwwMsgHblIP3ydPHD4ViQucc9uFeDhYDb1dJrjEaDruJeW/fDjrqzUO2MD6ZB477w
         i+oE6f/iayQkQhx/KlM9zvqJcHtUHLONT8hF/jC51GW8Ko6mULdEVSFE+Obn6OPoRdhQ
         CupdlgjQxNH7P/U8S53OisBiBs4D9RI6PIikG4dNsGwkPieDCkPAjiAs61xnCa5iDL9+
         iKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792047829; x=1792652629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRc1d4pt3qQo/WdkDK7cDhZYT5ZdWLtpTnmXMIrJlP4=;
        b=jzaKSl783pHi/6TagrOhq2htf8T7eybqPXh+zu0HgP7eBPXg/liVw6CerHCB0mzcNj
         RfYeSLuk5wP2L8D89zqdp3V7Vhe94SVeDgvyKe0uf4F6eCUOHZSm0G2uqUV4tfPEIMjO
         zedDv8TNDEBQ6ao7dJ+x1RIPGB0lfD6KkYMdJT5plXYp9utDWn219ljViRrmxrwvoJxz
         6RXjrhqoJnAOb31kR1wkrHP8JrumF8FI4latfvepc7F9HYn4HENAJ00dNTVkrN3WG0Dv
         4v3CNrUU3TuletEiEPQl0EarObJVEaz7qU3dlgGM+nOt+TN0Z8bFh+tWbz2rD1nxCkyq
         hMBg==
X-Forwarded-Encrypted: i=1; AKwUvBxsOPVIPUay6FUKv/z9Bkb0hRPvCRDDadTp1UksYB5D9z+mDWLgukNkMnsU0IX/DV0fauL5RJ6Zd1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5aa3PQ+3/Uvw3yR9e4Img6BS1Cm9stLvJ6Bf406c8yMvIEnUW
	KYGJwSnnPZXlHikiwHBx5GKiZOhi6yn4WvAmmlLgII2zRTxZDV74KZKK
X-Gm-Gg: AYBFou2WCrICS9w8zJEBk1K+CTXtiu3eJrBcclg85M9QCY5aujuJ/LaOBHjnWYaqNo7
	A1tN8LzlzEBu/QSd2mqMNdOJjjgIoCuCwaa2FOQ9mUFU3psaJJmKT1pOLwTa//qfZY7vEcNp99w
	A8rQ3Aribz8pdD7ReQL1T2RjV2nNv/bkkgtt5qom6NZfyGcUD5IGgM3IWwx6oH+yhPzq+Da1xxT
	hfvqniVvH8RRBje8mxiiTZxYcQ4Bu8whQE/UD8RU+h/dDcGtJdh9E/+GjnguHAkEssHjRJCGeYX
	BpPf5fHclO2G004XU3kDtc7/8BNOVevEvIhCp+N3yfnhGKRlVypn6s1Us0Ww6AkasHcf3D6o92g
	QPuKCnomJluWfjlKFxA9EjWXz0CNPnIzMYrybz4FgGjZbtzJ9YNaST7NPyLlwDsU25PpHMGljfD
	AKmwJhUoWUq4J6B9vcXSNzUwuPPlS4GwUJMJx7LYhCGkANasdJ/dfKdCCj+F+u3A0BNpTaQyNim
	tMUbxPe/Aj6vEg7lZ4SJb0AxPT+/qYc2dxBafwAx6iR7tw1YnxqWOUtvwZDiTSOO760Idr0wjiz
	rO/LhWMSwAvgWocQZxxCNQedGUubeyknROdEDV6/zA3TAkxs8tYZ2oEWvG8xyx7F9yt6T/u/xHY
	=
X-Received: by 2002:a05:600c:1549:b0:4a0:25c:8af2 with SMTP id 5b1f17b1804b1-4a18e491051mr404160705e9.17.1792047828269;
        Thu, 15 Oct 2026 00:03:48 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a8a15sm48374825e9.4.2026.10.15.00.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:03:47 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:03:45 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
Message-ID: <atB0hpxP2UwKCUF4@gmail.com>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
 <8733u8w6p4.fsf@trenco.lwn.net>
 <20261014233956.605e0960@foz.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014233956.605e0960@foz.lan>

On Wed, Oct 14, 2026 at 11:46:13PM +0100, Mauro Carvalho Chehab wrote:
> e.g. the ones found on distros up to Fedora 42 and the latest version
> on that time.
> 
> to be really sure, use "-f" to test all possible versions.
> 
> (*) even with the simplified version checks, ti runs for quite a while: 
> some versions take ~20 mins to build docs.
> 

Thanks. To be really sure, I am running the full A/B matrix from
tools/docs/test_doc_build.py -f, also newer Sphinx versions and the
Sphinx 9.1.0/Docutils 0.21.2 combination mentioned earlier.

The endpoint tests have passed:

  - Sphinx 3.4.3 / Docutils 0.16
  - Sphinx 9.1.0 / Docutils 0.22.4

Both builds complete successfully. There are no unexpected diagnostic or
output differences. Changes are limited to the intended heading
restoration and warning removal.

The remaining matrix is running. I will report the full results.

Karl
