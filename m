Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8823E40099C
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657839; cv=none; b=MEZyyaP4yBRcRIBb1qnLMepioIX8KUHpPt8UY6ulPouFPohP6wlUzpzx7qZVxJ9JNgggp+8uVPSbTZbEphFmHiB0gPfaNoKQ9HGHuZQakwDcFqGuhRERvny8yEMlsR2n17JcyTXaY8cA+1yH/WTJCqtPl0tuEMAjoQDyCYq7x0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657839; c=relaxed/simple;
	bh=Fo9WpNwT/sUGT1i7/NR5Dmr2ueLjAaW0mDLdJx/XgD0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=FA08GdZyseGSC0KR/uEepmmsraMw9dF1WQDPiUsVpQ8yyB5eVnd7+R0kW6zsG8Et5sDYn9Vt74KiczlTMzPdwlgVG4EhDetAF4BWRM1FtTarel8kesU6r/iQzM5VqgGC+V24UhRtUmRSildXMOd50NLFUUTz/BGeb5+Kd7j4muQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=WgiG1y8H; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="WgiG1y8H"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e7c6ec9dbso621330985a.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784657836; x=1785262636; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f+9XXd1f5+onL8AjI4khFaIFq5nBOeaDPXuilZKVYdI=;
        b=WgiG1y8HfyCVdtBQQ4KZx/5BSgIXEO040Im5UA3C+HiTnzIHXGTSx2tWE6n5IlCKIW
         Wn+XD5YbK3czO15QMK3qOpDTVC87PN6nNBbvAoAO1gSW2M+baar5FwOsufzOSGwSyQ0f
         45cGzwP23rMDrU1NWro+2vNi95WYLv8kEJyglxtA9sygDg4NWgplwUNkZpJ9+yjdGfKu
         jWaZkcmE2hPaLfdKeutBTTg9KVRPfpKSrbk6JESl2JV/WhfSufnnClRWmTeEM5cjO0y7
         ouOuywMdBbJFWw9xTkmN1oMMfQVU870iE8x8OFdjS5jxuABovCgp13/cg3igMw/z/qRc
         6Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657836; x=1785262636;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+9XXd1f5+onL8AjI4khFaIFq5nBOeaDPXuilZKVYdI=;
        b=KnaL7kjvkEtCl/GIKfly74HEmAnrRazNIOmvLW5EIE0Pu8qibHiqxRGc5NryLvwJ8S
         cg+HFSyNHQ+qHPlOe+xSKlnxDM0qJy7Djzps41Cd3d9Sjd/mMLxSIizl2bY/OU8WJ5KQ
         I+u8L62xB6kzrrKKPlS/yAMf8uPGJ4YaHTXO6ju/ON9EdkBXQPvI/57mAH7FUmF2xVdy
         g7pe0W0rv1QjxznGW9mwFHURO1fzJm4FEdDthixjlhLGkIjJ4WubQP799JiI1hdYBbOk
         /3H7rgfthKLt7w7HTWBnomTRr6qP63edFiEOpRf+JTZbe3x2QIrr+9npEiGF15W6cgmQ
         jnsA==
X-Forwarded-Encrypted: i=1; AHgh+Ro22obedHN7av6J8jfXnt8yqus7ETZc5cKklKpwuVeQkRJXigg4mBqYI0cH5TBJz8ShLTfkSP7VIQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBkngfei07AWGtcI8qW7N4C3F6sXpWS4Rri2IjP3zqcxsGO2/t
	9Vrf4TkRfbaOhseaR8es0DhJiix52qaQm/yHx57jA/3kI4CXCDeQ3vbPJ3zhnN/20SA=
X-Gm-Gg: AfdE7clRrfrVXJ7CaKD6pQhGN28oUMJ+D2HBj9UIaeDSABQkEru34frX7D8+W5jShXM
	xhubW77mzfFDTWteWVCh8sFo1tN03NcBG9RbKDP87YhD83oRSMOT7F08ZmGp2gsEFV3rs4vyyZ6
	W6yxzzJbpB3pspXgMB/OBR4kopiXtDlsfKhU07rdnf2GTvureCzB1zbzK0Mm3jkaqKCiKTpDE+3
	dcyTopMfal25nBg0cG6jusjpt6/OLTFTy4eNrFNU8eOVdeqXe91PR40IyD1HYsOOzM9/QOmIYf4
	ykBB7QEU71cbNgHRaFot6zBH0oZnyE645CL/XoODcauJbOjlDKcYnfvNhkZstw/71bDEdu2Sr4O
	5e2zU4Hf4QqmE5OMUGHoBsarUA814Bz/Pq1Cn/W4P0T6f82SBKggbvPZfoeuuqYAXKtLhjmRlzz
	BmQu/Ow9elqxiKYstHJyS4F4HLohobvuCRamBb90SJMjOWEh9i/Q==
