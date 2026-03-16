Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8E2341ADD
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684714; cv=pass; b=GXQ6PCb4uAOE7hlW1uXIyHMVvJVEEwaM5Y71aRilF7XxR/fxp0ctTIr5YyjKHXmme1wI5Nf2zF050iBDlU1IMNj/OIuJMyOsMCxLd+GWGXoWe6UxAOwDC7iNTkLrGt+d+KL2BnJAm+ucnYgirS88NvJ+0qFd6vZgCdp5Nt+GVvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684714; c=relaxed/simple;
	bh=m7+JQVttlm8dL3EZ1N+mfhiI+GNnG3dsJzvTlqZYD9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqlqqWf6pRBVnzOjMF6gparylbfh8CmmoRW+40MdAbXT6WnSp/wdXO8v0IMzxLDN2+WfXJIsxzkdm4J3i6kFYHaHB5HY73p+LJO+1lgVVzfRuY74s7z7Xb6DUddTgKUEAud5vfXDQyHUHZdlRj5bxwjoiui2lDKwROAtIEr/bO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VBhIongm; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VBhIongm"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a1273de95aso7330580e87.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773684711; cv=none;
        d=google.com; s=arc-20240605;
        b=Al9aM3mrBdWBWe8UDirMms2XXB47mo0/RLj/SRN5Po97pP6JpZoovTyeFFasZv2Ca+
         z+gPiLEQDzK7Y2okDQ319ARZTZ/YjIn0w73r+w6YTtMoN3D3kwAUqbG0l3U4ZIhR8umH
         Qc0P3yNgi5ShX0rt6p3cLatPW3+k21arHnOEn9j9eSuvXhawSkDQaC0Qk4adS//m9ibp
         l2Ghh226INqaWHZss5nkUMTilIIf5Wx52H5z6uwfET2JJ99baA+C2gvWFgLMAln+CNka
         J7WoVwAsJPpBDQCUS4DOPPoV903VWlem1MXf+MbC/XX3YbMBgpMqetDgs3A9n4sSI+14
         vUYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hacBXTanIx+HGRz6G551slI/wF3dk8INyCTw5fzLvmE=;
        fh=nxyxpUC0CqBOSc5/hT4cs7JxvUEhU+WsCqkz4orK04s=;
        b=Rbo4y/3ohF0CwLFA4oiDi/huxmrmc/h3Tj2uvwAqKUsA/I07qPEP3OcYk+5YNmYmcz
         WFNoW7D0xb1w4iwBr1Rmvb+GUxCV/8J29mU2XUO02jpFpaZHrAd9w7Sl7XJvHFlrmu31
         a25uqtsUYsj8pbZhQg0bRso+eGZcZO0EciLWGpemmf1G9JcOnkg/cLqYIu4eD7nodAWI
         cJFWHT73mIdFYT6rQKpZVztpz2P6MrluL02zluOQePj2xTOwAHUXJpMTGqGzYO6xeWRX
         lm0tNICPfTYVtPkkwG58JnUxNDLhHsUtTAHIwsCb+G+iSRyeTwoPDufPwzzS720sDtHZ
         +Fcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773684711; x=1774289511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hacBXTanIx+HGRz6G551slI/wF3dk8INyCTw5fzLvmE=;
        b=VBhIongmjKT5GX15RigVAqB3TAHg5zb3CPQCJF1PG3YwTx7werPdrRv43tZqYqSGH7
         3tYYHUI+GOUEQf+ijdR1xB+SObWGZgkGEWqLuvHymr76oqSHHMWG9Wx2taw3G+FTLHDo
         Ao5UDZjjZxr3Ryk4cOG3aNv96TYdm7mJ/cJrLHXY+AMI4cjhSuGTfeTZrQF9IB7pjSZ4
         C3FjEw9pY45ntR3Jpyk8cQw4M1v44473xYnYuus73S9Vq3tWMtAB69WUudaO9PF5JuJq
         I885hbcRKWNiwfqMmFtSJJ385YFJlNipH0AGR0lqcmK3MX51zePLBhbkMLmPFQvSHt/x
         PweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773684711; x=1774289511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hacBXTanIx+HGRz6G551slI/wF3dk8INyCTw5fzLvmE=;
        b=ZKF6LSPtRoNMkW2YF1+UZqkP83WBTgnx9Aql5wxVEwn056dnUDfFN3Pl92yYNT1ULg
         Ios6NiMePnIJxLWQU0rP9i73u1XTIMP2UCUTCxEbqVUZOaL0T4SsiA7rNO52bTYVDdU8
         2F5W4G0xOguovftGiLQiMWlqnmxX/YqfXnygQJk3QmQMFwZoLVU9t2sB1HuyGWOugn+E
         3HeyO+LfbFoXhcZ6FNxDoxPdYredh0s0nC067HuxX19t+w9GGwgiOaXXONDevi9drGTh
         7GUZNJHFJQ9WNZM1TXUeeAylxhe/u4SYwfwsR8ADrBAdJ/OJ3QAJlIrzP+ECo8eD9Vau
         b9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUnhPakF7uLPo78Zd/loCpIFUdOvtUb9ay5LogQpqZctiVZNOBvpGpiEwcsvv+gVOfSrr2J1QsUizY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAZ8sTB8x75DKST0erNSSd/XGt9AexLswOWC1Pwhz4ulwSALne
	MaAMepE/NsxNhRWpdkvVV7x6jh5ugPXu77x+QBkIV551Cne5EQ5ZZ5u4lvEDFHLhu5kVqzaDrp2
	2L7ioPafTNf36coHfPAMp5vwgRGOIpj9FPLsABpZr
