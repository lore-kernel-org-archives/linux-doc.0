Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430E2E92B0
	for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 18:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756320911; cv=none; b=SBClq1DYZuuPMcodV+d2kdbipxo+1PgYL8m8dDnElAjaayAGEcKbEfJM6DxcEg+ASITjytKXIKYONWyuzi2UuFu7XUqp8aXEVHSlW6Guaf6/Sg/P8Cs3oJQsX9n3/DnHHl23I8ZAAkofpTLUl2CGj9Nqep9FqrrOu8K3uohKAMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756320911; c=relaxed/simple;
	bh=ne728g33Ic89OdMPAENBxFjSizIUR3CqOaqTHDpBguk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L3HsRdQIF+c8wLi+ur8VQVRHwPD2lKylsjL1colW3poSpbHeHbzgovcKMMsZsgAb5fzuqhfMVdnjgJ2ZU7glXsxUMF2rjscXEGkVBCcXxexGgSNOVcc/mQuZ9GbA7CvwcAde1EMj9tkniHy98Wr15K3l8hbSdcyzqJZvKQ0UdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QA1tcgME; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QA1tcgME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756320908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eF3DTjEsZLVirufoG8QRMws1dk+QuLId/jBJE6DkJbg=;
	b=QA1tcgMEFdrN7OVZpe8oZF5HFSsAsP+42v21EVcGN5LVpa3Er62T2Zo27ExI+LctcmfiyH
	+u/LRYmEekg/njkAm4LYrxA1oZHtfR/T1nh+0BIILWXiR7Ria0oLTwxUY/8gk7XGPtcW/4
	UGp8sINL9aJzt6nZjaFMxsLKoWYChwY=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-zJZRTimLN5a1lsV5bxM1QA-1; Wed, 27 Aug 2025 14:55:03 -0400
X-MC-Unique: zJZRTimLN5a1lsV5bxM1QA-1
X-Mimecast-MFC-AGG-ID: zJZRTimLN5a1lsV5bxM1QA_1756320902
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3e8dffcf41eso155185ab.0
        for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 11:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756320902; x=1756925702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eF3DTjEsZLVirufoG8QRMws1dk+QuLId/jBJE6DkJbg=;
        b=ilK+uMBlDUj63hn+110nv8yzOVTySkF02AsjXa1e3RQjKcjvr52Bk3YKnbu/FwG/sN
         0oCVIBuIi9/RpU5pS7drOvGtDZGr28tA5JxIU/tzmr4yrQgdVccA1J+e5ixRfdOqt5KP
         SM+NiZeCjsa65fJ3NwRK7omBpTqjLCAS0pCGNDZsErfTJnyOe90sm+EbAP0aFpzB0WV4
         NmYUU3ZCwNySY6m/6sZJ/NobqFUtsnRVEP3/Q11lYXefX5yFUHiBjPdLlxpvNsqk1KqW
         YowCe0RjM244suL8bOVFu5E4g3S7vCrdMB+TMc9adTuAZdI3atTn4QATUKg0Di8+o5rm
         VP8A==
X-Forwarded-Encrypted: i=1; AJvYcCV0NFTjG+jqqepdQ5Vrq5QYnU9Lgj2vEiWZx5gPQ4QefGQTBmQe7CxrzElV8NuDdkyU2Yj28F8W8uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YySgFV+iuEOBL0RG+uREWPWEUzPSEpT7Yz8DsFqUYCguzSCRjyt
	LKBoeTsC5SCf3+rK4LBb3kSRQID448r3Ku30BrIzckgge/5/9ZgBbh0WfQ7CcEji0iNrexSXULl
	ikGJTU57OVfMY2bzgJpdOraKqYDFzigmba/8R2JdRF5O3XvK/HkF74z2CX0mbpA==
X-Gm-Gg: ASbGncvgoEvxcx9EuL1RAiQfMWI3WuSca4gh9P1duKIPTY/ZhDJCoYSdhtK+DsnYNgj
	L//uxDDTApLA4/bfDU+0G7naEEGeS+hmvWRWbS0GnLbEE5tlTRI6ICe0ffGv+pOYPr2IbBNoFNY
	hgS9IKHVuMJSVap4r63/3bJiM8t/X1Vi8g4qsZFELAnyF06hdy/5m/gouda3/sTAA5j/YIJ7dHW
	txWU7X/a+g2eIYwoSr9L2qGRxmiyvEh05aU/adcueaRAKXvfooFUF76XUP/0WfS069CmnzANWGO
	gFJ5yoTfLfJ/b+SogUc3WKWD7hDL0FjRCbtHKTfivwA=
X-Received: by 2002:a05:6602:140f:b0:87c:469c:bcdf with SMTP id ca18e2360f4ac-886bd26223amr1074676039f.5.1756320902468;
        Wed, 27 Aug 2025 11:55:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcn4XXONhUn8JvBftE3ZsZrBNhr3WQ7ZVNO9SR8mW/jmt3C0qMFBX2Cm9qP6Uy+O7yYpbTWA==
X-Received: by 2002:a05:6602:140f:b0:87c:469c:bcdf with SMTP id ca18e2360f4ac-886bd26223amr1074674039f.5.1756320902025;
        Wed, 27 Aug 2025 11:55:02 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886cf7a8c45sm722969439f.15.2025.08.27.11.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 11:55:00 -0700 (PDT)
Date: Wed, 27 Aug 2025 12:54:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Alex Mastro <amastro@fb.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, Keith
 Busch <kbusch@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-fsdevel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>
Subject: Re: [PATCH v4] vfio/pci: print vfio-device syspath to fdinfo
Message-ID: <20250827125458.6bc70a1d.alex.williamson@redhat.com>
In-Reply-To: <20250804-show-fdinfo-v4-1-96b14c5691b3@fb.com>
References: <20250804-show-fdinfo-v4-1-96b14c5691b3@fb.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 Aug 2025 12:44:31 -0700
Alex Mastro <amastro@fb.com> wrote:

> Print the PCI device syspath to a vfio device's fdinfo. This enables tools
> to query which device is associated with a given vfio device fd.
> 
> This results in output like below:
> 
> $ cat /proc/"$SOME_PID"/fdinfo/"$VFIO_FD" | grep vfio
> vfio-device-syspath: /sys/devices/pci0000:e0/0000:e0:01.1/0000:e1:00.0/0000:e2:05.0/0000:e8:00.0
> 
> Signed-off-by: Alex Mastro <amastro@fb.com>
> ---
> Changes in v4:
> - Remove changes to vfio.h
> - Link to v3: https://lore.kernel.org/r/20250801-show-fdinfo-v3-1-165dfcab89b9@fb.com

Applied to vfio next branch for v6.18.  Thanks,

Alex