X-Received: by 2002:a05:620a:708a:b0:92e:fd2c:6a21 with SMTP id af79cd13be357-930b3ed4e6bmr1951409485a.27.1784657836474;
        Tue, 21 Jul 2026 11:17:16 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52dd4c2sm1177061685a.6.2026.07.21.11.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 09/12] PCI: liveupdate: Inherit ARI Forwarding
 Enable on preserved bridges
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <CALzav=eZYfYYKAGEzk4TsGFLp1TPb2iFePNmqGsjX4jEZNJ9XA@mail.gmail.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-10-dmatlack@google.com>
 <178433098576.189683.2364970585754668266.b4-review@b4>
 <CALzav=eZYfYYKAGEzk4TsGFLp1TPb2iFePNmqGsjX4jEZNJ9XA@mail.gmail.com>
Date: Tue, 21 Jul 2026 18:17:13 +0000
Message-Id: <178465783370.437204.17382376546970842455.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=Fo9WpNwT/sUGT1i7/NR5Dmr2ueLjAaW0mDLdJx/XgD0=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqX7eqlp/ogJ/HFSfe9d7gJvqY2QGlESov+8vFK
 UnrL0B5ofWJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCal+3qgAKCRC7dyhM23N6
 3rjiD/9pLAojhUZ3Gw0QkDSo7CBHc6v2wUGVKaF2iWfP34rUPJsFfVEgg0jF9wmXV0jX94tyfnY
 58vcRgopDo9BnjdD8MJiKFLY+c/1bwgj5XqBw+4EWhLvz1cWvI0pK57KzZJf31wAFALQ1n98Pex
 seGiBWeqXy76HaXMdWJDmgR4qaB2Vj75oUuWMgQjY/Rmh9diTQj64aJRo0Z0TliMy/x4gDC6h38
 +9FxcViNa0lAmfU8/om1ODmLzJYeNSkFs4cKpSTk2bzfYB9eamzgedskRKF1qKnP5mzg6GJcu2D
 OAMcwa46xXwAqfr/gFHQBaP7I/C+IJECu6cyTskw9gA3Zq6Q+2i/sSvfgeKVZQlkttlbmR126zD
 DxnnvF42qrMvHhoRSvB9sDlwSwmLklefh37cOifSHw+vVceIzCVZjS7Shfm3AddiYxSYqYcNaY3
 6MHkGOo3+A0GZ8YcJafB+8ex0TkPCLiZwlXZXCxLB9MeHjmJX0X5cFrb9n1luDPUNQVXeLK0t+4
 lawS9ROqKc2B9vkgurKqrFrmOZQjImBcdvlievMeF0JaXTh9/omvw+U/ObgJMAvq0Q+aKKb6XIi
 a5XHO7v0Lj4g+Vp6FrvyZ8Z67/Mqdn/XYGInU31avmh94um8Lqtsa1ygKrugCRiViW5TWEwES1Q
 aEb+GAhvGiNMESA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On 2026-07-20 16:19:00-07:00, David Matlack wrote:
> On Fri, Jul 17, 2026 at 4:29 PM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
> 
> > On Fri, 10 Jul 2026 21:26:12 +0000, David Matlack <dmatlack@google.com> wrote:
> >
> > unsigned int    ari_enabled:1;
> >
> > Sashiko asks a valid question, what protects other bits in this word
> > during modication?  At a very list a comment is needed.
> 
> This was my reply to Sashiko, not sure if you saw it:
> 
> .  pci_liveupdate_configure_ari() is called from pci_configure_ari()
> .  which also sets dev->ari_enabled=1 and is pre-existing code.
> .
> .  If writing to dev->ari_enabled in this path is indeed unsafe then that
> .  is a pre-existing bug.
> 
> I figured that a comment wouldn't be needed for continuing an
> established precedent (it's ok to write to ari_enabled during this
> path).

Overall, I agree that if there is a bug it is pre-existing. But we 
should also take opportunities to improve existing code and make it 
safer. In my opinion, Sashiko raises a valid concern that is not 
obvious, since there is no comment explaining the access of non-atomic 
bitfields in the header before the struct pci_dev definition.

In this path, it is safe because we run inside pci_device_add(), where 
dev is brand new and has not yet been added to the public devices list.

However, it would be great to:

1. Review the access patterns to ensure there are no concurrent writers 
   on any other paths.
2. Add a brief comment in this patch right before setting ari:
/* Safe to write without locking; device is not yet publicly visible */

or:

3. Create a new separate patch that adds a comment before the struct 
pci_dev definition explaining the bitfield access pattern, and how 
concurrent writes are avoided.

