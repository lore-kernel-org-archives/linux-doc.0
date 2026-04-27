Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C03E8C59
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 18:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316242; cv=pass; b=UKqFgzcwH7bb6K8auwzPSbemqkDHd2luijQPdy+ESrc9qmEktKFImvAN0aSJgnvSmrdjUYg7uo4C6m68410in5BwZMFpLxpcJSu85gx8aYBpCbF0ucPpScwImvy6e4F/FRPxIcYOVFgrnKYd2ty/82SQCvBO/jmZyUyglr95zNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316242; c=relaxed/simple;
	bh=DDNNIqkIGd79GFDvWgXKCnKvFpN60AdJ3nOosKMNMyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGMQZCk7Fn6i1EQO0XlHPQ8BaqPsF0gCSOltvtIGK7qaKrXLc34vejVYCtdOrfHTNNTqfr4wOqLs3UtLU0F7uRAO/NQR2yaEzPq47UN2A8g/GsCn5OiK3OPe2t/Ve8qqlAOWBemYD11fO1RgFKqFF9e7VS4nDe61LBbvVDmV+IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UclVOq1t; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UclVOq1t"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38e7d984096so116260731fa.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 11:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777316239; cv=none;
        d=google.com; s=arc-20240605;
        b=Yp7VkQJ0NGNyAFmL3Ek91PWhmmip5NZ4ydCLg+LphbC1GqMNXwKcr3VWip4whAV9p+
         3uTm4PQ5zOJyofppH9v21XvcSR4lNOG4Qvh+fKppcvgdowc9uT8/98ds6H0IUD/4ioXa
         bmYXLu8Rq/LKjz39nVwKWel4VPMVt5gJSINxT9HfGzBfeDTBSmGv0NXGnMXPdoXq2zbo
         eJPxL0UjdVtfS6/OOJPDS7i53PIW0OccEcHcSrUPXI174ENNRSp1MZ8OslYP/+FlpjON
         mvH0G0TDJntyStJF1mK2JLcMrCUneu8HMITd93hv/O0OP3KlnwhF4ZFqEP4DppaWwOQl
         0Z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wr02yN3/yZBXI2xon5jDCKdawxJYqqpUq3piVXy5yYI=;
        fh=r8fChdrV74iYvqH1qCuxwSDJvVWZlLjK8YbeoHds3CY=;
        b=kDXocvHMk8AU4y1tjw49aUtg9cUYihyB2afbVaT9hU0j0VCk4BdI+smVcXfsKq48Gy
         G7BDYiydRYCJnEr+gyHTq9aw/leElRu+4DKN4IoMROWrq4aXQnZ/K+YwkzJ3VXi17p5k
         LTho26RPTB79apcU0Y8dfxjxJwIP53oOgNscfDLbdDrvc2dzabO/Zn1isGMC1D7OUGuK
         wwYvgyxKdkVMiKocM5UjPV80pzf7qfCptYG7YpELfnAhA74l2McLI2nT6eH82rRtV8wV
         oBWUUi+VcnpjCCM18YSW6vFdT2wXLZRcgx8g4NVC7iy/EQf0RM2lCIia0TBERarKyTvv
         d4lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777316239; x=1777921039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wr02yN3/yZBXI2xon5jDCKdawxJYqqpUq3piVXy5yYI=;
        b=UclVOq1td6B5U0mvtxgD4CZ0pGhK6883kjDt84nzaVhA5Lfmv0O4Hk5sjFuTfaoSoZ
         s02Fct0MiWn2RR1lAu/SLpVhys+/zvqSVnGTJHz2/UNyyaEitRJ8EHpBZmsFaGyOxqjf
         t4csL9I8X9hS32t1dp8rcJHRauxr9AGAcx59JbhAHw05+2qeIzL7gnctKWCKubH9HkWn
         7Sva5wtaNUuYrwKUC/yZL1tdzbjQg66KWK7V8+Mk7dVaYR2UFdTtXKX9W25x40wnaYXz
         ATmLcuWAc4SzPkIkzqh8NFeBGwEt6u7fjLLBX+fBYzZ+rM07DT6rst4JIdie1jWN8j1s
         Ddng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316239; x=1777921039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wr02yN3/yZBXI2xon5jDCKdawxJYqqpUq3piVXy5yYI=;
        b=Pi15mmOrQMBfmcQ71zG6dHFlesRTmPKJ9jiVoyrnKp9aeZwoFqkfOCjKHuA4eNsUSH
         lGpP7cs3g1dHf47TPrfHmwrvyWE8uNBZwyDVbWdIONG599jHLSVQx2x9Tsoo1fwIm+Tv
         fwPhugFh44kI4kwDglVoZ2dfl4c6SuXAY063v2bA2iyV8N9LS3ljFWESMhC+E2fUID3A
         DUk9si5j6g8yESE6A/tiaylx9qDeaGDVxryM0Pji6mwRZfDsiHKi8Ivm9RGho5ffx4k+
         j1XEdVCYUDb5u4UvOJFYy+WnP0TeWidn8jA+bN6IkFfEYjvD1RtgNyci3aVQrWtz4gAl
         K8jA==
