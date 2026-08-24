Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE237A83F
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601714; cv=none; b=odAo8AkER7VieuPOnZ2slAU4NXDtGLbrEgf3tTFlhPdk+yoG283/A69SxakWdMC+MawD6b2n9srOb1DAnySWH4xQOD9onrPDwQYcF5Uh/phQjNF9jUlKv1MZB34FzQaYDiOIEs/cdJg8drnb3ydYFsI5PRBHsqpS42Zz2FL1M+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601714; c=relaxed/simple;
	bh=BdRWzqAXYClKFjgqOUw/Pyo77gxEw9c3K2BbQ6R+wxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1Xsn9xZ7sBVUDJGoGus0Xuw6wun1q5JaBk+okIQimFbdu1oAxCpykNcU76lDco4ae8uxgu7mXmZHtw+XMZJnDNrXUEtrEpOgtz9q9jOArPkrbNk2Apwkn8KGYBF/N3XhTSDvC9XX31HQhl4YK+ErsxjubrlQnco+oYpkBItdG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NInJyHHs; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NInJyHHs"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d3b445a84fso2425ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787601713; x=1788206513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLVkVU6ts+TGH9dPTmESJlrY5y1GivISoEDjr8mjxtQ=;
        b=NInJyHHsdBzklwFex/RcsPDxeXtB/qROTZci3rM10gj4flrOwlucCYwefuzNzu4ENr
         E0UWbPE9+MvnTsXH/CIeiDngkFUGQVelfubjbKzLpjkJO4XEGwcnfpscHXTozreWfqw3
         5YQGih44rysXwi001UOrarXixCAOOIHdFReahbobwtsXik3WVEOQou0S6SoLt2ZsJvnm
         gWZz+fA8YCrQ5aZIJSw+Kcadlfozx9b+zPY2BtVxaXvrE5uGH+OnTZuCHg1v3wjE7JJo
         vC2dxGHdQg/XjftWfQBkOtCt90Xy6yX1vriE6WvstyI+Q8lKTw2MfPBr6Y1+8flGsgO2
         JbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787601713; x=1788206513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLVkVU6ts+TGH9dPTmESJlrY5y1GivISoEDjr8mjxtQ=;
        b=rFrmmPCUCTRBFMPUYY60f8CWO6kCRuuaRb531UqXvFMQtqgU9tTylz3wtvEz0Vln+I
         sfSLuabTKjJtO6sJclouTzMb1KDkW+5lEvFe9Lpd2q7Zauug0MTw+CP8ekjiIGl0rviN
         GRlyQjFNoiVKopZdG4FI0LKz7GVbtAMe7uin6Sp1Y5gMpInHwRw9ZEwnljZ76BJMxfSm
         cxR8G2K47TLBg2gwzcJNrUDfkoNZoOVw3JA//9JzY8TD+mZ9ur3H64W0pGRkG1XxjRAC
         OD/+VRQN7Sga4TqUpbfo91oTX/3ijjAcvt36GYW2vxs9Autn3RHnXE5VihRVBKnRyNqG
         EmQg==
X-Forwarded-Encrypted: i=1; AHgh+RoVGYpfPUTsjpMvPStbYGcCipM1/T67V6nY2GIeoI1bimC55mG9SV9ZcUr1ug85F5rMyX8i4+27LWU=@vger.kernel.org
X-Gm-Message-State: AFuF++l9S0IJMRniXf/hkE7yWF9cwiKvLjahrgu7Nedb0TGk80xvaZmF
	Mqa3erWavuHOmaI69forpRQeUK3jiaqoawkKX7xEaChdfw35BbFhZ0ROXCo7h93Fz/ArY0HywC6
	jb3KkIOXV
X-Gm-Gg: AR+sD12Xitjkdv02ZAyHOQU4o5mJb8vjC2d4fy0yHr6/85LMxrHul7EHTklcnEcS49w
	SN1jnZLxpRWO21jL9vLMqxQ1bGVTsSbjEDkhrTvEzQv2n9f1bXWgtcxRMENwhEEBeU0L0cj15OP
	eQWXgT1RBsKfO/UqtVi973BM5JXFD/KVjHr0nCYHwTWEc4H8ztnRax4tkXQbEPzPgpgCFh7C1dc
	uKzdkxVxEeVfzP0QP6YSsPtRsy1xSzJyuG3Ss0NlK/c+NhIxLYLnDoTH/J/E+wOP6XZ4Vl0fUoP
	On5+c3TOFBotnd1hltXmMwandTgXgVzfXdCmfoBMcxTi0vdM5EbhgtSwhV6Fz3YV56QlY2IG6YM
	9jBz4LNcdvWc9b2uvz815lw71pOOcaQVEnL/uOu3zykNNUmiysRy8lYFkXZzSpg04oCYKCpkLka
	ZW0Ie7zpxybw8QQhvMmk4JhSEvWv6xrgl/2/UIjjoZM39SIjXKxoCSGzf0+A8yOgWxpMvBB8ylG
	Q4cs06pCyslPBfbDj7xg3PTssTFOV2oASvTZkMJkNzPXxOAXHfM2vgmayo=
X-Received: by 2002:a17:903:2f8f:b0:2d6:3c22:994e with SMTP id d9443c01a7336-2d6e083547bmr879725ad.11.1787601712132;
        Mon, 24 Aug 2026 13:01:52 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef2ffdcsm2379917b3a.25.2026.08.24.13.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:01:51 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:01:44 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v8 12/12] Documentation: PCI: Add documentation for Live
 Update
Message-ID: <aoyjEftPTSs8GDvo@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
 <20260728221007.2098560-13-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728221007.2098560-13-dmatlack@google.com>

On Tue, Jul 28, 2026 at 10:10:06PM +0000, David Matlack wrote:
>Add documentation files for the PCI subsystem's participation in Live
>Update.
>
>These documentation files are generated from the kernel-doc comments
>in the PCI Live Update source code. They describe the File-Lifecycle
>Bound (FLB) API, the device tracking API, and the specific policies
>applied to preserved devices (such as bus number inheritance and bus
>mastering preservation).
>
>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>---
> Documentation/PCI/index.rst           |  1 +
> Documentation/PCI/liveupdate.rst      | 35 +++++++++++++++++++++++++++
> Documentation/core-api/liveupdate.rst |  1 +
> MAINTAINERS                           |  1 +
> 4 files changed, 38 insertions(+)
> create mode 100644 Documentation/PCI/liveupdate.rst
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
