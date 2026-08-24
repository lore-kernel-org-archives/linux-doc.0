Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F36338B7DD
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 20:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602405; cv=none; b=fC4db10FB/ZfzTgMAHb/aBtXqZVcHuiNxz9AURuvEF1RJjlB9WrBZrmskFTmIowEShVMp4Iv2X1B2u2IBM863zo9zbgWA/el6CLy85897D0s1yi+GJrZXV2BRZ8lYnA3B4jpEKRgRB1hLH3+P59eKbBUeYnuj3zgla+t4Ya0ehk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602405; c=relaxed/simple;
	bh=cQLKpj+oXjXRPyz4aL8hDfnwY/UhslNHX3Mtp9HFmCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxNU8pALwuRWZ/MdP4StbcAKdLyMUVyX4DgWS8+a17Gj8jH++kQGJqzFeBT96Cy41l7h/E01R+OAmwFeB0yTDYFIHqi2A0IqCnaQvMeRtBz0WxVmqSuEXcDc9ugulf8PbZ+wEJbXtx4e1BhhprNo+RRf4AfPJqfsCp/B+ZrwjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=crBa6Zqy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="crBa6Zqy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d3b440b97aso4965ad.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 13:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787602403; x=1788207203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0RIjz5iu884zqJfy1iBWck/h3gWNzem69636ygLdEIA=;
        b=crBa6ZqycLyhfNEl3uWHDP/2pnAL50QWyQSygZx5n02SdHNpWElCKEE1qTCrsDxK3s
         Vb9LTSks9p7z9VXpyLQmpGfyr9aYf3RiGd8ZCT87vsfJmhjBo5dBu+PyRhfGDAN+uejN
         IIoScXE3gkJbTV2MQlvf+g1brJ2tRPA2Ty441MVcDyJ+QXrBTv896K593+SD8X6XFSqy
         dEpucfVOtAceN7xwUNrlXLi2HrVHvUZNwbfgRmasXDE40MVJBmgse0xqi7Z3EpQ0gX0t
         Bfn0vDleRURtz5bnmJt8T/6VD8bSPf/xgRCWckdUgL1xhCPOao8tgH/KB9RJWa4AvlAA
         6oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602403; x=1788207203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RIjz5iu884zqJfy1iBWck/h3gWNzem69636ygLdEIA=;
        b=isqIHYBuUllURUe2HQOoPGJv7cwdx8i0T7ReSt6rWiB66J5p9vE1dFFA4+uwFwHWzE
         bHvlQDArDvqeSvJ+np83EJ/34EB8eli8vMsAPqwE4hHqmDYtNr/2ZdFRd5/IoAEyC9LW
         h5TBQ9F08qZcFqJ3woRanx/sTHtqoqD8lT8iBh4Z+IzMjrtPsAS6IGOzPascEmOjlU0s
         4U4jyEaxVDxL5VvsHxA8JKRoNJC+EL5rqdZvi9hxAQ9xwXaTWLyl8uFcgmjXTb5BiC8x
         mDO1IkvwAiCCj/L5w+oTxpvv+eIw4SdISqdZaWD5fJD8wXG/jd6zY0h3ejiwAWNT/ENh
         /+Ew==
X-Forwarded-Encrypted: i=1; AHgh+Rpp6wk+tz6L3ulqYT4X5jwSANKnGVm0DZkFo8POMrJT/4ecskohf+Ut2VTFHaCCmftvoIPWUTCDbMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mKvVf96Xe4i4v1slXg7yc5jOiaGPWQhAOng1ragSv+K6zkkla3
	/PWjGpGEygOZ0XE6dQntJRQSEcySTenW8fUOghlBDBnH8iHR9DDXmdhgPg1/R9IBfQ==
