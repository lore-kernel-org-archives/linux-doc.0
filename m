Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D25643F4C4
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 22:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784587450; cv=none; b=EIPbhw7Ebb8lD3O361OM4SlF8Kf9/WP56Qv8dewan4+83DTTg/55CYjcu18ejK7gp1hmYQV+EukMqTyBRopkc2dLMjf5XIr1HqlkF996KDN8gck6EZC+1qbplgRqOWFYYXNj4glm2ZQ/9QN0Mw49TlWd/wfJtymKYkJk5Q1Rqzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784587450; c=relaxed/simple;
	bh=ebC5xGcTEOi4wVqJ6ncnnXXiXaqDe2gAf8jcsdg4FFI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OW8aD6Qisdude28gvAMNdgxqce070NtwVw6HOb57hYpNJFHCBUYLQmsPs57hD4JG4h30nG+X71MSM/zVph2ydnRrdZNrm457sVPKTOxgBKi8xKmEk7D40SXHjLhnu/Uq/9k95I7VuF9XWkTMFVcOVSruh+2brygCjMNUi3whaqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=EedyyXxN; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EedyyXxN"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e50c5d14cso766131485a.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1784587448; x=1785192248; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sZotz6DMr/KESNQHMebtxodvrKo450DHNTkidmosnVY=;
        b=EedyyXxNKf3NXikNSiVE6saygt+U32sEAdwe58eH6afAqVyC/I625/bBtvJM19ByfR
         vKpQbTv2nFsVBP+f3cZmC06d5tSSm5tBqZF9D8WCJQqHRTo2K2BxNR5aVMOMVSg1Rbww
         qbZXIJCPWQOLcvZFWlRAiYnF+8mbEgc+G97m2YA7Ttk9ceKvsHwb06c31A1+Kv1pSdNp
         RPfmw8nk7TZYyPpmAMzi8j9y0OpPzrrTu/w/elICZ+5iPP8wCelavbp5ziNuLbH1V6TE
         lEsi4/DyGLCTdBaFxhnrjz9eUqr7Wr3Z/NimFlDA09a45yDcHyQzbJCay9IbuLK6Z1+5
         MsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784587448; x=1785192248;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZotz6DMr/KESNQHMebtxodvrKo450DHNTkidmosnVY=;
        b=f0tchPFOVoHGqVgi5uPKgiRvaMOzs8zBVUIiz3dwDEZQEQt9dw1Vc6dYVzPaLXpGDM
         7WpD+qX4o6d9yNDmoNXlXXrniyP1109bWXxZcs0zPZTGjAObWedjdykyZUdS/10xbLaa
         T5XkZezp6ucXZnYnj6oukSmhdW7VM2Vi/ykZGI4f/ctpi4EdGjT6rXyKAenN0q7bRcAp
         LoWRgMA0kqP6vnniGM6NUa0QO/EIPCblqndm6abZuvjX/RNy2l8hOsS4fJzOxzzGESfC
         AHZLUfORprvXB6gwOtKPyFd9V7xHiHfUMqd+C3IMd4FfmX8wJk9NlnsrLW0/bktv+tuo
         3sYg==
X-Forwarded-Encrypted: i=1; AHgh+Rq6VlA9Bn+tZlCZ1WR1UsZM4hf6ZYhSg4aK4wpahM/A1o+rJyVdRJyRmJi5ZrjXD19aCOO6X98TKgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcDgQd7jWLUGidguvkj0CusITUXeXxWh+zuyAvYhpE4VLfrHW
	vro9RW2VavnTqFbbiYX3sOi1rG0WNLgnAO42GM1cJDKVpd56qdLKI8sUpaZEmzYYdv0=
X-Gm-Gg: AfdE7cmTxlGAB5btmdRUNAwFM7VujHTdl1HeTdWBqpopyxE6nvzJmKgg5+2Q99V9oB+
	DhQ1CMCvwuJ5NEJetR2Ztb5n5kxpBySFkrabM4Dhu6BHwAFBPq1nPlFLeBX/SsLKm4tFumCQV8f
	ZLtErPiapBt530DE2kwv2zae423nBMum34KwzanDgC1YBVXs/2rPX+8NLRL0+SO+BlOLe1uvHZm
	9AcaurZtfkjEZgWxNGeXpjDMN/Sd1tUxbCFLAXRxixyVpzQtujE80O+zGLJJNMtjXIAT0THzsKD
	DZFOyyResTCNioDhHXWfTjkm3yrrxchmPeI9ghZ89aOOA0+VT+xBMB+RX0gC4iq+jKVd0L0JNhP
	FWT86ongnBjDq9LrcwtWhXNW1pvEfaKLGoNS8+fE5p81Wrua4y4l+ImGU7Un7/f/U9d1gQAH94H
	p/u6FspSXDhP7Gy+HfbJnxosBs6hW+JDM85tc49ec=
X-Received: by 2002:a05:620a:1b8c:b0:92e:d677:45c8 with SMTP id af79cd13be357-930b3f10083mr1694446385a.25.1784587447916;
        Mon, 20 Jul 2026 15:44:07 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b5491329sm966366685a.44.2026.07.20.15.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 03/12] PCI: liveupdate: Track incoming preserved PCI
 devices
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
In-Reply-To: <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
References: <20260710212616.1351130-1-dmatlack@google.com>
 <20260710212616.1351130-4-dmatlack@google.com>
 <178432481253.189683.3297727348836286619.b4-review@b4>
 <CALzav=e1Gcu-9TD7F--41cYqKBrStKOE4VqQ4K3PKdNuYnNmcQ@mail.gmail.com>
