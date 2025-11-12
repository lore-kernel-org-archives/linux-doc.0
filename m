Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0212135CBA1
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 02:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762912934; cv=none; b=ESsLHWKW2Lq0YEgrnQ2ek4aPJSyin6mh+XcBxMYY3i1pftHtP48Fpj/Ltgigzm9jmfFZX5oAJD9oMXzBPNHMh2zEQo+StJp1N0mKSk/TV8Y++pdKJBYJohIwSZ8/YxlSWlE7EXLhrhp7eyRs24N+x2DMcbyqrqbiPvHxzPNYqXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762912934; c=relaxed/simple;
	bh=iTsN5W7L+qGsA9mkiCcgOujlA6EbLz0J7TwwehwVacM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTAazjPm1LVbBvLrIwfad5br0wZtWFrnpBtZsyNNm9BmKmACfEivWZXoCrQjD31NcWb26Rmv64boYUi/pAvHNS6om2Q5mviEw6fngdy80Vh6IIirJ8TDfCKpFMNhGS5zlCKSRPRkx6GKA4iZ4OD7P197eVJOQ2dJ9VLb9mrcyQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1hf7BSD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1hf7BSD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so246144a91.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 18:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762912932; x=1763517732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B8xle/FWhtYNpdeqegHIRjlgrcMpG9jEbxd/fUEPpaQ=;
        b=J1hf7BSDreaxkC6ubyLpCYjUuuUV/Ab1EBEWIcij/vKlUSGKbzjmAYJ8A9LodZyiST
         MHvC22nr3vozm+dqRT4LYiz26pIiHIw6efWqtBn7DamG1TUM8nROYiEzyP76911zE9jT
         fD828pwNnjZw4ryzerhj+5ZBMEoPpQCTkrb1RcjTB8xqC9Ovi/j0/Z2XhKS3vGgQeKBv
         RCjyhHBL1yY1X+qLvOoqaomEOhnLnLoFgswJA7/iyJpocCZCBOM5uwt/bbLQcJL7gQxi
         bhDzmj2R6UD4wbPeGCe0No1yih0QkHsxdeGpRBuWW9ylTrCdl/K0HkSVAUIdnpXM9rkr
         34MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762912932; x=1763517732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8xle/FWhtYNpdeqegHIRjlgrcMpG9jEbxd/fUEPpaQ=;
        b=rWA/Ueb/SMJswFeL2uHqxpJrGKLTtKjFAMLwaPAHPorWh9BdqTGz8xsTDyE1RNqKxU
         gZWxsfITnP1X1zryz79HvFZoLY+3qUd9HIcrZgUyNLTcWitYSCpKFJE5uf7nqNBFvVr4
         E+xFHLFQHYNhzh0CU+lFw1o7lBydSKq0OgEkEf4385iJePUYdts6mnRkG2QsTAUdH5Fx
         bgF5F5OkzRHQIr8uMpPE02LzZqj9agElmRGfWHVAf2ZjreFbEFOWHMvzJTsxAnHnBr/W
         Gc4rdqeRDIK32qwTL+5pPgpLNNT1ZMBjMOI4VvA5Sebh1hy4BAcOW1I7ScpjQ6LrKE0z
         PPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0GTwL1zjD9srGJuh9G8jjIUfH2YQ2cI7n89TyPT2mvtCmHm4MZ2su0s/S0fNYtg46NpTFx0NPrSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8ZLiRN8z8YZF8zF/CWSzUwHyXSxBSjRclG8oXhgN00PxUELR
	sKL2hT8WTj4UuE346/bTjx15em1O3OMvkJ7bK0KAFi0KyK7/9RbeVieY
X-Gm-Gg: ASbGncvZrk4cb4hBE6p7+ckMILqcEgyI1tqM4ai8zyGj1okUBvJIkiOKu7tgkvnfqom
	QN6/rEPeb5o7DXH/3EA0kUrHMWKtOY8vSRK7xIqDJWjSqxejvuArwlq5RFRwCJ5hORTvNNlZU/d
	AxS0mugNLbpU5+qmApLqL9NNdSH9WVvy9mGsGEU58N4YzFPQ2hkR3gB2vSYBUIbM2BKJYwMohrU
	1kVipjQ3vl/79x+O1kbikVchJZwNQtljHfzolBd2m7dmvg9wehp66+HtGKd+ASEXlUak61pOJZ8
	W7/0nJj0fxKIcap5lLEmbH5FYzN4z2/BhcaPanCf/KDJeyUaUqDKtmNpqUjmBX9sqFxE9kbm61S
	Nuvdj+dvtWrey1RRZvddstAg0FnXtGon76elzvuh6btdKZrinsV+bJmUQPMTx1LFtnOckFhgcBT
	WLEkHKgSOsYpBUiX7QKZ766BDvsamC3faHzrGeKkwDtiG3kg==