X-Gm-Gg: AR+sD12VSHiLbzxn34IW9Q2c6EeAfV7Z5Om1i5487w3+bX7xb8UtzBaU7Podto7iEYi
	ncART0OKQ7UOg7uNvFSjmJy8P01W3a/tmr6C0fmZqZb4fub+TGgmzYrmFY1uuGGsrBS89bduAb1
	EbHy2aia6urMbtzU7gLl1lT1evQv3ZWNrP+ABTVJ4tYtvVJWD2F9Zc5dKQHvM3XLZjbsk9thqFC
	IQuMAGVlzBCvNqEGStVizOYBaEVmigTfcVM2SP0uy0wxXhNBpeQ8zJ6WzJ5/kJxF/Gy3uENlx+7
	piLdQCSEC/7A7rZuA39V3jIGu5yipHb+YGEzvY/L8dgam3+p/b+kyI/YaEGA2RGNd9k3F323bKj
	1RDdFvWpI5kcU6KyNI/e2Tjakjc+X6OHdMAdmQoalCpQzYeURS7rGbaCccyRZEac1ILCk/oCw32
	BT7Hd+FDpA6ZiRVwiIYoOp7kKu6yYebUscYpk/XboS3y5rfcNK9+CR0pHyIXjpfBjDOrJyRf/LM
	Uh+Q9OTkodkL9KzyR2PBQUy22FJz5saqxpLkBASnIQYe4sUujUZsxIhOKQ=
X-Received: by 2002:a17:903:985:b0:2bf:3579:cdaa with SMTP id d9443c01a7336-2d6e072a392mr1090655ad.10.1787602402239;
        Mon, 24 Aug 2026 13:13:22 -0700 (PDT)
Received: from google.com (210.87.127.34.bc.googleusercontent.com. [34.127.87.210])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm795785a91.10.2026.08.24.13.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:13:21 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:13:18 +0000
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
Subject: Re: [PATCH v8 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
Message-ID: <aoylj_gaj7jMSXvQ@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
 <20260728221007.2098560-4-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260728221007.2098560-4-dmatlack@google.com>

On Tue, Jul 28, 2026 at 10:09:57PM +0000, David Matlack wrote:
>During PCI enumeration, the previous kernel might have passed state about
>devices that were preserved across kexec. The PCI core needs to fetch
>this state to identify which devices are "incoming" and require special
>handling.
>
>Add pci_liveupdate_setup_device() which is called during device setup
>to fetch the serialized state (struct pci_ser) from the Live Update
>Orchestrator. The first time this happens, pci_flb_retrieve() will run
>and convert the array of pci_dev_ser structs into an xarray so that it
>can be looked up efficiently.
>
>If a device is found in the xarray, the PCI core stores a pointer to its
>state in dev->liveupdate_incoming until pci_liveupdate_finish() is
>called by the driver. This pointer allows the PCI core and drivers to
>apply Live Update-specific logic to incoming devices in subsequent
>commits.
>
>Drivers can check if a device is an incoming preserved device (e.g.
>during probe) by calling pci_liveupdate_is_incoming().
>
>CONFIG_64BIT is now required to enable CONFIG_PCI_LIVEUPDATE so that the
>domain and bdf can be guaranteed to fit in an unsigned long and be used
>as the xarray key.
>
>Reviewed-by: Pranjal Shrivastava <praan@google.com>
>Signed-off-by: David Matlack <dmatlack@google.com>
>---
> MAINTAINERS                    |   1 +
> drivers/pci/Kconfig            |   2 +-
> drivers/pci/liveupdate.c       | 256 ++++++++++++++++++++++++++++++++-
> drivers/pci/liveupdate.h       |   5 +
> drivers/pci/probe.c            |   3 +
> include/linux/pci_liveupdate.h |  13 ++
> 6 files changed, 277 insertions(+), 3 deletions(-)
>
>

[snip]

> static void pci_flb_finish(struct liveupdate_flb_op_args *args)
> {
>+	struct pci_flb_incoming *incoming = args->obj;
>+
> 	pr_debug("Finished struct pci_ser (0x%llx)\n", args->data);
>-	kho_restore_free(args->obj);
>+	pci_check_all_devices_finished(incoming);

This should handle FLB/FD lifecycle nicely. Thanks for adding this.
>+
>+	xa_destroy(&incoming->xa);
>+	kho_block_set_destroy(&incoming->block_set);
>+	kho_restore_free(incoming->ser);
>+	kfree(incoming);
> }
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
