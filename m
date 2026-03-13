Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1697538655F
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412094; cv=pass; b=tOVDpAijEkLim1qBd4j5iXvBz0p6MQfmoFrfc520ncN8iJk3BNmXYtb3UaixpdCkn1g9WOi8hw1hudoDIOpxni2jE5oHtS8mxYDNogL0vkBqXMB+xOfq+OtLVwDf+GOyWZEDARnL7aU1R5CC8B6lRKLlJdNEAR/yo4W5zeBZjCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412094; c=relaxed/simple;
	bh=3DhJJ93cKQQk3SpyT61kIFsBKzCFpwnhRvsErphsARo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IW18lwD2kEBRwthOCL7sYxWBWZ9hPSvC/pGk1g0Ic5d+r/x3MMCTJJYRfqqDR4tIyaxJy003l6IZfyrttVADFIN9FKoNAqf7VIyi7e7ntp09pcVP6C4byMbUz2YKMnHtBk0gIFFp7HeJeU0pxy6L4IJLi58AxQJ40JUTzPYVR1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=YeCFGCgZ; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="YeCFGCgZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-660dcafc85aso4222452a12.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 07:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773412091; cv=none;
        d=google.com; s=arc-20240605;
        b=lkw80+n2K8HCruZHhLRV24WbvM5zXH4Al7xSwBQC8Sexljv0y6Ffl9KHLoLXbMUAzq
         TX0ScL0Zkj9eGIRxViBv5hNiipQGBAubLA0UVSlcfWvL5AyyXlJ43+DNwmYz67+9s5Yr
         WPGEed4HkKpShv9CxFKflwGWKPDQD8XKx3OGA84G5/vj9KCuoaonc6zr3LL8jZ24cxuB
         HWce2vZgvPQmSdLYQiDsv4fFcm9LYitWUcz62KD3u6xAFf9ue5qo7t61EE3HKPNfVO1D
         EobV2usVCp10jhTZoBRqOfiFw8XZdFgG51sGFon/y7Mky6A3MF/8e6W7YXPTA4v+R8tT
         MWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3DhJJ93cKQQk3SpyT61kIFsBKzCFpwnhRvsErphsARo=;
        fh=PaPhXYxf7JM8zcTm5O++02Oc1cEDX9ES5QnwauZnZfc=;
        b=PAaTzPfkW753xifWUgL/gKExA6bbeGt4m2irPEpL2gR6uPwuHsdu7ZYj7odkk6U/iN
         q6xQcLvtafGoIjL42S5kPZi7xJn5RxPyGcjcdr9KSHHGbfROTDB5mkjqk2DsUG17y0TA
         EiZdQpKM55/dxdMoQoPxzWD/sykol8d9BmDJB9oG4kUBONvthuVjkFsiIjM1j6DFg4I9
         BoQPsQ3PqNOV+3G40YLjt/NvkLnk0Fl4zCXXjGOY4EbvI6kLk6YxjBsa7LWz/PWqVg8g
         ZnXqe3sr3drFkb+zPKScjkReAD4dYLrEO3CYIDP0WOUU3kdijV+Xj/i2/9aOfKzqm52D
         e5rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1773412091; x=1774016891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DhJJ93cKQQk3SpyT61kIFsBKzCFpwnhRvsErphsARo=;
        b=YeCFGCgZKDa67SbVHtcat6FDI2p7FQTFB0W2KqT/xfXOeMq5fFxQ7198SdTzNflpr0
         jaqLH90TTIjgwaZGyc9quNQhdQsGFZW9/Bfqywg+2QshVlHXZxQ7kSYlg2m6QIn3k0uI
         amzLV0Jo5lwcj4kXMrR1CUsGJTI2AQm9T5tCXBJIjoR3E9vzfOFPiKOvrNNjd8+/sskK
         oF87eECgUqjRSTCrvddU2DeUVvGgcAxBFVXBGp5rsZACzS9VkMR/s7D7V6IGJJy+Nd2r
         D0nyE8GkcsENU0IyoyfsnkROkCO2C0+QN5iAj95BVoavLIkfRa+5IumQew+drPMSJK6w
         lU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773412091; x=1774016891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3DhJJ93cKQQk3SpyT61kIFsBKzCFpwnhRvsErphsARo=;
        b=QU5nSoMXSTDtBC5IeLfkPz1bKv39v4WVbOzOibdG/6Ro8T8jaeetjFzRXDWuoDT1rf
         8E8EOh1jJIdNGH9MUVVxwWzYLUwxkFc/aPwGbMO4ltFhqP7cgSsXYpgqIfsNvhxPmddP
         SRNFVof84K+J7FYjF6Qmv00ka6aXzIZ+o1gJ4Q/Qve+zy6NXAswPZV6G9ptmsQc4EY3i
         zhHouTltaU9/OnSR8g6xmq7Xkp9LHxXKvCKTZMXxDIRvBEBMBYMBZvVAZMNEBnthlCZa
         //94B6c/vS8CTJi1Z4zkc2SzRXcPcXoitGPT9MPLSeVtv3JpXnAFvzxP18ZeGg0bg+kH
         2HiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp7HqBfSWq4Rz6DHOflsqd2atoDCX9UrT0lK6PhX8fq/PHjsAYDCjmLTivg/pl3FFCv/RgcHEo+p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYYykeDv6jf/i7g5B7w/IPijS8+c9c6FS1uM4eeU2SOReTzLAk
	8yFZhQVunZ0QP+g9pi77xbVpzGtH7cutNzlYeoHqV95lvFlKc3/ULG1CwJyxYU9aPXkRo4SeoNL
	LHZv3+O3pCErKt37MC7AjMogdSNZOQSN4wRfy3YCsOg==
