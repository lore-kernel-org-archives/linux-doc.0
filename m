Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0B8369D71
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 17:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482314; cv=pass; b=Xs4EslI9jwkMvaNb1arscAJQj2uOBshsmarYWDa8RBsy93XiH7MKtlmKlXPw4HzgeGItr+KLOWSmU6F1ORHQj6Bs4qE8t9kNFv4ZaVWmt1YPumzHoU0fyx/pb5mUhCZYHpejgFnBR3fxICD/mYG08ps1oLrdRryD7n/KJD6ximw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482314; c=relaxed/simple;
	bh=+PQHOWhS6Z/YJqJfeCNpqWI3Cf2C66ZMrvU1PsYpWWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pVXoV/bT6aktOqBMl16zmAnZrjbjLUg6SlEa+Z8mm2KJhYf4zQ5fDzje4OxW9UjT6e8zVKOYMxNl+ngT6Nbc9aL2ulIJZddGf7gBg0W3PWXncwyBH4ldBOybABVvROMGPYK8O5eLakZmvzqgXCHmNZ36TghUQqodauhWLywXTZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ak6PV6fo; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak6PV6fo"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8256106635eso1680723a34.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Oct 2026 10:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791482311; cv=none;
        d=google.com; s=arc-20260327;
        b=Ji1VhdCCJ6HszPWsv+500Jb9DQaFXu6mPBnHy2UoCBvZ4NoFkmsxEKLpqKif3TOAlz
         JdYT+iU69MtvHKlUcH4y/f/Y1tkEK6JrP62dfegs/9LRSr1UK32GYJNWmiAkruJ7n3KB
         VHRLA+ylwUfPSPNDvAyolO8Qvwm7b5W7fn86QN0zq5mCxFCUVLj4v+Rc4RKi2/6a9Ihi
         QZpQ4Ikgs/mWPbwwDhzJfAXRrZ5Q4M8/WBp/IAoJSo7gPYsutr7Lsb0gw/QtRvYiklph
         2v9B7ZIIGUVuf0/EcnKoqLaQ0r/SpsruaFSckFwwWXRs0WTEuilTSOjf/Kl3+Tp4Bo4O
         l3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t87G03YJP+Jtnvd/a8HSoKeiu6kRlnnSEIlqeg1Cd6Q=;
        fh=bJzjwszVhEOKUv/vKdFY/ImA47LNMV0uJx7Q0o5Vxao=;
        b=a8hPbo010Unj0C7nwMZTQYYkS7wARIKpo73bpoUe0GiFu+7SPJgKVfQofhx/xiWkSw
         HTVgtn5HCprUqjnNanAxQDqqChuDiFSm6HuVWhBM1txNatt6SgvUSajOYwuP+tDPD0vW
         HHhMSxXlg+cIRp5QGPMFkw+RGi2+LRFFc5X0efbif71Jcuo5fhqimnBD+/Poq+ZHRsT5
         1ltb/O9jy1E14NKI+HJr0zD2EAA7rqBuidnbs2NsasVENq+rPdljsPU78OqxKTj7k+YC
         3pQaPcwfsrzGEMacBSeIdGPh2mPTRtYo7yBpBixGoUiBN23tPrKmd2mdkj1BmCsD7+dN
         ib3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791482311; x=1792087111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t87G03YJP+Jtnvd/a8HSoKeiu6kRlnnSEIlqeg1Cd6Q=;
        b=ak6PV6foUHSdBw/tqnd94Q+TnEZpCxhtlK6/OZct3xv5qb47SaSigWejmO2nLb5gKn
         3r6+beZ/nClYfGOgqGKeV4avpRwSWxevx1YSdvz/m4lKRmS3ebIuDs0gg8FFNXt3Tiiv
         MOjvGwVWhQvBEJ/tOksOTdkApWeOyO6+z5hnMMQVYTFaIv74DdNWGU13W5+3CkusTe/N
         /qh1feV14x5hom/T6x/kpUA7E1wxPwBPM6gqf2/58y+UyZCNL6+6UKdBMVuPaf2R3m9f
         nKepwVqktpe6Gk4EavokJ8X26EbDp8OHgwCkrvirnE8kbtf8lxEGpQoybKnrse2O8Z7F
         +zZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482311; x=1792087111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t87G03YJP+Jtnvd/a8HSoKeiu6kRlnnSEIlqeg1Cd6Q=;
        b=zGbAS8Y0Tbf7RqgkKYmZvxjIpqe9oiN68WlQw9mQN+HC1OBXBsJiSjwJaYxr6yY98/
         ZHMTqS9SRUYM+cLRJ7D9m34ensFL7mE79l7TwnGX+7Gzfck/FdjJbpIZVbEjVjPgYJDo
         D5MHyXEVkh68eyWwVahSf3IdsAp+MUenGEBVx2fMyDsZD4LrLPZCTlmj27aedCqAAbwH
         GSX+XRCqQvE/FrldWj9x4Cih20qbbXJn3YW12N/wDxStZLumHkmCD9qk1O+opsAwc4Yo
         DGjxZ9LAl0xfjGQyEko2fOT+msA/EYyT+pfkAJ4YJ6hnppL6HuWbXqvSAHncWeYN7Yf2
         GdCw==
X-Forwarded-Encrypted: i=1; AKwUvBzSLIY2hKQzpl/oY5NyVVKdiCcQmLls54Kcs9pHiNKXMMjR3p+quQKaxKocA32h12PJTIbYmGGxRjc=@vger.kernel.org
X-Gm-Message-State: AFuF++kQN+nG1kckTKuDQiYwryHCiH4THvSkDRtqyTsO5NUP6edbD3mg
	G9FxcGS/oq2FgGYmlWPrHkPqVUWBrdDF+POeuurmPTfuREJ/Iq0uYuNxNv09EuA1/DMoHhjqQUS
	EdR5ZYH3B8Umdk0mAFiqkVMvxbTuC8Hw=
