Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D73E3B6BF1;
	Tue, 24 Mar 2026 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371284; cv=pass; b=Xovj4TRQ5saaHsZKf6NVOs50S1ehSyKo7DfttrcI+rHwyFHXfYAKFwNy8Hu2P7gzhaamDCPIx7yO8dp2YZV1lfhLZ32tQAqMj1F2Iw67JdrKIjrmmb4XrMp31dZQ2+tvqEpJAL4wwE9kgfHxknKgYIbv21qMQ+HODn21glWFDng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371284; c=relaxed/simple;
	bh=eD214mtHF/WW6H68DsGLo/msR8qnvnqZKMwXvGv+2X4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sM/fCHWRkZNW3ifLvSQ69jdKDcJRc14TpxnRHITn4BS+Qx06Z8KhdM58uvpkh2krU4VgZdQ0KeG+tNiHI74O65+/gZ2hNOcOW3v7jLR7uvk0NZmEpmiV/AUXUQoH/IbyBSNOh5WNrxan4DZiXyq4U8d7SfW8DSF4St+CamuaSlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=gZyNlLd3; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="gZyNlLd3"
ARC-Seal: i=1; a=rsa-sha256; t=1774371260; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=DMMMiR4qRi/UPFQQ9cPQRqNNkpMHm+Xnov/DG5TugLijJaqF5OstFiqOSfhSwZvpv6x4LfIVG5D+pLKrystA13bY2HBYBkHKsIJU/meuZoPSXUJ8Lp2Qtbc427/9Va6pe8IDf/Z1+4wpXQ8kzfJMpCBDS465+fUJH8m3VsLI52U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1774371260; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rVcgEwVcIpvGmwWCuy/AsiNt0X+iXREcY/5B7RMvY+c=; 
	b=Qc2XMRgLpyTtJ2fpqgBP/cZcaQDF/AuJg1ArNgX89muEWb/Q//Z0wTg16KwYmyWUSpEb6TgpGTkKWm4Bvo3WTX6g4opGVtB/m0KiwbTqbWhyd5hccbLtW9LK1T11KIjsHtO4fBrMZRJ+rVCgL9tfgeLmuIxS8kR4Y3L/brAUvZs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774371260;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=rVcgEwVcIpvGmwWCuy/AsiNt0X+iXREcY/5B7RMvY+c=;
	b=gZyNlLd3mBmt+hdcbGnth0yU//HaBB35LDSaM6xqGIGlYpXZbT0EDly2YQKRYVPR
	sec3hxw7CROA3nw8Km9ut2C6i+Sc0UC3HvY0GZYy8vDLsiXVOMmG8SkRZaOBJ5k7f9Z
	5caMbEABZeyKwGsAYs7g8YFGGOniRfhIgDbPLVqI=
Received: by mx.zoho.eu with SMTPS id 1774371258497571.9224101306835;
	Tue, 24 Mar 2026 17:54:18 +0100 (CET)
Date: Tue, 24 Mar 2026 16:54:17 +0000
From: Josh Law <objecting@objecting.org>
To: =?ISO-8859-1?Q?Tom=E1s_Pando?= <tovictakamine@gmail.com>, corbet@lwn.net
CC: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_docs=3A_driver-api=3A_fix_6_s?=
 =?US-ASCII?Q?pelling_typos_in_Documentation/driver-api?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260324163604.5710-1-tovictakamine@gmail.com>
References: <20260324163604.5710-1-tovictakamine@gmail.com>
Message-ID: <2F84DD09-2880-45E0-AA98-204F10848F85@objecting.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External



