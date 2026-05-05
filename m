Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF665224AF1
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 03:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952613; cv=none; b=JgyoB7V2CmL8qUe9gpWHxCehVmWQYooi4soj2kt6XpMEqU33JvPqeh4XqGIoh08baY1Y/RypycXavvbjMhNnJxy2Dth5RTi1Toj/2RKjwwlmVh2NeGMbUFCDSjGMl7u2XdkaM1sh2d9KyxINacNSk62BwxyPRvtytHwieZx3pCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952613; c=relaxed/simple;
	bh=U4fhBXiLkbKfNdNr7++zMbEXFXvXPmNG+n6rkkwy1hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCdkSKfu90FPAsAo0G9BeRZW/hY6KQJOS4KNSUXxZrI1qLhrXHn/zO4Jy3HZQNpUWLR1wqllvy0XJtFwabMgvwFKe8Pn9+H8Uw1LDFOxzeNwN0xyPW6xKdWATMBhsnlIVabERNtXwpmaMTjBwmq5ZoBcQihDEzTfhKEuf5EDxaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UtJqEA0O; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UtJqEA0O"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2+cPNe5IyWGqRbcAZylIn4/YmQRHyGYaY9ohg/eFPnQ=; b=UtJqEA0OutBQqoQv44gC8oB4mr
	sHdTmL5dRBwiqIggGmquIlOFuyqQ99IPDvFBgmYoqzvhGjFTF25ne1WK8/9ohMmZ2u5QsFGTHReD7
	hikgoIvT1pIFP8rjxCdMeq+JKWnb5XIRPqUChX33btZhR6h4QzGr7JKzNCg5IzRzPXQX8mzhIixkr
	lpzCLMxpvftcCFli5PXRf8cP5TfhxUI3OvdUkG9KtxKEYIrrauEjGGzfFn4cIFvDJFLt7BYk96oif
	sOr3/CYb2B4CGRcLE7Bjjn0OSXnGLOMGwLnMIIL1sU3snsUF+abUVgpuGhlqyP3rgBNpiKMyRgMH+
	k7C1zvQQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK6gy-0000000F1mW-4BmX;
	Tue, 05 May 2026 03:43:29 +0000
Message-ID: <1af7ec90-5294-48bd-9f05-a3eb77ae7cf2@infradead.org>
Date: Mon, 4 May 2026 20:43:28 -0700
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

Somehow the line above merged changes for ext4/super.rst into the
comment for intel_dptf.rst.

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

-- 
~Randy

