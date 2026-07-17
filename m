Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294312FFFB5
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784325616; cv=none; b=tAk0YE7eDc1UOmuLh0LRtYNLpTN74DW5dRmsrj6EdjoZDPmiBxLPg+AVJyOlX8uLvRBN4nN0WW6SLjFq91xWuq8M4if4xNsdejAgPS0HncgBEPvgCNZ2x8E6Q5Vh7xMBSWGOr8AXuoIXGKPPaJdjaiPvMvugXMvGNzcxOJZZVnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784325616; c=relaxed/simple;
	bh=qvWcvkNG2F6VP4AQ/OsjiXWkoEcGbEfuK0Svedjd88A=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=k0sf1IndTqgT/IYtqK2ruwTOForfAJjghM8uIOLlrvaFSUR5EXpQRrwdHuWIZBlBU0WjfJThTtl2XBGTJAfxyNELfQX0Mq3BzP1oEPzrKlGMVujBqu/eyNcnQgPSY6mCV+Yc8xJlMeHE66zE0Qr4UG4d/cJ7BhEsx5RdUdsMHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=JvTK6keR; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="JvTK6keR"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c928bf172so59032311cf.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784325614; x=1784930414; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ifI+MxSrxAA6sSWteBBgDksztUF+b16cD5klnXr7OpU=;
        b=JvTK6keRomGouUntrlxdqydcwRqBUmpfbzMlyVKF3zvwV+IR6VpmUygKUYjr1jKjKL
         +16Uj+dxYnJp03SEcFAUB7j4wUK7cDXaHLNpC+8OcWN8U46jrj1xaf8uDSFthoM19u8o
         ZjZdSJBeWhdCFZrXKEiiyy4txYEEqL7SWmE8QgWZAmU1WnGFDHawCJ6RIB8JEXadyDLP
         F4TDlm4GgloalebZ4LB0SDlKZPU2Wh61pyejDrvc4WAy9MBfW3VqpdoM+wiPPwke4OHK
         t0InzojDqUXHfEZCGMsXYw7412nwXP4LWkiQlA4oImbneabiiiNoAQOqbnmNy78BKVen
         pO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784325614; x=1784930414;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifI+MxSrxAA6sSWteBBgDksztUF+b16cD5klnXr7OpU=;
        b=jAzly+95JMPPDHzeSspJ5Aod59PC5lqGRzmjYKAvSeBnaHJpZtPLD0mnn9CU4kupL2
         xLq8vxtSubDjsH7nnrRZdVNRdWvGHei5hBsvxdOhBv4qa/kp0A+6NVZE6vxUa2rkTLLc
         cgJxCzmBzp96jp1nW419ru6XUYH79W69eG2yBJQE9KhmebWlIudaYLbbySElNx5IgV7t
         CoGrX25N373O5PTRMLw2g3cFSkTrwR4gpfGYdmMEha5A15b1LMBUyIGgUInjStU2fAbe
         7AJRKHjHolJ3A1DddAxV2XeGJWSvzjv19laPsfbNeh+tS6Fgr1lSN5ir7Wy9tLjFdWoF
         aPfg==
X-Forwarded-Encrypted: i=1; AHgh+RoUa1ZFEeH/i2RSXpYe93kR1iXlIYkQD88VxL/2UnWqnNhWtTonIpB1BVqN6s2CBMwaXADrBncE8K0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQ9u1kkDeLTA20LudVpDaBJrAZ4mbD9b/V0sK0GrlD7KagV+T
	X0GclZa9ve4X17tJ36q7zoPZTNb6a2v7T0GpBe5pQZrpFj+8lPDKBX3mkU4ONQqV+fM=
