Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4151350D64
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 13:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557882; cv=none; b=Ty/SFFILCPvClRVUGPiEJJ6L92hkUaJGV/2TlvD0Kimb3nIVDTHksJLYSZfIVIV0QW8upnRTdPFTvLSlL5f+ePEeeamFm6a6fN+DYesBz98ftbrSdi+2o8XEK/Fqc0MOuY44HTfips9KDwokII6OJC7EfrVu891LRDIEtgtNK9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557882; c=relaxed/simple;
	bh=sJLZgI9vl/ePXAMiM1HFoKkY761fjwT9P7fNtQPrjMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5hqt9yxKXrwE8qNZHS99MPimba+VzMML6GPP6I+nS/w6ATMeKWc+1ZjA2OmJXppelbOYHyqepr0RstfE0+S8Ay47HpgOHwnEnokZiIp9pdpmKCO/fqRzjUpqWg6B189cqqw6Mh7D9b0vAd1HD29Yw/VapK4tNHPmZVCpBs4eLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DQJFkS9T; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DQJFkS9T"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b737cd03d46so616246666b.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 05:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763557878; x=1764162678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hIjgqXWXn3Sbfto+9OWapsp1QwhUBtS+kZIjBq+Tlw=;
        b=DQJFkS9TfIkIw04m01xXMLNrkosYb3FSrkUd1Mfnq3DmFPVYW5BQAF/kJ7qBH/fiSm
         pVnVkcfKZlPcHTsyEwqHQR67eAr7CHq57OGD53huuAi4hSCw/ct6edPOGR+fsY5nGz/N
         Yw1ooyFk/+rMnBQZngJcf6t2sX9N66HB8FZQS71x9KKl/6xkzHkV8uFKm2Iy/9fAm8Ag
         I22CiD+iqPZDy+W/I0Ox3Jki6uwZV0vfVWc6IvJTegJWTzKaS6FEi0EnBDDhgSnIfI+y
         k4OP4x8AdsPKrFrvmXhICnjEUtirKTXsrSbTk6Wz8fF+OXFqP7Hrg3yvNq2+bPjQ4kUM
         Gqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557878; x=1764162678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hIjgqXWXn3Sbfto+9OWapsp1QwhUBtS+kZIjBq+Tlw=;
        b=pU6uVkc2keBmg9Lpc1uJZXe0unNWSIBwEw+zxdMkw2Rolww8PZuJakZlWCyskrqkiI
         42oflpMQ0bg/b1l3MrD3n9w+YY+Zz5/3C65UvapKxdP+Lz6LUqOhBmiefi7lXyfLf/fG
         mRYwX6bC8xcd+XvfdtiA6wPJsEzNTI3A2FglI6lOFRJm5PF/9AXY9SGHmXm5KsWTwSgj
         DW+HNs0V52iW70gt1kNeYGPIdRCgUF67z4Zyq33jAsFFFbsBoEJJI3TgW7s+3Hx66abQ
         95gcT9qGxh8lV7TBjYRorf35oSHbJRn2xS5W7lPMT4vi77ACGHBo5QFNz70SA7uc2iFu
         wHGA==
X-Forwarded-Encrypted: i=1; AJvYcCXCU7pEJFcyQVfvdSE8iwLYLoBNvLdblyQ/Zk9qGky8Ae/CHPNblqP7C0gBEtOIlD4/I7F3gH4LYYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1f5vrJzJaNZiJk81iEItGz7TMUN0eC7KfKSHHrcICtZXbBUm
	PjO14TQwQOwoE9mdOpxKJqkWHUSy2GfUt0y2kcGI9B8osIbV1rjzKttG3VAOx4G6NK8=
X-Gm-Gg: ASbGncv9O32L2sDvlmFeEwpyz2AfCAWiwSzyjj9xH+//xxQjwjfGkvyCtuyPpzXkQF+
	RPBxTx/Cb1UPj5xrR98zELBX6T+Xz/R/dDxGnh6INn67CH4Wzs+rhWIR6QU5O+kwk9bCnLktomb
	juPxNwUbs6mZaBuSXEjB17H7DsFMaMlVD4v3bnNTRieMdhrLtAJaSeuCwdslXKaDYZkbTTWS7KZ
	iz3WsdTDbSkpCBmSi3DyzKvZBseOKeSCerOU62Lxtr/WK4n43tBMIAYUHFb6cAni1oat3aTvvnl
	cOiMqk4jC3q/RP63PK61BohuRGGYQEWIuHPjinXyiPHZn0C4s073XgJ856x0wom44CYLBJyw7Wp
	8J7BiP0yFywFkFMuOOmNgZvxBt5VxjqsZ1rslEO1z+M/bZ6JiMgV6Qss8GUSe38SsSYTySfntTH
	gM20EXrxK3GSqZwA==
X-Google-Smtp-Source: AGHT+IHh/9HSY9QxYY7JWRlsHkQE77dEey/TQadLHho4kIFH9l0Cnuj5X98H1aD+vZkw9c2t87Tcgg==
X-Received: by 2002:a17:907:96a7:b0:b6d:50f7:a805 with SMTP id a640c23a62f3a-b7367c02586mr2099815666b.59.1763557878059;
        Wed, 19 Nov 2025 05:11:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8775sm15093392a12.5.2025.11.19.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:11:17 -0800 (PST)
Date: Wed, 19 Nov 2025 14:11:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Vitaly Lifshits <vitaly.lifshits@intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sagi Maimon <maimon.sagi@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 00/21] treewide: Introduce %ptS for struct timespec64
 and convert users
Message-ID: <aR3B8ECx9W6F0BV_@pathway.suse.cz>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>

On Thu 2025-11-13 15:32:14, Andy Shevchenko wrote:
> Here is the third part of the unification time printing in the kernel.
> This time for struct timespec64. The first patch brings a support
> into printf() implementation (test cases and documentation update
> included) followed by the treewide conversion of the current users.
> 
> Petr, we got like more than a half being Acked, I think if you are okay
> with this, the patches that have been tagged can be applied.
> 
> Note, not everything was compile-tested. Kunit test has been passed, though.

JFYI, the patchset has been committed into printk/linux.git,
branch for-6.19-vsprintf-timespec64.

Note, that I have:

   + fixed the 19th patch as proposed, see
     https://lore.kernel.org/all/aR2XAYWTEgMZu_Mx@pathway.suse.cz/

   + reviewed all patches but I triple checked 7th patch which
     did not have any ack yet. And I added my Reviewed-by tag
     there. ;-)

   + I tried build with allyesconfig. It succeeded. I am not 100%
     sure that it built all modified sources but...

Best Regards,
Petr
