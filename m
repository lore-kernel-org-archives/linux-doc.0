Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC5418FDDE
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784324823; cv=none; b=UD9SmJU8OeYbW1n93tUgMaAF71k/x88maePLvBLCR5j8hkpGpebaq++07pWSCa4ROovrwCuUEnMOm17ZawaZRNjUI5TZ6gEd8dKYyObnzMgU5FoEbyULn99PqMCS1Zzk4OC8qMem/ChSd74lSFyiDFGmRlSfC81yfPS5BWfQZ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784324823; c=relaxed/simple;
	bh=ahWVhQAgslIBwnfpmx5X48jHe/0a44QV3IQwRfGz+iU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NaVDUFOLcuOqx3/1Ixybkp6xMuSgYrnyaQwYqNJIDXlCH/MU4hupZh5kYek/fx8z60r2B1u1r2P3RowrFCvEKSrkZVtASlPL/VVB304nvR0spYM2K1Wzy9U8Uk6K3frIXo0LjMYT4Ro/wHFaZTBxztYDgCUYhdOkQXplyzfoqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=MNUHQ6uX; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="MNUHQ6uX"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c2149571dso40671801cf.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784324819; x=1784929619; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AgfKPfkfc4jyNoAXQ924zrK3vmVWU/VwnFCFChfwVj0=;
        b=MNUHQ6uXyAu/5hZqvQhxUjA9gAsaSUkDLtHs9SBhoYzax+b/lnpiChdpccm77YPmzt
         SZU33e6UkkvQEGU05ml5CmnTkmOJwh2gnKlx0wFVW2iMpyK1NK5QeMYAabd9ZPCoDBKW
         8gpfW8ER8ijvXWGJ4QFLhibpVg5MwTq9Yz3Z1o2sjYg2UlYS+6XvEoHgFj7T1k1TRv7d
         QgKWG0Ug4w+QR4yshnq2scoE9AA8YNNY9Fe1h4L4o3XRuU/Z6HkZ1yL6vq2GBbhtZs1u
         /hYEHAERta3W3rEeP+o5Zy6koITetobWCKi3WyBZewYuBqrCgnhZKNDIQQOhUo+caNjE
         yfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784324819; x=1784929619;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgfKPfkfc4jyNoAXQ924zrK3vmVWU/VwnFCFChfwVj0=;
        b=NwNUTc5xPkWICGgbXDCzabmncLSave4V4Dbd1o5c3/XEBz0MGIWpDpcvTp6f0YyXPi
         B+X92Udt/xsmYN0ZXOfTPvYjW01NPEms+mz5H5vUeepADF88iJ3jbz7EhOQls3tyQ3+l
         KGFCZJW7V5c9ogvdmnMb5/Yz5qI/CxCJIlRYq1Sm/8458l+bm3xmoDRqBcnLlOfsgijq
         VWWZY5ePMWUDUR/P60oxTXrjEgaeLL6TAmiC739ap1qdHCDf6hgYbrOBoYGlSpvmHqxH
         5sdaRbMieJZWlVgSiPjaf8veqHluA5yHSSdqiQC4VVRM754sz3hQhIXgVHkGDfZTAgoI
         LuXw==
X-Forwarded-Encrypted: i=1; AHgh+RptMSzPZ2hDFFnDrZD16+AZYbeqUw+7LVNU4LIj+3acoOOcU/6+uq6Z1PJyKG9X83uLluogtNyBcaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YycI1kDCSdMqV7OKq2/m5qD1uK7u1wbUCCM+C6HVFFK+dfppJtl
	E+nga+x7HzawgaVOlHlrZ/TVTLc8ZPu1TkSJFyCuYaU4/MntJVXbsF7p/NGchhaJtwU=
X-Gm-Gg: AfdE7clG4nsAXImFd+euX1jUzI+610MfsFFIiHwL3fQ+9YwqsdjLUbENgpfEFn061Xe
	/lgUXsSVrY+wE76zuWC3mwUiMiaBXIoV1LJfv2QqkHUNeUIKos01QILls38ieRXznq8cHIwGzcs
	EjuWdp4YPr5oWDubohTXNKDp+PGVaqOgyo4YOqUe+ufjMlDKgrwh89AnzFFJjAwsC0k+C0XSj3e
	+2ZXkOci7GK7wkLyUUCfKFM4G2pbnyJ/6biDntiuqkX+YuYoMCgkK2XGHMqAJoQ1iFwJSDME3cf
	G4w8imyRGIP2cELwTfS8hQj3TEJ/NPmMR2HN5YjpCrZ5+gos0nvQr4U3Nx57AiQBjE2/jnAPze7
	Sm5YJ3Bx0/Or197sUExDELfPxd2zYvjVLWQLDKxgHcQHFHPIRWNakm8GXhM8QipbK1vDgFzg6dG
	WXWA27WW4Y5mCMn94DvoC6eYpkA00xgCn2JvkRzJ4yLoRLeyROQQ==
