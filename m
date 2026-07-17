Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1037DE87
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784317362; cv=none; b=J+XRFM0ICCG6Qcnt50zz2PGe3Be12ecWmLnixfTT6RXDLlswrRKhRak8wYTg10mowqW5BhrgTr8Ews8yH/NQ0NimHPMndWtbkO6UCjRTaOqJYSGUm+rN2X7tHMwijlakqhvVSdVtnvGVr81kDX/m2uw8uxxaTl+F+P/rhL6Q9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784317362; c=relaxed/simple;
	bh=06eki5QMsXCiN4ojqSTErc49FfqPbYMbzVUiMtQToSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYte9d0Li4pBzdF21ieID03uPq325i7SZeN5Lv90LZ+hCXk/tbKP2qkK3UXR6ezyMZWgrCi2m1Jy59MFFPmiP9Mm0WMV90zXPMpU3+Gjn5iTs9WI+HnagCdZYNkKZXSLTKCNjSBaJqFHrO50xiCuSgie6IddqOb/qHVGar1U33E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ZQDdR4Dw; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ZQDdR4Dw"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92f03daaa97so595368585a.2
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784317360; x=1784922160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XwmOrmcqXQWfj6rtFo+8pLNSVXYkj7WYHrCbKkDrWe8=;
        b=ZQDdR4Dw5XwL9NdJyrpOlKYzNpS/obcsaXmYmzaFyLJ2uLH15sWpx9M0DZvFONtorD
         m7qDCshy1fQLyjvF9zU2qJRlKZr0WvPfOBwCpxGl3fAW/FCrGAAXYVA08DQVRhzndP2n
         epvLTMr7rIAUtfIsHy58bL7cy2cFd/mWMzPjwt+4gmAzWjWAxcCpigSs2xce8V890QAd
         rtxPsp8XVD1OjeD2LzFqVfEAa7gKTc16o7ugRqElJphGYSAAN3BndNAzEGbkSDg5P2Xs
         gdCQltzI5JsyY+JKBSEH3jaVxWMMEFdwPhVj6FMEwXtLmEd44Di1PbTCKbqK67TgvROk
         JDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784317360; x=1784922160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwmOrmcqXQWfj6rtFo+8pLNSVXYkj7WYHrCbKkDrWe8=;
        b=pmnyABcpk7Xtz/EDWVEvsGUm4AKOu6I9XgZp3b+6npy5K8x/FV8qJniI1tKJ/5gugf
         tHe+xdzgXRlnFjZgFuqHjgkRZSorV+bVqkiV0VH0RNrYCbtQ9nEpNzLSRlaGCl22VvlE
         pP7XxZd0ghBYwJlCsmOtuwTKK0JD4x3Jh3wwDW7E7jTWZAVTPuPNZhTu02QPQsXkv6hr
         +b1MyyPJxa+91vDo3GtQyctLI1vqBXtN+ryB3hfjYQccy6QxXBvgK0dT2oV2LoR8VG6o
         LIAeSrKwgiFIq0esFMOx82mxV+vaDQVf9jV3nqmQaWamc+gMQUGtNMvUL4VRrA3aCBWv
         WcJA==
X-Forwarded-Encrypted: i=1; AHgh+RrW4Y44jQNK9QlFZBQnBqP7/VEZJ0NWJv2cd/p+OG81UukBRl8NA3SQCowcEm3/85NX/F9kNy6PEfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjIQxi3MiSLxtxNNU222t9EYqv2R0HSunXByLW4g9Q4Ta0AG8R
	kY6Ufyggo/YHF49jUAHXzU4sGB5U/m92jr7bQG49hlRg4QOUDtckX7QHbgObKco1M+s=
X-Gm-Gg: AfdE7cmZfvW80ahbiUqomjhAQb9kxvNz0hCxEu1wSsEU/t+c2ScE3I/PQIw3+rw0wzV
	UixmWXLnsplFG0aHBFtrXsnzMsdJ1SYjC+aZREw8ZF4Ck/gZqXQyvlQ3w0+EhVIl+uHZ2vQq/Y5
	RkI+j13jGQD2/uNX/c8NVfulPuVQbvCFualrUGXTyWN7+Rcjtg05VWsSfWW75PC0OlYZ1+NzN1u
	3cQeD9AeVu3rDzrUEk8OCj/7gJ0D2CSFofgce3FjrEHP7lkdgUrWeM28sXkT403g/M5RatEA59y
	R7hZdkGbTxxGO92VXop6Xi439d0UbcR0FQvofXl7rJth7MO4xlTNUTxViLDK/O//rrKQyMn+bKL
	09X2lqkPBsTa28Wv84rJZe4qGe9asbOFh1eXluXEBQFcyiGJnN6bgId5g/HLrgNpjaElgIrJCUg
	uMr1icYYgq/GApDyFHcCmQkkQpC2JwPg==
