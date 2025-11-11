Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEBB33F8D2
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 03:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762831710; cv=none; b=uVqY1wUA1jjeBVD0sMYto6hbHezyA0w2GOTAAfzOcub58UnG7/9WxiHHqdRDUMhRe+f8dn30/3yk330coPUWcSqgeIhJO40lyvsgHxpszWFcfeK+XUDe4q7V+FFwlLpl7ZlYQLARqwKW42WxG/ig7/AP8IwW1rq7eHIwW91mp7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762831710; c=relaxed/simple;
	bh=O5P21HYEMt1FLKMvaeJi1khRf2XtmoeOLz6ch+k7Wvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLMuFhsqr+3DmmxbcJzrHbY6RLfZIhZku9qUs+5rbxPPlMejI1Duziwx6OIew9yxqBYH3O1VCn9o+B+wHGvD7F3oHOAHHsGJa5sUrBSDEI7t4AEPhzLPVLIVIKN890ALVhIxT1+8HpRl/cVeQj6hgmWa/EeFYCMqWPCjTToeIv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/AKBxXJ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/AKBxXJ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso2088204a12.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 19:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762831708; x=1763436508; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YC2Dx9iOrDi6+zQwMWroDp4lgkRo3PWjkQHuKtphfrc=;
        b=I/AKBxXJw8pvRlFAgFzdHQ4S3cS0gAiBk3wDJqin5iFIHur64PfFUhLlRYGTAN0HI0
         DUOBYol5ymXMtjQb+QKcvIBPzpbhz4dA1iOFdt+4lPFByyV6rAYgJ0+HYulqSq+7zHnE
         VJH5rUzOHo2JEs66J2YhJlpTJ/Nhi5Dzbe8cQZLm8auwYzDFy3I7lwQM5p+y6EA3HJBm
         7IrsL6QmYJbMjxS4XLJca5DpmQRYhXOOjeqVWGj9wQ+DMBLpl0xUaXnpWSPnH+ImETdl
         ZCvrXTZ+3ye+vVeYfSYbI0KxCobgO7BO1rDNiIqN7QNWxz0i7olZP6kYB/cFPtAcn8D8
         jKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762831708; x=1763436508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YC2Dx9iOrDi6+zQwMWroDp4lgkRo3PWjkQHuKtphfrc=;
        b=SO+fWh6upjQNIAQSIKcRXpl434mRCehcwGaZtk5NYCeIBPu2K19GANH+vH4YTglfw3
         pq2GCjmv4eWdMKLprFdhZKfZOlp3sJzE50qZgynbQtq/Y57UqsqrSqWD4N1JrdlS/wsw
         ji1avnmgTB3/rFCz19qu1eBYkeglQw//gIcALnZ/0WSySuyN0DzlBZDH5NfdBgmn2l/G
         PZXKOq9WLhCZ5t17wltR+APIW7LXSHF2rQ3AFehMLSSmJ0pX2uThwnI+ctyesuzKpbhq
         4LUjT6SFCzV5zgzhKoDeWy2DRSV4Dbu6Wb+4EoVSVOPeIGiam2sj9eZPYzDZlK+ZaQN5
         YW+g==
X-Forwarded-Encrypted: i=1; AJvYcCX6ouqXefS5O6Pm3pjUpAG9taSW3NigxYdZpz6UUnIt9t1cQOKWmnAUoBnmfFt13/mnUvLyFkEyZwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhlxw9C9TrOM1ARq+zmGDQjZbvamnZIyX0gQ0pxvgJJzXupNnT
	rFcBTH+a3V3/WZ5/pCSFU5yVGjraBNVWMe1lT28VnByWe00bhJic+4Ch
