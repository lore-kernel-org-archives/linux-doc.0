Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7041E22DF92
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 13:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192640; cv=none; b=bCCCpjlHybloPVMDIfdzXOkTd4QKl4cv4AqUBGV37EqoFEwnihe9aViZTmJV9+UHKhjBACd/vee/pZ0ixFi/jrhF2/lX23AInW6cVNYc5a6IZpiYTWmZXErq+e/bWsUj4QrQ4cQC5GmtpeMqgsuBzq2YDBYlnDwqeIGqTrw1Xdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192640; c=relaxed/simple;
	bh=dOnI3ojRPOwkGTlZxJz/bQcxtl8BiIZwiuZeVEQYa98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ki4kGcuf7GzPUjmsT0V7/PIAEiR/NC6yrrjqtqboJ+7C6sxcBNG2xh+CvZUT7xyOxJ0wpqc4BF3zV2egtB4dMA9zXGj9qx1jZQ+xTjxysaJhlJM7yerC8j7i7IcREbU+LnbCG2lN3/MqoFPyvLoY5Ef52aI7dx+Fl73totGih2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WpGIEfGn; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WpGIEfGn"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb615228a4so582194266b.0
        for <linux-doc@vger.kernel.org>; Fri, 02 May 2025 06:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746192637; x=1746797437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oI2ULQh5v/7XJgNEVII7Ar9c5ShGuV2fSObmZKZHKeY=;
        b=WpGIEfGncZ95NerjXuJ1pkbyqq+hEe0awxXD3bHddeuzu1kl7HFFiOY7Q5BuoatwvT
         bbA9sFRbgQbNTf0FAcDODEJuqH6u4gkGWJUc+zD3AuSyTMDiAizL5GkB/L19B18IFcLj
         oZ0yRBpl8VuTSBcalxPn8uBKLWdgvihIsIBgoDUaICo6QX5fd/vy/i6f5LtwslXQJJ85
         RmunEw5/DKtvx9tNk1n6CPy7n5Z/FZnyNK90nAxNLFSNrVo+NtgrN8zUV/LHbv/kgsDs
         3NCuX0oRdsBvixBAf2q3QAQhpE26W5StnGVx56yCWIaa0/bKoFSVAQfMTG18Kfs5Qtwj
         JHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192637; x=1746797437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI2ULQh5v/7XJgNEVII7Ar9c5ShGuV2fSObmZKZHKeY=;
        b=lFsUqlPefvaqWg53w05xXV+yvEWXCPYeJGGSpc6LAXOuf31eol3BEPEyZnFGLSjQir
         g/Oiia4r+XhMK7LrEsAQgUmq9pZugtcwCHuCJdgY/Jq0bnj95I3bqcNN14VYmk9C2bxq
         zlnCbKxz1VRLBW6HX1lrs4Slq6FdRCkraW0z8+FQqxwImrG0qfkmbgyQtifo88f5cfnu
         tGTyACtq9s0R/DMOl26oUrxhABl2xGhxTewbbIvyuEP5HzwToWsRZ943eFFmwv9Hu4CL
         9dFNFIwf6+cHDB2lG0k7q/qA7R/UH1cyh5JfSFxbXR5K/R/sb3kH2IdG99RweCEg0rLj
         Lcfg==
X-Forwarded-Encrypted: i=1; AJvYcCWgT/i9Hrx2MGSfG7x0l3NvFoMXRvv0La7ahveK1Go6eG0cAjbCk9SNwZwePi60jrcoFVoLkAtCUGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6Rk6Gq9yuGZ0h+KPRMQD99Kk3KD+GCXzu3L1uV6jR70ynEuZ
	yigyn0POgxbbW9WnngHu1YdbZTkVp+RT4I9ayelaPnQBml4Xmv3dEYmT0e09yRg=
X-Gm-Gg: ASbGncs7VK02M8d84dCcJFuy7UYyxEbd4DlPd3MWmpDz3apkjCNBL6ti0Xn8pA8+sxX
	3uOok8bJXh3w9sD0I3X5JmkL0RbislEa9fiBc5pIG6F5AYZu5wHRZq3UxTisRWXhD+jVwbE1cLC
	ZJ5ZQ9zYAgTHYFQcUgNY+0Kgpru/RxqGv5NGIumMPYPcifSDa/3wHBPqMSNl/WetoTdewI8xTUX
	KwI5MlqE088AvL8yo8KBHUdbOqIip/UA1VgX8E/TdixEi1WecOn/vtcWuXyl+6FlWECUUSipC/i
	XUMPx0a59Cmxu6hX37osV45HW4MDuvRbARf5/GkIRIDh00SSNB4EG5/yFZVMDA==
X-Google-Smtp-Source: AGHT+IGNjdWSsHUN82hvMxthq8y7vwBmvrJ6nrWhg8zsSPmK5nzcMmRdBKIMbJNC2QRWTDJHY7Fsug==
X-Received: by 2002:a17:907:c298:b0:ace:8176:9870 with SMTP id a640c23a62f3a-ad17ad88dc8mr244745366b.9.1746192636538;
        Fri, 02 May 2025 06:30:36 -0700 (PDT)
Received: from localhost.localdomain ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d5bsm50208966b.176.2025.05.02.06.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:30:36 -0700 (PDT)
Date: Fri, 2 May 2025 15:30:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>, alyssa@rosenzweig.io
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org,
	andriy.shevchenko@linux.intel.com, apw@canonical.com,
	asahi@lists.linux.dev, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, dwaipayanray1@gmail.com,
	geert@linux-m68k.org, joe@perches.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st,
	mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
	simona@ffwll.ch, sven@svenpeter.dev, tamird@gmail.com,
	tzimmermann@suse.de
Subject: Re: [PATCH v3] checkpatch: remove %p4cn
Message-ID: <aBTI-v5-_JWDdge2@localhost.localdomain>
References: <20250428123132.578771-1-pmladek@suse.com>
 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959760B89BF7E4B43852700CB8832@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Wed 2025-04-30 19:19:08, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.
> 
> Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering")
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Looks and works well:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Alyssa, could you please queue this one via drm-misc-next as well?

Best Regards,
Petr

PS: Aditya, thanks a lot for stepping in and providing this patch. Also
      thanks others for shaping in. I was not able to react quickly. I
      had technical problems with my workstation and public holidays.
