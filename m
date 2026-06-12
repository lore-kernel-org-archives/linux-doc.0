Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7637DAD6
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261236; cv=none; b=EPDdabEerB9ki1sGt/hLQ1tdR83AIB+Lz5wD787oqp/0d3+LdUwRTVJUxh2ekcUIwHRhDC7raYmPnS02xA75KSFPX5nr/PmgWXNUgzyad6q5LOYCvbS+B9TjvoGj3xB9lmoP0rO+xec1lPG+lbdsmcwNfakuGszTRXpCb1PQVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261236; c=relaxed/simple;
	bh=klfiiHVrid71PPzvcY6gYtk5jDnKIjwVEJeiVajF+y0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Vzfyj1SpVE5JqFYClPuwkuTYTGCMaNMAtAk0i+MmB0XOcvmgGojhGCrZ5Z292Omv0QZOjzSMgIPW8ABUnNzL1F0XGxqoyRMaRuTJQrWIliYP3J2GtvJgHShtKsnybpRSfgFmX7kgP86XCzFMuxogS62Hgztnemk6ffGBG1Bw0b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=S/IWrQnK; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="S/IWrQnK"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9158629a220so97107585a.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781261233; x=1781866033; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YX03BK2qmjHf2a7Mv9URt0qeSBupGSFb+1E3T4/eV8=;
        b=S/IWrQnKuZD3jseVTxrVbQGsgBXfYl5JEkycf9tY64QFDmCN9IKuEGW7aHCltOlR/p
         jQuzA8bAcOo864Te0CTac4QShc3Aysa5NwrkB8y6tPQO1fNsDzAuyNTUlLFbb7VUtBQX
         cm35JSwMRqACP02Yu6LlrIaYbbJXChnGkZ7ujXyPBEoeHmhK26TWmfa7Fh40od/o10JG
         g4m7pXV9dO10QAor+WOdl07Q2ycGctIOGl5rbc/LpqkEiEHPtX/Lrn3MMt5OrZxQ196y
         9EtkvSj3l+hdzdA3xItKOdz/rASeglOSwhJZqOjGd/p/ZlTjgI4+lIqD4iG9fqw4/usF
         aaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261233; x=1781866033;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YX03BK2qmjHf2a7Mv9URt0qeSBupGSFb+1E3T4/eV8=;
        b=WTIcJ4sxeDLnLiEBV+Bnw58K0J876qxxMBTIecWTBkzZZiolhCh7f4cUtdFAx2UDur
         6dLwrH2yw7ViKZNP3353vdLXaZdy6F1V4FGztGLsu/VrEsLGFuc1KYeRUTB1YJZGtOrW
         TGkhhV0Hgb+2aX/z8AKn+OMaHGMcKC0+IslR2F/k5o+sVJ+Ebp+6oPOKBpdVqMTdPgM9
         r8i7hJ8GVidVm2lQcNSd1ZhHbB+zULrALN0EpJKFstrF449S51FYlCdhlE4gFhcm1zIx
         wkXTe3FMxDK/Q+UcyW6AgcGGku1TUzti+HmmRfRA16nXlRQ0HllP4921ZzV4uGcqTbcp
         QNPA==
X-Forwarded-Encrypted: i=1; AFNElJ+3HX8kOwLDLaUp2jnlwES7s6LhoqO+83NXuGRGo+r20dS+LMRPlq4vlJmJDq75yGs+OjM1XQ1ac8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb74C1YmKVJjd17WLdj30t7GUkwZKnDl08dWX3QF4OZTY9p4+Q
	2HN0Kco3MEoAqnUFRYRxArNcWWXsD9x/goQhYfeRzqx9+f3wYdbr9t0X+B8kTpJ4M2k=