X-Google-Smtp-Source: AGHT+IF1ePnlT803zhN9t6LCfFB14lxs5sloRSlAbLMSA9+Xfr0NjLTehBWwSN3ANdNbuGK2KXbu5g==
X-Received: by 2002:a17:90b:4a4b:b0:341:8c8e:38b5 with SMTP id 98e67ed59e1d1-343ddea7bdcmr1291309a91.25.1762912931983;
        Tue, 11 Nov 2025 18:02:11 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e0794e56sm522225a91.10.2025.11.11.18.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 18:02:11 -0800 (PST)
Message-ID: <6dfd1276-a30f-4ba0-b2bf-c295d88141b6@gmail.com>
Date: Wed, 12 Nov 2025 11:02:08 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: f2fs: wrap tables in literal code
 blocks
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: corbet@lwn.net, linux-f2fs-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bagasdotme@gmail.com, jaegeuk@kernel.org, chao@kernel.org
References: <20251111130349.3856302-1-nogunix@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20251111130349.3856302-1-nogunix@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 11 Nov 2025 22:00:39 +0900, Masaharu Noguchi wrote:
> Hi Akira and Bagas,
> 
> As suggested, I replaced TABs inside the ASCII tables with white spaces
> for better readability. No other content changes were made.
> 
> Thanks for your reviews and acks.
> 
> Best regards,
> Masaharu Noguchi
> 
> ---

Grumble ...
The above will be the Changelog of this patch.
I don't think that is what you'd like to see.

> Sphinx LaTeX builder fails with the following error when it tries to
> turn the ASCII tables in f2fs.rst into nested longtables:
> 
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
> 
> Wrap the tables in literal code blocks so that Sphinx renders them as
> verbatim text instead. This prevents the LaTeX builder from attempting
> unsupported table nesting and fixes the pdfdocs build.

Probably, Changelog should end here.

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
> Changes in v3:
>  - Replace TABs inside ASCII tables with white spaces for readability
>  - Keep Reviewed-by and Acked-by tags as the technical content remains unchanged

These background and change history should go out of the Changelog area. 

Please have a look at Documentation/process/submitting-patches.rst,
especially the section "The canonical patch format".

> 
> Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---
>  Documentation/filesystems/f2fs.rst | 115 +++++++++++++++--------------
>  1 file changed, 61 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index a8d02fe5be83..1de0bc83d76e 100644

Well, the hash after this change (1de0bc83d76e) does not match the
one in the diff I suggested (fbe9f8d35366).  Did you make the change
by hand?

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
> +				 algorithm      level range
> +				 =========      ===========
> +				 lz4            3 - 16
> +				 zstd           1 - 22
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
> +			     mode              continue        remount-ro      panic
> +			     ====================== =============== =============== ========
> +			     access ops        normal          normal          N/A
> +			     syscall errors    -EIO            -EROFS          N/A
> +			     mount option      rw              ro              N/A
> +			     pending dir write keep            keep            N/A
> +			     pending non-dir write drop        keep            N/A
> +			     pending node write drop           keep            N/A
> +			     pending meta write keep           keep            N/A
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
> +			     Value            Description
> +			     ================== ========================================
> +			     perf            (Default) Enforces a hash-only lookup.
>  					    The linear search fallback is always
>  					    disabled, ignoring the on-disk flag.
> -			 compat		    Enables the linear search fallback for
> +			     compat          Enables the linear search fallback for
>  					    compatibility with directory entries
>  					    created by older kernel that used a
>  					    different case-folding algorithm.
>  					    This mode ignores the on-disk flag.
> -			 auto		    F2FS determines the mode based on the
> +			     auto            F2FS determines the mode based on the
>  					    on-disk `SB_ENC_NO_COMPAT_FALLBACK_FL`
>  					    flag.
> -			 ================== ========================================
> +			     ================== ========================================

Umm, this doesn't look right.  Just build htmldocs and have a look at
how these nested literal tables are rendered.
Sphinx doesn't complain about misaligned cells in literal blocks.

Thanks, Akira


>  ======================== ============================================================
>  
>  Debugfs Entries