X-Forwarded-Encrypted: i=1; AFNElJ9OB1CSaHZCRaMOrBVT0ngrM+iUG1QR534u0/UMI5S4Ng5C7pk+CZ0beVbk2RufTi5NH3TSj1z36YA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn6M9tB+6QXYyHL1645JY0czKd/WPJlhmjTifVFJ3T0xIYd2fP
	yK6TdvGTIlw4puAaitfaK0oTvL3ylI7FtDuZ/+rZRjarOIE1VFqxazqVVPwLT0wEbmyzqwlrqlT
	OzfsBliqITj6W6QICqr3OpPGLXFuZUA/rih0Ya/Ex
X-Gm-Gg: AeBDiet/JLiJUypccyeqNHecCbhXNbT6VszhlObPUOPxZRQbvqJ8xS0gmfFOWCqZXCb
	5syhzUMwYe35nuKDcEaD0FEEDJFZfzaH0hIpS3L+6RD3qQt6U2ahsUTfj1qvviaoJ+Y7fNka48a
	Zgt+uDEp+jcHJCoMQB5MtqXr396RdPBEjZDFtpdqgZtUqiGtaTwjdzMtt1tSJZyRvSmoI98WyxW
	8M0xVg0uI7dKZpUwXyfZZ+tIRUhGpAVBsZE+ExQuTui9umDogd3ZoyKbNDUW55rOARwppatmqdH
	LLiw5+m55Jw15k0qzmhvjh8cRN9RZQ==
X-Received: by 2002:a05:6512:3c98:b0:5a4:b18:427e with SMTP id
 2adb3069b0e04-5a7466047eemr34628e87.1.1777316239065; Mon, 27 Apr 2026
 11:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423212316.3431746-1-dmatlack@google.com> <20260423212316.3431746-3-dmatlack@google.com>
 <20260427085725.00005283@linux.microsoft.com>
In-Reply-To: <20260427085725.00005283@linux.microsoft.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 27 Apr 2026 11:56:51 -0700
X-Gm-Features: AVHnY4IwEsFxMBzAHVS8KxW2Zq56dU7ADRcx7gdZfScIG7qn-IMwc1DMcXI8nOc
Message-ID: <CALzav=di-fMMPgTEzfWagRgXCWox9CB4XiRhZcVAzc3dUzzfHg@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] PCI: liveupdate: Track outgoing preserved PCI devices
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 8:57=E2=80=AFAM Jacob Pan <jacob.pan@linux.microsof=
t.com> wrote:

> > +int pci_liveupdate_preserve(struct pci_dev *dev)
> > +{
> > +     struct pci_ser *ser;
> > +     int i, ret;
> > +
> > +     guard(mutex)(&pci_flb_outgoing_lock);
> > +
> > +     ret =3D liveupdate_flb_get_outgoing(&pci_liveupdate_flb, (void
> > **)&ser);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!ser)
> > +             return -ENOENT;
> > +
> > +     if (dev->is_virtfn)
> > +             return -EINVAL;
> This can be left outside the mutex?

Yes indeed. I will move it out in v5. Thanks!
