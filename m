Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E622ECE8C
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225500; cv=none; b=sQz7pIayykkzXnS0MBDIwuSHf6+Yk4GDah8Y7pOqHeByvwoY5JEBiMftjRYw0ZfOmE8rug+utnkoY9YT0e1B4OJP3AwzcUxI7eA87dJostWuLUiFC9oKBpUg6GbPiq2J1VlrsB9tASuvaaw8FTCiWdDNbCJhlGYhn1vB3Ce6AKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225500; c=relaxed/simple;
	bh=hrTKVKMuOKbLilzSA+VEl+XSSF0VIocT2KvCzkuRjcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f1t2Uut8X0vjHihrfCxVizQx3oAuiXtbEMNuxUGbeTeANElP+n+8kVqPaX5vSXPNhpixLZ4XTUGM7jyyz80nSDh/C9k9foNUqACygyJ6Y5+tUQ1/Mk7uUAwRPZVV5Q5FTUWQYFvTUFJFp4p801sMMc1U4qqh7Ec9drnq0SsFgxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNlT1dRM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNlT1dRM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0e7bc49263so238070066b.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758225496; x=1758830296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=hNlT1dRMFhV3nNEO8OCPXfEiZjy7HadMXu4vRgp3Ipj8QW/pTjkxFRxYZEa69pe80J
         R5WZR6uBlmeIbF+VQhBUi3wnRJuDxh3ZSYPm2HtEzHdmYgYFzaLOTkBNZpxqwUsXFCi5
         xh48TC/I8mOWxP2I4D6qthvi1wAkVJadHw9+Q6aETqCdcS+tzshGNcO1qODnTVXpUxR3
         DzGuLf7FRf7YNLECrqzb9ayMBLdTqRvBk0ivmzKueGmRkmu1GRq1Uqn5Uc0kg8EqXgPJ
         5wCj9Urjk2M3jfgX+oYXsBuDx3I+zNM2GW5fMn6rB/kk6qlx/ZV55XBxceRxo80pIEfP
         n68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225496; x=1758830296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=SKhqdkWoaJwHJLcn04V6FlTiasARJOlHGQM2/tyVmYgsoFg0p8sLikEbIKM+gO1CBu
         exu6tST1uLovIQ1WVCqTpGHRPtaL8S1/BXdDksDlYvyn7TGpAGZEnTNk1i7xgff3RGW1
         QkD+YwaPi/JsB08FNLYlaegy88x3XuJpnUQTkLWowU8UGeKLBdEzZt1FV0nV3ophsTOL
         41ooBWEO4QIGyOw3UW7iPJv3c+GpmQjIhXY4tIlLRTa+GL9hlsEnba9MEoS7Aa46TsTm
         kSIOpxRqY4/czcJWSplSQMF4zitl5qXuCZSSajo0VytZ/CoxqVF2HLXZSO+VuKwmSsCO
         9wWA==
X-Forwarded-Encrypted: i=1; AJvYcCUQx3Un3+f+kLJ1f6uXnHFWquxUxqo7/cqFYZNLVbUCLxlisN1zHASDQ31AGg6LshnWsPZYDblsn7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfrhdOTDSWotm4XEHs/1xMEb7UB8UXNY3FTejfiZ0/+QsOYZN4
	h23Eeh6+6Ik9YeItMazLCuKMbcmyJh3t7ZWep0XRHvw8gJlVhb+NEgu9
X-Gm-Gg: ASbGnctG/JIBIc8JqZq6vJVLqWLlxg693iQI/wK91hGEmaQXsIrrdcsNVM7q4kR+ZeB
	hGfTmu7XPixxh28r6A3G4NPdc8T44Fk6odMCffCj/lSJhvRhdlJ6Y4ddwyxeHgcj7U1PG9TWOjW
	c1C/6jAI94Ph8oZw34Epg/wSgrNDitTAA+VhqJtkwtuX2shacL32RgkJV0PR31MczvkaZkWyN+q
	HpeDdTiOR0KYlzcqgd7s5XALJ98V4X3+IkB1NDz0xVlbYFj4xKNPXevJNu423k1509akznC7//i
	Yvk+wukFtPB6lxis8od3KIaoASE64Q4r5H9BS9snoR8T0vkRDwyremJuwSa3MuDMFt2JcPl59Sw
	mOAx5chyNl1KyPlMzorwNDoUsySC9fmWKuglv0w==
X-Google-Smtp-Source: AGHT+IH2NBu6L+bASXNqg9sJUcZ42MFCB2aqzEFiqoDEW6um54A4CtHcJnO37auTgFbi6nwycKDm8A==
X-Received: by 2002:a17:907:a089:b0:b19:969a:86 with SMTP id a640c23a62f3a-b24f35aa177mr45885966b.37.1758225496090;
        Thu, 18 Sep 2025 12:58:16 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fd1101c44sm264530466b.82.2025.09.18.12.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:58:15 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	safinaskar@gmail.com,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Thu, 18 Sep 2025 22:58:06 +0300
Message-ID: <20250918195806.6337-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918152830.438554-1-nschichan@freebox.fr>
References: <20250918152830.438554-1-nschichan@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> When booting with root=/dev/ram0 in the kernel commandline,
> handle_initrd() where the deprecation message resides is never called,
> which is rather unfortunate (init/do_mounts_initrd.c):

Yes, this is unfortunate.

I personally still think that initrd should be removed.

I suggest using workaround I described in cover letter.

Also, for unknown reasons I didn't get your letter in my inbox.
(Not even in spam folder.) I ocasionally found it on lore.kernel.org .

-- 
Askar Safin