X-Gm-Gg: ASbGncsteJgzSuzZGbmSiOukumkDH25pWc9r73rhGCCc8cp9eMikemNPmkyXvZCvh9x
	HcpEi5ct5taKORtIqPS57EpaOyl9LboLAYOROBTybKJuh8vDqG1JBt5zzBDj2sOORAxoteuy/lp
	1Gc0zY4wNt2yw8S+ePEwfIFAApaLwtWLsCzqtOkN5EWupRzx4UQ2LehcYmCcXY9EDVAI+LyG2Vu
	P5k+FWdjb+bKteiy3Uh+2KJlcXBvR25LRBrWw2zYWk2gIqKN874JR+ng2Pd3bgur0bKXYKpWOyk
	EAqOwQFQnLpNXJHPlrZk90MXjSm1RM/Da5JcsiEQuXfbKeW6+2oLau/0FV2hSoI9pc/Hi20RhBg
	5gN/fWZGJYLUc5z8xJQD18/ltZ4SLhR9NR9OCSCX7Gw0SP2/szhmdg3TJMDu/1+O/oApN+5aD8A
	mL1x3NFmUNMS4G9a3XvCMM209trEt9MhFE6royptorFAhwYbmnihd9nEQX
X-Google-Smtp-Source: AGHT+IEsqSgvnp4g7IL4+htc9J2RSl9i6k2BLfkSYr1KEs4TwmlJTB5tNVwK9T1T1vD82tjFfhEQNw==
X-Received: by 2002:a17:902:ec90:b0:295:560a:e474 with SMTP id d9443c01a7336-297e56c9f49mr144165115ad.32.1762831707718;
        Mon, 10 Nov 2025 19:28:27 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca4262sm164545005ad.86.2025.11.10.19.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 19:28:27 -0800 (PST)
Message-ID: <1c742563-5408-4fe1-b122-8a7a14cf737f@gmail.com>
Date: Tue, 11 Nov 2025 12:28:24 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: f2fs: wrap tables in literal code
 blocks
To: Masaharu Noguchi <nogunix@gmail.com>, jaegeuk@kernel.org, chao@kernel.org
Cc: corbet@lwn.net, linux-f2fs-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251109095416.2428351-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251109095416.2428351-1-nogunix@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi again,

