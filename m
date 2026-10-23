Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782054;
	b=GdJTWjBVFqXWChxHppRbqMe55VMTRyIkViw2W1oVBQrbIXFEZEi08R8/seLA2zt4iEY/
	 jydRy215TVjh7jFD3XP0rrHC30DTB5lhcRJ4CXJNieutYOUsc7CkzSJv9BrKa8elLvinv
	 AQX3cgPMFWMKRUON2ma0HL0J/CAhMYBra8XQpGkTEHuqTzN/no1uCUCckP7VtjQvQUUhi
	 UskhiNSaU62UTKOtAgDA9RM+Yla+BzXGrNuyEtqF+V83uhJJlADmZ9JUIipYG2UZdxfca
	 HKy+EooCA5S49ie1pVsADYOFTQE3BSRt7Kt72vCDnfoX0PgPU04MyW3vNhQJ0V3f7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
	b=RJJ5vsQpbyAhkptMoRTyt3rbKqz3YTt+WWL24QXmjcROsDBT8p1+8J084E842c0rvyCB
	 g5rIcCT9nvyj3/AbHvm7gPtPtma/frSkkf+7f3bUW21hWkvicmFAVZKB4ms10y3uJK8sL
	 e+KZgzpsDcu64RUIYXzUT4xzyTsCbqYZob9smKC0cVKk87ebaYWOcvyUuMuyWmpUEJU16
	 V5dDbpgiXnU44NRa0zF8qa325n6fhUOv89I34Llw9oTK+wbFM7waymEQUc62jxisflGTJ
	 nmHgTgmqor6HijuHhCsXkHoDx4o0RobnLLJK6xf3Yln/oEAT1A9FoFsBS1mZVk9mskw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bzc4Cg9j;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF536606A326
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 19:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF536606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bzc4Cg9j
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53664b4860bso11282561cf.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 12:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792782039; x=1793386839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
        b=bzc4Cg9jHc+EwZ+EF2GHA00SaE7XNzyRJ2jPm8VaHgqzKDLrehIHY+5e8wqB1yH17y
         sndSYk22aMmceP9P1fMLTu0Z4V8EzlM2RGsFmTw4gK3j741dLn2NCvrwBRx9Zs2Y9Nrl
         IH1Flz0MwkfAlUgvicHD3GXb1HCVFF/PCxVAEn/OVSguv9eR9Zs++ljRZWXpHTqI+xAr
         rfcFCA7qmIwN9IxX9GeYG2HRZ3YRwMSM0MH1BmgGZbTGcamONR+rAGI29PTmp5avInXD
         sAUAnL9pEXhpYTml9nJyCuJ6EjWQTeYXwbhCn5SvYnMgGcHEU9aguEL9UamXbiSuNSk7
         hQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782039; x=1793386839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tf4s8d8+MZT/ng3kYJALwtT1EAbBRaxelT7QvlTQng=;
        b=EqSAj+9UJgvFcIrNCwA4tqZGhYenlD4BNb8zcXV1A4bVBhFEyvYW5+ke2RVItwQhn/
         ch7C8jG+OWVFQEAgCd5ZlkHZwDmvF7SDVR+/PfiWqZTmZcho8n1f4ygw49uXB6QmB9rG
         R3BP2dJFntOkPZtzd6HxIyJJs6zthmsDASwq3czMt9Vn9cc7fe3t8YFEoE2nMVABhas0
         lr5bTFS5UmvOG9PlNb/rT6UlTKZGEM1Cyvuu+jJzyJYpQ0kZhfX4TLHf4i47Nf+ppdOs
         X9aHnBWEp1ikFfE0nMQypN7OBmmiuWRpWHyRTxzk40/fgH8R72j9Eg5jVEpj4HqiAPWl
         2tHw==
