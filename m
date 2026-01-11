Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBB122301;
	Sun, 11 Jan 2026 18:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768154857; cv=none; b=lRId+aHGeoqaQEE8FoJorTHSwWMBBxFB5fO18ihVHik0U1GpBJEp/ZihytT70afpEhGccTj3jN1pT3mlzqDGf0EZTP3r/9LUEUDifwQOtdm2MevlGq5bNwfTj5tsZkwiPLiU7zd5z45QYfaADXrrcLwNcV44xFiiObZG6QZCWmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768154857; c=relaxed/simple;
	bh=NsknNqSHr8d8pO18ghs4s54CCI6B/BLsIrzwFSbOocw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PFmS+zs3az6NAdAjF/ohNP3j/OxRoilXcnVGmnue7qkVYL6yakqKSBWsk4et3cknYsdVZ3yHDYXGGpyXEyX4pxvBlCOlQEvNhZ/P7iqIF6JyEN8PwKgM8ujj/5UOO3mwwjNmJe53siNZEtY+JAtGamqDsHcwgZn1qilSHWUnS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0yNB6k7f; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0yNB6k7f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q5Lsdw/XHfuO9M4cQCgnF1jhX8i1vIfHYOW7MAtJJKQ=; b=0yNB6k7f3OhvI0EV7B9p7lZb/4
	7DgJ42UFTs00CK0u4vjer4f7MLbWbf/XIWfnIIKPpGlYNs1gkq3IWylYfTXJfkLo6IEBkqo1RBvcX
	MqRxD5TVKJ90Oyx1RLJAOVUqL+xiTl14vZvMspfPzlnWad41tS8f/bi3VZ0lJ7Vozgcfj1MAxDvwE
	l5SZy4q0DQJaRGubqP9//hjikrDNghsfhttyxXjCxUOg/LBxrhZ0qWKqC7BD0aQbLYgF2FW+g+NR2
	dalEEbwIb4TCCOde9/0FKZMLleH2mg2R4LwkuPRMACGy0GI1NcEq76AAC+Ip8wq7bPAAHAnDOhIb8
	jTUEppHg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vezqd-00000004PLT-1mUS;
	Sun, 11 Jan 2026 18:07:31 +0000
Message-ID: <72af806c-af36-473a-b4ea-f9ce0b647d7c@infradead.org>
Date: Sun, 11 Jan 2026 10:07:29 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Fix typos and grammatical errors
To: Nauman Sabir <officialnaumansabir@gmail.com>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260111165901.8508-1-officialnaumansabir@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260111165901.8508-1-officialnaumansabir@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 1/11/26 8:59 AM, Nauman Sabir wrote:
> Fix various typos and grammatical errors across multiple documentation
> files to improve clarity and consistency.
> 
> Changes include:
> - Fix missing preposition 'in' in process/changes.rst
> - Correct 'result by' to 'result from' in admin-guide/README.rst
> - Standardize spelling to 'recognized' in admin-guide/README.rst
> - Fix 'before hand' to 'beforehand' (3 instances) in cgroup-v1/hugetlb.rst
> - Correct 'allows to limit' to 'allows limiting' in cgroup-v1/hugetlb.rst,
>   cgroup-v2.rst, and kconfig-language.rst
> - Fix 'needs precisely know' to 'needs to precisely know' in
>   cgroup-v1/hugetlb.rst
> - Correct 'overcommited' to 'overcommitted' in cgroup-v1/hugetlb.rst
> - Remove incorrect plural from uncountable nouns: 'metadatas' to 'metadata'
>   in filesystems/erofs.rst, and 'hardwares' to 'hardware' in
>   devicetree/bindings/.../mediatek,dp.yaml, userspace-api/.../legacy_dvb_audio.rst,
>   and scsi/ChangeLog.sym53c8xx
> 
> These corrections improve the overall quality and readability of the
> kernel documentation.
> 
> Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
> ---
>  Documentation/admin-guide/README.rst                 |  4 ++--
>  Documentation/admin-guide/cgroup-v1/hugetlb.rst      | 12 ++++++------
>  Documentation/admin-guide/cgroup-v2.rst              |  2 +-
>  .../bindings/display/mediatek/mediatek,dp.yaml       |  2 +-
>  Documentation/filesystems/erofs.rst                  |  2 +-
>  Documentation/kbuild/kconfig-language.rst            |  2 +-
>  Documentation/process/changes.rst                    |  2 +-
>  Documentation/scsi/ChangeLog.sym53c8xx               |  2 +-
>  .../userspace-api/media/dvb/legacy_dvb_audio.rst     |  2 +-
>  9 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index 05301f03b..65a06f946 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -53,7 +53,7 @@ Documentation
>     these typically contain kernel-specific installation notes for some
>     drivers for example. Please read the
>     :ref:`Documentation/process/changes.rst <changes>` file, as it
> -   contains information about the problems, which may result by upgrading
> +   contains information about the problems which may result from upgrading
>     your kernel.
>  
>  Installing the kernel source
> @@ -264,7 +264,7 @@ Compiling the kernel
>  
>   - Do a ``make`` to create a compressed kernel image. It is also possible to do
>     ``make install`` if you have lilo installed or if your distribution has an
> -   install script recognised by the kernel's installer. Most popular
> +   install script recognized by the kernel's installer. Most popular