X-Gm-Gg: Acq92OGrdSRHpEmwuxpK2ZlJgVtn1OqwQwR0jPUzw4mtRhZHYy+u53RkLh26exnV+nL
	UuU2Wym7uvD9l0lCa5LnLE39QcwUBgTbD0vdNBlWH2I3ilCVXG7vbwDsN/vG2V9ELRPB/dBnBG4
	mgDO4XoBsHz3ei8TAwAOXq01HOLEpJQo9c0jxJTw/OSlACK9+LFJnLjLyjI8zQsk0gSTkkCD5Gx
	GSeo8zFo9j3AuG438/wQLTx+L2Zw7mP76aOrRvd4u4HNzg28vQBw0+0dFEhY2/K+VEUOasz5Vkk
	lVP4VMQDTHNrlA9wpKqvWWg86z6D02+e7x5lIgK9l4uwgRWnP031Wx2e2Z8x+81TAi/v+nHfM75
	KHboweqJCURRkTQdaL8uIULb8uwtqgQNycNNnkG7tf6ZNpUSsO9HoiDtKpB6B4h2IHJbPw7eN5V
	pRyN3sXvm20T5Dv6ydc1dlh4NazXmfaZRw8xL2kbY9iPSArD8iYh1vY4RrSkBl
X-Received: by 2002:a05:620a:2894:b0:915:d5cd:8ce5 with SMTP id af79cd13be357-9161bb00960mr256901885a.20.1781261232925;
        Fri, 12 Jun 2026 03:47:12 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30457764esm19942056d6.26.2026.06.12.03.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the
 PCI core
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <aiutNINqxhtlm2Dt@kernel.org>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-2-dmatlack@google.com>
 <178124130274.908199.14827357870284807134.b4-review@b4>
 <aiutNINqxhtlm2Dt@kernel.org>
Date: Fri, 12 Jun 2026 10:47:10 +0000
Message-Id: <178126123047.908199.12042730612990730743.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=862;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=klfiiHVrid71PPzvcY6gYtk5jDnKIjwVEJeiVajF+y0=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqK+OvGft7vBLOTTPKIur68ZEWcTau1cnkC3skC
 zr1NiV+qhmJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCaivjrwAKCRC7dyhM23N6
 3gyZEACjBtejaa5EWZ+XlEJc8O4GIePljN4Z+SFApZu13G3wo00ycXVVPBN6V5+aetDEBlFZrNY
 xw5OagriLkgPclJeE/mSxyOeT440nRV0zQFEVcf8vhFBQLQKCxAyB4642/MrXNo3B/PkoAoh0Me
 5aOMfam+XcBbudOzksGfJ7ZLSORV98BsXPrQ2Gsb6dTXgHFl//fyMWjL5VR6c1NBooV7xs5ZAO0
 OyLNZhDXi7tnur55gyTJ/0gH3Of9YOHVcrWYvVldEyhPy8lii0HEPojuUI5xhRYj+yZLO4kKpik
 FxHBtPVm01/VoKz953HN8d8gCvKq8fV/OXil9B8twhGfhtiAy9trrIboh49Hu9Y6rxKp8OMT3Dd
 YNjvpceH8opcMcU/iVBCcdU9MQUUtHcImaw1YvucE4iPfFH+ReeBRJfJ7KWFzAQbqwPUctLC4Je
 OSAgwwcEBo0QmBxa+F8FNfgRqKBMV8G9vlEkD5ZmjiCsmA74UHfOgL89LOWmLzxYFnubGLMUU/2
 25SbVIJ/Zdyyjp71SESgIGRiKKuS3NfU7976kXg7Jclio/CVpIz9cwvxf3WMC0ZKYqgUjX84syz
 6JjnY7o6rWtYmf1Cous+o64R7Pxmwz2jyxzHbudSfK2qe8Lcx3aT1oGWKJA/9LSyKcHdQv9dcrd
 zelYBz9lnBEqGvQ==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On 2026-06-12 09:54:44+03:00, Mike Rapoport wrote:
> On Fri, Jun 12, 2026 at 05:15:02AM +0000, Pasha Tatashin wrote:
> 
> > On Fri, 22 May 2026 20:23:59 +0000, David Matlack <dmatlack@google.com> wrote:
> > 
> > Please add Pratyush, Mike, and myself so we are notified directly of 
> > incoming patches, the same as with other areas where the liveupdate/ 
> > tree is specified.
> 
> Or we can add PCI liveupdate files to LIVEUPDATE entry.

That will not work, as we cannot serve as maintainers for 
PCI/VFIO/IOMMU/KVM, etc. David Matlack will be the maintainer for the 
PCI components, and we will accept patches once they have been approved 
by him.

The simplification we could do is to create an email alias 
for the live-update tree maintainers. This would allow us to use a 
single entry instead of listing all three of us individually.