X-Gm-Gg: ATEYQzzbQOBVlkC3XkHJE/ajrZwI/VRzPnhU/qLkL4gmdFsqLirPXgR9i+Ad/PM1Dvt
	ILWY24HfI/Kpr1oX95m5cva3Fz0sCsTMtYbOUebmJAVvrq+uwP4mN7A1V5Z+s+EaY6t7Whukxzm
	bsR2A154OQEJJfD0GV0TMW4jxpAf9h+JnhbFyK2Ub1fh0NSYeB+TjL8n5JaPtcv6ieBBhU70nr0
	Ld7dgEaBxbtHXfbQkiqZcJ0+JBkMUSXHSg6LUcuc4dcPRMyi1228z4O10nNlHb0+qz4EwaV4ShU
	YnOXg7vx
X-Received: by 2002:a05:6512:24db:b0:5a1:44d3:7601 with SMTP id
 2adb3069b0e04-5a162afb717mr3098120e87.20.1773684710999; Mon, 16 Mar 2026
 11:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org> <aaDqhjdLyf1qSTSh@google.com>
 <20260227084658.3767d801@shazbot.org> <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
 <20260227105720.522ca97f@shazbot.org> <CALzav=fjRPa_ZbXu7iFXyemcf_8Kq_dZTWT6c-A0bc6czF_Rdw@mail.gmail.com>
 <abNOwcOTXqxCxNzt@google.com> <20260313083918.00005731@linux.microsoft.com>
In-Reply-To: <20260313083918.00005731@linux.microsoft.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Mar 2026 11:11:20 -0700
X-Gm-Features: AaiRm52c977M5CVgCJmgqL9NIwQ1v_KtuafdRnOMJexlLUpZndu_UH9phsJ7tcA
Message-ID: <CALzav=eGLpo5nrsHq5L8bUTC=FWZ-SgrTE1FoScrWB4p+NDgnA@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 8:39=E2=80=AFAM Jacob Pan <jacob.pan@linux.microsof=
t.com> wrote:
> On Thu, 12 Mar 2026 23:39:45 +0000
> David Matlack <dmatlack@google.com> wrote:

> > +config VFIO_PCI_LIVEUPDATE
> > +       bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> > +       depends on LIVEUPDATE && VFIO_PCI
> > +       help
> > +         Support for preserving devices bound to vfio-pci across a
> > Live
> > +         Update. The eventual goal is that preserved devices can run
> > +         uninterrupted during a Live Update, including DMA to
> > preserved
> > +         memory buffers and P2P. However there are many steps still
> > needed to
> > +         achieve this, including:
> > +
> > +          - Preservation of iommufd files
> > +          - Preservation of IOMMU driver state
> In the interim, what do you think about moving forward with noiommu
> mode without preserving IOMMU driver state?

I haven't gotten a chance to look at your noiommu patches yet, but I
do think noiommu will probably be a good way to develop the VFIO and
PCI support for Live Update without blocking on IOMMU driver support.

> I=E2=80=99ve tested your
> vfio_pci_liveupdate_kexec_test with the noiommu cdev, and it works as
> expected.

Would you be able to send patches to add noiommu support to VFIO
selftests? That would be very helpful toward allowing us to develop
and test Live Update support with noiommu.