X-Forwarded-Encrypted: i=1; AKwUvByPPq3YLtK+O0HdL9/ZMgSzaMt7YVzNvc/45RPb87o1t5CjCHbcicy3sZ0PGdBoaniZ2V6ufmJvnWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJABKMICJgiYx/HLdmn3LVqPVYHpQr467KRfKwkPmpgzMM+toY
	HZfJo7EMg/HDfXQypFxDFtLckkzLcdpsVy5+PRIW+LFRZfQq7upJYVVfw38ayLNI0qY=
X-Gm-Gg: AYBFou24O6/8BGAFbYi981zLSvDlutrVuOTYao2HT8zNRqy+fvHCyf1yrlz7vfMJZke
	7s8QxXbmDClcU6wkPcxjxZKElm5Z/VjRxl2WmEdMp6i0bAhtJiu599VoEk8BVFGAj8fjbKUnkuV
	M2qcBTpIZ0FdOsJHTpCA+s3bza88cYr1RfcSWzxbTpvQb9srL9RY0Mf4syhxDufAE0brhCYenLA
	v1ZwtiLOYZw2cvNa1GZ9ahdoOnPGvpKj6NGtiP9ogsjsfMBQduinpUeCX12VCk1qcUTssxg3QGg
	VJ9h7b3CjGFuCphfRM77x455Ht9gnXXEEQTOsDjfcZOuYLiNyvMv5SllPbGon9wiZ2q+WXUckex
	6UI+TWwpqIh2JSL+f4l9rzH29KAslcfPk8QiEIScB3WnvKcwJknEOUMx0nB8lNBDw3r4kTNqybU
	N4RRTkMTCgnBPxA3yeqARXj9K3c4LSSSHjFl3iMORQEobaGpPetJB6z8S36wjyQ8yPVjeP+esOr
	nas9/ZCLR7+xtpWsHO+t3d5Ywgd/WB8rRYd86dUIpLV9oXLizFjixRbZdfH9o1+GKjIPK8+zD7F
	GkfdLlu1LR5j/dQMYTbbanUPWI06tCaYpsmyuw==
X-Received: by 2002:ac8:5d8e:0:b0:535:a5f9:7520 with SMTP id d75a77b69052e-536c26e2168mr47897061cf.63.1792782038589;
        Fri, 23 Oct 2026 12:00:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53839709ed6sm1185741cf.16.2026.10.23.12.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:00:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKKVI-0000000GxzN-4BG5;
	Fri, 23 Oct 2026 16:00:36 -0300
Date: Fri, 23 Oct 2026 16:00:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, iommu@lists.linux.dev,
	Tushar Dave <tdave@nvidia.com>, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-rdma@vger.kernel.org, kvm@vger.kernel.org,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jens Axboe <axboe@kernel.dk>, Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v9 02/18] PCI/P2PDMA: Derive routing from directional ACS
 controls
Message-ID: <20261023190036.GL3977851@ziepe.ca>
References: <20261023155914.GK3977851@ziepe.ca>
 <20261023182715.GA2798722@bhelgaas>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023182715.GA2798722@bhelgaas>

On Fri, Oct 23, 2026 at 01:27:15PM -0500, Bjorn Helgaas wrote:

> > Yes, the ACS combination is selected to avoid ordering issues
> 
> Does a user have any way to know whether the configuration is safe?

No, unfortunately in PCIe so much is really difficult when it comes to
deployment :(

> I'm wondering whether users might use "pci=config_acs=" to configure
> ACS so things appear to work as they prefer but may not provide the
> ordering guarantees drivers depend on.

I imagine that could happen, but on most practical systems the root
complex will blow up if you do asymmetric routing so there is an early
indication.

I know this because I've help debug such configurations at
customers. Some servers helpfully MCE if you do this. Lovely.

> If that's a possibility, do we have any notes in dmesg that we are
> depending on fabric behavior that the OS can't discover and verify?

Maybe, it could be interesting if the P2P logic found asymetric paths
it refuses to permit it.

Jason
