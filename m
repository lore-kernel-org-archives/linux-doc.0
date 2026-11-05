Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887436;
	b=UjsAmfqZ5GhlDLZRA0yjwaR5ADAAI9QyC6KvqzOcV1V5FHB/AGibQTKKQuVJp9VDUC7+
	 eWuHl2LDaIARgqwNnz66AKlp/S+/TclXyfHDFiBYqq3toXM+rgUH0NtoFt1glfn67K85p
	 duxtnlADAb9U5UUC1KOciK7HsHijE/AKbQqHOiCNPp0iUXtV92A/PQRGZjMkiHOn8nWja
	 RRC0WTkWe5fACSXw+T5AfmfEFb+5zjfJ2bLkN67p2TvHa5j/zpkgD87IaegPd31YUVuo9
	 QXi6QvA+0tivJTVhpvXMP0seuhEt2sJglN0wMMNU+bFBcpIIVznnkhQASHCTmoSVD2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
	b=AqV/+UlAaeRFSyW1siKAuuECD6U1zdiScKoQquEEs4T0auaMsMEs4/fy4itbz/WbabcB
	 c2UTQtMX3P4LL1nZg74SkeaPoeprZw9BkD4g6TSWPZPWjchmYLFBOs2aK/hUIZFnZbICv
	 FKQr6H99tXwFuHf/NQkr90bTluqEfOfjbiJDkg5lsgf4h9xWE+CzLzA//qVXCmMGU+ih2
	 ovgkws9D5VfIBo+MVEoI4iTS+WMo9TWE/9eHEBicO4IDU18GwqAbJ1OxlE8L/OdJoIs8v
	 +z0HD9xImdXAjDMksQeyW2SNyqlb4M2lk4oeDd2ulpzT83703FvMJd1HyrrFCbie8+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kz1XgIBb;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE4606A33A
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 14:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ABE4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kz1XgIBb
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so701120e0c.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793887434; x=1794492234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
        b=kz1XgIBbrvBVV82jfLwzl2boDjAIVUbeNVQas9Wo1Dk5Xdi6H+C3KcpCevzEdclNJ0
         lzsSeS+uRFo6w/gIJIYGLA5nYX/ZA7GDEfg8ye+MEqBYoDAQ+XWmrXIScd3vjjxi3P0s
         TM9V8bmM9C1gt69mu+eIyGDX/aC+cI4xa87K7AUD6ZNwyr7bJjPSJ34eRy3oL+DhO4T4
         z9GIW8q+b2I5fYq6rzeAUUwY6D1cOnVfqLouPYFCQGVgJUGlc0n72Hhgr3e5/i+LRsW4
         Jqs+IOHbUmP6UlpI+ifiIR6Yqw/evL4R0NFbQH8ocPPe+5gcxWg4oty37gZrialLDEod
         LNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887434; x=1794492234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
        b=KcuMIsAS8lskr4AychPSmeXcExyCppDX90TPdYdHsy+7P/5OklJ/R56Z7RZXzs2SLr
         poqfRojZqJxRYdBBNuXKNd2RT2w/WChw0wqMJpSnIBAuygR4sM65LJ0F3v3fZjafDFmH
         O+iwPEC/qgD39xoUkxnp24QZ7k47eo6xba3umLMSKMHoV07hdxVZWX9A/mh4Gm+YoFv0
         GKv2pfMwPQr1sHet7SCaodUspfZr72Kq/SNywloUpoZLQsX5hGIaQxORkYKNL/lNa7j8
         znapDlc5XF78ci8fYgsnE3LEe885VTG1YTLrjQ26u6b/xYPTMvXx8mR5pi5TD8/xQ2cj
         DxMw==
X-Forwarded-Encrypted: i=1; AKwUvBy5PeeTbwhj44M243Q6Ynfz9OwfKf0zORVomWKQaKstsipoO8PAe8+jza3YWWvegtZmZVTdlQs7JRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/O5mqV42hX94Es3LptOwXQw0dHbmSDezCTcsjT6zLyd7WUWsN
	7APfL+cnevzV48QjqDzG4XwOAuRAqMPUfHy4z+nMoKQvjk6aFrFbhKwW+Y9CkNjnC3k=
