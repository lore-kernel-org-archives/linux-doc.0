Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E51957FC
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 21:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757627531; cv=none; b=vBt/ae6ESfsf2B3QdlS8d7OL4zy4Ixyac6/8QBo8TVyWgAIg2OTztRLtJ8q59+Xk18ddcqd4qTBB3LG6UvZgKfirJXphjY7AlZA9hCVr5dWuI12brVDgFtuelaGZQICf5DZaEbI+FCwLMdhrqiFsT3mKM0J265ZbLH2vSqOquk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757627531; c=relaxed/simple;
	bh=11jfNs7XD9+70o8E2n4SbCGdw78596CKJwoetTJ9SVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aS8hA3TmlYaNcdr8nqRqng5m+rY6OThS4lLEdgVGfbNF/aH8CFZow/5cQV67RaBjZi2WpAQ0kQtq/ajrMFWc6XCYi/Wukn7Lz3UmYZAWwppZ8T4G/qy/ObvdNc91UHbLZ4Zs/Qgf3TV90AdhpKJEUpXOUPEnPdekBCfVx7xwrqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lwFQjeHP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lwFQjeHP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77459bc5d18so1014446b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 14:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757627529; x=1758232329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HCC2l5e6FSf+CmwH+t7zaiFzHJluzLyI3JzzK5xSQZI=;
        b=lwFQjeHPpdlq0JSJLj9WNR9HDWjn0Uyb7dfJvcDlhrm8NjuTyn1QzfnH5F+tKvcQm8
         a7O7ZnhVq7vb8Q4I8WBbm8tMfc9f+EmchgO1yf+FhVDd+M4wbiXI5FqRNbl+DZYXVufS
         52MZ09ooL1cevhObSf5GSSh2mbSgAmZB3G6Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757627529; x=1758232329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCC2l5e6FSf+CmwH+t7zaiFzHJluzLyI3JzzK5xSQZI=;
        b=wsZBg0fr1gpNTur2nJIHEKgEnczpRKMS5To1P4yfN/MVrSK8tiDqomYm8Y8VJ4Kwbb
         6UOqXYG8Sf7+yHImbVr25RpFbcOu3Qbmef/1VWeA8Vny8tSJ7RrkwiLwVDElv2HY9npm
         V1pWRr5qu2a7TxN+Qw6h1beKesIixNQskozQ9GVMYpeSjL7ovqMeUdxGr6sMlNzL9hns
         ZvoCFIdF5dcBs1/c2OhcJlWD2tk34qcn/Aj3ro8dNpgpsIod33oNeDbsJXQdv7z23zCJ
         L1/5EHU82SDJyF/3SsB9u7EDOBotUhzXu7faquj1lxlqMMdtXXXBDPA4DNzuco8soOpL
         lwaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmBQPL08bgfacON6+TY1j6R/VU0iiBHWer1rPU1TfyStHrz7pMUAAkkvOn43IUhBuZzCE+0duSug4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4+0x9vKDGY4OeRiDyJ/oxg+5xVgS3i4N1fpB0QHmjejSwmri
	x6KfxD6dEql+ZvYpJ7RAopXhc4NGq5qPz+h5ndIcutFnzOmDnlD1tesZcitQniOAEw==
X-Gm-Gg: ASbGnctL/k6QKP62qWW+YmOblRrJhX6pTbtH1rgA1+09TQKrMG03wCQokaR0CT9XcV9
	wqFljPcPakfamg6Nh3W+eO+srM4h2/rg2GH/0NjjYRoeMoYuz27e0Tw28Qi9dlgNzs5ZHS74G7p
	gydBmYQFOW2z+WJk4NJFxZLohdWYRM7Xq6xD0iDUyvKsSBliPiz9cOcSVLbgHwOnMgJGYW/deMw
	6MC+Q24cNUmGpiMvHOH7pc98Mz6IVX0Is3845rL0IAq/aAUzIsEsfjpipSS0VbPNgGimx4XIEkf
	ef48+Fi+7cFfU9iWFnb8XIw+g6LfUEXeJKcHsJ5WFB0o+YfypHXQTX5qBrebmqRn1Znc7B0uQNW
	PW9NdhjM4dy6eGxIl8dDEWdRUW0MIt5bpoOq79UeV5bowu3Ip7JDLFpBQAvs=
X-Google-Smtp-Source: AGHT+IHb7w+bL2sibzRwFec3AsLqESlpAB7GfKe+XRbiM8MpDO4ZOEXOkV+dkAH3wE9LCWOv78D60g==
X-Received: by 2002:a05:6a00:2345:b0:772:63ba:127 with SMTP id d2e1a72fcca58-776121884a1mr929198b3a.24.1757627529148;
        Thu, 11 Sep 2025 14:52:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:6690:568:13de:b368])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-77607b18400sm3138359b3a.59.2025.09.11.14.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 14:52:08 -0700 (PDT)
Date: Thu, 11 Sep 2025 14:52:06 -0700
From: Brian Norris <briannorris@chromium.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Terry Bowman <terry.bowman@amd.com>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] PCI: Update error recovery documentation
Message-ID: <aMNEhqiJKK9NOreA@google.com>
References: <cover.1756451884.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756451884.git.lukas@wunner.de>

On Fri, Aug 29, 2025 at 09:25:00AM +0200, Lukas Wunner wrote:
> The documentation on PCIe Advanced Error Reporting hasn't kept up with
> code changes over the years.  This series seeks to remedy as many issues
> as I could find.
> 
> Previous commits touching the documentation either prefixed the subject
> with "Documentation: PCI:" or (when combined with code changes) "PCI/AER:"
> or "PCI/ERR:".  I chose the latter for brevity and to avoid mentioning
> "documentation" or "PCI" twice in the subject.  If anyone objects or
> finds other mistakes in these patches, please let me know.  Thanks!

Series looks good to my limited knowledge:

Reviewed-by: Brian Norris <briannorris@chromium.org>