X-Received: by 2002:ac8:5acc:0:b0:51a:8c97:fb93 with SMTP id d75a77b69052e-5213fc54d44mr43814441cf.60.1784324819586;
        Fri, 17 Jul 2026 14:46:59 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214c5cc8d5sm21955091cf.6.2026.07.17.14.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 14:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
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
In-Reply-To: <20260710212616.1351130-4-dmatlack@google.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-4-dmatlack@google.com>
Date: Fri, 17 Jul 2026 21:46:52 +0000
Message-Id: <178432481253.189683.3297727348836286619.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=ahWVhQAgslIBwnfpmx5X48jHe/0a44QV3IQwRfGz+iU=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqWqLRRsSwqC6u4RSv76ETLMmVCyhdUsVHiqEBy
 IzSCQuBMK+JAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCalqi0QAKCRC7dyhM23N6
 3vK4D/4oivNUuZbxrdZZJAOMVjLNn7oaWYDk2Y4dxn2IVLciov4pX+4V8SBAYA4KhEpyZKQ2mzg
 B03dHNIKdFOpoPbLkuTRk9ZGugmK2ChP6tAHjBDG3RkOkva5OLSR6JBKmrLBG2GEATEY/EOLIZ6
 eY/PqU+3F+O6j7iFegvOLxHq4AGPuXSVacvDtCjafit/axJj9LIZ8kF409sq6qgcKO5JKSa8Jea
 R0CHNLN/rrFF9+PoaDcZ3B9yBydtITA6U5LOFg19G95jV2FYfsILSxxBbZrxUBXAadtzCS2F9wc
 ojlbkyeQfKGhVsMnUf0jafSZJy8tlQ5ygLO7zUxGMxHU0yDSH9+T6zwkWpBoVu1DzV6CaJNE61t
 UznWIUm+HsrUwRRGxWKvQ4wAZb7dT86JZoYl//i+SFOHLjV+15QOw7niAqqrMwWfQasB4V2Hxwt
 eXCZu13O9+xov9pJgVNEtvYTQmPpi6xZlCFh5C0RT0QzDoNbZ/WnJZuT0M8/c8BHxvB3E/domK/
 fmKpXprZCKUC0ZMdFx+RiHls3kZs/ypakbVXPUHyzfXsnIT6DxIFfXMfg5kTylkBxQPg2GwLoaZ
 CRH5LGmNRRTuTgY1EFBAo8as9+ZfD4j3ydB1vBG6faS20lFZ3r8fycLqRoy2hUgcnWVKGbkEtVC
 YOLWzX1kCSM2bCw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 10 Jul 2026 21:26:06 +0000, David Matlack <dmatlack@google.com> wrote:
> diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> index 03075ce06ac9..df6a02240aa4 100644
> --- a/drivers/pci/liveupdate.c
> +++ b/drivers/pci/liveupdate.c
> @@ -298,6 +377,87 @@ void pci_liveupdate_unpreserve(struct pci_dev *dev)
> [ ... skip 76 lines ... ]
> +	/*
> +	 * Hold the ref on the incoming FLB until pci_liveupdate_finish() so
> +	 * that dev->liveupdate.incoming cannot get freed while the PCI core
> +	 * has a pointer to it. It's better to leak the incoming FLB than do a
> +	 * use-after-free if driver does not call pci_liveupdate_finish().
> +	 */

I am confused by this. Each preserved PCI device must have an associated 
FD preserved with it via LUO. I.e., vfiofd would need to be preserved. If 
the vfiofd was not reclaimed, and finish is not possible, that vfiofd 
would still be owned by LUO, and therefore PCI FLB refcount would stay 
positive.

However, if finish is possible, and this is the last vfiofd that is 
finished, FLB will be freed as soon as the reference count reaches zero, 
which I would think is the expected behavior.

What is the point of holding a reference here, instead of only for the 
duration of FLB access, i.e. to make sure we are accessing a valid data?

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
