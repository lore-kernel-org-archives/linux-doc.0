Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950185;
	b=r4yeWKUsb/XLyzxjNKCy4NQgJOOGy1AHSa1BZ/HFNeKvuFRFzz02cCFxJP4HueUuW4PP
	 g+eDM3f1ypgjZ1pECBZS8FmyseijCa4/oH56s0Ky1ZulaTPCDtbgI/nx4LzJQk5BGIDV6
	 48HWPHltCcc8BArCQmG+qeiM2oIXNOhhnWKX2BJ4qWWx5wVyq6pcT9f3qJ3jdjnj6uj2k
	 XQ6BVTcJROaaqLTX8WeXfE5HGRZnslveT5xoVhacbSUKB2LWRdB5PBVips9G7/Gt4HpIK
	 0dHFutgiwm32DOhFzCjglW2BR/64SvaOHRk74uE2CiDf1q43vuMjZ8P3UFdZwvgQUGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=Ays1EfzTLcRjTY+4yI71x15YxEo2laYpKiSTCWHUOoo=;
	b=4YmyvLDLi7F4S+dPwA3UnochWBqfpgfrq7WQa9Uc1XUZCb/KfdT/hhRCS/AlGFxtKsae
	 8bqUdMG9vCerxV1zRy/9S/YlixrNKYkRmMdZCrfCljRLDLk+f/9voHQ65hWkni9kcb50c
	 hm1Aa91kgQIJRqB0cbuW4F41CJCvaODskkyxZh3s9h85I3IpmkRqkrwKkp38K/zQz/giY
	 Ylmogtr1dgel/xg1JoK+55wmel8bafn6vfE3etZ1btgOmXmjpJ3siqoS5Nd7U1bAWhP2u
	 d5nvhu5tNWMZbnP5XLv03MOQk5pnWhNT8cotfoNPN9CRbuMWoPfviSXLAJglhu6JN1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S9eb+zZ+;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FFA606A334
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 21:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FFA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S9eb+zZ+
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a05b210703so149349b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 13:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794950184; x=1795554984; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ays1EfzTLcRjTY+4yI71x15YxEo2laYpKiSTCWHUOoo=;
        b=S9eb+zZ+PJvunm63i/fXDlCBqZsN39Q9h2grW/i2SIKOr71F+NwBup8zef5dQt+gcB
         Q/0rrjVlc8gUSkw9ZVn3EhHFV5fx2Tm9FW3M8fA4i0Ww3PzuTovXl+iTx9BCBASvwUWr
         pova27Z7YfhEiaxRjzF4dHotz1kC2zngiDdDONWYPDQmPivP3oQ4ytGKGpMIekSGYGM3
         3FAs/qBVWevcJX2GmN7YxTm56VsKILYGaDVDI4AeaxrcywybDiXOgsR2HYISBBCTznCb
         Ka9llwU/+pcYfEhEoANG49K58AY7OFrkbMwVaDPlLMxHF6QpnNJ2BOd0wBZvfFmxEQK6
         B8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950184; x=1795554984;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ays1EfzTLcRjTY+4yI71x15YxEo2laYpKiSTCWHUOoo=;
        b=SY3fS5lsj3S2ltjETvnDeDA4zzoWPtVcrQ8zrsK83oxqKNGaMnBIymhEp7aePcoQ7M
         WV5K6HdBMc6KcD1ANbUwd/DzZAdhnzj51g3iFrOG5LjiSOk01Sf6H9gB+4E3MeVWpPq8
         RNOoJxFbLn65tKIE/m2qI8xYML/8mGUvLFdrUp8uY1i+zVvLRYr+w7CS+WvQaCD1wwG/
         UxpcQZnJMfNKyI7OZdNG+1V30/4iRiCO7wFTBdlv5W9X4DSScR/X36/SQosnA96JwXfa
         B5n8q5q9PhWFuupo9sNFzOGUagIZuOo/Zj5B5gsVrFJyjMYVlqhsWbp4dXdz2t1Cxjnx
         7aAg==