Date: Mon, 20 Jul 2026 22:44:05 +0000
Message-Id: <178458744511.332171.13770778781241262180.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3475;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=ebC5xGcTEOi4wVqJ6ncnnXXiXaqDe2gAf8jcsdg4FFI=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqXqS1187zj8JXRe5lB5izbKlBKLqvYbVVBleoX
 4T2/h8BcwaJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCal6ktQAKCRC7dyhM23N6
 3t1OD/9Y1PR1oUKi0SDKwGc07m5QU9YJW4ylOoJhQmKBciDPc56xSO13GmZAfrbnoRNuEHy0WfZ
 T6WL+ngFtThbo8xKTV3r0pcKUNB0fuwCnI3x9Zw8CUDvHFEK6vS7Udecjo7dR9a1JLz761f7bM+
 12ImK0lfNaicDnArmbfqVQUZNpMPgdmK+CZXn7ps8uDGxF0IsSEhyuYhYJkhdoy94yjcRRrt2Zj
 g69n+kkIpTaDMvonbwXST5HwZTAjyIYDhQIP9IDt2Vnyd2+TWMrzNM9qVhyZjjrSwQ1GgV1MvOa
 jvy/0LcvwvUkcNGBNveq1/SrKCeS2+jijiLh/QmzloLFwyKAUOl98M9KaAaPMF6v1fHwAJhAY9m
 rilvw4STMhIk2+9yVSYSbxN1kBuPIwnwPodx6yjpYXsRdwr8TWEq3MAQ/07q7gArC8vtVFeZNIl
 GaAHAlFaMKl515UiO1uoW6JQxduFrwo/D1DtNaBca10N7bziwpVRj6pHXUMajydMBMoeJWOfrPz
 XOTLQBQYk9q+oZZPSV/fHFWIHlF1e3cocmdYNdnUwDNyZf+Mets1iR0Su9j7rbe1zSW1tgSuLgX
 nE8RRMA+RyH7M6lkvSgFkzdIBtfu1B1URfbD+EDaIzeqVHJAwYbjo7sEfPI46GMBtnmVSeum85X
 aSNOxJOHr7j1oBA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On 2026-07-20 14:54:51-07:00, David Matlack wrote:
> On Fri, Jul 17, 2026 at 2:47 PM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
> 
> > On Fri, 10 Jul 2026 21:26:06 +0000, David Matlack <dmatlack@google.com> wrote:
> >
> > I am confused by this. Each preserved PCI device must have an associated
> > FD preserved with it via LUO. I.e., vfiofd would need to be preserved. If
> > the vfiofd was not reclaimed, and finish is not possible, that vfiofd
> > would still be owned by LUO, and therefore PCI FLB refcount would stay
> > positive.
> >
> > However, if finish is possible, and this is the last vfiofd that is
> > finished, FLB will be freed as soon as the reference count reaches zero,
> > which I would think is the expected behavior.
> >
> > What is the point of holding a reference here, instead of only for the
> > duration of FLB access, i.e. to make sure we are accessing a valid data?
> 
> The duration of the access is from here until pci_liveupdate_finish()
> because that it when the pointer (dev->liveupdate.incoming) is
> cleared. So that is why the PCI core holds the reference from here
> until pci_liveupdate_finish().
> 
> We could avoid this by deleteing dev->liveupdate.incoming and,
> instead, fetching the incoming FLB and doing the xarray lookup every
> atime the PCI core needs to access the device's incoming ser struct,
> but that would be inefficient.

Thanks for the explanation. As I understand, the most straightforward 
way to avoid holding the permanent reference is indeed to delete 
dev->liveupdate.incoming entirely and perform an xarray lookup on every 
access, like this:

bool pci_liveupdate_is_incoming(struct pci_dev *dev)
{
	...
	incoming = pci_liveupdate_flb_get_incoming();
	...
	dev_ser = xa_load(&incoming->xa, key);
	...
	pci_liveupdate_flb_put_incoming();
	return dev_ser && dev_ser->refcount > 0;
}

However, as you note, this is inefficient because it affects every 
single device and adds lookup overhead to every access (not sure about 
the actual cost though, xarray access is pretty fast!).

We can, however, still avoid tinkering with the lifecycle of the FLB, 
and instead treat dev->liveupdate.incoming as a "hint" that we validate 
on access with a fast, liveness check:

1. At Setup: In pci_liveupdate_setup_device(), we do the xarray lookup 
once, cache the pointer in dev->liveupdate.incoming, and immediately 
call pci_liveupdate_flb_put_incoming(). We do not hold a permanent 
reference.

2. On Access: When an accessor runs, instead of doing a full xarray 
lookup, it just validates the cached pointer's liveness by temporarily 
securing the FLB:

static struct pci_flb_incoming *pci_liveupdate_get_incoming(struct pci_dev *dev)
{
	struct pci_flb_incoming *incoming;

	incoming = pci_liveupdate_flb_get_incoming();
	if (!incoming)
		return NULL;

	if (dev->liveupdate.incoming)
		return incoming;

	pci_liveupdate_flb_put_incoming();
	return NULL;
}

* If get_incoming() returns NULL (the FLB has already finished/freed), 
  the hint is invalid and the device is no longer incoming.

* If it returns a valid pointer, the FLB is guaranteed to be alive, so 
  we can immediately use the cached dev->liveupdate.incoming pointer 
  without xarray lookups. The accessor then puts the transient 
  reference when done.

3. In Finish/Cleanup: We can simply clear dev->liveupdate.incoming,
and decrement ser->nr_devices.

