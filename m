Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FAC37755D
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 23:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776986873; cv=none; b=lcGE+5KofEWoGhe5sUjRql+2G5ziTLvwW9RuamL3WaKq//sPeO+aTDFORQyaMkPHnyEKtbgSOauQVl4m9fP1FdN2zNmWmP0Oja6mRk7eZXmDnL7AhavOIPnhBhzaIgEfjWch6i/ABygJj8Ccy3OqNmw+Af7vuuyWfj83t4vMnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776986873; c=relaxed/simple;
	bh=gCwmX1OtHkLJhZqpnRYlpSdpxrI4jzQ0Eg7EJB7J8GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aA7aLWvngkUqrplDW62wRaNCgmoV5f/sGgcsOxi7rkNBYYfCqyWCqIYHew6QkZ3DODAMRLKEan3+SHgFG6sMuGWvDqYDjiuVZVtr30SLPTYe8gkD0uBclU5omsEq6yE8UiIbZR8gZrOQx+uzhK4nqhJXZstJEbLjukzXEanzuAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y8DjPBHe; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y8DjPBHe"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b243198058so187565ad.1
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 16:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776986870; x=1777591670; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lt0LRXP7f5oacTu2NcOl/7iPlzf9+apNICsUQAZ1DMY=;
        b=Y8DjPBHeWa3hHxMbSz88wXYEAoUayTTessiivRl6o617Gm8uDsSALcGpeLvpUoQDeR
         xCzj4i84K3eQylbZn9c027XRRiswacYDUth72A2Qx78P9e14JNwbPNkfEAjn1o2D7e/J
         IJF7z4Ez6mYTdgsf10Cem+Pqz+nS23kTGskCOAgC/EKF/ttcdzXkDm0UQiXTfdN24e2L
         aXV2cUNStVMAJEahW+0uyAZo6klmdfdw46TNN0+DoZJ4HIZBfsj68lW4c9Rd5yaDjo4Y
         fb0nhO0qUmuQ6m0hPMDxhdSUyYN0SRB4M/+Qc98Lz1ahIJV5eLMScqt0pXJOCRFUOIk2
         1NyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776986870; x=1777591670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lt0LRXP7f5oacTu2NcOl/7iPlzf9+apNICsUQAZ1DMY=;
        b=VUxQo6cl+yggWkiiVtsdkbvNguaPTilw3SbcFYNjJyChiltlU+/gR3z8zel5CtZuAt
         lI8Rf68ZJwJ/MV5jPESdCSm3nw7Mc+9KUVyi1qSPXfj40CIOdqzrU3im7Qp65lGTpjy/
         akQQqin4Grv2an7M212E7fnmqKdedCspMp21tbGe+msVtaHK8kFzQmd+u2l/HE40744g
         NtXrwbS/yHNuwbr1Pi6t4lpXAge8AwJUPuN73RVosBeQMpv0XxLqCtPQs0VVAckyfMCJ
         VY1qz+92V8oLPYWN7v6LNZX9ATtWi4L6r3T3VbRt7OQg51saY4q2sGiJkijbclpvt4oC
         Fc9A==
X-Forwarded-Encrypted: i=1; AFNElJ/8qpRtmjDIlBzNmZ6+hFr9DTajSJIjql0rF6ZMcN++KvSMVMGTTb4QlI+4Vs+jDLhszFOfwGIBf0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqqSlz0/yk7rVbwcJaevAMHcIsfZ6OrZ4JEHImT950pa10BCr
	Z0fyRsOFYXyma51mh68cu0/5Mf5O9SLn72hkiamj7djoOREb+nXhtxvwMXGACQRSkA==
X-Gm-Gg: AeBDiesGa5MIB0OrswgEOTiKFIr0LxQvWRfRhU+u8hmfUoWo8Nur1gsUPzpMbFomVUC
	2pyRDPnU45nJmx11TX2F3Tnkj8YW9XgtpRaXEALhHvu9NxBrI+jz7AHT6y59XWvjf5QnkvJGMJh
	FHC/8VCxPjKp3cVm6WmsV5fZfpnKyWG4wMySD14ktpATq9r3kusLaWk+aYLaoCIGxAQWKZWO6/+
	wJL+wY3WnP/yonpY1Ch34+rSsEdR5BAri2cYs/D1yEI67VqqcsxuPjdn9u69T+KU0XlpE5mqJ5P
	C/L3gm+TWHrwn4ls5UWqgwcEYGz6SklPriWz1jd9eeUmqW55Qo82YYEBWqCmevaOb4F/xNwhGWI
	Nqzi7cidi0NycEGkz1VUQYyjocJwhtwalTMhk9KNQ+AdvSbVltECOOCVjgckfGdNndPVOacbSq0
	dLtaEYIzjUxJq+gY0p2kIB5Icrn/hIL+jN2O0dS7HMJZWLIk8m2175xHmUcnulKDkLmbXnYlAEG
	7H2gL+7GOo=