X-Forwarded-Encrypted: i=1; AL+hErEfrAbuoOuIQ3JdCsnrvWcJzzTIbpTBlstnKZRRuLn+MDe0cbcqlKDlFClPogy4W6ah1TzeHC8ioLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GpWiRbSaRhBhXJV7ksZUQuqCQTZMw315rK1FK0dBtShAcGVOB
	Ma1IPqg+zX57D8H3+OBNpwEej6g6lPPqI9UehcHirVK9gApE1yOQK8e7DLm9b+5mWg==
X-Gm-Gg: AZFdTZfuCP9dZ1UBfdYwJR6YYJbOC9D3RTvL3eRvdrpokEh+aTX8whUQBM2dcCrxNN4
	DP+kwR53vC1wyI6dxEKXbI1mXcXcC9ddMpL7s7xyZOGH6VvPBartmm8xj67LtqqdsAXoRTjmdqQ
	4ekNx+P+9ubPUVq67AlKMcZFw7k1OQPWc0ohbuIFvAhSLtHyaGi7ylpn/HbiHeCIe3mU04iDFOY
	9Z0jNEwcxm8CVtxvqNJAelHmuuD1aP7m+UdH3oMZ0LCFtwDkh1FT9j0pAipaNV4j0NVgor1nHiI
	onxCsSXQd/IlVSUkSwmj0eo0l535IM5o5HbgDtRCZm32AbXN5S8oyPDmcY73LIlQlmj+8A63BdX
	30xPUcBRwp2t3pguzx6W5o9PWtwEf0+hnBe9TLZR/BF0nZfQ5rwmfYPy2BVMaWX8FjHHyICxSET
	U8Wxy2DtiLVj03onaiRXGpO0oW/MFHpa5vyT9u3WF3AD4SGWgez82uyY2m7ZepU7zCmDg6U+NDa
	fGx7ItLMyu+H6+WSAE+UM5slHuVcxsgeGkRVYOFPKQccYkOynxqU9OxujkjHmXaf32UWRYY+oHv
	5W1w9A1R7g3tQvZGTpeNO8UMhCfmUIBclKZRYGp18aLyQ/WqZszkZs7G0lkGEXU8iJ7XkvvqVeR
	sy70QEPg+gw==
X-Received: by 2002:a17:902:f790:b0:2e9:460e:ca57 with SMTP id d9443c01a7336-2eff7529757mr5030915ad.15.1794950183338;
        Tue, 17 Nov 2026 13:16:23 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61841aasm2714705ad.34.2026.11.17.13.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:16:22 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 13:16:21 -0800
Message-Id: <DMXSQHZG5L27.2NIIT7F6FW0ME@google.com>
To: "Alex Williamson" <alex@shazbot.org>, "David Matlack"
 <dmatlack@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, "Adithya Jayachandran"
 <ajayachandra@nvidia.com>, "Alexander Graf" <graf@amazon.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Chris Li" <chrisl@kernel.org>, "David
 Rientjes" <rientjes@google.com>, "Jacob Pan"
 <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke" <jrhilke@google.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner" <lukas@wunner.de>,
 "Mike Rapoport" <rppt@kernel.org>, "Parav Pandit" <parav@nvidia.com>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pranjal Shrivastava"
 <praan@google.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Saeed Mahameed" <saeedm@nvidia.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Vipin Sharma" <vipinsh@google.com>, "William Tu" <witu@nvidia.com>, "Yi
 Liu" <yi.l.liu@intel.com>
Subject: Re: [PATCH v10 09/13] PCI: liveupdate: Adopt ACS controls in
 incoming preserved devices
From: "David Matlack" <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261013162529.1928093-1-dmatlack@google.com>
 <20261013162529.1928093-10-dmatlack@google.com>
 <20261116170942.720b06fd@shazbot.org>