X-Gm-Gg: ATEYQzyHWuxt3tugCmw/lNuW5Zg3e77FiVT0cN+Za1HJbnzySrbnfmK15m6wse6L390
	l1KaEisGrKojz/fEaZVcpXI4H91g+jh1lOomQGJ3fIUzIVpbHSeHqgglbtK4MoxabLoGM4o85GX
	Bv1EwRfRzI/zVVIw+pfvaZZVZmbn3XJCe0l466CAkKJcUk5AlGZ7vpy1Z4QKGm5TxbtZsWZ2bdM
	O9WfWk1SORT2ZwoFaGtiFH9FHY+HLDrhr4lIaiEEjjPwoZyPxRmpUWb8qmnkEDT/v5IS6ELmNBc
	dWcNkuH4IGg2bvre4Om3zJZycebcjwK4qEFxGw==
X-Received: by 2002:a05:6402:35cd:b0:663:8be1:3649 with SMTP id
 4fb4d7f45d1cf-663ba9b776dmr1936388a12.3.1773412090104; Fri, 13 Mar 2026
 07:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-8-dmatlack@google.com>
 <20260226160353.6f3371bc@shazbot.org> <20260303210733.GG972761@nvidia.com>
 <CA+CK2bDADhFcMVGoJew9RoJ-DsVhYhiZJGJVwfzTBZdGX++8Ng@mail.gmail.com> <20260313122525.GB1586734@nvidia.com>
In-Reply-To: <20260313122525.GB1586734@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 13 Mar 2026 10:27:33 -0400
X-Gm-Features: AaiRm524CkK4OBTNvXFWcAvWcl42dW_YCeYpiFYkXzW17TUn9itgLI7yXbb39d4
Message-ID: <CA+CK2bD2ryZsvgono-5Yg0jwwCa-p55wefT=hn3DRsDJVc0ADg@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] vfio/pci: Notify PCI subsystem about devices
 preserved across Live Update
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, 
	Alistair Popple <apopple@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 8:25=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Mar 12, 2026 at 08:33:27PM -0400, Pasha Tatashin wrote:
>
> > If there are active sessions (incoming or outgoing) with preserved
> > data, how can we safely unregister while they are in-flight? It is a
> > rare condition, but since the user can cause it, they need to be
> > notified that unloading the module right now is not a good idea.
>
> IMHO blow up the kernel or something in the core code, you can't stop
> module unloading once it starts so it is pointless to propogate this

I see, I will send a separate LUO patches to make unregister functions
return void.

Pasha

>
> Jason