On Sun,  9 Nov 2025 18:54:16 +0900, Masaharu Noguchi wrote:
> Sphinx LaTeX builder fails with the following error when it tries to
> turn the ASCII tables in f2fs.rst into nested longtables:
> 
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
> 
> Wrap the tables in literal code blocks so that Sphinx renders them as
> verbatim text instead. This prevents the LaTeX builder from attempting
> unsupported table nesting and fixes the pdfdocs build.
> 
> Akira Yokosawa pointed out that the in-development Sphinx 8.3 latex
> builder already handles these nested tables. I still want to fix the
> current documentation because Sphinx 8.3 is not released yet, and the
> LaTeX build on the stable 8.2.x series (which also requires
> "docutils<0.22" for now) remains broken without this change.
> 
> Link: https://lore.kernel.org/lkml/20251011172415.114599-1-nogunix@gmail.com/
> Changes in v2:
>  - wrap the compression level table in a literal block and add the
>    missing blank lines so docutils no longer warns about malformed
>    tables
>  - consistently use ``.. code-block:: none`` for the other ASCII tables
>    that previously triggered the LaTeX error
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
>  1 file changed, 61 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index a8d02fe5be83..07b8e752476d 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -188,34 +188,36 @@ fault_type=%d		 Support configuring fault injection type, should be
>  			 enabled with fault_injection option, fault type value
>  			 is shown below, it supports single or combined type.
>  
> -			 ===========================      ==========
> -			 Type_Name                        Type_Value
> -			 ===========================      ==========
> -			 FAULT_KMALLOC                    0x00000001
> -			 FAULT_KVMALLOC                   0x00000002
> -			 FAULT_PAGE_ALLOC                 0x00000004
> -			 FAULT_PAGE_GET                   0x00000008
> -			 FAULT_ALLOC_BIO                  0x00000010 (obsolete)
> -			 FAULT_ALLOC_NID                  0x00000020
> -			 FAULT_ORPHAN                     0x00000040
> -			 FAULT_BLOCK                      0x00000080
> -			 FAULT_DIR_DEPTH                  0x00000100
> -			 FAULT_EVICT_INODE                0x00000200
> -			 FAULT_TRUNCATE                   0x00000400
> -			 FAULT_READ_IO                    0x00000800
> -			 FAULT_CHECKPOINT                 0x00001000
> -			 FAULT_DISCARD                    0x00002000
> -			 FAULT_WRITE_IO                   0x00004000
> -			 FAULT_SLAB_ALLOC                 0x00008000
> -			 FAULT_DQUOT_INIT                 0x00010000
> -			 FAULT_LOCK_OP                    0x00020000
> -			 FAULT_BLKADDR_VALIDITY           0x00040000
> -			 FAULT_BLKADDR_CONSISTENCE        0x00080000
> -			 FAULT_NO_SEGMENT                 0x00100000
> -			 FAULT_INCONSISTENT_FOOTER        0x00200000
> -			 FAULT_TIMEOUT                    0x00400000 (1000ms)
> -			 FAULT_VMALLOC                    0x00800000
> -			 ===========================      ==========
> +			 .. code-block:: none
> +
> +			     ===========================      ==========
> +			     Type_Name                        Type_Value
> +			     ===========================      ==========
> +			     FAULT_KMALLOC                    0x00000001
> +			     FAULT_KVMALLOC                   0x00000002
> +			     FAULT_PAGE_ALLOC                 0x00000004
> +			     FAULT_PAGE_GET                   0x00000008
> +			     FAULT_ALLOC_BIO                  0x00000010 (obsolete)
> +			     FAULT_ALLOC_NID                  0x00000020
> +			     FAULT_ORPHAN                     0x00000040
> +			     FAULT_BLOCK                      0x00000080
> +			     FAULT_DIR_DEPTH                  0x00000100
> +			     FAULT_EVICT_INODE                0x00000200
> +			     FAULT_TRUNCATE                   0x00000400
> +			     FAULT_READ_IO                    0x00000800
> +			     FAULT_CHECKPOINT                 0x00001000
> +			     FAULT_DISCARD                    0x00002000
> +			     FAULT_WRITE_IO                   0x00004000
> +			     FAULT_SLAB_ALLOC                 0x00008000
> +			     FAULT_DQUOT_INIT                 0x00010000
> +			     FAULT_LOCK_OP                    0x00020000
> +			     FAULT_BLKADDR_VALIDITY           0x00040000
> +			     FAULT_BLKADDR_CONSISTENCE        0x00080000
> +			     FAULT_NO_SEGMENT                 0x00100000
> +			     FAULT_INCONSISTENT_FOOTER        0x00200000
> +			     FAULT_TIMEOUT                    0x00400000 (1000ms)
> +			     FAULT_VMALLOC                    0x00800000
> +			     ===========================      ==========
>  mode=%s			 Control block allocation mode which supports "adaptive"
>  			 and "lfs". In "lfs" mode, there should be no random
>  			 writes towards main area.
> @@ -296,14 +298,15 @@ nocheckpoint_merge	 Disable checkpoint merge feature.
>  compress_algorithm=%s	 Control compress algorithm, currently f2fs supports "lzo",
>  			 "lz4", "zstd" and "lzo-rle" algorithm.
>  compress_algorithm=%s:%d Control compress algorithm and its compress level, now, only
> -			 "lz4" and "zstd" support compress level config.
> -
> -                         =========      ===========
> -			 algorithm	level range
> -                         =========      ===========
> -			 lz4		3 - 16
> -			 zstd		1 - 22
> -                         =========      ===========
> +			 "lz4" and "zstd" support compress level config::
> +
> +				 =========      ===========
> +				 algorithm	level range
> +				 =========      ===========
> +				 lz4		3 - 16
> +				 zstd		1 - 22
> +				 =========      ===========
> +
>  compress_log_size=%u	 Support configuring compress cluster size. The size will
>  			 be 4KB * (1 << %u). The default and minimum sizes are 16KB.
>  compress_extension=%s	 Support adding specified extension, so that f2fs can enable
> @@ -368,38 +371,42 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
>  			 the partition in read-only mode. By default it uses "continue"
>  			 mode.
>  
> -			 ====================== =============== =============== ========
> -			 mode			continue	remount-ro	panic
> -			 ====================== =============== =============== ========
> -			 access ops		normal		normal		N/A
> -			 syscall errors		-EIO		-EROFS		N/A
> -			 mount option		rw		ro		N/A
> -			 pending dir write	keep		keep		N/A
> -			 pending non-dir write	drop		keep		N/A
> -			 pending node write	drop		keep		N/A
> -			 pending meta write	keep		keep		N/A
> -			 ====================== =============== =============== ========
> +			 .. code-block:: none
> +
> +			     ====================== =============== =============== ========
> +			     mode			continue	remount-ro	panic
> +			     ====================== =============== =============== ========
> +			     access ops		normal		normal		N/A
> +			     syscall errors		-EIO		-EROFS		N/A
> +			     mount option		rw		ro		N/A
> +			     pending dir write	keep		keep		N/A
> +			     pending non-dir write	drop		keep		N/A
> +			     pending node write	drop		keep		N/A
> +			     pending meta write	keep		keep		N/A
> +			     ====================== =============== =============== ========
>  nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
>  			 by default it's disabled.
>  lookup_mode=%s		 Control the directory lookup behavior for casefolded
>  			 directories. This option has no effect on directories
>  			 that do not have the casefold feature enabled.
>  
> -			 ================== ========================================
> -			 Value		    Description
> -			 ================== ========================================
> -			 perf		    (Default) Enforces a hash-only lookup.
> +			 .. code-block:: none
> +
> +			     ================== ========================================
> +			     Value		    Description
> +			     ================== ========================================
> +			     perf		    (Default) Enforces a hash-only lookup.
>  					    The linear search fallback is always
>  					    disabled, ignoring the on-disk flag.
> -			 compat		    Enables the linear search fallback for
> +			     compat		    Enables the linear search fallback for
>  					    compatibility with directory entries
>  					    created by older kernel that used a
>  					    different case-folding algorithm.
>  					    This mode ignores the on-disk flag.
> -			 auto		    F2FS determines the mode based on the
> +			     auto		    F2FS determines the mode based on the
>  					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
>  					    flag.
> -			 ================== ========================================
> +			     ================== ========================================
>  ======================== ============================================================
>  
>  Debugfs Entries