In-Reply-To: <20261116170942.720b06fd@shazbot.org>

On Mon Nov 16, 2026 at 5:09 PM PST, Alex Williamson wrote:
> On Tue, 13 Oct 2026 16:25:25 +0000
> David Matlack <dmatlack@google.com> wrote:
>> +int pci_liveupdate_adopt_acs(struct pci_dev *dev)
>> +{
>> +	/*
>> +	 * Check if the device was preserved over a previous Live Update (even
>> +	 * if it has already gone through pci_liveupdate_finish()). This ensur=
es
>> +	 * that the device continues to use the ACS controls established by th=
e
>> +	 * previous kernel.
>> +	 */
>> +	if (!dev->liveupdate.was_incoming)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * The previous kernel should not have preserved any devices that
>> +	 * require device-specific quirks to enable ACS, but if such a device =
is
>> +	 * detected (e.g. new device-specific ACS quirk in the current kernel)=
,
>> +	 * log a big warning and fall back to the normal enable ACS path.
>> +	 */
>> +	if (pci_need_dev_specific_enable_acs(dev)) {
>> +		pci_warn(dev, "Device-specific quirk required to enable ACS!\n");
>> +		WARN_ON_ONCE(true);
>> +		return -EINVAL;
>> +	}
>
> This looks pretty unsafe and the comment is only explaining how we
> might get here, not why we shouldn't panic.  IIUC, the IOMMU lho
> support requires singleton groups, but I'm not sure what it does if a
> group becomes non-singleton in the new kernel (such as via a new quirk).
>
> Is a warning related to what might be a parent bridge rather than the
> endpoint device, really sufficient here?  Thanks,

It's not necessarily safe. The new quirk could change how TLPs are being
routed while a downstream preserved device is still sending memory
transactions.

I think a better approach would be for a preserved device to always
adopt the ACS controls left by the previous kernel, and keep them
across resets through the ACS save state. So a new device-specific quirk
for the device is ignored, apart from logging a warning. IOW, new ACS
quirks only take effect on cold boot.

If a preserved device has an ACS capability but no save state (i.e. the
allocation failed), then we can panic, since its adopted controls would
be lost by the first reset..

Roughly:

	int pci_liveupdate_adopt_acs(struct pci_dev *dev)
	{
		if (!dev->liveupdate.was_incoming)
			return -EINVAL;

		if (pci_need_dev_specific_enable_acs(dev))
			pci_warn(dev, "Ignoring ACS quirk, adopting ACS controls from previous k=
ernel\n");

		if (dev->acs_cap && !pci_find_saved_ext_cap(dev, PCI_EXT_CAP_ID_ACS))
			panic("%s: No ACS save state for preserved device\n",
			      pci_name(dev));

		return 0;
	}

The panic would only happen if allocating the save state fails. Ideally
I'd like save state allocation failures to cause the whole device setup
to fail. That's something I'm hoping to do in the future on top of the
pci_save_state rework [1], and then we can remove this panic. Until
then, the panic is constrained to Live Update, and the allocation
shouldn't fail in practice.

As for IOMMU groups: Sami's IOMMU Live Update series refuses to let any
device join a group that contains a preserved device, in both the
outgoing and incoming kernel (__iommu_probe_device() fails with -EBUSY)
[2][3]. So if the new kernel considers the path less isolated than the
previous kernel did, e.g. because of a new quirk, the group grows and
the IOMMU core refuses the second device rather than putting both in
one group. The system comes up with that device unavailable, which can
be debugged and recovered by rebooting, instead of panicking.

[1] https://lore.kernel.org/linux-pci/20261106004218.604799-1-dmatlack@goog=
le.com/
[2] https://lore.kernel.org/linux-iommu/20261110040828.1774343-6-skhawaja@g=
oogle.com/
[3] https://lore.kernel.org/linux-iommu/20261110040828.1774343-13-skhawaja@=
google.com/

Does that sound reasonable?
