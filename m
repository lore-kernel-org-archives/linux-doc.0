Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F025392C28
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 03:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952903; cv=none; b=aCrfsFGfdHyngg5YexWQNuninxwE2RMkpQON/sZdKgF2uJpGuJZL7T/qyB4dRUO8ccsfbILB9lLaI52+Drqr9yllaVCwHVleLXIJ5fUj3mBBBZrBlSmQ6qH92MytG1C8k0Q7LZNZ8VZyyAPDNOOSZKE0vVO/Vr0M69LT6M5b/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952903; c=relaxed/simple;
	bh=I/nHOEyFQxADF9HsoHDE2RKF3EfG9t2w7h7CIQdXfgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNSC3zPdL4qPMcLIyHV4BtSYGlQ4eIzQO63OAewNOYS5Cln0ZNTGEEihQhyxRgC+rtmLZmcJogNVOsRW37w2YO71epj74KrAYZY2ELhBHa/ehSZjYTPwzADACcXMkISXmMHiIlwwbXzQRkIlLrczq8ivLpd1SbvblvUrf+t7jAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FhmwLHZd; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FhmwLHZd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=jx8VtcuKGZNZBB2WX7edn12Q9Vxzy9GU53xPOo73zMI=; b=FhmwLHZd2YiB+z6oz/kdV+0q3V
	8uqy36dVA8r1G7QbLtGQsVgUdbkJjR0uAzW/bjLb065liZWqL8vYAs2qdZ4LgooSgP+0p5qT5K+u6
	uK4A5yhvZQEjEOocFOPscCx7FR0i+MTvy3dkHMz3l56V8GbXZAcuMiIreyrfB0yB/FjFOI7jLSa0I
	d1f54/8QMJ2IDJPDMBbpa9P6wlDjvmyOsqs61kYJ/GWbos/BFsxwoJZD6K1aLmNL6AvburKTG25n/
	7EKrlTsQoan2uxwf7W6LxyYOhiVCf+5CwDUfsCKQB91n5+FqoOFq84YEs8mDfXazT/Ehe5yQtaH5m
	9m9vyMqA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6lh-0000000F378-0mEX;
	Tue, 05 May 2026 03:48:21 +0000
Message-ID: <6df94757-0a89-41f2-ac22-18efc28255d8@infradead.org>
Date: Mon, 4 May 2026 20:48:20 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fix broken links in bpf, driver_api & filesystem
 documentation
To: Jeremy Bobbin <jer@jer.cx>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org
References: <20260505014839.2670290-1-jer@jer.cx>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260505014839.2670290-1-jer@jer.cx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/4/26 6:48 PM, Jeremy Bobbin wrote:
> bpf/linux-notes.rst: broken link to ISA standard documentation
> driver-api/thermal/intel_dptf.rst: two broken links to filesystem quota
> 
> Signed-off-by: Jeremy Bobbin <jer@jer.cx>
> ---
>  Documentation/bpf/linux-notes.rst               | 2 +-
>  Documentation/driver-api/thermal/intel_dptf.rst | 2 +-
>  Documentation/filesystems/ext4/super.rst        | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/bpf/linux-notes.rst b/Documentation/bpf/linux-notes.rst
> index 00d2693de025..9c7b703ae4e5 100644
> --- a/Documentation/bpf/linux-notes.rst
> +++ b/Documentation/bpf/linux-notes.rst
> @@ -46,7 +46,7 @@ Legacy BPF Packet access instructions
>  =====================================
>  
>  As mentioned in the `ISA standard documentation
> -<instruction-set.html#legacy-bpf-packet-access-instructions>`_,
> +<standardization/instruction-set.html#legacy-bpf-packet-access-instructions>`_,
>  Linux has special eBPF instructions for access to packet data that have been
>  carried over from classic BPF to retain the performance of legacy socket
>  filters running in the eBPF interpreter.
> diff --git a/Documentation/driver-api/thermal/intel_dptf.rst b/Documentation/driver-api/thermal/intel_dptf.rst
> index 4adfa1eb74db..1a4d7eedbb68 100644
> --- a/Documentation/driver-api/thermal/intel_dptf.rst
> +++ b/Documentation/driver-api/thermal/intel_dptf.rst
> @@ -81,7 +81,7 @@ DPTF ACPI Drivers interface
>  
>  ``data_vault`` (RO)
>  	Binary thermal table. Refer to
> -	https:/github.com/intel/thermal_daemon for decoding
> +	https://github.com/intel/thermal_daemon for decoding
>  	thermal table.
>  
>  ``production_mode`` (RO)
> diff --git a/Documentation/filesystems/ext4/super.rst b/Documentation/filesystems/ext4/super.rst
> index 9a59cded9bd7..d06e4ae96d16 100644
> --- a/Documentation/filesystems/ext4/super.rst
> +++ b/Documentation/filesystems/ext4/super.rst
> @@ -408,11 +408,11 @@ The ext4 superblock is laid out as follows in
>     * - 0x240
>       - __le32
>       - s_usr_quota_inum
> -     - Inode number of user `quota <quota>`__ file.
> +     - Inode number of user `quota </filesystems/quota.html>`__ file.
>     * - 0x244
>       - __le32
>       - s_grp_quota_inum
> -     - Inode number of group `quota <quota>`__ file.
> +     - Inode number of group `quota </filesystems/quota.html>`__ file.
>     * - 0x248
>       - __le32
>       - s_overhead_blocks
> @@ -712,7 +712,7 @@ the following:
>     * - 0x80
>       - This filesystem has a snapshot (RO_COMPAT_HAS_SNAPSHOT).
>     * - 0x100
> -     - `Quota <Quota>`__ (RO_COMPAT_QUOTA).
> +     - `Quota </filesystems/quota.html>`__ (RO_COMPAT_QUOTA).
>     * - 0x200
>       - This filesystem supports “bigalloc”, which means that file extents are
>         tracked in units of clusters (of blocks) instead of blocks

These ext4 link changes don't work for me (file not found).

-- 
~Randy