X-Received: by 2002:a17:902:cf01:b0:2b0:5e19:1862 with SMTP id d9443c01a7336-2b603f4969amr20900125ad.5.1776986869309;
        Thu, 23 Apr 2026 16:27:49 -0700 (PDT)
Received: from google.com (195.236.83.34.bc.googleusercontent.com. [34.83.236.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9cabfsm18153636a12.9.2026.04.23.16.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 16:27:48 -0700 (PDT)
Date: Thu, 23 Apr 2026 23:27:46 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, iommu@lists.linux.dev, 
	kexec@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Will Deacon <will@kernel.org>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v4 08/11] PCI: liveupdate: Require preserved devices are
 in immutable singleton IOMMU groups
Message-ID: <aeqpJ7BeBtzoPIx4@google.com>
References: <20260423212316.3431746-1-dmatlack@google.com>
 <20260423212316.3431746-9-dmatlack@google.com>
 <CALzav=dGpHEnEjyp8qc50iZrGeKJ47vjLvwtvkLCyNzOMJhozw@mail.gmail.com>
 <20260423225253.GA3444440@nvidia.com>
 <CALzav=fraXLgGs-XMc-=whMPhMbS99twFskGtV5Eo=UQ9mU5Fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzav=fraXLgGs-XMc-=whMPhMbS99twFskGtV5Eo=UQ9mU5Fg@mail.gmail.com>

On Thu, Apr 23, 2026 at 04:09:01PM -0700, David Matlack wrote:
>On Thu, Apr 23, 2026 at 3:53 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>>
>> On Thu, Apr 23, 2026 at 03:10:55PM -0700, David Matlack wrote:
>> > On Thu, Apr 23, 2026 at 2:23 PM David Matlack <dmatlack@google.com> wrote:
>> > >
>> > > Restrict support for preserving PCI devices across Live Update to
>> > > devices in immutable singleton IOMMU groups. A device's group is
>> > > considered immutable if all bridges upstream from the device up to the
>> > > root port have the required ACS features enabled.
>> > >
>> > > Since ACS flags are inherited across a Live Update for preserved devices
>> > > and all the way up to the root port, the preserved device should be in a
>> > > singleton IOMMU group after kexec in the new kernel.
>> > >
>> > > This change should still permit all the current use-cases for PCI device
>> > > preservation across Live Update, since it is intended to be used in
>> > > Cloud enviroments which should have the required ACS features enabled
>> > > for virtualization purposes.
>> > >
>> > > If a device is part of a multi-device IOMMU group, preserving it will
>> > > now fail with an error. This restriction may be lifted in the future if
>> > > support for preserving multi-device groups is desired.
>> > >
>> > > Signed-off-by: David Matlack <dmatlack@google.com>
>> >
>> > Jason, do you think requiring singleton iommu groups is still
>> > necessary/useful now that this series preserves ACS flags on preserved
>> > devices and upstream bridges?
>>
>> I have forgotten why we introduced that? There are alot of funky
>> things about iommu groups that might be important upon restoration..
>
>You had originally suggested it in this thread:
>
>  https://lore.kernel.org/kvm/20260301192236.GQ5933@nvidia.com/
>
>> Like if you preserve one group member but not the other what do you ?
>
>Yeah I imagine there could be some tricky cases there...
>
>I wonder if PCI core is the right layer to enforce this. Maybe this
>fits better into Sami's IOMMU core series since that is where all
>those tricky cases will be (I imagine?).

+1

Also I think this should probably be checked by iommufd and invoked
through vfio cdev. Basically when vfio cdev calls into iommufd to
preserve IOMMU specific aspects of device (PASID table etc), iommufd can
check this and return error.
>
>> Even if you have ACS flags there are cases where groups are still
>> aliasing DMA..
>
>Hm, if a DMA alias can be created after boot time enumeration even
>with the REQ_ACS_FLAGS check, then
>pci_device_group_immutable_singleton() is not really immutable.
>
>
>
>> Frankly, multi-device iommu groups don't even work fully last time we
>> tried to use them in a VMM. So I think I would not expect them to ever
>> intersect with live update. Blocking something tricky you can't test
>> does seem like a reasonable thing.