X-Gm-Gg: AYBFou1ZNZxnf+b29ory+wR+4KYWL3pN9KDQy9xNCMxlPbrQPrW6pdVzyAtLWgVAF5s
	KzXc5NuePZQf2S1pK71UAOqTOhcUJnpLHwomJuSNS/CMBPTUMADU/sgCNytFgEEb8qccwspwOiR
	qRObZ8Lf5FEAiygs+Pof+P4xY/OvvOJXJMkh9st5ARudHyXkkrkPKteXAHUjWCe3VjS04gWdfOJ
	13FCvUilgjukdVG8/7nQTHayadztS4wf7Mx2c3p1VUYAV28eoHym222jjeUrp0HAME8HGL2lmQO
	1fHc6W2n1Um1pIOJ38Zdy/fbvO384SSewR5ueLraLsH6cpJCBq51ShqIcYqDfxOll+c+MPyWJiG
	Ey3zBuJC4QqjlIgRFHU/Bf6/zMqpi+NejnKO03CbYmYb2aRTFhx7pj3GQnLeVsrFOdiRx7+v9PI
	0igCHtWKBR949PLcvhgsp4r7E+p6TeZ5V6/lnZ82y1W2uB2YQbjfKn+ixsBG2GB6jkIGA87ZMBs
	vHgGS1T/mSXN1HtxFgfoB4sHnGbu4DxQZh2CV8NiGl7NXARwboJkJ5/yK2ZOrmu2Q5HjBBkJuMA
	vGPP1Zl0dE8/I5LU3u8NK6BNcjherK8u7gilVi3lUPkncnPJ5HMRiTMv9Q9dR/m24yB4KYyAPTy
	nNe/SaRGdyw==
X-Received: by 2002:a05:6122:8f88:b0:5ea:cfd9:8fbd with SMTP id 71dfb90a1353d-5ec689b0f30mr9760208e0c.17.1793887433885;
        Thu, 05 Nov 2026 06:03:53 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8de4908sm4235128e0c.15.2026.11.05.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:03:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOy4G-00000002ecj-0pCb;
	Thu, 05 Nov 2026 10:03:52 -0400
Date: Thu, 5 Nov 2026 10:03:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261105140352.GF3889730@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <2026110526-aerobics-correct-4c06@gregkh>
 <20261105131856.GA8298@unreal>
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
In-Reply-To: <20261105131856.GA8298@unreal>

On Thu, Nov 05, 2026 at 03:18:56PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 08:12:51AM -0500, Greg Kroah-Hartman wrote:
> > On Thu, Nov 05, 2026 at 01:42:30PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Convert the PCI specific untrusted to use the common device trust
> > > level. Adversarial means the same thing untrusted does.
> > 
> > What about for USB?  Will that "move" to use this common trust level?
> > If not, I don't think it's very "common" :)
> 
> It supposed to work for all buses out-of-the box, at least this is the
> intention.

You mean DISABLED/FULL should work with this patch series on USB
right? Meaning the core code will not bind a USB driver when DISABLED?

I was wondering if some of the broader things we are doing on PCIe
also apply to USB, like device authentication. I don't know alot about
USB, but I got AI to help me find some relavent spec information.

 https://usb.org/authentication

This looks like the parallel to PCIe SPDM device authentication. I
would expect it to work broadly the same way as PCIe if anyone wanted
to implement it:

1) USB discovery discovers authentication support and creates an
   attestation subsystem device for it
2) The struct device starts up with trust = DISABLED
3) Userspace runs the crypto flow through attestation subsystem. This
   is extremely similar looking to PCIe SPDM:
    1. GET_DIGESTS -> device returns a hash for each certificate chain
       slot it has.
    2. GET_CERTIFICATE -> device returns its certificate chain, read
       in pieces.
    3. CHALLENGE (nonce) -> device returns CHALLENGE_AUTH: the chain
       hash, a salt, a hash of its descriptors, and a signature over the
       challenge and the response.
4) Userspace inspects the above and approves the device
5) trust = FULL, driver is probed.

But I supposed Greg is asking about /sys/bus/usb/devices/DEVICE/authorized ..

Jason