That's just the British spelling. We accept British spellings in docs.

>     distributions will have a recognized install script. You may want to
>     check your distribution's setup first.
>  
> diff --git a/Documentation/admin-guide/cgroup-v1/hugetlb.rst b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
> index 493a8e386..02f8cd0f1 100644
> --- a/Documentation/admin-guide/cgroup-v1/hugetlb.rst
> +++ b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
> @@ -77,7 +77,7 @@ control group and enforces the limit during page fault. Since HugeTLB
>  doesn't support page reclaim, enforcing the limit at page fault time implies
>  that, the application will get SIGBUS signal if it tries to fault in HugeTLB
>  pages beyond its limit. Therefore the application needs to know exactly how many
> -HugeTLB pages it uses before hand, and the sysadmin needs to make sure that
> +HugeTLB pages it uses beforehand, and the sysadmin needs to make sure that
>  there are enough available on the machine for all the users to avoid processes
>  getting SIGBUS.
>  
> @@ -91,11 +91,11 @@ getting SIGBUS.
>    hugetlb.<hugepagesize>.rsvd.usage_in_bytes
>    hugetlb.<hugepagesize>.rsvd.failcnt
>  
> -The HugeTLB controller allows to limit the HugeTLB reservations per control
> +The HugeTLB controller allows limiting the HugeTLB reservations per control
ack

>  group and enforces the controller limit at reservation time and at the fault of
>  HugeTLB memory for which no reservation exists. Since reservation limits are
>  enforced at reservation time (on mmap or shget), reservation limits never causes

                                                                       never cause

> -the application to get SIGBUS signal if the memory was reserved before hand. For
> +the application to get SIGBUS signal if the memory was reserved beforehand. For
>  MAP_NORESERVE allocations, the reservation limit behaves the same as the fault
>  limit, enforcing memory usage at fault time and causing the application to
>  receive a SIGBUS if it's crossing its limit.
> @@ -103,11 +103,11 @@ receive a SIGBUS if it's crossing its limit.
>  Reservation limits are superior to page fault limits described above, since
>  reservation limits are enforced at reservation time (on mmap or shget), and
>  never causes the application to get SIGBUS signal if the memory was reserved
> -before hand. This allows for easier fallback to alternatives such as
> +beforehand. This allows for easier fallback to alternatives such as
>  non-HugeTLB memory for example. In the case of page fault accounting, it's very
> -hard to avoid processes getting SIGBUS since the sysadmin needs precisely know
> +hard to avoid processes getting SIGBUS since the sysadmin needs to precisely know
>  the HugeTLB usage of all the tasks in the system and make sure there is enough

                                                                  there are enough