On 24 March 2026 16:36:04 GMT, "Tom=C3=A1s Pando" <tovictakamine@gmail=2Ec=
om> wrote:
>Fix minor spelling mistakes in the driver-api documentation=2E These
>changes improve readability in ACPI, CXL, DMA and PCI docs=2E
>v3: Added reviewed-by from Randy Dunlap=2E
>v2: Added full name as requested by Jon Corbet=2E
>
>Reviewed-by: Randy Dunlap <rdunlap@infradead=2Eorg>
>Signed-off-by: Tom=C3=A1s Pando <tovictakamine@gmail=2Ecom>
>---
> Documentation/driver-api/acpi/acpi-drivers=2Erst         | 2 +-
> Documentation/driver-api/cxl/platform/acpi/cedt=2Erst    | 2 +-
> Documentation/driver-api/cxl/platform/bios-and-efi=2Erst | 2 +-
> Documentation/driver-api/dmaengine/pxa_dma=2Erst         | 2 +-
> Documentation/driver-api/libata=2Erst                    | 2 +-
> Documentation/driver-api/pci/p2pdma=2Erst                | 2 +-
> 6 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/Documentation/driver-api/acpi/acpi-drivers=2Erst b/Documenta=
tion/driver-api/acpi/acpi-drivers=2Erst
>index b1fbbddb8=2E=2E376b6d8a6 100644
>--- a/Documentation/driver-api/acpi/acpi-drivers=2Erst
>+++ b/Documentation/driver-api/acpi/acpi-drivers=2Erst
>@@ -47,7 +47,7 @@ generally be avoided and so struct acpi_driver objects =
should not be used=2E
> Moreover, a device ID is necessary to bind a driver directly to an ACPI =
device
> node, but device IDs are not generally associated with all of them=2E  S=
ome of
> them contain alternative information allowing the corresponding pieces o=
f
>-hardware to be identified, for example represeted by an _ADR object retu=
rn
>+hardware to be identified, for example represented by an _ADR object ret=
urn
> value, and device IDs are not used in those cases=2E  In consequence, co=
nfusingly
> enough, binding an ACPI driver to an ACPI device node may even be imposs=
ible=2E
>=20
>diff --git a/Documentation/driver-api/cxl/platform/acpi/cedt=2Erst b/Docu=
mentation/driver-api/cxl/platform/acpi/cedt=2Erst
>index 1d9c9d359=2E=2E217a75fb4 100644
>--- a/Documentation/driver-api/cxl/platform/acpi/cedt=2Erst
>+++ b/Documentation/driver-api/cxl/platform/acpi/cedt=2Erst
>@@ -55,7 +55,7 @@ voltile vs persistent, etc)=2E One or more bits may be =
set=2E ::
>   Bit[1]: CXL Type 3 Memory
>   Bit[2]: Volatile Memory
>   Bit[3]: Persistent Memory
>-  Bit[4]: Fixed Config (HPA cannot be re-used)
>+  Bit[4]: Fixed Config (HPA cannot be reused)
>=20
> INTRA-host-bridge interleave (multiple devices on one host bridge) is NO=
T
> reported in this structure, and is solely defined via CXL device decoder
>diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi=2Erst b/D=
ocumentation/driver-api/cxl/platform/bios-and-efi=2Erst
>index a4b44c018=2E=2E5d918b06f 100644
>--- a/Documentation/driver-api/cxl/platform/bios-and-efi=2Erst
>+++ b/Documentation/driver-api/cxl/platform/bios-and-efi=2Erst
>@@ -277,7 +277,7 @@ The CFMWS field of the CEDT has special restriction b=
its which describe whether
> the described memory region allows volatile or persistent memory (or bot=
h)=2E If
> the platform intends to support either:
>=20
>-1) A device with multiple medias, or
>+1) A device with multiple media, or
> 2) Using a persistent memory device as normal memory
>=20
> A platform may wish to create multiple CEDT CFMWS entries to describe th=
e same
>diff --git a/Documentation/driver-api/dmaengine/pxa_dma=2Erst b/Documenta=
tion/driver-api/dmaengine/pxa_dma=2Erst
>index 442ee691a=2E=2E8f9da66b0 100644
>--- a/Documentation/driver-api/dmaengine/pxa_dma=2Erst
>+++ b/Documentation/driver-api/dmaengine/pxa_dma=2Erst
>@@ -40,7 +40,7 @@ Design
> =3D=3D=3D=3D=3D=3D
> a) Virtual channels
> Same concept as in sa11x0 driver, ie=2E a driver was assigned a "virtual
>-channel" linked to the requestor line, and the physical DMA channel is
>+channel" linked to the requester line, and the physical DMA channel is
> assigned on the fly when the transfer is issued=2E
>=20
> b) Transfer anatomy for a scatter-gather transfer
>diff --git a/Documentation/driver-api/libata=2Erst b/Documentation/driver=
-api/libata=2Erst
>index 93d97fe78=2E=2E28b8437f6 100644
>--- a/Documentation/driver-api/libata=2Erst
>+++ b/Documentation/driver-api/libata=2Erst
>@@ -286,7 +286,7 @@ and other exceptional conditions=2E The primary respo=
nsibility of an
> implementation is to call :c:func:`ata_std_error_handler`=2E
>=20
> :c:func:`ata_std_error_handler` will perform a standard error handling s=
equence
>-to resurect failed devices, detach lost devices and add new devices (if =
any)=2E
>+to resurrect failed devices, detach lost devices and add new devices (if=
 any)=2E
> This function will call the various reset operations for a port, as need=
ed=2E
> These operations are as follows=2E
>=20
>diff --git a/Documentation/driver-api/pci/p2pdma=2Erst b/Documentation/dr=
iver-api/pci/p2pdma=2Erst
>index 280673b50=2E=2Ed3f406cca 100644
>--- a/Documentation/driver-api/pci/p2pdma=2Erst
>+++ b/Documentation/driver-api/pci/p2pdma=2Erst
>@@ -38,7 +38,7 @@ for all usage refcounts to reach zero=2E
> At the lowest level the P2P subsystem offers a naked struct p2p_provider=
 that
> delegates lifecycle management to the providing driver=2E It is expected=
 that
> drivers using this option will wrap their MMIO memory in DMABUF and use =
DMABUF
>-to provide an invalidation shutdown=2E These MMIO addresess have no stru=
ct page, and
>+to provide an invalidation shutdown=2E These MMIO addresses have no stru=
ct page, and
> if used with mmap() must create special PTEs=2E As such there are very f=
ew
> kernel uAPIs that can accept pointers to them; in particular they cannot=
 be used
> with read()/write(), including O_DIRECT=2E



Acked-By: Josh Law <objecting@objecting=2Eorg>


Patches like these are good clarification=20

Keep it up!


V/R

Josh Law
