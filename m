Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E9237AA78
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570735; cv=pass; b=vFydY7vK2MpUGzkN7DfbolhZYxcObBuHiMSl8vG05oFcDfJlxauTEJbuvKkNk8C+vgYLRAO+/jahNFztq+6z9PpmXoorY6Y9EGWS5wON7FPSUlR9uxvhKREJIbKHIX8ius6hAQc3c1paPDb3hSgtIxg8PLK4VpZS5DWe20hdowM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570735; c=relaxed/simple;
	bh=AtQrPMl91+yYtI9BLCPBjsG0Yu7Rz7PLsn3mJ6H0/pA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMVgxP02UqDx8gDoZB6QnWpbwPtrHRio75dSfSY5JnBts3Kju8aot9XqP6ik0QpP0TO9uImpMwsThHLQAgM2hjD3jJA3+koZKsWbGjo+dpWUKw18qYinwM5smzGWjCDbg3dvOmIDLtSvatA5J0TsXsR9CCYd9ubk36wUf8psS6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tC9vtssF; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tC9vtssF"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so161084966b.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 07:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789570732; cv=none;
        d=google.com; s=arc-20260327;
        b=R8uATgK+kghFucGd+BUMdM+mtVVnti+juJ9o1vMOST5+gx39FQMXmNOK0sii1MPo+U
         oHqCSMQSCkaTKfovgUraRwdYOhYRq8eDZ3+ULI+KZGi8q+zot6Dnfn7XeIDpIJVzPrOr
         EtrobObAI+lJXV1RgBbvGgyS7Ma8rlNCvuuoBk0A5W8Lte0bPA8vUCUqlZH23R2uIN+B
         3eHywCADQp2XDaIbiNyY4m98GrScYwlW7JHrHeS90kofyHv36eA3ulVTdTTjOyY7tOPZ
         u9Ao7XoBH9lzedHxc9ePQ0EgY7+B+HNp6ymeCmP2pvvagQuC674RMz0dmdgsNQRR9mms
         58Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7B8AGM6usS6/DkOynGbVPS6pps2aTMeSLXoc/PLBLeU=;
        fh=G8f5y0qwHx8onsZJShO675wMWrFaJ+b/30+MpWNnMqc=;
        b=Pk+pYa/H6S7k7GQW8sZ93QyokhydrBYtzSIiJOM8BdPG3ipvZwW7F7kKgeMPWPfHAs
         iaq4oxOuok0/DhGlU+ug/977IQg1CWtXCiZ/Bc9OKzp5TROfMGjcepRpvVbYNc+p8znK
         DeLoIL1Bo1M1+PR7GGgmVradsQqNeT3Y+zkNwYGTyTOvKQUDsd7jP9qqu7Ts27YmXlkG
         o90i5nVPFUkdkq2+VppY957mpUDo4C91fwUCEY4C11+Oup5NOrCWy6ve2lzg6TaoNeAh
         7qXwy9l+r6ThFzyFDT0amikpg+8XnWES0thSlzgygGjbJ+n5ZlDX5R8+zfrVgdiz5J1m
         lCdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789570732; x=1790175532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7B8AGM6usS6/DkOynGbVPS6pps2aTMeSLXoc/PLBLeU=;
        b=tC9vtssFRHP7YED+FiQg6pv4DT0aIDonO37ZnVDyqUCZ4dDzQxv+1bkP0tBwBwz9jQ
         cxBqDzXFyUOHth5/D5GyZH2n4VowYr+UEMZAiQLADVITanuFCLAHypEsyNrmuCIW91Vp
         eB4V6JFk06jQsBZRm6hKm53FuYMf8BuPCD/jSFAw489qhtRtDOVL8w4kRcWtVBAbZh92
         UiZwp39dec7eDR/ccqOp4u6GWLVGou//a8negWu75Iy57yVz1WhRHakEqjnbw2R6DpPp
         L/vgXxGtmn4DDPDiW2UUaCPaOrtIJYiuNM9l85x36q3GS4BTJXp6DfIDMxt4OVcbUFnG
         2eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570732; x=1790175532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7B8AGM6usS6/DkOynGbVPS6pps2aTMeSLXoc/PLBLeU=;
        b=JwD8VLVOQsTZ5MMCa2Xp86J5VqKymsN4CeXyE0HNwrgwrn+EDI0NKoBSQsMnu7HLM5
         BxwrgcB2sL1wwI46FPqpOnXdq1zr1Nfb4GSQ+wPRIptEP7QAX9ArwnlDMWATCgx44t/u
         sN7QMLyr727OZkoxDbeGq5KPn/x1xKDj0sgaYp7LtR5LoZRZvsabZt9riwrBARQP7lXl
         HR9nh45xqOt16fDp//vfWnE/hHCvWb1dKYAZiIVsdpPiIltIrJlCndzbYQaC1Pkvfk9w
         y6x9vdWEwsxb7QG6If08F4qejKPq6WH0cw+OJq+YD7RVzL4UpBqtE+r9PsL1AU0MATQb
         lEEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLo3uUVGxgHDsVWd9bQFOkfINStadkY5Ncmb/GnOnvXIU/usW3M6pWOubJK7DrrgYOk6tvh0OZdKI=@vger.kernel.org
