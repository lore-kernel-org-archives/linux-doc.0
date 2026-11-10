Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270279;
	b=j+x1i7w4TFTREv4UofSTW1tNxAuDG7SGssUFhxoTM5LKK6z2JjsZaaL5IrKTNGoHQOLZ
	 za1f3gAn3DEQrH74OfG54PvDJi6+Jrjn4Pk2jETlKBiXAV21f/EZyP8nJ0LeiCHBn+kSg
	 PO7+zd+j2k8DodIS9+/3l31q5oA7ed1n0XA5r5yna3o5a5FZGG+yEqAJVx12sh9iOiv4i
	 kB3zyOow+MsEwyF0nLzyBJWiUKvNGfmbT1/pcUhtCb+ywUeLqqZHZDu57GcyYdiZ7eRKa
	 CNcfwrar+cYNhDIe2rCa6tYtRr+lQuCATxVqg6F0XwEc7k3C0Da9v1w3rVxVoEDBnIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
	b=qXh/8ZIoCKkacciolJWUjlNMq7srPBKuc0uokcqSxXk1aW9aaN7WKDX+KdkcXnNBmm6i
	 oxesy2A8fB/PgIjCF2TDbpBtJpIQqAranAPBZbblSibqZWP9yoxkxqR0vF7OU7FjTI+E2
	 4Vje2IbFoKFmPThne3ldKyiMbCVyhd8QAORVH1ds1bxN3lI7ZyeHFq33n67g1ZO7KrOuQ
	 qlmPWft3EWC/PcJCFVUqhQrIeXFmZ/+zsY3y3lqdCI2ZnFqs2lFIy5+NYR7UjEm45PB81
	 6h4VBWcj2+GXF6JkUITKtXXvEYm42WqNk2aLPBT2avbwX/5Rl2csUlCGxyJjfOeYt+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TuVRyzuW;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE60606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 00:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TuVRyzuW
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8dd9b9743so16963005ad.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 16:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794270278; x=1794875078; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
        b=TuVRyzuWUgVcsf9lNq678ixAFJhPOzvFG4t3LRHWBAlBem5Qaz6FmOVOsmGd4DW/L3
         WU+Kwj6rfd2umV9dl9/VTCpXF/I9sEA96nbYfl9Oo5RqfmALRzU9IMLvz0Oh2MF8S+5r
         +ZW/jM1G9O/WQVZme8EkVhftOC6lEUr4xRtvYPDvHvmL00PopnsM7nOyymLOgvQM/RnX
         wLWpWi4iOC0GVGlmhfgGdoSlR9872llOD8o6fXNDODhkDXS9r5lTh0uAoht/UuGWphZF
         Etf2c57hXs8kdFp4LjsVEqn9ikfHPTPyqnkwYPPvRGwHwZi2QwpE4jcn6alAxH2G7jX+
         Dc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270278; x=1794875078;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8R6psPcEpcxXBloXv1H5EoyGYGx6PRPHPE+vAtNfv8Q=;
        b=YJanWE7Sza+78UPc46pQcHdQHjUXQj3r4uUI6NnSj64ZjoJW6kVkilX8SyR61DAKXh
         +XwHtLT50SeKMzXYIUR4kauJs8h930jcGr7oavnmiazbgjcVyXmbGXK0Qd7BBhejB6PT
         qjNhNPBwRAstjl9jXncBudy8Sg9TqkFIa7rYNA5r8nwTfW+5N91sHfk6WNbEDjT5stxr
         rXZaM4mekFrgFo1lgUwz1WSoLvvVneYPiiXyp4eYPkln0Zoh7E4iyAzSY+X9eXdJS4Pd
         dnUo2dCi4WSOYT62RmS7EYnu/fZlrNYcvDmEy5ZVOwi7WnuBZufHXaDteO3F9K+up/8J
         6BuA==
X-Forwarded-Encrypted: i=1; AL+hErG/5iOcJABOzdDABfHw6hPpSWCcwcGnNOESS2qAz6u284ZMJMZi7i7GGJoXLsSh9TgkdHFVrCLRJ1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+maHWAbAKCn8K1+pppy9jiiugl32zysBNeZZu3FLHuUGoYC7Qd
	6qi1u1SqTtkJyxVT3m58p6dsOGtJw7Iqu4phALz+2uuGcIjtcgJKd/b1x5LEPYe4T/wF7INZvhZ
	fATfctqfm9lmhBnUaj8AdLxojhy0DlpRtPA==
X-Received: from plpb13.prod.google.com ([2002:a17:902:d60d:b0:2e9:6468:1ffe])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2302:b0:2e9:6f2c:71b9 with SMTP id d9443c01a7336-2edb8fa3768mr7596535ad.1.1794270278310;
 Mon, 09 Nov 2026 16:24:38 -0800 (PST)
Date: Tue, 10 Nov 2026 00:24:37 +0000
In-Reply-To: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261110002437.2376944-1-rathodpriyank@google.com>
Subject: Re: [PATCH v7 0/2] PCI: Add Lane Margining at the Receiver debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn, Ilpo, Lukas,

Gentle ping on this v7 series now that v7.4-rc1 is out (both patches
still apply cleanly to v7.4-rc1 and pci/next).

In v7:
  - Both pcie_get_link_endpoints() and pci_aspm_inhibit() are dropped per
    Ilpo's earlier feedback, leaving aspm.c, pci.c, and
    include/linux/pci.h untouched and using the existing ASPM API.
  - Retimer receiver discovery and margining coverage (receivers 2..5 via
    LNKSTA2) are included in the pcie_lmr kselftest.
  - Both patches passed Sashiko review with zero issues.

Please let me know if you have any feedback or would like any changes.

Thanks,
Priyank