X-Gm-Gg: AfdE7cmgnJeAE7o7lj0qjphdmZ0cIVCLMYpvWtv8SRNk3kspygYd0PiDzmRRGYTjhx7
	g07+2k9uBdg+RWEbrblpwwB21rmbKONqA3/giJTHFR77viWYFQqiJlMDl6gLWor/DjCvGiZilVC
	Q0GCG5r0+Nr4iupztJEEl63fe4L0HK89CAffQcPSrTRhqNJFHca+NWZEQhb1o762SSf3CLQgtar
	mVfoBLqX28uLItjwcrOI2rEmYRsMSuBbSwKWPi9tBUt0ImSPRuh8RoUTk7mifB/RZoYdXwXqDU0
	Eoh4sRhpqsH167GTE6AhxtbbAuFLLM6utlJIWeK1bqw2YXwACVzl3fuyEL/+vPobNY04nymQGOR
	MsCW8Ejrn0145fQQVr+cpACwQrf+KqeNWYU8lwGdtrxRqRaXt42r2JUmSL+HP3EY5eGGXjNNeh+
	tuMcMyc9iL4Y4Er6g/l1Cf7AXTZhQBR/Tmn3d944M=
X-Received: by 2002:ac8:5fd5:0:b0:51c:7b12:5fe7 with SMTP id d75a77b69052e-5213f378d24mr42575461cf.83.1784325614000;
        Fri, 17 Jul 2026 15:00:14 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907786b2a5csm27038726d6.25.2026.07.17.15.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 15:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 06/12] PCI: liveupdate: Auto-preserve upstream
 bridges across Live Update
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
 Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20260710212616.1351130-7-dmatlack@google.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-7-dmatlack@google.com>
Date: Fri, 17 Jul 2026 22:00:09 +0000
Message-Id: <178432560931.189683.8819967076124393595.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=635;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=qvWcvkNG2F6VP4AQ/OsjiXWkoEcGbEfuK0Svedjd88A=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqWqXst23iQddM5JeKJBv5+L2AUkI6Q1Imib8QW
 FplXhImuLmJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCalql7AAKCRC7dyhM23N6
 3h10EACKK0N2VwEouy2CYlXnQQDJcHE0yJsT9DHhMi2Mje4OjA+G2J5YK8Ey9tSvDFEN4MIxr1C
 IZPZjgDZHgP6pYqeWYUKqF2adMUoo/gT3yM0xVuTHeyIwVU62yur28Xfb6YM9xVDfvGFBv6vtfO
 jm7GyFSIVeTdMitTPUwJ9+dSDxWZVL/Av4OrHAmbpsCdtjU7ipKoGAZ8mjFd1LQJQWo2r+iDqQ8
 F35z2mfJYXSEiHmuc8NDXRunjTg+VzvwBDFdMrrWDgW2R0dzM1fP9kuTUxix91XHpMwBXUIJFk2
 f6zhYw2ecfhQ9QUraWoXPAvpO/zcWsJZJTPxmwjJguJWsY2u0fWnprkQQQRUBl36KJOffbjb0z7
 fI/gzFrFkS1P2N0l1uwAv27v4n5GDfPok9wFNXYwvhEIFi9QF3y5EYHTxoblOxdIhOGcYe19jBz
 0YtAyz1zbJL11x4KiVA7vH9rRb57YZwnrVzae6b8DzkkIjtpCur0tNk7GiRU4JwFioWjr3UVcMm
 jYkRI58+ErcB766VyU6VNEEI+AOYi5hmlSIXCY4SCJEu8mnnzar4ozhZ/5GeWfJORkK0gOE8YGC
 K19l9lBFbdGjs7nS9EQtHBT8DqPt5iudHpvDhMfozA/RFMnUT8eETh1IhocLyiqY5FNzxM+SSzW
 CsGDXtheCUaiY2w==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 10 Jul 2026 21:26:09 +0000, David Matlack <dmatlack@google.com> wrote:
> When a PCI device is preserved across a Live Update, all of its upstream
> bridges up to the root port must also be preserved. This enables the PCI
> core and any drivers bound to the bridges to manage bridges correctly
> across a Live Update.
> 
> Notably, this will be used in subsequent commits to ensure that
> preserved devices can continue performing memory transactions without a
> disruption or change in routing.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