X-Received: by 2002:a05:620a:4691:b0:92e:e125:55bb with SMTP id af79cd13be357-930b3e9c541mr429942685a.4.1784317359852;
        Fri, 17 Jul 2026 12:42:39 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b52dd3easm225279585a.3.2026.07.17.12.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:42:39 -0700 (PDT)
Date: Fri, 17 Jul 2026 19:42:37 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
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
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, 
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v7 01/12] PCI: liveupdate: Set up FLB handler for the PCI
 core
Message-ID: <alqFcmDsFdjzNZQJ@plex>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-2-dmatlack@google.com>
 <178431652443.189683.17611165218179620081.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178431652443.189683.17611165218179620081.b4-review@b4>

On 07-17 19:28, Pasha Tatashin wrote:
> On Fri, 10 Jul 2026 21:26:04 +0000, David Matlack <dmatlack@google.com> wrote:
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > new file mode 100644
> > index 000000000000..899758883dd5
> > --- /dev/null
> > +++ b/drivers/pci/liveupdate.c
> > @@ -0,0 +1,155 @@
> > [ ... skip 50 lines ... ]
> > +#include <linux/slab.h>
> > +
> > +/**
> > + * struct pci_flb_outgoing - Outgoing PCI FLB object
> > + * @ser: Pointer to the preserved struct pci_ser.
> > + * @block_set: The KHO block set holding the outgoing devices.
> 
> AFAIK, these should be aligned after column:
> @ser:       Pointer to ...
> @block_set: The KHO block ...
> 
> > [ ... skip 26 lines ... ]
> > +	ser->devices = 0;
> > +
> > +	outgoing->ser = ser;
> > +	kho_block_set_init(&outgoing->block_set, sizeof(struct pci_dev_ser));
> > +
> > +	args->obj = outgoing;
> 
> Nit:
> You could re-write the above:
> 
> args->obj = no_free_ptr(outgoing);
> 
> And declare outgoing like this:
> struct pci_flb_outgoing *outgoing __free(kfree) = kzalloc_obj(*outgoing);
> 
> Also, remove kfree(outgoing) call.
> 
> >
> > diff --git a/include/linux/kho/abi/pci.h b/include/linux/kho/abi/pci.h
> > new file mode 100644
> > index 000000000000..de549016807a
> > --- /dev/null
> > +++ b/include/linux/kho/abi/pci.h
> > @@ -0,0 +1,58 @@
> > [ ... skip 30 lines ... ]
> > + * @domain: The device's PCI domain number (segment).
> > + * @bdf: The device's PCI bus, device, and function number.
> > + * @refcount: Reference count used by the PCI core to keep track of whether it
> > + *            is done using a device's struct pci_dev_ser. The value of the
> > + *            refcount is equal to 1 when the struct pci_dev_ser is in use, and
> > + *            0 otherwise.
> 
> I believe descriptions must be aligned.
> 
> > + */
> > +struct pci_dev_ser {
> > +	u32 domain;
> > +	u16 bdf;
> > +	u16 refcount;
> > +} __packed;
> > +
> > +/**
> > + * struct pci_ser - PCI Subsystem Live Update State
> > + *
> > + * This struct tracks state about all devices that are being preserved across
> > + * a Live Update for the next kernel.
> > + *
> > + * @nr_devices: The number of devices that were preserved.
> > + * @devices: Physical address of the first KHO block containing pci_dev_ser.
> 
> I believe descriptions must be aligned.
> 
> Nit: Please order the included headers alphabetically.
> 
> Nit: Please order the included headers alphabetically.

The above was supposed to be right after #include, but b4 had a mind 
of its own.

> 
> -- 
> Pasha Tatashin <pasha.tatashin@soleen.com>