X-Gm-Message-State: AFuF++m7jPBEwBf8lGQ9aUzVnVgWH68LjRTUNnepUKQhw9N/769wu4FR
	K9VRFlKRe+7Dc/+5/gLThVpgxBrIJa9JTcgvnV4DeBz2vdMmrFdfjSbcN8PV7F2EeiCzWLm7cjT
	8WlCYtRfw+KFNH1RQtKSsfD/OBa6QQSMDdlyCnCeU
X-Gm-Gg: AYBFou2HmzRbYC9EdL67JmgtDghbRSXD7bgD+8lP1ExRZ+cbn8LPiClVjBuIpbDaB31
	nwwTi3RUTXb/YVrquTTL935lWB/c7ntexNrLNG/UHDpNjm8ce3Fzmr7ZASjDdBhxP5difI+QWby
	Yn6oS8vu/efqYF8ibddkE5e68UNKi8hh5QTLv1M+TbqO38wCL0GT5Y/KPHa7rIA6oxqnyaJMmUk
	zWtRNwqJYTIfkjf/rsN3EKwoCz/f6kery2ukD6eyRv2IPWI7IjrLDV5aSKcjjKoxg+nThFNMbR6
	GpnNUaJqF29gonNJ4pmwetvynh1VGts8HdfsC62RTIOZQZRevN1JXK0=
X-Received: by 2002:a17:907:c49a:b0:c28:fb3f:fe20 with SMTP id
 a640c23a62f3a-c29e52c71e0mr199279166b.30.1789570731516; Wed, 16 Sep 2026
 07:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728221007.2098560-1-dmatlack@google.com> <20260728221007.2098560-3-dmatlack@google.com>
 <9211b2b6-9fca-4ef7-a141-84636d56e67e@linux.dev>
In-Reply-To: <9211b2b6-9fca-4ef7-a141-84636d56e67e@linux.dev>
From: David Matlack <dmatlack@google.com>
Date: Wed, 16 Sep 2026 07:58:23 -0700
X-Gm-Features: AcwNN1V694h9Klbei55CjXCXrLccfSPzJ9ZF9qWXraB-n35v9TC4KupB_2aeuGo
Message-ID: <CALzav=dJUiZe+Hxck9X+kKVXoRn-Ks2WxV7B5i0RHRFGy7-Mpw@mail.gmail.com>
Subject: Re: [PATCH v8 02/12] PCI: liveupdate: Track outgoing preserved PCI devices
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 8:10=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.dev> w=
rote:
>
> =E5=9C=A8 2026/7/28 15:09, David Matlack =E5=86=99=E9=81=93:
> > Add APIs to allow drivers to notify the PCI core of which devices are
> > being preserved across a Live Update for the next kernel, i.e.
> > "outgoing" devices.
> >
> > Drivers must notify the PCI core when devices are preserved so that the
> > PCI core can update its FLB data (struct pci_ser) and track the list of
> > outgoing devices. pci_liveupdate_preserve() notifies the PCI core that =
a
> > device must be preserved across Live Update. pci_liveupdate_unpreserve(=
)
> > reverses this (cancels the preservation of the device).
>
> Hi David,
>
> I have a question about the pci_liveupdate_preserve() and
> pci_liveupdate_unpreserve() APIs.
>
> Is it supported to call these APIs multiple times for the same PCI
> device? For example, a driver could do:
>
> pci_liveupdate_preserve(pdev) -- > pci_liveupdate_unpreserve(pdev) -- >
> perform some operations -- > pci_liveupdate_preserve(pdev) again, before
> the actual Live Update starts.
>
>  From the implementation, it looks like an unpreserved pci_dev_ser entry
> can be reused, so I wanted to confirm whether this preserve -- >
> unpreserve -- > preserve sequence is an intended and supported usage.

Yes that is a completely supported use-case. A device can be preserved
and unpreserved any number of times up until pci_device_shutdown(),
where the preservation status of the device is frozen (see patch 10).