X-Gm-Gg: AYBFou1PatlRvJJtvoKckFkcC+oE0EnqqrCzCqZtEj1urlkLMqTyCHJicsmUP6V+lQ4
	aA7/09/i+AydxxzDLJGitfu4sob/3iarf2EDgouWsuBMWCShoNVKmQwi9X8PwethKSjvgKIV+w2
	yJmEWmaXOeZUk1LDehCHnVBgkS1UnYi1bAijKBmBUsu+sSj0aSM61fRpRLhmWs/U26ZAHkXx2/S
	WDtMdyWUgrbpxA1l+Go4wXmHFBvanF4TkFdVCL1RYqiARQF1kK8fKilbQTom+JxKgs7x3R4YVbq
	ckJTB+iBfbh8dKhlXBe804JX1wVs8PnIlleIxdqli7Ar3uJE0qf6gtM=
X-Received: by 2002:a05:6830:6ad8:b0:804:d4b0:a36 with SMTP id
 46e09a7af769-82ad06ca857mr5680753a34.27.1791482311350; Thu, 08 Oct 2026
 10:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com> <ac2a8f1c-295e-4791-b233-cc8549430e07@oss.qualcomm.com>
In-Reply-To: <ac2a8f1c-295e-4791-b233-cc8549430e07@oss.qualcomm.com>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Thu, 8 Oct 2026 18:58:18 +0100
X-Gm-Features: AclHuK8_IR-ipfDqjHPYRkAYBCIcO3XOLSiPBhuHH-voREme2zuF2x6jh8EHKeg
Message-ID: <CAG4KcRLk3FdV1uKHhiTtr8uAuEB+Z=rBnrHgzPwPxQRsLyo-CA@mail.gmail.com>
Subject: Re: [PATCH v23 0/2] ACPI: Add support for ACPI RAS2 feature table
To: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
Cc: rafael@kernel.org, bp@alien8.de, akpm@linux-foundation.org, 
	rppt@kernel.org, dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sathvika,

Thanks for verifying and confirming.

Hi Boris,

Can you merge this change or Do you want me to send another version
with the change?

Thanks,
Shiju


On Thu, Oct 8, 2026 at 8:38=E2=80=AFAM Sathvika Vasireddy
<sathvika.vasireddy@oss.qualcomm.com> wrote:
>
> Hi Shiju,
>
> On 27-07-2026 02:58, shijujose2008@gmail.com wrote:
> > From: Shiju Jose <shijujose2008@gmail.com>
> >
> > Add support for ACPI RAS2 feature table (RAS2) defined in the
> > ACPI 6.5 specification, section 5.2.21 and RAS2 HW based memory
> > scrubbing feature.
> >
> > ACPI RAS2 patches were part of the EDAC series [1].
> >
> > The code is based on linux.git v7.2-rc2 [2].
> >
> > 1. https://lore.kernel.org/linux-cxl/20250212143654.1893-1-shiju.jose@h=
uawei.com/
> > 2. https://github.com/torvalds/linux.git
> >
>
> [snip]
>
> > Shiju Jose (2):
> >    ACPI:RAS2: Add driver for the ACPI RAS2 feature table
> >    ras: mem: Add ACPI RAS2 memory driver
> >
> >   Documentation/ABI/testing/sysfs-edac-scrub |  20 +-
> >   Documentation/edac/scrub.rst               |  70 +++
> >   drivers/acpi/Kconfig                       |  11 +
> >   drivers/acpi/Makefile                      |   1 +
> >   drivers/acpi/bus.c                         |   3 +
> >   drivers/acpi/ras2.c                        | 509 +++++++++++++++++
> >   drivers/edac/scrub.c                       |  12 +
> >   drivers/ras/Kconfig                        |  13 +
> >   drivers/ras/Makefile                       |   1 +
> >   drivers/ras/acpi_ras2.c                    | 624 ++++++++++++++++++++=
+
> >   include/acpi/ras2.h                        |  86 +++
> >   include/linux/edac.h                       |   4 +
> >   12 files changed, 1349 insertions(+), 5 deletions(-)
> >   create mode 100644 drivers/acpi/ras2.c
> >   create mode 100644 drivers/ras/acpi_ras2.c
> >   create mode 100644 include/acpi/ras2.h
> >
>
> I applied the v23 RAS2 series on top of Linux v7.2-rc2 and tested it.
>
> Verified ACPI RAS2 and PCCT discovery, PCC mailbox registration, EDAC
> scrub device creation, scrub capability sysfs attributes, background
> scrub control, and demand scrub operations.
>
> I also reproduced the PCC TX ticker issue reported during Ashok's review
> of patch 1/2 and confirmed that the proposed fix (initializing
> mbox_client.knows_txdone before pcc_mbox_request_channel()) resolves it.
>
> Without the proposed fix:
>
>    # d=3D/sys/bus/edac/devices/acpi_ras_mem0/scrub0
>    # echo 0x8000000000 > $d/addr
>    # echo 0x1000000 > $d/size
>    # echo 1 > $d/enable_demand
>
>    [125.577700] PCCT PCCT: Client can't run the TX ticker
>    [125.577704] PCCT PCCT: Client can't run the TX ticker
>
> After applying the proposed fix and repeating the same test, the PCC TX
> ticker error was no longer observed.
>
> Based on the above testing of the complete v23 series together with the
> proposed PCC fix, feel free to add:
>
> Tested-by: Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>
>
> Thanks,
> Sathvika
>