My R-b tag was sent without inspecting the source .rst after the change.

Using TABs inside ASCII tables degrades their readability.

Masaharu, can you consider applying follow-up change below, which replaces
TABs with white spaces except for the leading ones, and submit a v3?

Thanks, Akira

---------8<---------8<---------8<---------8<---------8<---------8<---------8<-------
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 07b8e752476d..fbe9f8d35366 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -374,15 +374,15 @@ errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
 			 .. code-block:: none
 
 			     ====================== =============== =============== ========
-			     mode			continue	remount-ro	panic
+			     mode                   continue        remount-ro      panic
 			     ====================== =============== =============== ========
-			     access ops		normal		normal		N/A
-			     syscall errors		-EIO		-EROFS		N/A
-			     mount option		rw		ro		N/A
-			     pending dir write	keep		keep		N/A
-			     pending non-dir write	drop		keep		N/A
-			     pending node write	drop		keep		N/A
-			     pending meta write	keep		keep		N/A
+			     access ops             normal          normal          N/A
+			     syscall errors         -EIO            -EROFS          N/A
+			     mount option           rw              ro              N/A
+			     pending dir write      keep            keep            N/A
+			     pending non-dir write  drop            keep            N/A
+			     pending node write     drop            keep            N/A
+			     pending meta write     keep            keep            N/A
 			     ====================== =============== =============== ========
 nat_bits		 Enable nat_bits feature to enhance full/empty nat blocks access,
 			 by default it's disabled.
@@ -393,19 +393,19 @@ lookup_mode=%s		 Control the directory lookup behavior for casefolded
 			 .. code-block:: none
 
 			     ================== ========================================
-			     Value		    Description
+			     Value              Description
 			     ================== ========================================
-			     perf		    (Default) Enforces a hash-only lookup.
-					    The linear search fallback is always
-					    disabled, ignoring the on-disk flag.
-			     compat		    Enables the linear search fallback for
-					    compatibility with directory entries
-					    created by older kernel that used a
-					    different case-folding algorithm.
-					    This mode ignores the on-disk flag.
-			     auto		    F2FS determines the mode based on the
-					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
-					    flag.
+			     perf               (Default) Enforces a hash-only lookup.
+			                        The linear search fallback is always
+			                        disabled, ignoring the on-disk flag.
+			     compat             Enables the linear search fallback for
+			                        compatibility with directory entries
+			                        created by older kernel that used a
+			                        different case-folding algorithm.
+			                        This mode ignores the on-disk flag.
+			     auto               F2FS determines the mode based on the
+			                        on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
+			                        flag.
 			     ================== ========================================
 ======================== ============================================================
 