> -pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommited
> +pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommitted
>  systems is practically impossible with page fault accounting.
>  
>  
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 7f5b59d95..098d6831b 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2816,7 +2816,7 @@ DMEM Interface Files
>  HugeTLB
>  -------
>  
> -The HugeTLB controller allows to limit the HugeTLB usage per control group and
> +The HugeTLB controller allows limiting the HugeTLB usage per control group and
ack

>  enforces the controller limit during page fault.
>  
>  HugeTLB Interface Files
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> index 274f59080..8f4bd9fb5 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -11,7 +11,7 @@ maintainers:
>    - Jitao shi <jitao.shi@mediatek.com>
>  
>  description: |
> -  MediaTek DP and eDP are different hardwares and there are some features
> +  MediaTek DP and eDP are different hardware and there are some features
>    which are not supported for eDP. For example, audio is not supported for
>    eDP. Therefore, we need to use two different compatibles to describe them.
>    In addition, We just need to enable the power domain of DP, so the clock
> diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
> index 08194f194..e61db115e 100644
> --- a/Documentation/filesystems/erofs.rst
> +++ b/Documentation/filesystems/erofs.rst
> @@ -154,7 +154,7 @@ to be as simple as possible::
>    0 +1K
>  
>  All data areas should be aligned with the block size, but metadata areas
> -may not. All metadatas can be now observed in two different spaces (views):
> +may not. All metadata can be now observed in two different spaces (views):
>  
>   1. Inode metadata space
>  
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index abce88f15..7067ec3f0 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -216,7 +216,7 @@ applicable everywhere (see syntax).
>  
>  - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
>  
> -  This allows to limit the range of possible input values for int
> +  This allows limiting the range of possible input values for int
>    and hex symbols. The user can only input a value which is larger than
>    or equal to the first symbol and smaller than or equal to the second
>    symbol.
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index 62951cdb1..0cf97dbab 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -218,7 +218,7 @@ DevFS has been obsoleted in favour of udev
>  Linux documentation for functions is transitioning to inline
>  documentation via specially-formatted comments near their
>  definitions in the source.  These comments can be combined with ReST
> -files the Documentation/ directory to make enriched documentation, which can
> +files in the Documentation/ directory to make enriched documentation, which can
>  then be converted to PostScript, HTML, LaTex, ePUB and PDF files.
>  In order to convert from ReST format to a format of your choice, you'll need
>  Sphinx.
> diff --git a/Documentation/scsi/ChangeLog.sym53c8xx b/Documentation/scsi/ChangeLog.sym53c8xx
> index 3435227a2..6bca91e03 100644
> --- a/Documentation/scsi/ChangeLog.sym53c8xx
> +++ b/Documentation/scsi/ChangeLog.sym53c8xx
> @@ -3,7 +3,7 @@ Sat May 12 12:00 2001 Gerard Roudier (groudier@club-internet.fr)
>  	- Ensure LEDC bit in GPCNTL is cleared when reading the NVRAM.
>  	  Fix sent by Stig Telfer <stig@api-networks.com>.
>  	- Backport from SYM-2 the work-around that allows to support 
> -	  hardwares that fail PCI parity checking.
> +	  hardware that fails PCI parity checking.
>  	- Check that we received at least 8 bytes of INQUIRY response 
>  	  for byte 7, that contains device capabilities, to be valid.
>  	- Define scsi_set_pci_device() as nil for kernel < 2.4.4.
> diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
> index 81b762ef1..99ffda355 100644
> --- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
> +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
> @@ -444,7 +444,7 @@ Description
>  ~~~~~~~~~~~
>  
>  A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
> -following bits set according to the hardwares capabilities.
> +following bits set according to the hardware's capabilities.
>  
>  
>  -----

-- 
~Randy

